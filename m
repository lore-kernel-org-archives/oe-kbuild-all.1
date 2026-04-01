Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193A35DA48
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 02:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010667; cv=none; b=jYdUlDbH89/AoveXE111zKhCGOT1wTTSa4s5prO26OqudNPkEEF3ANUdMBCL7JMKDTCqF6wWn9gz0YvX17Vbn211sMe54jrl03tXmklQVHH0Fl3zNDzw7YicXihJtljKHHu71DkfjGsyGcA2NKAflFRIq4GkLsRZbOWgLkMxN24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010667; c=relaxed/simple;
	bh=uOStcwOhLBOmtwSivJxdUt1DpFYh7Avr/wGOPqiciC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SPKnmd6DrqSxlaei7/OGP8I6mi2PHOf1jHwL8nFtj2XCZkbwmqMoha6GMIkA8agBdjoNIwvxihlniThGzW3G6HnfWu9RmnyjdmJy7bTzcV5dbj6vokJ4j3jIadMHvedt43MbQn8SOJ6nFMi6/TWbwzUQwLZLyYA4uSgSSfIfpb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLq4rvHM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLq4rvHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775010660; x=1806546660;
  h=date:from:to:cc:subject:message-id;
  bh=uOStcwOhLBOmtwSivJxdUt1DpFYh7Avr/wGOPqiciC0=;
  b=jLq4rvHMYprec5z/GKN+h03rdRANFfwGqZlmyuMAN8E2zAP6sKd8GsMF
   IezNmth8FWC8ukBsP08joS49iBFYG/2YX7AfGEplhfyrNZaS4g314suTD
   jUifsT1WoYyOi0xXLQ5yepxwvuKhYlYDBdT3h7JagSBgnOfb9/IgX4YpF
   n0NWc4eui0uCb1jB0S1rVM7fKqz+v4x+dVGrYOuQAsEct3Y3U3GWU85Yy
   PNpvqpV/legdbmuecHqU7/dbd02YrRk55vxt5HQEK89HvqYGBmjAhpXcE
   +TKyVwog5Cusm6mixVI6eWcZeDzPn+gRRXc3aAgB8rHt0tD00HsjKLwdK
   Q==;
X-CSE-ConnectionGUID: VT1KHSsqQaiQ4Y5l/90TbA==
X-CSE-MsgGUID: Z6CCiQuiRrenpxEkYm+pbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75925709"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75925709"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:30:58 -0700
X-CSE-ConnectionGUID: H+1UDBIbRLGnBg5Ih6uEiw==
X-CSE-MsgGUID: yoREsmf7S5ioWbrvRUTfwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231477752"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2026 19:30:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7lM5-000000008cL-33Gv;
	Wed, 01 Apr 2026 02:30:53 +0000
Date: Wed, 01 Apr 2026 04:30:07 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:rdma_uapi 4/11]
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c:85:30: warning: variable
 'us_ibdev' set but not used
Message-ID: <202604010447.a1oupHrJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux rdma_uapi
head:   634b50f8d2d215b6a2e13fc6648d52428bd0c9d3
commit: b55f0dab49fe5c5c7f9f55dddb9ff7c42ffa8a39 [4/11] RDMA: Convert drivers using sizeof() to ib_respond_udata()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260401/202604010447.a1oupHrJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010447.a1oupHrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010447.a1oupHrJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/usnic/usnic_ib_verbs.c: In function 'usnic_ib_fill_create_qp_resp':
>> drivers/infiniband/hw/usnic/usnic_ib_verbs.c:85:30: warning: variable 'us_ibdev' set but not used [-Wunused-but-set-variable]
      85 |         struct usnic_ib_dev *us_ibdev;
         |                              ^~~~~~~~


vim +/us_ibdev +85 drivers/infiniband/hw/usnic/usnic_ib_verbs.c

e3cf00d0a87f02 Upinder Malhi   2013-09-10   81  
e3cf00d0a87f02 Upinder Malhi   2013-09-10   82  static int usnic_ib_fill_create_qp_resp(struct usnic_ib_qp_grp *qp_grp,
e3cf00d0a87f02 Upinder Malhi   2013-09-10   83  					struct ib_udata *udata)
e3cf00d0a87f02 Upinder Malhi   2013-09-10   84  {
e3cf00d0a87f02 Upinder Malhi   2013-09-10  @85  	struct usnic_ib_dev *us_ibdev;
e3cf00d0a87f02 Upinder Malhi   2013-09-10   86  	struct usnic_ib_create_qp_resp resp;
e3cf00d0a87f02 Upinder Malhi   2013-09-10   87  	struct pci_dev *pdev;
e3cf00d0a87f02 Upinder Malhi   2013-09-10   88  	struct vnic_dev_bar *bar;
e3cf00d0a87f02 Upinder Malhi   2013-09-10   89  	struct usnic_vnic_res_chunk *chunk;
8af94ac66a4d53 Upinder Malhi   2014-01-09   90  	struct usnic_ib_qp_grp_flow *default_flow;
e3cf00d0a87f02 Upinder Malhi   2013-09-10   91  	int i, err;
e3cf00d0a87f02 Upinder Malhi   2013-09-10   92  
e3cf00d0a87f02 Upinder Malhi   2013-09-10   93  	memset(&resp, 0, sizeof(resp));
e3cf00d0a87f02 Upinder Malhi   2013-09-10   94  
e3cf00d0a87f02 Upinder Malhi   2013-09-10   95  	us_ibdev = qp_grp->vf->pf;
e3cf00d0a87f02 Upinder Malhi   2013-09-10   96  	pdev = usnic_vnic_get_pdev(qp_grp->vf->vnic);
e3cf00d0a87f02 Upinder Malhi   2013-09-10   97  	if (!pdev) {
e3cf00d0a87f02 Upinder Malhi   2013-09-10   98  		usnic_err("Failed to get pdev of qp_grp %d\n",
e3cf00d0a87f02 Upinder Malhi   2013-09-10   99  				qp_grp->grp_id);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  100  		return -EFAULT;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  101  	}
e3cf00d0a87f02 Upinder Malhi   2013-09-10  102  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  103  	bar = usnic_vnic_get_bar(qp_grp->vf->vnic, 0);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  104  	if (!bar) {
e3cf00d0a87f02 Upinder Malhi   2013-09-10  105  		usnic_err("Failed to get bar0 of qp_grp %d vf %s",
e3cf00d0a87f02 Upinder Malhi   2013-09-10  106  				qp_grp->grp_id, pci_name(pdev));
e3cf00d0a87f02 Upinder Malhi   2013-09-10  107  		return -EFAULT;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  108  	}
e3cf00d0a87f02 Upinder Malhi   2013-09-10  109  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  110  	resp.vfid = usnic_vnic_get_index(qp_grp->vf->vnic);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  111  	resp.bar_bus_addr = bar->bus_addr;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  112  	resp.bar_len = bar->len;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  113  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  114  	chunk = usnic_ib_qp_grp_get_chunk(qp_grp, USNIC_VNIC_RES_TYPE_RQ);
5f4c7e4eb5f369 Julia Lawall    2016-11-11  115  	if (IS_ERR(chunk)) {
e3cf00d0a87f02 Upinder Malhi   2013-09-10  116  		usnic_err("Failed to get chunk %s for qp_grp %d with err %ld\n",
e3cf00d0a87f02 Upinder Malhi   2013-09-10  117  			usnic_vnic_res_type_to_str(USNIC_VNIC_RES_TYPE_RQ),
e3cf00d0a87f02 Upinder Malhi   2013-09-10  118  			qp_grp->grp_id,
e3cf00d0a87f02 Upinder Malhi   2013-09-10  119  			PTR_ERR(chunk));
5f4c7e4eb5f369 Julia Lawall    2016-11-11  120  		return PTR_ERR(chunk);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  121  	}
e3cf00d0a87f02 Upinder Malhi   2013-09-10  122  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  123  	WARN_ON(chunk->type != USNIC_VNIC_RES_TYPE_RQ);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  124  	resp.rq_cnt = chunk->cnt;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  125  	for (i = 0; i < chunk->cnt; i++)
e3cf00d0a87f02 Upinder Malhi   2013-09-10  126  		resp.rq_idx[i] = chunk->res[i]->vnic_idx;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  127  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  128  	chunk = usnic_ib_qp_grp_get_chunk(qp_grp, USNIC_VNIC_RES_TYPE_WQ);
5f4c7e4eb5f369 Julia Lawall    2016-11-11  129  	if (IS_ERR(chunk)) {
e3cf00d0a87f02 Upinder Malhi   2013-09-10  130  		usnic_err("Failed to get chunk %s for qp_grp %d with err %ld\n",
e3cf00d0a87f02 Upinder Malhi   2013-09-10  131  			usnic_vnic_res_type_to_str(USNIC_VNIC_RES_TYPE_WQ),
e3cf00d0a87f02 Upinder Malhi   2013-09-10  132  			qp_grp->grp_id,
e3cf00d0a87f02 Upinder Malhi   2013-09-10  133  			PTR_ERR(chunk));
5f4c7e4eb5f369 Julia Lawall    2016-11-11  134  		return PTR_ERR(chunk);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  135  	}
e3cf00d0a87f02 Upinder Malhi   2013-09-10  136  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  137  	WARN_ON(chunk->type != USNIC_VNIC_RES_TYPE_WQ);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  138  	resp.wq_cnt = chunk->cnt;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  139  	for (i = 0; i < chunk->cnt; i++)
e3cf00d0a87f02 Upinder Malhi   2013-09-10  140  		resp.wq_idx[i] = chunk->res[i]->vnic_idx;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  141  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  142  	chunk = usnic_ib_qp_grp_get_chunk(qp_grp, USNIC_VNIC_RES_TYPE_CQ);
5f4c7e4eb5f369 Julia Lawall    2016-11-11  143  	if (IS_ERR(chunk)) {
e3cf00d0a87f02 Upinder Malhi   2013-09-10  144  		usnic_err("Failed to get chunk %s for qp_grp %d with err %ld\n",
e3cf00d0a87f02 Upinder Malhi   2013-09-10  145  			usnic_vnic_res_type_to_str(USNIC_VNIC_RES_TYPE_CQ),
e3cf00d0a87f02 Upinder Malhi   2013-09-10  146  			qp_grp->grp_id,
e3cf00d0a87f02 Upinder Malhi   2013-09-10  147  			PTR_ERR(chunk));
5f4c7e4eb5f369 Julia Lawall    2016-11-11  148  		return PTR_ERR(chunk);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  149  	}
e3cf00d0a87f02 Upinder Malhi   2013-09-10  150  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  151  	WARN_ON(chunk->type != USNIC_VNIC_RES_TYPE_CQ);
e3cf00d0a87f02 Upinder Malhi   2013-09-10  152  	resp.cq_cnt = chunk->cnt;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  153  	for (i = 0; i < chunk->cnt; i++)
e3cf00d0a87f02 Upinder Malhi   2013-09-10  154  		resp.cq_idx[i] = chunk->res[i]->vnic_idx;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  155  
8af94ac66a4d53 Upinder Malhi   2014-01-09  156  	default_flow = list_first_entry(&qp_grp->flows_lst,
8af94ac66a4d53 Upinder Malhi   2014-01-09  157  					struct usnic_ib_qp_grp_flow, link);
8af94ac66a4d53 Upinder Malhi   2014-01-09  158  	resp.transport = default_flow->trans_type;
8af94ac66a4d53 Upinder Malhi   2014-01-09  159  
b55f0dab49fe5c Jason Gunthorpe 2026-02-05  160  	err = ib_respond_udata(udata, resp);
b55f0dab49fe5c Jason Gunthorpe 2026-02-05  161  	if (err)
e3cf00d0a87f02 Upinder Malhi   2013-09-10  162  		return err;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  163  
e3cf00d0a87f02 Upinder Malhi   2013-09-10  164  	return 0;
e3cf00d0a87f02 Upinder Malhi   2013-09-10  165  }
e3cf00d0a87f02 Upinder Malhi   2013-09-10  166  

:::::: The code at line 85 was first introduced by commit
:::::: e3cf00d0a87f025db5855a43a67c67a41fa79fef IB/usnic: Add Cisco VIC low-level hardware driver

:::::: TO: Upinder Malhi <umalhi@cisco.com>
:::::: CC: Roland Dreier <roland@purestorage.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
