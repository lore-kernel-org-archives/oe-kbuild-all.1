Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0093736A000
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776377507; cv=none; b=MoiodnnapbPLwxkviJ22AFM55d26hqf1KWyy47sDoUlud7J1GAWdvu0vZK5naMiXRYL1Z8PwgEoKrIdG7x0FzBhDKMZktA1uLJwE02TJVCMawniesKPp1AfzdUqU4so/J/g22VrOXYWEWAMVdN9JCRwSPxAQYOGbIipNxClNiGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776377507; c=relaxed/simple;
	bh=yqiiXdfN5Q8TLf5WyiQytoFft1uAfFmLWX2S2bWUNtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Icq0zNaNIt+iagagZG0lY2253upeBTdPadkizvXerGXIO4m1VFpXbbXTsSEcMuAWCMn6jEvlBhcspZXVmc9bV7LllOrIOAkZnjq8obpSKZEl6AwqX8Kijhs9rKHYb/pELb2vKoSyHxq/YbNQacLh992uipiPT2+jq72KS0DwtVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqwhRihc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqwhRihc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776377505; x=1807913505;
  h=date:from:to:cc:subject:message-id;
  bh=yqiiXdfN5Q8TLf5WyiQytoFft1uAfFmLWX2S2bWUNtI=;
  b=UqwhRihcqqmPPhHFvdgurQCUvQfRAhsNEEhiXV8n9v/+aed+kcH5/6Qm
   wt+Bbtj+GcsIbDI+UAdDOVKXNN6Ouzt0GYWPiCHYgbXAGEYgpguGRKkav
   OzFEdc6czVtbpF+KReZThipenk8Pkn9fy1Pju3t/8i0QdULQS7vJUAyDG
   Sy9TADo6HMeuTo3m8D1Y+m4dx7O9jNV/YD6Czom2S5hi28vjg9pxvUoh0
   Ziy1fAHakFjwnXXrKp/xREVBMP3Cwi7UjdnMz6zSeuD5jKhaD8UXyRZZQ
   EtFNCbN97hqlxjlEZzqXe5HQzR45lL6Zkx0kVfVJ4v+AX57QvVjoW8Xk9
   Q==;
X-CSE-ConnectionGUID: 1BcOLIrWRpiSjKv991QUQg==
X-CSE-MsgGUID: vmFw2+1iS5mfXlKCqX7g9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88093348"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="88093348"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 15:11:44 -0700
X-CSE-ConnectionGUID: 5i/Rv1I2TdO/PpJWwaCfSg==
X-CSE-MsgGUID: vWZ2O2I+QBW6567LsDvkIw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2026 15:11:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDUw0-0000000018D-3mWg;
	Thu, 16 Apr 2026 22:11:40 +0000
Date: Fri, 17 Apr 2026 00:10:44 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:create-cq-entries-v1 12/16]
 drivers/infiniband/hw/bnxt_re/ib_verbs.c:3460:37: warning: unused variable
 'dev_attr'
Message-ID: <202604170049.UynfiyDl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git create-cq-entries-v1
head:   7f01f0ec98626108c0c8664dbbadac6789903051
commit: c01b77c634fd7d0bce3baf6c8d6663ef3a13c224 [12/16] RDMA/bnxt_re: Rely on core to validate CQE count
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260417/202604170049.UynfiyDl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170049.UynfiyDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170049.UynfiyDl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/ib_verbs.c: In function 'bnxt_re_create_cq':
>> drivers/infiniband/hw/bnxt_re/ib_verbs.c:3460:37: warning: unused variable 'dev_attr' [-Wunused-variable]
    3460 |         struct bnxt_qplib_dev_attr *dev_attr = rdev->dev_attr;
         |                                     ^~~~~~~~


vim +/dev_attr +3460 drivers/infiniband/hw/bnxt_re/ib_verbs.c

cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3454  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3455  int bnxt_re_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3456  		      struct uverbs_attr_bundle *attrs)
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3457  {
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3458  	struct bnxt_re_cq *cq = container_of(ibcq, struct bnxt_re_cq, ib_cq);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3459  	struct bnxt_re_dev *rdev = to_bnxt_re_dev(ibcq->device, ibdev);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02 @3460  	struct bnxt_qplib_dev_attr *dev_attr = rdev->dev_attr;
2b2f078236a445 Leon Romanovsky       2026-03-18  3461  	int rc;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3462  	u32 active_cqs;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3463  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3464  	if (attr->flags)
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3465  		return -EOPNOTSUPP;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3466  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3467  	cq->rdev = rdev;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3468  	cq->qplib_cq.cq_handle = (u64)(unsigned long)(&cq->qplib_cq);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3469  
345f842771ff36 Leon Romanovsky       2026-03-18  3470  	cq->max_cql = attr->cqe + 1;
e69609c5d46917 Leon Romanovsky       2026-03-18  3471  	cq->cql = kzalloc_objs(struct bnxt_qplib_cqe, cq->max_cql);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3472  	if (!cq->cql)
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3473  		return -ENOMEM;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3474  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3475  	cq->qplib_cq.sg_info.pgsize = SZ_4K;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3476  	cq->qplib_cq.sg_info.pgshft = __builtin_ctz(SZ_4K);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3477  	cq->qplib_cq.dpi = &rdev->dpi_privileged;
2b2f078236a445 Leon Romanovsky       2026-03-18  3478  	cq->qplib_cq.max_wqe = cq->max_cql;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3479  	cq->qplib_cq.coalescing = &rdev->cq_coalescing;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3480  	cq->qplib_cq.nq = bnxt_re_get_nq(rdev);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3481  	cq->qplib_cq.cnq_hw_ring_id = cq->qplib_cq.nq->ring_id;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3482  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3483  	rc = bnxt_qplib_create_cq(&rdev->qplib_res, &cq->qplib_cq);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3484  	if (rc) {
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3485  		ibdev_err(&rdev->ibdev, "Failed to create HW CQ");
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3486  		goto fail;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3487  	}
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3488  
2b2f078236a445 Leon Romanovsky       2026-03-18  3489  	cq->ib_cq.cqe = cq->max_cql;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3490  	cq->cq_period = cq->qplib_cq.period;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3491  	active_cqs = atomic_inc_return(&rdev->stats.res.cq_count);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3492  	if (active_cqs > rdev->stats.res.cq_watermark)
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3493  		rdev->stats.res.cq_watermark = active_cqs;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3494  	spin_lock_init(&cq->cq_lock);
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3495  
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3496  	return 0;
cec5157b6c73e3 Sriharsha Basavapatna 2026-03-02  3497  
1ac5a404797523 Selvin Xavier         2017-02-10  3498  fail:
1ac5a404797523 Selvin Xavier         2017-02-10  3499  	kfree(cq->cql);
e39afe3d6dbd90 Leon Romanovsky       2019-05-28  3500  	return rc;
1ac5a404797523 Selvin Xavier         2017-02-10  3501  }
1ac5a404797523 Selvin Xavier         2017-02-10  3502  

:::::: The code at line 3460 was first introduced by commit
:::::: cec5157b6c73e3e43ce868b7726dfece8891c1f8 RDMA/bnxt_re: Separate kernel and user CQ creation paths

:::::: TO: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
