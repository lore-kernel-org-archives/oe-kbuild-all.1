Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7A47F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 00:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707870086; cv=none; b=pFRt+nAegpc4xNMLx+Z7xQ6h/zoQBZOBigmlb/t6thaZXo+cxybXedk3qb6obAOHUhfG6JRO3iZVO5j6Ww2/RmQI76Y0Z7p5kwgZ61+iCK01NKqfyjcOvp4BAQE65FOlrkv1Opkdt81LzxHys3M1570ZqzZKXFl2Gc/4MpB90VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707870086; c=relaxed/simple;
	bh=2Pf4pkm6vHY3Dl4ivfJxn2VGM+ualKkTtFa1SzkrhgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLRQNyiw4DOWABNRhPgJj08PO9mKR0Fgxgkh48itaGGmyCn3uh+LtUPcGz6X0hSSPCQoaGQHovfabNMwHXTzZ0dOSEFcrU8TUDcjdTpV7hmBL31VtkD6nkIGu0Osa6IvKp7du329XsPS5mqmPJOTCKBnYWc/IX5p0YYxV99ZLNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+cATfEf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+cATfEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707870083; x=1739406083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Pf4pkm6vHY3Dl4ivfJxn2VGM+ualKkTtFa1SzkrhgI=;
  b=U+cATfEf6MeHlrp3ztt4T67RR4KbHngjMsrP+4PaENahX4DMcBjqVtBM
   FkD/Q3zKz8LoAi7SpGH4EM/qXD4x543vo7pBvs6lTBA2DWcE/MBbfGP1z
   MeMGkc+n/cdGj6LJnjmeVT838/7XBX5WKmC34qvnMWin2q+/ncw4LouS2
   qS8rkKRBbxMxWMSCkvcY7ZkQyA0oc4H8fvKQ05frO1SKaYzBR3UiD2wyZ
   sa7jpZXOn2Q24QUfPq9sydg5CHHv6IQbmGjt7Z4NrVGtoxEnOzApZjnY1
   ynOZnJ+2aeVOQWk5zANuJDB2UYYb+H34veeEy9fTHGN+PyUs7Q+yHRc7W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24378363"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="24378363"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 16:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3005910"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2024 16:21:22 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra31c-0008Au-04;
	Wed, 14 Feb 2024 00:21:20 +0000
Date: Wed, 14 Feb 2024 08:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 566/572] fs/xfs/xfs_health.c:299:16:
 warning: variable 'old_mask' set but not used
Message-ID: <202402140839.zRaokPCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   9f39f2084cebe475618d869d62b32230a7729b0d
commit: ced935343ef643076b416ff722db4fa86187026e [566/572] xfs: create hooks for monitoring health updates
config: x86_64-randconfig-161-20240214 (https://download.01.org/0day-ci/archive/20240214/202402140839.zRaokPCt-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140839.zRaokPCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140839.zRaokPCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_health.c: In function 'xfs_fs_mark_sick':
>> fs/xfs/xfs_health.c:299:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     299 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_fs_mark_corrupt':
   fs/xfs/xfs_health.c:318:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     318 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_fs_mark_healthy':
   fs/xfs/xfs_health.c:338:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     338 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_rt_mark_sick':
   fs/xfs/xfs_health.c:373:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     373 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_rt_mark_corrupt':
   fs/xfs/xfs_health.c:392:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     392 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_rt_mark_healthy':
   fs/xfs/xfs_health.c:412:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     412 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_ag_mark_sick':
   fs/xfs/xfs_health.c:464:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     464 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_ag_mark_corrupt':
   fs/xfs/xfs_health.c:483:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     483 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_ag_mark_healthy':
   fs/xfs/xfs_health.c:503:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     503 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_rtgroup_mark_sick':
   fs/xfs/xfs_health.c:555:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     555 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_rtgroup_mark_corrupt':
   fs/xfs/xfs_health.c:574:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     574 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_rtgroup_mark_healthy':
   fs/xfs/xfs_health.c:595:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     595 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_inode_mark_sick':
   fs/xfs/xfs_health.c:631:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     631 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_inode_mark_corrupt':
   fs/xfs/xfs_health.c:659:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     659 |  unsigned int  old_mask;
         |                ^~~~~~~~
   fs/xfs/xfs_health.c: In function 'xfs_inode_mark_healthy':
   fs/xfs/xfs_health.c:688:16: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     688 |  unsigned int  old_mask;
         |                ^~~~~~~~


vim +/old_mask +299 fs/xfs/xfs_health.c

   292	
   293	/* Mark unhealthy per-fs metadata. */
   294	void
   295	xfs_fs_mark_sick(
   296		struct xfs_mount	*mp,
   297		unsigned int		mask)
   298	{
 > 299		unsigned int		old_mask;
   300	
   301		ASSERT(!(mask & ~XFS_SICK_FS_ALL));
   302		trace_xfs_fs_mark_sick(mp, mask);
   303	
   304		spin_lock(&mp->m_sb_lock);
   305		old_mask = mp->m_fs_sick;
   306		mp->m_fs_sick |= mask;
   307		spin_unlock(&mp->m_sb_lock);
   308	
   309		xfs_fs_health_update_hook(mp, XFS_HEALTHUP_SICK, old_mask, mask);
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
