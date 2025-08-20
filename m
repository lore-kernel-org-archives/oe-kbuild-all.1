Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC43C38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 02:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755657353; cv=none; b=T5qmZGBjxjdb3yT6Zrjw2EYL2bIdezQaLs6jCVPu2ZdFeYMlHhYAbmo85DC+ZpK1QnGvNYZBJaDluVRYD2KtWzuPjO1g7hR4ecYVU6ZxkAN1jix4hGIU5owfcQh1xTLAMtE1oBmd9lQVCrEiQ9sC8Yo2O2eqbn1dv3rMuTVI38E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755657353; c=relaxed/simple;
	bh=ipBkzag1/3cbyzOADGTpwcaj/vEiL5+yGyEX7DSsGvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMxVmIWsFlHt+tKaWSmqj1rY3cQ7NviFWi6WGughV4gOFBsLjfyVxmClITrAM0VSt+YJ2BRZ0jhLtFUrlsGWi0ewyc1h49vm/wDm9MvH4v1or/TwCW8o9CF+vxBuJUCujWmDH82FkeIkWw1G9FDY03n+taIzemFe7Mnxfdlzuss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6WQn4jO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6WQn4jO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755657353; x=1787193353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ipBkzag1/3cbyzOADGTpwcaj/vEiL5+yGyEX7DSsGvA=;
  b=g6WQn4jO7E7HO03AtmXTGhB64e52aQKEHSBx3P107tM8nQhr015DCepj
   fPWIq4eEsD8vQnpuQtV2yEaeTleiy0U+CDnxinnT5cniP6Ky0B3ROiu/6
   RH2tfqP4E7HOnNzGKhdKmjYQBI9vjDTLCiiQSoc/IHPlUA7od8wj4FrXG
   oiSLtSe/zyjczT5S9KK89Nj26xS1IOH0waf6/wNkc8sjjEtP4S+/VJTNw
   1cm2aFMFkB9wqu0qCZJkHWSpPnnCCsmA1KZqx779BipDvA2G4zUE2xIE1
   oKPzPhJ2Y/0BNphmrW7z7AbahaMNZQ7GDHr6MmN6hwVNLWce5UvsYbtih
   A==;
X-CSE-ConnectionGUID: 3TsnMTaTT72fWko/wEifVQ==
X-CSE-MsgGUID: zeGCMZkRTa20mc4jo39z7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57777319"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57777319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 19:35:52 -0700
X-CSE-ConnectionGUID: tGzTRuqhRxWJ8V/Ww673TQ==
X-CSE-MsgGUID: Ez/T7xAdTC2LvQ2KgfD+wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="199001804"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Aug 2025 19:35:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoYg0-000HzT-1q;
	Wed, 20 Aug 2025 02:35:48 +0000
Date: Wed, 20 Aug 2025 10:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 63/63] fs/fuse/file_iomap.c:2502:45:
 error: invalid use of undefined type 'const struct fuse_iomap_dev'
Message-ID: <202508201010.rDSAoTSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   3dc844fb9d8e17b6bf801ac080192c845a12467e
commit: 3dc844fb9d8e17b6bf801ac080192c845a12467e [63/63] fuse: enable iomap cache management
config: i386-buildonly-randconfig-002-20250820 (https://download.01.org/0day-ci/archive/20250820/202508201010.rDSAoTSr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201010.rDSAoTSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201010.rDSAoTSr-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/file_iomap.c: In function 'fuse_iomap_from_cache':
   fs/fuse/file_iomap.c:607:15: error: assignment to 'struct fuse_iomap_dev *' from incompatible pointer type 'struct fuse_backing *' [-Werror=incompatible-pointer-types]
     607 |         iodev = fuse_iomap_find_dev(fm->fc, &lmap->map);
         |               ^
   fs/fuse/file_iomap.c:611:46: error: passing argument 3 of 'fuse_iomap_from_server' from incompatible pointer type [-Werror=incompatible-pointer-types]
     611 |         fuse_iomap_from_server(inode, iomap, iodev, &lmap->map);
         |                                              ^~~~~
         |                                              |
         |                                              struct fuse_iomap_dev *
   fs/fuse/file_iomap.c:353:70: note: expected 'const struct fuse_backing *' but argument is of type 'struct fuse_iomap_dev *'
     353 |                                           const struct fuse_backing *fb,
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   fs/fuse/file_iomap.c:614:9: error: implicit declaration of function 'fuse_iomap_dev_put'; did you mean 'fuse_iomap_dev_inval'? [-Werror=implicit-function-declaration]
     614 |         fuse_iomap_dev_put(iodev);
         |         ^~~~~~~~~~~~~~~~~~
         |         fuse_iomap_dev_inval
   fs/fuse/file_iomap.c: In function 'fuse_iomap_upsert_validate_dev':
>> fs/fuse/file_iomap.c:2502:45: error: invalid use of undefined type 'const struct fuse_iomap_dev'
    2502 |         device_bytes = bdev_nr_sectors(iodev->bdev) << SECTOR_SHIFT;
         |                                             ^~
   fs/fuse/file_iomap.c: In function 'fuse_iomap_upsert_validate_mapping':
   fs/fuse/file_iomap.c:2533:15: error: assignment to 'struct fuse_iomap_dev *' from incompatible pointer type 'struct fuse_backing *' [-Werror=incompatible-pointer-types]
    2533 |         iodev = fuse_iomap_find_dev(fc, map);
         |               ^
   cc1: some warnings being treated as errors


vim +2502 fs/fuse/file_iomap.c

  2480	
  2481	static inline bool
  2482	fuse_iomap_upsert_validate_dev(
  2483		const struct fuse_iomap_dev	*iodev,
  2484		const struct fuse_iomap_io	*map)
  2485	{
  2486		uint64_t			map_end;
  2487		sector_t			device_bytes;
  2488	
  2489		if (!iodev) {
  2490			if (BAD_DATA(map->addr != FUSE_IOMAP_NULL_ADDR))
  2491				return false;
  2492	
  2493			return true;
  2494		}
  2495	
  2496		if (BAD_DATA(map->addr == FUSE_IOMAP_NULL_ADDR))
  2497			return false;
  2498	
  2499		if (BAD_DATA(check_add_overflow(map->addr, map->length, &map_end)))
  2500			return false;
  2501	
> 2502		device_bytes = bdev_nr_sectors(iodev->bdev) << SECTOR_SHIFT;
  2503		if (BAD_DATA(map_end > device_bytes))
  2504			return false;
  2505	
  2506		return true;
  2507	}
  2508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
