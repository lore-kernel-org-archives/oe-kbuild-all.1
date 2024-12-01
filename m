Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF4E4C66
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 05:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733029280; cv=none; b=G4JCqWFMIVjm4ULZyeNUX5kc9AqXC0VxYxSR/Xsf1bGriVnWynhu7wvK3cSd4QD6y35Sna/UUiCqnQ5Wba90BKt0ADwU21B3mDzdXoiJJ5a9u41Gd2h4Wf/oORfLpllcQWyczndXQq9Ezk5BKkMPrqmlVIjVyi6ttVRoff74dC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733029280; c=relaxed/simple;
	bh=Vrz1UGwFCpMot+84ViKIq7cXiqt8R6a71vo5PizCMYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNcYR0R+myWxLPR8MoFQ56TcLat7XpxfpVHaM+Ybnzu0Ua+2O3bGhzIozEaB6krl85KduP16cqTW95gP9Yt1kuaaVfPv4m/m2gzASGM5YaCD9tORIzan3Iu9jsT6JYDGkWqBhtFlBa/DNz2tPx+JeEdkTi3bXxbe+WXn+Vj2f+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksiv9IV0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksiv9IV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733029278; x=1764565278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vrz1UGwFCpMot+84ViKIq7cXiqt8R6a71vo5PizCMYQ=;
  b=ksiv9IV0W+VBShq1JqouIGke3hB2f+TgYpQDlrqoJ0s70c+s2azsvat1
   CWwYRRywo13s0cUzNAITAj610V4dSYqjtWchPh3iJM1JCnu/aEmc70F4j
   esByxy/xJdpgO8ruBkNOsLnTBAzE7hP4noeXhsn2I4SHtwuh/hcpqoRrS
   n36JhgleZbJ5H/B80A4t0lp8B5/MsuOSxSnsXxZ6k4KPvzi8pObnuMtmd
   Fq1yiE/Qttbj61mEhi5Zc+90jwg+I9+jZlADytFgcyrBZ+Dwg/QpgB5Z3
   00h+1uroXc2x9EgUwk1u1tTjnh2sM7hzL+32wGsBChUJZBzDeOH+cfW+h
   w==;
X-CSE-ConnectionGUID: SVVzxdHNSs2j46lqVQ+BwQ==
X-CSE-MsgGUID: a7IhnRAxSQu3DvnxQkYdEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44250855"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="44250855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 21:01:17 -0800
X-CSE-ConnectionGUID: Q5iqpOoQRTmNVWB4y44flw==
X-CSE-MsgGUID: 0lp/+HeHQfyCAJpIwVFmBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97212649"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Nov 2024 21:01:16 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHc3s-0001Fp-2U;
	Sun, 01 Dec 2024 05:00:16 +0000
Date: Sun, 1 Dec 2024 12:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:rtgroups-prep-6.13 79/90] fs/xfs/xfs_rtalloc.c:954:2-8:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202412011205.7O568VYI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rtgroups-prep-6.13
head:   b20faddd8404299b25c046a24a9e53558c3eb5fe
commit: cb9c98dd737801223ade149fd6d9fa7e99892e10 [79/90] xfs: move RT bitmap and summary information to the rtgroup
config: x86_64-randconfig-101-20241115 (https://download.01.org/0day-ci/archive/20241201/202412011205.7O568VYI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011205.7O568VYI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_rtalloc.c:954:2-8: WARNING: NULL check before some freeing functions is not needed.

vim +954 fs/xfs/xfs_rtalloc.c

   919	
   920	static int
   921	xfs_growfs_rtg(
   922		struct xfs_mount	*mp,
   923		xfs_rfsblock_t		nrblocks,
   924		xfs_agblock_t		rextsize)
   925	{
   926		uint8_t			*old_rsum_cache = NULL;
   927		xfs_extlen_t		bmblocks;
   928		xfs_fileoff_t		bmbno;
   929		struct xfs_rtgroup	*rtg;
   930		int			error;
   931	
   932		rtg = xfs_rtgroup_grab(mp, 0);
   933		if (!rtg)
   934			return -EINVAL;
   935	
   936		error = xfs_growfs_rt_alloc_blocks(rtg, nrblocks, rextsize, &bmblocks);
   937		if (error)
   938			goto out_rele;
   939	
   940		if (bmblocks != rtg_mount(rtg)->m_sb.sb_rbmblocks) {
   941			old_rsum_cache = rtg->rtg_rsum_cache;
   942			error = xfs_alloc_rsum_cache(rtg, bmblocks);
   943			if (error)
   944				goto out_rele;
   945		}
   946	
   947		for (bmbno = xfs_last_rt_bmblock(rtg); bmbno < bmblocks; bmbno++) {
   948			error = xfs_growfs_rt_bmblock(rtg, nrblocks, rextsize, bmbno);
   949			if (error)
   950				goto out_error;
   951		}
   952	
   953		if (old_rsum_cache)
 > 954			kvfree(old_rsum_cache);
   955		xfs_rtgroup_rele(rtg);
   956		return 0;
   957	
   958	out_error:
   959		/*
   960		 * Reset rtg_extents to the old value if adding more blocks failed.
   961		 */
   962		rtg->rtg_extents = xfs_rtgroup_extents(rtg_mount(rtg), rtg_rgno(rtg));
   963		if (old_rsum_cache) {
   964			kvfree(rtg->rtg_rsum_cache);
   965			rtg->rtg_rsum_cache = old_rsum_cache;
   966		}
   967	out_rele:
   968		xfs_rtgroup_rele(rtg);
   969		return error;
   970	}
   971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
