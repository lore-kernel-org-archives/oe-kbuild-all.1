Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4711531DE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724227885; cv=none; b=MkdDE8B1DdEvB9xNUs8HjoZUl1LGzsMMfsk08x+9QtoyoWZutoDF+9v7ImFqX8dHz7aYKgVS2gNB3AgDfbD8K8WYGeGLNsnBBSV5dwIfjjZ6OOOHKFVfj8gEap1Mnt6uWMJHc09216Vk2Xij+PecS046XtFeLQI4OaeEnPPfl1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724227885; c=relaxed/simple;
	bh=qoLGdoS5M7ATU96Zd/fw21/xYsbRMAnurL3lzR4hvs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EV2XZ0+A0A2zIyppo6mNsH3AP7fikBL27Af+rUERRkwTnHwPHwMY9XKgGNoQFMNW41nOKW/UV/svog5fFJmIjsORbXOTlacD9jLsPMkUCnwDtVrYG3uMdVqpaFStpef3h5ufw55kxE9UuD7TWWDy/qR+qAzl3eONu5kIQ/BQK64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0z0iXW1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0z0iXW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724227883; x=1755763883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoLGdoS5M7ATU96Zd/fw21/xYsbRMAnurL3lzR4hvs0=;
  b=O0z0iXW1ZWQIjC2ZdLDr1S+8vs2Gg/jem9UCTihoYfUmcPz26QysxpH0
   ofIEsWb0dqtpmcVtYZuVc5kwzhPtUUc3Dn/wI8xb4s/DW2w3C5CDi//0V
   7wZ5Fl0vETUVLFFMMtZVuEJm6WkSkkiRrS1gMOVN1iZWAk0fGdPY8ZkE1
   mMCKxU5ijXyRmtmtl8+U/as8py2+STUDeQEb6AmhRA6AeJbdi0TWjJZhd
   K62Vh22zrJE+F8Ii3mtt0wPN6+2cTR7zGvIYDZMZjwnQ/PczBNyk7GBzq
   yIt8xBnKqhqmQfNPN7bd6XB9/+smjN6Qt4L3D0FOOtYmTRwUzpS34VI/o
   g==;
X-CSE-ConnectionGUID: JgtdFianQBu8CKQQ1scPPw==
X-CSE-MsgGUID: Qkrmemw8RHqhXMsGAiV5TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22103520"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22103520"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 01:11:22 -0700
X-CSE-ConnectionGUID: p4u7woYdSaay7gHZXKvVNQ==
X-CSE-MsgGUID: Xwfp9M09SOWmBdJ73x0DdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="60660039"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Aug 2024 01:11:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sggR4-000B6I-2o;
	Wed, 21 Aug 2024 08:11:18 +0000
Date: Wed, 21 Aug 2024 16:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 47/49] fs/xfs/libxfs/xfs_bmap.c:3803:11:
 error: use of undeclared identifier 'xfs_bmap_exact_minlen_extent_alloc'
Message-ID: <202408211603.2ncpevfM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   91ad8bea9f4ce121c5595f449ffb7c5a232a289f
commit: ed83c0944468937f5e3c710a414aa83bd6d53cff [47/49] xfs: call xfs_bmap_exact_minlen_extent_alloc from xfs_bmap_btalloc
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240821/202408211603.2ncpevfM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211603.2ncpevfM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211603.2ncpevfM-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_bmap.c:3803:50: error: too many arguments provided to function-like macro invocation
    3803 |                 error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
         |                                                                ^
   fs/xfs/libxfs/xfs_bmap.c:3541:9: note: macro 'xfs_bmap_exact_minlen_extent_alloc' defined here
    3541 | #define xfs_bmap_exact_minlen_extent_alloc(bma) (-EFSCORRUPTED)
         |         ^
>> fs/xfs/libxfs/xfs_bmap.c:3803:11: error: use of undeclared identifier 'xfs_bmap_exact_minlen_extent_alloc'
    3803 |                 error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
         |                         ^
   2 errors generated.


vim +/xfs_bmap_exact_minlen_extent_alloc +3803 fs/xfs/libxfs/xfs_bmap.c

  3769	
  3770	static int
  3771	xfs_bmap_btalloc(
  3772		struct xfs_bmalloca	*ap)
  3773	{
  3774		struct xfs_mount	*mp = ap->ip->i_mount;
  3775		struct xfs_alloc_arg	args = {
  3776			.tp		= ap->tp,
  3777			.mp		= mp,
  3778			.fsbno		= NULLFSBLOCK,
  3779			.oinfo		= XFS_RMAP_OINFO_SKIP_UPDATE,
  3780			.minleft	= ap->minleft,
  3781			.wasdel		= ap->wasdel,
  3782			.resv		= XFS_AG_RESV_NONE,
  3783			.datatype	= ap->datatype,
  3784			.alignment	= 1,
  3785			.minalignslop	= 0,
  3786		};
  3787		xfs_fileoff_t		orig_offset;
  3788		xfs_extlen_t		orig_length;
  3789		int			error;
  3790		int			stripe_align;
  3791	
  3792		ASSERT(ap->length);
  3793		orig_offset = ap->offset;
  3794		orig_length = ap->length;
  3795	
  3796		stripe_align = xfs_bmap_compute_alignments(ap, &args);
  3797	
  3798		/* Trim the allocation back to the maximum an AG can fit. */
  3799		args.maxlen = min(ap->length, mp->m_ag_max_usable);
  3800	
  3801		if (unlikely(XFS_TEST_ERROR(false, mp,
  3802				XFS_ERRTAG_BMAP_ALLOC_MINLEN_EXTENT)))
> 3803			error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
  3804		else if ((ap->datatype & XFS_ALLOC_USERDATA) &&
  3805				xfs_inode_is_filestream(ap->ip))
  3806			error = xfs_bmap_btalloc_filestreams(ap, &args, stripe_align);
  3807		else
  3808			error = xfs_bmap_btalloc_best_length(ap, &args, stripe_align);
  3809		if (error)
  3810			return error;
  3811	
  3812		if (args.fsbno != NULLFSBLOCK) {
  3813			xfs_bmap_process_allocated_extent(ap, &args, orig_offset,
  3814				orig_length);
  3815		} else {
  3816			ap->blkno = NULLFSBLOCK;
  3817			ap->length = 0;
  3818		}
  3819		return 0;
  3820	}
  3821	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
