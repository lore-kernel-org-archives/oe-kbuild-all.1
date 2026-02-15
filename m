Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00F78F3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187344; cv=none; b=GAHB9YSeY/7KTtUYGxZGlfkylKwgmxglZZwtH0HI95B642h5EtyCxhga1LhZmxFiUlOqgIuz0n7y7mcmKFZ/vU53hEOcrUGFNt5NUWuZpePdf2LxGFZMp8sKmMjL5iid0TNwS8TRlaq4cODpj0fIGhARk9PnMUCCKXn1O6tUl6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187344; c=relaxed/simple;
	bh=M2PEe/u7ChJvuVPmIYsgtxyCcZOe5FHkzeFpq+LqCGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=scZ8A3Idj9h5M4M7FhwTgWUjEEux1p4Ybc2Q5BL1n/DrvmqjDavgnAZVcK6e3/5ofbvJov/TZh32KZu7txpLcpejDbGQTSzMtph+mL7p77wSg/KlGV1H8UzLGnVSlkp8UNl2GsxG8j1mu16e4JwTZHJ20BacK17eg8FqKKDDBDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXDXO+wM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXDXO+wM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771187343; x=1802723343;
  h=date:from:to:cc:subject:message-id;
  bh=M2PEe/u7ChJvuVPmIYsgtxyCcZOe5FHkzeFpq+LqCGY=;
  b=fXDXO+wME4RH6mbpeptFSME035gdD4OPhxmrxfwiSb5ziGfcaDUtHtEs
   68E4Gc2biuVJqyckHsEMTCkf4psmcH+rPAHg5LgwbJOb5uXuXv2Dr8hdY
   oIQfRoDwuNBx4UOCy3C5CgZc4hCS06ibDOPU6ueDF0sWuGxS5zwV8tJaJ
   NRLuvC+0283Y1B56haGm8V+WWbxhaW+oM3BHl8FkjNDHUxfj5B5mDjdPU
   PWq8SrfjQYX7FYGT0hBj1qWFUGFKEtZ8TZXpQujXUclmYcrILFk+Dh6tq
   6BXpst678RYmLaSVKzfDaKiahNhDECT7gUB/6CYUIa+oZcPTHbzSnY9Bj
   A==;
X-CSE-ConnectionGUID: gPXScqQuSW27SIPabdNM9Q==
X-CSE-MsgGUID: DhIjNQ/5TA+9ByyyGLaQJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="97745394"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="97745394"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 12:29:02 -0800
X-CSE-ConnectionGUID: t+kQ0fiEQFGx5ln9ixRelw==
X-CSE-MsgGUID: 5VqgVK+3RR+SqpFPAI0Y9Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Feb 2026 12:29:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vriji-00000000z8g-1T8X;
	Sun, 15 Feb 2026 20:28:58 +0000
Date: Mon, 16 Feb 2026 04:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v2 87/107]
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2922:13: error: too many arguments
 to function 'hns_roce_create_cq'; expected 2, have 3
Message-ID: <202602160447.1B43xQmD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v2
head:   6270611a6aa0e2a782cf3849ccd6ee63b7f36d19
commit: 3b2c97078b14fbbdd2a1ae8a0bcffa17c81f976c [87/107] RDMA/core: Remove legacy CQ creation fallback path
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260216/202602160447.1B43xQmD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160447.1B43xQmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160447.1B43xQmD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'free_mr_init_cq':
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2922:13: error: too many arguments to function 'hns_roce_create_cq'; expected 2, have 3
    2922 |         if (hns_roce_create_cq(cq, &cq_init_attr, NULL)) {
         |             ^~~~~~~~~~~~~~~~~~
   In file included from drivers/infiniband/hw/hns/hns_roce_hw_v2.c:48:
   drivers/infiniband/hw/hns/hns_roce_device.h:1295:5: note: declared here
    1295 | int hns_roce_create_cq(struct ib_cq *ib_cq, const struct ib_cq_init_attr *attr);
         |     ^~~~~~~~~~~~~~~~~~


vim +/hns_roce_create_cq +2922 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

487d65090a3dce Yixing Liu 2022-11-26  2903  
487d65090a3dce Yixing Liu 2022-11-26  2904  static struct ib_cq *free_mr_init_cq(struct hns_roce_dev *hr_dev)
487d65090a3dce Yixing Liu 2022-11-26  2905  {
487d65090a3dce Yixing Liu 2022-11-26  2906  	struct hns_roce_v2_priv *priv = hr_dev->priv;
487d65090a3dce Yixing Liu 2022-11-26  2907  	struct hns_roce_v2_free_mr *free_mr = &priv->free_mr;
487d65090a3dce Yixing Liu 2022-11-26  2908  	struct ib_device *ibdev = &hr_dev->ib_dev;
487d65090a3dce Yixing Liu 2022-11-26  2909  	struct ib_cq_init_attr cq_init_attr = {};
487d65090a3dce Yixing Liu 2022-11-26  2910  	struct hns_roce_cq *hr_cq;
487d65090a3dce Yixing Liu 2022-11-26  2911  	struct ib_cq *cq;
487d65090a3dce Yixing Liu 2022-11-26  2912  
487d65090a3dce Yixing Liu 2022-11-26  2913  	cq_init_attr.cqe = HNS_ROCE_FREE_MR_USED_CQE_NUM;
487d65090a3dce Yixing Liu 2022-11-26  2914  
487d65090a3dce Yixing Liu 2022-11-26  2915  	hr_cq = kzalloc(sizeof(*hr_cq), GFP_KERNEL);
1f505a4a425079 luoqing    2025-06-05  2916  	if (!hr_cq)
487d65090a3dce Yixing Liu 2022-11-26  2917  		return NULL;
487d65090a3dce Yixing Liu 2022-11-26  2918  
487d65090a3dce Yixing Liu 2022-11-26  2919  	cq = &hr_cq->ib_cq;
487d65090a3dce Yixing Liu 2022-11-26  2920  	cq->device = ibdev;
487d65090a3dce Yixing Liu 2022-11-26  2921  
487d65090a3dce Yixing Liu 2022-11-26 @2922  	if (hns_roce_create_cq(cq, &cq_init_attr, NULL)) {
487d65090a3dce Yixing Liu 2022-11-26  2923  		ibdev_err(ibdev, "failed to create cq for free mr.\n");
487d65090a3dce Yixing Liu 2022-11-26  2924  		kfree(hr_cq);
487d65090a3dce Yixing Liu 2022-11-26  2925  		return NULL;
487d65090a3dce Yixing Liu 2022-11-26  2926  	}
487d65090a3dce Yixing Liu 2022-11-26  2927  	free_mr->rsv_cq = to_hr_cq(cq);
487d65090a3dce Yixing Liu 2022-11-26  2928  	free_mr->rsv_cq->ib_cq.device = &hr_dev->ib_dev;
487d65090a3dce Yixing Liu 2022-11-26  2929  	free_mr->rsv_cq->ib_cq.uobject = NULL;
487d65090a3dce Yixing Liu 2022-11-26  2930  	free_mr->rsv_cq->ib_cq.comp_handler = NULL;
487d65090a3dce Yixing Liu 2022-11-26  2931  	free_mr->rsv_cq->ib_cq.event_handler = NULL;
487d65090a3dce Yixing Liu 2022-11-26  2932  	free_mr->rsv_cq->ib_cq.cq_context = NULL;
487d65090a3dce Yixing Liu 2022-11-26  2933  	atomic_set(&free_mr->rsv_cq->ib_cq.usecnt, 0);
487d65090a3dce Yixing Liu 2022-11-26  2934  
487d65090a3dce Yixing Liu 2022-11-26  2935  	return cq;
487d65090a3dce Yixing Liu 2022-11-26  2936  }
487d65090a3dce Yixing Liu 2022-11-26  2937  

:::::: The code at line 2922 was first introduced by commit
:::::: 487d65090a3dce1ae54946aded55d0f8ac87cbab RDMA/hns: Fix the gid problem caused by free mr

:::::: TO: Yixing Liu <liuyixing1@huawei.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
