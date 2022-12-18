Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA1A2CAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Dec 2022 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671389606; x=1702925606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPPJXXFvVyTK54K3ykrFcCJYEO01tAjHNfZEY/9gsd4=;
  b=Km7my2h/wbG3HWPKKaR31Mc9biYsRh9EMfhXyTaOulwQ47o6rTCY6694
   yW+OoKRSj0YIyJTu2xSOYX/CuCxCpi3dMzJr+D9TXQ/9covSW+jG5Owsz
   jU/Wf7DplyHzK3a7UzMw+4PWol89eeL+chm3mQvpmPYPbBx1IVp5zneUw
   0PaqyVw0UNM27+GCU+9fpdH345DhRQRdyJVjOChNJyxUaNn7vWN2B+l0J
   Tu6OdmbXT1vcKQvYYOZNtF3X5TC/Z24vAvVRHJXisd9oEC+SSDA7+IgNy
   /dzFjK+08TYtWD+HyXERflH92XiKO0XLHpjdAF0jUIUwfonKNMArnmkuj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="346318835"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="346318835"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2022 10:53:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="682799898"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="682799898"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Dec 2022 10:53:23 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6ymp-0008PO-0J;
	Sun, 18 Dec 2022 18:53:23 +0000
Date: Mon, 19 Dec 2022 02:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 535/556]
 fs/xfs/scrub/rtrefcount.c:38:8: warning: Local variable 'error' shadows
 outer variable [shadowVariable]
Message-ID: <202212190237.R5o3MHGr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   957abd6304af2759b5e5564977f40272364cf712
commit: a96f43457988aa2c72488775bcc3bd690cecb9fb [535/556] xfs: online repair of the realtime refcount btree
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a96f43457988aa2c72488775bcc3bd690cecb9fb
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/rtrefcount.c:38:8: warning: Local variable 'error' shadows outer variable [shadowVariable]
     int  error;
          ^
   fs/xfs/scrub/rtrefcount.c:32:8: note: Shadowed declaration
    int   error = 0;
          ^
   fs/xfs/scrub/rtrefcount.c:38:8: note: Shadow variable
     int  error;
          ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/scrub/rtrefcount.c:216:13: warning: Uninitialized variable: frag->rm [uninitvar]
     if (frag->rm.rm_startblock < bno)
               ^
   fs/xfs/scrub/rtrefcount.c:199:16: note: Assuming condition is false
    if (target_nr == 0)
                  ^
   fs/xfs/scrub/rtrefcount.c:216:13: note: Uninitialized variable: frag->rm
     if (frag->rm.rm_startblock < bno)
               ^

vim +/error +38 fs/xfs/scrub/rtrefcount.c

    25	
    26	/* Set us up with the realtime refcount metadata locked. */
    27	int
    28	xchk_setup_rtrefcountbt(
    29		struct xfs_scrub	*sc)
    30	{
    31		struct xfs_rtgroup	*rtg;
    32		int			error = 0;
    33	
    34		if (xchk_need_fshook_drain(sc))
    35			xchk_fshooks_enable(sc, XCHK_FSHOOKS_DRAIN);
    36	
    37		if (xchk_could_repair(sc)) {
  > 38			int		error;
    39	
    40			error = xrep_setup_rtrefcountbt(sc);
    41			if (error)
    42				return error;
    43		}
    44	
    45		rtg = xfs_rtgroup_get(sc->mp, sc->sm->sm_agno);
    46		if (!rtg)
    47			return -ENOENT;
    48	
    49		error = xchk_setup_rt(sc);
    50		if (error)
    51			goto out_rtg;
    52	
    53		error = xchk_install_live_inode(sc, rtg->rtg_refcountip);
    54		if (error)
    55			goto out_rtg;
    56	
    57		error = xchk_ino_dqattach(sc);
    58		if (error)
    59			goto out_rtg;
    60	
    61		error = xchk_rtgroup_init(sc, rtg->rtg_rgno, &sc->sr, XCHK_RTGLOCK_ALL);
    62	out_rtg:
    63		xfs_rtgroup_put(rtg);
    64		return error;
    65	}
    66	
    67	/* Realtime Reference count btree scrubber. */
    68	
    69	/*
    70	 * Confirming Reference Counts via Reverse Mappings
    71	 *
    72	 * We want to count the reverse mappings overlapping a refcount record
    73	 * (bno, len, refcount), allowing for the possibility that some of the
    74	 * overlap may come from smaller adjoining reverse mappings, while some
    75	 * comes from single extents which overlap the range entirely.  The
    76	 * outer loop is as follows:
    77	 *
    78	 * 1. For all reverse mappings overlapping the refcount extent,
    79	 *    a. If a given rmap completely overlaps, mark it as seen.
    80	 *    b. Otherwise, record the fragment (in agbno order) for later
    81	 *       processing.
    82	 *
    83	 * Once we've seen all the rmaps, we know that for all blocks in the
    84	 * refcount record we want to find $refcount owners and we've already
    85	 * visited $seen extents that overlap all the blocks.  Therefore, we
    86	 * need to find ($refcount - $seen) owners for every block in the
    87	 * extent; call that quantity $target_nr.  Proceed as follows:
    88	 *
    89	 * 2. Pull the first $target_nr fragments from the list; all of them
    90	 *    should start at or before the start of the extent.
    91	 *    Call this subset of fragments the working set.
    92	 * 3. Until there are no more unprocessed fragments,
    93	 *    a. Find the shortest fragments in the set and remove them.
    94	 *    b. Note the block number of the end of these fragments.
    95	 *    c. Pull the same number of fragments from the list.  All of these
    96	 *       fragments should start at the block number recorded in the
    97	 *       previous step.
    98	 *    d. Put those fragments in the set.
    99	 * 4. Check that there are $target_nr fragments remaining in the list,
   100	 *    and that they all end at or beyond the end of the refcount extent.
   101	 *
   102	 * If the refcount is correct, all the check conditions in the algorithm
   103	 * should always hold true.  If not, the refcount is incorrect.
   104	 */
   105	struct xchk_rtrefcnt_frag {
   106		struct list_head	list;
   107		struct xfs_rmap_irec	rm;
   108	};
   109	
   110	struct xchk_rtrefcnt_check {
   111		struct xfs_scrub	*sc;
   112		struct list_head	fragments;
   113	
   114		/* refcount extent we're examining */
   115		xfs_rgblock_t		bno;
   116		xfs_extlen_t		len;
   117		xfs_nlink_t		refcount;
   118	
   119		/* number of owners seen */
   120		xfs_nlink_t		seen;
   121	};
   122	
   123	/*
   124	 * Decide if the given rmap is large enough that we can redeem it
   125	 * towards refcount verification now, or if it's a fragment, in
   126	 * which case we'll hang onto it in the hopes that we'll later
   127	 * discover that we've collected exactly the correct number of
   128	 * fragments as the rtrefcountbt says we should have.
   129	 */
   130	STATIC int
   131	xchk_rtrefcountbt_rmap_check(
   132		struct xfs_btree_cur		*cur,
   133		const struct xfs_rmap_irec	*rec,
   134		void				*priv)
   135	{
   136		struct xchk_rtrefcnt_check	*refchk = priv;
   137		struct xchk_rtrefcnt_frag	*frag;
   138		xfs_rgblock_t			rm_last;
   139		xfs_rgblock_t			rc_last;
   140		int				error = 0;
   141	
   142		if (xchk_should_terminate(refchk->sc, &error))
   143			return error;
   144	
   145		rm_last = rec->rm_startblock + rec->rm_blockcount - 1;
   146		rc_last = refchk->bno + refchk->len - 1;
   147	
   148		/* Confirm that a single-owner refc extent is a CoW stage. */
   149		if (refchk->refcount == 1 && rec->rm_owner != XFS_RMAP_OWN_COW) {
   150			xchk_btree_xref_set_corrupt(refchk->sc, cur, 0);
   151			return 0;
   152		}
   153	
   154		if (rec->rm_startblock <= refchk->bno && rm_last >= rc_last) {
   155			/*
   156			 * The rmap overlaps the refcount record, so we can confirm
   157			 * one refcount owner seen.
   158			 */
   159			refchk->seen++;
   160		} else {
   161			/*
   162			 * This rmap covers only part of the refcount record, so
   163			 * save the fragment for later processing.  If the rmapbt
   164			 * is healthy each rmap_irec we see will be in agbno order
   165			 * so we don't need insertion sort here.
   166			 */
   167			frag = kmalloc(sizeof(struct xchk_rtrefcnt_frag),
   168					XCHK_GFP_FLAGS);
   169			if (!frag)
   170				return -ENOMEM;
   171			memcpy(&frag->rm, rec, sizeof(frag->rm));
   172			list_add_tail(&frag->list, &refchk->fragments);
   173		}
   174	
   175		return 0;
   176	}
   177	
   178	/*
   179	 * Given a bunch of rmap fragments, iterate through them, keeping
   180	 * a running tally of the refcount.  If this ever deviates from
   181	 * what we expect (which is the rtrefcountbt's refcount minus the
   182	 * number of extents that totally covered the rtrefcountbt extent),
   183	 * we have a rtrefcountbt error.
   184	 */
   185	STATIC void
   186	xchk_rtrefcountbt_process_rmap_fragments(
   187		struct xchk_rtrefcnt_check	*refchk)
   188	{
   189		struct list_head		worklist;
   190		struct xchk_rtrefcnt_frag	*frag;
   191		struct xchk_rtrefcnt_frag	*n;
   192		xfs_rgblock_t			bno;
   193		xfs_rgblock_t			rbno;
   194		xfs_rgblock_t			next_rbno;
   195		xfs_nlink_t			nr;
   196		xfs_nlink_t			target_nr;
   197	
   198		target_nr = refchk->refcount - refchk->seen;
   199		if (target_nr == 0)
   200			return;
   201	
   202		/*
   203		 * There are (refchk->rc.rc_refcount - refchk->nr refcount)
   204		 * references we haven't found yet.  Pull that many off the
   205		 * fragment list and figure out where the smallest rmap ends
   206		 * (and therefore the next rmap should start).  All the rmaps
   207		 * we pull off should start at or before the beginning of the
   208		 * refcount record's range.
   209		 */
   210		INIT_LIST_HEAD(&worklist);
   211		rbno = NULLRGBLOCK;
   212	
   213		/* Make sure the fragments actually /are/ in bno order. */
   214		bno = 0;
   215		list_for_each_entry(frag, &refchk->fragments, list) {
 > 216			if (frag->rm.rm_startblock < bno)
   217				goto done;
   218			bno = frag->rm.rm_startblock;
   219		}
   220	
   221		/*
   222		 * Find all the rmaps that start at or before the refc extent,
   223		 * and put them on the worklist.
   224		 */
   225		nr = 0;
   226		list_for_each_entry_safe(frag, n, &refchk->fragments, list) {
   227			if (frag->rm.rm_startblock > refchk->bno || nr > target_nr)
   228				break;
   229			bno = frag->rm.rm_startblock + frag->rm.rm_blockcount;
   230			if (bno < rbno)
   231				rbno = bno;
   232			list_move_tail(&frag->list, &worklist);
   233			nr++;
   234		}
   235	
   236		/*
   237		 * We should have found exactly $target_nr rmap fragments starting
   238		 * at or before the refcount extent.
   239		 */
   240		if (nr != target_nr)
   241			goto done;
   242	
   243		while (!list_empty(&refchk->fragments)) {
   244			/* Discard any fragments ending at rbno from the worklist. */
   245			nr = 0;
   246			next_rbno = NULLRGBLOCK;
   247			list_for_each_entry_safe(frag, n, &worklist, list) {
   248				bno = frag->rm.rm_startblock + frag->rm.rm_blockcount;
   249				if (bno != rbno) {
   250					if (bno < next_rbno)
   251						next_rbno = bno;
   252					continue;
   253				}
   254				list_del(&frag->list);
   255				kfree(frag);
   256				nr++;
   257			}
   258	
   259			/* Try to add nr rmaps starting at rbno to the worklist. */
   260			list_for_each_entry_safe(frag, n, &refchk->fragments, list) {
   261				bno = frag->rm.rm_startblock + frag->rm.rm_blockcount;
   262				if (frag->rm.rm_startblock != rbno)
   263					goto done;
   264				list_move_tail(&frag->list, &worklist);
   265				if (next_rbno > bno)
   266					next_rbno = bno;
   267				nr--;
   268				if (nr == 0)
   269					break;
   270			}
   271	
   272			/*
   273			 * If we get here and nr > 0, this means that we added fewer
   274			 * items to the worklist than we discarded because the fragment
   275			 * list ran out of items.  Therefore, we cannot maintain the
   276			 * required refcount.  Something is wrong, so we're done.
   277			 */
   278			if (nr)
   279				goto done;
   280	
   281			rbno = next_rbno;
   282		}
   283	
   284		/*
   285		 * Make sure the last extent we processed ends at or beyond
   286		 * the end of the refcount extent.
   287		 */
   288		if (rbno < refchk->bno + refchk->len)
   289			goto done;
   290	
   291		/* Actually record us having seen the remaining refcount. */
   292		refchk->seen = refchk->refcount;
   293	done:
   294		/* Delete fragments and work list. */
   295		list_for_each_entry_safe(frag, n, &worklist, list) {
   296			list_del(&frag->list);
   297			kfree(frag);
   298		}
   299		list_for_each_entry_safe(frag, n, &refchk->fragments, list) {
   300			list_del(&frag->list);
   301			kfree(frag);
   302		}
   303	}
   304	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
