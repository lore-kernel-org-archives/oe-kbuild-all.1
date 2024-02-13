Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8D5381D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707830458; cv=none; b=hYC6oVxz1gHsxhEtC97V4XIHf7LNSlNtB9y2u+0eRHSwOke+Hlc53v3N8N6YC19i1yT+53shZ5K2VhTnREVBCG+i9uhrb63XhCFH0Hvje7bZYxR9p5xDL+CpvUeJRL/pjoHPcjA5aAUXSVObU0X9PfBUeKT4XSBELG0+OQVZ9BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707830458; c=relaxed/simple;
	bh=ktmXN1BCYGk9TPcoftCkCBLy3pXkaoIoO1NtyK/E9go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sASELhonTbGq1DN6209+t4bMF9ntUYpROOxul57483CL9rfcSN1dwFp3YYL7DoVO3cFRid8Vthch5WsOYqO+m56NOvbtcQHhimxR+QEH6OWx6icCHjfe60mcuAgSDlZdsPW17lUO/FDY1ts1IHCVIdES8rN0+RxVeUvJMuO8av4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcoJ+iaJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcoJ+iaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707830456; x=1739366456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ktmXN1BCYGk9TPcoftCkCBLy3pXkaoIoO1NtyK/E9go=;
  b=TcoJ+iaJz4LYPRJkD+4kUUo//owYUPLf5oT1cKJfP6pVHA8bIs37F2C3
   gYd1P2wkJaX8hCaDeLLMDCaJFk37hXqb3UxXlufMjOGuCESosh/IUqrYk
   RYflPD5YtL0dFRLKZQak/08jT4QzR/YWLvPKiPl1dydN8m7WI8cXZWYUH
   2y5n7mxL20c2B/BTg07pomWz2+o1yDgl+sybH0hPiiWrkuPLVdh526HRu
   qRpzX5U7X4OWXftfFT3yYBSnaPxipfcSdexM0SKisR7TVp7Tjjkqaw8LZ
   90K43Hh8/oCDiMgmqNyex34Q+jQ/ARVLtXanO7chYsVjwC8fiRUPmooo1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1986770"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1986770"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:20:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7522708"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2024 05:20:55 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZsiR-0007k6-2z;
	Tue, 13 Feb 2024 13:20:51 +0000
Date: Tue, 13 Feb 2024 21:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 56/292] fs/xfs/scrub/health.c:187:17:
 warning: variable 'mask' set but not used
Message-ID: <202402132108.X3PJZJJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   670c4f59f7fbaa168381cdf67c052028a539ab0a
commit: 2aef4d5823b54fc871dff30508c6cdbface594d7 [56/292] xfs: remember sick inodes that get inactivated
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240213/202402132108.X3PJZJJq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402132108.X3PJZJJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402132108.X3PJZJJq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/health.c:187:17: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
     187 |                         unsigned int    mask = sc->sick_mask;
         |                                         ^
   1 warning generated.


vim +/mask +187 fs/xfs/scrub/health.c

   151	
   152	/*
   153	 * Update filesystem health assessments based on what we found and did.
   154	 *
   155	 * If the scrubber finds errors, we mark sick whatever's mentioned in
   156	 * sick_mask, no matter whether this is a first scan or an
   157	 * evaluation of repair effectiveness.
   158	 *
   159	 * Otherwise, no direct corruption was found, so mark whatever's in
   160	 * sick_mask as healthy.
   161	 */
   162	void
   163	xchk_update_health(
   164		struct xfs_scrub	*sc)
   165	{
   166		struct xfs_perag	*pag;
   167		bool			bad;
   168	
   169		if (!sc->sick_mask)
   170			return;
   171	
   172		bad = (sc->sm->sm_flags & (XFS_SCRUB_OFLAG_CORRUPT |
   173					   XFS_SCRUB_OFLAG_XCORRUPT));
   174		switch (type_to_health_flag[sc->sm->sm_type].group) {
   175		case XHG_AG:
   176			pag = xfs_perag_get(sc->mp, sc->sm->sm_agno);
   177			if (bad)
   178				xfs_ag_mark_corrupt(pag, sc->sick_mask);
   179			else
   180				xfs_ag_mark_healthy(pag, sc->sick_mask);
   181			xfs_perag_put(pag);
   182			break;
   183		case XHG_INO:
   184			if (!sc->ip)
   185				return;
   186			if (bad) {
 > 187				unsigned int	mask = sc->sick_mask;
   188	
   189				/*
   190				 * If we're coming in for repairs then we don't want
   191				 * sickness flags to propagate to the incore health
   192				 * status if the inode gets inactivated before we can
   193				 * fix it.
   194				 */
   195				if (sc->sm->sm_flags & XFS_SCRUB_IFLAG_REPAIR)
   196					mask |= XFS_SICK_INO_FORGET;
   197				xfs_inode_mark_corrupt(sc->ip, sc->sick_mask);
   198			} else
   199				xfs_inode_mark_healthy(sc->ip, sc->sick_mask);
   200			break;
   201		case XHG_FS:
   202			if (bad)
   203				xfs_fs_mark_corrupt(sc->mp, sc->sick_mask);
   204			else
   205				xfs_fs_mark_healthy(sc->mp, sc->sick_mask);
   206			break;
   207		case XHG_RT:
   208			if (bad)
   209				xfs_rt_mark_corrupt(sc->mp, sc->sick_mask);
   210			else
   211				xfs_rt_mark_healthy(sc->mp, sc->sick_mask);
   212			break;
   213		default:
   214			ASSERT(0);
   215			break;
   216		}
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
