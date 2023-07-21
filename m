Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968E7F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 03:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689909571; x=1721445571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxxvJOe9yaxa2zrboanxbcpWGo13AKQJ+2GY6hrxNE0=;
  b=a9qiDE1fOcQXs67Of//TFiiYF8U0H2chMTb3qIpSsC0L2fly0veVRCRy
   nc8gy0tcdsEhlVzn25ULOhjtWjnScxt/AQHXhHOVixaQj7kKSAM+0Odjq
   +SvKQApOfRO/u7eQZZBSsKxFOTjHOicPfaVgAppCGdWpoyzXb5HqHBvmX
   OVwwpCWo1zn3UhY30IzHCzkyKlbO6P/budrc1bozG7EEPJfXPbTyGeKfJ
   WPhTLGgfyuIJJU4kREiKTZ5ycS25nlcUztOPbhFnjLji1bpWDseF63VtM
   qBedSMB3FMmuGZ5KY5mErH+3aKGg/S6unYJCCZuhK31pvkLaGngGRFEpW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346516067"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="346516067"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 20:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754292588"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="754292588"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Jul 2023 20:19:29 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMgfq-0006oV-31;
	Fri, 21 Jul 2023 03:19:25 +0000
Date: Fri, 21 Jul 2023 11:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:sb_write_barrier 19/30] include/linux/fsnotify.h:126:3:
 warning: variable 'fsnotify_mask' is uninitialized when used here
Message-ID: <202307211105.zGLTcrGx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux sb_write_barrier
head:   bf9a41c874c7b090a3eb10204ac607fde16fdfb3
commit: 96f25a6844cc4a544a7003caee9e966c6e7f0195 [19/30] fsnotify: introduce pre-content permission event
config: x86_64-randconfig-r011-20230720 (https://download.01.org/0day-ci/archive/20230721/202307211105.zGLTcrGx-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211105.zGLTcrGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211105.zGLTcrGx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfs/unlink.c:12:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:778:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
               ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/unlink.c:18:
>> include/linux/fsnotify.h:126:3: warning: variable 'fsnotify_mask' is uninitialized when used here [-Wuninitialized]
                   fsnotify_mask |= FS_PRE_MODIFY;
                   ^~~~~~~~~~~~~
   include/linux/fsnotify.h:110:21: note: initialize the variable 'fsnotify_mask' to silence this warning
           __u32 fsnotify_mask;
                              ^
                               = 0
   2 warnings generated.


vim +/fsnotify_mask +126 include/linux/fsnotify.h

   103	
   104	/*
   105	 * fsnotify_file_perm - permission hook before file access/modify
   106	 */
   107	static inline int fsnotify_file_perm(struct file *file, int mask)
   108	{
   109		struct inode *inode = file_inode(file);
   110		__u32 fsnotify_mask;
   111	
   112		/*
   113		 * Content of file may be written on pre-content events, so sb freeze
   114		 * protection must not be held.
   115		 */
   116		lockdep_assert_once(file_write_not_started(file));
   117	
   118		/*
   119		 * Pre-content events are onlt reported for regular files and dirs.
   120		 */
   121		if (mask & MAY_READ) {
   122			fsnotify_mask = FS_ACCESS_PERM;
   123			if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode))
   124				fsnotify_mask |= FS_PRE_ACCESS;
   125		} else if (mask & MAY_WRITE && S_ISREG(inode->i_mode)) {
 > 126			fsnotify_mask |= FS_PRE_MODIFY;
   127		} else {
   128			return 0;
   129		}
   130	
   131		return fsnotify_file(file, fsnotify_mask);
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
