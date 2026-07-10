Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100A407CDE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 10:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679249; cv=none; b=X/Ynr83RvOtshTw681iCh2Df6W0/dmfuTLT8WOtPqULeyYEpaeCe2SF6wFLc27qhASflBpkv3Hm0P9/DMlL33XT0ZvzRXbyE67X5JKrIdnYTSicmfdxBO0zPv9BBPwBp5dCImKTbq5N0cPki9ih38SCVCjoqhYbbIXlXCGN2Myw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679249; c=relaxed/simple;
	bh=mhPGSnPdBe2MFyGan0qQW5s2waschGrSZcKM/yxQiOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s4Si6AB0cXVHoOj2msVgTexwfBKeQ0FOagleD0awMp4fA/TOIuxQGVf6eW4H/oyfuR88Le57BWu4EFJD96oDGInxLR86mUnDgWtFBVNeBhMUGEwh5AwNRLRdDwyUFRiYgCP040zQ21okfDhD8kQZmHtl24zfo7QCTDPthCN2PsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctLswm7l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctLswm7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783679248; x=1815215248;
  h=date:from:to:cc:subject:message-id;
  bh=mhPGSnPdBe2MFyGan0qQW5s2waschGrSZcKM/yxQiOY=;
  b=ctLswm7lApZ/6u9i9vsSR7+698kXa/LhMlofqm3GU6a0hFvO/P5s/lEb
   iNCrDPhbYs1Ay/EvGTd1lO5m74ICfHIoFn8ZLYIbGdmklCbT8gtrpCcCH
   zn8wm1P1LrHLsqz1wjJz34kT7rhT3ojiD/cd3RggC7VO5r+dDiwql5Ku+
   nHWAzctJfvjxsbh7RoAn89yxzCoEvcVOCFamsjFfARwPjpTrCRjdAImGc
   z+vQkuEhw9hqsPCHVLsH+6FoWQweGDUcyvPIlCXAIB7ZNXaV37D3A6CoQ
   2zBpKc/zys0YHr9Q/RiGCeeIREHKydWWaCqip9vcREyFC771dI/+DJAhX
   w==;
X-CSE-ConnectionGUID: nxQJn9dLT02OmxfImZFkgw==
X-CSE-MsgGUID: CGuroN++SOKTBitt0EMr5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88061366"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88061366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:27:27 -0700
X-CSE-ConnectionGUID: e4HuxmX3QrGQ4yinTJPJvw==
X-CSE-MsgGUID: JucChakCQW6DThqh6GF3mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254948270"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 10 Jul 2026 03:27:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi8S3-00000000Iq6-0XDE;
	Fri, 10 Jul 2026 10:27:23 +0000
Date: Fri, 10 Jul 2026 18:26:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-9 2/54]
 fs/xfs/scrub/cow_repair.c:322:25: error: implicit declaration of function
 'xrep_cow_debug_replacement'
Message-ID: <202607101853.rjwXcwM9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-9
head:   c6645929a43d37f52f6f7fc791dce4ee4b08c515
commit: 458e9170e2cb4e1f4a90e22396b630dbd430ca28 [2/54] xfs: make cow repair somewhat flaky when debugging knob enabled
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260710/202607101853.rjwXcwM9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101853.rjwXcwM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607101853.rjwXcwM9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/xfs/xfs_platform.h:15,
                    from fs/xfs/scrub/cow_repair.c:6:
   include/linux/highmem.h: In function 'clear_user_pages':
   include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not used [-Wunused-but-set-parameter=]
     234 | static inline void clear_user_pages(void *addr, unsigned long vaddr,
         |                                                 ~~~~~~~~~~~~~~^~~~~
   fs/xfs/scrub/cow_repair.c: In function 'xrep_cow_find_bad':
>> fs/xfs/scrub/cow_repair.c:322:25: error: implicit declaration of function 'xrep_cow_debug_replacement' [-Wimplicit-function-declaration]
     322 |                 error = xrep_cow_debug_replacement(xc);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xrep_cow_debug_replacement +322 fs/xfs/scrub/cow_repair.c

   251	
   252	/*
   253	 * Find any part of the CoW fork mapping that isn't a single-owner CoW staging
   254	 * extent and mark the corresponding part of the file range in the bitmap.
   255	 */
   256	STATIC int
   257	xrep_cow_find_bad(
   258		struct xrep_cow			*xc)
   259	{
   260		struct xfs_refcount_irec	rc_low = { 0 };
   261		struct xfs_refcount_irec	rc_high = { 0 };
   262		struct xfs_rmap_irec		rm_low = { 0 };
   263		struct xfs_rmap_irec		rm_high = { 0 };
   264		struct xfs_perag		*pag;
   265		struct xfs_scrub		*sc = xc->sc;
   266		xfs_agnumber_t			agno;
   267		int				error;
   268	
   269		agno = XFS_FSB_TO_AGNO(sc->mp, xc->irec.br_startblock);
   270		xc->irec_startbno = XFS_FSB_TO_AGBNO(sc->mp, xc->irec.br_startblock);
   271	
   272		pag = xfs_perag_get(sc->mp, agno);
   273		if (!pag)
   274			return -EFSCORRUPTED;
   275	
   276		error = xrep_ag_init(sc, pag, &sc->sa);
   277		if (error)
   278			goto out_pag;
   279	
   280		/* Mark any CoW fork extents that are shared. */
   281		rc_low.rc_startblock = xc->irec_startbno;
   282		rc_high.rc_startblock = xc->irec_startbno + xc->irec.br_blockcount - 1;
   283		rc_low.rc_domain = rc_high.rc_domain = XFS_REFC_DOMAIN_SHARED;
   284		error = xfs_refcount_query_range(sc->sa.refc_cur, &rc_low, &rc_high,
   285				xrep_cow_mark_shared_staging, xc);
   286		if (error)
   287			goto out_sa;
   288	
   289		/* Make sure there are CoW staging extents for the whole mapping. */
   290		rc_low.rc_startblock = xc->irec_startbno;
   291		rc_high.rc_startblock = xc->irec_startbno + xc->irec.br_blockcount - 1;
   292		rc_low.rc_domain = rc_high.rc_domain = XFS_REFC_DOMAIN_COW;
   293		xc->next_bno = xc->irec_startbno;
   294		error = xfs_refcount_query_range(sc->sa.refc_cur, &rc_low, &rc_high,
   295				xrep_cow_mark_missing_staging, xc);
   296		if (error)
   297			goto out_sa;
   298	
   299		if (xc->next_bno < xc->irec_startbno + xc->irec.br_blockcount) {
   300			error = xrep_cow_mark_file_range(xc,
   301					xfs_agbno_to_fsb(pag, xc->next_bno),
   302					xc->irec_startbno + xc->irec.br_blockcount -
   303					xc->next_bno);
   304			if (error)
   305				goto out_sa;
   306		}
   307	
   308		/* Mark any area has an rmap that isn't a COW staging extent. */
   309		rm_low.rm_startblock = xc->irec_startbno;
   310		memset(&rm_high, 0xFF, sizeof(rm_high));
   311		rm_high.rm_startblock = xc->irec_startbno + xc->irec.br_blockcount - 1;
   312		error = xfs_rmap_query_range(sc->sa.rmap_cur, &rm_low, &rm_high,
   313				xrep_cow_mark_missing_staging_rmap, xc);
   314		if (error)
   315			goto out_sa;
   316	
   317		/*
   318		 * If userspace is forcing us to rebuild the CoW fork or someone turned
   319		 * on the debugging knob, replace everything in the CoW fork.
   320		 */
   321		if (XFS_TEST_ERROR(sc->mp, XFS_ERRTAG_FORCE_SCRUB_REPAIR))
 > 322			error = xrep_cow_debug_replacement(xc);
   323		else if (sc->sm->sm_flags & XFS_SCRUB_IFLAG_FORCE_REBUILD)
   324			error = xrep_cow_mark_file_range(xc, xc->irec.br_startblock,
   325					xc->irec.br_blockcount);
   326	
   327	out_sa:
   328		xchk_ag_free(sc, &sc->sa);
   329	out_pag:
   330		xfs_perag_put(pag);
   331		return error;
   332	}
   333	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
