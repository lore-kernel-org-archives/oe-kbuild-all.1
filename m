Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9B21C17B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207655; cv=none; b=roB0MgFy9uNaO4X8l4BcELY9jx4+57tY98qbv6Zq3cjOy0XnJF9JSrg7NAxAjPid1csrqdsx3cxW2AN9kMN3oMpIY7oIvXac9TFWJz8d1HzXeFvpJRy7TBTzv9QHdmuqKwaGTKhU1PtL3fh9WyV4zrOVtJGJG1vBH2Zns//0o54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207655; c=relaxed/simple;
	bh=hCpV8vCiMXLrZU3IOjOAKMA9uM3pTl0fmiM89mBlVo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrQrmMqUgVMhgP3FAdTibc6BeCtlXIvOJU5dp4vOCWDIx/0HrrnYL5woyxpCFE1PKccOWPWYVPygzMQAGVgzu+ayNZkih4mVS7013OUt+T1bDDnRMLp8rpcxqW0katati2ZEV2me1XsjZgo/dFc5mwJBslFyvx6yUJzgg+InsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFM4ByRi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFM4ByRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747207653; x=1778743653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCpV8vCiMXLrZU3IOjOAKMA9uM3pTl0fmiM89mBlVo8=;
  b=nFM4ByRiU8RgWh3y3ntZJKzp9ykBl9I5DblR4fTvNzI96A5lDxYZ6/sO
   Org0mR5XoFkepWme0Y5GDLUnWvP5pooIj/34BJ5H6uTrQdHr6VfTqHgRr
   vZOVcGAlQjtkE3WLTUJ/2VGgUQLToWYoYvcEf0K41W8hqJJBPC9EU70VP
   NCeL754iwGhYPjxMuFP1v2rKxHlZRfbiSMRPX4cDqVZTbwy3ExzZb03Vx
   L62y3gwxatBWt6hws3ZhTBvJUPRWt4WmyCC27ZxPhh6o8vYmZyNhxPzcn
   pmupTbFTlO4CJMmfp0DWwEg2a65n5ZdIvwgvAFTNQi94/6Cjwzt9ypySB
   g==;
X-CSE-ConnectionGUID: XCVtOhu+TUiQ0CD3s7O1sg==
X-CSE-MsgGUID: aFUACBH2Q1Wal2JcsUmqEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66639161"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="66639161"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 00:27:32 -0700
X-CSE-ConnectionGUID: dMAqA5idTnm4Ymhv53MZcw==
X-CSE-MsgGUID: c4z9TBAET6CAP24/WSEPBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138001179"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2025 00:27:31 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF6WX-00017a-0a;
	Wed, 14 May 2025 07:27:29 +0000
Date: Wed, 14 May 2025 15:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] kernel/livepatch/core.c:2046: warning:
 bad line:
Message-ID: <202505141516.wTret3B2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a8743142c88fdbade6ffcd3cf426037633e9e1fc
commit: 29f85d3cff2dfa35ace94d3e4036d5ea456eb859 [2229/2229] livepatch: Add klp_module_delete_safety_check
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250514/202505141516.wTret3B2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.71.1 (eb26296b5 2023-08-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141516.wTret3B2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141516.wTret3B2-lkp@intel.com/

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
