Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC63233944
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 08:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140212; cv=none; b=Y+rC/t43lqTG9EhKVhJof+UiUfNCOu39PJUfl4t/O3fBwAnrFAZfnB6FDWKzlLXYPJ9Gm7uBQJcwhhqrVphA97auawhAJug/gVUrMNMcBD9r9dUg/wULNv4NmnMs9bPWVbiGLIF1ZlUGYBCwhoYCLHesuHc6d6Ybrxc92sdusMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140212; c=relaxed/simple;
	bh=RdekNtR2VcIGeP61XNbZwSawkL41X7QJ5Iq9qAzYAYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=awFOpjayrPOpH8Dzmc23BhO2TS/xuQUauCmjRzTU8PokP+yfNxBB0Oa7DJ/ACbfbvNBbreTWUMy/KoQJRMt0KM3PGrPhZaX1m11mpcSxYue9MIulHV49ritUYKM8GsYWB0HvwlVsQIs0dx1WlX6AbBEid5ShdUgXh0a8WEDmTd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6L36Oup; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6L36Oup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785140210; x=1816676210;
  h=date:from:to:cc:subject:message-id;
  bh=RdekNtR2VcIGeP61XNbZwSawkL41X7QJ5Iq9qAzYAYc=;
  b=Z6L36OupORaSTuhl7clhaTY6MspHPyYYzPu1qhjWix5x/vOrLfrNMUTD
   Ug8WzdLkbgg3OyZhlriCsxN//it9duXhbAtcMeZTUPprRg0TqJAYjW0b3
   ZA/Bnp+dPeCq0wMq4M9D8HiZOUvm7xzVqVP0/ySQR7RCAWyTWW4Rliinj
   Z03Xg7ehNquqATIRHqk3V42Q/sKfvURijaqifcAt6waRlXSe3+8UYG8gD
   P7rt+2nXGMlWe+v6HwhdZOOZ69D+z5qiKjtl4qDctOdM5EOyvL9INYnY8
   Q79H6yILMVb+hqqFkAxnFSjyL95VVdyd8IEMtIpQm8qHmaxkWv8oBMvhw
   A==;
X-CSE-ConnectionGUID: NgzUEdO9Tv6axEIXp7R4tg==
X-CSE-MsgGUID: 76mx4W/bQ/OHmMS/FzZk1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85571790"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85571790"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 01:16:49 -0700
X-CSE-ConnectionGUID: JkTo2ClbQzis6zUJF3r4og==
X-CSE-MsgGUID: 86Eaq/ajQfadEi5jejKFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="262838833"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 Jul 2026 01:16:48 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woGVx-000000001Y6-3YkJ;
	Mon, 27 Jul 2026 08:16:45 +0000
Date: Mon, 27 Jul 2026 10:16:39 +0200
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-24 132/140]
 fs/xfs/scrub/dir_repair.c:777:73: error: 'ino' undeclared; did you mean
 'int'?
Message-ID: <202607271004.nV4Uz9yC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-24
head:   a0c02c40791d6f966d57e1054cb802a6016933c0
commit: c709e2bbff2c468b5adc159df3b51d3eddbe05a4 [132/140] xfs: be extra careful about replacement directory construction
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260727/202607271004.nV4Uz9yC-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271004.nV4Uz9yC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607271004.nV4Uz9yC-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/dir_repair.c: In function 'xrep_dir_replay_update':
>> fs/xfs/scrub/dir_repair.c:777:73: error: 'ino' undeclared (first use in this function); did you mean 'int'?
     777 |                 error = xchk_dir_lookup(rd->sc, rd->sc->tempip, xname, &ino);
         |                                                                         ^~~
         |                                                                         int
   fs/xfs/scrub/dir_repair.c:777:73: note: each undeclared identifier is reported only once for each function it appears in


vim +777 fs/xfs/scrub/dir_repair.c

8559b21a64d983 Darrick J. Wong   2024-04-22  741  
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  742  /*
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  743   * Add this stashed incore directory entry to the temporary directory.
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  744   * The caller must hold the tempdir's IOLOCK, must not hold any ILOCKs, and
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  745   * must not be in transaction context.
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  746   */
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  747  STATIC int
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  748  xrep_dir_replay_update(
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  749  	struct xrep_dir			*rd,
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  750  	const struct xfs_name		*xname,
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  751  	const struct xrep_dirent	*dirent)
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  752  {
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  753  	struct xfs_mount		*mp = rd->sc->mp;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  754  #ifdef DEBUG
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  755  	xfs_ino_t			ino;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  756  #endif
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  757  	uint				resblks;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  758  	int				error;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  759  
f1097be220fa93 Allison Henderson 2024-04-22  760  	resblks = xfs_link_space_res(mp, xname->len);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  761  	error = xchk_trans_alloc(rd->sc, resblks);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  762  	if (error)
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  763  		return error;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  764  
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  765  	/* Lock the temporary directory and join it to the transaction */
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  766  	xrep_tempfile_ilock(rd->sc);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  767  	xfs_trans_ijoin(rd->sc->tp, rd->sc->tempip, 0);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  768  
8559b21a64d983 Darrick J. Wong   2024-04-22  769  	switch (dirent->action) {
8559b21a64d983 Darrick J. Wong   2024-04-22  770  	case XREP_DIRENT_ADD:
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  771  		/*
8559b21a64d983 Darrick J. Wong   2024-04-22  772  		 * Create a replacement dirent in the temporary directory.
8559b21a64d983 Darrick J. Wong   2024-04-22  773  		 * Note that _createname doesn't check for existing entries.
8559b21a64d983 Darrick J. Wong   2024-04-22  774  		 * There shouldn't be any in the temporary dir, but we'll
8559b21a64d983 Darrick J. Wong   2024-04-22  775  		 * verify this in debug mode.
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  776  		 */
b1991ee3e7cf85 Darrick J. Wong   2024-04-15 @777  		error = xchk_dir_lookup(rd->sc, rd->sc->tempip, xname, &ino);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  778  		if (error != -ENOENT) {
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  779  			ASSERT(error != -ENOENT);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  780  			goto out_cancel;
c709e2bbff2c46 Darrick J. Wong   2026-07-23  781  			error = -EIO;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  782  		}
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  783  
8559b21a64d983 Darrick J. Wong   2024-04-22  784  		error = xrep_dir_replay_createname(rd, xname, dirent->ino,
8559b21a64d983 Darrick J. Wong   2024-04-22  785  				resblks);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  786  		if (error)
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  787  			goto out_cancel;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  788  
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  789  		if (xname->type == XFS_DIR3_FT_DIR)
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  790  			rd->subdirs++;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  791  		rd->dirents++;
8559b21a64d983 Darrick J. Wong   2024-04-22  792  		break;
8559b21a64d983 Darrick J. Wong   2024-04-22  793  	case XREP_DIRENT_REMOVE:
8559b21a64d983 Darrick J. Wong   2024-04-22  794  		/*
8559b21a64d983 Darrick J. Wong   2024-04-22  795  		 * Remove a dirent from the temporary directory.  Note that
8559b21a64d983 Darrick J. Wong   2024-04-22  796  		 * _removename doesn't check the inode target of the exist
8559b21a64d983 Darrick J. Wong   2024-04-22  797  		 * entry.  There should be a perfect match in the temporary
8559b21a64d983 Darrick J. Wong   2024-04-22  798  		 * dir, but we'll verify this in debug mode.
8559b21a64d983 Darrick J. Wong   2024-04-22  799  		 */
8559b21a64d983 Darrick J. Wong   2024-04-22  800  		error = xchk_dir_lookup(rd->sc, rd->sc->tempip, xname, &ino);
8559b21a64d983 Darrick J. Wong   2024-04-22  801  		if (error) {
8559b21a64d983 Darrick J. Wong   2024-04-22  802  			ASSERT(error != 0);
c709e2bbff2c46 Darrick J. Wong   2026-07-23  803  			error = -EIO;
8559b21a64d983 Darrick J. Wong   2024-04-22  804  			goto out_cancel;
8559b21a64d983 Darrick J. Wong   2024-04-22  805  		}
8559b21a64d983 Darrick J. Wong   2024-04-22  806  		if (ino != dirent->ino) {
8559b21a64d983 Darrick J. Wong   2024-04-22  807  			ASSERT(ino == dirent->ino);
8559b21a64d983 Darrick J. Wong   2024-04-22  808  			error = -EIO;
8559b21a64d983 Darrick J. Wong   2024-04-22  809  			goto out_cancel;
8559b21a64d983 Darrick J. Wong   2024-04-22  810  		}
8559b21a64d983 Darrick J. Wong   2024-04-22  811  
8559b21a64d983 Darrick J. Wong   2024-04-22  812  		error = xrep_dir_replay_removename(rd, xname, resblks);
8559b21a64d983 Darrick J. Wong   2024-04-22  813  		if (error)
8559b21a64d983 Darrick J. Wong   2024-04-22  814  			goto out_cancel;
8559b21a64d983 Darrick J. Wong   2024-04-22  815  
8559b21a64d983 Darrick J. Wong   2024-04-22  816  		if (xname->type == XFS_DIR3_FT_DIR)
8559b21a64d983 Darrick J. Wong   2024-04-22  817  			rd->subdirs--;
8559b21a64d983 Darrick J. Wong   2024-04-22  818  		rd->dirents--;
8559b21a64d983 Darrick J. Wong   2024-04-22  819  		break;
8559b21a64d983 Darrick J. Wong   2024-04-22  820  	default:
8559b21a64d983 Darrick J. Wong   2024-04-22  821  		ASSERT(0);
8559b21a64d983 Darrick J. Wong   2024-04-22  822  		error = -EIO;
8559b21a64d983 Darrick J. Wong   2024-04-22  823  		goto out_cancel;
8559b21a64d983 Darrick J. Wong   2024-04-22  824  	}
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  825  
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  826  	/* Commit and unlock. */
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  827  	error = xrep_trans_commit(rd->sc);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  828  	if (error)
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  829  		return error;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  830  
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  831  	xrep_tempfile_iunlock(rd->sc);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  832  	return 0;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  833  out_cancel:
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  834  	xchk_trans_cancel(rd->sc);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  835  	xrep_tempfile_iunlock(rd->sc);
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  836  	return error;
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  837  }
b1991ee3e7cf85 Darrick J. Wong   2024-04-15  838  

:::::: The code at line 777 was first introduced by commit
:::::: b1991ee3e7cf852e95a3498801303cfbb4468681 xfs: online repair of directories

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
