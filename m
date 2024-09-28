Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EF14D6E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 22:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727563985; cv=none; b=sp5ylyHUI2vGL65yZNlAUZ125YnZfIX3e4uGnS1kSteiXZSWY7lWbwJddfxLbiCanN+XTH5KOCfUJ99lXT1j04B7hZTCClNmb8QSteUM8RctSnvtIuaQmGRR/H4ohc4BCRImG9v9lLtl0CscUXzzKpbg5/8spwVy83zrkhMnBG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727563985; c=relaxed/simple;
	bh=p8cxvFjadgnu7NsgltT3QnjHNzezJp21bVA4OrrLRKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kJU+1IqcesSSDZdt11jzGQWot7YCVNtchxmQEbCuBJkSnKyK8jy2iJbFZV4E8Mpasgek1uKf0+JeHYDCSMAuBJFjVUrQOLmR+X4oABtPA+z0ZzsPvMi/w0RBRlPaFCvgkDDs4bD67No+WqaPKebf83XoM9rGK9ol2FIjOTPrk9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baMz1//p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baMz1//p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727563983; x=1759099983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8cxvFjadgnu7NsgltT3QnjHNzezJp21bVA4OrrLRKc=;
  b=baMz1//px/LkkgHKQjsZ5ICQ9cv44AR290D+CLGtoloy/APeO83RCkrH
   1IU+Jwi6bKyo76xyw4rX5jJiLUX+0852Sf3xrdHoc3kIbPESCYgw2yEOc
   RAKVp1EnXuB6LxtHIw0P1LHuj3bUVdEZ+xmS6M85iJwPUIQuTIcywRwu6
   RwtAVfcmJJ1zdwJUajdgMI2xmPic1pSZsDVDWy+0KS0X6Vx3rwhMQQfow
   ET/aqkrseez9DsQ+9WanqPLDnXGNORIil5Mx+QgmLvpuGxK28og0JPAzH
   mJmw3F434AP8Z5eFRt0kKJl2KJAtvEqrbHTBjxkvQ/g3+n7cVdozFwnus
   Q==;
X-CSE-ConnectionGUID: srkEWL55SayOfsGKyymFxQ==
X-CSE-MsgGUID: eeTONH27Syq7cWbZvS1WqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="44201967"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="44201967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 15:53:03 -0700
X-CSE-ConnectionGUID: J7yvZDlfQDOBZb1M9MQW0w==
X-CSE-MsgGUID: ej9JqW4uSleIoGiFHVM+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72864825"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Sep 2024 15:53:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sugJ9-000Njj-38;
	Sat, 28 Sep 2024 22:52:59 +0000
Date: Sun, 29 Sep 2024 06:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 4008/23799]
 drivers/staging/erofs/utils.c:138:6: sparse: sparse: symbol
 'erofs_try_to_release_workgroup' was not declared. Should it be static?
Message-ID: <202409290639.uZftDFPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: fb4c3a2751ebf142fecc61eea8c738573ec3bf10 [4008/23799] staging: erofs: fix race when the managed cache is enabled
config: arm64-randconfig-r133-20240926 (https://download.01.org/0day-ci/archive/20240929/202409290639.uZftDFPU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409290639.uZftDFPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290639.uZftDFPU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/erofs/utils.c:138:6: sparse: sparse: symbol 'erofs_try_to_release_workgroup' was not declared. Should it be static?
   drivers/staging/erofs/utils.c:138:6: warning: no previous prototype for 'erofs_try_to_release_workgroup' [-Wmissing-prototypes]
     138 | bool erofs_try_to_release_workgroup(struct erofs_sb_info *sbi,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/erofs_try_to_release_workgroup +138 drivers/staging/erofs/utils.c

   137	
 > 138	bool erofs_try_to_release_workgroup(struct erofs_sb_info *sbi,
   139					    struct erofs_workgroup *grp,
   140					    bool cleanup)
   141	{
   142		void *entry;
   143	
   144		/*
   145		 * for managed cache enabled, the refcount of workgroups
   146		 * themselves could be < 0 (freezed). So there is no guarantee
   147		 * that all refcount > 0 if managed cache is enabled.
   148		 */
   149		if (!erofs_workgroup_try_to_freeze(grp, 1))
   150			return false;
   151	
   152		/*
   153		 * note that all cached pages should be unlinked
   154		 * before delete it from the radix tree.
   155		 * Otherwise some cached pages of an orphan old workgroup
   156		 * could be still linked after the new one is available.
   157		 */
   158		if (erofs_try_to_free_all_cached_pages(sbi, grp)) {
   159			erofs_workgroup_unfreeze(grp, 1);
   160			return false;
   161		}
   162	
   163		/*
   164		 * it is impossible to fail after the workgroup is freezed,
   165		 * however in order to avoid some race conditions, add a
   166		 * DBG_BUGON to observe this in advance.
   167		 */
   168		entry = radix_tree_delete(&sbi->workstn_tree, grp->index);
   169		DBG_BUGON((void *)((unsigned long)entry &
   170				   ~RADIX_TREE_EXCEPTIONAL_ENTRY) != grp);
   171	
   172		/*
   173		 * if managed cache is enable, the last refcount
   174		 * should indicate the related workstation.
   175		 */
   176		erofs_workgroup_unfreeze_final(grp);
   177		return true;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
