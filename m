Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB453F8E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbgjAdc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704881168; x=1736417168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cqX/N7PqedmG9cU0qIX24bVa6pwlIxJ0RzYj4oMGEqY=;
  b=MbgjAdc15/kLKN0Gk0YtbxjdJZaq+0/lyjQ80ZDv3V4hMcl1KF8ry7Bp
   8T5Oe5yBLF1mRvVBfv5gewlyplDBx0Qca4cSZfPWkFGj4PzML9rUnNiMq
   vb21ewV9/DNccn6FOv3xACMWhiGCV+VBfpvDzvMiOrxKMw1zHRYIzrTUV
   3o+oakilTR5YnwWVtOOiN7xnAjRDeUSicBAVxYrjw/X6FQuwLTzXVdyes
   ZlU4ZjmT350tySgttZMgiXWXbp8AKcbXKFOFFCDoK5dm/RMPIEA4LKZDY
   cCeKwE+5pGUu+moG2xMhRx/fryAx4QS29LoLttGYtXo/AYQUOj0Gh6/AK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5244632"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5244632"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 02:06:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1029104095"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="1029104095"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jan 2024 02:06:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNVSv-0006rc-2w;
	Wed, 10 Jan 2024 10:05:55 +0000
Date: Wed, 10 Jan 2024 18:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1779/2321] kernel/livepatch/core.c:2046: warning:
 bad line:
Message-ID: <202401101754.AlnhX6wc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a59ffde9407fbe724d2a9871f618bc1bb631cc53
commit: 29f85d3cff2dfa35ace94d3e4036d5ea456eb859 [1779/2321] livepatch: Add klp_module_delete_safety_check
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240110/202401101754.AlnhX6wc-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101754.AlnhX6wc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101754.AlnhX6wc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:2046: warning: bad line: 


vim +2046 kernel/livepatch/core.c

  2033	
  2034	/**
  2035	 * klp_module_delete_safety_check() - safety check in livepatch scenario when delete a module
  2036	 * @mod:	Module to be deleted
  2037	 *
  2038	 * Module refcnt ensures that there is no rare case between enable_patch and delete_module:
  2039	 * 1. safety_check -> try_enable_patch -> try_release_module_ref:
  2040	 *    try_enable_patch would increase module refcnt, which cause try_release_module_ref fails.
  2041	 * 2. safety_check -> try_release_module_ref -> try_enable_patch:
  2042	 *    after release module ref, try_enable_patch would fail because try_module_get fails.
  2043	 * So the problem that release resources unsafely when enable livepatch after safety_check is
  2044	 * passed during module deletion does not exist, complex synchronization protection is not
  2045	 * required.
> 2046	
  2047	 * Return: 0 on success, otherwise error
  2048	 */
  2049	int klp_module_delete_safety_check(struct module *mod)
  2050	{
  2051		int ret;
  2052	
  2053		if (!mod || !is_livepatch_module(mod))
  2054			return 0;
  2055	
  2056		ret = stop_machine(arch_klp_module_check_calltrace, (void *)mod, NULL);
  2057		if (ret) {
  2058			pr_debug("failed to check klp module calltrace: %d\n", ret);
  2059			return ret;
  2060		}
  2061	
  2062		return 0;
  2063	}
  2064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
