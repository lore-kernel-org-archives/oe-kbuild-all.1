Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8B036D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 03:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206086; cv=none; b=qn1ZNX8wlJq2Zx5jz9qpGsGKFpinOnd0UmBRn+uKepRAGwsiPbdaRmMMzFGnDnAazKCFn1myH3BWqvJmyKtmyoce1lONcKzrM2t8+3eBxtApVdnrkiJ2Cl8RfIv62Ang1lKYtmvTwu/1Y05TwMKqeY42Az6jAoOvTzD+QIagoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206086; c=relaxed/simple;
	bh=YAUu0mt0YhFPFMcrsSvvfniCaODK8uzHp9gprzTNjfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHvR70Y5JJ8+nwTSaVlc9com1srIWL/pPDIwXCchNkqFYSjFZoDwNI/Zmdo4nLyhnjyDOSp1FJPMBynuQTHLDyX/T+jBMv/gcklB8awOOQcJxtZSSzQcH9zSKBzor88IWTuACNOo5UK1x/ygZLaGgyFaAIhQUt+QvybLoO9IWDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEpj4JYb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEpj4JYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745206084; x=1776742084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YAUu0mt0YhFPFMcrsSvvfniCaODK8uzHp9gprzTNjfo=;
  b=jEpj4JYbQBEkNp8WIALGaZJBMRbf9SjYfxbHu0MvJTEe/4M5OtDtAjjo
   O4g9DL6tIm7MTlUgYiI5lPICz7MfKovea1Q5JorZb2Fv7yK52+5JoWoYQ
   w768DaiXXpkh1YRqWmlJXIDDDx8HbgIH6w09/NiwqVwVDxfIULIdVB4Ba
   V+fSIo4XkHFMg87zFSv4MGvhPtTvJ5oIlkX3M1ooODZLQTdkf42KWhSKC
   2nmKegcnNrIJ+Qy0LyI2fhojaa0ShpFCSBWlCmUocsSlxlzv/tNuEOiFF
   hKEl/JgRTS1wBEx67adSzug1bHp3DNH58J+OSd6pgqCtICZzparSYKget
   w==;
X-CSE-ConnectionGUID: 94KS9ByLSj2wrxNinVbvSw==
X-CSE-MsgGUID: odGOMcz8Qpyzo9jOEk5CtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="58103839"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="58103839"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:28:04 -0700
X-CSE-ConnectionGUID: gmbmTp2SRrSGvsb6mm1wDw==
X-CSE-MsgGUID: lPdzv5FsQ3u9C7uRtB1RLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="136700154"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Apr 2025 20:28:02 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6hpA-00005R-03;
	Mon, 21 Apr 2025 03:28:00 +0000
Date: Mon, 21 Apr 2025 11:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/19] famfs_fuse: GET_DAXDEV message and daxdev_table
Message-ID: <202504211138.d1nAFiqR-lkp@intel.com>
References: <20250421013346.32530-15-john@groves.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421013346.32530-15-john@groves.net>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/dev_dax_iomap-Move-dax_pgoff_to_phys-from-device-c-to-bus-c/20250421-094020
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250421013346.32530-15-john%40groves.net
patch subject: [RFC PATCH 14/19] famfs_fuse: GET_DAXDEV message and daxdev_table
config: sh-randconfig-002-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211138.d1nAFiqR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211138.d1nAFiqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211138.d1nAFiqR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22:0,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/fuse/famfs.c:12:
   fs/fuse/famfs.c: In function 'famfs_fuse_get_daxdev':
   fs/fuse/famfs.c:142:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       (u64)fc->dax_devlist, index, (u64)daxdev);
       ^
   include/linux/printk.h:135:18: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
                     ^~~~~~~~~~~
   fs/fuse/famfs.c:141:2: note: in expansion of macro 'pr_debug'
     pr_debug("%s: dax_devlist %llx daxdev[%lld]=%llx\n", __func__,
     ^~~~~~~~
   fs/fuse/famfs.c:142:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       (u64)fc->dax_devlist, index, (u64)daxdev);
                                    ^
   include/linux/printk.h:135:18: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
                     ^~~~~~~~~~~
   fs/fuse/famfs.c:141:2: note: in expansion of macro 'pr_debug'
     pr_debug("%s: dax_devlist %llx daxdev[%lld]=%llx\n", __func__,
     ^~~~~~~~
   fs/fuse/famfs.c:163:17: error: implicit declaration of function 'dax_dev_get'; did you mean 'devres_get'? [-Werror=implicit-function-declaration]
     daxdev->devp = dax_dev_get(daxdev->devno);
                    ^~~~~~~~~~~
                    devres_get
>> fs/fuse/famfs.c:163:15: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     daxdev->devp = dax_dev_get(daxdev->devno);
                  ^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/fuse/famfs.c:12:
   fs/fuse/famfs.c:179:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       __func__, index, daxdev->name, (u64)daxdev);
                                      ^
   include/linux/printk.h:135:18: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
                     ^~~~~~~~~~~
   fs/fuse/famfs.c:178:2: note: in expansion of macro 'pr_debug'
     pr_debug("%s: daxdev(%lld, %s)=%llx opened and marked valid\n",
     ^~~~~~~~
   fs/fuse/famfs.c: In function 'famfs_update_daxdev_table':
   fs/fuse/famfs.c:218:5: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
        (u64)local_devlist);
        ^
   include/linux/printk.h:135:18: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
                     ^~~~~~~~~~~
   fs/fuse/famfs.c:217:3: note: in expansion of macro 'pr_debug'
      pr_debug("%s: allocate dax_devlist=%llx\n", __func__,
      ^~~~~~~~
   fs/fuse/famfs.c:235:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
         __func__, (u64)local_devlist,
                   ^
   include/linux/printk.h:135:18: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
                     ^~~~~~~~~~~
   fs/fuse/famfs.c:234:4: note: in expansion of macro 'pr_debug'
       pr_debug("%s: published new dax_devlist %llx / %llx\n",
       ^~~~~~~~
   fs/fuse/famfs.c:236:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
         (u64)local_devlist->devlist);
         ^
   include/linux/printk.h:135:18: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
                     ^~~~~~~~~~~
   fs/fuse/famfs.c:234:4: note: in expansion of macro 'pr_debug'
       pr_debug("%s: published new dax_devlist %llx / %llx\n",
       ^~~~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/fuse/famfs.c:12:
   fs/fuse/famfs.c:251:8: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
           (u64)(&fc->dax_devlist->devlist[i]));
           ^
   include/linux/printk.h:473:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:564:2: note: in expansion of macro 'printk'
     printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/fuse/famfs.c:249:5: note: in expansion of macro 'pr_notice'
        pr_notice("%s: daxdev=%d (%llx) invalid...getting\n",
        ^~~~~~~~~
   fs/fuse/famfs.c: In function 'famfs_fuse_meta_alloc':
   include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:473:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:544:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/fuse/famfs.c:340:3: note: in expansion of macro 'pr_err'
      pr_err("%s:%d: fmap_buf underflow offset/size %ld/%ld\n",
      ^~~~~~
   fs/fuse/famfs.c:340:51: note: format string is defined here
      pr_err("%s:%d: fmap_buf underflow offset/size %ld/%ld\n",
                                                    ~~^
                                                    %d
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/sh/include/asm/bug.h:112,

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEV_DAX_IOMAP
   Depends on [n]: DEV_DAX [=n] && DAX [=n]
   Selected by [y]:
   - FUSE_FAMFS_DAX [=y] && FUSE_FS [=y]


vim +163 fs/fuse/famfs.c

    84	
    85	/**
    86	 * famfs_fuse_get_daxdev()
    87	 *
    88	 * Send a GET_DAXDEV message to the fuse server to retrieve info on a
    89	 * dax device.
    90	 *
    91	 * @fm    - fuse_mount
    92	 * @index - the index of the dax device; daxdevs are referred to by index
    93	 *          in fmaps, and the server resolves the index to a particular daxdev
    94	 *
    95	 * Returns: 0=success
    96	 *          -errno=failure
    97	 */
    98	static int
    99	famfs_fuse_get_daxdev(struct fuse_mount *fm, const u64 index)
   100	{
   101		struct fuse_daxdev_out daxdev_out = { 0 };
   102		struct fuse_conn *fc = fm->fc;
   103		struct famfs_daxdev *daxdev;
   104		int err = 0;
   105	
   106		FUSE_ARGS(args);
   107	
   108		pr_notice("%s: index=%lld\n", __func__, index);
   109	
   110		/* Store the daxdev in our table */
   111		if (index >= fc->dax_devlist->nslots) {
   112			pr_err("%s: index(%lld) > nslots(%d)\n",
   113			       __func__, index, fc->dax_devlist->nslots);
   114			err = -EINVAL;
   115			goto out;
   116		}
   117	
   118		args.opcode = FUSE_GET_DAXDEV;
   119		args.nodeid = index;
   120	
   121		args.in_numargs = 0;
   122	
   123		args.out_numargs = 1;
   124		args.out_args[0].size = sizeof(daxdev_out);
   125		args.out_args[0].value = &daxdev_out;
   126	
   127		/* Send GET_DAXDEV command */
   128		err = fuse_simple_request(fm, &args);
   129		if (err) {
   130			pr_err("%s: err=%d from fuse_simple_request()\n",
   131			       __func__, err);
   132			/* Error will be that the payload is smaller than FMAP_BUFSIZE,
   133			 * which is the max we can handle. Empty payload handled below.
   134			 */
   135			goto out;
   136		}
   137	
   138		down_write(&fc->famfs_devlist_sem);
   139	
   140		daxdev = &fc->dax_devlist->devlist[index];
   141		pr_debug("%s: dax_devlist %llx daxdev[%lld]=%llx\n", __func__,
   142			 (u64)fc->dax_devlist, index, (u64)daxdev);
   143	
   144		/* Abort if daxdev is now valid */
   145		if (daxdev->valid) {
   146			up_write(&fc->famfs_devlist_sem);
   147			/* We already have a valid entry at this index */
   148			err = -EALREADY;
   149			goto out;
   150		}
   151	
   152		/* This verifies that the dev is valid and can be opened and gets the devno */
   153		pr_debug("%s: famfs_verify_daxdev(%s)\n", __func__, daxdev_out.name);
   154		err = famfs_verify_daxdev(daxdev_out.name, &daxdev->devno);
   155		if (err) {
   156			up_write(&fc->famfs_devlist_sem);
   157			pr_err("%s: err=%d from famfs_verify_daxdev()\n", __func__, err);
   158			goto out;
   159		}
   160	
   161		/* This will fail if it's not a dax device */
   162		pr_debug("%s: dax_dev_get(%x)\n", __func__, daxdev->devno);
 > 163		daxdev->devp = dax_dev_get(daxdev->devno);
   164		if (!daxdev->devp) {
   165			up_write(&fc->famfs_devlist_sem);
   166			pr_warn("%s: device %s not found or not dax\n",
   167				__func__, daxdev_out.name);
   168			err = -ENODEV;
   169			goto out;
   170		}
   171	
   172		daxdev->name = kstrdup(daxdev_out.name, GFP_KERNEL);
   173		wmb(); /* all daxdev fields must be visible before marking it valid */
   174		daxdev->valid = 1;
   175	
   176		up_write(&fc->famfs_devlist_sem);
   177	
   178		pr_debug("%s: daxdev(%lld, %s)=%llx opened and marked valid\n",
   179			 __func__, index, daxdev->name, (u64)daxdev);
   180	
   181	out:
   182		return err;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
