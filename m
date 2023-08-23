Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074219A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 00:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692750417; x=1724286417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQr76aLG8X/2Z+z7GoZUJfxrtKQq2rSp7F/UZE/PUaI=;
  b=NjahSoHvZ0MaC+mQDbKBSxE4a8W+XPdu3LfvG13hVNwhEYIaTjCRBFt+
   7cOD+FiBXZior2N7OHu2Vm6sqooMpvf7x97cRZu4SeEIJxPWxeKcYNLRv
   0eBVhRRWKoyX+4RSUpvocz5c1O8MGy/ACpKmB5Gg93qa8hPDh1UwKXbfQ
   lXBpPreLf3A2LizfOjd4rFHAvQem3HQCS6OiBa40TeeOrNMAp6BP4FSS+
   DM05W3xr1FwlD7751431R2WKb5VGWod+G/zZrtC9M0pYbKhhiE/aZkjCM
   5fyZ7XDo66u1zoo9lg72wgV/lj0U4WKVvmYcoplP7yC3A7tO2JtwJ7NC4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="374003851"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="374003851"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 17:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="1067256438"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="1067256438"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2023 17:26:52 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYbhz-0000eK-18;
	Wed, 23 Aug 2023 00:26:51 +0000
Date: Wed, 23 Aug 2023 08:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [mkp-scsi:for-next 113/134] drivers/nvme/target/fcloop.c:370:57:
 sparse: sparse: incorrect type in argument 5 (different base types)
Message-ID: <202308230829.Jhw2Evvw-lkp@intel.com>
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
config: mips-randconfig-r131-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230829.Jhw2Evvw-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230829.Jhw2Evvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230829.Jhw2Evvw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/fcloop.c:370:57: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] lsreqbuf_len @@     got restricted __le32 [usertype] rqstlen @@
   drivers/nvme/target/fcloop.c:370:57: sparse:     expected unsigned int [usertype] lsreqbuf_len
   drivers/nvme/target/fcloop.c:370:57: sparse:     got restricted __le32 [usertype] rqstlen
>> drivers/nvme/target/fcloop.c:386:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fcloop.c:386:40: sparse: sparse: restricted __le32 degrades to integer
>> drivers/nvme/target/fcloop.c:386:50: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] __n @@     got restricted __le32 @@
   drivers/nvme/target/fcloop.c:386:50: sparse:     expected unsigned int [usertype] __n
   drivers/nvme/target/fcloop.c:386:50: sparse:     got restricted __le32
   drivers/nvme/target/fcloop.c:457:56: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int [usertype] lsreqbuf_len @@     got restricted __le32 [usertype] rqstlen @@
   drivers/nvme/target/fcloop.c:457:56: sparse:     expected unsigned int [usertype] lsreqbuf_len
   drivers/nvme/target/fcloop.c:457:56: sparse:     got restricted __le32 [usertype] rqstlen
   drivers/nvme/target/fcloop.c:474:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fcloop.c:474:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/nvme/target/fcloop.c:474:50: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] __n @@     got restricted __le32 @@
   drivers/nvme/target/fcloop.c:474:50: sparse:     expected unsigned int [usertype] __n
   drivers/nvme/target/fcloop.c:474:50: sparse:     got restricted __le32

vim +370 drivers/nvme/target/fcloop.c

475d0fe795516a James Smart   2016-12-02  345  
475d0fe795516a James Smart   2016-12-02  346  static int
ea39765843faf5 James Smart   2020-03-31  347  fcloop_h2t_ls_req(struct nvme_fc_local_port *localport,
475d0fe795516a James Smart   2016-12-02  348  			struct nvme_fc_remote_port *remoteport,
475d0fe795516a James Smart   2016-12-02  349  			struct nvmefc_ls_req *lsreq)
475d0fe795516a James Smart   2016-12-02  350  {
475d0fe795516a James Smart   2016-12-02  351  	struct fcloop_lsreq *tls_req = lsreq->private;
475d0fe795516a James Smart   2016-12-02  352  	struct fcloop_rport *rport = remoteport->private;
475d0fe795516a James Smart   2016-12-02  353  	int ret = 0;
475d0fe795516a James Smart   2016-12-02  354  
475d0fe795516a James Smart   2016-12-02  355  	tls_req->lsreq = lsreq;
38803fcffb5baf James Smart   2020-03-18  356  	INIT_LIST_HEAD(&tls_req->ls_list);
475d0fe795516a James Smart   2016-12-02  357  
475d0fe795516a James Smart   2016-12-02  358  	if (!rport->targetport) {
475d0fe795516a James Smart   2016-12-02  359  		tls_req->status = -ECONNREFUSED;
38803fcffb5baf James Smart   2020-03-18  360  		spin_lock(&rport->lock);
38803fcffb5baf James Smart   2020-03-18  361  		list_add_tail(&rport->ls_list, &tls_req->ls_list);
38803fcffb5baf James Smart   2020-03-18  362  		spin_unlock(&rport->lock);
8832cf922151e9 Sagi Grimberg 2022-03-21  363  		queue_work(nvmet_wq, &rport->ls_work);
475d0fe795516a James Smart   2016-12-02  364  		return ret;
475d0fe795516a James Smart   2016-12-02  365  	}
475d0fe795516a James Smart   2016-12-02  366  
475d0fe795516a James Smart   2016-12-02  367  	tls_req->status = 0;
437c0b824dbd05 James Smart   2020-03-31  368  	ret = nvmet_fc_rcv_ls_req(rport->targetport, rport,
437c0b824dbd05 James Smart   2020-03-31  369  				  &tls_req->ls_rsp,
475d0fe795516a James Smart   2016-12-02 @370  				  lsreq->rqstaddr, lsreq->rqstlen);
475d0fe795516a James Smart   2016-12-02  371  
475d0fe795516a James Smart   2016-12-02  372  	return ret;
475d0fe795516a James Smart   2016-12-02  373  }
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
72e6329f86c714 James Smart   2020-03-31  385  	memcpy(lsreq->rspaddr, lsrsp->rspbuf,
72e6329f86c714 James Smart   2020-03-31 @386  		((lsreq->rsplen < lsrsp->rsplen) ?
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

:::::: The code at line 370 was first introduced by commit
:::::: 475d0fe795516a9b9f286a851c3972fd8831c643 nvme-fabrics: Add FC LLDD loopback driver to test FC-NVME

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
