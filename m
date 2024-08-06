Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F4E166F21
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937353; cv=none; b=W2G9vIaqcI6CzCXW1GjAcumOKmHU3NpBfAgmbh+3yNVhkC7Ouq7XppU/0IxZrwr+zudZY9OhtiF+6Zx3IAP1RuK7OR99ZqKOKwZIM6mbXw/NxpdmdCgZQYOkqqmrLUjb6s+JuwXyJ4w7cQrZAULgq7clwf6DfcDqpSx7PTlMoA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937353; c=relaxed/simple;
	bh=oCYA1QvIQfQs05xls0WmA/K4OCkJ5DC0RHitPdlYtS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLxJs45lyOMY0gcYMXwdDJ3WBEI6m0BQshffYWKJYQpfSnO3JO5T/7tM4jpE1wW903srerkXNbpCH6AqR4FnD9/kfUelji6/ElHfDVRq3dlsp1vhOuV0OHHEzXHKx2VzKG7mkyc3vv+AzIDMY0S321EXJpnYXUvBVCntu5BgF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSf3vFFj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSf3vFFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722937352; x=1754473352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCYA1QvIQfQs05xls0WmA/K4OCkJ5DC0RHitPdlYtS0=;
  b=PSf3vFFj+3bm2/L1S6cwkDCl5jB4wimsPD1qldELgmhSx6fIsZ8bMjt/
   J/DBCo/mAoS9OLA0+5UiJtmCcFdjCzBmVGzwm1cWH1oZJt6OunJHBIv3d
   J/74uFbwxwP+KTFs/Z9qPm2ryIv9pm0U+iGP8W4mQ+jzS/RLYrYi2XREA
   xucohxtaEL2y8QsvDZc4BZNhvh6sx1/yHZVARg/M8yUt1quwWxaPRcVih
   ptu1Zd/SFfOoVJCd8haw4kKYKswUx2SzcHmltShcNRmuR72PGIo/cdR/m
   3Zya9i33Dskm4BBAEt+vHCn0k0R3q3jWiEdzRvsqtxOtZXjU3vMdRnTqP
   g==;
X-CSE-ConnectionGUID: 9rL29rgPTDyTBVfonQhSkg==
X-CSE-MsgGUID: qZqMiR7TSfix9d101N0EcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24734417"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="24734417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 02:42:31 -0700
X-CSE-ConnectionGUID: 8JVQUZAaTrGJ01JDFrQKmg==
X-CSE-MsgGUID: vaUV71wFSNeKEY3CHYABDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="56674961"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Aug 2024 02:42:28 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbGi2-0004MW-1n;
	Tue, 06 Aug 2024 09:42:26 +0000
Date: Tue, 6 Aug 2024 17:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap-rebase 27/60]
 fs/xfs/scrub/bmap.c:319:18: warning: unused variable 'rgno'
Message-ID: <202408061706.9eQjvp0x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap-rebase
head:   556815df77c3443419163e1deccade141c065289
commit: 7b2d9043782d141cc29c3dd0d50ede7d239508ab [27/60] xfs: move RT bitmap and summary information to the rtgroup
config: arm-randconfig-001-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061706.9eQjvp0x-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061706.9eQjvp0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061706.9eQjvp0x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/bmap.c:6:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/xfs/scrub/bmap.c:319:18: warning: unused variable 'rgno' [-Wunused-variable]
     319 |         xfs_rgnumber_t          rgno = xfs_rtb_to_rgno(mp, irec->br_startblock);
         |                                 ^~~~
   2 warnings generated.


vim +/rgno +319 fs/xfs/scrub/bmap.c

   310	
   311	/* Cross-reference a single rtdev extent record. */
   312	STATIC void
   313	xchk_bmap_rt_iextent_xref(
   314		struct xfs_inode	*ip,
   315		struct xchk_bmap_info	*info,
   316		struct xfs_bmbt_irec	*irec)
   317	{
   318		struct xfs_mount	*mp = ip->i_mount;
 > 319		xfs_rgnumber_t		rgno = xfs_rtb_to_rgno(mp, irec->br_startblock);
   320		int			error;
   321	
   322		error = xchk_rtgroup_init(info->sc, rgno, &info->sc->sr);
   323		if (!xchk_fblock_process_error(info->sc, info->whichfork,
   324				irec->br_startoff, &error))
   325			goto out_free;
   326	
   327		xchk_rtgroup_lock(&info->sc->sr, XCHK_RTGLOCK_ALL);
   328		xchk_xref_is_used_rt_space(info->sc, irec->br_startblock,
   329				irec->br_blockcount);
   330	out_free:
   331		xchk_rtgroup_free(info->sc, &info->sc->sr);
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
