Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F34A39
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 06:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695017384; x=1726553384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BrgKV46b3zzb+uZG7+HlWSJRNYyEbPDMmsqlmKIXWp4=;
  b=UU+WvM1v9GpqGXelOsm2rMmqGPpLJ9yYuUiN6zBJI74nK2FGx9HPpQwq
   7lKeO3NJyxhF7UTBFIMhU2V4H/JoqT8go4pqGPnGNaeduF6fSMzwohN2R
   DstP+OHyVvtHHgR1o6B5b3vmKknrOycWSWsQOoXE6yGFn3afl/brhdnMs
   +xzLkXotnygOjJygMdEVnM9bx1BS+aKQy2DgiK1G+9AUiK8q6OPg+qgRU
   oCfjITVqoHDT4gYi5SgdZt2r18HvWR2LjD3cP4FVoIcVvAV2+6vcUIw/g
   VDJgyFBUNZZ5ijgdLYZrXatH/Euf5I5rxNrK3p4VVur55IaG7fYWhov3M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="465919653"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="465919653"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 23:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="739002896"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="739002896"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Sep 2023 23:09:22 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi7Rg-0005nk-0d;
	Mon, 18 Sep 2023 06:09:20 +0000
Date: Mon, 18 Sep 2023 14:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:v6.6-rc2-lbs-nobdev 17/23] mm/readahead.c:631:28: error: too
 few arguments to function 'get_next_ra_size'
Message-ID: <202309181316.51cnv1EJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git v6.6-rc2-lbs-nobdev
head:   15dc5c18a451d583ac8ff439ff9c1be3f0619c37
commit: 90b09f81e584e156c201f916aca965eea3607f6d [17/23] readahead: set the minimum ra size in get_(init|next)_ra
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230918/202309181316.51cnv1EJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309181316.51cnv1EJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309181316.51cnv1EJ-lkp@intel.com/

Note: the mcgrof/v6.6-rc2-lbs-nobdev HEAD 15dc5c18a451d583ac8ff439ff9c1be3f0619c37 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   mm/readahead.c: In function 'ondemand_readahead':
>> mm/readahead.c:631:28: error: too few arguments to function 'get_next_ra_size'
     631 |                 ra->size = get_next_ra_size(ra, max_pages);
         |                            ^~~~~~~~~~~~~~~~
   mm/readahead.c:396:22: note: declared here
     396 | static unsigned long get_next_ra_size(struct file_ra_state *ra,
         |                      ^~~~~~~~~~~~~~~~
   mm/readahead.c:656:28: error: too few arguments to function 'get_next_ra_size'
     656 |                 ra->size = get_next_ra_size(ra, max_pages);
         |                            ^~~~~~~~~~~~~~~~
   mm/readahead.c:396:22: note: declared here
     396 | static unsigned long get_next_ra_size(struct file_ra_state *ra,
         |                      ^~~~~~~~~~~~~~~~
>> mm/readahead.c:693:20: error: too few arguments to function 'get_init_ra_size'
     693 |         ra->size = get_init_ra_size(req_size, max_pages);
         |                    ^~~~~~~~~~~~~~~~
   mm/readahead.c:366:22: note: declared here
     366 | static unsigned long get_init_ra_size(unsigned long size,
         |                      ^~~~~~~~~~~~~~~~
   mm/readahead.c:704:29: error: too few arguments to function 'get_next_ra_size'
     704 |                 add_pages = get_next_ra_size(ra, max_pages);
         |                             ^~~~~~~~~~~~~~~~
   mm/readahead.c:396:22: note: declared here
     396 | static unsigned long get_next_ra_size(struct file_ra_state *ra,
         |                      ^~~~~~~~~~~~~~~~


vim +/get_next_ra_size +631 mm/readahead.c

793917d997df2e Matthew Wilcox (Oracle  2020-02-05  595) 
122a21d11cbfda Fengguang Wu            2007-07-19  596  /*
122a21d11cbfda Fengguang Wu            2007-07-19  597   * A minimal readahead algorithm for trivial sequential/random reads.
122a21d11cbfda Fengguang Wu            2007-07-19  598   */
6e4af69ae9b7ca David Howells           2020-10-15  599  static void ondemand_readahead(struct readahead_control *ractl,
793917d997df2e Matthew Wilcox (Oracle  2020-02-05  600) 		struct folio *folio, unsigned long req_size)
122a21d11cbfda Fengguang Wu            2007-07-19  601  {
6e4af69ae9b7ca David Howells           2020-10-15  602  	struct backing_dev_info *bdi = inode_to_bdi(ractl->mapping->host);
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  603) 	struct file_ra_state *ra = ractl->ra;
9491ae4aade681 Jens Axboe              2016-12-12  604  	unsigned long max_pages = ra->ra_pages;
dc30b96ab6d569 Markus Stockhausen      2018-07-27  605  	unsigned long add_pages;
b9ff43dd27434d Matthew Wilcox (Oracle  2022-04-27  606) 	pgoff_t index = readahead_index(ractl);
b9ff43dd27434d Matthew Wilcox (Oracle  2022-04-27  607) 	pgoff_t expected, prev_index;
b9ff43dd27434d Matthew Wilcox (Oracle  2022-04-27  608) 	unsigned int order = folio ? folio_order(folio) : 0;
045a2529a3513f Wu Fengguang            2009-06-16  609  
9491ae4aade681 Jens Axboe              2016-12-12  610  	/*
9491ae4aade681 Jens Axboe              2016-12-12  611  	 * If the request exceeds the readahead window, allow the read to
9491ae4aade681 Jens Axboe              2016-12-12  612  	 * be up to the optimal hardware IO size
9491ae4aade681 Jens Axboe              2016-12-12  613  	 */
9491ae4aade681 Jens Axboe              2016-12-12  614  	if (req_size > max_pages && bdi->io_pages > max_pages)
9491ae4aade681 Jens Axboe              2016-12-12  615  		max_pages = min(req_size, bdi->io_pages);
9491ae4aade681 Jens Axboe              2016-12-12  616  
045a2529a3513f Wu Fengguang            2009-06-16  617  	/*
045a2529a3513f Wu Fengguang            2009-06-16  618  	 * start of file
045a2529a3513f Wu Fengguang            2009-06-16  619  	 */
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  620) 	if (!index)
045a2529a3513f Wu Fengguang            2009-06-16  621  		goto initial_readahead;
122a21d11cbfda Fengguang Wu            2007-07-19  622  
122a21d11cbfda Fengguang Wu            2007-07-19  623  	/*
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  624) 	 * It's the expected callback index, assume sequential access.
122a21d11cbfda Fengguang Wu            2007-07-19  625  	 * Ramp up sizes, and push forward the readahead window.
122a21d11cbfda Fengguang Wu            2007-07-19  626  	 */
b9ff43dd27434d Matthew Wilcox (Oracle  2022-04-27  627) 	expected = round_up(ra->start + ra->size - ra->async_size,
b9ff43dd27434d Matthew Wilcox (Oracle  2022-04-27  628) 			1UL << order);
b9ff43dd27434d Matthew Wilcox (Oracle  2022-04-27  629) 	if (index == expected || index == (ra->start + ra->size)) {
f9acc8c7b35a10 Fengguang Wu            2007-07-19  630  		ra->start += ra->size;
9491ae4aade681 Jens Axboe              2016-12-12 @631  		ra->size = get_next_ra_size(ra, max_pages);
f9acc8c7b35a10 Fengguang Wu            2007-07-19  632  		ra->async_size = ra->size;
f9acc8c7b35a10 Fengguang Wu            2007-07-19  633  		goto readit;
122a21d11cbfda Fengguang Wu            2007-07-19  634  	}
122a21d11cbfda Fengguang Wu            2007-07-19  635  
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  636  	/*
793917d997df2e Matthew Wilcox (Oracle  2020-02-05  637) 	 * Hit a marked folio without valid readahead state.
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  638  	 * E.g. interleaved reads.
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  639  	 * Query the pagecache for async_size, which normally equals to
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  640  	 * readahead size. Ramp it up and use it as the new readahead size.
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  641  	 */
793917d997df2e Matthew Wilcox (Oracle  2020-02-05  642) 	if (folio) {
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  643  		pgoff_t start;
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  644  
30002ed2e41830 Nicholas Piggin         2008-07-25  645  		rcu_read_lock();
6e4af69ae9b7ca David Howells           2020-10-15  646  		start = page_cache_next_miss(ractl->mapping, index + 1,
6e4af69ae9b7ca David Howells           2020-10-15  647  				max_pages);
30002ed2e41830 Nicholas Piggin         2008-07-25  648  		rcu_read_unlock();
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  649  
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  650) 		if (!start || start - index > max_pages)
9a42823a102eb1 Matthew Wilcox (Oracle  2020-06-01  651) 			return;
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  652  
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  653  		ra->start = start;
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  654) 		ra->size = start - index;	/* old async_size */
160334a0cfa8e5 Wu Fengguang            2009-06-16  655  		ra->size += req_size;
9491ae4aade681 Jens Axboe              2016-12-12  656  		ra->size = get_next_ra_size(ra, max_pages);
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  657  		ra->async_size = ra->size;
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  658  		goto readit;
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  659  	}
6b10c6c9fbfe75 Fengguang Wu            2007-10-16  660  
122a21d11cbfda Fengguang Wu            2007-07-19  661  	/*
045a2529a3513f Wu Fengguang            2009-06-16  662  	 * oversize read
122a21d11cbfda Fengguang Wu            2007-07-19  663  	 */
9491ae4aade681 Jens Axboe              2016-12-12  664  	if (req_size > max_pages)
045a2529a3513f Wu Fengguang            2009-06-16  665  		goto initial_readahead;
045a2529a3513f Wu Fengguang            2009-06-16  666  
045a2529a3513f Wu Fengguang            2009-06-16  667  	/*
045a2529a3513f Wu Fengguang            2009-06-16  668  	 * sequential cache miss
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  669) 	 * trivial case: (index - prev_index) == 1
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  670) 	 * unaligned reads: (index - prev_index) == 0
045a2529a3513f Wu Fengguang            2009-06-16  671  	 */
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  672) 	prev_index = (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  673) 	if (index - prev_index <= 1UL)
045a2529a3513f Wu Fengguang            2009-06-16  674  		goto initial_readahead;
045a2529a3513f Wu Fengguang            2009-06-16  675  
10be0b372cac50 Wu Fengguang            2009-06-16  676  	/*
10be0b372cac50 Wu Fengguang            2009-06-16  677  	 * Query the page cache and look for the traces(cached history pages)
10be0b372cac50 Wu Fengguang            2009-06-16  678  	 * that a sequential stream would leave behind.
10be0b372cac50 Wu Fengguang            2009-06-16  679  	 */
6e4af69ae9b7ca David Howells           2020-10-15  680  	if (try_context_readahead(ractl->mapping, ra, index, req_size,
6e4af69ae9b7ca David Howells           2020-10-15  681  			max_pages))
10be0b372cac50 Wu Fengguang            2009-06-16  682  		goto readit;
10be0b372cac50 Wu Fengguang            2009-06-16  683  
045a2529a3513f Wu Fengguang            2009-06-16  684  	/*
045a2529a3513f Wu Fengguang            2009-06-16  685  	 * standalone, small random read
045a2529a3513f Wu Fengguang            2009-06-16  686  	 * Read as is, and do not pollute the readahead state.
045a2529a3513f Wu Fengguang            2009-06-16  687  	 */
6e4af69ae9b7ca David Howells           2020-10-15  688  	do_page_cache_ra(ractl, req_size, 0);
9a42823a102eb1 Matthew Wilcox (Oracle  2020-06-01  689) 	return;
045a2529a3513f Wu Fengguang            2009-06-16  690  
045a2529a3513f Wu Fengguang            2009-06-16  691  initial_readahead:
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  692) 	ra->start = index;
9491ae4aade681 Jens Axboe              2016-12-12 @693  	ra->size = get_init_ra_size(req_size, max_pages);
f9acc8c7b35a10 Fengguang Wu            2007-07-19  694  	ra->async_size = ra->size > req_size ? ra->size - req_size : ra->size;
122a21d11cbfda Fengguang Wu            2007-07-19  695  
f9acc8c7b35a10 Fengguang Wu            2007-07-19  696  readit:
51daa88ebd8e0d Wu Fengguang            2009-06-16  697  	/*
51daa88ebd8e0d Wu Fengguang            2009-06-16  698  	 * Will this read hit the readahead marker made by itself?
51daa88ebd8e0d Wu Fengguang            2009-06-16  699  	 * If so, trigger the readahead marker hit now, and merge
51daa88ebd8e0d Wu Fengguang            2009-06-16  700  	 * the resulted next readahead window into the current one.
dc30b96ab6d569 Markus Stockhausen      2018-07-27  701  	 * Take care of maximum IO pages as above.
51daa88ebd8e0d Wu Fengguang            2009-06-16  702  	 */
08eb9658ae128d Matthew Wilcox (Oracle  2020-06-01  703) 	if (index == ra->start && ra->size == ra->async_size) {
dc30b96ab6d569 Markus Stockhausen      2018-07-27  704  		add_pages = get_next_ra_size(ra, max_pages);
dc30b96ab6d569 Markus Stockhausen      2018-07-27  705  		if (ra->size + add_pages <= max_pages) {
dc30b96ab6d569 Markus Stockhausen      2018-07-27  706  			ra->async_size = add_pages;
dc30b96ab6d569 Markus Stockhausen      2018-07-27  707  			ra->size += add_pages;
dc30b96ab6d569 Markus Stockhausen      2018-07-27  708  		} else {
dc30b96ab6d569 Markus Stockhausen      2018-07-27  709  			ra->size = max_pages;
dc30b96ab6d569 Markus Stockhausen      2018-07-27  710  			ra->async_size = max_pages >> 1;
dc30b96ab6d569 Markus Stockhausen      2018-07-27  711  		}
51daa88ebd8e0d Wu Fengguang            2009-06-16  712  	}
51daa88ebd8e0d Wu Fengguang            2009-06-16  713  
6e4af69ae9b7ca David Howells           2020-10-15  714  	ractl->_index = ra->start;
b9ff43dd27434d Matthew Wilcox (Oracle  2022-04-27  715) 	page_cache_ra_order(ractl, ra, order);
122a21d11cbfda Fengguang Wu            2007-07-19  716  }
122a21d11cbfda Fengguang Wu            2007-07-19  717  

:::::: The code at line 631 was first introduced by commit
:::::: 9491ae4aade6814afcfa67f4eb3e3342c2b39750 mm: don't cap request size based on read-ahead setting

:::::: TO: Jens Axboe <axboe@fb.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
