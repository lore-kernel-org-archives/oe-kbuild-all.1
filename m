Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE2523A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Nov 2024 02:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731636792; cv=none; b=K4MLXDh8MvVUC6AEJuS61QBtyD8f8LEIgImpDTHYRA6PorXGwI8hFaFEQgsEu2t1z7it0HStHZkmJ71CbL0XGZYdgXfcDP/u4xSGMN+wAKC8K6QBFZO7H7KfPdn7NcMfAP5HLIo3nOvKEkH+MAjhwQ2Ozf/SOeE9oL3Eub4DsQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731636792; c=relaxed/simple;
	bh=4bmGFWI1HUgmQxq2wpHfxn0OMimOKcyjDGE+Cc+tQIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nB6XMdSrK3KH8+rSGHw6fEQn3dYJuC8Us+kbAzW6JqV3qJCRyG8q3UswLLfkb3loNt791nogbUKE9Z7NQo1LqyFo9Fpflhc/3nZXOSQXByvATli151RnZkZ+Gr//7TqOVx3KgLzjN8obatmGfeATppUfLXs/so1YoJJL255ekzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YozDTXA0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YozDTXA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731636790; x=1763172790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bmGFWI1HUgmQxq2wpHfxn0OMimOKcyjDGE+Cc+tQIk=;
  b=YozDTXA0NwaCVzQLftCl7Hh2ej5dqneJNsvUc7ynw7gz3zJe8OVMYpJg
   cc/HII9ufA3ruzl9eb/+Mi8uiuPYxtXGHH46wR5A/QdImqkjJNGXFhX+C
   smmQH9NvgKgdeRixXdLQlwr+Znp7OTgcY0pFudnRROhbF5hUmvbeWkPkI
   zae4kaETUXFlbDZR66/JhWK4JLRwaz2SUzS3HTHm+o+AfRo81ooQofQat
   Pa+biANUVN4ogbTSQq7HXizFxAfa3a/WXPrWBNEdbiZ0NCkRVMKhmvdlf
   wI4gtqCl2031oEvLxtZvg36yQau1v1fSGo7nexpPvkGv3SfygYi4vLrOW
   Q==;
X-CSE-ConnectionGUID: zuY8qE04T5y4KQbZjQn6BQ==
X-CSE-MsgGUID: Uxjl7BFqRdG1EaJ5UhYbow==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49141414"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="49141414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 18:13:05 -0800
X-CSE-ConnectionGUID: +zgAh8tUT0exvj0GSK32DA==
X-CSE-MsgGUID: 2BQV5z2BQQels2hUNuMdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="87974982"
Received: from lkp-server02.sh.intel.com (HELO 481373e0caf0) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 14 Nov 2024 18:09:50 -0800
Received: from kbuild by 481373e0caf0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBlmL-00002U-00;
	Fri, 15 Nov 2024 02:09:45 +0000
Date: Fri, 15 Nov 2024 10:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:rtgroups-prep-6.13 79/90] fs/xfs/xfs_rtalloc.c:954:2-8:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202411151026.cfC1Y5ZR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rtgroups-prep-6.13
head:   7b91a30e441641733672f691244e5973ff1ca6de
commit: cb9c98dd737801223ade149fd6d9fa7e99892e10 [79/90] xfs: move RT bitmap and summary information to the rtgroup
config: x86_64-randconfig-101-20241115 (https://download.01.org/0day-ci/archive/20241115/202411151026.cfC1Y5ZR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411151026.cfC1Y5ZR-lkp@intel.com/

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
