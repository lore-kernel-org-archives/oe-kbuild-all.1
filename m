Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200162019C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 22:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692743919; x=1724279919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Dbp5g8c2awAHD++7WhDV3x7vfxW3+1/F264gPkO66o=;
  b=L2mQgukm4pLFvd+FJGDOZkvOWXhWyTltJc/QYilfcjnHPNaRPUlCwQMK
   f8J9S+XC5C5iqsy8KNxJUXV1BIdNri1T3snyCyoM8nT5lIRDo6KB8tPOj
   BFtbMbcN77LyLMoGjQZMtfCtnvOBuybyGbNKiCw1iX1WJwnvI4fNlpk9Y
   Lm0pKrJ3KlNVkZiOGcBwE864PsO35CQ0T2js901fYBUe3+ZBdr7IbAckH
   yemuod0P0qjD4YbWMBcP9k7ULi8iirr27xTKSLTNRIx0/wz08AmZcNdSc
   NjXu+kotHGHzJNigBQhOeGf3QCaZSuvdebX8paMgcB016tbchYiQeoebh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="373985981"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="373985981"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 15:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="686208672"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="686208672"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2023 15:38:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYa1A-0000ae-0t;
	Tue, 22 Aug 2023 22:38:32 +0000
Date: Wed, 23 Aug 2023 06:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [mkp-scsi:for-next 113/134] drivers/nvme/host/fc.c:1228:24: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202308230635.U2i6gTri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   091462cb57e4ac146f134e258c4f764662ba3961
commit: 875386b98857822b77ac7f95bdf367b70af5b78c [113/134] scsi: qla2xxx: Add Unsolicited LS Request and Response Support for NVMe
config: nios2-randconfig-r122-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230635.U2i6gTri-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230635.U2i6gTri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230635.U2i6gTri-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/nvme/host/fc.c:1690:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1690:45: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1690:45: sparse:     got int
   drivers/nvme/host/fc.c:1058:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1058:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1086:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1086:57: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1092:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1116:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1116:58: sparse: sparse: restricted __le32 degrades to integer
>> drivers/nvme/host/fc.c:1228:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rqstlen @@     got unsigned int @@
   drivers/nvme/host/fc.c:1228:24: sparse:     expected restricted __le32 [usertype] rqstlen
   drivers/nvme/host/fc.c:1228:24: sparse:     got unsigned int
>> drivers/nvme/host/fc.c:1230:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned int @@
   drivers/nvme/host/fc.c:1230:23: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1230:23: sparse:     got unsigned int
   drivers/nvme/host/fc.c:1343:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rqstlen @@     got unsigned int @@
   drivers/nvme/host/fc.c:1343:24: sparse:     expected restricted __le32 [usertype] rqstlen
   drivers/nvme/host/fc.c:1343:24: sparse:     got unsigned int
   drivers/nvme/host/fc.c:1345:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned int @@
   drivers/nvme/host/fc.c:1345:23: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1345:23: sparse:     got unsigned int
   drivers/nvme/host/fc.c:1544:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1544:38: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1544:38: sparse:     got int
   drivers/nvme/host/fc.c:1585:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1585:37: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1585:37: sparse:     got int
   drivers/nvme/host/fc.c:1596:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned int @@
   drivers/nvme/host/fc.c:1596:29: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1596:29: sparse:     got unsigned int
   drivers/nvme/host/fc.c:1646:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1646:37: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1646:37: sparse:     got int
   drivers/nvme/host/fc.c:1652:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1652:37: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1652:37: sparse:     got int
   drivers/nvme/host/fc.c:1657:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1657:37: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1657:37: sparse:     got int
   drivers/nvme/host/fc.c: note: in included file:
>> drivers/nvme/host/fc.h:168:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rqstlen @@     got unsigned int @@
   drivers/nvme/host/fc.h:168:24: sparse:     expected restricted __le32 [usertype] rqstlen
   drivers/nvme/host/fc.h:168:24: sparse:     got unsigned int
>> drivers/nvme/host/fc.h:170:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned int @@
   drivers/nvme/host/fc.h:170:23: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.h:170:23: sparse:     got unsigned int

vim +1228 drivers/nvme/host/fc.c

e399441de9115c James Smart       2016-12-02  1036  
e399441de9115c James Smart       2016-12-02  1037  static void
c913a8b0d4c564 James Smart       2017-04-11  1038  __nvme_fc_finish_ls_req(struct nvmefc_ls_req_op *lsop)
e399441de9115c James Smart       2016-12-02  1039  {
c913a8b0d4c564 James Smart       2017-04-11  1040  	struct nvme_fc_rport *rport = lsop->rport;
e399441de9115c James Smart       2016-12-02  1041  	struct nvmefc_ls_req *lsreq = &lsop->ls_req;
e399441de9115c James Smart       2016-12-02  1042  	unsigned long flags;
e399441de9115c James Smart       2016-12-02  1043  
c913a8b0d4c564 James Smart       2017-04-11  1044  	spin_lock_irqsave(&rport->lock, flags);
e399441de9115c James Smart       2016-12-02  1045  
e399441de9115c James Smart       2016-12-02  1046  	if (!lsop->req_queued) {
c913a8b0d4c564 James Smart       2017-04-11  1047  		spin_unlock_irqrestore(&rport->lock, flags);
e399441de9115c James Smart       2016-12-02  1048  		return;
e399441de9115c James Smart       2016-12-02  1049  	}
e399441de9115c James Smart       2016-12-02  1050  
e399441de9115c James Smart       2016-12-02  1051  	list_del(&lsop->lsreq_list);
e399441de9115c James Smart       2016-12-02  1052  
e399441de9115c James Smart       2016-12-02  1053  	lsop->req_queued = false;
e399441de9115c James Smart       2016-12-02  1054  
c913a8b0d4c564 James Smart       2017-04-11  1055  	spin_unlock_irqrestore(&rport->lock, flags);
e399441de9115c James Smart       2016-12-02  1056  
c913a8b0d4c564 James Smart       2017-04-11  1057  	fc_dma_unmap_single(rport->dev, lsreq->rqstdma,
e399441de9115c James Smart       2016-12-02 @1058  				  (lsreq->rqstlen + lsreq->rsplen),
e399441de9115c James Smart       2016-12-02  1059  				  DMA_BIDIRECTIONAL);
e399441de9115c James Smart       2016-12-02  1060  
c913a8b0d4c564 James Smart       2017-04-11  1061  	nvme_fc_rport_put(rport);
e399441de9115c James Smart       2016-12-02  1062  }
e399441de9115c James Smart       2016-12-02  1063  
e399441de9115c James Smart       2016-12-02  1064  static int
c913a8b0d4c564 James Smart       2017-04-11  1065  __nvme_fc_send_ls_req(struct nvme_fc_rport *rport,
e399441de9115c James Smart       2016-12-02  1066  		struct nvmefc_ls_req_op *lsop,
e399441de9115c James Smart       2016-12-02  1067  		void (*done)(struct nvmefc_ls_req *req, int status))
e399441de9115c James Smart       2016-12-02  1068  {
e399441de9115c James Smart       2016-12-02  1069  	struct nvmefc_ls_req *lsreq = &lsop->ls_req;
e399441de9115c James Smart       2016-12-02  1070  	unsigned long flags;
c913a8b0d4c564 James Smart       2017-04-11  1071  	int ret = 0;
e399441de9115c James Smart       2016-12-02  1072  
c913a8b0d4c564 James Smart       2017-04-11  1073  	if (rport->remoteport.port_state != FC_OBJSTATE_ONLINE)
c913a8b0d4c564 James Smart       2017-04-11  1074  		return -ECONNREFUSED;
c913a8b0d4c564 James Smart       2017-04-11  1075  
c913a8b0d4c564 James Smart       2017-04-11  1076  	if (!nvme_fc_rport_get(rport))
e399441de9115c James Smart       2016-12-02  1077  		return -ESHUTDOWN;
e399441de9115c James Smart       2016-12-02  1078  
e399441de9115c James Smart       2016-12-02  1079  	lsreq->done = done;
c913a8b0d4c564 James Smart       2017-04-11  1080  	lsop->rport = rport;
e399441de9115c James Smart       2016-12-02  1081  	lsop->req_queued = false;
e399441de9115c James Smart       2016-12-02  1082  	INIT_LIST_HEAD(&lsop->lsreq_list);
e399441de9115c James Smart       2016-12-02  1083  	init_completion(&lsop->ls_done);
e399441de9115c James Smart       2016-12-02  1084  
c913a8b0d4c564 James Smart       2017-04-11  1085  	lsreq->rqstdma = fc_dma_map_single(rport->dev, lsreq->rqstaddr,
e399441de9115c James Smart       2016-12-02  1086  				  lsreq->rqstlen + lsreq->rsplen,
e399441de9115c James Smart       2016-12-02  1087  				  DMA_BIDIRECTIONAL);
c913a8b0d4c564 James Smart       2017-04-11  1088  	if (fc_dma_mapping_error(rport->dev, lsreq->rqstdma)) {
c913a8b0d4c564 James Smart       2017-04-11  1089  		ret = -EFAULT;
c913a8b0d4c564 James Smart       2017-04-11  1090  		goto out_putrport;
e399441de9115c James Smart       2016-12-02  1091  	}
e399441de9115c James Smart       2016-12-02  1092  	lsreq->rspdma = lsreq->rqstdma + lsreq->rqstlen;
e399441de9115c James Smart       2016-12-02  1093  
c913a8b0d4c564 James Smart       2017-04-11  1094  	spin_lock_irqsave(&rport->lock, flags);
e399441de9115c James Smart       2016-12-02  1095  
c913a8b0d4c564 James Smart       2017-04-11  1096  	list_add_tail(&lsop->lsreq_list, &rport->ls_req_list);
e399441de9115c James Smart       2016-12-02  1097  
e399441de9115c James Smart       2016-12-02  1098  	lsop->req_queued = true;
e399441de9115c James Smart       2016-12-02  1099  
c913a8b0d4c564 James Smart       2017-04-11  1100  	spin_unlock_irqrestore(&rport->lock, flags);
e399441de9115c James Smart       2016-12-02  1101  
c913a8b0d4c564 James Smart       2017-04-11  1102  	ret = rport->lport->ops->ls_req(&rport->lport->localport,
c913a8b0d4c564 James Smart       2017-04-11  1103  					&rport->remoteport, lsreq);
e399441de9115c James Smart       2016-12-02  1104  	if (ret)
c913a8b0d4c564 James Smart       2017-04-11  1105  		goto out_unlink;
c913a8b0d4c564 James Smart       2017-04-11  1106  
c913a8b0d4c564 James Smart       2017-04-11  1107  	return 0;
c913a8b0d4c564 James Smart       2017-04-11  1108  
c913a8b0d4c564 James Smart       2017-04-11  1109  out_unlink:
e399441de9115c James Smart       2016-12-02  1110  	lsop->ls_error = ret;
c913a8b0d4c564 James Smart       2017-04-11  1111  	spin_lock_irqsave(&rport->lock, flags);
c913a8b0d4c564 James Smart       2017-04-11  1112  	lsop->req_queued = false;
c913a8b0d4c564 James Smart       2017-04-11  1113  	list_del(&lsop->lsreq_list);
c913a8b0d4c564 James Smart       2017-04-11  1114  	spin_unlock_irqrestore(&rport->lock, flags);
c913a8b0d4c564 James Smart       2017-04-11  1115  	fc_dma_unmap_single(rport->dev, lsreq->rqstdma,
c913a8b0d4c564 James Smart       2017-04-11  1116  				  (lsreq->rqstlen + lsreq->rsplen),
c913a8b0d4c564 James Smart       2017-04-11  1117  				  DMA_BIDIRECTIONAL);
c913a8b0d4c564 James Smart       2017-04-11  1118  out_putrport:
c913a8b0d4c564 James Smart       2017-04-11  1119  	nvme_fc_rport_put(rport);
e399441de9115c James Smart       2016-12-02  1120  
e399441de9115c James Smart       2016-12-02  1121  	return ret;
e399441de9115c James Smart       2016-12-02  1122  }
e399441de9115c James Smart       2016-12-02  1123  
e399441de9115c James Smart       2016-12-02  1124  static void
e399441de9115c James Smart       2016-12-02  1125  nvme_fc_send_ls_req_done(struct nvmefc_ls_req *lsreq, int status)
e399441de9115c James Smart       2016-12-02  1126  {
e399441de9115c James Smart       2016-12-02  1127  	struct nvmefc_ls_req_op *lsop = ls_req_to_lsop(lsreq);
e399441de9115c James Smart       2016-12-02  1128  
e399441de9115c James Smart       2016-12-02  1129  	lsop->ls_error = status;
e399441de9115c James Smart       2016-12-02  1130  	complete(&lsop->ls_done);
e399441de9115c James Smart       2016-12-02  1131  }
e399441de9115c James Smart       2016-12-02  1132  
e399441de9115c James Smart       2016-12-02  1133  static int
c913a8b0d4c564 James Smart       2017-04-11  1134  nvme_fc_send_ls_req(struct nvme_fc_rport *rport, struct nvmefc_ls_req_op *lsop)
e399441de9115c James Smart       2016-12-02  1135  {
e399441de9115c James Smart       2016-12-02  1136  	struct nvmefc_ls_req *lsreq = &lsop->ls_req;
e399441de9115c James Smart       2016-12-02  1137  	struct fcnvme_ls_rjt *rjt = lsreq->rspaddr;
e399441de9115c James Smart       2016-12-02  1138  	int ret;
e399441de9115c James Smart       2016-12-02  1139  
c913a8b0d4c564 James Smart       2017-04-11  1140  	ret = __nvme_fc_send_ls_req(rport, lsop, nvme_fc_send_ls_req_done);
e399441de9115c James Smart       2016-12-02  1141  
c913a8b0d4c564 James Smart       2017-04-11  1142  	if (!ret) {
e399441de9115c James Smart       2016-12-02  1143  		/*
e399441de9115c James Smart       2016-12-02  1144  		 * No timeout/not interruptible as we need the struct
e399441de9115c James Smart       2016-12-02  1145  		 * to exist until the lldd calls us back. Thus mandate
e399441de9115c James Smart       2016-12-02  1146  		 * wait until driver calls back. lldd responsible for
e399441de9115c James Smart       2016-12-02  1147  		 * the timeout action
e399441de9115c James Smart       2016-12-02  1148  		 */
e399441de9115c James Smart       2016-12-02  1149  		wait_for_completion(&lsop->ls_done);
e399441de9115c James Smart       2016-12-02  1150  
c913a8b0d4c564 James Smart       2017-04-11  1151  		__nvme_fc_finish_ls_req(lsop);
e399441de9115c James Smart       2016-12-02  1152  
c913a8b0d4c564 James Smart       2017-04-11  1153  		ret = lsop->ls_error;
e399441de9115c James Smart       2016-12-02  1154  	}
e399441de9115c James Smart       2016-12-02  1155  
c913a8b0d4c564 James Smart       2017-04-11  1156  	if (ret)
c913a8b0d4c564 James Smart       2017-04-11  1157  		return ret;
c913a8b0d4c564 James Smart       2017-04-11  1158  
e399441de9115c James Smart       2016-12-02  1159  	/* ACC or RJT payload ? */
e399441de9115c James Smart       2016-12-02  1160  	if (rjt->w0.ls_cmd == FCNVME_LS_RJT)
e399441de9115c James Smart       2016-12-02  1161  		return -ENXIO;
e399441de9115c James Smart       2016-12-02  1162  
e399441de9115c James Smart       2016-12-02  1163  	return 0;
e399441de9115c James Smart       2016-12-02  1164  }
e399441de9115c James Smart       2016-12-02  1165  
c913a8b0d4c564 James Smart       2017-04-11  1166  static int
c913a8b0d4c564 James Smart       2017-04-11  1167  nvme_fc_send_ls_req_async(struct nvme_fc_rport *rport,
e399441de9115c James Smart       2016-12-02  1168  		struct nvmefc_ls_req_op *lsop,
e399441de9115c James Smart       2016-12-02  1169  		void (*done)(struct nvmefc_ls_req *req, int status))
e399441de9115c James Smart       2016-12-02  1170  {
e399441de9115c James Smart       2016-12-02  1171  	/* don't wait for completion */
e399441de9115c James Smart       2016-12-02  1172  
c913a8b0d4c564 James Smart       2017-04-11  1173  	return __nvme_fc_send_ls_req(rport, lsop, done);
e399441de9115c James Smart       2016-12-02  1174  }
e399441de9115c James Smart       2016-12-02  1175  
e399441de9115c James Smart       2016-12-02  1176  static int
e399441de9115c James Smart       2016-12-02  1177  nvme_fc_connect_admin_queue(struct nvme_fc_ctrl *ctrl,
e399441de9115c James Smart       2016-12-02  1178  	struct nvme_fc_queue *queue, u16 qsize, u16 ersp_ratio)
e399441de9115c James Smart       2016-12-02  1179  {
e399441de9115c James Smart       2016-12-02  1180  	struct nvmefc_ls_req_op *lsop;
e399441de9115c James Smart       2016-12-02  1181  	struct nvmefc_ls_req *lsreq;
e399441de9115c James Smart       2016-12-02  1182  	struct fcnvme_ls_cr_assoc_rqst *assoc_rqst;
e399441de9115c James Smart       2016-12-02  1183  	struct fcnvme_ls_cr_assoc_acc *assoc_acc;
14fd1e98afafc0 James Smart       2020-03-31  1184  	unsigned long flags;
e399441de9115c James Smart       2016-12-02  1185  	int ret, fcret = 0;
e399441de9115c James Smart       2016-12-02  1186  
e399441de9115c James Smart       2016-12-02  1187  	lsop = kzalloc((sizeof(*lsop) +
f56bf76f79f3dc James Smart       2020-03-31  1188  			 sizeof(*assoc_rqst) + sizeof(*assoc_acc) +
f56bf76f79f3dc James Smart       2020-03-31  1189  			 ctrl->lport->ops->lsrqst_priv_sz), GFP_KERNEL);
e399441de9115c James Smart       2016-12-02  1190  	if (!lsop) {
f56bf76f79f3dc James Smart       2020-03-31  1191  		dev_info(ctrl->ctrl.device,
f56bf76f79f3dc James Smart       2020-03-31  1192  			"NVME-FC{%d}: send Create Association failed: ENOMEM\n",
f56bf76f79f3dc James Smart       2020-03-31  1193  			ctrl->cnum);
e399441de9115c James Smart       2016-12-02  1194  		ret = -ENOMEM;
e399441de9115c James Smart       2016-12-02  1195  		goto out_no_memory;
e399441de9115c James Smart       2016-12-02  1196  	}
e399441de9115c James Smart       2016-12-02  1197  
f56bf76f79f3dc James Smart       2020-03-31  1198  	assoc_rqst = (struct fcnvme_ls_cr_assoc_rqst *)&lsop[1];
e399441de9115c James Smart       2016-12-02  1199  	assoc_acc = (struct fcnvme_ls_cr_assoc_acc *)&assoc_rqst[1];
f56bf76f79f3dc James Smart       2020-03-31  1200  	lsreq = &lsop->ls_req;
f56bf76f79f3dc James Smart       2020-03-31  1201  	if (ctrl->lport->ops->lsrqst_priv_sz)
f56bf76f79f3dc James Smart       2020-03-31  1202  		lsreq->private = &assoc_acc[1];
f56bf76f79f3dc James Smart       2020-03-31  1203  	else
f56bf76f79f3dc James Smart       2020-03-31  1204  		lsreq->private = NULL;
e399441de9115c James Smart       2016-12-02  1205  
e399441de9115c James Smart       2016-12-02  1206  	assoc_rqst->w0.ls_cmd = FCNVME_LS_CREATE_ASSOCIATION;
e399441de9115c James Smart       2016-12-02  1207  	assoc_rqst->desc_list_len =
e399441de9115c James Smart       2016-12-02  1208  			cpu_to_be32(sizeof(struct fcnvme_lsdesc_cr_assoc_cmd));
e399441de9115c James Smart       2016-12-02  1209  
e399441de9115c James Smart       2016-12-02  1210  	assoc_rqst->assoc_cmd.desc_tag =
e399441de9115c James Smart       2016-12-02  1211  			cpu_to_be32(FCNVME_LSDESC_CREATE_ASSOC_CMD);
e399441de9115c James Smart       2016-12-02  1212  	assoc_rqst->assoc_cmd.desc_len =
e399441de9115c James Smart       2016-12-02  1213  			fcnvme_lsdesc_len(
e399441de9115c James Smart       2016-12-02  1214  				sizeof(struct fcnvme_lsdesc_cr_assoc_cmd));
e399441de9115c James Smart       2016-12-02  1215  
e399441de9115c James Smart       2016-12-02  1216  	assoc_rqst->assoc_cmd.ersp_ratio = cpu_to_be16(ersp_ratio);
d157e5343cb360 James Smart       2018-03-07  1217  	assoc_rqst->assoc_cmd.sqsize = cpu_to_be16(qsize - 1);
e399441de9115c James Smart       2016-12-02  1218  	/* Linux supports only Dynamic controllers */
e399441de9115c James Smart       2016-12-02  1219  	assoc_rqst->assoc_cmd.cntlid = cpu_to_be16(0xffff);
8e41226324e7c0 Christoph Hellwig 2017-05-17  1220  	uuid_copy(&assoc_rqst->assoc_cmd.hostid, &ctrl->ctrl.opts->host->id);
e399441de9115c James Smart       2016-12-02  1221  	strncpy(assoc_rqst->assoc_cmd.hostnqn, ctrl->ctrl.opts->host->nqn,
e399441de9115c James Smart       2016-12-02  1222  		min(FCNVME_ASSOC_HOSTNQN_LEN, NVMF_NQN_SIZE));
e399441de9115c James Smart       2016-12-02  1223  	strncpy(assoc_rqst->assoc_cmd.subnqn, ctrl->ctrl.opts->subsysnqn,
e399441de9115c James Smart       2016-12-02  1224  		min(FCNVME_ASSOC_SUBNQN_LEN, NVMF_NQN_SIZE));
e399441de9115c James Smart       2016-12-02  1225  
e399441de9115c James Smart       2016-12-02  1226  	lsop->queue = queue;
e399441de9115c James Smart       2016-12-02  1227  	lsreq->rqstaddr = assoc_rqst;
e399441de9115c James Smart       2016-12-02 @1228  	lsreq->rqstlen = sizeof(*assoc_rqst);
e399441de9115c James Smart       2016-12-02  1229  	lsreq->rspaddr = assoc_acc;
e399441de9115c James Smart       2016-12-02 @1230  	lsreq->rsplen = sizeof(*assoc_acc);
53b2b2f59967c0 James Smart       2019-09-27  1231  	lsreq->timeout = NVME_FC_LS_TIMEOUT_SEC;
e399441de9115c James Smart       2016-12-02  1232  
c913a8b0d4c564 James Smart       2017-04-11  1233  	ret = nvme_fc_send_ls_req(ctrl->rport, lsop);
e399441de9115c James Smart       2016-12-02  1234  	if (ret)
e399441de9115c James Smart       2016-12-02  1235  		goto out_free_buffer;
e399441de9115c James Smart       2016-12-02  1236  
e399441de9115c James Smart       2016-12-02  1237  	/* process connect LS completion */
e399441de9115c James Smart       2016-12-02  1238  
e399441de9115c James Smart       2016-12-02  1239  	/* validate the ACC response */
e399441de9115c James Smart       2016-12-02  1240  	if (assoc_acc->hdr.w0.ls_cmd != FCNVME_LS_ACC)
e399441de9115c James Smart       2016-12-02  1241  		fcret = VERR_LSACC;
f77fc87c3716f5 James Smart       2017-03-23  1242  	else if (assoc_acc->hdr.desc_list_len !=
e399441de9115c James Smart       2016-12-02  1243  			fcnvme_lsdesc_len(
e399441de9115c James Smart       2016-12-02  1244  				sizeof(struct fcnvme_ls_cr_assoc_acc)))
e399441de9115c James Smart       2016-12-02  1245  		fcret = VERR_CR_ASSOC_ACC_LEN;
f77fc87c3716f5 James Smart       2017-03-23  1246  	else if (assoc_acc->hdr.rqst.desc_tag !=
f77fc87c3716f5 James Smart       2017-03-23  1247  			cpu_to_be32(FCNVME_LSDESC_RQST))
e399441de9115c James Smart       2016-12-02  1248  		fcret = VERR_LSDESC_RQST;
e399441de9115c James Smart       2016-12-02  1249  	else if (assoc_acc->hdr.rqst.desc_len !=
e399441de9115c James Smart       2016-12-02  1250  			fcnvme_lsdesc_len(sizeof(struct fcnvme_lsdesc_rqst)))
e399441de9115c James Smart       2016-12-02  1251  		fcret = VERR_LSDESC_RQST_LEN;
e399441de9115c James Smart       2016-12-02  1252  	else if (assoc_acc->hdr.rqst.w0.ls_cmd != FCNVME_LS_CREATE_ASSOCIATION)
e399441de9115c James Smart       2016-12-02  1253  		fcret = VERR_CR_ASSOC;
e399441de9115c James Smart       2016-12-02  1254  	else if (assoc_acc->associd.desc_tag !=
e399441de9115c James Smart       2016-12-02  1255  			cpu_to_be32(FCNVME_LSDESC_ASSOC_ID))
e399441de9115c James Smart       2016-12-02  1256  		fcret = VERR_ASSOC_ID;
e399441de9115c James Smart       2016-12-02  1257  	else if (assoc_acc->associd.desc_len !=
e399441de9115c James Smart       2016-12-02  1258  			fcnvme_lsdesc_len(
e399441de9115c James Smart       2016-12-02  1259  				sizeof(struct fcnvme_lsdesc_assoc_id)))
e399441de9115c James Smart       2016-12-02  1260  		fcret = VERR_ASSOC_ID_LEN;
e399441de9115c James Smart       2016-12-02  1261  	else if (assoc_acc->connectid.desc_tag !=
e399441de9115c James Smart       2016-12-02  1262  			cpu_to_be32(FCNVME_LSDESC_CONN_ID))
e399441de9115c James Smart       2016-12-02  1263  		fcret = VERR_CONN_ID;
e399441de9115c James Smart       2016-12-02  1264  	else if (assoc_acc->connectid.desc_len !=
e399441de9115c James Smart       2016-12-02  1265  			fcnvme_lsdesc_len(sizeof(struct fcnvme_lsdesc_conn_id)))
e399441de9115c James Smart       2016-12-02  1266  		fcret = VERR_CONN_ID_LEN;
e399441de9115c James Smart       2016-12-02  1267  
e399441de9115c James Smart       2016-12-02  1268  	if (fcret) {
e399441de9115c James Smart       2016-12-02  1269  		ret = -EBADF;
e399441de9115c James Smart       2016-12-02  1270  		dev_err(ctrl->dev,
7db394848ece0e James Smart       2019-09-27  1271  			"q %d Create Association LS failed: %s\n",
e399441de9115c James Smart       2016-12-02  1272  			queue->qnum, validation_errors[fcret]);
e399441de9115c James Smart       2016-12-02  1273  	} else {
14fd1e98afafc0 James Smart       2020-03-31  1274  		spin_lock_irqsave(&ctrl->lock, flags);
e399441de9115c James Smart       2016-12-02  1275  		ctrl->association_id =
e399441de9115c James Smart       2016-12-02  1276  			be64_to_cpu(assoc_acc->associd.association_id);
e399441de9115c James Smart       2016-12-02  1277  		queue->connection_id =
e399441de9115c James Smart       2016-12-02  1278  			be64_to_cpu(assoc_acc->connectid.connection_id);
e399441de9115c James Smart       2016-12-02  1279  		set_bit(NVME_FC_Q_CONNECTED, &queue->flags);
14fd1e98afafc0 James Smart       2020-03-31  1280  		spin_unlock_irqrestore(&ctrl->lock, flags);
e399441de9115c James Smart       2016-12-02  1281  	}
e399441de9115c James Smart       2016-12-02  1282  
e399441de9115c James Smart       2016-12-02  1283  out_free_buffer:
e399441de9115c James Smart       2016-12-02  1284  	kfree(lsop);
e399441de9115c James Smart       2016-12-02  1285  out_no_memory:
e399441de9115c James Smart       2016-12-02  1286  	if (ret)
e399441de9115c James Smart       2016-12-02  1287  		dev_err(ctrl->dev,
e399441de9115c James Smart       2016-12-02  1288  			"queue %d connect admin queue failed (%d).\n",
e399441de9115c James Smart       2016-12-02  1289  			queue->qnum, ret);
e399441de9115c James Smart       2016-12-02  1290  	return ret;
e399441de9115c James Smart       2016-12-02  1291  }
e399441de9115c James Smart       2016-12-02  1292  

:::::: The code at line 1228 was first introduced by commit
:::::: e399441de9115cd472b8ace6c517708273ca7997 nvme-fabrics: Add host support for FC transport

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Sagi Grimberg <sagi@grimberg.me>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
