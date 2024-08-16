Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB731BE258
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723838416; cv=none; b=UFWN8oyTvIimyLpJkjzaIk+SWKgXxZnrQnVjEXM2D93FLCBU38D9FOXO2pP/70+v6Gf9FUeNCLDaXV7uq0IVBpOS7EEz/8xy3YLU64P7wnxKYLxUH6GFZruXfZdWyEcl8vc9OvUpi9DUa2yuFggEcneH4TXAgKqFk5Ez+UW+3lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723838416; c=relaxed/simple;
	bh=5MrK5geaO74aKEhbt7HBpJq0e0WBCIb0yOfULd39CZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OJKt2dHCmv1iDjqFWTT29xtOdtwNWpGbjTeiSLTsOH2XOjWgafMZZfP2ZrgeOutOgGWknKfakuQAHX9dSVPQpOjTQ7uLLUf8eX/0eJtjG+YdEkteNR3kuweqA7Z1u5DciuH9dCkiJmR0YWRtRAaQuDzdVGpfdqvgPYZyoBw7YAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLKt/ZGe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLKt/ZGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723838415; x=1755374415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5MrK5geaO74aKEhbt7HBpJq0e0WBCIb0yOfULd39CZs=;
  b=ZLKt/ZGeW9AK/Pe+gDnv8+GNiChxApEW4IIFWi10olgj2X5eB5e0+bTp
   oGj4RDaTrKaO9PDSpRYcrJTOV070BjlxKsFhX0j6ZQ2pufeORxHIL9ECo
   Z7MgZAUhL6zhftaWDshjwnzvw3TA2ldalroyF2NdnQzIKrFSQ4XKo6px9
   yB1xXtjevNCZzt2RCLKmSuESf4yt4z/DmqJVycOLRPL7NVG0LpRenG2Op
   YbyJj77zZM5VK8DgNJT3Itc6gch1QDb+zAefNA86KIs645a9X/Uuq5Iq7
   UBKt9OADJOU40iy9CoXBGhAe0dJUnBRyxIjKikI77kJkm9AjU4ax3YUYB
   g==;
X-CSE-ConnectionGUID: 5VxcjFrpR1q4b5n+TB4+kw==
X-CSE-MsgGUID: H1XSNKo6TP6CVZBCvQmjVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22319057"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22319057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 13:00:14 -0700
X-CSE-ConnectionGUID: sZq0qqdJQcSFGsqZ7b+Nbw==
X-CSE-MsgGUID: gILSqDrEQxOeKbFK+e8yqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="64721120"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2024 13:00:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf37L-0006tA-1R;
	Fri, 16 Aug 2024 20:00:11 +0000
Date: Sat, 17 Aug 2024 03:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 75/253] fs/xfs/scrub/bmap.c:320:17: error:
 implicit declaration of function 'xchk_rtgroup_init_existing'; did you mean
 'xchk_ag_init_existing'?
Message-ID: <202408170335.NDao6sKd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   69e65efda7ca3f0b4a7fbf15a350611261769077
commit: dfce4a26676fa28f5f442069a95aba44fe9c1268 [75/253] xfs: move RT bitmap and summary information to the rtgroup
config: i386-randconfig-002-20240817 (https://download.01.org/0day-ci/archive/20240817/202408170335.NDao6sKd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170335.NDao6sKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170335.NDao6sKd-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/bmap.c: In function 'xchk_bmap_rt_iextent_xref':
>> fs/xfs/scrub/bmap.c:320:17: error: implicit declaration of function 'xchk_rtgroup_init_existing'; did you mean 'xchk_ag_init_existing'? [-Werror=implicit-function-declaration]
     320 |         error = xchk_rtgroup_init_existing(info->sc,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 xchk_ag_init_existing
   cc1: some warnings being treated as errors


vim +320 fs/xfs/scrub/bmap.c

   310	
   311	/* Cross-reference a single rtdev extent record. */
   312	STATIC void
   313	xchk_bmap_rt_iextent_xref(
   314		struct xfs_inode	*ip,
   315		struct xchk_bmap_info	*info,
   316		struct xfs_bmbt_irec	*irec)
   317	{
   318		int			error;
   319	
 > 320		error = xchk_rtgroup_init_existing(info->sc,
   321				xfs_rtb_to_rgno(ip->i_mount, irec->br_startblock),
   322				&info->sc->sr);
   323		if (!xchk_fblock_process_error(info->sc, info->whichfork,
   324				irec->br_startoff, &error))
   325			return;
   326	
   327		xchk_rtgroup_lock(&info->sc->sr, XCHK_RTGLOCK_ALL);
   328		xchk_xref_is_used_rt_space(info->sc, irec->br_startblock,
   329				irec->br_blockcount);
   330	
   331		xchk_rtgroup_free(info->sc, &info->sc->sr);
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
