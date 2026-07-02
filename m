Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6592C0268
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 02:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782958308; cv=none; b=XOhrT+Wruxac30hmmxnXu199KugUIdDg04Q2PrxnSFoh+ok9xjp5qvTWw7CubUezPUjC3TB10xREdqlaF+NgxdCcKLphgUeL0dvnvRajgtvHvmJBUptL8a19qpaWaN2mK5DyFYnLpLMSBq2cr4UzZI4YMj/ca6En7SCGjJQg2As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782958308; c=relaxed/simple;
	bh=60QQRCRWsPKDabB6zz7L6I/rQIw+pNVmFYG8iACXaxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dtq1MsGVovJ4WQ7lbcDG85DOrlWcMkbTrwB4oZrLwrerqp3b1SZzzElzyVxHHhxKeoXJ7vBxzVGCBRiAEZ11XpWtDzeREkFaogdneUwH9LwzMMU/Ellq4LKXZ9ER8EVYnxIe/Us2GTlRgdc8dWpT8lNo9QGljcheoqOdUaFo7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwtXdRl5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwtXdRl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782958306; x=1814494306;
  h=date:from:to:cc:subject:message-id;
  bh=60QQRCRWsPKDabB6zz7L6I/rQIw+pNVmFYG8iACXaxU=;
  b=MwtXdRl5N9lVI/WUMQgXAIWvi83pUywztwMIFgLZIrYZcz05z6wkxq57
   VbKq1aCbZzezrerTdodWvLyklU+Fk0DsZ334a9Q7gqdivyRDa2vh/uHba
   xn6bdehjQLAH+cayGyoB9qhqGNU6Biov6x4hCafS9mlCyI1sFlytGn2kJ
   3Da5yQDcHiMA30hfaUmynAsCc6EwOOfiL/vqbu8BSMNSac8p9dGRnoaab
   ieCp4zM9yPLvAzLfTS0leMrDhemu6SjESrYcCQjKi09dZI5SqdDZz/re3
   PSxOHAZpII6qfEo4A6qxDFVcsFZaLYfes1xv5pBm7X3GIL9E9PiZvFDzI
   g==;
X-CSE-ConnectionGUID: sGopr04aTiG1uD9EP5DOnQ==
X-CSE-MsgGUID: LMbF22f6QnuiOzvwUT95Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87614401"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="87614401"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 19:11:45 -0700
X-CSE-ConnectionGUID: pzPfM1K5QWOafT0drcAhcA==
X-CSE-MsgGUID: XfFjer/KRWuoLSB8jaJDow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="248747791"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2026 19:11:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf6ts-000000009rb-01Hq;
	Thu, 02 Jul 2026 02:11:37 +0000
Date: Thu, 02 Jul 2026 10:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 10/13]
 fs/iomap/direct-io.c:219:58: sparse: sparse: incorrect type in argument 4
 (different base types)
Message-ID: <202607021031.eBJ2hGXW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: 6d1abeffbce3bf1c78052c72b02530c421e2e4e8 [10/13] iomap: bounce aligned DIO writes through iobuf pool folios
config: i386-randconfig-063-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021031.eBJ2hGXW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021031.eBJ2hGXW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021031.eBJ2hGXW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/iomap/direct-io.c:219:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int op @@     got restricted blk_opf_t enum req_op @@
   fs/iomap/direct-io.c:219:58: sparse:     expected unsigned int op
   fs/iomap/direct-io.c:219:58: sparse:     got restricted blk_opf_t enum req_op

vim +219 fs/iomap/direct-io.c

    95	
    96	/*
    97	 * iomap_dio_write_iobuf - prototype pool-backed aligned DIO write path
    98	 *
    99	 * Constraints: IOMAP_DIO_WRITE only, full-block aligned, pool available,
   100	 * synchronous copy_from_iter (no async copyback needed for writes).
   101	 *
   102	 * Returns bytes consumed on success, 0 if ineligible, <0 on error.
   103	 */
   104	static ssize_t iomap_dio_write_iobuf(const struct iomap_iter *iter,
   105					     struct iomap_dio *dio, loff_t pos,
   106					     unsigned int alignment, blk_opf_t op)
   107	{
   108		struct block_device *bdev = iter->iomap.bdev;
   109		struct iomap_dio_iobuf_ctx *ctx;
   110		struct request_queue *q;
   111		struct iov_iter copy_iter;
   112		struct folio *folio;
   113		struct bio *bio;
   114		unsigned int fsize;
   115		size_t len;
   116		ssize_t ret;
   117	
   118		/* Only writes for now */
   119		if (!(dio->flags & IOMAP_DIO_WRITE))
   120			return 0;
   121	
   122		if (!bdev)
   123			return 0;
   124	
   125		q = bdev_get_queue(bdev);
   126		if (!blk_queue_iobuf_pool_enabled(q))
   127			return 0;
   128	
   129		fsize = blk_iobuf_pool_folio_size(q);
   130		if (!fsize)
   131			return 0;
   132	
   133		/*
   134		 * Never bounce an atomic write: it must be issued as a single bio
   135		 * covering the whole length (see the REQ_ATOMIC check in
   136		 * iomap_dio_bio_iter_one()).  Splitting it into per-folio bios here
   137		 * would silently break hardware atomic semantics.
   138		 */
   139		if (op & REQ_ATOMIC)
   140			return 0;
   141	
   142		/*
   143		 * Integrity (PI) writes need fs_bio_integrity_generate() run on the
   144		 * bio, which the normal path below does; leave them to it rather than
   145		 * replicate the integrity setup in the bounce.
   146		 */
   147		if (iter->iomap.flags & IOMAP_F_INTEGRITY)
   148			return 0;
   149	
   150		/*
   151		 * Bvec-backed iterators (e.g. io_uring registered buffers) are already
   152		 * described as physical ranges; bouncing them only adds a memcpy with
   153		 * no segment benefit.
   154		 */
   155		if (iov_iter_is_bvec(dio->submit.iter))
   156			return 0;
   157	
   158		len = iov_iter_count(dio->submit.iter);
   159	
   160		/* Require at least one full folio, aligned */
   161		if (len < fsize)
   162			return 0;
   163		if (!IS_ALIGNED(pos, fsize))
   164			return 0;
   165	
   166		/*
   167		 * This helper emits a single fsize bio.  Do not turn a larger write
   168		 * into N separately-bounced fsize sub-I/Os -- that fragments one
   169		 * multi-segment bio into N bios and regresses throughput badly.  Let
   170		 * the normal path handle anything bigger than one folio for now.
   171		 */
   172		if (round_down(len, fsize) != fsize)
   173			return 0;
   174	
   175		folio = blk_iobuf_alloc_folio(q, GFP_NOWAIT);
   176		if (!folio) {
   177			blk_iobuf_inc_fallback(q);
   178			trace_block_iobuf_fallback(q, "dio_pool_exhausted");
   179			return 0;
   180		}
   181	
   182		/* Copy user data into the folio */
   183		copy_iter = *dio->submit.iter;
   184		iov_iter_truncate(&copy_iter, fsize);
   185		if (copy_from_iter(folio_address(folio), fsize,
   186				   &copy_iter) != fsize) {
   187			blk_iobuf_free_folio(q, folio);
   188			return -EFAULT;
   189		}
   190	
   191		/* Wrap the bio private to carry both the dio and the folio to free */
   192		ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
   193		if (!ctx) {
   194			blk_iobuf_free_folio(q, folio);
   195			return -ENOMEM;
   196		}
   197		ctx->dio   = dio;
   198		ctx->q     = q;
   199		ctx->folio = folio;
   200	
   201		bio = iomap_dio_alloc_bio(iter, dio, 1, op);
   202		fscrypt_set_bio_crypt_ctx(bio, iter->inode, pos, GFP_KERNEL);
   203		bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
   204		bio->bi_write_hint = iter->inode->i_write_hint;
   205		bio->bi_ioprio = dio->iocb->ki_ioprio;
   206		bio->bi_private = ctx;
   207		bio->bi_end_io  = iomap_dio_iobuf_bio_end_io;
   208	
   209		if (!bio_add_folio(bio, folio, fsize, 0)) {
   210			kfree(ctx);
   211			blk_iobuf_free_folio(q, folio);
   212			bio_put(bio);
   213			return -EINVAL;
   214		}
   215	
   216		ret = bio->bi_iter.bi_size;
   217		task_io_account_write(ret);
   218	
 > 219		trace_block_iobuf_bounce_submit(q, ret, 1, bio_op(bio));
   220	
   221		iov_iter_advance(dio->submit.iter, fsize);
   222		iomap_dio_submit_bio(iter, dio, bio, pos);
   223		return ret;
   224	}
   225	#endif /* CONFIG_BLK_IOBUF_POOL */
   226	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
