Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB393246781
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 00:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782953836; cv=none; b=FVmW4tnf3zCrRa5i4+TPyAKJAFIjMkJXmamcFyYLk9g1McMQFS7wJtEf3k9UWA7CYLic4uiIA71mfP5qXSmLl0A8Jb3q+GqVknT048sV6ywD/MJ33Q475U76igp6phNFKurKwVnd5PsWzDW17vReeXjJ+t6leUThr0dOz1TRIdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782953836; c=relaxed/simple;
	bh=uD4msB2rQRksHUn7qRQK191AppmN7HMuMW6A+tl51+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FHOpxqaiMaEESzvxnLKh54ZidrSIuTf+rVqCOeLMRH363eQPdzQ7kzVFo3AZ7Qsc0zTcHgmZt2elhNYK6yCpUxT93s0y2HHCwXxshCMmrayqch4p8inEZ26vSotT8He9KAzx2sRkelQhEyoZWQEUXbhT2DzQxRi3IteK/rW3c4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kp1zzD4u; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kp1zzD4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782953835; x=1814489835;
  h=date:from:to:cc:subject:message-id;
  bh=uD4msB2rQRksHUn7qRQK191AppmN7HMuMW6A+tl51+I=;
  b=Kp1zzD4u/x7HGsIS9jcFPWelIh+XNQPFVYTEt4iaSAeUt1jRi8sBadCr
   hRUDzXw/6W6YLlhihw9zM7Y0Qq0wrVJVS7cbSnArnUFgAYvyOj9lAP3SZ
   5DSjjeP8stxp8oIsboxbkjfP7LL8nlGfKLJe2bI/Ka6u35JrlV3BPRZYv
   h0iipF3AVXREOImeeVdsL95KvyXUhSZe/VZChindELs/1JeGq3N5cvbqF
   2AdTQJQxoB6DdEpjWRz0i/C/3OgIrtS3yXHml0e6C57LDbSAXT+KRego6
   ley+CxgtXdkpky44ZVJHIEahTOVVVTu9ly2SWE6319W8Dz1Nd7lESRc6i
   Q==;
X-CSE-ConnectionGUID: fvEX9R76SMGcexotbIw1FQ==
X-CSE-MsgGUID: lVXoVxwvTTCdgreiXPWIWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83828532"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83828532"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 17:57:12 -0700
X-CSE-ConnectionGUID: LGNHyjIYQai0xPEVD90PCQ==
X-CSE-MsgGUID: K4919hRETJas6sxpK8Bg0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="254643805"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jul 2026 17:57:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf5jo-000000009o5-0nvI;
	Thu, 02 Jul 2026 00:57:08 +0000
Date: Thu, 02 Jul 2026 08:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 8/13] block/blk-map.c:626:47:
 sparse: sparse: incorrect type in argument 4 (different base types)
Message-ID: <202607020854.oEUwARTt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: b88f2bfe111b8778c8bba9e0309c653966171bdd [8/13] block: bounce passthrough bios through iobuf pool folios
config: i386-randconfig-063-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020854.oEUwARTt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020854.oEUwARTt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020854.oEUwARTt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-map.c:626:47: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int op @@     got restricted blk_opf_t enum req_op @@
   block/blk-map.c:626:47: sparse:     expected unsigned int op
   block/blk-map.c:626:47: sparse:     got restricted blk_opf_t enum req_op

vim +626 block/blk-map.c

   529	
   530	/**
   531	 * bio_copy_user_iov_iobuf - copy user data using pool-allocated folios
   532	 *
   533	 * Maps user I/O into a bio using higher-order folios from the queue's iobuf
   534	 * pool.  Falls back to page-by-page allocation if pool is exhausted or the
   535	 * request is not aligned.
   536	 *
   537	 * Returns 0 on success (pool or fallback), <0 on hard error.
   538	 */
   539	static int bio_copy_user_iov_iobuf(struct request *rq, struct iov_iter *iter,
   540					   gfp_t gfp_mask)
   541	{
   542		struct request_queue *q = rq->q;
   543		struct bio_iobuf_data *ibd;
   544		struct folio **folios;
   545		unsigned long len = iter->count;
   546		unsigned int folio_size = blk_iobuf_pool_folio_size(q);
   547		unsigned int nr_folios;
   548		struct bio *bio;
   549		unsigned int i;
   550		int ret;
   551	
   552		/* Only handle whole-folio-aligned sizes for now */
   553		if (!IS_ALIGNED(len, folio_size))
   554			return -EREMOTEIO;
   555	
   556		nr_folios = DIV_ROUND_UP(len, folio_size);
   557	
   558		/*
   559		 * Allocate ibd without the bmd.iov[] flexible array: for writes
   560		 * we don't need the original iov after copy_from_iter, and for reads
   561		 * (not yet implemented) we'll revisit.  The separate folios array
   562		 * tracks pool allocations; iov overlap with flex array is avoided.
   563		 */
   564		ibd = kzalloc(sizeof(*ibd), gfp_mask);
   565		if (!ibd)
   566			return -ENOMEM;
   567	
   568		folios = kcalloc(nr_folios, sizeof(*folios), gfp_mask);
   569		if (!folios) {
   570			kfree(ibd);
   571			return -ENOMEM;
   572		}
   573	
   574		for (i = 0; i < nr_folios; i++) {
   575			folios[i] = blk_iobuf_alloc_folio(q,
   576					(gfp_mask | __GFP_NOWARN) & ~__GFP_DIRECT_RECLAIM);
   577			if (!folios[i]) {
   578				/* Pool exhausted; log fallback and bail */
   579				blk_iobuf_inc_fallback(q);
   580				trace_block_iobuf_fallback(q, "pool_exhausted");
   581				ret = -EREMOTEIO;
   582				goto free_folios;
   583			}
   584		}
   585	
   586		bio = blk_rq_map_bio_alloc(rq, nr_folios, gfp_mask);
   587		if (!bio) {
   588			ret = -ENOMEM;
   589			goto free_folios;
   590		}
   591	
   592		for (i = 0; i < nr_folios; i++) {
   593			unsigned int chunk = min_t(unsigned long, len, folio_size);
   594	
   595			if (!bio_add_folio(bio, folios[i], chunk, 0)) {
   596				ret = -EINVAL;
   597				goto put_bio;
   598			}
   599			len -= chunk;
   600		}
   601	
   602		ibd->bmd.is_our_pages   = true;
   603		ibd->bmd.is_null_mapped = false;
   604		ibd->bmd.is_iobuf       = true;
   605		ibd->q         = q;
   606		ibd->folios    = folios;
   607		ibd->nr_folios = nr_folios;
   608	
   609		if (iov_iter_rw(iter) == WRITE) {
   610			ret = bio_copy_from_iter(bio, iter);
   611			if (ret)
   612				goto put_bio;
   613		} else {
   614			zero_fill_bio(bio);
   615			iov_iter_advance(iter, bio->bi_iter.bi_size);
   616		}
   617	
   618		bio->bi_private = ibd;
   619		bio->bi_end_io = NULL;		/* bio_uncopy_user_iobuf called on unmap */
   620	
   621		ret = blk_rq_append_bio(rq, bio);
   622		if (ret)
   623			goto put_bio;
   624	
   625		trace_block_iobuf_bounce_submit(q, bio->bi_iter.bi_size, nr_folios,
 > 626						bio_op(bio));
   627		return 0;
   628	
   629	put_bio:
   630		blk_mq_map_bio_put(bio);
   631	free_folios:
   632		for (i = 0; i < nr_folios; i++)
   633			if (folios[i])
   634				blk_iobuf_free_folio(q, folios[i]);
   635		kfree(folios);
   636		kfree(ibd);
   637		return ret;
   638	}
   639	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
