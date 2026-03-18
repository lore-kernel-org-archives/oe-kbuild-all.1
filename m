Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15647126C17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795727; cv=none; b=Mq6ZzPR28IrV5jFBR8LH3oRPDiDD5shFlPkA0rxLP8atJbK2+qqc9Qgsv/vfDtmmHJrem9IPMSg4fNtfcrGSpPcAtB4I1h9cqK0Yk+wk+jC+1SM5NhUczjW0XoUyiWywG5cLQpvn7/PirYpkO6i0J4036lhfGYuiltHTJMfFYm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795727; c=relaxed/simple;
	bh=k+9d32CLpNUODx3sMT7+XvelZOx1nEPcvW43k/O2fQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BB0lrgOAv3XTmfgjVKoFVA/PvAU5c0ZwvxQCvE9KM9wUQ3w2oNasImd15daIduLPjv80ysqleDOTJ6ezkU57e1ftjsFjZYmHlEooDLEM873bC0DfN+QZQC2DA4keot1e6myNielXFkDSYdwknEcCVJMfGYgePJOBlp1LdRvS8ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=by6LzXVu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="by6LzXVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773795725; x=1805331725;
  h=date:from:to:cc:subject:message-id;
  bh=k+9d32CLpNUODx3sMT7+XvelZOx1nEPcvW43k/O2fQU=;
  b=by6LzXVu7DFW9vKhaL0c4IVL48duVDybJHq1OqbNL1nNN8dU11z1T7Ei
   tcmRVMEqIf72gqUAnOCW8Dej5QvqyL8zRjDu+7tNLDMbo4dw+yrpwLBZL
   Ai+510ZTb6fcGfyKY0iwFyQCYFFgTsbBF1elCKiPhdgCy39wW5fFzbbsG
   lrJLuO3UXGK/n0bw3fuoiXAALj8HMr+ZiTUzi4Zd+Ol5a8dTRS8XS4K1k
   dAP1W40ha0/cqb0DbBKn2YI5oOr4f8ykx8SXI33JBrX5mgE+UqePInTQm
   qLF71dL3/TOr9uKtGsb+X+1bJr/BqKkGSWVzo3GiQHsHIBUTNdyKjbwoK
   g==;
X-CSE-ConnectionGUID: CXs0LiamSfK7gU/y4T5GlA==
X-CSE-MsgGUID: GUvxlG1QRlSZL0L7cvWMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77453210"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="77453210"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 18:02:04 -0700
X-CSE-ConnectionGUID: 20TnBCsyQTqGdC4dwInOww==
X-CSE-MsgGUID: 5Yc/+fmPS9+IfELYre7XGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="218074057"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 17 Mar 2026 18:02:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2fIO-000000004YH-3NQz;
	Wed, 18 Mar 2026 01:02:00 +0000
Date: Wed, 18 Mar 2026 02:01:35 +0100
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:bnxt_re-cq-v1 45/48]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:3581:38: error: 'attr' undeclared;
 did you mean 'xattr'?
Message-ID: <202603180134.hhnKGsuq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git bnxt_re-cq-v1
head:   64cffeac2f9507d899189f980340191d078ffcb4
commit: f0a0a1eeeb58e605d850f0ef561fcc78e49a96ef [45/48] RDMA/bnxt_re: Simplify bnxt_re_init_depth() callers and implementation
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260318/202603180134.hhnKGsuq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180134.hhnKGsuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180134.hhnKGsuq-lkp@intel.com/

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
