Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D7E17C61
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068379; cv=none; b=PTHsGna0Wjmv3ntdRH0IwFnpf7mak2f+J4xpqvK3qk26U4pvqBI6YEhKdC6OLYB1bNE6MQ/+Ju5lLY4PyGx6/ZIO+S0BUAqEXaVoIZk7KXWIZpdSQiJTkuJcSiNCEdwAxVUfbhnPG1YAU8BvKNAZpntgs6/5v+o+ED2fABldehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068379; c=relaxed/simple;
	bh=Hey55qORF26W1six5P4do+iqHTBQGAZuvaQS3wjj2es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RodQqpM0Lj6oVv97aV7rq/SSTavzrhgklSVoRU4UvzQbOH3eoztB4Yf6OFTrxc7N/0glEfoQTD4aOcOPCMDKEFiYCl0PrJwzQ6s5CzgxwO2a4ipmUo9VhwDqhwV0TM0FYCR+tHhcr7jPF5HVuYg0hhrYIOu701VmPXPOFfo6+tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ai4PoPe7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ai4PoPe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730068377; x=1761604377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hey55qORF26W1six5P4do+iqHTBQGAZuvaQS3wjj2es=;
  b=ai4PoPe7XUT5AICthO3DdZmeTN84hhSOHmkMHeg3OgMlYF1gL427Ahqw
   vX9H1SsCew7VItwQqJSo+hVQXPaP7beEs6y9eV0ZCqcV810Vi4eOIFXm7
   XKo19aGXZXxoafy+/r38wazC8Xw9fLn9Ef2rnMpY/ftLwboD8MpVGw+O5
   /kUZQLol8pQHxc+NcmgQTJD22B47BXffhWFMQQ5/ApIGQdsCjCNVXC/O+
   TM48CwVHVMcAgcATNLne3EzECD8DA4LOh7X7nAnzaLjODdFlpVK49LJ3V
   7WQBudnGBRteTaNUcpR6LOKPlmlwuThI6H+TW3ZbZMEogMCF7n+AUNZfK
   A==;
X-CSE-ConnectionGUID: HgJj70cmQtOZrERUBf3swQ==
X-CSE-MsgGUID: UOQe5pdnTl+H0vadg5v5kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29621387"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29621387"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 15:32:56 -0700
X-CSE-ConnectionGUID: pLu5Ej4uSpuJvA8bOuqcDg==
X-CSE-MsgGUID: hNE8jaLcQjWnCMY2HJmflw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="104762286"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2024 15:32:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Bob-000b2o-1T;
	Sun, 27 Oct 2024 22:32:53 +0000
Date: Mon, 28 Oct 2024 06:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 91/260] fs/xfs/xfs_rtalloc.c:954:2-8:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202410280611.xn1J7FRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   2792e4ed621f2c3f6ea732ee146797b27fa3b608
commit: e0bdb91d92d21a1a237532f78549e172aad0021e [91/260] xfs: move RT bitmap and summary information to the rtgroup
config: mips-randconfig-r061-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280611.xn1J7FRq-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280611.xn1J7FRq-lkp@intel.com/

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
