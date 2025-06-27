Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73B38DF9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046392; cv=none; b=Gt8H7rAb7KP8p9YlsZ2X4RMpoWvHneK0TQNd4KBC+6vVDX9ytzCH//pv/7xDwvDec9p/3uOrIFT4Qfd4bVBIMoWrkoKJWm2NcpY4+nCRLYpSOXDhXwzUoOm+vTVvYPvW9A8raPUczRfcKFN/knW8zSijQ67dNJXKEi8sr6CGngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046392; c=relaxed/simple;
	bh=0fX0nNAtqSqXx0agXfO5z18TKlRfSEq51O8nlk/6ykw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qebhXTmPYNf7zEVxoqz/fC1ZmTmsTAt1j7W0Eo5UCoh+QoDpGQ6L3pXFYKgXcIgnrOKYdWKgMrpzX7oYNOO0RiV2FSmGUSAQ7YgaSZb7b9X5LeYaD7GEiljf75roSp8xg97u5P3kErke7AZ5ellkbBIUbk6ue2bac72ax3vkq/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7ZjyxCz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7ZjyxCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751046391; x=1782582391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fX0nNAtqSqXx0agXfO5z18TKlRfSEq51O8nlk/6ykw=;
  b=b7ZjyxCzx36wiGj4CEdASFBDj8QMH4ykoBuKhXkdK6J50ufr0aHHNMJY
   1aB5GkvehiNn/UOkXMYkpnYBAU+ANv3WiJOnVc5r4hjljy0CfRqdIVylj
   ErSjncJsh/ncyzToIOg/rh5+S+lcoeB+MKXzU/ZBZwQ8JsTZ4v65+UtzG
   WYOA8AwffkMV8WZrCNBswalC5GaqZWUvOKKsvIpy7TH63TyxTYP5yRXBJ
   QXtxg4UIXMx15Fn2vNS0J06E8EIHqjPwF4FHtLBhQ5shH811BL3SIMCEb
   UtDeUve+G4MROZY2Iu0rdNsgtVUjmjprQft+zKdplsFM5TMZmwI8xH1nf
   A==;
X-CSE-ConnectionGUID: pH26jZ54RROJQv42i9eOXQ==
X-CSE-MsgGUID: FaCXE7jPRXiu0corS3r14g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="75913664"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="75913664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 10:46:31 -0700
X-CSE-ConnectionGUID: pJJ04nI1Tyada7v2nSXx2Q==
X-CSE-MsgGUID: 2ZjNM3fzQbeh+zpzlZMQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153400985"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jun 2025 10:46:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVD9f-000WRG-0I;
	Fri, 27 Jun 2025 17:46:27 +0000
Date: Sat, 28 Jun 2025 01:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw-v1-test 7/16] block/blk-merge.c:329:29: warning:
 unused variable 'bytes'
Message-ID: <202506280131.zxaWS6wI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux dmabuf-rw-v1-test
head:   949fb10351aae03bf6ca32fb3c4a714ebaefc9e9
commit: e483c8c11f7f015f2d540fcf6335b69f736938f3 [7/16] bio: introduce dma vector backed bios
config: x86_64-buildonly-randconfig-006-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280131.zxaWS6wI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280131.zxaWS6wI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280131.zxaWS6wI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/blk-merge.c: In function 'bio_split_rw_at':
   block/blk-merge.c:332:72: error: expected ')' before ';' token
     332 |                 return bio_split_rw_at_dmavec(bio, lim, segs, max_bytes;
         |                                              ~                         ^
         |                                                                        )
   block/blk-merge.c:385:38: error: expected ';' before '}' token
     385 |         return bytes >> SECTOR_SHIFT;
         |                                      ^
         |                                      ;
     386 | }
         | ~                                     
>> block/blk-merge.c:329:29: warning: unused variable 'bytes' [-Wunused-variable]
     329 |         unsigned nsegs = 0, bytes = 0;
         |                             ^~~~~
>> block/blk-merge.c:329:18: warning: unused variable 'nsegs' [-Wunused-variable]
     329 |         unsigned nsegs = 0, bytes = 0;
         |                  ^~~~~
>> block/blk-merge.c:328:26: warning: unused variable 'iter' [-Wunused-variable]
     328 |         struct bvec_iter iter;
         |                          ^~~~
>> block/blk-merge.c:327:36: warning: unused variable 'bvprvp' [-Wunused-variable]
     327 |         struct bio_vec bv, bvprv, *bvprvp = NULL;
         |                                    ^~~~~~
>> block/blk-merge.c:327:28: warning: unused variable 'bvprv' [-Wunused-variable]
     327 |         struct bio_vec bv, bvprv, *bvprvp = NULL;
         |                            ^~~~~
>> block/blk-merge.c:327:24: warning: unused variable 'bv' [-Wunused-variable]
     327 |         struct bio_vec bv, bvprv, *bvprvp = NULL;
         |                        ^~
>> block/blk-merge.c:386:1: warning: control reaches end of non-void function [-Wreturn-type]
     386 | }
         | ^
   block/blk-merge.c: At top level:
>> block/blk-merge.c:273:21: warning: 'bio_split_alignment' defined but not used [-Wunused-function]
     273 | static unsigned int bio_split_alignment(struct bio *bio,
         |                     ^~~~~~~~~~~~~~~~~~~


vim +/bytes +329 block/blk-merge.c

dcebd755926b0f Ming Lei          2019-02-15  272  
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04 @273  static unsigned int bio_split_alignment(struct bio *bio,
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  274  		const struct queue_limits *lim)
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  275  {
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  276  	if (op_is_write(bio_op(bio)) && lim->zone_write_granularity)
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  277  		return lim->zone_write_granularity;
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  278  	return lim->logical_block_size;
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  279  }
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  280  
e483c8c11f7f01 Pavel Begunkov    2025-06-25  281  static int bio_split_rw_at_dmavec(struct bio *bio, const struct queue_limits *lim,
e483c8c11f7f01 Pavel Begunkov    2025-06-25  282  				  unsigned *segs, unsigned max_bytes)
e483c8c11f7f01 Pavel Begunkov    2025-06-25  283  {
e483c8c11f7f01 Pavel Begunkov    2025-06-25  284  	struct dmavec *dmav;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  285  	int offset, length;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  286  
e483c8c11f7f01 Pavel Begunkov    2025-06-25  287  	/* Aggressively refuse any splitting, should be improved */
e483c8c11f7f01 Pavel Begunkov    2025-06-25  288  
e483c8c11f7f01 Pavel Begunkov    2025-06-25  289  	if (!lim->virt_boundary_mask)
e483c8c11f7f01 Pavel Begunkov    2025-06-25  290  		return -EINVAL;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  291  	if (bio->bi_vcnt > lim->max_segments)
e483c8c11f7f01 Pavel Begunkov    2025-06-25  292  		return -EINVAL;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  293  	if (bio->bi_iter.bi_size > max_bytes)
e483c8c11f7f01 Pavel Begunkov    2025-06-25  294  		return -EINVAL;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  295  
e483c8c11f7f01 Pavel Begunkov    2025-06-25  296  	dmav = &bio->bi_dmavec[bio->bi_iter.bi_idx];
e483c8c11f7f01 Pavel Begunkov    2025-06-25  297  	offset = bio->bi_iter.bi_bvec_done;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  298  	length = bio->bi_iter.bi_size;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  299  	while (length > 0) {
e483c8c11f7f01 Pavel Begunkov    2025-06-25  300  		if (dmav->len - offset > lim->max_segment_size) {
e483c8c11f7f01 Pavel Begunkov    2025-06-25  301  			printk("max seg size\n");
e483c8c11f7f01 Pavel Begunkov    2025-06-25  302  			return -EINVAL;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  303  		}
e483c8c11f7f01 Pavel Begunkov    2025-06-25  304  		length -= dmav->len;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  305  		dmav++;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  306  	}
e483c8c11f7f01 Pavel Begunkov    2025-06-25  307  	*segs = bio->bi_vcnt;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  308  	return 0;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  309  }
e483c8c11f7f01 Pavel Begunkov    2025-06-25  310  
e483c8c11f7f01 Pavel Begunkov    2025-06-25  311  
dad7758459bc60 Bart Van Assche   2019-08-01  312  /**
b35243a447b9fe Christoph Hellwig 2024-08-26  313   * bio_split_rw_at - check if and where to split a read/write bio
dad7758459bc60 Bart Van Assche   2019-08-01  314   * @bio:  [in] bio to be split
c55ddd9082f757 Christoph Hellwig 2022-07-27  315   * @lim:  [in] queue limits to split based on
dad7758459bc60 Bart Van Assche   2019-08-01  316   * @segs: [out] number of segments in the bio with the first half of the sectors
a85b36375b05f7 Christoph Hellwig 2022-07-27  317   * @max_bytes: [in] maximum number of bytes per bio
dad7758459bc60 Bart Van Assche   2019-08-01  318   *
b35243a447b9fe Christoph Hellwig 2024-08-26  319   * Find out if @bio needs to be split to fit the queue limits in @lim and a
b35243a447b9fe Christoph Hellwig 2024-08-26  320   * maximum size of @max_bytes.  Returns a negative error number if @bio can't be
b35243a447b9fe Christoph Hellwig 2024-08-26  321   * split, 0 if the bio doesn't have to be split, or a positive sector offset if
b35243a447b9fe Christoph Hellwig 2024-08-26  322   * @bio needs to be split.
dad7758459bc60 Bart Van Assche   2019-08-01  323   */
b35243a447b9fe Christoph Hellwig 2024-08-26  324  int bio_split_rw_at(struct bio *bio, const struct queue_limits *lim,
b35243a447b9fe Christoph Hellwig 2024-08-26  325  		unsigned *segs, unsigned max_bytes)
54efd50bfd873e Kent Overstreet   2015-04-23  326  {
5014c311baa2b2 Jens Axboe        2015-09-02 @327  	struct bio_vec bv, bvprv, *bvprvp = NULL;
54efd50bfd873e Kent Overstreet   2015-04-23 @328  	struct bvec_iter iter;
67927d22015060 Keith Busch       2022-06-10 @329  	unsigned nsegs = 0, bytes = 0;
54efd50bfd873e Kent Overstreet   2015-04-23  330  
e483c8c11f7f01 Pavel Begunkov    2025-06-25  331  	if (bio_flagged(bio, BIO_DMAVEC))
e483c8c11f7f01 Pavel Begunkov    2025-06-25  332  		return bio_split_rw_at_dmavec(bio, lim, segs, max_bytes;
e483c8c11f7f01 Pavel Begunkov    2025-06-25  333  
dcebd755926b0f Ming Lei          2019-02-15  334  	bio_for_each_bvec(bv, bio, iter) {
54efd50bfd873e Kent Overstreet   2015-04-23  335  		/*
54efd50bfd873e Kent Overstreet   2015-04-23  336  		 * If the queue doesn't support SG gaps and adding this
54efd50bfd873e Kent Overstreet   2015-04-23  337  		 * offset would create a gap, disallow it.
54efd50bfd873e Kent Overstreet   2015-04-23  338  		 */
c55ddd9082f757 Christoph Hellwig 2022-07-27  339  		if (bvprvp && bvec_gap_to_prev(lim, bvprvp, bv.bv_offset))
54efd50bfd873e Kent Overstreet   2015-04-23  340  			goto split;
54efd50bfd873e Kent Overstreet   2015-04-23  341  
c55ddd9082f757 Christoph Hellwig 2022-07-27  342  		if (nsegs < lim->max_segments &&
67927d22015060 Keith Busch       2022-06-10  343  		    bytes + bv.bv_len <= max_bytes &&
889c57066ceee5 Ming Lei          2025-02-25  344  		    bv.bv_offset + bv.bv_len <= lim->min_segment_size) {
708b25b344fd9b Bart Van Assche   2019-08-01  345  			nsegs++;
67927d22015060 Keith Busch       2022-06-10  346  			bytes += bv.bv_len;
c55ddd9082f757 Christoph Hellwig 2022-07-27  347  		} else {
c55ddd9082f757 Christoph Hellwig 2022-07-27  348  			if (bvec_split_segs(lim, &bv, &nsegs, &bytes,
c55ddd9082f757 Christoph Hellwig 2022-07-27  349  					lim->max_segments, max_bytes))
e36f6204288088 Keith Busch       2016-01-12  350  				goto split;
e36f6204288088 Keith Busch       2016-01-12  351  		}
e36f6204288088 Keith Busch       2016-01-12  352  
54efd50bfd873e Kent Overstreet   2015-04-23  353  		bvprv = bv;
578270bfbd2803 Ming Lei          2015-11-24  354  		bvprvp = &bvprv;
54efd50bfd873e Kent Overstreet   2015-04-23  355  	}
54efd50bfd873e Kent Overstreet   2015-04-23  356  
d627065d884699 Christoph Hellwig 2019-06-06  357  	*segs = nsegs;
b35243a447b9fe Christoph Hellwig 2024-08-26  358  	return 0;
54efd50bfd873e Kent Overstreet   2015-04-23  359  split:
b35243a447b9fe Christoph Hellwig 2024-08-26  360  	if (bio->bi_opf & REQ_ATOMIC)
b35243a447b9fe Christoph Hellwig 2024-08-26  361  		return -EINVAL;
b35243a447b9fe Christoph Hellwig 2024-08-26  362  
9cea62b2cbabff Jens Axboe        2023-01-04  363  	/*
9cea62b2cbabff Jens Axboe        2023-01-04  364  	 * We can't sanely support splitting for a REQ_NOWAIT bio. End it
9cea62b2cbabff Jens Axboe        2023-01-04  365  	 * with EAGAIN if splitting is required and return an error pointer.
9cea62b2cbabff Jens Axboe        2023-01-04  366  	 */
b35243a447b9fe Christoph Hellwig 2024-08-26  367  	if (bio->bi_opf & REQ_NOWAIT)
b35243a447b9fe Christoph Hellwig 2024-08-26  368  		return -EAGAIN;
9cea62b2cbabff Jens Axboe        2023-01-04  369  
bdced438acd83a Ming Lei          2015-10-20  370  	*segs = nsegs;
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  371  
67927d22015060 Keith Busch       2022-06-10  372  	/*
67927d22015060 Keith Busch       2022-06-10  373  	 * Individual bvecs might not be logical block aligned. Round down the
67927d22015060 Keith Busch       2022-06-10  374  	 * split size so that each bio is properly block size aligned, even if
67927d22015060 Keith Busch       2022-06-10  375  	 * we do not use the full hardware limits.
67927d22015060 Keith Busch       2022-06-10  376  	 */
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  377  	bytes = ALIGN_DOWN(bytes, bio_split_alignment(bio, lim));
67927d22015060 Keith Busch       2022-06-10  378  
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  379  	/*
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  380  	 * Bio splitting may cause subtle trouble such as hang when doing sync
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  381  	 * iopoll in direct IO routine. Given performance gain of iopoll for
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  382  	 * big IO can be trival, disable iopoll when split needed.
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  383  	 */
6ce913fe3eee14 Christoph Hellwig 2021-10-12  384  	bio_clear_polled(bio);
b35243a447b9fe Christoph Hellwig 2024-08-26 @385  	return bytes >> SECTOR_SHIFT;
54efd50bfd873e Kent Overstreet   2015-04-23 @386  }
b35243a447b9fe Christoph Hellwig 2024-08-26  387  EXPORT_SYMBOL_GPL(bio_split_rw_at);
54efd50bfd873e Kent Overstreet   2015-04-23  388  

:::::: The code at line 329 was first introduced by commit
:::::: 67927d22015060967122facc8cfeaad8012e8808 block/merge: count bytes instead of sectors

:::::: TO: Keith Busch <kbusch@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
