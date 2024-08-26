Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9543178
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674684; cv=none; b=em6oqmE9G1qvU0pedE1jPRRAjkCVfDohgu1T8dawEuD+uTuecuse6oBG8bWGwYVX2Vyd8JyIyvctJrMwgB1LOP0qeuzhuIWiITgd0/bhs2Y+xyvmhev1F5jd4ppSov+52oSjg3C4JESyjIcLdxgbo61aUqEmfZNC7MAsN1ipvJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674684; c=relaxed/simple;
	bh=eh8DiWD7PRy+oVoUdIIDebWnp0HVa3sL5tWwR6cgO2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xo3lQD9Arlmef2VDNen9DdbgeVz5QMkIFwyV71isGqb9n4rA8f5AF4Y4Iq1XL1aR1Bcy9TNrR3r/h5zsq/1IroKk9GTDO90PFgj2ukHDeDYWH8B3c3xRlL6K4V2N7Zir9aUDJSBa7fRsdwzEts8Bl8PyNPmrq0s76IwYQyIZuw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErWKx3I/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErWKx3I/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724674682; x=1756210682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eh8DiWD7PRy+oVoUdIIDebWnp0HVa3sL5tWwR6cgO2A=;
  b=ErWKx3I/UXj2rVkPy7IQRYQS77kKiWO0DQcCyWpINIY0w/aDdvniVLYM
   8rbqB4V73mHAaj7GwjQK+oSKzDGvAZv50L+qVYFz+w/WrIwmxHQ5QUW9i
   fSwDTc4jLjFbK5kIa49FMMhklVYgvp89YdTbO1sbu1oZjTJkh492wIEGy
   IA58zbFh2Iz8QYmAuXP1Zr28i9AQ/MVdbpIvR87zc3CMSeLArSp4E6F+3
   8uTL+0VFxkpmqNtnk5/IwFHuZwdwvMmn7uYT2anndf8lqwARejk7Wb74o
   fkOMBvKf9bmC3K0pQS3c0GCP71Jgqr2fGd+HOjV//dKqWbIBu4Nm7zQXB
   Q==;
X-CSE-ConnectionGUID: 1p19ISP8QzKgBYX70GiRDg==
X-CSE-MsgGUID: WpCiWtfER+2vd76TRcfTqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33713979"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33713979"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:18:02 -0700
X-CSE-ConnectionGUID: CqqtmzHySounNVxtajZt3g==
X-CSE-MsgGUID: kTlm3XpvTC+I7y3+YhGsqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="85675654"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2024 05:18:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siYfW-000H1i-2K;
	Mon, 26 Aug 2024 12:17:58 +0000
Date: Mon, 26 Aug 2024 20:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] xfs: call xfs_bmap_exact_minlen_extent_alloc from
 xfs_bmap_btalloc
Message-ID: <202408262003.krBZ5AKx-lkp@intel.com>
References: <20240824034100.1163020-6-hch@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824034100.1163020-6-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on linus/master v6.11-rc5 next-20240826]
[cannot apply to djwong-xfs/djwong-devel]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/xfs-return-bool-from-xfs_attr3_leaf_add/20240826-140936
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20240824034100.1163020-6-hch%40lst.de
patch subject: [PATCH 5/6] xfs: call xfs_bmap_exact_minlen_extent_alloc from xfs_bmap_btalloc
config: x86_64-buildonly-randconfig-002-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262003.krBZ5AKx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262003.krBZ5AKx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262003.krBZ5AKx-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmap_btalloc':
>> fs/xfs/libxfs/xfs_bmap.c:3762:69: error: macro "xfs_bmap_exact_minlen_extent_alloc" passed 2 arguments, but takes just 1
    3762 |                 error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
         |                                                                     ^
   fs/xfs/libxfs/xfs_bmap.c:3500: note: macro "xfs_bmap_exact_minlen_extent_alloc" defined here
    3500 | #define xfs_bmap_exact_minlen_extent_alloc(bma) (-EFSCORRUPTED)
         | 
>> fs/xfs/libxfs/xfs_bmap.c:3762:25: error: 'xfs_bmap_exact_minlen_extent_alloc' undeclared (first use in this function)
    3762 |                 error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:3762:25: note: each undeclared identifier is reported only once for each function it appears in


vim +/xfs_bmap_exact_minlen_extent_alloc +3762 fs/xfs/libxfs/xfs_bmap.c

  3728	
  3729	static int
  3730	xfs_bmap_btalloc(
  3731		struct xfs_bmalloca	*ap)
  3732	{
  3733		struct xfs_mount	*mp = ap->ip->i_mount;
  3734		struct xfs_alloc_arg	args = {
  3735			.tp		= ap->tp,
  3736			.mp		= mp,
  3737			.fsbno		= NULLFSBLOCK,
  3738			.oinfo		= XFS_RMAP_OINFO_SKIP_UPDATE,
  3739			.minleft	= ap->minleft,
  3740			.wasdel		= ap->wasdel,
  3741			.resv		= XFS_AG_RESV_NONE,
  3742			.datatype	= ap->datatype,
  3743			.alignment	= 1,
  3744			.minalignslop	= 0,
  3745		};
  3746		xfs_fileoff_t		orig_offset;
  3747		xfs_extlen_t		orig_length;
  3748		int			error;
  3749		int			stripe_align;
  3750	
  3751		ASSERT(ap->length);
  3752		orig_offset = ap->offset;
  3753		orig_length = ap->length;
  3754	
  3755		stripe_align = xfs_bmap_compute_alignments(ap, &args);
  3756	
  3757		/* Trim the allocation back to the maximum an AG can fit. */
  3758		args.maxlen = min(ap->length, mp->m_ag_max_usable);
  3759	
  3760		if (unlikely(XFS_TEST_ERROR(false, mp,
  3761				XFS_ERRTAG_BMAP_ALLOC_MINLEN_EXTENT)))
> 3762			error = xfs_bmap_exact_minlen_extent_alloc(ap, &args);
  3763		else if ((ap->datatype & XFS_ALLOC_USERDATA) &&
  3764				xfs_inode_is_filestream(ap->ip))
  3765			error = xfs_bmap_btalloc_filestreams(ap, &args, stripe_align);
  3766		else
  3767			error = xfs_bmap_btalloc_best_length(ap, &args, stripe_align);
  3768		if (error)
  3769			return error;
  3770	
  3771		if (args.fsbno != NULLFSBLOCK) {
  3772			xfs_bmap_process_allocated_extent(ap, &args, orig_offset,
  3773				orig_length);
  3774		} else {
  3775			ap->blkno = NULLFSBLOCK;
  3776			ap->length = 0;
  3777		}
  3778		return 0;
  3779	}
  3780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
