Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256692DF9B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXet/q+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702648063; x=1734184063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VnYEb39WoMfwSCa8az69dDPklvJoPJaPQtSnfRkJEag=;
  b=RXet/q+P8ML1/l2i1zcLKOYI4Tw45jzyT83a8Omz+qVe+2A8OfTWyT3H
   EwfRhCmdAOem2Mr6k2FFXfnBzdnn8/HD5qTk/2kiY6a8Io5uKkHy7qBEo
   9J4S4ajoK98xkG/rmFYkmIRbIjl+PMJVEUIkFH6eVh0RzKVS/scZkaY3V
   mkc93DSPKQMWavgtrqg5cPG9ZT52phy+4Ql5sFDvEyn9sFKIE+gRWwJT2
   KkCBRaQZ+zsot2kmzWuakhQtEdhY96gNfDC4uVrK0HZGGr0wXF43+CAn5
   VXcF9T61bkrRupfRwdf5RY6Jmd4+TwacvJ9+SyCvYRhvvVbLraE8SpXLX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="16829024"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="16829024"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 05:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724466016"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="724466016"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2023 05:47:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE8XQ-0000GM-2a;
	Fri, 15 Dec 2023 13:47:36 +0000
Date: Fri, 15 Dec 2023 21:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Chinner <dchinner@redhat.com>
Subject: fs/xfs/scrub/fscounters.c:227:(.text+0xaa0): relocation truncated to
 fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312152147.JntukftP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f7168591ebf7bbdb91797d02b1afaf00a4289b1
commit: ce85a1e04645b1ed386b074297df27ab5b8801c0 xfs: stabilize fs summary counters for online fsck
date:   4 months ago
config: csky-randconfig-r033-20230427 (https://download.01.org/0day-ci/archive/20231215/202312152147.JntukftP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312152147.JntukftP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312152147.JntukftP-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/fscounters.o: in function `__fatal_signal_pending':
>> include/linux/sched/signal.h:406:(.text+0xa0a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.o: in function `xfs_buf_relse':
>> fs/xfs/xfs_buf.h:285:(.text+0xa2a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/xfs_buf.h:286:(.text+0xa36): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.o: in function `kmalloc_type':
>> include/linux/slab.h:395:(.text+0xa6c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.o: in function `kmalloc':
   include/linux/slab.h:582:(.text+0xa80): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.o: in function `xchk_setup_fscounters':
>> fs/xfs/scrub/fscounters.c:227:(.text+0xaa0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.c:230:(.text+0xaaa): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.c:240:(.text+0xac2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.c:245:(.text+0xad4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.c:218:(.text+0xae0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/xfs/scrub/fscounters.o: in function `xchk_fscounters':
   fs/xfs/scrub/fscounters.c:515:(.text+0xb30): additional relocation overflows omitted from the output


vim +227 fs/xfs/scrub/fscounters.c

ce85a1e04645b1 Darrick J. Wong 2023-08-04  205  
75efa57d0bf5fc Darrick J. Wong 2019-04-25  206  int
75efa57d0bf5fc Darrick J. Wong 2019-04-25  207  xchk_setup_fscounters(
026f57ebe1beea Darrick J. Wong 2021-04-07  208  	struct xfs_scrub	*sc)
75efa57d0bf5fc Darrick J. Wong 2019-04-25  209  {
75efa57d0bf5fc Darrick J. Wong 2019-04-25  210  	struct xchk_fscounters	*fsc;
75efa57d0bf5fc Darrick J. Wong 2019-04-25  211  	int			error;
75efa57d0bf5fc Darrick J. Wong 2019-04-25  212  
466c525d6d35e6 Darrick J. Wong 2023-04-11  213  	/*
466c525d6d35e6 Darrick J. Wong 2023-04-11  214  	 * If the AGF doesn't track btreeblks, we have to lock the AGF to count
466c525d6d35e6 Darrick J. Wong 2023-04-11  215  	 * btree block usage by walking the actual btrees.
466c525d6d35e6 Darrick J. Wong 2023-04-11  216  	 */
466c525d6d35e6 Darrick J. Wong 2023-04-11  217  	if (!xfs_has_lazysbcount(sc->mp))
466c525d6d35e6 Darrick J. Wong 2023-04-11  218  		xchk_fsgates_enable(sc, XCHK_FSGATES_DRAIN);
466c525d6d35e6 Darrick J. Wong 2023-04-11  219  
306195f355bbdc Darrick J. Wong 2022-11-06  220  	sc->buf = kzalloc(sizeof(struct xchk_fscounters), XCHK_GFP_FLAGS);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  221  	if (!sc->buf)
75efa57d0bf5fc Darrick J. Wong 2019-04-25  222  		return -ENOMEM;
ce85a1e04645b1 Darrick J. Wong 2023-08-04  223  	sc->buf_cleanup = xchk_fscounters_cleanup;
75efa57d0bf5fc Darrick J. Wong 2019-04-25  224  	fsc = sc->buf;
e74331d6fa2c21 Darrick J. Wong 2022-11-06  225  	fsc->sc = sc;
75efa57d0bf5fc Darrick J. Wong 2019-04-25  226  
75efa57d0bf5fc Darrick J. Wong 2019-04-25 @227  	xfs_icount_range(sc->mp, &fsc->icount_min, &fsc->icount_max);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  228  
75efa57d0bf5fc Darrick J. Wong 2019-04-25  229  	/* We must get the incore counters set up before we can proceed. */
75efa57d0bf5fc Darrick J. Wong 2019-04-25  230  	error = xchk_fscount_warmup(sc);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  231  	if (error)
75efa57d0bf5fc Darrick J. Wong 2019-04-25  232  		return error;
75efa57d0bf5fc Darrick J. Wong 2019-04-25  233  
ce85a1e04645b1 Darrick J. Wong 2023-08-04  234  	/*
ce85a1e04645b1 Darrick J. Wong 2023-08-04  235  	 * Pause all writer activity in the filesystem while we're scrubbing to
ce85a1e04645b1 Darrick J. Wong 2023-08-04  236  	 * reduce the likelihood of background perturbations to the counters
ce85a1e04645b1 Darrick J. Wong 2023-08-04  237  	 * throwing off our calculations.
ce85a1e04645b1 Darrick J. Wong 2023-08-04  238  	 */
ce85a1e04645b1 Darrick J. Wong 2023-08-04  239  	if (sc->flags & XCHK_TRY_HARDER) {
ce85a1e04645b1 Darrick J. Wong 2023-08-04  240  		error = xchk_fscounters_freeze(sc);
ce85a1e04645b1 Darrick J. Wong 2023-08-04  241  		if (error)
ce85a1e04645b1 Darrick J. Wong 2023-08-04  242  			return error;
ce85a1e04645b1 Darrick J. Wong 2023-08-04  243  	}
ce85a1e04645b1 Darrick J. Wong 2023-08-04  244  
ce85a1e04645b1 Darrick J. Wong 2023-08-04  245  	return xfs_trans_alloc_empty(sc->mp, &sc->tp);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  246  }
75efa57d0bf5fc Darrick J. Wong 2019-04-25  247  

:::::: The code at line 227 was first introduced by commit
:::::: 75efa57d0bf5fcf650a183f0ce0dc011ba8c4bc8 xfs: add online scrub for superblock counters

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
