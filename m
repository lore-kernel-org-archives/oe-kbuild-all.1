Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D825E2DE6E0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 20:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487522; cv=none; b=tWiEVEipzHH1QSydYa+M0B+oSF4VcEXW7l1gaGQJPrfxQhveetjUcR/lO7lLx2h8nG28OCW8faCIVYiogamt6IXROVoTujazLKiZqdxKTHPLv012H920SdTc8GlO2t2XLvOzs0w9DciErUFNMnIOHUgFxoq3j7ppq9wrHruPbQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487522; c=relaxed/simple;
	bh=HlkQsamFszYsgCbOxXdWBnXvqQOqoTBu+F/8c4jiEfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OrZK5btWCod5JvfuyXJi4HuWp+TIuIYJTtajNgetFqc5TG1xIkQnXs1PAjh6qv/RiY4+/kfFChbDXhA7afcZBNM+LNqZocIDeIazZJW5Rn4hyAWuqdEXph0duhc+eaMOSBLWUDixZjYQUXRVDSeUyFSDsNDU1Gq3YEmHE0ihHdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HowIU9xJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HowIU9xJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751487520; x=1783023520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HlkQsamFszYsgCbOxXdWBnXvqQOqoTBu+F/8c4jiEfk=;
  b=HowIU9xJPfE2PxiPI7LDPrh6oDE8ksNR/EsxeDl5pn5cGDU9aCT2kULG
   h5odI2vVlns4r2aNruh+U1Qlv9wshVkXH00hlPJxQtxWU6YEkMYwNBmJc
   1ESgh61ttl4N/VDccTGFOzNFd/q/6KCiW+RPIfMlg9MzW4BPfber1+MjQ
   aTsPH6jIIZWF7w3fQ+N2PNFDc7y6GX1dTWHns3ypV2GP2TFyGWsg5tzh4
   0UixUCkwIOmmQO9eT4K/fPouWzSyqGLQEd612Bocu9v9ILkTPwS4WmBg6
   YJWWTzL2Catl6HPjvx8gHN0i5jitgXvn1Tj8SL2Ll8NqHpp2fl7qLUMD1
   Q==;
X-CSE-ConnectionGUID: xxkiOy1tQRuRN6vEllvk+w==
X-CSE-MsgGUID: Bz0DipO5SqyKg8ei7F25sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53525054"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="53525054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 13:18:39 -0700
X-CSE-ConnectionGUID: fAVl1c/CTuWYNdKN6qWH8A==
X-CSE-MsgGUID: gFag3g/GSgW67CFxSsP36Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="158212872"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jul 2025 13:18:38 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX3ud-0000Kn-2q;
	Wed, 02 Jul 2025 20:18:35 +0000
Date: Wed, 2 Jul 2025 22:17:49 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Nan <linan122@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] block/bio.c:412: warning: Function
 parameter or member 'nr_iovecs_int' not described in 'bio_alloc_bioset'
Message-ID: <202507022225.Wumm759A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4755f6a2b98f251edcf63f98f416b5d76425f8c
commit: 6381672514c4d94637cd4db830b8644440abe99a [2882/2882] block: fix kabi broken
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507022225.Wumm759A-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022225.Wumm759A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022225.Wumm759A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bio.c:412: warning: Function parameter or member 'nr_iovecs_int' not described in 'bio_alloc_bioset'
>> block/bio.c:412: warning: Excess function parameter 'nr_iovecs' description in 'bio_alloc_bioset'


vim +412 block/bio.c

df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  374  
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  375  /**
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  376   * bio_alloc_bioset - allocate a bio for I/O
519c8e9ffd8614 block/bio.c Randy Dunlap        2017-10-16  377   * @gfp_mask:   the GFP_* mask given to the slab allocator
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  378   * @nr_iovecs:	number of iovecs to pre-allocate
db18efac0bd644 fs/bio.c    Jaak Ristioja       2010-01-15  379   * @bs:		the bio_set to allocate from.
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  380   *
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  381   * Description:
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  382   *   If @bs is NULL, uses kmalloc() to allocate the bio; else the allocation is
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  383   *   backed by the @bs's mempool.
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  384   *
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  385   *   When @bs is not NULL, if %__GFP_DIRECT_RECLAIM is set then bio_alloc will
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  386   *   always be able to allocate a bio. This is due to the mempool guarantees.
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  387   *   To make this work, callers must never allocate more than 1 bio at a time
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  388   *   from this pool. Callers that need to allocate more than 1 bio must always
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  389   *   submit the previously allocated bio for IO before attempting to allocate
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  390   *   a new one. Failure to do so can cause deadlocks under memory pressure.
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  391   *
ed00aabd5eb9fb block/bio.c Christoph Hellwig   2020-07-01  392   *   Note that when running under submit_bio_noacct() (i.e. any block
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  393   *   driver), bios are not submitted until after you return - see the code in
ed00aabd5eb9fb block/bio.c Christoph Hellwig   2020-07-01  394   *   submit_bio_noacct() that converts recursion into iteration, to prevent
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  395   *   stack overflows.
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  396   *
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  397   *   This would normally mean allocating multiple bios under
ed00aabd5eb9fb block/bio.c Christoph Hellwig   2020-07-01  398   *   submit_bio_noacct() would be susceptible to deadlocks, but we have
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  399   *   deadlock avoidance code that resubmits any blocked bios from a rescuer
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  400   *   thread.
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  401   *
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  402   *   However, we do not guarantee forward progress for allocations from other
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  403   *   mempools. Doing multiple allocations from the same mempool under
ed00aabd5eb9fb block/bio.c Christoph Hellwig   2020-07-01  404   *   submit_bio_noacct() should be avoided - instead, use bio_set's front_pad
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  405   *   for per bio allocations.
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  406   *
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  407   *   RETURNS:
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  408   *   Pointer to new bio on success, NULL on failure.
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  409   */
6381672514c4d9 block/bio.c Li Lingfeng         2025-02-10  410  struct bio *bio_alloc_bioset(gfp_t gfp_mask, unsigned int nr_iovecs_int,
7a88fa19194458 block/bio.c Dan Carpenter       2017-03-23  411  			     struct bio_set *bs)
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16 @412  {
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  413  	gfp_t saved_gfp = gfp_mask;
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  414  	unsigned front_pad;
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  415  	unsigned inline_vecs;
34053979fb1d92 fs/bio.c    Ingo Molnar         2009-02-21  416  	struct bio_vec *bvl = NULL;
451a9ebf653d28 fs/bio.c    Tejun Heo           2009-04-15  417  	struct bio *bio;
451a9ebf653d28 fs/bio.c    Tejun Heo           2009-04-15  418  	void *p;
6381672514c4d9 block/bio.c Li Lingfeng         2025-02-10  419  	unsigned short nr_iovecs = (unsigned short)nr_iovecs_int;
0a0d96b03a1f3b fs/bio.c    Jens Axboe          2008-09-11  420  
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  421  	if (!bs) {
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  422  		if (nr_iovecs > UIO_MAXIOV)
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  423  			return NULL;
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  424  
1f4fe21cf45c79 block/bio.c Gustavo A. R. Silva 2020-06-19  425  		p = kmalloc(struct_size(bio, bi_inline_vecs, nr_iovecs), gfp_mask);
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  426  		front_pad = 0;
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  427  		inline_vecs = nr_iovecs;
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  428  	} else {
d8f429e1669b97 block/bio.c Junichi Nomura      2014-10-03  429  		/* should not use nobvec bioset for nr_iovecs > 0 */
8aa6ba2f6e3dea block/bio.c Kent Overstreet     2018-05-08  430  		if (WARN_ON_ONCE(!mempool_initialized(&bs->bvec_pool) &&
8aa6ba2f6e3dea block/bio.c Kent Overstreet     2018-05-08  431  				 nr_iovecs > 0))
d8f429e1669b97 block/bio.c Junichi Nomura      2014-10-03  432  			return NULL;
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  433  		/*
ed00aabd5eb9fb block/bio.c Christoph Hellwig   2020-07-01  434  		 * submit_bio_noacct() converts recursion to iteration; this
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  435  		 * means if we're running beneath it, any bios we allocate and
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  436  		 * submit will not be submitted (and thus freed) until after we
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  437  		 * return.
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  438  		 *
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  439  		 * This exposes us to a potential deadlock if we allocate
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  440  		 * multiple bios from the same bio_set() while running
ed00aabd5eb9fb block/bio.c Christoph Hellwig   2020-07-01  441  		 * underneath submit_bio_noacct(). If we were to allocate
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  442  		 * multiple bios (say a stacking block driver that was splitting
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  443  		 * bios), we would deadlock if we exhausted the mempool's
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  444  		 * reserve.
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  445  		 *
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  446  		 * We solve this, and guarantee forward progress, with a rescuer
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  447  		 * workqueue per bio_set. If we go to allocate and there are
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  448  		 * bios on current->bio_list, we first try the allocation
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  449  		 * without __GFP_DIRECT_RECLAIM; if that fails, we punt those
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  450  		 * bios we would be blocking to the rescuer workqueue before
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  451  		 * we retry with the original gfp_flags.
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  452  		 */
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  453  
f5fe1b51905df7 block/bio.c NeilBrown           2017-03-10  454  		if (current->bio_list &&
f5fe1b51905df7 block/bio.c NeilBrown           2017-03-10  455  		    (!bio_list_empty(&current->bio_list[0]) ||
47e0fb461fca1a block/bio.c NeilBrown           2017-06-18  456  		     !bio_list_empty(&current->bio_list[1])) &&
47e0fb461fca1a block/bio.c NeilBrown           2017-06-18  457  		    bs->rescue_workqueue)
d0164adc89f6bb block/bio.c Mel Gorman          2015-11-06  458  			gfp_mask &= ~__GFP_DIRECT_RECLAIM;
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  459  
8aa6ba2f6e3dea block/bio.c Kent Overstreet     2018-05-08  460  		p = mempool_alloc(&bs->bio_pool, gfp_mask);
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  461  		if (!p && gfp_mask != saved_gfp) {
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  462  			punt_bios_to_rescuer(bs);
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  463  			gfp_mask = saved_gfp;
8aa6ba2f6e3dea block/bio.c Kent Overstreet     2018-05-08  464  			p = mempool_alloc(&bs->bio_pool, gfp_mask);
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  465  		}
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  466  
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  467  		front_pad = bs->front_pad;
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  468  		inline_vecs = BIO_INLINE_VECS;
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  469  	}
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  470  
451a9ebf653d28 fs/bio.c    Tejun Heo           2009-04-15  471  	if (unlikely(!p))
451a9ebf653d28 fs/bio.c    Tejun Heo           2009-04-15  472  		return NULL;
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  473  
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  474  	bio = p + front_pad;
3a83f4677539bc block/bio.c Ming Lei            2016-11-22  475  	bio_init(bio, NULL, 0);
34053979fb1d92 fs/bio.c    Ingo Molnar         2009-02-21  476  
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  477  	if (nr_iovecs > inline_vecs) {
ed996a52c868b6 block/bio.c Christoph Hellwig   2016-07-19  478  
958384da6a734e block/bio.c Christoph Hellwig   2025-02-10  479  		bvl = bvec_alloc(&bs->bvec_pool, &nr_iovecs, gfp_mask);
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  480  		if (!bvl && gfp_mask != saved_gfp) {
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  481  			punt_bios_to_rescuer(bs);
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  482  			gfp_mask = saved_gfp;
958384da6a734e block/bio.c Christoph Hellwig   2025-02-10  483  			bvl = bvec_alloc(&bs->bvec_pool, &nr_iovecs, gfp_mask);
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  484  		}
df2cb6daa4cbc3 fs/bio.c    Kent Overstreet     2012-09-10  485  
34053979fb1d92 fs/bio.c    Ingo Molnar         2009-02-21  486  		if (unlikely(!bvl))
34053979fb1d92 fs/bio.c    Ingo Molnar         2009-02-21  487  			goto err_free;
a38352e0ac02db fs/bio.c    Kent Overstreet     2012-05-25  488  
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  489  	} else if (nr_iovecs) {
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  490  		bvl = bio->bi_inline_vecs;
392ddc32982a5c fs/bio.c    Jens Axboe          2008-12-23  491  	}
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  492  
3f86a82aeb03e6 fs/bio.c    Kent Overstreet     2012-09-06  493  	bio->bi_pool = bs;
392ddc32982a5c fs/bio.c    Jens Axboe          2008-12-23  494  	bio->bi_max_vecs = nr_iovecs;
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  495  	bio->bi_io_vec = bvl;
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  496  	return bio;
34053979fb1d92 fs/bio.c    Ingo Molnar         2009-02-21  497  
34053979fb1d92 fs/bio.c    Ingo Molnar         2009-02-21  498  err_free:
8aa6ba2f6e3dea block/bio.c Kent Overstreet     2018-05-08  499  	mempool_free(p, &bs->bio_pool);
34053979fb1d92 fs/bio.c    Ingo Molnar         2009-02-21  500  	return NULL;
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  501  }
a112a71d45b5e4 fs/bio.c    H Hartley Sweeten   2009-09-26  502  EXPORT_SYMBOL(bio_alloc_bioset);
^1da177e4c3f41 fs/bio.c    Linus Torvalds      2005-04-16  503  

:::::: The code at line 412 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
