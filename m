Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7AC3BB59
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723622441; cv=none; b=ES8AziwKG1hNnguo98m7AcgAA0CfU3Prhd4pVmexgCrvnwvF/q2/WfNVv8ue7PHjgjOAdOCOWyn0Fuqvjl9gylEJAuj3ifB1Zyp6ci2iyMccIRDrsfV6ZI82jVf9o7axfwE9kuo//9dJBJZ4r00j16lxW8LUiOW+7Rzz1VpJHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723622441; c=relaxed/simple;
	bh=apFONbPpKT4O8oRt35ROspmj11gJ8fds4cOYTAlARe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWoE717apdFSRB6uCSKQux6nTYRNiZTFQKX861wdVUdRrK0P+yYw2jDIM6Ne2aW3STOkNq9RgYipXb8Irn49bEU0KhqNfUb5Wb/e2vxtMpKPkz7xg8A0nq5rtXxZhuuJX5xtjEOGUdVmbQYX23NP2qg0h5dIS9dQQYs2IyVwR00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f828858b; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f828858b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723622438; x=1755158438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apFONbPpKT4O8oRt35ROspmj11gJ8fds4cOYTAlARe8=;
  b=f828858beRU+lyQYQl26gwN28akBwC7Py9WBVnL2QYw9as0w2yDBTHoU
   vPXRICIWwBYs7CiuTDj/pldyy4gth5M3AWHutCIIE5DnzpWnTCjUZNHRk
   k3gJHPYoayLgsedWHYjj5H8KM1uCRat8zSL+/8r12qAVSUukebSw4Obxl
   1qA7TqV9/hm/0PvaInAYkwur4stb5olaMPqv+eBSe7QihQuz7wEJOBxD+
   SK0eDyLHjrQkAJRtMB4+3QgMTiKJoFc2kRZ2VuZaHvXAwyQD33wyGJTEM
   HPAf+mIvBTnOaUjkKmEI5rtQ9LxxtTrd8PRDmO9H12a9VRIsA+2NRXMjG
   A==;
X-CSE-ConnectionGUID: CQxHEbvZSAOePdXndstykA==
X-CSE-MsgGUID: WaqpzPKFQCGwSi3ZGmxPow==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21990405"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="21990405"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 01:00:37 -0700
X-CSE-ConnectionGUID: x5P3R/LQRCGzn++Tz6t8nA==
X-CSE-MsgGUID: 3menQJB2Qge5QAjQA9to/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="59693242"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2024 01:00:37 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se8vq-0001S6-25;
	Wed, 14 Aug 2024 08:00:34 +0000
Date: Wed, 14 Aug 2024 16:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 74/253] fs/xfs/scrub/bmap.c:320:10: error: call
 to undeclared function 'xchk_rtgroup_init_existing'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202408141514.cTve64e7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   dabb7872a6f25b04b590e544cc0f5f3ac560194e
commit: 28ae2dcb31232d44a72cc966cd4c4768eadd720d [74/253] xfs: move RT bitmap and summary information to the rtgroup
config: i386-buildonly-randconfig-002-20240814 (https://download.01.org/0day-ci/archive/20240814/202408141514.cTve64e7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141514.cTve64e7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141514.cTve64e7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/bmap.c:320:10: error: call to undeclared function 'xchk_rtgroup_init_existing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     320 |         error = xchk_rtgroup_init_existing(info->sc,
         |                 ^
   fs/xfs/scrub/bmap.c:320:10: note: did you mean 'xchk_ag_init_existing'?
   fs/xfs/scrub/common.h:113:1: note: 'xchk_ag_init_existing' declared here
     113 | xchk_ag_init_existing(
         | ^
   1 error generated.


vim +/xchk_rtgroup_init_existing +320 fs/xfs/scrub/bmap.c

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
