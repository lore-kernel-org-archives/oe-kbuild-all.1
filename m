Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068A37C902
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227766; cv=none; b=l8nxfIE0YFjEDiLzlY37PyO4eshEgczTg26m6epx6/XT/4NJEepqMjYtVzaSOtqU/ylS0P48bpmoLBw8kQ2uYfx2SjAiQPqAMzpjtqCOtyjYiD4fTDxguN0oANZElfHlys7bUEN1swhlS3x6DDrnaPBSS6QytGGS1Us+QcXf5J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227766; c=relaxed/simple;
	bh=Y5PF5V+zGcQo4Wj8jNlVPBNRjEZwE8LdfmkTlaRk1W4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kT9B4EnHx7sgUBC+7J8Ogqt05Qicr1erFX+2Y+MA1GOGbgdsaj7eYiWypYwdPxPxFBsVZ1fxHT0RRYFevu4lu7K9QyD4qsuLkBEAXjMhkJHbVCkl7AErPw2DRdPLw06cp7jxoBuY2kGwzX3z40DDbaDWqPWqH2IlAuzzfqxumCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnWIHJ61; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnWIHJ61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778227764; x=1809763764;
  h=date:from:to:cc:subject:message-id;
  bh=Y5PF5V+zGcQo4Wj8jNlVPBNRjEZwE8LdfmkTlaRk1W4=;
  b=BnWIHJ61zi02fcRh6oBwzR3T0H0gOzfr+mNA1e9Il8qOlYuO9Vug9ISF
   LlXZF9msunYC2bZeDkdekuzXgkvPG24qNZLNkSILjYDovxEZR24iy4ZFE
   0bmRuMBAUVtcJAryxk64TwzWTPjEXSaBpYqgtdHtUDfrimshnn6+v/wLq
   xOqvyGm919JuAxXGivHnlU1aghoPFdlGUNskBtvs58ut4ecufFNdfbtmN
   aDRmZIrElDaF4q59QBdzvItM+Q+IEbYBky9vO0/9NS0dgxJcToxZ6wSiN
   SwbWmCgkMZl8nv1vWJsRZ0r3Len7yoz1KkrAq4UAUy2rc3YLhNCcXM5fe
   g==;
X-CSE-ConnectionGUID: sNFyhHxTRjWv/x3X6bT+uA==
X-CSE-MsgGUID: zbl6uR8wTVaxPK6kOWWDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89500228"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89500228"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 01:09:19 -0700
X-CSE-ConnectionGUID: afDDWwVfQWmv+tP+oUQxnA==
X-CSE-MsgGUID: m8GU+v2RTgioulIekDCGmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236639797"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2026 01:09:15 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLGGk-000000000qP-3CL9;
	Fri, 08 May 2026 08:09:10 +0000
Date: Fri, 08 May 2026 16:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 7/13] io_uring/slot.c:133:16:
 sparse: sparse: cast to restricted blk_opf_t
Message-ID: <202605081554.p3Jo9cBs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   8cda41fe2d37340341d2ae4bf15368f88b4bd5a2
commit: 61d56c943173f9e6820ff6162d25e8fce26059dc [7/13] io_uring: add IORING_OP_SLOT_RW and wire up slot completion
config: powerpc-randconfig-r122-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081554.p3Jo9cBs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081554.p3Jo9cBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081554.p3Jo9cBs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/slot.c:133:16: sparse: sparse: cast to restricted blk_opf_t
>> io_uring/slot.c:187:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] op @@     got restricted blk_opf_t @@
   io_uring/slot.c:187:24: sparse:     expected unsigned char [usertype] op
   io_uring/slot.c:187:24: sparse:     got restricted blk_opf_t
   io_uring/slot.c:189:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] op @@     got restricted blk_opf_t @@
   io_uring/slot.c:189:24: sparse:     expected unsigned char [usertype] op
   io_uring/slot.c:189:24: sparse:     got restricted blk_opf_t

vim +133 io_uring/slot.c

    91	
    92	static int io_slot_submit(struct io_ring_ctx *ctx, struct io_kiocb *req,
    93				  struct io_slot_rw *rw, unsigned int issue_flags)
    94	{
    95		struct io_mapped_ubuf *imu;
    96		struct io_slot *slot;
    97		struct bio *bio;
    98		blk_opf_t opf;
    99		const struct bio_vec *bvec;
   100		size_t walk;
   101	
   102		/*
   103		 * Hold uring_lock across lookup, validation, and the bit that pins
   104		 * the slot, so an io-wq worker (IO_URING_F_UNLOCKED) is serialised
   105		 * against io_unregister_io_slot(); drop it as soon as INFLIGHT is
   106		 * set so the bio setup doesn't run under the mutex.
   107		 */
   108		io_ring_submit_lock(ctx, issue_flags);
   109	
   110		slot = xa_load(&ctx->slot_table, rw->slot_id);
   111		if (!slot)
   112			goto err;
   113	
   114		imu = slot->buf_node->buf;
   115		if (rw->buf_off + rw->nbytes > imu->len)
   116			goto err;
   117	
   118		walk = rw->buf_off;
   119		bvec = io_imu_offset_to_bvec(imu, &walk);
   120	
   121		if (test_and_set_bit(IO_SLOT_F_INFLIGHT, &slot->state)) {
   122			io_ring_submit_unlock(ctx, issue_flags);
   123			req_set_fail(req);
   124			return -EBUSY;
   125		}
   126	
   127		/* Slot pinned by INFLIGHT, drop the lock. */
   128		io_ring_submit_unlock(ctx, issue_flags);
   129	
   130		bio = &slot->bio;
   131		slot->req = req;
   132	
 > 133		opf = (blk_opf_t)rw->op;
   134		if (req->flags & REQ_F_IOPOLL)
   135			opf |= REQ_POLLED;
   136		bio->bi_opf = opf | REQ_NOMERGE;
   137	
   138		bio->bi_iter.bi_sector = rw->offset >> SECTOR_SHIFT;
   139		bio->bi_iter.bi_size = rw->nbytes;
   140		bio->bi_iter.bi_idx = bvec - imu->bvec;
   141		bio->bi_iter.bi_bvec_done = walk;
   142		bio->bi_private = NULL;
   143	
   144		rw->slot = slot;
   145		rw->bio = bio;
   146	
   147		submit_bio_noacct_fast(bio);
   148		return 0;
   149	err:
   150		io_ring_submit_unlock(ctx, issue_flags);
   151		req_set_fail(req);
   152		return -EINVAL;
   153	}
   154	
   155	int io_slot_rw_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
   156	{
   157		struct io_slot_rw *rw = io_kiocb_to_cmd(req, struct io_slot_rw);
   158		u32 rw_flags;
   159	
   160		/*
   161		 * Using slot read/write with IOSQE_ASYNC is inefficient and hence a
   162		 * terrible idea, better make that explicit.
   163		 */
   164		if (req->flags & REQ_F_FORCE_ASYNC)
   165			return -EINVAL;
   166	
   167		if (sqe->file_index || sqe->addr3)
   168			return -EINVAL;
   169	
   170		rw_flags = READ_ONCE(sqe->rw_flags);
   171		if (rw_flags & ~IORING_SLOT_RW_WRITE)
   172			return -EINVAL;
   173	
   174		rw->offset = READ_ONCE(sqe->off);
   175		if (rw->offset & ((1ULL << SECTOR_SHIFT) - 1))
   176			return -EINVAL;
   177		rw->buf_off = READ_ONCE(sqe->addr);
   178		if (rw->buf_off & ((1ULL << SECTOR_SHIFT) - 1))
   179			return -EINVAL;
   180	
   181		rw->slot_id = READ_ONCE(sqe->buf_index);
   182		rw->nbytes = READ_ONCE(sqe->len);
   183		if (!rw->nbytes)
   184			return -EINVAL;
   185	
   186		if (rw_flags & IORING_SLOT_RW_WRITE)
 > 187			rw->op = REQ_OP_WRITE;
   188		else
   189			rw->op = REQ_OP_READ;
   190		return 0;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
