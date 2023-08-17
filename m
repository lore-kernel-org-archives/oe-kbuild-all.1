Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FB5DDCC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692259666; x=1723795666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=202arcQlFehL1pVjXsCrC3178EU9+QZUz5WfmTkd2w4=;
  b=RFrBSzSSOCjdSCxC+og7DD/aexHujuqtQYsmZy4vVTFKfs2kQrVNzkKy
   ueZaWmUajyY9w74Ar3hx4aBB8VF95IRaUgl2Gl3HfFWbkXeNTeIgt5nVd
   WXKSPSt8hWDtP+JXfI1ExD4FdN02kFhxuvG4Q33IZLCgIE2gw1mNMkvZB
   ZD7LxIfKEC1vDOPqpozBKgsN20iy57Z1KB0tfW+LbHWLRxSitSD8YY4SR
   kFGet2HHFL982xUyVLlJTKLo5HRJEEjvgZq686Ks+9iaAwbIrQLSwOXRh
   HYpBXkht/3ScIvR9+wcZHP/Kt9DZogrjNyLY/ajF1fHoqLwbbhd5w3FyQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459101066"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="459101066"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799935015"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="799935015"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 01:07:42 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWY2e-0000vt-0L;
	Thu, 17 Aug 2023 08:07:40 +0000
Date: Thu, 17 Aug 2023 16:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sindhu Devale <sindhu.devale@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Leon Romanovsky <leon@kernel.org>,
	Youvaraj Sagar <youvaraj.sagar@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>
Subject: [linux-next:master 4857/10848]
 drivers/infiniband/hw/irdma/verbs.c:584: warning: Function parameter or
 member 'udata' not described in 'irdma_setup_umode_qp'
Message-ID: <202308171620.m4MNACWz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
commit: 3a8498720450174b8db450d3375a04dca81b3534 [4857/10848] RDMA/irdma: Allow accurate reporting on QP max send/recv WR
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308171620.m4MNACWz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171620.m4MNACWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171620.m4MNACWz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/irdma/verbs.c:584: warning: Function parameter or member 'udata' not described in 'irdma_setup_umode_qp'


vim +584 drivers/infiniband/hw/irdma/verbs.c

   571	
   572	/**
   573	 * irdma_setup_umode_qp - setup sq and rq size in user mode qp
   574	 * @iwdev: iwarp device
   575	 * @iwqp: qp ptr (user or kernel)
   576	 * @info: initialize info to return
   577	 * @init_attr: Initial QP create attributes
   578	 */
   579	static int irdma_setup_umode_qp(struct ib_udata *udata,
   580					struct irdma_device *iwdev,
   581					struct irdma_qp *iwqp,
   582					struct irdma_qp_init_info *info,
   583					struct ib_qp_init_attr *init_attr)
 > 584	{
   585		struct irdma_ucontext *ucontext = rdma_udata_to_drv_context(udata,
   586					struct irdma_ucontext, ibucontext);
   587		struct irdma_qp_uk_init_info *ukinfo = &info->qp_uk_init_info;
   588		struct irdma_create_qp_req req;
   589		unsigned long flags;
   590		int ret;
   591	
   592		ret = ib_copy_from_udata(&req, udata,
   593					 min(sizeof(req), udata->inlen));
   594		if (ret) {
   595			ibdev_dbg(&iwdev->ibdev, "VERBS: ib_copy_from_data fail\n");
   596			return ret;
   597		}
   598	
   599		iwqp->ctx_info.qp_compl_ctx = req.user_compl_ctx;
   600		iwqp->user_mode = 1;
   601		if (req.user_wqe_bufs) {
   602			info->qp_uk_init_info.legacy_mode = ucontext->legacy_mode;
   603			spin_lock_irqsave(&ucontext->qp_reg_mem_list_lock, flags);
   604			iwqp->iwpbl = irdma_get_pbl((unsigned long)req.user_wqe_bufs,
   605						    &ucontext->qp_reg_mem_list);
   606			spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock, flags);
   607	
   608			if (!iwqp->iwpbl) {
   609				ret = -ENODATA;
   610				ibdev_dbg(&iwdev->ibdev, "VERBS: no pbl info\n");
   611				return ret;
   612			}
   613		}
   614	
   615		if (!ucontext->use_raw_attrs) {
   616			/**
   617			 * Maintain backward compat with older ABI which passes sq and
   618			 * rq depth in quanta in cap.max_send_wr and cap.max_recv_wr.
   619			 * There is no way to compute the correct value of
   620			 * iwqp->max_send_wr/max_recv_wr in the kernel.
   621			 */
   622			iwqp->max_send_wr = init_attr->cap.max_send_wr;
   623			iwqp->max_recv_wr = init_attr->cap.max_recv_wr;
   624			ukinfo->sq_size = init_attr->cap.max_send_wr;
   625			ukinfo->rq_size = init_attr->cap.max_recv_wr;
   626			irdma_uk_calc_shift_wq(ukinfo, &ukinfo->sq_shift,
   627					       &ukinfo->rq_shift);
   628		} else {
   629			ret = irdma_uk_calc_depth_shift_sq(ukinfo, &ukinfo->sq_depth,
   630							   &ukinfo->sq_shift);
   631			if (ret)
   632				return ret;
   633	
   634			ret = irdma_uk_calc_depth_shift_rq(ukinfo, &ukinfo->rq_depth,
   635							   &ukinfo->rq_shift);
   636			if (ret)
   637				return ret;
   638	
   639			iwqp->max_send_wr =
   640				(ukinfo->sq_depth - IRDMA_SQ_RSVD) >> ukinfo->sq_shift;
   641			iwqp->max_recv_wr =
   642				(ukinfo->rq_depth - IRDMA_RQ_RSVD) >> ukinfo->rq_shift;
   643			ukinfo->sq_size = ukinfo->sq_depth >> ukinfo->sq_shift;
   644			ukinfo->rq_size = ukinfo->rq_depth >> ukinfo->rq_shift;
   645		}
   646	
   647		irdma_setup_virt_qp(iwdev, iwqp, info);
   648	
   649		return 0;
   650	}
   651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
