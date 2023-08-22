Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F92018C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 21:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692740051; x=1724276051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Ei1AUufd35oDJtoE74PvlWtZSBcg9fzikapmzyWaaE=;
  b=gHFlBnBL2uJP4U2CCD+w0koFlVGA/9kYh2cG8K+qvYKOP74iuqFMAXTt
   XoRbnhHXsCdRCNTC9n1sZ7GJvDyAcS8Kn1qi+AbzMcCR7zHYGIutktB9m
   Y44iKde7VmxoNxRiytiIf1VqVfkNG8SK04OkCuedNkRVP2E6AFr59ZTFm
   SnzuPRysxNYsH4tbtZIBsend1veWOzH78PI14wp7OlV1ZruLoRYebAQeu
   ieK14Y0tL9R1nk15dXv8XRhQJyLu55ACroJ9L2qMs1AHZ5z8hB7Bqjeop
   M0EBLc2yHTNbMwfSmHWB2p/fkbEPsJrFbnre8t+HKUDxEbTQSA+yd6lfg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="437932837"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="437932837"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 14:34:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765897406"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="765897406"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 14:34:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYZ0o-0000Xg-1V;
	Tue, 22 Aug 2023 21:34:06 +0000
Date: Wed, 23 Aug 2023 05:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [mkp-scsi:for-next 113/134] drivers/nvme/host/fc.c:1690:45: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202308230551.gT83K2ih-lkp@intel.com>
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
config: loongarch-randconfig-r132-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230551.gT83K2ih-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230551.gT83K2ih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230551.gT83K2ih-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/fc.c:1690:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1690:45: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1690:45: sparse:     got int
>> drivers/nvme/host/fc.c:1058:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1058:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1086:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1086:57: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1092:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1116:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/host/fc.c:1116:58: sparse: sparse: restricted __le32 degrades to integer
>> drivers/nvme/host/fc.c:1228:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rqstlen @@     got unsigned long @@
   drivers/nvme/host/fc.c:1228:24: sparse:     expected restricted __le32 [usertype] rqstlen
   drivers/nvme/host/fc.c:1228:24: sparse:     got unsigned long
>> drivers/nvme/host/fc.c:1230:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned long @@
   drivers/nvme/host/fc.c:1230:23: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1230:23: sparse:     got unsigned long
   drivers/nvme/host/fc.c:1343:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rqstlen @@     got unsigned long @@
   drivers/nvme/host/fc.c:1343:24: sparse:     expected restricted __le32 [usertype] rqstlen
   drivers/nvme/host/fc.c:1343:24: sparse:     got unsigned long
   drivers/nvme/host/fc.c:1345:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned long @@
   drivers/nvme/host/fc.c:1345:23: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1345:23: sparse:     got unsigned long
   drivers/nvme/host/fc.c:1544:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1544:38: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1544:38: sparse:     got int
   drivers/nvme/host/fc.c:1585:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/host/fc.c:1585:37: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1585:37: sparse:     got int
   drivers/nvme/host/fc.c:1596:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned long @@
   drivers/nvme/host/fc.c:1596:29: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.c:1596:29: sparse:     got unsigned long
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
>> drivers/nvme/host/fc.h:168:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rqstlen @@     got unsigned long @@
   drivers/nvme/host/fc.h:168:24: sparse:     expected restricted __le32 [usertype] rqstlen
   drivers/nvme/host/fc.h:168:24: sparse:     got unsigned long
>> drivers/nvme/host/fc.h:170:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned long @@
   drivers/nvme/host/fc.h:170:23: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/host/fc.h:170:23: sparse:     got unsigned long

vim +1690 drivers/nvme/host/fc.c

14fd1e98afafc0 James Smart 2020-03-31  1665  
14fd1e98afafc0 James Smart 2020-03-31  1666  static void
14fd1e98afafc0 James Smart 2020-03-31  1667  nvme_fc_handle_ls_rqst_work(struct work_struct *work)
14fd1e98afafc0 James Smart 2020-03-31  1668  {
14fd1e98afafc0 James Smart 2020-03-31  1669  	struct nvme_fc_rport *rport =
14fd1e98afafc0 James Smart 2020-03-31  1670  		container_of(work, struct nvme_fc_rport, lsrcv_work);
14fd1e98afafc0 James Smart 2020-03-31  1671  	struct fcnvme_ls_rqst_w0 *w0;
14fd1e98afafc0 James Smart 2020-03-31  1672  	struct nvmefc_ls_rcv_op *lsop;
14fd1e98afafc0 James Smart 2020-03-31  1673  	unsigned long flags;
14fd1e98afafc0 James Smart 2020-03-31  1674  	bool sendrsp;
14fd1e98afafc0 James Smart 2020-03-31  1675  
14fd1e98afafc0 James Smart 2020-03-31  1676  restart:
14fd1e98afafc0 James Smart 2020-03-31  1677  	sendrsp = true;
14fd1e98afafc0 James Smart 2020-03-31  1678  	spin_lock_irqsave(&rport->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1679  	list_for_each_entry(lsop, &rport->ls_rcv_list, lsrcv_list) {
14fd1e98afafc0 James Smart 2020-03-31  1680  		if (lsop->handled)
14fd1e98afafc0 James Smart 2020-03-31  1681  			continue;
14fd1e98afafc0 James Smart 2020-03-31  1682  
14fd1e98afafc0 James Smart 2020-03-31  1683  		lsop->handled = true;
14fd1e98afafc0 James Smart 2020-03-31  1684  		if (rport->remoteport.port_state == FC_OBJSTATE_ONLINE) {
14fd1e98afafc0 James Smart 2020-03-31  1685  			spin_unlock_irqrestore(&rport->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1686  			sendrsp = nvme_fc_handle_ls_rqst(lsop);
14fd1e98afafc0 James Smart 2020-03-31  1687  		} else {
14fd1e98afafc0 James Smart 2020-03-31  1688  			spin_unlock_irqrestore(&rport->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1689  			w0 = &lsop->rqstbuf->w0;
14fd1e98afafc0 James Smart 2020-03-31 @1690  			lsop->lsrsp->rsplen = nvme_fc_format_rjt(
14fd1e98afafc0 James Smart 2020-03-31  1691  						lsop->rspbuf,
14fd1e98afafc0 James Smart 2020-03-31  1692  						sizeof(*lsop->rspbuf),
14fd1e98afafc0 James Smart 2020-03-31  1693  						w0->ls_cmd,
14fd1e98afafc0 James Smart 2020-03-31  1694  						FCNVME_RJT_RC_UNAB,
14fd1e98afafc0 James Smart 2020-03-31  1695  						FCNVME_RJT_EXP_NONE, 0);
14fd1e98afafc0 James Smart 2020-03-31  1696  		}
14fd1e98afafc0 James Smart 2020-03-31  1697  		if (sendrsp)
14fd1e98afafc0 James Smart 2020-03-31  1698  			nvme_fc_xmt_ls_rsp(lsop);
14fd1e98afafc0 James Smart 2020-03-31  1699  		goto restart;
14fd1e98afafc0 James Smart 2020-03-31  1700  	}
14fd1e98afafc0 James Smart 2020-03-31  1701  	spin_unlock_irqrestore(&rport->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1702  }
14fd1e98afafc0 James Smart 2020-03-31  1703  

:::::: The code at line 1690 was first introduced by commit
:::::: 14fd1e98afafc0027a6a86ea1962e31dceafb400 nvme-fc: Add Disconnect Association Rcv support

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
