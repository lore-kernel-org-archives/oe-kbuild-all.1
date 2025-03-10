Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C921225761
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741599829; cv=none; b=bqJOBY7KUml8JlFsI77pkQk/9HtMiL5i9u0ccJIbaP3w9RrVQPsER/SqbNoMFNUL1BxxThirH/Wc485z/yqqvuPshB6S5rPAm/cF4XVL6jXiL1c6IZ0dldvuzDp8T+YZsCNVG6gj4XkqITIcF3GXXLMWW+py/GGISY2yd2n+Pq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741599829; c=relaxed/simple;
	bh=9751ai/kxt7TEkYdZxAn5qZMgn7fIqBP1AAysoTZP+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLdUs6ajGEARZr1M9Z8MJX9GBtvQLTZmBBniG0otNkEFCHE2IYHJe+/5H4NLgOG39bdUv9IYgRTPTCXH3TyWx65HcM8m1ryTEbrUeBmjOMw6ipvmb6bPl7oHhfk6ZXxH5EKaj/hVCn57NivDztUKYsxdPMbD3cVcPgozWr1uzbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwC/84rc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwC/84rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741599828; x=1773135828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9751ai/kxt7TEkYdZxAn5qZMgn7fIqBP1AAysoTZP+Y=;
  b=MwC/84rcwxc/3ij5wUyJ8F9997cNc5UYfwgQdnTSYBdfNexCm5R9tppi
   vGmemB/MMqa2z+fHoTtHAXNDW3R170oqm6edo36WCSQBbvTYe93YXlZsM
   zfQ5it/ex2VXgukl/i9267wlhzzxTQ9rW9hBhHZvR5wOvIEKwE42XBlXg
   3gPNZPMPa1rya/FDLn5EHNu4E5sdJv2dQZBsN9IwGw+3UL8ICQ6FdUz7C
   2Z2tZPl+BHpdXS9M69+fPRvEsOksN67iddJ/Xsuteq5cBbLXu9UCznRQc
   PUQV2HX3U0ZemBy8Mxc3VvjjKsLaz+mLBif0rhXcKHT/dAVwnXc2qCSCx
   w==;
X-CSE-ConnectionGUID: sldzNG3iTuyqSiYp8rDzdA==
X-CSE-MsgGUID: fkoj8Q6vTWGWOQVOj1jJLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42497325"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42497325"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 02:43:47 -0700
X-CSE-ConnectionGUID: FBS2wnvMTRG3gl9D5bu0PA==
X-CSE-MsgGUID: GWtIHxL6Ro63wry5VxAchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124100578"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 10 Mar 2025 02:43:46 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trZfi-00043g-0Y;
	Mon, 10 Mar 2025 09:43:42 +0000
Date: Mon, 10 Mar 2025 17:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 drivers/infiniband/hw/erdma/erdma_verbs.c:763:5: warning: no previous
 prototype for 'erdma_create_qp'
Message-ID: <202503101728.FMVx3IzK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   797aae63f086cf8250bfbb8395ab310c525ac4a6
commit: 59a25cfd18fb1137654a69ab58eba29ee5f72cf6 [1/1] anolis: RDMA/erdma: Update for hardware
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250310/202503101728.FMVx3IzK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101728.FMVx3IzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101728.FMVx3IzK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/erdma/erdma_verbs.c:763:5: warning: no previous prototype for 'erdma_create_qp' [-Wmissing-prototypes]
     763 | int erdma_create_qp(struct ib_qp *ibqp, struct ib_qp_init_attr *attrs,
         |     ^~~~~~~~~~~~~~~


vim +/erdma_create_qp +763 drivers/infiniband/hw/erdma/erdma_verbs.c

   762	
 > 763	int erdma_create_qp(struct ib_qp *ibqp, struct ib_qp_init_attr *attrs,
   764			    struct ib_udata *udata)
   765	{
   766		struct erdma_qp *qp = to_eqp(ibqp);
   767		struct erdma_dev *dev = to_edev(ibqp->device);
   768		struct erdma_ucontext *uctx;
   769		struct erdma_ureq_create_qp ureq;
   770		struct erdma_uresp_create_qp uresp;
   771		int ret;
   772	
   773		uctx = rdma_udata_to_drv_context(udata, struct erdma_ucontext,
   774						 ibucontext);
   775	
   776		ERDMA_INC_CNT(dev, CMD_CREATE_QP);
   777	
   778		ret = erdma_qp_validate_cap(dev, attrs);
   779		if (ret)
   780			goto err_out;
   781	
   782		ret = erdma_qp_validate_attr(dev, attrs);
   783		if (ret)
   784			goto err_out;
   785	
   786		qp->scq = to_ecq(attrs->send_cq);
   787		qp->rcq = to_ecq(attrs->recv_cq);
   788		qp->dev = dev;
   789		qp->attrs.cc = dev->attrs.cc;
   790	
   791		init_rwsem(&qp->state_lock);
   792		kref_init(&qp->ref);
   793		init_completion(&qp->safe_free);
   794	
   795		ret = xa_alloc_cyclic(&dev->qp_xa, &qp->ibqp.qp_num, qp,
   796				      XA_LIMIT(1, dev->attrs.max_qp - 1),
   797				      &dev->next_alloc_qpn, GFP_KERNEL);
   798		if (ret < 0) {
   799			ret = -ENOMEM;
   800			goto err_out;
   801		}
   802	
   803		qp->attrs.sq_size = roundup_pow_of_two(attrs->cap.max_send_wr *
   804						       ERDMA_MAX_WQEBB_PER_SQE);
   805		qp->attrs.rq_size = roundup_pow_of_two(attrs->cap.max_recv_wr);
   806	
   807		if (uctx) {
   808			ret = ib_copy_from_udata(&ureq, udata,
   809						 min(sizeof(ureq), udata->inlen));
   810			if (ret)
   811				goto err_out_xa;
   812	
   813			ret = init_user_qp(qp, udata, uctx, ureq.qbuf_va, ureq.qbuf_len,
   814					   ureq.db_record_va);
   815			if (ret)
   816				goto err_out_xa;
   817	
   818			memset(&uresp, 0, sizeof(uresp));
   819	
   820			uresp.num_sqe = qp->attrs.sq_size;
   821			uresp.num_rqe = qp->attrs.rq_size;
   822			uresp.qp_id = QP_ID(qp);
   823			uresp.rq_offset = qp->user_qp.rq_offset;
   824	
   825			ret = ib_copy_to_udata(udata, &uresp, sizeof(uresp));
   826			if (ret)
   827				goto err_out_cmd;
   828		} else {
   829			ret = init_kernel_qp(dev, qp, attrs);
   830			if (ret)
   831				goto err_out_xa;
   832		}
   833	
   834		qp->attrs.max_send_sge = attrs->cap.max_send_sge;
   835		qp->attrs.max_recv_sge = attrs->cap.max_recv_sge;
   836		qp->attrs.state = ERDMA_QP_STATE_IDLE;
   837	
   838		ret = create_qp_cmd(dev, qp, uctx ? true : false);
   839		if (ret)
   840			goto err_out_cmd;
   841	
   842		return 0;
   843	
   844	err_out_cmd:
   845		if (uctx)
   846			free_user_qp(qp, uctx);
   847		else
   848			free_kernel_qp(qp);
   849	err_out_xa:
   850		xa_erase(&dev->qp_xa, QP_ID(qp));
   851	err_out:
   852		ERDMA_INC_CNT(dev, CMD_CREATE_QP_FAILED);
   853		return ret;
   854	}
   855	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
