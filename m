Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A7D30FF08
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060282; cv=none; b=rBkYGCcXUumVxkrhqPs/UgIautx2znoqHHH8FizF91SLmjVEOhUd0SYcIl9/EpWNQ1IgUeYT5TIKUHASOWBLbAVwmEi4k64UZOyEkcydooVuqDyG74zaiaPbya8gaAhUoYbOQY7Zce1EPKR8j/9WL99w0HHpIV/DDO90SSi0tB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060282; c=relaxed/simple;
	bh=obpo/Iv8TFMIJTpPqvUWtfswY5Dl6yJaQRPvQbAkW6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pbs2c+I0yRZqblunRuackIbADzclRksrKQkN5X48o8ueredLvYMJyGV290cLBFDI90CdRCoyMIoNJHjynmX9iwiRXWKc2POp7ntRSotc5ASkjmhlD276g5fkO70ezvtwWAGKDihtH4X1Njo4YqVW1wta75PSUQOKI/1dQgClPWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9WyGOak; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9WyGOak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780060280; x=1811596280;
  h=date:from:to:cc:subject:message-id;
  bh=obpo/Iv8TFMIJTpPqvUWtfswY5Dl6yJaQRPvQbAkW6c=;
  b=O9WyGOak0+I7cYbuJk4+knBZGDVw0uZzaeo9mjdilrDZz93eYHjCHQH7
   /1q6duX0DpeCIzTnvGgYjvRNsRz6DlS5IYk9QDWlm5JQk7KpKN87+XL2n
   2GGQ5eLu3Vg6YvlvjC8zmdCfCqwOnjQE7N5SK6VLV8p3rGEehgx1TK7QE
   8y4E+z4WmP7eo2R+lHZwHyuGXk1CYYSgYILwJq54IQYvQFB6TunQgr1kz
   RlrojDdy8WZKEAv7HOcr5k3olO+QO2BGHodMsdfdoFyJxxuqegFIEyl2T
   fOd+J7uWx9F/Vv7ItfX5rzba6mBQExK6DpVXN4/FPDv0Z4yd+vzH+kNeS
   w==;
X-CSE-ConnectionGUID: MPXYKiTtRNyWk3W6oy44lA==
X-CSE-MsgGUID: amOEvkIwT6SY+ifckYNrXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80939480"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80939480"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 06:11:20 -0700
X-CSE-ConnectionGUID: iI/j7fSxTa2dhug6Ravi/Q==
X-CSE-MsgGUID: k8ErDR5cTQm3xxs9+PbgPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247786186"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 06:11:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSwzb-000000007GQ-3djD;
	Fri, 29 May 2026 13:11:15 +0000
Date: Fri, 29 May 2026 21:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-shrink-imap 10/13]
 fs/xfs/libxfs/xfs_ialloc.c:2519:7: warning: variable 'offset' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202605292130.xN6Lhdip-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-shrink-imap
head:   e316cb0d2b6ae2043a6dc33a026a7179afc4fae7
commit: 4a64a1927678239ab8292f0593acb1300489daf8 [10/13] xfs: cleanup xfs_imap
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260529/202605292130.xN6Lhdip-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605292130.xN6Lhdip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605292130.xN6Lhdip-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_ialloc.c:2519:7: warning: variable 'offset' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2519 |                 if (M_IGEO(mp)->blocks_per_cluster == 1) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_mount.h:354:21: note: expanded from macro 'M_IGEO'
     354 | #define M_IGEO(mp)              (&(mp)->m_ino_geo)
         |                                 ^
   fs/xfs/libxfs/xfs_ialloc.c:2554:38: note: uninitialized use occurs here
    2554 |         imap->im_boffset = (unsigned short)(offset << mp->m_sb.sb_inodelog);
         |                                             ^~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:2519:3: note: remove the 'if' if its condition is always false
    2519 |                 if (M_IGEO(mp)->blocks_per_cluster == 1) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2520 |                         cluster_agbno = agbno;
         |                         ~~~~~~~~~~~~~~~~~~~~~~
    2521 |                         goto out;
         |                         ~~~~~~~~~
    2522 |                 }
         |                 ~
   fs/xfs/libxfs/xfs_ialloc.c:2469:14: note: initialize the variable 'offset' to silence this warning
    2469 |         int                     offset; /* index of inode in its buffer */
         |                                       ^
         |                                        = 0
   1 warning generated.


vim +2519 fs/xfs/libxfs/xfs_ialloc.c

7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2451  
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2452  /*
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2453   * Return the location of the inode in imap, for mapping it into a buffer.
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2454   */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2455  int
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2456  xfs_imap(
498f0adbcdb6a6 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2023-02-13  2457  	struct xfs_perag	*pag,
498f0adbcdb6a6 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2023-02-13  2458  	struct xfs_trans	*tp,
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2459  	xfs_ino_t		ino,	/* inode to locate */
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2460  	struct xfs_imap		*imap,	/* location map structure */
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2461  	uint			flags)	/* flags for inode btree lookup */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2462  {
e9c4d8bfb26c13 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2024-11-03  2463  	struct xfs_mount	*mp = pag_mount(pag);
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2464  	xfs_agblock_t		agbno;	/* block number of inode in the alloc group */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2465  	xfs_agino_t		agino;	/* inode number within alloc group */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2466  	xfs_agblock_t		chunk_agbno;	/* first block in inode chunk */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2467  	xfs_agblock_t		cluster_agbno;	/* first block in inode cluster */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2468  	int			error;	/* error code */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2469  	int			offset;	/* index of inode in its buffer */
836a94ad59bf6c fs/xfs/xfs_ialloc.c        Dave Chinner      2013-08-12  2470  	xfs_agblock_t		offset_agbno;	/* blks from chunk start to inode */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2471  
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2472  	ASSERT(ino != NULLFSINO);
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2473  
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2474  	/*
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2475  	 * Split up the inode number into its parts.
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2476  	 */
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2477  	agino = XFS_INO_TO_AGINO(mp, ino);
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2478  	agbno = XFS_AGINO_TO_AGBNO(mp, agino);
13325333582d48 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2024-11-13  2479  	if (agbno >= xfs_ag_block_count(mp, pag_agno(pag)) ||
6abd82ab6ea484 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2024-11-03  2480  	    ino != xfs_agino_to_ino(pag, agino)) {
7b13c515518264 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2021-06-02  2481  		error = -EINVAL;
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2482  #ifdef DEBUG
1920779e67cbf5 fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2483  		/*
1920779e67cbf5 fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2484  		 * Don't output diagnostic information for untrusted inodes
1920779e67cbf5 fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2485  		 * as they can be invalid without implying corruption.
1920779e67cbf5 fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2486  		 */
1920779e67cbf5 fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2487  		if (flags & XFS_IGET_UNTRUSTED)
498f0adbcdb6a6 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2023-02-13  2488  			return error;
13325333582d48 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2024-11-13  2489  		if (agbno >= xfs_ag_block_count(mp, pag_agno(pag))) {
5348778699bba9 fs/xfs/xfs_ialloc.c        Dave Chinner      2011-03-07  2490  			xfs_alert(mp,
5348778699bba9 fs/xfs/xfs_ialloc.c        Dave Chinner      2011-03-07  2491  		"%s: agbno (0x%llx) >= mp->m_sb.sb_agblocks (0x%lx)",
5348778699bba9 fs/xfs/xfs_ialloc.c        Dave Chinner      2011-03-07  2492  				__func__, (unsigned long long)agbno,
13325333582d48 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2024-11-13  2493  				(unsigned long)xfs_ag_block_count(mp,
13325333582d48 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2024-11-13  2494  							pag_agno(pag)));
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2495  		}
6abd82ab6ea484 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2024-11-03  2496  		if (ino != xfs_agino_to_ino(pag, agino)) {
5348778699bba9 fs/xfs/xfs_ialloc.c        Dave Chinner      2011-03-07  2497  			xfs_alert(mp,
6abd82ab6ea484 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2024-11-03  2498  		"%s: ino (0x%llx) != xfs_agino_to_ino() (0x%llx)",
5348778699bba9 fs/xfs/xfs_ialloc.c        Dave Chinner      2011-03-07  2499  				__func__, ino,
6abd82ab6ea484 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2024-11-03  2500  				xfs_agino_to_ino(pag, agino));
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2501  		}
745b1f47fc0c68 fs/xfs/xfs_ialloc.c        Nathan Scott      2006-09-28  2502  		xfs_stack_trace();
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2503  #endif /* DEBUG */
498f0adbcdb6a6 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2023-02-13  2504  		return error;
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2505  	}
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2506  
7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2507  	/*
7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2508  	 * For bulkstat and handle lookups, we have an untrusted inode number
7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2509  	 * that we have to verify is valid. We cannot do this just by reading
7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2510  	 * the inode buffer as it may have been unlinked and removed leaving
7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2511  	 * inodes in stale state on disk. Hence we have to do a btree lookup
7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2512  	 * in all cases where an untrusted inode number is passed.
7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2513  	 */
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2514  	if (!(flags & XFS_IGET_UNTRUSTED)) {
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2515  		/*
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2516  		 * If the inode cluster size is the same as the blocksize or
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2517  		 * smaller, we get to the buffer by simple arithmetics.
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2518  		 */
ef325959993edd fs/xfs/libxfs/xfs_ialloc.c Darrick J. Wong   2019-06-05 @2519  		if (M_IGEO(mp)->blocks_per_cluster == 1) {
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2520  			cluster_agbno = agbno;
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2521  			goto out;
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2522  		}
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2523  
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2524  		/*
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2525  		 * If the inode chunks are aligned then use simple maths to find
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2526  		 * the location.
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2527  		 */
ef325959993edd fs/xfs/libxfs/xfs_ialloc.c Darrick J. Wong   2019-06-05  2528  		if (M_IGEO(mp)->inoalign_mask) {
ef325959993edd fs/xfs/libxfs/xfs_ialloc.c Darrick J. Wong   2019-06-05  2529  			offset_agbno = agbno & M_IGEO(mp)->inoalign_mask;
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2530  			chunk_agbno = agbno - offset_agbno;
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2531  			goto out_map;
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2532  		}
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2533  
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2534  		/*
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2535  		 * Otherwise we have to do a btree lookup to find the location.
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2536  		 */
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2537  	}
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2538  
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2539  	error = xfs_imap_lookup(pag, tp, agino, agbno, &chunk_agbno,
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2540  			&offset_agbno, flags);
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2541  	if (error)
498f0adbcdb6a6 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2023-02-13  2542  		return error;
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2543  
7124fe0a5b619d fs/xfs/xfs_ialloc.c        Dave Chinner      2010-06-24  2544  out_map:
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2545  	ASSERT(agbno >= chunk_agbno);
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2546  	cluster_agbno = chunk_agbno +
ef325959993edd fs/xfs/libxfs/xfs_ialloc.c Darrick J. Wong   2019-06-05  2547  		((offset_agbno / M_IGEO(mp)->blocks_per_cluster) *
ef325959993edd fs/xfs/libxfs/xfs_ialloc.c Darrick J. Wong   2019-06-05  2548  		 M_IGEO(mp)->blocks_per_cluster);
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2549  	offset = ((agbno - cluster_agbno) * mp->m_sb.sb_inopblock) +
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2550  		XFS_INO_TO_OFFSET(mp, ino);
4a64a192767823 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2026-05-28  2551  out:
856a920ac2bbb2 fs/xfs/libxfs/xfs_ialloc.c Christoph Hellwig 2024-11-03  2552  	imap->im_blkno = xfs_agbno_to_daddr(pag, cluster_agbno);
ef325959993edd fs/xfs/libxfs/xfs_ialloc.c Darrick J. Wong   2019-06-05  2553  	imap->im_len = XFS_FSB_TO_BB(mp, M_IGEO(mp)->blocks_per_cluster);
755c7bf5ddcaf8 fs/xfs/libxfs/xfs_ialloc.c Darrick J. Wong   2016-11-08  2554  	imap->im_boffset = (unsigned short)(offset << mp->m_sb.sb_inodelog);
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2555  
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2556  	/*
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2557  	 * If the inode number maps to a block outside the bounds
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2558  	 * of the file system then return NULL rather than calling
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2559  	 * read_buf and panicing when we get an error from the
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2560  	 * driver.
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2561  	 */
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2562  	if ((imap->im_blkno + imap->im_len) >
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2563  	    XFS_FSB_TO_BB(mp, mp->m_sb.sb_dblocks)) {
5348778699bba9 fs/xfs/xfs_ialloc.c        Dave Chinner      2011-03-07  2564  		xfs_alert(mp,
5348778699bba9 fs/xfs/xfs_ialloc.c        Dave Chinner      2011-03-07  2565  	"%s: (im_blkno (0x%llx) + im_len (0x%llx)) > sb_dblocks (0x%llx)",
5348778699bba9 fs/xfs/xfs_ialloc.c        Dave Chinner      2011-03-07  2566  			__func__, (unsigned long long) imap->im_blkno,
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2567  			(unsigned long long) imap->im_len,
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2568  			XFS_FSB_TO_BB(mp, mp->m_sb.sb_dblocks));
498f0adbcdb6a6 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2023-02-13  2569  		return -EINVAL;
94e1b69d1abd10 fs/xfs/xfs_ialloc.c        Christoph Hellwig 2008-11-28  2570  	}
498f0adbcdb6a6 fs/xfs/libxfs/xfs_ialloc.c Dave Chinner      2023-02-13  2571  	return 0;
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2572  }
^1da177e4c3f41 fs/xfs/xfs_ialloc.c        Linus Torvalds    2005-04-16  2573  

:::::: The code at line 2519 was first introduced by commit
:::::: ef325959993edd53e3ce7c818b18f776ac0740a6 xfs: separate inode geometry

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
