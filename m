Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235B3D9DDB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792444; cv=none; b=WkwnpCoFRGQnnJUHko3ujxIDIYcbtnChk7xGyiFLHGsg14hZ+N/cRHJEhxOUPQim+NzcZsEZAX0xT5saXC23x52KKMZBXGXLG/MHy3zR7tJgmCR+nmfYUWbHykV+RkcHdK1E+tfCS4YwBBJwRgHbWQVOVPOpC+xK5hRH1D+8w4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792444; c=relaxed/simple;
	bh=KxyKfakwBK2o7GGcMTJyTaNwaoN5x/01Xssn2XOCJqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i2wRhpN1Ocg+cJUu4b2UJ5VlzWGficRzSuwieGdB1M+ZF+qDZ5Ox41NEepo5x0L7P+o4NcbNmDPmVY+KwcVdU06pMAmv02MMEeJkloohJ1eb5ddEZkzMO0kYRJqhZAc1dYxquxtcDYO6sr42NDG8/GVC8Vbwj1IPmJojHqN+suo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+//l68Q; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+//l68Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779792442; x=1811328442;
  h=date:from:to:cc:subject:message-id;
  bh=KxyKfakwBK2o7GGcMTJyTaNwaoN5x/01Xssn2XOCJqo=;
  b=V+//l68Q9R18fBzZQcQ4UCqOegoFRSmK86Rz2ggH9sFgz4zvI2DQuF8m
   N3rtpGjFH3bALj85wKgbMNe2V5+bDYRFeA2UbDxHF6OweHs55E3Heq3Xv
   92ux43uN2Ue3HdfHomzUjB4QQ6B5t0p1nbND7IO6IxAd0frtGrf0L3mJM
   Mt5C53aV+woW/3lB9cQLslcYbDV6h/TaEcwet4srlwrnpusKAxy5KsFyC
   GdCJrSn0eq7ZLxJoxA4i+IpD6Lg2CGch6AUiJvoZbOiz7aVq97Xf5EYxK
   q68ghFXu/5vWNA2E0kew4NdR1Npx7SeDFMG72c0UnDMZy9HyP7bodJc3f
   A==;
X-CSE-ConnectionGUID: YxVeaBBDQP2N+yCjNCuQ2A==
X-CSE-MsgGUID: TAuRcpR/TyyA4X0InxiBqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="83181019"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="83181019"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:47:21 -0700
X-CSE-ConnectionGUID: +lgZ3ftsSHGMfwpkoTX7OA==
X-CSE-MsgGUID: bnfWDdzhQFCSW7Is0qc0Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="237709949"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2026 03:47:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRpJd-000000002MQ-0l3B;
	Tue, 26 May 2026 10:47:17 +0000
Date: Tue, 26 May 2026 18:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:bvec-iter-cleanups 1/1]
 drivers/block/loop.c:382:22: warning: assignment discards 'const' qualifier
 from pointer target type
Message-ID: <202605261813.nS7pPDsQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git bvec-iter-cleanups
head:   024c5730f9a8094d7b69ce07abec7eb0e498c2c2
commit: 024c5730f9a8094d7b69ce07abec7eb0e498c2c2 [1/1] bvec: make the bvec_iter helpers inline functions
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260526/202605261813.nS7pPDsQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261813.nS7pPDsQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261813.nS7pPDsQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/loop.c: In function 'lo_rw_aio':
>> drivers/block/loop.c:382:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     382 |                 bvec = __bvec_iter_bvec(bio->bi_io_vec, bio->bi_iter);
         |                      ^
--
   drivers/nvme/host/tcp.c: In function 'nvme_tcp_init_iter':
>> drivers/nvme/host/tcp.c:358:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     358 |                 vec = __bvec_iter_bvec(bio->bi_io_vec, bio->bi_iter);
         |                     ^


vim +/const +382 drivers/block/loop.c

bc07c10a3603a5 Ming Lei           2015-08-17  339  
96f03c8cb29f2e Jens Axboe         2025-11-24  340  static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
96f03c8cb29f2e Jens Axboe         2025-11-24  341  		     loff_t pos, int rw)
c3e6c11147f6f0 Ming Lei           2025-10-15  342  {
96f03c8cb29f2e Jens Axboe         2025-11-24  343  	struct iov_iter iter;
c3e6c11147f6f0 Ming Lei           2025-10-15  344  	struct req_iterator rq_iter;
96f03c8cb29f2e Jens Axboe         2025-11-24  345  	struct bio_vec *bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  346  	struct request *rq = blk_mq_rq_from_pdu(cmd);
96f03c8cb29f2e Jens Axboe         2025-11-24  347  	struct bio *bio = rq->bio;
96f03c8cb29f2e Jens Axboe         2025-11-24  348  	struct file *file = lo->lo_backing_file;
c3e6c11147f6f0 Ming Lei           2025-10-15  349  	struct bio_vec tmp;
96f03c8cb29f2e Jens Axboe         2025-11-24  350  	unsigned int offset;
71075d25ca5cae Chaitanya Kulkarni 2025-12-02  351  	unsigned int nr_bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  352  	int ret;
c3e6c11147f6f0 Ming Lei           2025-10-15  353  
71075d25ca5cae Chaitanya Kulkarni 2025-12-02  354  	nr_bvec = blk_rq_nr_bvec(rq);
c3e6c11147f6f0 Ming Lei           2025-10-15  355  
40326d8a33d5b7 Shaohua Li         2017-08-31  356  	if (rq->bio != rq->biotail) {
bc07c10a3603a5 Ming Lei           2015-08-17  357  
69050f8d6d075d Kees Cook          2026-02-20  358  		bvec = kmalloc_objs(struct bio_vec, nr_bvec, GFP_NOIO);
40326d8a33d5b7 Shaohua Li         2017-08-31  359  		if (!bvec)
40326d8a33d5b7 Shaohua Li         2017-08-31  360  			return -EIO;
40326d8a33d5b7 Shaohua Li         2017-08-31  361  		cmd->bvec = bvec;
40326d8a33d5b7 Shaohua Li         2017-08-31  362  
40326d8a33d5b7 Shaohua Li         2017-08-31  363  		/*
40326d8a33d5b7 Shaohua Li         2017-08-31  364  		 * The bios of the request may be started from the middle of
40326d8a33d5b7 Shaohua Li         2017-08-31  365  		 * the 'bvec' because of bio splitting, so we can't directly
86af5952a8470f Ming Lei           2019-02-15  366  		 * copy bio->bi_iov_vec to new bvec. The rq_for_each_bvec
40326d8a33d5b7 Shaohua Li         2017-08-31  367  		 * API will take care of all details for us.
40326d8a33d5b7 Shaohua Li         2017-08-31  368  		 */
86af5952a8470f Ming Lei           2019-02-15  369  		rq_for_each_bvec(tmp, rq, rq_iter) {
40326d8a33d5b7 Shaohua Li         2017-08-31  370  			*bvec = tmp;
40326d8a33d5b7 Shaohua Li         2017-08-31  371  			bvec++;
40326d8a33d5b7 Shaohua Li         2017-08-31  372  		}
96f03c8cb29f2e Jens Axboe         2025-11-24  373  		bvec = cmd->bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  374  		offset = 0;
fd858d1ca9694c Ming Lei           2025-10-15  375  	} else {
96f03c8cb29f2e Jens Axboe         2025-11-24  376  		/*
96f03c8cb29f2e Jens Axboe         2025-11-24  377  		 * Same here, this bio may be started from the middle of the
96f03c8cb29f2e Jens Axboe         2025-11-24  378  		 * 'bvec' because of bio splitting, so offset from the bvec
96f03c8cb29f2e Jens Axboe         2025-11-24  379  		 * must be passed to iov iterator
96f03c8cb29f2e Jens Axboe         2025-11-24  380  		 */
96f03c8cb29f2e Jens Axboe         2025-11-24  381  		offset = bio->bi_iter.bi_bvec_done;
96f03c8cb29f2e Jens Axboe         2025-11-24 @382  		bvec = __bvec_iter_bvec(bio->bi_io_vec, bio->bi_iter);
fd858d1ca9694c Ming Lei           2025-10-15  383  	}
96f03c8cb29f2e Jens Axboe         2025-11-24  384  	atomic_set(&cmd->ref, 2);
96f03c8cb29f2e Jens Axboe         2025-11-24  385  
96f03c8cb29f2e Jens Axboe         2025-11-24  386  	iov_iter_bvec(&iter, rw, bvec, nr_bvec, blk_rq_bytes(rq));
96f03c8cb29f2e Jens Axboe         2025-11-24  387  	iter.iov_offset = offset;
fd858d1ca9694c Ming Lei           2025-10-15  388  
fd858d1ca9694c Ming Lei           2025-10-15  389  	cmd->iocb.ki_pos = pos;
96f03c8cb29f2e Jens Axboe         2025-11-24  390  	cmd->iocb.ki_filp = file;
fd858d1ca9694c Ming Lei           2025-10-15  391  	cmd->iocb.ki_ioprio = req_get_ioprio(rq);
fd858d1ca9694c Ming Lei           2025-10-15  392  	if (cmd->use_aio) {
fd858d1ca9694c Ming Lei           2025-10-15  393  		cmd->iocb.ki_complete = lo_rw_aio_complete;
fd858d1ca9694c Ming Lei           2025-10-15  394  		cmd->iocb.ki_flags = IOCB_DIRECT;
fd858d1ca9694c Ming Lei           2025-10-15  395  	} else {
fd858d1ca9694c Ming Lei           2025-10-15  396  		cmd->iocb.ki_complete = NULL;
fd858d1ca9694c Ming Lei           2025-10-15  397  		cmd->iocb.ki_flags = 0;
fd858d1ca9694c Ming Lei           2025-10-15  398  	}
bc07c10a3603a5 Ming Lei           2015-08-17  399  
39d86db34e41b9 Ming Lei           2025-05-27  400  	if (rw == ITER_SOURCE) {
c4706c5058a7bd Ming Lei           2025-07-16  401  		kiocb_start_write(&cmd->iocb);
7c98f7cb8fda96 Miklos Szeredi     2023-08-28  402  		ret = file->f_op->write_iter(&cmd->iocb, &iter);
39d86db34e41b9 Ming Lei           2025-05-27  403  	} else
7c98f7cb8fda96 Miklos Szeredi     2023-08-28  404  		ret = file->f_op->read_iter(&cmd->iocb, &iter);
bc07c10a3603a5 Ming Lei           2015-08-17  405  
92d773324b7edb Shaohua Li         2017-09-01  406  	lo_rw_aio_do_completion(cmd);
92d773324b7edb Shaohua Li         2017-09-01  407  
bc07c10a3603a5 Ming Lei           2015-08-17  408  	if (ret != -EIOCBQUEUED)
6b19b766e8f077 Jens Axboe         2021-10-21  409  		lo_rw_aio_complete(&cmd->iocb, ret);
f2fed441c69b92 Christoph Hellwig  2025-04-09  410  	return -EIOCBQUEUED;
bc07c10a3603a5 Ming Lei           2015-08-17  411  }
bc07c10a3603a5 Ming Lei           2015-08-17  412  

:::::: The code at line 382 was first introduced by commit
:::::: 96f03c8cb29f2ec5ffe8e24fbec2c64f3c3bf4e5 Revert "Merge branch 'loop-aio-nowait' into for-6.19/block"

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
