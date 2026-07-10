Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41C3E0255
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670932; cv=none; b=Fjbq8RMdUV1mXWveYT4ljHQ+ar6JBTyWDf1BDn+8FcqEx0U4sJrc/tWbYfHXWpEux269Poylzo/WzHkFKzmJ439Qg2qSdU8KFMWkUm0AilbRppFctAErjiKEbhSHOLXeinVh6AZF6+wKf0k7XH/N8ZIclADrpXdY6IpA8tAawHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670932; c=relaxed/simple;
	bh=iJV3R0DJ1/2Kwv9kQlynFoh6kGvAIMqSD9BSZi2U2MY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gy62AeefB4hDKdH3ksq8XTi0LgxhdSqViDV8TI5eltphxaVCnJYbdjRDlRWKqT3/6edkSV8lMicyPPYcd8Neq4jyxrWOJRRGo+8ojS3M1poNZSG0+2CfH8Ac1PtYAYneNtU8plJcrdpxSQGMGJtdQOJGdAEycPrLdS6awt8LCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP5FEHnM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP5FEHnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783670931; x=1815206931;
  h=date:from:to:cc:subject:message-id;
  bh=iJV3R0DJ1/2Kwv9kQlynFoh6kGvAIMqSD9BSZi2U2MY=;
  b=LP5FEHnM7b4XGubuwAC43I1mjztsMRhMHcerut/ZAu7DwMmwV3soBi/Y
   ilIDFG6Z1eZLlNWlMLFMFtwW7RBoakAaUTGshP1CDzevgI7ZFnbBAaSL1
   5xofs1WP84DLAR0O7XRPumtD8AYJd5rhoqbI7z8xP0jP7K2rTfUvg13ax
   LQgXlWULaHcuMxQNcCtDSpBwZv4ev9jlgWxHCekbAH4WnVrgqIz8UjYvl
   YQQyygiQxKDI9Ov13ynLtD/k/stJ83nncH8wsIVDmtP+QblrNEMTJbyld
   swtYk/9U6WfKfMW7KIQfNZT2JcTJlynILeLjeJxt2AYlsFRAuVH+G9iuV
   A==;
X-CSE-ConnectionGUID: HaKi9n9HTXeXid5ouu/GNQ==
X-CSE-MsgGUID: TrnpT/4aRJi4LXT+d/0ImQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107165820"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107165820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 01:08:51 -0700
X-CSE-ConnectionGUID: uFxk2C6jQvKAUabInr46bQ==
X-CSE-MsgGUID: 47XtGEa5QvmXGspZyeBmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293024205"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Jul 2026 01:08:49 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi6Hu-0000000038b-2Dti;
	Fri, 10 Jul 2026 08:08:46 +0000
Date: Fri, 10 Jul 2026 10:07:48 +0200
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-9 2/54]
 fs/xfs/scrub/cow_repair.c:322:25: error: implicit declaration of function
 'xrep_cow_debug_replacement'
Message-ID: <202607100931.9tPXoUN1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-9
head:   c6645929a43d37f52f6f7fc791dce4ee4b08c515
commit: 458e9170e2cb4e1f4a90e22396b630dbd430ca28 [2/54] xfs: make cow repair somewhat flaky when debugging knob enabled
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260710/202607100931.9tPXoUN1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100931.9tPXoUN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100931.9tPXoUN1-lkp@intel.com/

All errors (new ones prefixed by >>):

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
