Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658B12EBEE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711555785; cv=none; b=X5+AGNSet420rTLqHSYGsVnKMowMjjOdG5nJgDnTssvJxUzkuaPyNjfQyjFK0/JddmiHb5dNvIcsTBcT3Oz6Tv3CgwHOdcNEwg8iftQIS1P0EihwcuAL1DPIAaMfsUvL9DX2FHkoIiifyKh1MOscCAE9ajP5PU25ZD3mJqU4FqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711555785; c=relaxed/simple;
	bh=urssge3TSWaWaGBVofVUOGpxD/V72hGYEUGON8Xdj3Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fcrU7RBfdLmy/7VvVBPVxCbf3K8DHU2Gjm5MRhG2QOkRyvarVPH98qSVnOF5hLV2zeHZlE3TCsYwvZs11pvgqX6gDj6lM6FQ35EWRHSAMZRgxfvyJ3HjM7ypBQ5cqNXBPSuaaqH94rZJXEg8zAj+qyirdaWz0jGvPbE48FxBeBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLEGAlPt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLEGAlPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711555784; x=1743091784;
  h=date:from:cc:subject:message-id:mime-version;
  bh=urssge3TSWaWaGBVofVUOGpxD/V72hGYEUGON8Xdj3Y=;
  b=KLEGAlPtU6VftrbprorkX9NW/JA2VCTGNB2CKQzQEE2stk4DE3vDm079
   2VkXSTIb1D3+8PL2iFAI1TpBYU0FeGkPr349eb4Y7Xmnv/w02ejh5FZy3
   H0RK36U+0a2ePog7RtVj/SlyB3q5VL+eNvNO2SgLDslhqiq721wR6IL8d
   xk9glQpz1WacXKrbti35xL0KQmA6IAi5lRncOBFG5USwdN3UAXRl4Fl+E
   F51SURlv07eKYW/p2Pzrx8LysELorxAn2oUQ2eGz973qF6nDqkG+CpW54
   9e3Zj7uEbqpqyuhLgOBtJAaVpci8wy+f/DSxjOuzFbfqFvhh5PT5Pv1zo
   Q==;
X-CSE-ConnectionGUID: vPaCXbmKRa6uRdaERIfkSw==
X-CSE-MsgGUID: aM4t10xPRm2NquRHM3ucaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17218488"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17218488"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="47552427"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Mar 2024 09:09:31 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpVqC-0001DQ-2M;
	Wed, 27 Mar 2024 16:09:28 +0000
Date: Thu, 28 Mar 2024 00:09:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:linux-6.1.y 397/500] drivers/infiniband/hw/irdma/verbs.c:584:
 warning: Function parameter or member 'udata' not described in
 'irdma_setup_umode_qp'
Message-ID: <202403280004.TRdj9FkK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git linux-6.1.y
head:   e5cd595e23c1a075359a337c0e5c3a4f2dc28dd1
commit: 0606bedcc373696c4c7d637dc30ed50725d184f5 [397/500] RDMA/irdma: Allow accurate reporting on QP max send/recv WR
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240328/202403280004.TRdj9FkK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280004.TRdj9FkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280004.TRdj9FkK-lkp@intel.com/

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
