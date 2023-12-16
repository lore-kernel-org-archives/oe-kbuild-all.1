Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F6B19460
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M53Yl1Q2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702731644; x=1734267644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tYAoqxc0J6M2AWzxTgmLk5I3fI+7sVQQsgAUYzVaDkY=;
  b=M53Yl1Q23K8iZHJeFPzm6dMOUDs7nVV+BeaBrgd37k1fMaea1tZoKJ39
   sk2z56v2kSu+k68fo5SmMHg75+tjiLTI8JWOWoqPtzXtma4P4OVawdMxj
   sqVW5Ai5fbMq14p0TkbdSNUqKtsjOTd/8xxeNjsLTGtaiR6pFYbjJeZsp
   9pulGgGBOkX8FAiwsGhYdK2qUJTqW063zWVkx2/kz+Y92h10mG6WqfU7e
   mTGm1rXvj0b7CjWmw1j4NJVcdoEQ4uDWIodVwfIieWLh/q5AjizX/7K/k
   gsGMBOsrgSmCwTcXZqTWhy52Ctd01B/CbCPEBl2SsRpn6lSPskcJyCXKC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="8798534"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="8798534"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 05:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="948261698"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="948261698"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Dec 2023 05:00:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEUHU-0001br-17;
	Sat, 16 Dec 2023 13:00:36 +0000
Date: Sat, 16 Dec 2023 21:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Subject: [brauner-vfs:vfs.netfs 29/64] fs/netfs/fscache_main.c:65:12: error:
 redefinition of 'fscache_init'
Message-ID: <202312162028.1ohsbk1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.netfs
head:   361e796134214b255d35dd801451b40a68c34e11
commit: 131e9eb7bd1fa8b2518efe45c8576c853a444e63 [29/64] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
config: sparc-randconfig-002-20231216 (https://download.01.org/0day-ci/archive/20231216/202312162028.1ohsbk1V-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312162028.1ohsbk1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312162028.1ohsbk1V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/fscache_main.c:65:12: error: redefinition of 'fscache_init'
      65 | int __init fscache_init(void)
         |            ^~~~~~~~~~~~
   In file included from fs/netfs/fscache_main.c:11:
   fs/netfs/internal.h:174:19: note: previous definition of 'fscache_init' with type 'int(void)'
     174 | static inline int fscache_init(void) { return 0; }
         |                   ^~~~~~~~~~~~
>> fs/netfs/fscache_main.c:100:13: error: redefinition of 'fscache_exit'
     100 | void __exit fscache_exit(void)
         |             ^~~~~~~~~~~~
   fs/netfs/internal.h:175:20: note: previous definition of 'fscache_exit' with type 'void(void)'
     175 | static inline void fscache_exit(void) {}
         |                    ^~~~~~~~~~~~


vim +/fscache_init +65 fs/netfs/fscache_main.c

    61	
    62	/*
    63	 * initialise the fs caching module
    64	 */
  > 65	int __init fscache_init(void)
    66	{
    67		int ret = -ENOMEM;
    68	
    69		fscache_wq = alloc_workqueue("fscache", WQ_UNBOUND | WQ_FREEZABLE, 0);
    70		if (!fscache_wq)
    71			goto error_wq;
    72	
    73		ret = fscache_proc_init();
    74		if (ret < 0)
    75			goto error_proc;
    76	
    77		fscache_cookie_jar = kmem_cache_create("fscache_cookie_jar",
    78						       sizeof(struct fscache_cookie),
    79						       0, 0, NULL);
    80		if (!fscache_cookie_jar) {
    81			pr_notice("Failed to allocate a cookie jar\n");
    82			ret = -ENOMEM;
    83			goto error_cookie_jar;
    84		}
    85	
    86		pr_notice("FS-Cache loaded\n");
    87		return 0;
    88	
    89	error_cookie_jar:
    90		fscache_proc_cleanup();
    91	error_proc:
    92		destroy_workqueue(fscache_wq);
    93	error_wq:
    94		return ret;
    95	}
    96	
    97	/*
    98	 * clean up on module removal
    99	 */
 > 100	void __exit fscache_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
