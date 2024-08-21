Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A31CBEAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724228484; cv=none; b=aZOcBaB9Ba+LfEwoiVFteg3923cBUcvyMWBhssNe2dAZjOi7ty6LRKryAO8uF8JL3BsaH/xB32JvrOZvbWvWgI5bTZc76Ao8VD9xv2Zyx+OJm2LpL6hMIMw+19FjAxl0TRC8aHp5W2OzZy5gFW1r7XNhRl7SN2fzFYQzYUI7jwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724228484; c=relaxed/simple;
	bh=CXFMloPJPmF4A+I6ZMGw9j+kDgcoC5SUKS1p5W1KxHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgfXi6/qCVQxUNVlVdDf8bmKJ5zzUAN/5xUyxC+Tmmo2iN9ccRqZzDq7QSBFLojvTNfsJMqmh/vxOZnhVnI4blq3ZEC6+yVxMJ8KD2s+16aKIIN2ITZ+Mtr39ZIwFmFd+xB4Jfim6qY+7iYnPm0I1eRjBLq7q88Xxp/vCs7caq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XekEFIDB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XekEFIDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724228483; x=1755764483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CXFMloPJPmF4A+I6ZMGw9j+kDgcoC5SUKS1p5W1KxHI=;
  b=XekEFIDBABlvbFiyrNuiqWj9e3uHpk8Yi4rj4iFEOb5r8bb8WBo57e5r
   8XauK1YHHBPapFStLxWr8J/VvBdEUXC/yqP4Ngow2U+Ff46+jd0PyxnTd
   31OMprcAVQEP8TkxWNRpjI+hTI+tCrqGn4qczBQHToefbE2vw0Dpm2BgB
   ySgs3DtVdBqmSFATGKE/wZFyLQXDedOXn1XaABCN8JnB2k83v6v3rQOr2
   v9byH2jBfV9SeFRx2IEBNnyIV4VLV3mPsz46YvRtr5q0hYEmOaczHObal
   KJfT+cr4jAr2kZHMgrPnTRu3zcZqnt99UaQkyc0q/m2Fw+UQHgfKYuiAx
   A==;
X-CSE-ConnectionGUID: uViYyts8T26mWvdFDx7D9Q==
X-CSE-MsgGUID: PUO93rdfTr2QwnrF72XXFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22759169"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22759169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 01:21:22 -0700
X-CSE-ConnectionGUID: JGg+flICQYGoqwSalZwnxQ==
X-CSE-MsgGUID: nqgUYwYhRDq5N1juqdrV2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61045730"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Aug 2024 01:21:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sggal-000B6q-0f;
	Wed, 21 Aug 2024 08:21:19 +0000
Date: Wed, 21 Aug 2024 16:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 47/49] fs/xfs/libxfs/xfs_bmap.c:3803:69:
 error: macro "xfs_bmap_exact_minlen_extent_alloc" passed 2 arguments, but
 takes just 1
Message-ID: <202408211616.oCSlhre1-lkp@intel.com>
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
config: arc-randconfig-001-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211616.oCSlhre1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211616.oCSlhre1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211616.oCSlhre1-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmap_btalloc':
>> fs/xfs/libxfs/xfs_bmap.c:3803:69: error: macro "xfs_bmap_exact_minlen_extent_alloc" passed 2 arguments, but takes just 1
    3803 |                 error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
         |                                                                     ^
   fs/xfs/libxfs/xfs_bmap.c:3541: note: macro "xfs_bmap_exact_minlen_extent_alloc" defined here
    3541 | #define xfs_bmap_exact_minlen_extent_alloc(bma) (-EFSCORRUPTED)
         | 
>> fs/xfs/libxfs/xfs_bmap.c:3803:25: error: 'xfs_bmap_exact_minlen_extent_alloc' undeclared (first use in this function)
    3803 |                 error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:3803:25: note: each undeclared identifier is reported only once for each function it appears in


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
