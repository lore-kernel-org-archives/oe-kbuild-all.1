Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D58839
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 20:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGN5+GJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702153875; x=1733689875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AmLJc2xisSS46qmo2Nw+cDKnxB7gXpUcMeN+hkszSWM=;
  b=NGN5+GJAriL3bMC+dAqO/Y6xbZLkDPT+TYNOFTWc6H9wsx119t14kLGB
   /7z1WnrIblMRtU+kWabix7y6M7otvWEoEQo+w1uHG14NGOpjmdnLFD5Vv
   OsyzYHfljbgkmCcoeA9aO6mz9ocuCNLv4X1b2sNjDJncmI8zmuaYtdH1W
   e4drOM9f3GWsAj2Y1ha3fFfGR9DgMMruhCvuOCkPdAAMeAuyEVara02Qd
   Qy8C4TdD94pS4ECybuNlKul3fPysNgojuOXShvN/8qWXhSsiTA7gR1z9n
   Iyoq42B35djyaMxqI1jqaw5qqHBeNzLpLWm47vPUR9T66guvL5p2vnJ4R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1342516"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1342516"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 12:31:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="838492883"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="838492883"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2023 12:31:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC3yg-000Fup-2T;
	Sat, 09 Dec 2023 20:31:10 +0000
Date: Sun, 10 Dec 2023 04:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Morris <jamorris@linux.microsoft.com>
Subject: security/landlock/syscalls.c:150:1: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202312100424.bPSZJTIw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 265885daf3e5082eb9f6e2a23bdbf9ba4456a21b landlock: Add syscall implementations
date:   2 years, 8 months ago
config: s390-randconfig-r113-20231115 (https://download.01.org/0day-ci/archive/20231210/202312100424.bPSZJTIw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312100424.bPSZJTIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100424.bPSZJTIw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/landlock/syscalls.c:150:1: sparse: sparse: Using plain integer as NULL pointer
>> security/landlock/syscalls.c:150:1: sparse: sparse: Using plain integer as NULL pointer
   security/landlock/syscalls.c:295:1: sparse: sparse: Using plain integer as NULL pointer
   security/landlock/syscalls.c:295:1: sparse: sparse: Using plain integer as NULL pointer

vim +150 security/landlock/syscalls.c

   130	
   131	/**
   132	 * sys_landlock_create_ruleset - Create a new ruleset
   133	 *
   134	 * @attr: Pointer to a &struct landlock_ruleset_attr identifying the scope of
   135	 *        the new ruleset.
   136	 * @size: Size of the pointed &struct landlock_ruleset_attr (needed for
   137	 *        backward and forward compatibility).
   138	 * @flags: Must be 0.
   139	 *
   140	 * This system call enables to create a new Landlock ruleset, and returns the
   141	 * related file descriptor on success.
   142	 *
   143	 * Possible returned errors are:
   144	 *
   145	 * - EOPNOTSUPP: Landlock is supported by the kernel but disabled at boot time;
   146	 * - EINVAL: @flags is not 0, or unknown access, or too small @size;
   147	 * - E2BIG or EFAULT: @attr or @size inconsistencies;
   148	 * - ENOMSG: empty &landlock_ruleset_attr.handled_access_fs.
   149	 */
 > 150	SYSCALL_DEFINE3(landlock_create_ruleset,
   151			const struct landlock_ruleset_attr __user *const, attr,
   152			const size_t, size, const __u32, flags)
   153	{
   154		struct landlock_ruleset_attr ruleset_attr;
   155		struct landlock_ruleset *ruleset;
   156		int err, ruleset_fd;
   157	
   158		/* Build-time checks. */
   159		build_check_abi();
   160	
   161		if (!landlock_initialized)
   162			return -EOPNOTSUPP;
   163	
   164		/* No flag for now. */
   165		if (flags)
   166			return -EINVAL;
   167	
   168		/* Copies raw user space buffer. */
   169		err = copy_min_struct_from_user(&ruleset_attr, sizeof(ruleset_attr),
   170				offsetofend(typeof(ruleset_attr), handled_access_fs),
   171				attr, size);
   172		if (err)
   173			return err;
   174	
   175		/* Checks content (and 32-bits cast). */
   176		if ((ruleset_attr.handled_access_fs | LANDLOCK_MASK_ACCESS_FS) !=
   177				LANDLOCK_MASK_ACCESS_FS)
   178			return -EINVAL;
   179	
   180		/* Checks arguments and transforms to kernel struct. */
   181		ruleset = landlock_create_ruleset(ruleset_attr.handled_access_fs);
   182		if (IS_ERR(ruleset))
   183			return PTR_ERR(ruleset);
   184	
   185		/* Creates anonymous FD referring to the ruleset. */
   186		ruleset_fd = anon_inode_getfd("landlock-ruleset", &ruleset_fops,
   187				ruleset, O_RDWR | O_CLOEXEC);
   188		if (ruleset_fd < 0)
   189			landlock_put_ruleset(ruleset);
   190		return ruleset_fd;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
