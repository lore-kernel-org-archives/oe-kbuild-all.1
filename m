Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76F03254AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 18:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749886; cv=none; b=Sfv5Sg5mZ0l835/uRZ/rl0EYEp4qk+tA4a10YDME2MixhF8eSg3Y7kIq8NLnKO5vyLXreOM8ZCyXw7CgkYMC1WgY+p/Ock6ww79McdzlI95aVFPIho3hSqXI/s7YJBsKbLfUlucTw6MEHa83qrswv6uaZT/pm8ZFc2YDEmBf5gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749886; c=relaxed/simple;
	bh=LCM73XTSrnqBv4RZBagyTotqOS4BQKJ1iCJfNaDf3ug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jfBjsJz3Cb+o+coYr49YTLPDkEwurR9U5yWBKxNvnJ6A+v9UOSywWnCVxYaYI0v18Ox0BZgKOJ57hC1kvBTZXjojwIiG81u+XM2+X95Jo4cHmq2iAPoSc99iHvII9zn9bpgjTVFmeIZvQjT34MAPiPrYjukjnhZ2a3v2sXd7u6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zunn7bt6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zunn7bt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770749885; x=1802285885;
  h=date:from:to:cc:subject:message-id;
  bh=LCM73XTSrnqBv4RZBagyTotqOS4BQKJ1iCJfNaDf3ug=;
  b=Zunn7bt6p+Nt3zJ6PwsxEXIDOPm0zP7ceu6N7F2KxXUI+bvpzJ3AZA3H
   B66g6eSX8Vy2gMSeHfNkyKI4gAYBVAFdRmlztowv8c9NztoHNvdieeNun
   bW9KcpcvK40D2FfAWAd+SYX5M/6c1BqVeqp479Wu4sLy96ozd6dhDNpud
   S0e956zy+TLFpKAfp6pY+XHJjwUmAOlqz1uEUgM0GJBfZYcwqjbc8FinZ
   eKTbzw7wrqqA5yhnJSYQ/hg/Es1UisNbo7L7tVgZQKHpOKb49TZiAjeWp
   IekWFcO5Cfh5DL5AUbR0Ww75oENxP6pIX9lOZvmCknzN9PpgYnEUbxhRH
   Q==;
X-CSE-ConnectionGUID: jIh+s7IlTxuin2pFOjy7Fw==
X-CSE-MsgGUID: f5OHqZVWR8+AbHyl7LGKiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82618739"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82618739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 10:57:56 -0800
X-CSE-ConnectionGUID: klecdAOdS7mzYJVsSSD9Ag==
X-CSE-MsgGUID: pTkVaQqkRyO264W+32ZAhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216538355"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 10:57:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpsvo-00000000pK0-1bHF;
	Tue, 10 Feb 2026 18:57:52 +0000
Date: Wed, 11 Feb 2026 02:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 78/105]
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_cq.c:156:17: error: label 'err_umem'
 used but not defined
Message-ID: <202602110210.QwWf11pG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   b6daace542159a3879b60866e24495985ecffc23
commit: 956a2f3d6294d17d7588fe679c44e9eddfdefc28 [78/105] RDMA/vmw_pvrdma: Provide a modern CQ creation interface
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110210.QwWf11pG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110210.QwWf11pG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110210.QwWf11pG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/vmw_pvrdma/pvrdma_cq.c: In function 'pvrdma_create_user_cq':
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma_cq.c:156:17: error: label 'err_umem' used but not defined
     156 |                 goto err_umem;
         |                 ^~~~


vim +/err_umem +156 drivers/infiniband/hw/vmw_pvrdma/pvrdma_cq.c

29c8d9eba550c6 Adit Ranadive      2016-10-02   92  
956a2f3d6294d1 Leon Romanovsky    2026-02-09   93  int pvrdma_create_user_cq(struct ib_cq *ibcq,
956a2f3d6294d1 Leon Romanovsky    2026-02-09   94  			  const struct ib_cq_init_attr *attr,
dd6d7f8574d7f8 Akiva Goldberger   2024-06-27   95  			  struct uverbs_attr_bundle *attrs)
29c8d9eba550c6 Adit Ranadive      2016-10-02   96  {
dd6d7f8574d7f8 Akiva Goldberger   2024-06-27   97  	struct ib_udata *udata = &attrs->driver_udata;
e39afe3d6dbd90 Leon Romanovsky    2019-05-28   98  	struct ib_device *ibdev = ibcq->device;
29c8d9eba550c6 Adit Ranadive      2016-10-02   99  	int entries = attr->cqe;
29c8d9eba550c6 Adit Ranadive      2016-10-02  100  	struct pvrdma_dev *dev = to_vdev(ibdev);
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  101  	struct pvrdma_cq *cq = to_vcq(ibcq);
29c8d9eba550c6 Adit Ranadive      2016-10-02  102  	int ret;
29c8d9eba550c6 Adit Ranadive      2016-10-02  103  	int npages;
29c8d9eba550c6 Adit Ranadive      2016-10-02  104  	unsigned long flags;
29c8d9eba550c6 Adit Ranadive      2016-10-02  105  	union pvrdma_cmd_req req;
29c8d9eba550c6 Adit Ranadive      2016-10-02  106  	union pvrdma_cmd_resp rsp;
29c8d9eba550c6 Adit Ranadive      2016-10-02  107  	struct pvrdma_cmd_create_cq *cmd = &req.create_cq;
29c8d9eba550c6 Adit Ranadive      2016-10-02  108  	struct pvrdma_cmd_create_cq_resp *resp = &rsp.create_cq_resp;
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  109  	struct pvrdma_create_cq_resp cq_resp = {};
29c8d9eba550c6 Adit Ranadive      2016-10-02  110  	struct pvrdma_create_cq ucmd;
ff23dfa134576e Shamir Rabinovitch 2019-03-31  111  	struct pvrdma_ucontext *context = rdma_udata_to_drv_context(
ff23dfa134576e Shamir Rabinovitch 2019-03-31  112  		udata, struct pvrdma_ucontext, ibucontext);
29c8d9eba550c6 Adit Ranadive      2016-10-02  113  
29c8d9eba550c6 Adit Ranadive      2016-10-02  114  	BUILD_BUG_ON(sizeof(struct pvrdma_cqe) != 64);
29c8d9eba550c6 Adit Ranadive      2016-10-02  115  
1c407cb5d70568 Jason Gunthorpe    2020-10-03  116  	if (attr->flags)
1c407cb5d70568 Jason Gunthorpe    2020-10-03  117  		return -EOPNOTSUPP;
1c407cb5d70568 Jason Gunthorpe    2020-10-03  118  
956a2f3d6294d1 Leon Romanovsky    2026-02-09  119  	if (attr->cqe > dev->dsr->caps.max_cqe)
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  120  		return -EINVAL;
29c8d9eba550c6 Adit Ranadive      2016-10-02  121  
956a2f3d6294d1 Leon Romanovsky    2026-02-09  122  	entries = roundup_pow_of_two(entries);
956a2f3d6294d1 Leon Romanovsky    2026-02-09  123  
29c8d9eba550c6 Adit Ranadive      2016-10-02  124  	if (!atomic_add_unless(&dev->num_cqs, 1, dev->dsr->caps.max_cq))
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  125  		return -ENOMEM;
29c8d9eba550c6 Adit Ranadive      2016-10-02  126  
29c8d9eba550c6 Adit Ranadive      2016-10-02  127  	cq->ibcq.cqe = entries;
956a2f3d6294d1 Leon Romanovsky    2026-02-09  128  	cq->is_kernel = false;
29c8d9eba550c6 Adit Ranadive      2016-10-02  129  
29c8d9eba550c6 Adit Ranadive      2016-10-02  130  	if (ib_copy_from_udata(&ucmd, udata, sizeof(ucmd))) {
29c8d9eba550c6 Adit Ranadive      2016-10-02  131  		ret = -EFAULT;
29c8d9eba550c6 Adit Ranadive      2016-10-02  132  		goto err_cq;
29c8d9eba550c6 Adit Ranadive      2016-10-02  133  	}
29c8d9eba550c6 Adit Ranadive      2016-10-02  134  
956a2f3d6294d1 Leon Romanovsky    2026-02-09  135  	if (!ibcq->umem)
956a2f3d6294d1 Leon Romanovsky    2026-02-09  136  		ibcq->umem = ib_umem_get(ibdev, ucmd.buf_addr, ucmd.buf_size,
72b894b09a96b7 Christoph Hellwig  2019-11-13  137  					 IB_ACCESS_LOCAL_WRITE);
956a2f3d6294d1 Leon Romanovsky    2026-02-09  138  	if (IS_ERR(ibcq->umem)) {
956a2f3d6294d1 Leon Romanovsky    2026-02-09  139  		ret = PTR_ERR(ibcq->umem);
29c8d9eba550c6 Adit Ranadive      2016-10-02  140  		goto err_cq;
29c8d9eba550c6 Adit Ranadive      2016-10-02  141  	}
29c8d9eba550c6 Adit Ranadive      2016-10-02  142  
87aebd3f8c7490 Jason Gunthorpe    2020-09-04  143  	npages = ib_umem_num_dma_blocks(cq->umem, PAGE_SIZE);
29c8d9eba550c6 Adit Ranadive      2016-10-02  144  
29c8d9eba550c6 Adit Ranadive      2016-10-02  145  	if (npages < 0 || npages > PVRDMA_PAGE_DIR_MAX_PAGES) {
29c8d9eba550c6 Adit Ranadive      2016-10-02  146  		dev_warn(&dev->pdev->dev,
29c8d9eba550c6 Adit Ranadive      2016-10-02  147  			 "overflow pages in completion queue\n");
29c8d9eba550c6 Adit Ranadive      2016-10-02  148  		ret = -EINVAL;
29c8d9eba550c6 Adit Ranadive      2016-10-02  149  		goto err_umem;
29c8d9eba550c6 Adit Ranadive      2016-10-02  150  	}
29c8d9eba550c6 Adit Ranadive      2016-10-02  151  
956a2f3d6294d1 Leon Romanovsky    2026-02-09  152  	ret = pvrdma_page_dir_init(dev, &cq->pdir, npages, false);
29c8d9eba550c6 Adit Ranadive      2016-10-02  153  	if (ret) {
29c8d9eba550c6 Adit Ranadive      2016-10-02  154  		dev_warn(&dev->pdev->dev,
29c8d9eba550c6 Adit Ranadive      2016-10-02  155  			 "could not allocate page directory\n");
29c8d9eba550c6 Adit Ranadive      2016-10-02 @156  		goto err_umem;
29c8d9eba550c6 Adit Ranadive      2016-10-02  157  	}
29c8d9eba550c6 Adit Ranadive      2016-10-02  158  
29c8d9eba550c6 Adit Ranadive      2016-10-02  159  	/* Ring state is always the first page. Set in library for user cq. */
29c8d9eba550c6 Adit Ranadive      2016-10-02  160  	pvrdma_page_dir_insert_umem(&cq->pdir, cq->umem, 0);
29c8d9eba550c6 Adit Ranadive      2016-10-02  161  
a61eb613682917 Bryan Tan          2017-12-20  162  	refcount_set(&cq->refcnt, 1);
e3524b269e451c Bryan Tan          2017-12-20  163  	init_completion(&cq->free);
29c8d9eba550c6 Adit Ranadive      2016-10-02  164  	spin_lock_init(&cq->cq_lock);
29c8d9eba550c6 Adit Ranadive      2016-10-02  165  
29c8d9eba550c6 Adit Ranadive      2016-10-02  166  	memset(cmd, 0, sizeof(*cmd));
29c8d9eba550c6 Adit Ranadive      2016-10-02  167  	cmd->hdr.cmd = PVRDMA_CMD_CREATE_CQ;
29c8d9eba550c6 Adit Ranadive      2016-10-02  168  	cmd->nchunks = npages;
956a2f3d6294d1 Leon Romanovsky    2026-02-09  169  	cmd->ctx_handle = context->ctx_handle;
29c8d9eba550c6 Adit Ranadive      2016-10-02  170  	cmd->cqe = entries;
29c8d9eba550c6 Adit Ranadive      2016-10-02  171  	cmd->pdir_dma = cq->pdir.dir_dma;
29c8d9eba550c6 Adit Ranadive      2016-10-02  172  	ret = pvrdma_cmd_post(dev, &req, &rsp, PVRDMA_CMD_CREATE_CQ_RESP);
29c8d9eba550c6 Adit Ranadive      2016-10-02  173  	if (ret < 0) {
29c8d9eba550c6 Adit Ranadive      2016-10-02  174  		dev_warn(&dev->pdev->dev,
29c8d9eba550c6 Adit Ranadive      2016-10-02  175  			 "could not create completion queue, error: %d\n", ret);
29c8d9eba550c6 Adit Ranadive      2016-10-02  176  		goto err_page_dir;
29c8d9eba550c6 Adit Ranadive      2016-10-02  177  	}
29c8d9eba550c6 Adit Ranadive      2016-10-02  178  
29c8d9eba550c6 Adit Ranadive      2016-10-02  179  	cq->ibcq.cqe = resp->cqe;
29c8d9eba550c6 Adit Ranadive      2016-10-02  180  	cq->cq_handle = resp->cq_handle;
1f5a6c47aabc46 Adit Ranadive      2018-02-15  181  	cq_resp.cqn = resp->cq_handle;
29c8d9eba550c6 Adit Ranadive      2016-10-02  182  	spin_lock_irqsave(&dev->cq_tbl_lock, flags);
29c8d9eba550c6 Adit Ranadive      2016-10-02  183  	dev->cq_tbl[cq->cq_handle % dev->dsr->caps.max_cq] = cq;
29c8d9eba550c6 Adit Ranadive      2016-10-02  184  	spin_unlock_irqrestore(&dev->cq_tbl_lock, flags);
29c8d9eba550c6 Adit Ranadive      2016-10-02  185  
ff23dfa134576e Shamir Rabinovitch 2019-03-31  186  	cq->uar = &context->uar;
29c8d9eba550c6 Adit Ranadive      2016-10-02  187  
29c8d9eba550c6 Adit Ranadive      2016-10-02  188  	/* Copy udata back. */
1f5a6c47aabc46 Adit Ranadive      2018-02-15  189  	if (ib_copy_to_udata(udata, &cq_resp, sizeof(cq_resp))) {
29c8d9eba550c6 Adit Ranadive      2016-10-02  190  		dev_warn(&dev->pdev->dev,
29c8d9eba550c6 Adit Ranadive      2016-10-02  191  			 "failed to copy back udata\n");
c4367a26357be5 Shamir Rabinovitch 2019-03-31  192  		pvrdma_destroy_cq(&cq->ibcq, udata);
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  193  		return -EINVAL;
29c8d9eba550c6 Adit Ranadive      2016-10-02  194  	}
956a2f3d6294d1 Leon Romanovsky    2026-02-09  195  
956a2f3d6294d1 Leon Romanovsky    2026-02-09  196  	return 0;
956a2f3d6294d1 Leon Romanovsky    2026-02-09  197  
956a2f3d6294d1 Leon Romanovsky    2026-02-09  198  err_page_dir:
956a2f3d6294d1 Leon Romanovsky    2026-02-09  199  	pvrdma_page_dir_cleanup(dev, &cq->pdir);
956a2f3d6294d1 Leon Romanovsky    2026-02-09  200  err_cq:
956a2f3d6294d1 Leon Romanovsky    2026-02-09  201  	atomic_dec(&dev->num_cqs);
956a2f3d6294d1 Leon Romanovsky    2026-02-09  202  	return ret;
29c8d9eba550c6 Adit Ranadive      2016-10-02  203  }
29c8d9eba550c6 Adit Ranadive      2016-10-02  204  

:::::: The code at line 156 was first introduced by commit
:::::: 29c8d9eba550c6d73d17cc1618a9f5f2a7345aa1 IB: Add vmw_pvrdma driver

:::::: TO: Adit Ranadive <aditr@vmware.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
