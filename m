Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4648815BC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 02:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692758763; x=1724294763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iBxRQlvvQyQereA07kOa8tUnhA3mq2NgUhVuGYRGmAk=;
  b=mq2V/jIxLYd1iNDJ7O5I1JfYqFmfpQPnQ+77FeHjNQdUdt289fB7g3jg
   PknRvRZ5vok0T5YZlkGdyRP/RMugPSrAI50mJ8l2TYptt037Ux7+XOpNV
   Nt2vJwtRP0OctGhI8GhpJ0BKDk6QBa5qZgwchkgjhYLdFF0pWlpFb9lLM
   tyHu2pv2GDgc5l6aKZxF8IqRE4zGzmt68RKzsih/xYLClbmE36q0Pg8Gs
   nDZ9OUJPAd+M/E0j1Np18fiwEh9DNiN5PVZtiE5HRbldJpJY1O3mVdWyx
   BZt0NCtdx7LI1MnRK+0l1zu9uBhMwbz6WvFKRv836eBJd82bf6G0MLQJi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359032973"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="359032973"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 19:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="910334528"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="910334528"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 19:45:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYdsc-0000mI-1f;
	Wed, 23 Aug 2023 02:45:58 +0000
Date: Wed, 23 Aug 2023 10:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [mkp-scsi:for-next 113/134] drivers/nvme/target/fcloop.c:385:9:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202308231059.Lux2gyKy-lkp@intel.com>
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
config: sparc64-randconfig-r131-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231059.Lux2gyKy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231059.Lux2gyKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231059.Lux2gyKy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/nvme/target/fcloop.c:370:57: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] lsreqbuf_len @@     got restricted __le32 [usertype] rqstlen @@
   drivers/nvme/target/fcloop.c:370:57: sparse:     expected unsigned int [usertype] lsreqbuf_len
   drivers/nvme/target/fcloop.c:370:57: sparse:     got restricted __le32 [usertype] rqstlen
   drivers/nvme/target/fcloop.c:385:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fcloop.c:385:9: sparse: sparse: restricted __le32 degrades to integer
>> drivers/nvme/target/fcloop.c:385:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long @@     got restricted __le32 @@
   drivers/nvme/target/fcloop.c:385:9: sparse:     expected unsigned long
   drivers/nvme/target/fcloop.c:385:9: sparse:     got restricted __le32
   drivers/nvme/target/fcloop.c:457:56: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int [usertype] lsreqbuf_len @@     got restricted __le32 [usertype] rqstlen @@
   drivers/nvme/target/fcloop.c:457:56: sparse:     expected unsigned int [usertype] lsreqbuf_len
   drivers/nvme/target/fcloop.c:457:56: sparse:     got restricted __le32 [usertype] rqstlen
   drivers/nvme/target/fcloop.c:473:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fcloop.c:473:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fcloop.c:473:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long @@     got restricted __le32 @@
   drivers/nvme/target/fcloop.c:473:9: sparse:     expected unsigned long
   drivers/nvme/target/fcloop.c:473:9: sparse:     got restricted __le32
--
   drivers/nvme/target/fc.c:372:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:372:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:398:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:398:57: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:404:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:428:41: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:428:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fc.c:1699:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1699:36: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1699:36: sparse:     got int
>> drivers/nvme/target/fc.c:1716:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned long @@
   drivers/nvme/target/fc.c:1716:28: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1716:28: sparse:     got unsigned long
   drivers/nvme/target/fc.c:1792:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1792:36: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1792:36: sparse:     got int
   drivers/nvme/target/fc.c:1807:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned long @@
   drivers/nvme/target/fc.c:1807:28: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1807:28: sparse:     got unsigned long
   drivers/nvme/target/fc.c:1854:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1854:36: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1854:36: sparse:     got int
   drivers/nvme/target/fc.c:1865:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned long @@
   drivers/nvme/target/fc.c:1865:28: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1865:28: sparse:     got unsigned long
   drivers/nvme/target/fc.c:1897:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1897:38: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1897:38: sparse:     got int
   drivers/nvme/target/fc.c:1981:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got int @@
   drivers/nvme/target/fc.c:1981:36: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/fc.c:1981:36: sparse:     got int
   drivers/nvme/target/fc.c: note: in included file:
>> drivers/nvme/target/../host/fc.h:168:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rqstlen @@     got unsigned long @@
   drivers/nvme/target/../host/fc.h:168:24: sparse:     expected restricted __le32 [usertype] rqstlen
   drivers/nvme/target/../host/fc.h:168:24: sparse:     got unsigned long
>> drivers/nvme/target/../host/fc.h:170:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rsplen @@     got unsigned long @@
   drivers/nvme/target/../host/fc.h:170:23: sparse:     expected restricted __le32 [usertype] rsplen
   drivers/nvme/target/../host/fc.h:170:23: sparse:     got unsigned long

vim +385 drivers/nvme/target/fcloop.c

475d0fe795516a James Smart   2016-12-02  374  
475d0fe795516a James Smart   2016-12-02  375  static int
ea39765843faf5 James Smart   2020-03-31  376  fcloop_h2t_xmt_ls_rsp(struct nvmet_fc_target_port *targetport,
72e6329f86c714 James Smart   2020-03-31  377  			struct nvmefc_ls_rsp *lsrsp)
475d0fe795516a James Smart   2016-12-02  378  {
72e6329f86c714 James Smart   2020-03-31  379  	struct fcloop_lsreq *tls_req = ls_rsp_to_lsreq(lsrsp);
475d0fe795516a James Smart   2016-12-02  380  	struct nvmefc_ls_req *lsreq = tls_req->lsreq;
38803fcffb5baf James Smart   2020-03-18  381  	struct fcloop_tport *tport = targetport->private;
38803fcffb5baf James Smart   2020-03-18  382  	struct nvme_fc_remote_port *remoteport = tport->remoteport;
38803fcffb5baf James Smart   2020-03-18  383  	struct fcloop_rport *rport;
475d0fe795516a James Smart   2016-12-02  384  
72e6329f86c714 James Smart   2020-03-31 @385  	memcpy(lsreq->rspaddr, lsrsp->rspbuf,
72e6329f86c714 James Smart   2020-03-31  386  		((lsreq->rsplen < lsrsp->rsplen) ?
72e6329f86c714 James Smart   2020-03-31  387  				lsreq->rsplen : lsrsp->rsplen));
38803fcffb5baf James Smart   2020-03-18  388  
72e6329f86c714 James Smart   2020-03-31  389  	lsrsp->done(lsrsp);
475d0fe795516a James Smart   2016-12-02  390  
38803fcffb5baf James Smart   2020-03-18  391  	if (remoteport) {
38803fcffb5baf James Smart   2020-03-18  392  		rport = remoteport->private;
38803fcffb5baf James Smart   2020-03-18  393  		spin_lock(&rport->lock);
38803fcffb5baf James Smart   2020-03-18  394  		list_add_tail(&rport->ls_list, &tls_req->ls_list);
38803fcffb5baf James Smart   2020-03-18  395  		spin_unlock(&rport->lock);
8832cf922151e9 Sagi Grimberg 2022-03-21  396  		queue_work(nvmet_wq, &rport->ls_work);
38803fcffb5baf James Smart   2020-03-18  397  	}
475d0fe795516a James Smart   2016-12-02  398  
475d0fe795516a James Smart   2016-12-02  399  	return 0;
475d0fe795516a James Smart   2016-12-02  400  }
475d0fe795516a James Smart   2016-12-02  401  

:::::: The code at line 385 was first introduced by commit
:::::: 72e6329f86c714785ac195d293cb19dd24507880 nvme-fc and nvmet-fc: revise LLDD api for LS reception and LS request

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
