Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53625212B0A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014366; cv=none; b=VvwkHSHBhp7l7oUPyQioAVKh0Tylw8FFyU5BRmeoiMhRPhuDS6npSWN/J8vreuH3/XIVYyy1mpY2e0irQ0sfsm5v33YJ/mX6WsoVwOsFtg7cTC3OsbzTLpBPY8fapMtkgRBMOMxR5xvUGclirBkglFC21ptE+Wy5+tHttqwWQdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014366; c=relaxed/simple;
	bh=GK5Xe/20OMIvGbdak0uBjgyg+XLtqcKFwblRw05z8t4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W4dlGdS7MOq8fIFvZXqOMBYIVcSPBKBbANyHWGWvhxd4TTfIO54VMf3iAEad/0mGmbTJnjCNrrzmZwDA2BoBIRoUEZwe5knoHz3THCJXOFWT3b4rQvXaDR9Dmt7A09gfMDwAcznxEa/IraKJjfA7/gRa4iUoMP0AS4JERueZgf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PpGB1uU/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpGB1uU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741014364; x=1772550364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GK5Xe/20OMIvGbdak0uBjgyg+XLtqcKFwblRw05z8t4=;
  b=PpGB1uU/wboO5iHhRM1WLwdy+EuSEgmBQne5nx2JqapVW7aj+A/Hcx9d
   riIy1kiHKEM2qKSZfbvXk/B570KvSVKGiefNH3DK5mZtViauwyC9G9a/b
   FD+3YdDqni3l1jaoMdEQ9jHa4TtWHKsYYzaRAzXNwj6VT7lzG3EumjWSg
   1sxb3vm5jxi4JF39SjmRmcz5MwZ7JUITAoNzf7kX4AHJYkcixaNclgYZV
   uGffjrkLqQwIzQh7Au0+kExL+PYsRlPBkxhg4wHtqcFrsBmh+hmSn0v7f
   KQt1Qy3tIPhfNNblT5CyXr3fgDYYlawbjgnYpMNH34Lv+fRruTrh44Xsc
   g==;
X-CSE-ConnectionGUID: 9dKF4t8HRKivcmOsojxJ7A==
X-CSE-MsgGUID: CK50v4kySkyt2sEtJk2OSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="64336799"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="64336799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 07:06:03 -0800
X-CSE-ConnectionGUID: DTU01pwqTw+a1NzpW8LVMQ==
X-CSE-MsgGUID: M4eKikaqQIeF137WR4pHNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117891357"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2025 07:06:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp7Mm-000Id3-22;
	Mon, 03 Mar 2025 15:06:00 +0000
Date: Mon, 3 Mar 2025 23:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 drivers/infiniband/hw/erdma/erdma_ioctl.c:86:5: warning: no previous
 prototype for 'erdma_ioctl_dump_cmd'
Message-ID: <202503032313.fbtUQZvc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   413645820de6d715e23ec6200a3e5a469ec69672
commit: eec678404fd20f650347a8200c906989db8cd7bb [1/1] ck: RDMA/erdma: Add ERDMA driver
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250303/202503032313.fbtUQZvc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503032313.fbtUQZvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503032313.fbtUQZvc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/erdma/erdma_ioctl.c:40:5: warning: no previous prototype for 'erdma_ioctl_ctrl_cmd' [-Wmissing-prototypes]
      40 | int erdma_ioctl_ctrl_cmd(struct erdma_dev *edev, struct erdma_ioctl_msg *msg)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/erdma/erdma_ioctl.c:86:5: warning: no previous prototype for 'erdma_ioctl_dump_cmd' [-Wmissing-prototypes]
      86 | int erdma_ioctl_dump_cmd(struct erdma_dev *edev, struct erdma_ioctl_msg *msg)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/erdma/erdma_ioctl.c:185:5: warning: no previous prototype for 'erdma_ioctl_stat_cmd' [-Wmissing-prototypes]
     185 | int erdma_ioctl_stat_cmd(struct erdma_dev *edev, struct erdma_ioctl_msg *msg)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/erdma/erdma_ioctl.c:249:5: warning: no previous prototype for 'erdma_ioctl_info_cmd' [-Wmissing-prototypes]
     249 | int erdma_ioctl_info_cmd(struct erdma_dev *edev, struct erdma_ioctl_msg *msg)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/erdma_ioctl_dump_cmd +86 drivers/infiniband/hw/erdma/erdma_ioctl.c

    85	
  > 86	int erdma_ioctl_dump_cmd(struct erdma_dev *edev, struct erdma_ioctl_msg *msg)
    87	{
    88		struct erdma_cq *ecq;
    89		struct erdma_qp *eqp;
    90		__u8 *cqe;
    91		__u8 *sqe;
    92		__u8 *rqe;
    93		__u8 *eqe;
    94		__u16 idx = msg->in.idx;
    95		__u16 qn = msg->in.qn;
    96	
    97		switch (msg->in.opcode) {
    98		case ERDMA_DUMP_OPCODE_CQE:
    99			if (qn == 0) {
   100				cqe = (__u8 *)(edev->cmdq.cq.qbuf + (idx & (edev->cmdq.depth - 1)));
   101			} else {
   102				ecq = erdma_cq_id2obj(edev, qn, 0);
   103				if (!ecq) {
   104					pr_err("Can not find CQ(%d).\n", qn);
   105					return -1;
   106				}
   107	
   108				cqe = (__u8 *)(ecq->queue + (idx & (ecq->depth - 1)));
   109			}
   110	
   111			ddump("cqe", cqe, sizeof(struct erdma_cqe));
   112			memcpy(msg->out.data, cqe, sizeof(struct erdma_cqe));
   113			msg->out.length = sizeof(struct erdma_cqe);
   114	
   115			break;
   116		case ERDMA_DUMP_OPCODE_SQE:
   117			if (qn == 0) {
   118				idx &= (edev->cmdq.depth - 1);
   119				sqe = (__u8 *)((void *)edev->cmdq.sq.qbuf + idx * ERDMA_SQ_WQEBB_SIZE);
   120			} else {
   121				eqp = erdma_qp_id2obj(edev, qn);
   122				if (!eqp) {
   123					pr_err("Can not find QP(%d).\n", qn);
   124					return -1;
   125				}
   126				erdma_qp_put(eqp);
   127	
   128				idx &= (eqp->sendq.depth - 1);
   129				sqe = (__u8 *)(eqp->sendq.qbuf + ERDMA_SQ_WQEBB_SIZE * idx);
   130			}
   131	
   132			ddump("sqe", sqe, ERDMA_SQ_WQEBB_SIZE);
   133			memcpy(msg->out.data, sqe, ERDMA_SQ_WQEBB_SIZE);
   134			msg->out.length = ERDMA_SQ_WQEBB_SIZE;
   135	
   136			break;
   137		case ERDMA_DUMP_OPCODE_RQE:
   138			if (qn == 0)
   139				return -1;
   140	
   141			eqp = erdma_qp_id2obj(edev, qn);
   142			if (!eqp) {
   143				pr_err("Can not find QP(%d).\n", qn);
   144				return -1;
   145			}
   146			erdma_qp_put(eqp);
   147			idx &= (eqp->recvq.depth - 1);
   148			rqe = (__u8 *)(eqp->recvq.qbuf + ERDMA_MAX_RQE_SIZE * idx);
   149	
   150			ddump("rqe", rqe, ERDMA_MAX_RQE_SIZE);
   151			memcpy(msg->out.data, rqe, ERDMA_MAX_RQE_SIZE);
   152			msg->out.length = ERDMA_MAX_RQE_SIZE;
   153	
   154			break;
   155		case ERDMA_DUMP_OPCODE_EQE:
   156			if (msg->in.qn == 0) {
   157				idx &= (edev->cmdq.eq.depth - 1);
   158				eqe = (__u8 *)(edev->cmdq.eq.qbuf + ERDMA_EQ_WQEBB_SIZE * idx);
   159	
   160				ddump("eqe", eqe, ERDMA_EQ_WQEBB_SIZE);
   161				memcpy(msg->out.data, eqe, ERDMA_EQ_WQEBB_SIZE);
   162				msg->out.length = ERDMA_EQ_WQEBB_SIZE;
   163			} else if (msg->in.qn >= 1 && msg->in.qn < edev->irq_num) {
   164				if (edev->ceqs[msg->in.qn - 1].ready == 0)
   165					return -1;
   166	
   167				idx &= (edev->ceqs[msg->in.qn - 1].eq.depth - 1);
   168				eqe = (__u8 *)(edev->ceqs[msg->in.qn - 1].eq.qbuf +
   169							ERDMA_EQ_WQEBB_SIZE * idx);
   170				ddump("eqe", eqe, ERDMA_EQ_WQEBB_SIZE);
   171				memcpy(msg->out.data, eqe, ERDMA_EQ_WQEBB_SIZE);
   172				msg->out.length = ERDMA_EQ_WQEBB_SIZE;
   173			} else
   174				return -1;
   175	
   176			break;
   177		default:
   178			pr_err("unknown dump opcode %d.\n", msg->in.opcode);
   179			return -1;
   180		}
   181		return 0;
   182	}
   183	
   184	
 > 185	int erdma_ioctl_stat_cmd(struct erdma_dev *edev, struct erdma_ioctl_msg *msg)
   186	{
   187	#ifdef ERDMA_ENABLE_DEBUG
   188		struct erdma_cq *cq;
   189		struct erdma_qp *eqp;
   190		__u16 qn = msg->in.qn;
   191		__u64 *stats_data;
   192	
   193		switch (msg->in.opcode) {
   194		case ERDMA_STAT_OPCODE_QP:
   195			if (qn == 0)
   196				return -1;
   197			eqp = erdma_qp_id2obj(edev, qn);
   198			if (!eqp) {
   199				pr_err("Can not find QP(%d).\n", qn);
   200				return -1;
   201			}
   202			erdma_qp_put(eqp);
   203	
   204			memcpy(msg->out.data, eqp->snapshot, 256);
   205			msg->out.length = 256;
   206	
   207			break;
   208		case ERDMA_STAT_OPCODE_CQ:
   209			if (qn == 0)
   210				return -1;
   211			cq = erdma_cq_id2obj(edev, qn, 0);
   212			if (!cq) {
   213				pr_err("Can not find CQ(%d).\n", qn);
   214				return -1;
   215			}
   216	
   217			memcpy(msg->out.data, cq->snapshot, 256);
   218			msg->out.length = 256;
   219	
   220			break;
   221		case ERDMA_STAT_OPCODE_DEV:
   222			stats_data = (__u64 *)msg->out.data;
   223			stats_data[0] = erdma_reg_read64(edev, 0x80);
   224			stats_data[1] = erdma_reg_read64(edev, 0x88);
   225			stats_data[2] = erdma_reg_read64(edev, 0x90);
   226			stats_data[3] = erdma_reg_read64(edev, 0x98);
   227			stats_data[4] = erdma_reg_read64(edev, 0xa0);
   228			stats_data[5] = erdma_reg_read64(edev, 0xa8);
   229	
   230			stats_data[6] = erdma_reg_read64(edev, 0xc0);
   231			stats_data[7] = erdma_reg_read64(edev, 0xc8);
   232			stats_data[8] = erdma_reg_read64(edev, 0xd0);
   233			stats_data[9] = erdma_reg_read64(edev, 0xd8);
   234			stats_data[10] = erdma_reg_read64(edev, 0xe0);
   235	
   236			msg->out.length = 256;
   237			break;
   238		default:
   239			pr_err("unknown stat opcode %d.\n", msg->in.opcode);
   240			return -1;
   241		}
   242	
   243		return 0;
   244	#else
   245		return -1;
   246	#endif
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
