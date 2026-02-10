Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47933121E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 20:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754440; cv=none; b=HgORFLHK1F/SQfRD4Unv0SpPxZMg6hbnuVUGgZIwqbeTLJ6jKJDmV2R1p+yVYBGt3hqDCSPeWUPuT6dqFmz43oW8orgtAbW3G4mfg7kG2A5zGxQ5Ee0CK0emeEm5HiV2TTu0GLaj8yKfBsk9voW+g5GRmgcy1oFtIQ5bfVa9/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754440; c=relaxed/simple;
	bh=m9kKF0nkDiC+tYucsddp5I6CIFW19pkhbVVV3QVWYv8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FKPNOS6FANWtDn22ev0uQ6r6y8MUkt4BOxU1YjA/T9/IyInD1v+xViF9PkhKimtUsh9+su+1JY+yHDJFOKidmZbldGC/oYHK01M2qVzA7LySbeuywY+ZtxVDT0zS/DB5u6Yjs+6xUbO4f7B8sZ3+XzWgCGOjUL+D5g2KLE+H9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nl6m1YvQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nl6m1YvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770754439; x=1802290439;
  h=date:from:to:cc:subject:message-id;
  bh=m9kKF0nkDiC+tYucsddp5I6CIFW19pkhbVVV3QVWYv8=;
  b=nl6m1YvQIBoW4MQ79x0J30kLvzQq6q8HY7YSGf9KFw0rgy8J7zBd0DL2
   a+1UlJPt5Bd9V+0iT5JZgHytbakE+j9fGwPJ5Pw84AuEM9OsWQ5qjodqO
   NpfHPnGfhfEpzrq1OorWNAEqZHHDU05oG3K7NpZRpmS8eISJRr8GvCjOC
   OlUNUZv551sNug+jiaHbo1s5xmuinFWXpzM+vlScwHnI5QyxO1ETjvRrN
   Bi4X1aVNT9ANaLfpW3FRvhwQATvdd6rRUFUY4qRdIZu76HlcRpyyfOGZj
   hf9sI2urFqAxxfZjllHfj+vcuCD6b6DW6IO2yLd9RVxnfEcJN0zr/Kp5O
   g==;
X-CSE-ConnectionGUID: 55cNP0fnR8S86XIEJpz5sA==
X-CSE-MsgGUID: 2EIUEp4VQRm2xPI/XyZ57A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89307823"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89307823"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 12:13:59 -0800
X-CSE-ConnectionGUID: 6XA635GnTfuhNROAV8SLgA==
X-CSE-MsgGUID: RMGsSqBpS8KlC28SIaqlmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212057285"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 12:13:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpu7O-00000000pN8-2uLS;
	Tue, 10 Feb 2026 20:13:54 +0000
Date: Wed, 11 Feb 2026 04:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 80/105]
 drivers/infiniband/hw/irdma/verbs.c:2486:12: warning: variable 'cqe_size' set
 but not used
Message-ID: <202602110459.7V89MtqO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   b6daace542159a3879b60866e24495985ecffc23
commit: 85011166c2def0abc3247ccdbde5bccd2eaa234d [80/105] RDMA/irdma: Split user and kernel CQ creation paths
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110459.7V89MtqO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110459.7V89MtqO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110459.7V89MtqO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/irdma/verbs.c: In function 'irdma_create_user_cq':
>> drivers/infiniband/hw/irdma/verbs.c:2486:12: warning: variable 'cqe_size' set but not used [-Wunused-but-set-variable]
    2486 |         u8 cqe_size;
         |            ^~~~~~~~


vim +/cqe_size +2486 drivers/infiniband/hw/irdma/verbs.c

b48c24c2d710cf Mustafa Ismail    2021-06-02  2463  
85011166c2def0 Leon Romanovsky   2026-02-09  2464  static int irdma_create_user_cq(struct ib_cq *ibcq,
b48c24c2d710cf Mustafa Ismail    2021-06-02  2465  				const struct ib_cq_init_attr *attr,
dd6d7f8574d7f8 Akiva Goldberger  2024-06-27  2466  				struct uverbs_attr_bundle *attrs)
b48c24c2d710cf Mustafa Ismail    2021-06-02  2467  {
34acb833cc83bd Shiraz Saleem     2022-09-07  2468  #define IRDMA_CREATE_CQ_MIN_REQ_LEN offsetofend(struct irdma_create_cq_req, user_cq_buf)
34acb833cc83bd Shiraz Saleem     2022-09-07  2469  #define IRDMA_CREATE_CQ_MIN_RESP_LEN offsetofend(struct irdma_create_cq_resp, cq_size)
dd6d7f8574d7f8 Akiva Goldberger  2024-06-27  2470  	struct ib_udata *udata = &attrs->driver_udata;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2471  	struct ib_device *ibdev = ibcq->device;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2472  	struct irdma_device *iwdev = to_iwdev(ibdev);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2473  	struct irdma_pci_f *rf = iwdev->rf;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2474  	struct irdma_cq *iwcq = to_iwcq(ibcq);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2475  	u32 cq_num = 0;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2476  	struct irdma_sc_cq *cq;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2477  	struct irdma_sc_dev *dev = &rf->sc_dev;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2478  	struct irdma_cq_init_info info = {};
b48c24c2d710cf Mustafa Ismail    2021-06-02  2479  	struct irdma_cqp_request *cqp_request;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2480  	struct cqp_cmds_info *cqp_info;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2481  	struct irdma_cq_uk_init_info *ukinfo = &info.cq_uk_init_info;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2482  	unsigned long flags;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2483  	int err_code;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2484  	int entries = attr->cqe;
9a1d68786393c4 Shiraz Saleem     2025-08-27  2485  	bool cqe_64byte_ena;
0a192745551cd2 Jay Bhat          2025-10-30 @2486  	u8 cqe_size;
85011166c2def0 Leon Romanovsky   2026-02-09  2487  	struct irdma_ucontext *ucontext;
85011166c2def0 Leon Romanovsky   2026-02-09  2488  	struct irdma_create_cq_req req = {};
85011166c2def0 Leon Romanovsky   2026-02-09  2489  	struct irdma_cq_mr *cqmr;
85011166c2def0 Leon Romanovsky   2026-02-09  2490  	struct irdma_pbl *iwpbl;
85011166c2def0 Leon Romanovsky   2026-02-09  2491  	struct irdma_pbl *iwpbl_shadow;
85011166c2def0 Leon Romanovsky   2026-02-09  2492  	struct irdma_cq_mr *cqmr_shadow;
85011166c2def0 Leon Romanovsky   2026-02-09  2493  
85011166c2def0 Leon Romanovsky   2026-02-09  2494  	if (ibcq->umem)
85011166c2def0 Leon Romanovsky   2026-02-09  2495  		return -EOPNOTSUPP;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2496  
b48c24c2d710cf Mustafa Ismail    2021-06-02  2497  	err_code = cq_validate_flags(attr->flags, dev->hw_attrs.uk_attrs.hw_rev);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2498  	if (err_code)
b48c24c2d710cf Mustafa Ismail    2021-06-02  2499  		return err_code;
34acb833cc83bd Shiraz Saleem     2022-09-07  2500  
85011166c2def0 Leon Romanovsky   2026-02-09  2501  	if (udata->inlen < IRDMA_CREATE_CQ_MIN_REQ_LEN ||
85011166c2def0 Leon Romanovsky   2026-02-09  2502  	    udata->outlen < IRDMA_CREATE_CQ_MIN_RESP_LEN)
34acb833cc83bd Shiraz Saleem     2022-09-07  2503  		return -EINVAL;
34acb833cc83bd Shiraz Saleem     2022-09-07  2504  
b48c24c2d710cf Mustafa Ismail    2021-06-02  2505  	err_code = irdma_alloc_rsrc(rf, rf->allocated_cqs, rf->max_cq, &cq_num,
b48c24c2d710cf Mustafa Ismail    2021-06-02  2506  				    &rf->next_cq);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2507  	if (err_code)
b48c24c2d710cf Mustafa Ismail    2021-06-02  2508  		return err_code;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2509  
b48c24c2d710cf Mustafa Ismail    2021-06-02  2510  	cq = &iwcq->sc_cq;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2511  	cq->back_cq = iwcq;
e49bad785e550f Krzysztof Czurylo 2023-07-25  2512  	refcount_set(&iwcq->refcnt, 1);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2513  	spin_lock_init(&iwcq->lock);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2514  	INIT_LIST_HEAD(&iwcq->resize_list);
81091d7696ae71 Mustafa Ismail    2022-04-25  2515  	INIT_LIST_HEAD(&iwcq->cmpl_generated);
5575b7646b94c0 Jacob Moroni      2025-09-23  2516  	iwcq->cq_num = cq_num;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2517  	info.dev = dev;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2518  	ukinfo->cq_size = max(entries, 4);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2519  	ukinfo->cq_id = cq_num;
9a1d68786393c4 Shiraz Saleem     2025-08-27  2520  	cqe_64byte_ena = dev->hw_attrs.uk_attrs.feature_flags & IRDMA_FEATURE_64_BYTE_CQE ?
9a1d68786393c4 Shiraz Saleem     2025-08-27  2521  			 true : false;
0a192745551cd2 Jay Bhat          2025-10-30  2522  	cqe_size = cqe_64byte_ena ? 64 : 32;
9a1d68786393c4 Shiraz Saleem     2025-08-27  2523  	ukinfo->avoid_mem_cflct = cqe_64byte_ena;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2524  	iwcq->ibcq.cqe = info.cq_uk_init_info.cq_size;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2525  	if (attr->comp_vector < rf->ceqs_count)
b48c24c2d710cf Mustafa Ismail    2021-06-02  2526  		info.ceq_id = attr->comp_vector;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2527  	info.ceq_id_valid = true;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2528  	info.ceqe_mask = 1;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2529  	info.type = IRDMA_CQ_TYPE_IWARP;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2530  	info.vsi = &iwdev->vsi;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2531  
b48c24c2d710cf Mustafa Ismail    2021-06-02  2532  	iwcq->user_mode = true;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2533  	ucontext =
b48c24c2d710cf Mustafa Ismail    2021-06-02  2534  		rdma_udata_to_drv_context(udata, struct irdma_ucontext,
b48c24c2d710cf Mustafa Ismail    2021-06-02  2535  					  ibucontext);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2536  	if (ib_copy_from_udata(&req, udata,
b48c24c2d710cf Mustafa Ismail    2021-06-02  2537  			       min(sizeof(req), udata->inlen))) {
b48c24c2d710cf Mustafa Ismail    2021-06-02  2538  		err_code = -EFAULT;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2539  		goto cq_free_rsrc;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2540  	}
b48c24c2d710cf Mustafa Ismail    2021-06-02  2541  
b48c24c2d710cf Mustafa Ismail    2021-06-02  2542  	spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2543  	iwpbl = irdma_get_pbl((unsigned long)req.user_cq_buf,
b48c24c2d710cf Mustafa Ismail    2021-06-02  2544  			      &ucontext->cq_reg_mem_list);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2545  	spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2546  	if (!iwpbl) {
b48c24c2d710cf Mustafa Ismail    2021-06-02  2547  		err_code = -EPROTO;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2548  		goto cq_free_rsrc;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2549  	}
b48c24c2d710cf Mustafa Ismail    2021-06-02  2550  
b48c24c2d710cf Mustafa Ismail    2021-06-02  2551  	cqmr = &iwpbl->cq_mr;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2552  
b48c24c2d710cf Mustafa Ismail    2021-06-02  2553  	if (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
b48c24c2d710cf Mustafa Ismail    2021-06-02  2554  	    IRDMA_FEATURE_CQ_RESIZE && !ucontext->legacy_mode) {
b48c24c2d710cf Mustafa Ismail    2021-06-02  2555  		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2556  		iwpbl_shadow = irdma_get_pbl(
b48c24c2d710cf Mustafa Ismail    2021-06-02  2557  				(unsigned long)req.user_shadow_area,
b48c24c2d710cf Mustafa Ismail    2021-06-02  2558  				&ucontext->cq_reg_mem_list);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2559  		spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
b48c24c2d710cf Mustafa Ismail    2021-06-02  2560  
b48c24c2d710cf Mustafa Ismail    2021-06-02  2561  		if (!iwpbl_shadow) {
b48c24c2d710cf Mustafa Ismail    2021-06-02  2562  			err_code = -EPROTO;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2563  			goto cq_free_rsrc;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2564  		}
b48c24c2d710cf Mustafa Ismail    2021-06-02  2565  		cqmr_shadow = &iwpbl_shadow->cq_mr;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2566  		info.shadow_area_pa = cqmr_shadow->cq_pbl.addr;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2567  		cqmr->split = true;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2568  	} else {
b48c24c2d710cf Mustafa Ismail    2021-06-02  2569  		info.shadow_area_pa = cqmr->shadow;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2570  	}
b48c24c2d710cf Mustafa Ismail    2021-06-02  2571  	if (iwpbl->pbl_allocated) {
b48c24c2d710cf Mustafa Ismail    2021-06-02  2572  		info.virtual_map = true;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2573  		info.pbl_chunk_size = 1;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2574  		info.first_pm_pbl_idx = cqmr->cq_pbl.idx;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2575  	} else {
b48c24c2d710cf Mustafa Ismail    2021-06-02  2576  		info.cq_base_pa = cqmr->cq_pbl.addr;
b48c24c2d710cf Mustafa Ismail    2021-06-02  2577  	}
85011166c2def0 Leon Romanovsky   2026-02-09  2578  
85011166c2def0 Leon Romanovsky   2026-02-09  2579  	info.shadow_read_threshold = min(info.cq_uk_init_info.cq_size / 2,
85011166c2def0 Leon Romanovsky   2026-02-09  2580  					 (u32)IRDMA_MAX_CQ_READ_THRESH);
85011166c2def0 Leon Romanovsky   2026-02-09  2581  
85011166c2def0 Leon Romanovsky   2026-02-09  2582  	if (irdma_sc_cq_init(cq, &info)) {
85011166c2def0 Leon Romanovsky   2026-02-09  2583  		ibdev_dbg(&iwdev->ibdev, "VERBS: init cq fail\n");
85011166c2def0 Leon Romanovsky   2026-02-09  2584  		err_code = -EPROTO;
85011166c2def0 Leon Romanovsky   2026-02-09  2585  		goto cq_free_rsrc;
85011166c2def0 Leon Romanovsky   2026-02-09  2586  	}
85011166c2def0 Leon Romanovsky   2026-02-09  2587  
85011166c2def0 Leon Romanovsky   2026-02-09  2588  	cqp_request = irdma_alloc_and_get_cqp_request(&rf->cqp, true);
85011166c2def0 Leon Romanovsky   2026-02-09  2589  	if (!cqp_request) {
85011166c2def0 Leon Romanovsky   2026-02-09  2590  		err_code = -ENOMEM;
85011166c2def0 Leon Romanovsky   2026-02-09  2591  		goto cq_free_rsrc;
85011166c2def0 Leon Romanovsky   2026-02-09  2592  	}
85011166c2def0 Leon Romanovsky   2026-02-09  2593  
85011166c2def0 Leon Romanovsky   2026-02-09  2594  	cqp_info = &cqp_request->info;
85011166c2def0 Leon Romanovsky   2026-02-09  2595  	cqp_info->cqp_cmd = IRDMA_OP_CQ_CREATE;
85011166c2def0 Leon Romanovsky   2026-02-09  2596  	cqp_info->post_sq = 1;
85011166c2def0 Leon Romanovsky   2026-02-09  2597  	cqp_info->in.u.cq_create.cq = cq;
85011166c2def0 Leon Romanovsky   2026-02-09  2598  	cqp_info->in.u.cq_create.check_overflow = true;
85011166c2def0 Leon Romanovsky   2026-02-09  2599  	cqp_info->in.u.cq_create.scratch = (uintptr_t)cqp_request;
85011166c2def0 Leon Romanovsky   2026-02-09  2600  	err_code = irdma_handle_cqp_op(rf, cqp_request);
85011166c2def0 Leon Romanovsky   2026-02-09  2601  	irdma_put_cqp_request(&rf->cqp, cqp_request);
85011166c2def0 Leon Romanovsky   2026-02-09  2602  	if (err_code)
85011166c2def0 Leon Romanovsky   2026-02-09  2603  		goto cq_free_rsrc;
85011166c2def0 Leon Romanovsky   2026-02-09  2604  
85011166c2def0 Leon Romanovsky   2026-02-09  2605  	struct irdma_create_cq_resp resp = {};
85011166c2def0 Leon Romanovsky   2026-02-09  2606  
85011166c2def0 Leon Romanovsky   2026-02-09  2607  	resp.cq_id = info.cq_uk_init_info.cq_id;
85011166c2def0 Leon Romanovsky   2026-02-09  2608  	resp.cq_size = info.cq_uk_init_info.cq_size;
85011166c2def0 Leon Romanovsky   2026-02-09  2609  	if (ib_copy_to_udata(udata, &resp,
85011166c2def0 Leon Romanovsky   2026-02-09  2610  			     min(sizeof(resp), udata->outlen))) {
85011166c2def0 Leon Romanovsky   2026-02-09  2611  		ibdev_dbg(&iwdev->ibdev,
85011166c2def0 Leon Romanovsky   2026-02-09  2612  			  "VERBS: copy to user data\n");
85011166c2def0 Leon Romanovsky   2026-02-09  2613  		err_code = -EPROTO;
85011166c2def0 Leon Romanovsky   2026-02-09  2614  		goto cq_destroy;
85011166c2def0 Leon Romanovsky   2026-02-09  2615  	}
85011166c2def0 Leon Romanovsky   2026-02-09  2616  
85011166c2def0 Leon Romanovsky   2026-02-09  2617  	init_completion(&iwcq->free_cq);
85011166c2def0 Leon Romanovsky   2026-02-09  2618  
85011166c2def0 Leon Romanovsky   2026-02-09  2619  	/* Populate table entry after CQ is fully created. */
85011166c2def0 Leon Romanovsky   2026-02-09  2620  	smp_store_release(&rf->cq_table[cq_num], iwcq);
85011166c2def0 Leon Romanovsky   2026-02-09  2621  
85011166c2def0 Leon Romanovsky   2026-02-09  2622  	return 0;
85011166c2def0 Leon Romanovsky   2026-02-09  2623  cq_destroy:
85011166c2def0 Leon Romanovsky   2026-02-09  2624  	irdma_cq_wq_destroy(rf, cq);
85011166c2def0 Leon Romanovsky   2026-02-09  2625  cq_free_rsrc:
85011166c2def0 Leon Romanovsky   2026-02-09  2626  	irdma_cq_free_rsrc(rf, iwcq);
85011166c2def0 Leon Romanovsky   2026-02-09  2627  
85011166c2def0 Leon Romanovsky   2026-02-09  2628  	return err_code;
85011166c2def0 Leon Romanovsky   2026-02-09  2629  }
85011166c2def0 Leon Romanovsky   2026-02-09  2630  

:::::: The code at line 2486 was first introduced by commit
:::::: 0a192745551cd2e999532075f21c0cfa174bc065 RDMA/irdma: CQ size and shadow update changes for GEN3

:::::: TO: Jay Bhat <jay.bhat@intel.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
