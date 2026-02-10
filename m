Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948B38A9C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745918; cv=none; b=mWByQEx1X3HEaV1DOetj3EMrHoBnPapZ5Ejp9JsYyiMEA5OCszpCVnvDfMG09COfmf//zPtDQAC3RRiTXEXRup8q7BN2eJlusnEyn/PMR43oQc4CaOw3TDcduSRt/TcU54QVsygkNrBm2YGIzVv9oTbqhwX7btzbN0cIVo+0YlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745918; c=relaxed/simple;
	bh=B66gu3Xhhik6jixS6Tr+Nrd350lErDtq09N23EiRYCI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rOcWTSEgSq5tV/nvDY6kggGnMke6x4jYm+WPHLeJhyB4t9OovTUSHTnJ0hDrd7OKVeFxlnffRCGesxb09YF9vohhhVYY5qaH9uI2UELTEu4m4lYVShIPT5lFBPAmNkxDmGPOrplUFl3C69iJRPTGzg5jT2zM6QNnYLG6Ua1Iho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RavAK2Li; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RavAK2Li"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770745916; x=1802281916;
  h=date:from:to:cc:subject:message-id;
  bh=B66gu3Xhhik6jixS6Tr+Nrd350lErDtq09N23EiRYCI=;
  b=RavAK2Li4QpA/PoddaFaoqzmJISO2SNoG2ankatizKxgmvZKmOfPQpAM
   4fFfOIA8S9o4Dn/5T7YXeNeFFOgN2iD1b3YrG9agdVN/IT5olahhLJblT
   nlSJ42qsP5zDh839IgqPWCQvLAlYXGqpv/xwC1LMnzgZgB/DJmAaeg318
   nfr4R9Xk/2mzy68+OgjcLgAFMr3PVN2kJXw3DgSypmL3VPdeFUT5HOadE
   EYQxwnyeqwPN8n9lzn92aE3DOVYbF4wHCmVXOsQWwZJZTyHp3XIDRL2HK
   D4DpF8uKVcXeoWcBsLQTIV2dbcQpU3eHpnjBEXC1zSvZbFT7bkotpUxi2
   g==;
X-CSE-ConnectionGUID: E29s/Bw6Qt+/6SzHnomNFQ==
X-CSE-MsgGUID: PpQijq+GSzy3z12h9eorCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89473470"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89473470"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 09:51:53 -0800
X-CSE-ConnectionGUID: vfFKjIDfTw+HbIJOrgnneg==
X-CSE-MsgGUID: wzVTpJT2Rm6GBSayUxKkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216495383"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Feb 2026 09:51:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vprtt-00000000pH4-0VgZ;
	Tue, 10 Feb 2026 17:51:49 +0000
Date: Wed, 11 Feb 2026 01:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 73/105]
 drivers/infiniband/hw/cxgb4/cq.c:1018:17: error: 'attr' is a pointer; did you
 mean to use '->'?
Message-ID: <202602110115.n2dpbyKk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   b6daace542159a3879b60866e24495985ecffc23
commit: 23f23fe92e4c96b51f27c4f5ce4f60e881b5efae [73/105] RDMA/cxgb4: Separate kernel and user CQ creation paths
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110115.n2dpbyKk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110115.n2dpbyKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110115.n2dpbyKk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/cxgb4/cq.c: In function 'c4iw_create_user_cq':
>> drivers/infiniband/hw/cxgb4/cq.c:1018:17: error: 'attr' is a pointer; did you mean to use '->'?
    1018 |         if (attr.cqe > ibdev->attrs.max_cqe)
         |                 ^
         |                 ->


vim +1018 drivers/infiniband/hw/cxgb4/cq.c

   996	
   997	int c4iw_create_user_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
   998				struct uverbs_attr_bundle *attrs)
   999	{
  1000		struct ib_udata *udata = &attrs->driver_udata;
  1001		struct ib_device *ibdev = ibcq->device;
  1002		int entries = attr->cqe;
  1003		int vector = attr->comp_vector;
  1004		struct c4iw_dev *rhp = to_c4iw_dev(ibcq->device);
  1005		struct c4iw_cq *chp = to_c4iw_cq(ibcq);
  1006		struct c4iw_create_cq ucmd;
  1007		struct c4iw_create_cq_resp uresp;
  1008		int ret, wr_len;
  1009		size_t memsize, hwentries;
  1010		struct c4iw_mm_entry *mm, *mm2;
  1011		struct c4iw_ucontext *ucontext = rdma_udata_to_drv_context(
  1012			udata, struct c4iw_ucontext, ibucontext);
  1013	
  1014		pr_debug("ib_dev %p entries %d\n", ibdev, entries);
  1015		if (attr->flags || ibcq->umem)
  1016			return -EOPNOTSUPP;
  1017	
> 1018		if (attr.cqe > ibdev->attrs.max_cqe)
  1019			return -EINVAL;
  1020	
  1021		if (vector >= rhp->rdev.lldi.nciq)
  1022			return -EINVAL;
  1023	
  1024		if (udata->inlen < sizeof(ucmd))
  1025			ucontext->is_32b_cqe = 1;
  1026	
  1027		chp->wr_waitp = c4iw_alloc_wr_wait(GFP_KERNEL);
  1028		if (!chp->wr_waitp)
  1029			return -ENOMEM;
  1030		c4iw_init_wr_wait(chp->wr_waitp);
  1031	
  1032		wr_len = sizeof(struct fw_ri_res_wr) + sizeof(struct fw_ri_res);
  1033		chp->destroy_skb = alloc_skb(wr_len, GFP_KERNEL);
  1034		if (!chp->destroy_skb) {
  1035			ret = -ENOMEM;
  1036			goto err_free_wr_wait;
  1037		}
  1038	
  1039		/* account for the status page. */
  1040		entries++;
  1041	
  1042		/* IQ needs one extra entry to differentiate full vs empty. */
  1043		entries++;
  1044	
  1045		/*
  1046		 * entries must be multiple of 16 for HW.
  1047		 */
  1048		entries = roundup(entries, 16);
  1049	
  1050		/*
  1051		 * Make actual HW queue 2x to avoid cdix_inc overflows.
  1052		 */
  1053		hwentries = min(entries * 2, rhp->rdev.hw_queue.t4_max_iq_size);
  1054	
  1055		/*
  1056		 * Make HW queue at least 64 entries so GTS updates aren't too
  1057		 * frequent.
  1058		 */
  1059		if (hwentries < 64)
  1060			hwentries = 64;
  1061	
  1062		memsize = hwentries * (ucontext->is_32b_cqe ?
  1063				(sizeof(*chp->cq.queue) / 2) : sizeof(*chp->cq.queue));
  1064	
  1065		/*
  1066		 * memsize must be a multiple of the page size if its a user cq.
  1067		 */
  1068		memsize = roundup(memsize, PAGE_SIZE);
  1069	
  1070		chp->cq.size = hwentries;
  1071		chp->cq.memsize = memsize;
  1072		chp->cq.vector = vector;
  1073	
  1074		ret = create_cq(&rhp->rdev, &chp->cq, &ucontext->uctx, chp->wr_waitp);
  1075		if (ret)
  1076			goto err_free_skb;
  1077	
  1078		chp->rhp = rhp;
  1079		chp->cq.size--;				/* status page */
  1080		chp->ibcq.cqe = entries - 2;
  1081		spin_lock_init(&chp->lock);
  1082		spin_lock_init(&chp->comp_handler_lock);
  1083		refcount_set(&chp->refcnt, 1);
  1084		init_completion(&chp->cq_rel_comp);
  1085		ret = xa_insert_irq(&rhp->cqs, chp->cq.cqid, chp, GFP_KERNEL);
  1086		if (ret)
  1087			goto err_destroy_cq;
  1088	
  1089		ret = -ENOMEM;
  1090		mm = kmalloc(sizeof(*mm), GFP_KERNEL);
  1091		if (!mm)
  1092			goto err_remove_handle;
  1093		mm2 = kmalloc(sizeof(*mm2), GFP_KERNEL);
  1094		if (!mm2)
  1095			goto err_free_mm;
  1096	
  1097		memset(&uresp, 0, sizeof(uresp));
  1098		uresp.qid_mask = rhp->rdev.cqmask;
  1099		uresp.cqid = chp->cq.cqid;
  1100		uresp.size = chp->cq.size;
  1101		uresp.memsize = chp->cq.memsize;
  1102		spin_lock(&ucontext->mmap_lock);
  1103		uresp.key = ucontext->key;
  1104		ucontext->key += PAGE_SIZE;
  1105		uresp.gts_key = ucontext->key;
  1106		ucontext->key += PAGE_SIZE;
  1107		/* communicate to the userspace that
  1108		 * kernel driver supports 64B CQE
  1109		 */
  1110		uresp.flags |= C4IW_64B_CQE;
  1111	
  1112		spin_unlock(&ucontext->mmap_lock);
  1113		ret = ib_copy_to_udata(udata, &uresp,
  1114				       ucontext->is_32b_cqe ?
  1115				       sizeof(uresp) - sizeof(uresp.flags) :
  1116				       sizeof(uresp));
  1117		if (ret)
  1118			goto err_free_mm2;
  1119	
  1120		mm->key = uresp.key;
  1121		mm->addr = 0;
  1122		mm->vaddr = chp->cq.queue;
  1123		mm->dma_addr = chp->cq.dma_addr;
  1124		mm->len = chp->cq.memsize;
  1125		insert_flag_to_mmap(&rhp->rdev, mm, mm->addr);
  1126		insert_mmap(ucontext, mm);
  1127	
  1128		mm2->key = uresp.gts_key;
  1129		mm2->addr = chp->cq.bar2_pa;
  1130		mm2->len = PAGE_SIZE;
  1131		mm2->vaddr = NULL;
  1132		mm2->dma_addr = 0;
  1133		insert_flag_to_mmap(&rhp->rdev, mm2, mm2->addr);
  1134		insert_mmap(ucontext, mm2);
  1135	
  1136		pr_debug("cqid 0x%0x chp %p size %u memsize %zu, dma_addr %pad\n",
  1137			 chp->cq.cqid, chp, chp->cq.size, chp->cq.memsize,
  1138			 &chp->cq.dma_addr);
  1139		return 0;
  1140	err_free_mm2:
  1141		kfree(mm2);
  1142	err_free_mm:
  1143		kfree(mm);
  1144	err_remove_handle:
  1145		xa_erase_irq(&rhp->cqs, chp->cq.cqid);
  1146	err_destroy_cq:
  1147		destroy_cq(&chp->rhp->rdev, &chp->cq, &ucontext->uctx,
  1148			   chp->destroy_skb, chp->wr_waitp);
  1149	err_free_skb:
  1150		kfree_skb(chp->destroy_skb);
  1151	err_free_wr_wait:
  1152		c4iw_put_wr_wait(chp->wr_waitp);
  1153		return ret;
  1154	}
  1155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
