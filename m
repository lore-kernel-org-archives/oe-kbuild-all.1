Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE43932C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830516; cv=none; b=IP85dyz8q8WLAI8L3UdS2PSuWE0uinhxgw6FObM4ohsCMPi7SgYnA4/K0OCt3foJuhhkKcthXN9Jiaq+x/46MnYJqKoGRcFsMtoodmNKIWePQJmaUjKJ1Y128c5fJ3fo1bFJikuClkCu/FoXuQ2LKtgiVx/TvMYc8A9BpFm0GyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830516; c=relaxed/simple;
	bh=M1JhNh+6h4hi0LRv8tuoqZ2O0gDainfed9aUK36gfvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KJ/q4EgScbgihHf1XRRHZkalTL+mupZY+8CHa/ccRYvlxv6c/SSRRM6lWZ2TvLo1XHL8j9wp5cuPsn5G90QOJ5FnebyJFCwwuNE5yC6SYiMAKeCggjSetMWd5QVAhYoWnrXNxDttSTtnArXTLz9NCOmAOS/jEIy41e2kL25rKYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBTjsbSG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBTjsbSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773830514; x=1805366514;
  h=date:from:to:cc:subject:message-id;
  bh=M1JhNh+6h4hi0LRv8tuoqZ2O0gDainfed9aUK36gfvA=;
  b=mBTjsbSGzsiR59jxilMZ17PXNmnGcvkUYDIw1sEP90ULIse8JnikJwDN
   DH0ZNAzSlg4x0zXiCmYWGhL503KjVwO0uKuGnJ0zOKjqdmLr7K4xVNf19
   xwDVX4Cm5Iwar8pHy6t5GYEtX6swj6N2k4Jj6WyTd/XR5sY/gDLGBpv7q
   kxMG8h0YYshyjJDbHtns1BxMvs4q3n7csfYGuQhZFc0wKxPAntzbgIIsh
   KQU0sledee616Kq/6K70K2UO0ruuwWeyEG2GY6wOQBj+5GsNYg1nWUo1l
   OM3X4+KALjn2hm524YjfTVT+UtRn9TtmKwhrAzT0Oua5QfTjBoj685Vx6
   w==;
X-CSE-ConnectionGUID: cQQI0lwqQm+3KpsPD7n+xA==
X-CSE-MsgGUID: IhjbeqOaRFC7nboCjn0evA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="75000382"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75000382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 03:41:51 -0700
X-CSE-ConnectionGUID: cejVHo0+QaGeM0u7Bt9QxQ==
X-CSE-MsgGUID: UhIlddWOQoGWKJxrH5VZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227272900"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 03:41:50 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2oLS-000000002ol-3lpb;
	Wed, 18 Mar 2026 10:41:46 +0000
Date: Wed, 18 Mar 2026 18:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:bnxt_re-cq-v1 45/48]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:3581:38: error: 'attr' undeclared;
 did you mean 'xattr'?
Message-ID: <202603181821.gKfmavnp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git bnxt_re-cq-v1
head:   64cffeac2f9507d899189f980340191d078ffcb4
commit: f0a0a1eeeb58e605d850f0ef561fcc78e49a96ef [45/48] RDMA/bnxt_re: Simplify bnxt_re_init_depth() callers and implementation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260318/202603181821.gKfmavnp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181821.gKfmavnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181821.gKfmavnp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/ib_verbs.c: In function 'bnxt_re_resize_cq':
>> drivers/infiniband/hw/bnxt_re/ib_verbs.c:3581:38: error: 'attr' undeclared (first use in this function); did you mean 'xattr'?
    3581 |         entries = bnxt_re_init_depth(attr->cqe + 1, dev_attr->max_cq_wqes + 1,
         |                                      ^~~~
         |                                      xattr
   drivers/infiniband/hw/bnxt_re/ib_verbs.c:3581:38: note: each undeclared identifier is reported only once for each function it appears in


vim +3581 drivers/infiniband/hw/bnxt_re/ib_verbs.c

  3546	
  3547	int bnxt_re_resize_cq(struct ib_cq *ibcq, int cqe, struct ib_udata *udata)
  3548	{
  3549		struct bnxt_qplib_sg_info sg_info = {};
  3550		struct bnxt_qplib_dpi *orig_dpi = NULL;
  3551		struct bnxt_qplib_dev_attr *dev_attr;
  3552		struct bnxt_re_ucontext *uctx = NULL;
  3553		struct bnxt_re_resize_cq_req req;
  3554		struct bnxt_re_dev *rdev;
  3555		struct bnxt_re_cq *cq;
  3556		int rc;
  3557		u32 entries;
  3558	
  3559		cq =  container_of(ibcq, struct bnxt_re_cq, ib_cq);
  3560		rdev = cq->rdev;
  3561		dev_attr = rdev->dev_attr;
  3562		if (!ibcq->uobject) {
  3563			ibdev_err(&rdev->ibdev, "Kernel CQ Resize not supported");
  3564			return -EOPNOTSUPP;
  3565		}
  3566	
  3567		if (cq->resize_umem) {
  3568			ibdev_err(&rdev->ibdev, "Resize CQ %#x failed - Busy",
  3569				  cq->qplib_cq.id);
  3570			return -EBUSY;
  3571		}
  3572	
  3573		/* Check the requested cq depth out of supported depth */
  3574		if (cqe < 1 || cqe > dev_attr->max_cq_wqes) {
  3575			ibdev_err(&rdev->ibdev, "Resize CQ %#x failed - out of range cqe %d",
  3576				  cq->qplib_cq.id, cqe);
  3577			return -EINVAL;
  3578		}
  3579	
  3580		uctx = rdma_udata_to_drv_context(udata, struct bnxt_re_ucontext, ib_uctx);
> 3581		entries = bnxt_re_init_depth(attr->cqe + 1, dev_attr->max_cq_wqes + 1,
  3582					     uctx);
  3583		/* uverbs consumer */
  3584		rc = ib_copy_validate_udata_in(udata, req, cq_va);
  3585		if (rc)
  3586			goto fail;
  3587	
  3588		cq->resize_umem = ib_umem_get(&rdev->ibdev, req.cq_va,
  3589					      entries * sizeof(struct cq_base),
  3590					      IB_ACCESS_LOCAL_WRITE);
  3591		if (IS_ERR(cq->resize_umem)) {
  3592			rc = PTR_ERR(cq->resize_umem);
  3593			ibdev_err(&rdev->ibdev, "%s: ib_umem_get failed! rc = %pe\n",
  3594				  __func__, cq->resize_umem);
  3595			cq->resize_umem = NULL;
  3596			goto fail;
  3597		}
  3598		cq->resize_cqe = entries;
  3599		memcpy(&sg_info, &cq->qplib_cq.sg_info, sizeof(sg_info));
  3600		orig_dpi = cq->qplib_cq.dpi;
  3601	
  3602		cq->qplib_cq.sg_info.umem = cq->resize_umem;
  3603		cq->qplib_cq.sg_info.pgsize = PAGE_SIZE;
  3604		cq->qplib_cq.sg_info.pgshft = PAGE_SHIFT;
  3605		cq->qplib_cq.dpi = &uctx->dpi;
  3606	
  3607		rc = bnxt_qplib_resize_cq(&rdev->qplib_res, &cq->qplib_cq, entries);
  3608		if (rc) {
  3609			ibdev_err(&rdev->ibdev, "Resize HW CQ %#x failed!",
  3610				  cq->qplib_cq.id);
  3611			goto fail;
  3612		}
  3613	
  3614		cq->ib_cq.cqe = cq->resize_cqe;
  3615		atomic_inc(&rdev->stats.res.resize_count);
  3616	
  3617		return ib_respond_empty_udata(udata);
  3618	
  3619	fail:
  3620		if (cq->resize_umem) {
  3621			ib_umem_release(cq->resize_umem);
  3622			cq->resize_umem = NULL;
  3623			cq->resize_cqe = 0;
  3624			memcpy(&cq->qplib_cq.sg_info, &sg_info, sizeof(sg_info));
  3625			cq->qplib_cq.dpi = orig_dpi;
  3626		}
  3627		return rc;
  3628	}
  3629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
