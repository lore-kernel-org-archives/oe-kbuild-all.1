Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C31F937
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725374056; cv=none; b=abK9NUPI9B9B7zlRW34wS4iPlAuMIh8QlKmvpkVkLrmt/gCI8G4xLENBpTT1FMMwiuLoSyCQEBfoXzK4tPFQP/Nyn77wyig+eGqUR219egY/DDwz+7MJUQZCdlFFOGJEoes1PJsNUlkWrpgpc0FRfBCPS3tlvMvcGiBcV0iJUMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725374056; c=relaxed/simple;
	bh=KyZHctfUipLimAPiTuIIv12oP7MHVxAaxjBZ3NfW67w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSSi2EcOeqbRExBfsGXBR5e2ePGjc9tJMKmuqdQftU9rZWH48mLE1rvqJIQBSUmuKf2JdzAa/xFPVHa9YarvX4KzOlvqDtSBk3ZLfwK5IOOmR60KPjuoUtX3fXoQ+2v7d6kI8+nYgQ3bw4puOuu7/zOgF+in0ePujjLIyu0YBW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boEDbuy+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boEDbuy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725374054; x=1756910054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KyZHctfUipLimAPiTuIIv12oP7MHVxAaxjBZ3NfW67w=;
  b=boEDbuy+3TZG6QR/ACKTeBAEEtlQRPy0JcD91RXOVugEMjX66aemFpN8
   JCA9dDjSRJ0LEd36+bdQJuqPmnsZVkg6Wnr/aqHhWuJrQgrP/BjsaBUcJ
   wmK0zqNkdAREHI83JHjKym5SnP8nPpiFQzjEQkF/E/Ol8jcEf4hptTLuI
   ++sH0DaD6Vv5EoeLKOHF4F21CMrxUdR2EXaThI89mjKz3qNIGx89cUS9g
   lzbHRuT+TEKDQiXx9RF5aJkd+fhktW/CAqwLdMiVzhS/OnhNNizHzYFET
   rIELAdpv6BrjcCjWdKR1a08q04c+Ck5A5J3vu67K+KJtqeob7MFnStusx
   w==;
X-CSE-ConnectionGUID: nzHO8XKMTjqjvQFg6T6Q6w==
X-CSE-MsgGUID: I7NxusVpRAyYV/79PTOg9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23542734"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23542734"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:34:13 -0700
X-CSE-ConnectionGUID: 7BSm0yiORrCImUyl+DZSeg==
X-CSE-MsgGUID: J1X73QsxRV+VHY1abDQwRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65663770"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:34:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slUbh-0006na-0S;
	Tue, 03 Sep 2024 14:34:09 +0000
Date: Tue, 3 Sep 2024 22:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/7] xfs: call xfs_bmap_exact_minlen_extent_alloc from
 xfs_bmap_btalloc
Message-ID: <202409032258.rrtXCE9L-lkp@intel.com>
References: <20240903042825.2700365-7-hch@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903042825.2700365-7-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on linus/master v6.11-rc6 next-20240903]
[cannot apply to djwong-xfs/djwong-devel]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/xfs-return-bool-from-xfs_attr3_leaf_add/20240903-132828
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20240903042825.2700365-7-hch%40lst.de
patch subject: [PATCH 6/7] xfs: call xfs_bmap_exact_minlen_extent_alloc from xfs_bmap_btalloc
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240903/202409032258.rrtXCE9L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032258.rrtXCE9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032258.rrtXCE9L-lkp@intel.com/

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
