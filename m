Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D8153511
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689735; cv=none; b=UUGCznZ5Q6XptT8bIBV3QNkcP7cdD8mtYfjXF0S314Vw1o3gb/RM09RY4kqfa+njQOVN9wm4oa+A/Tb76ocPx6RwWHRif1KRtZDcTtg8yecrVu4wZy43o/r9nG44pQXagVndwAXnL2FVZbB3SzT4b76oYiJkKhz4arOusNSVv4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689735; c=relaxed/simple;
	bh=mp88wxlm9CKJ5qJV7aSEoNug5tDck/Mp9efesrciyTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7YZ/7fmyXsxXjX7l5QLRbmXZebzJXJ3m6ERZN3FNj3PJaLyGdXi9ZLpHQpSk7igJDxPR0JYh43adxeP2BzI3EOk8Cm1Z4tVJ5jDSNUBpXbWQNGhJiAn0gDCjxOKlkVH9Tzz2YA3HhKlW673iai9fAO8lSlLd84kheKAkI3S3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3xtXp6R; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3xtXp6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717689734; x=1749225734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mp88wxlm9CKJ5qJV7aSEoNug5tDck/Mp9efesrciyTc=;
  b=g3xtXp6RZfSPxKFdbnLn3folFQpO8obETT86P7g2r7eFjGMqTFPFc+fb
   BEmmLnLuwJfrur0dhcG6huVauhzcuwORmaRfRtifZG4pa75tmleHT5Ggy
   sslnUNXLvY4DDmpkcp5OISqelciUYwjPt3ktzYvaI80X9BZ2c6Jtbdv+F
   zygC1cmR5Hmvb1qany8IF9jHFO6nzoe5Xpch6qUl86LXycJxt3oOJwRzV
   CsBLgOVeE/MHNFVAGLVJwuCfs7AxZ1d3wybUbq5yjHH6M2jcvZdEbGcT5
   1c/MlxO206eBt15qT/ypLQNXFA5aZk5gfRaZeOXidzbEPvHgg4QUs25R1
   g==;
X-CSE-ConnectionGUID: sLcjuFUPQkmwtYQZ0wsTkA==
X-CSE-MsgGUID: MguYSTSNQFq7NbzEeOS7Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14490585"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14490585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:01:49 -0700
X-CSE-ConnectionGUID: C+cz3a4nR6Ol4lcQMQM1Eg==
X-CSE-MsgGUID: JoBU3/mWRxupgSnFbCOTng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="43108061"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 09:01:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFFYe-0003K4-2V;
	Thu, 06 Jun 2024 16:01:44 +0000
Date: Thu, 6 Jun 2024 23:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Akiva Goldberger <agoldberger@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 34/35]
 drivers/infiniband/sw/siw/siw_main.c:235:22: error: initialization of 'int
 (*)(struct ib_cq *, const struct ib_cq_init_attr *, struct
 uverbs_attr_bundle *)' from incompatible pointer type 'int (*)(struct ib_cq
 *, const struct ib_cq_init_attr *, struct ib_...
Message-ID: <202406062329.QfeUDLl3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   2ed5b0102c333dc3a591c2b79c6065c3ded2ddc2
commit: fbb0777c51553ab933d70fe1518ea3d6afa5d6a7 [34/35] RDMA: Pass entire uverbs attr bundle to create cq function
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406062329.QfeUDLl3-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406062329.QfeUDLl3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406062329.QfeUDLl3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/sw/siw/siw_main.c:235:22: error: initialization of 'int (*)(struct ib_cq *, const struct ib_cq_init_attr *, struct uverbs_attr_bundle *)' from incompatible pointer type 'int (*)(struct ib_cq *, const struct ib_cq_init_attr *, struct ib_udata *)' [-Werror=incompatible-pointer-types]
     235 |         .create_cq = siw_create_cq,
         |                      ^~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_main.c:235:22: note: (near initialization for 'siw_device_ops.create_cq')
   cc1: some warnings being treated as errors


vim +235 drivers/infiniband/sw/siw/siw_main.c

bdcf26bf9b3acb Bernard Metzler 2019-06-20  226  
bdcf26bf9b3acb Bernard Metzler 2019-06-20  227  static const struct ib_device_ops siw_device_ops = {
bdcf26bf9b3acb Bernard Metzler 2019-06-20  228  	.owner = THIS_MODULE,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  229  	.uverbs_abi_ver = SIW_ABI_VERSION,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  230  	.driver_id = RDMA_DRIVER_SIW,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  231  
bdcf26bf9b3acb Bernard Metzler 2019-06-20  232  	.alloc_mr = siw_alloc_mr,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  233  	.alloc_pd = siw_alloc_pd,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  234  	.alloc_ucontext = siw_alloc_ucontext,
bdcf26bf9b3acb Bernard Metzler 2019-06-20 @235  	.create_cq = siw_create_cq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  236  	.create_qp = siw_create_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  237  	.create_srq = siw_create_srq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  238  	.dealloc_driver = siw_device_cleanup,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  239  	.dealloc_pd = siw_dealloc_pd,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  240  	.dealloc_ucontext = siw_dealloc_ucontext,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  241  	.dereg_mr = siw_dereg_mr,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  242  	.destroy_cq = siw_destroy_cq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  243  	.destroy_qp = siw_destroy_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  244  	.destroy_srq = siw_destroy_srq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  245  	.get_dma_mr = siw_get_dma_mr,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  246  	.get_port_immutable = siw_get_port_immutable,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  247  	.iw_accept = siw_accept,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  248  	.iw_add_ref = siw_qp_get_ref,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  249  	.iw_connect = siw_connect,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  250  	.iw_create_listen = siw_create_listen,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  251  	.iw_destroy_listen = siw_destroy_listen,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  252  	.iw_get_qp = siw_get_base_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  253  	.iw_reject = siw_reject,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  254  	.iw_rem_ref = siw_qp_put_ref,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  255  	.map_mr_sg = siw_map_mr_sg,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  256  	.mmap = siw_mmap,
11f1a75567c43e Michal Kalderon 2019-10-30  257  	.mmap_free = siw_mmap_free,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  258  	.modify_qp = siw_verbs_modify_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  259  	.modify_srq = siw_modify_srq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  260  	.poll_cq = siw_poll_cq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  261  	.post_recv = siw_post_receive,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  262  	.post_send = siw_post_send,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  263  	.post_srq_recv = siw_post_srq_recv,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  264  	.query_device = siw_query_device,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  265  	.query_gid = siw_query_gid,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  266  	.query_port = siw_query_port,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  267  	.query_qp = siw_query_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  268  	.query_srq = siw_query_srq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  269  	.req_notify_cq = siw_req_notify_cq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  270  	.reg_user_mr = siw_reg_user_mr,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  271  
bdcf26bf9b3acb Bernard Metzler 2019-06-20  272  	INIT_RDMA_OBJ_SIZE(ib_cq, siw_cq, base_cq),
bdcf26bf9b3acb Bernard Metzler 2019-06-20  273  	INIT_RDMA_OBJ_SIZE(ib_pd, siw_pd, base_pd),
514aee660df493 Leon Romanovsky 2021-07-23  274  	INIT_RDMA_OBJ_SIZE(ib_qp, siw_qp, base_qp),
bdcf26bf9b3acb Bernard Metzler 2019-06-20  275  	INIT_RDMA_OBJ_SIZE(ib_srq, siw_srq, base_srq),
bdcf26bf9b3acb Bernard Metzler 2019-06-20  276  	INIT_RDMA_OBJ_SIZE(ib_ucontext, siw_ucontext, base_ucontext),
bdcf26bf9b3acb Bernard Metzler 2019-06-20  277  };
bdcf26bf9b3acb Bernard Metzler 2019-06-20  278  

:::::: The code at line 235 was first introduced by commit
:::::: bdcf26bf9b3acb03c8f90387cfc6474fc8ac5521 rdma/siw: network and RDMA core interface

:::::: TO: Bernard Metzler <bmt@zurich.ibm.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
