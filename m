Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E73DDDBB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792503; cv=none; b=nQr6EYrhCo23OC7LzCv6AQ9OXrDbvtTzthS3nlzWGPMJ6hvIdpAGWqx3abbdFuIzrf2l0nMnshBl+aQ/gU1nDTwDEBm63dYZf2HfEySlhF/hV5DGvj16L2wJXOeffr5/txDvErH3NMsC1aiyQ7wssKZ4RTVIIHSPeGZ8yY11sH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792503; c=relaxed/simple;
	bh=3ZuuaOsIhKqUdpcVHqakkpTX4LLcz91V4DmaTb79+/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UAgDc+XKy5pilPhwLJ73YIGwwHkRxYnP+tSO0PGOMA9xdQ5tJ9SA7sl6jcBjmHAB+T5gpk08XWbO/ZMde5adg+4nzMYPXCucG6RHR48UkkTTPsGx+wNHAi++Yp8vSYC7SPI3EcHbM+Zfo33HFHyxeC2sMALTvZ4tXoP3z7ez3fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkSLwsxF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkSLwsxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779792500; x=1811328500;
  h=date:from:to:cc:subject:message-id;
  bh=3ZuuaOsIhKqUdpcVHqakkpTX4LLcz91V4DmaTb79+/w=;
  b=RkSLwsxFeMm7Tlx+sLuco4nSoElLl381QjZfK4FbsMGlQ8bm3GQEO8/O
   S2mkEH0KurQFwhZcLIltsiV4b+RVuKAzWUUVN+eT8/fpghVMk7mPhRh/S
   jao942SP8yB9ngCW2tABJbRlZgTxUic8o0abypphOoHxZr014q1a/av9u
   WBou4V4xJyF6g0TDZB5Zx3DRcWk8ivyfyRnMqlzGj8n1eMcT64H0M2XHC
   O6dAtrnijuKiVWskW4NNoVvcr1mqqZCqQZVA7xYKTjIZzdUm4FtNzLUCu
   uwHBARm2rlCBD7GrsuNg2UOEwjrjGFXGqhq71dVvax6l6jxHgu+hK/wIE
   A==;
X-CSE-ConnectionGUID: IfSBPQq3ShO9wRLxUbJ5ug==
X-CSE-MsgGUID: KR+8IKUPTbOKAjfnEdMfrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98179189"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="98179189"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:48:19 -0700
X-CSE-ConnectionGUID: ch1eoFYzT9Gs6Dalr0gVFw==
X-CSE-MsgGUID: ZxCfxRE+S9mXJGyNS1Skvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="235528449"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 May 2026 03:48:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRpKb-000000002Mc-1Thc;
	Tue, 26 May 2026 10:48:17 +0000
Date: Tue, 26 May 2026 18:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:bvec-iter-cleanups 1/1]
 drivers/block/loop.c:382:8: error: assigning to 'struct bio_vec *' from
 'const struct bio_vec *' discards qualifiers
Message-ID: <202605261835.95n6IOmg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git bvec-iter-cleanups
head:   024c5730f9a8094d7b69ce07abec7eb0e498c2c2
commit: 024c5730f9a8094d7b69ce07abec7eb0e498c2c2 [1/1] bvec: make the bvec_iter helpers inline functions
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260526/202605261835.95n6IOmg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261835.95n6IOmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261835.95n6IOmg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/loop.c:382:8: error: assigning to 'struct bio_vec *' from 'const struct bio_vec *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     382 |                 bvec = __bvec_iter_bvec(bio->bi_io_vec, bio->bi_iter);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/nvme/host/tcp.c:358:7: error: assigning to 'struct bio_vec *' from 'const struct bio_vec *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     358 |                 vec = __bvec_iter_bvec(bio->bi_io_vec, bio->bi_iter);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +382 drivers/block/loop.c

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
