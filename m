Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95EE54FB4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noSkJuoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705056604; x=1736592604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OO13RlnlNVFWozBSKiP4JAz1ngK86Qpmz28Xr1G2WBk=;
  b=noSkJuoINZqxSKlDRv4DOxalDkz9PLpWjOO48NFuskA8iVMp0+mxoXh2
   2IBqEGMsdDz0K02uN3j09Y2wEwa3RFq0tk2lMkDoCzPmN4jvQGh/il0YV
   vNENK4Vzrc9mJxwsmKXx5xGbaG4dKk3Q/emWgVgF+WaMBulzjg6pe2/8Q
   lxdy7HDLdDQTUXqTW0HJxxTgAx2mBgxLa8Z+WJkq2Xp6AAdohosxAIYXQ
   oDhrGQEZIRyOng8iCDqGVNDz/8jKPEKEtXaJekCYdfS1ygNkVVZ6Nipk1
   s4K6zKQtNmJKJvO1R56Lg74EdUKilA9jy1EscuWftjhgIMLKJs/0PQ76n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6511646"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6511646"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 02:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="775977652"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="775977652"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Jan 2024 02:50:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOF6t-0009LE-37;
	Fri, 12 Jan 2024 10:49:59 +0000
Date: Fri, 12 Jan 2024 18:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1840/2356] fs/filescontrol.c:89:5: warning: no
 previous prototype for function 'files_cgroup_count_fds'
Message-ID: <202401121800.zExQoaUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: be6df5f1e6b8fdc2ae0dabda8f84b7fb8bfaedb5 [1840/2356] cgroups: Resource controller for open files
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240112/202401121800.zExQoaUu-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121800.zExQoaUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121800.zExQoaUu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/filescontrol.c:89:5: warning: no previous prototype for function 'files_cgroup_count_fds' [-Wmissing-prototypes]
      89 | u64 files_cgroup_count_fds(struct files_struct *files)
         |     ^
   fs/filescontrol.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | u64 files_cgroup_count_fds(struct files_struct *files)
         | ^
         | static 
   1 warning generated.


vim +/files_cgroup_count_fds +89 fs/filescontrol.c

    88	
  > 89	u64 files_cgroup_count_fds(struct files_struct *files)
    90	{
    91		int i;
    92		struct fdtable *fdt;
    93		int retval = 0;
    94	
    95		fdt = files_fdtable(files);
    96		for (i = 0; i < DIV_ROUND_UP(fdt->max_fds, BITS_PER_LONG); i++)
    97			retval += hweight64((__u64)fdt->open_fds[i]);
    98		return retval;
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
