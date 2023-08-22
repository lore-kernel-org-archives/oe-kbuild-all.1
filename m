Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0899B20183
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 22:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692742582; x=1724278582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HL9wUfiXCVcRWuFvjKYoXAB5T24cJeGZu2bbgqDol2g=;
  b=awK6IzHMAR9ALKXvOKV+FEPsZcvaO7h1x2uUR4AFYsnfiLDI065VsTM0
   Ex+8PX8r4v9Ao02/dbukO/m1v7haKEizg7kdWam/0YJ8/t3g5NXOFyxwQ
   Gd8mALVveNpWDko3GQkHoV3PhWhn1F/ffKpAb/n3OFVQzN6xC4cBvMua9
   lbGLnJeuncfXfS8CWQapGpq5sByPeU/9VjHrgmrHCZ+LJ/xTsp20hn5L0
   Ysl2B3GnMiJsSoJmSZ8sODgkv9UoiXsxvdyVw4fItOimxDxn7KF0TC1WH
   1MEqIiuScb0iNyqSTiH7w/uOZjTYv40/GnUBtn3yPx2BPUNDrW1cmahP+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460370788"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="460370788"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 15:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="736395725"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="736395725"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Aug 2023 15:16:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYZfd-0000ZO-1z;
	Tue, 22 Aug 2023 22:16:17 +0000
Date: Wed, 23 Aug 2023 06:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [mkp-scsi:for-next 113/134] drivers/nvme/target/fc.c:372:41: sparse:
 sparse: restricted __le32 degrades to integer
Message-ID: <202308230637.iOlZTt2m-lkp@intel.com>
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
config: i386-randconfig-061-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230637.iOlZTt2m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230637.iOlZTt2m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230637.iOlZTt2m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/fc.c:372:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:372:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:398:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:398:57: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:404:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:428:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:428:58: sparse: sparse: restricted __le32 degrades to integer
>> drivers/nvme/target/fc.c:1699:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1699:36: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1699:36: sparse:     got int
>> drivers/nvme/target/fc.c:1716:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned int @@
   drivers/nvme/target/fc.c:1716:28: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1716:28: sparse:     got unsigned int
   drivers/nvme/target/fc.c:1792:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1792:36: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1792:36: sparse:     got int
   drivers/nvme/target/fc.c:1807:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned int @@
   drivers/nvme/target/fc.c:1807:28: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1807:28: sparse:     got unsigned int
   drivers/nvme/target/fc.c:1854:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1854:36: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1854:36: sparse:     got int
   drivers/nvme/target/fc.c:1865:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned int @@
   drivers/nvme/target/fc.c:1865:28: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1865:28: sparse:     got unsigned int
   drivers/nvme/target/fc.c:1897:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1897:38: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1897:38: sparse:     got int
   drivers/nvme/target/fc.c:1981:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1981:36: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1981:36: sparse:     got int
   drivers/nvme/target/fc.c: note: in included file:
>> drivers/nvme/target/../host/fc.h:168:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rqstlen @@     got unsigned int @@
   drivers/nvme/target/../host/fc.h:168:24: sparse:     expected restricted __le32 [usertype] rqstlen
   drivers/nvme/target/../host/fc.h:168:24: sparse:     got unsigned int
>> drivers/nvme/target/../host/fc.h:170:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned int @@
   drivers/nvme/target/../host/fc.h:170:23: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/../host/fc.h:170:23: sparse:     got unsigned int

vim +372 drivers/nvme/target/fc.c

47bf3241064498 James Smart 2020-03-31  349  
47bf3241064498 James Smart 2020-03-31  350  
47bf3241064498 James Smart 2020-03-31  351  static void
47bf3241064498 James Smart 2020-03-31  352  __nvmet_fc_finish_ls_req(struct nvmet_fc_ls_req_op *lsop)
47bf3241064498 James Smart 2020-03-31  353  {
47bf3241064498 James Smart 2020-03-31  354  	struct nvmet_fc_tgtport *tgtport = lsop->tgtport;
47bf3241064498 James Smart 2020-03-31  355  	struct nvmefc_ls_req *lsreq = &lsop->ls_req;
47bf3241064498 James Smart 2020-03-31  356  	unsigned long flags;
47bf3241064498 James Smart 2020-03-31  357  
47bf3241064498 James Smart 2020-03-31  358  	spin_lock_irqsave(&tgtport->lock, flags);
47bf3241064498 James Smart 2020-03-31  359  
47bf3241064498 James Smart 2020-03-31  360  	if (!lsop->req_queued) {
47bf3241064498 James Smart 2020-03-31  361  		spin_unlock_irqrestore(&tgtport->lock, flags);
47bf3241064498 James Smart 2020-03-31  362  		return;
47bf3241064498 James Smart 2020-03-31  363  	}
47bf3241064498 James Smart 2020-03-31  364  
47bf3241064498 James Smart 2020-03-31  365  	list_del(&lsop->lsreq_list);
47bf3241064498 James Smart 2020-03-31  366  
47bf3241064498 James Smart 2020-03-31  367  	lsop->req_queued = false;
47bf3241064498 James Smart 2020-03-31  368  
47bf3241064498 James Smart 2020-03-31  369  	spin_unlock_irqrestore(&tgtport->lock, flags);
47bf3241064498 James Smart 2020-03-31  370  
47bf3241064498 James Smart 2020-03-31  371  	fc_dma_unmap_single(tgtport->dev, lsreq->rqstdma,
47bf3241064498 James Smart 2020-03-31 @372  				  (lsreq->rqstlen + lsreq->rsplen),
47bf3241064498 James Smart 2020-03-31  373  				  DMA_BIDIRECTIONAL);
47bf3241064498 James Smart 2020-03-31  374  
47bf3241064498 James Smart 2020-03-31  375  	nvmet_fc_tgtport_put(tgtport);
47bf3241064498 James Smart 2020-03-31  376  }
47bf3241064498 James Smart 2020-03-31  377  

:::::: The code at line 372 was first introduced by commit
:::::: 47bf3241064498878ffed10a69131be9154201eb nvmet-fc: Add Disconnect Association Xmt support

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
