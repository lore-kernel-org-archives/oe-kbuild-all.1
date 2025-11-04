Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A1191493
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245751; cv=none; b=UlR1lKvl3MqC9EHKxvY/M6aEw3L+NM9xja+bUmzxj/4XfhZJN9Vq5nfVP5mZ6wi6jFsVHgmCZgV61OKTyaUOu6/3V+r8i1gzhDkMCRxw+PCDWda4saumsCc2rkGSkxYp1lK4RwIJk13RK+5if0YCHVgW1uLLfyz7THmNtSVSJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245751; c=relaxed/simple;
	bh=5Iud9GH6mDTg+FpaW9PDFDdIjGew4Vq6klrylzLmUFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ujU3rcseabL063xCpRp6ZCwxocIQMcAXH+vfyWWFS1U12MWcmKkNKnNfEHPbI6f0lMyg4yfCW0SBnc+3u/pGgjeSkUc6fQQi6AD0oBqw++GjsyoQW7gJP6BrbX4bqilu9b2iQ36j6++GGZBvtMFl722OHDIlDD+fe7qAHFKvfDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5ZLhCsA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5ZLhCsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762245750; x=1793781750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Iud9GH6mDTg+FpaW9PDFDdIjGew4Vq6klrylzLmUFc=;
  b=W5ZLhCsAZy0hSn8kg2U26QUklw1kpGmNVBI7tUjHa+tVOe5Hcy/7+Rzy
   gap8J3OAdw/Gtg4qeFe7BN+cwTgC/6pUzmENgzWknSmRxCzqElv94F3rF
   Lj31eU1IrGYSRlICwiFKU6zLVVfa/mGzoQYwiWg/8bwYPa9ZanfIeA5Vk
   QbY3A8MkNjy4IfX9T5Gsl6o2fY69q2MXtDzlJUP4KEHeep61pDxy+YEOM
   5xjEmMkPGMCSGOCfA/5GtUNX16c9ChcIcysDz6IgEtMAeDKMCRZmnzAk2
   BuX+iTUfKQ7oP2sItu9L+7fnTmt/tnNUJFm5SNbZthGlEAKhT8zd4EeQl
   g==;
X-CSE-ConnectionGUID: iCYVx1sERwKemb6IJK/shw==
X-CSE-MsgGUID: SrMSoFqvRZO1hsB7G+aJ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75013433"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="75013433"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:42:30 -0800
X-CSE-ConnectionGUID: ZNfsHKZwQNiv2nKOO/KYNw==
X-CSE-MsgGUID: L5hgNzz/Tni0b4HIGdxCKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186789870"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 00:42:28 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGCbf-000R9M-0C;
	Tue, 04 Nov 2025 08:41:52 +0000
Date: Tue, 4 Nov 2025 16:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-ioerr-reporting 18/28]
 fs/xfs/xfs_notify_failure.c:474:10: error: dereferencing pointer to
 incomplete type 'struct xfs_failure_info'
Message-ID: <202511041619.njWJUSLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-ioerr-reporting
head:   fe3c1f3502d002505e2a3992b3448ee14141eede
commit: b98248a61ffa4266e1711739cc71bf8d3c7793ad [18/28] xfs: add media error reporting ioctl
config: parisc-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041619.njWJUSLK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041619.njWJUSLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041619.njWJUSLK-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_notify_failure.c: In function 'xfs_report_one_data_loss':
>> fs/xfs/xfs_notify_failure.c:474:10: error: dereferencing pointer to incomplete type 'struct xfs_failure_info'
       notify->startblock + notify->blockcount;
             ^~
   fs/xfs/xfs_notify_failure.c: In function 'xfs_report_data_loss':
   fs/xfs/xfs_notify_failure.c:531:10: error: variable 'notify' has initializer but incomplete type
      struct xfs_failure_info notify = { };
             ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_notify_failure.c:531:27: error: storage size of 'notify' isn't known
      struct xfs_failure_info notify = { };
                              ^~~~~~
   fs/xfs/xfs_notify_failure.c:531:27: warning: unused variable 'notify' [-Wunused-variable]

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +474 fs/xfs/xfs_notify_failure.c

   461	
   462	static int
   463	xfs_report_one_data_loss(
   464		struct xfs_btree_cur		*cur,
   465		const struct xfs_rmap_irec	*rec,
   466		void				*data)
   467	{
   468		struct xfs_mount		*mp = cur->bc_mp;
   469		struct xfs_inode		*ip;
   470		struct xfs_failure_info		*notify = data;
   471		xfs_fileoff_t			fileoff = rec->rm_offset;
   472		xfs_extlen_t			blocks = rec->rm_blockcount;
   473		const xfs_agblock_t		notify_end =
 > 474				notify->startblock + notify->blockcount;
   475		const xfs_agblock_t		rmap_end =
   476				rec->rm_startblock + rec->rm_blockcount;
   477		int				error = 0;
   478	
   479		if (XFS_RMAP_NON_INODE_OWNER(rec->rm_owner) ||
   480		    (rec->rm_flags & (XFS_RMAP_ATTR_FORK | XFS_RMAP_BMBT_BLOCK)))
   481			return 0;
   482	
   483		error = xfs_iget(mp, cur->bc_tp, rec->rm_owner, 0, 0, &ip);
   484		if (error)
   485			return 0;
   486	
   487		if (notify->startblock > rec->rm_startblock) {
   488			fileoff += notify->startblock - rec->rm_startblock;
   489			blocks -= notify->startblock - rec->rm_startblock;
   490		}
   491		if (rmap_end > notify_end)
   492			blocks -= rmap_end - notify_end;
   493	
   494		xfs_inode_media_error(ip, XFS_FSB_TO_B(mp, fileoff),
   495				XFS_FSB_TO_B(mp, blocks));
   496	
   497		xfs_irele(ip);
   498		return 0;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
