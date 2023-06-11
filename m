Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F322610E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 00:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686443597; x=1717979597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQJ1l7zKS7MNqxChfHiWlYVwWLlU2b5/RH3dUIsUdMA=;
  b=XoiVqqXg/8dZFviIa3P6v/p0sf5bMkEBXiy5BiTpbY4Jo4+UNJaJ0Zvz
   JC6awt1wXOsi0cyaK7z/ixezYlUzd3iNTZ1oOv3v77GOorodpuDgGNys2
   viuUBZFFbdddb9lIWlmNfWfY294qQjxX9xiflRdPOcCC1tofrKhsdrVWc
   JMwrguUYXrlVrU+w587d4NQESc0aIWQvV5wsS7ps4fvHJ3jqyr1TZ1inH
   M5m0nqSsVw+FzAb4KojSvWLZd/Ay0J/yZBUKt1Q4zgi8xoCXwnMgP0wIe
   PyYNfYk4PlTsLyYSStBvKNBRLoXVKc5oj5eZmV+7n5Mt02Z8wuOFJjl7Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="444185923"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="444185923"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 17:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="855147757"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="855147757"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2023 17:33:15 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8918-000AWI-1p;
	Sun, 11 Jun 2023 00:33:14 +0000
Date: Sun, 11 Jun 2023 08:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Tee <justin.tee@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [linux-next:master 5479/8413] drivers/scsi/lpfc/lpfc_bsg.c:918:13:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202306110819.sDIKiGgg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   53ab6975c12d1ad86c599a8927e8c698b144d669
commit: 6e8a669e61af80d69d5ee16e0ddf3160178a63bc [5479/8413] scsi: lpfc: Fix incorrect big endian type assignments in FDMI and VMID paths
config: arm64-randconfig-s032-20230611 (https://download.01.org/0day-ci/archive/20230611/202306110819.sDIKiGgg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6e8a669e61af80d69d5ee16e0ddf3160178a63bc
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6e8a669e61af80d69d5ee16e0ddf3160178a63bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/scsi/lpfc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110819.sDIKiGgg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/lpfc/lpfc_bsg.c:195:32: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:196:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:201:30: sparse: sparse: cast to restricted __le32
>> drivers/scsi/lpfc/lpfc_bsg.c:918:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cmd @@     got restricted __be16 [usertype] CmdRsp @@
   drivers/scsi/lpfc/lpfc_bsg.c:918:13: sparse:     expected unsigned int [usertype] cmd
   drivers/scsi/lpfc/lpfc_bsg.c:918:13: sparse:     got restricted __be16 [usertype] CmdRsp
   drivers/scsi/lpfc/lpfc_bsg.c:2626:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2629:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2633:38: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2850:32: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2851:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2853:30: sparse: sparse: cast to restricted __le32
>> drivers/scsi/lpfc/lpfc_bsg.c:3189:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] CmdRsp @@     got int @@
   drivers/scsi/lpfc/lpfc_bsg.c:3189:60: sparse:     expected restricted __be16 [usertype] CmdRsp
   drivers/scsi/lpfc/lpfc_bsg.c:3189:60: sparse:     got int
>> drivers/scsi/lpfc/lpfc_bsg.c:3190:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] Size @@     got unsigned int [assigned] [usertype] size @@
   drivers/scsi/lpfc/lpfc_bsg.c:3190:60: sparse:     expected restricted __be16 [usertype] Size
   drivers/scsi/lpfc/lpfc_bsg.c:3190:60: sparse:     got unsigned int [assigned] [usertype] size
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32

vim +918 drivers/scsi/lpfc/lpfc_bsg.c

f1c3b0fcbb8104 James Smart        2009-07-19   880  
ea085dab6b9f22 Lee Jones          2020-11-02   881  /*
f1c3b0fcbb8104 James Smart        2009-07-19   882   * lpfc_bsg_ct_unsol_event - process an unsolicited CT command
f1c3b0fcbb8104 James Smart        2009-07-19   883   *
f1c3b0fcbb8104 James Smart        2009-07-19   884   * This function is called when an unsolicited CT command is received.  It
4cc0e56e977f12 James Smart        2010-01-26   885   * forwards the event to any processes registered to receive CT events.
3b5dd52aaffd29 James Smart        2010-01-26   886   **/
4fede78f755247 James Smart        2010-01-26   887  int
f1c3b0fcbb8104 James Smart        2009-07-19   888  lpfc_bsg_ct_unsol_event(struct lpfc_hba *phba, struct lpfc_sli_ring *pring,
f1c3b0fcbb8104 James Smart        2009-07-19   889  			struct lpfc_iocbq *piocbq)
f1c3b0fcbb8104 James Smart        2009-07-19   890  {
f1c3b0fcbb8104 James Smart        2009-07-19   891  	uint32_t evt_req_id = 0;
f1c3b0fcbb8104 James Smart        2009-07-19   892  	uint32_t cmd;
f1c3b0fcbb8104 James Smart        2009-07-19   893  	struct lpfc_dmabuf *dmabuf = NULL;
4cc0e56e977f12 James Smart        2010-01-26   894  	struct lpfc_bsg_event *evt;
f1c3b0fcbb8104 James Smart        2009-07-19   895  	struct event_data *evt_dat = NULL;
f1c3b0fcbb8104 James Smart        2009-07-19   896  	struct lpfc_iocbq *iocbq;
61910d6a524308 James Smart        2022-02-24   897  	IOCB_t *iocb = NULL;
f1c3b0fcbb8104 James Smart        2009-07-19   898  	size_t offset = 0;
f1c3b0fcbb8104 James Smart        2009-07-19   899  	struct list_head head;
f1c3b0fcbb8104 James Smart        2009-07-19   900  	struct ulp_bde64 *bde;
f1c3b0fcbb8104 James Smart        2009-07-19   901  	dma_addr_t dma_addr;
f1c3b0fcbb8104 James Smart        2009-07-19   902  	int i;
d51cf5bd926c7d James Smart        2022-04-12   903  	struct lpfc_dmabuf *bdeBuf1 = piocbq->cmd_dmabuf;
d51cf5bd926c7d James Smart        2022-04-12   904  	struct lpfc_dmabuf *bdeBuf2 = piocbq->bpl_dmabuf;
f1c3b0fcbb8104 James Smart        2009-07-19   905  	struct lpfc_sli_ct_request *ct_req;
75cc8cfc6e13d4 Johannes Thumshirn 2016-11-17   906  	struct bsg_job *job = NULL;
01e0e15c8b3b32 Johannes Thumshirn 2016-11-17   907  	struct fc_bsg_reply *bsg_reply;
a33c4f7bff84c3 James Smart        2013-03-01   908  	struct bsg_job_data *dd_data = NULL;
4fede78f755247 James Smart        2010-01-26   909  	unsigned long flags;
4cc0e56e977f12 James Smart        2010-01-26   910  	int size = 0;
61910d6a524308 James Smart        2022-02-24   911  	u32 bde_count = 0;
f1c3b0fcbb8104 James Smart        2009-07-19   912  
f1c3b0fcbb8104 James Smart        2009-07-19   913  	INIT_LIST_HEAD(&head);
f1c3b0fcbb8104 James Smart        2009-07-19   914  	list_add_tail(&head, &piocbq->list);
f1c3b0fcbb8104 James Smart        2009-07-19   915  
83adbba746d1c8 James Smart        2021-04-21   916  	ct_req = (struct lpfc_sli_ct_request *)bdeBuf1->virt;
f1c3b0fcbb8104 James Smart        2009-07-19   917  	evt_req_id = ct_req->FsType;
f1c3b0fcbb8104 James Smart        2009-07-19  @918  	cmd = ct_req->CommandResponse.bits.CmdRsp;
f1c3b0fcbb8104 James Smart        2009-07-19   919  
4fede78f755247 James Smart        2010-01-26   920  	spin_lock_irqsave(&phba->ct_ev_lock, flags);
f1c3b0fcbb8104 James Smart        2009-07-19   921  	list_for_each_entry(evt, &phba->ct_ev_waiters, node) {
4cc0e56e977f12 James Smart        2010-01-26   922  		if (!(evt->type_mask & FC_REG_CT_EVENT) ||
4cc0e56e977f12 James Smart        2010-01-26   923  			evt->req_id != evt_req_id)
f1c3b0fcbb8104 James Smart        2009-07-19   924  			continue;
f1c3b0fcbb8104 James Smart        2009-07-19   925  
4cc0e56e977f12 James Smart        2010-01-26   926  		lpfc_bsg_event_ref(evt);
4cc0e56e977f12 James Smart        2010-01-26   927  		spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
f1c3b0fcbb8104 James Smart        2009-07-19   928  		evt_dat = kzalloc(sizeof(*evt_dat), GFP_KERNEL);
4cc0e56e977f12 James Smart        2010-01-26   929  		if (evt_dat == NULL) {
4cc0e56e977f12 James Smart        2010-01-26   930  			spin_lock_irqsave(&phba->ct_ev_lock, flags);
4cc0e56e977f12 James Smart        2010-01-26   931  			lpfc_bsg_event_unref(evt);
f1c3b0fcbb8104 James Smart        2009-07-19   932  			lpfc_printf_log(phba, KERN_WARNING, LOG_LIBDFC,
f1c3b0fcbb8104 James Smart        2009-07-19   933  					"2614 Memory allocation failed for "
f1c3b0fcbb8104 James Smart        2009-07-19   934  					"CT event\n");
f1c3b0fcbb8104 James Smart        2009-07-19   935  			break;
f1c3b0fcbb8104 James Smart        2009-07-19   936  		}
f1c3b0fcbb8104 James Smart        2009-07-19   937  
f1c3b0fcbb8104 James Smart        2009-07-19   938  		if (phba->sli3_options & LPFC_SLI3_HBQ_ENABLED) {
f1c3b0fcbb8104 James Smart        2009-07-19   939  			/* take accumulated byte count from the last iocbq */
f1c3b0fcbb8104 James Smart        2009-07-19   940  			iocbq = list_entry(head.prev, typeof(*iocbq), list);
61910d6a524308 James Smart        2022-02-24   941  			if (phba->sli_rev == LPFC_SLI_REV4)
61910d6a524308 James Smart        2022-02-24   942  				evt_dat->len = iocbq->wcqe_cmpl.total_data_placed;
61910d6a524308 James Smart        2022-02-24   943  			else
f1c3b0fcbb8104 James Smart        2009-07-19   944  				evt_dat->len = iocbq->iocb.unsli3.rcvsli3.acc_len;
f1c3b0fcbb8104 James Smart        2009-07-19   945  		} else {
f1c3b0fcbb8104 James Smart        2009-07-19   946  			list_for_each_entry(iocbq, &head, list) {
61910d6a524308 James Smart        2022-02-24   947  				iocb = &iocbq->iocb;
61910d6a524308 James Smart        2022-02-24   948  				for (i = 0; i < iocb->ulpBdeCount;
61910d6a524308 James Smart        2022-02-24   949  				     i++)
f1c3b0fcbb8104 James Smart        2009-07-19   950  					evt_dat->len +=
61910d6a524308 James Smart        2022-02-24   951  					iocb->un.cont64[i].tus.f.bdeSize;
f1c3b0fcbb8104 James Smart        2009-07-19   952  			}
f1c3b0fcbb8104 James Smart        2009-07-19   953  		}
f1c3b0fcbb8104 James Smart        2009-07-19   954  
f1c3b0fcbb8104 James Smart        2009-07-19   955  		evt_dat->data = kzalloc(evt_dat->len, GFP_KERNEL);
4cc0e56e977f12 James Smart        2010-01-26   956  		if (evt_dat->data == NULL) {
f1c3b0fcbb8104 James Smart        2009-07-19   957  			lpfc_printf_log(phba, KERN_WARNING, LOG_LIBDFC,
f1c3b0fcbb8104 James Smart        2009-07-19   958  					"2615 Memory allocation failed for "
f1c3b0fcbb8104 James Smart        2009-07-19   959  					"CT event data, size %d\n",
f1c3b0fcbb8104 James Smart        2009-07-19   960  					evt_dat->len);
f1c3b0fcbb8104 James Smart        2009-07-19   961  			kfree(evt_dat);
4fede78f755247 James Smart        2010-01-26   962  			spin_lock_irqsave(&phba->ct_ev_lock, flags);
4cc0e56e977f12 James Smart        2010-01-26   963  			lpfc_bsg_event_unref(evt);
4fede78f755247 James Smart        2010-01-26   964  			spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
f1c3b0fcbb8104 James Smart        2009-07-19   965  			goto error_ct_unsol_exit;
f1c3b0fcbb8104 James Smart        2009-07-19   966  		}
f1c3b0fcbb8104 James Smart        2009-07-19   967  
f1c3b0fcbb8104 James Smart        2009-07-19   968  		list_for_each_entry(iocbq, &head, list) {
4cc0e56e977f12 James Smart        2010-01-26   969  			size = 0;
f1c3b0fcbb8104 James Smart        2009-07-19   970  			if (phba->sli3_options & LPFC_SLI3_HBQ_ENABLED) {
d51cf5bd926c7d James Smart        2022-04-12   971  				bdeBuf1 = iocbq->cmd_dmabuf;
d51cf5bd926c7d James Smart        2022-04-12   972  				bdeBuf2 = iocbq->bpl_dmabuf;
f1c3b0fcbb8104 James Smart        2009-07-19   973  			}
61910d6a524308 James Smart        2022-02-24   974  			if (phba->sli_rev == LPFC_SLI_REV4)
61910d6a524308 James Smart        2022-02-24   975  				bde_count = iocbq->wcqe_cmpl.word3;
61910d6a524308 James Smart        2022-02-24   976  			else
61910d6a524308 James Smart        2022-02-24   977  				bde_count = iocbq->iocb.ulpBdeCount;
61910d6a524308 James Smart        2022-02-24   978  			for (i = 0; i < bde_count; i++) {
f1c3b0fcbb8104 James Smart        2009-07-19   979  				if (phba->sli3_options &
f1c3b0fcbb8104 James Smart        2009-07-19   980  				    LPFC_SLI3_HBQ_ENABLED) {
f1c3b0fcbb8104 James Smart        2009-07-19   981  					if (i == 0) {
61910d6a524308 James Smart        2022-02-24   982  						size = iocbq->wqe.gen_req.bde.tus.f.bdeSize;
f1c3b0fcbb8104 James Smart        2009-07-19   983  						dmabuf = bdeBuf1;
f1c3b0fcbb8104 James Smart        2009-07-19   984  					} else if (i == 1) {
61910d6a524308 James Smart        2022-02-24   985  						size = iocbq->unsol_rcv_len;
f1c3b0fcbb8104 James Smart        2009-07-19   986  						dmabuf = bdeBuf2;
f1c3b0fcbb8104 James Smart        2009-07-19   987  					}
f1c3b0fcbb8104 James Smart        2009-07-19   988  					if ((offset + size) > evt_dat->len)
f1c3b0fcbb8104 James Smart        2009-07-19   989  						size = evt_dat->len - offset;
f1c3b0fcbb8104 James Smart        2009-07-19   990  				} else {
f1c3b0fcbb8104 James Smart        2009-07-19   991  					size = iocbq->iocb.un.cont64[i].
f1c3b0fcbb8104 James Smart        2009-07-19   992  						tus.f.bdeSize;
f1c3b0fcbb8104 James Smart        2009-07-19   993  					bde = &iocbq->iocb.un.cont64[i];
f1c3b0fcbb8104 James Smart        2009-07-19   994  					dma_addr = getPaddr(bde->addrHigh,
f1c3b0fcbb8104 James Smart        2009-07-19   995  							    bde->addrLow);
f1c3b0fcbb8104 James Smart        2009-07-19   996  					dmabuf = lpfc_sli_ringpostbuf_get(phba,
f1c3b0fcbb8104 James Smart        2009-07-19   997  							pring, dma_addr);
f1c3b0fcbb8104 James Smart        2009-07-19   998  				}
f1c3b0fcbb8104 James Smart        2009-07-19   999  				if (!dmabuf) {
f1c3b0fcbb8104 James Smart        2009-07-19  1000  					lpfc_printf_log(phba, KERN_ERR,
f1c3b0fcbb8104 James Smart        2009-07-19  1001  						LOG_LIBDFC, "2616 No dmabuf "
32350664497279 James Smart        2019-08-14  1002  						"found for iocbq x%px\n",
f1c3b0fcbb8104 James Smart        2009-07-19  1003  						iocbq);
f1c3b0fcbb8104 James Smart        2009-07-19  1004  					kfree(evt_dat->data);
f1c3b0fcbb8104 James Smart        2009-07-19  1005  					kfree(evt_dat);
4fede78f755247 James Smart        2010-01-26  1006  					spin_lock_irqsave(&phba->ct_ev_lock,
4fede78f755247 James Smart        2010-01-26  1007  						flags);
4cc0e56e977f12 James Smart        2010-01-26  1008  					lpfc_bsg_event_unref(evt);
4fede78f755247 James Smart        2010-01-26  1009  					spin_unlock_irqrestore(
4fede78f755247 James Smart        2010-01-26  1010  						&phba->ct_ev_lock, flags);
f1c3b0fcbb8104 James Smart        2009-07-19  1011  					goto error_ct_unsol_exit;
f1c3b0fcbb8104 James Smart        2009-07-19  1012  				}
f1c3b0fcbb8104 James Smart        2009-07-19  1013  				memcpy((char *)(evt_dat->data) + offset,
f1c3b0fcbb8104 James Smart        2009-07-19  1014  				       dmabuf->virt, size);
f1c3b0fcbb8104 James Smart        2009-07-19  1015  				offset += size;
f1c3b0fcbb8104 James Smart        2009-07-19  1016  				if (evt_req_id != SLI_CT_ELX_LOOPBACK &&
f1c3b0fcbb8104 James Smart        2009-07-19  1017  				    !(phba->sli3_options &
f1c3b0fcbb8104 James Smart        2009-07-19  1018  				      LPFC_SLI3_HBQ_ENABLED)) {
f1c3b0fcbb8104 James Smart        2009-07-19  1019  					lpfc_sli_ringpostbuf_put(phba, pring,
f1c3b0fcbb8104 James Smart        2009-07-19  1020  								 dmabuf);
f1c3b0fcbb8104 James Smart        2009-07-19  1021  				} else {
f1c3b0fcbb8104 James Smart        2009-07-19  1022  					switch (cmd) {
4cc0e56e977f12 James Smart        2010-01-26  1023  					case ELX_LOOPBACK_DATA:
1b51197d0fd0c0 James Smart        2011-12-13  1024  						if (phba->sli_rev <
1b51197d0fd0c0 James Smart        2011-12-13  1025  						    LPFC_SLI_REV4)
3b5dd52aaffd29 James Smart        2010-01-26  1026  							diag_cmd_data_free(phba,
1b51197d0fd0c0 James Smart        2011-12-13  1027  							(struct lpfc_dmabufext
1b51197d0fd0c0 James Smart        2011-12-13  1028  							 *)dmabuf);
4cc0e56e977f12 James Smart        2010-01-26  1029  						break;
f1c3b0fcbb8104 James Smart        2009-07-19  1030  					case ELX_LOOPBACK_XRI_SETUP:
4cc0e56e977f12 James Smart        2010-01-26  1031  						if ((phba->sli_rev ==
4cc0e56e977f12 James Smart        2010-01-26  1032  							LPFC_SLI_REV2) ||
4cc0e56e977f12 James Smart        2010-01-26  1033  							(phba->sli3_options &
4cc0e56e977f12 James Smart        2010-01-26  1034  							LPFC_SLI3_HBQ_ENABLED
4cc0e56e977f12 James Smart        2010-01-26  1035  							)) {
4cc0e56e977f12 James Smart        2010-01-26  1036  							lpfc_in_buf_free(phba,
4cc0e56e977f12 James Smart        2010-01-26  1037  									dmabuf);
4cc0e56e977f12 James Smart        2010-01-26  1038  						} else {
a680a9298e7b4f James Smart        2022-02-24  1039  							lpfc_sli3_post_buffer(phba,
f1c3b0fcbb8104 James Smart        2009-07-19  1040  									      pring,
f1c3b0fcbb8104 James Smart        2009-07-19  1041  									      1);
4cc0e56e977f12 James Smart        2010-01-26  1042  						}
f1c3b0fcbb8104 James Smart        2009-07-19  1043  						break;
f1c3b0fcbb8104 James Smart        2009-07-19  1044  					default:
f1c3b0fcbb8104 James Smart        2009-07-19  1045  						if (!(phba->sli3_options &
f1c3b0fcbb8104 James Smart        2009-07-19  1046  						      LPFC_SLI3_HBQ_ENABLED))
a680a9298e7b4f James Smart        2022-02-24  1047  							lpfc_sli3_post_buffer(phba,
f1c3b0fcbb8104 James Smart        2009-07-19  1048  									      pring,
f1c3b0fcbb8104 James Smart        2009-07-19  1049  									      1);
f1c3b0fcbb8104 James Smart        2009-07-19  1050  						break;
f1c3b0fcbb8104 James Smart        2009-07-19  1051  					}
f1c3b0fcbb8104 James Smart        2009-07-19  1052  				}
f1c3b0fcbb8104 James Smart        2009-07-19  1053  			}
f1c3b0fcbb8104 James Smart        2009-07-19  1054  		}
f1c3b0fcbb8104 James Smart        2009-07-19  1055  
4fede78f755247 James Smart        2010-01-26  1056  		spin_lock_irqsave(&phba->ct_ev_lock, flags);
f1c3b0fcbb8104 James Smart        2009-07-19  1057  		if (phba->sli_rev == LPFC_SLI_REV4) {
f1c3b0fcbb8104 James Smart        2009-07-19  1058  			evt_dat->immed_dat = phba->ctx_idx;
6dd9e31ccbc4db James Smart        2013-01-03  1059  			phba->ctx_idx = (phba->ctx_idx + 1) % LPFC_CT_CTX_MAX;
589a52d6a97e01 James Smart        2010-07-14  1060  			/* Provide warning for over-run of the ct_ctx array */
6dd9e31ccbc4db James Smart        2013-01-03  1061  			if (phba->ct_ctx[evt_dat->immed_dat].valid ==
589a52d6a97e01 James Smart        2010-07-14  1062  			    UNSOL_VALID)
589a52d6a97e01 James Smart        2010-07-14  1063  				lpfc_printf_log(phba, KERN_WARNING, LOG_ELS,
589a52d6a97e01 James Smart        2010-07-14  1064  						"2717 CT context array entry "
589a52d6a97e01 James Smart        2010-07-14  1065  						"[%d] over-run: oxid:x%x, "
589a52d6a97e01 James Smart        2010-07-14  1066  						"sid:x%x\n", phba->ctx_idx,
589a52d6a97e01 James Smart        2010-07-14  1067  						phba->ct_ctx[
589a52d6a97e01 James Smart        2010-07-14  1068  						    evt_dat->immed_dat].oxid,
589a52d6a97e01 James Smart        2010-07-14  1069  						phba->ct_ctx[
589a52d6a97e01 James Smart        2010-07-14  1070  						    evt_dat->immed_dat].SID);
7851fe2c7f294d James Smart        2011-07-22  1071  			phba->ct_ctx[evt_dat->immed_dat].rxid =
61910d6a524308 James Smart        2022-02-24  1072  				get_job_ulpcontext(phba, piocbq);
7851fe2c7f294d James Smart        2011-07-22  1073  			phba->ct_ctx[evt_dat->immed_dat].oxid =
61910d6a524308 James Smart        2022-02-24  1074  				get_job_rcvoxid(phba, piocbq);
f1c3b0fcbb8104 James Smart        2009-07-19  1075  			phba->ct_ctx[evt_dat->immed_dat].SID =
61910d6a524308 James Smart        2022-02-24  1076  				bf_get(wqe_els_did,
61910d6a524308 James Smart        2022-02-24  1077  				       &piocbq->wqe.xmit_els_rsp.wqe_dest);
6dd9e31ccbc4db James Smart        2013-01-03  1078  			phba->ct_ctx[evt_dat->immed_dat].valid = UNSOL_VALID;
f1c3b0fcbb8104 James Smart        2009-07-19  1079  		} else
61910d6a524308 James Smart        2022-02-24  1080  			evt_dat->immed_dat = get_job_ulpcontext(phba, piocbq);
f1c3b0fcbb8104 James Smart        2009-07-19  1081  
f1c3b0fcbb8104 James Smart        2009-07-19  1082  		evt_dat->type = FC_REG_CT_EVENT;
f1c3b0fcbb8104 James Smart        2009-07-19  1083  		list_add(&evt_dat->node, &evt->events_to_see);
4cc0e56e977f12 James Smart        2010-01-26  1084  		if (evt_req_id == SLI_CT_ELX_LOOPBACK) {
f1c3b0fcbb8104 James Smart        2009-07-19  1085  			wake_up_interruptible(&evt->wq);
4cc0e56e977f12 James Smart        2010-01-26  1086  			lpfc_bsg_event_unref(evt);
f1c3b0fcbb8104 James Smart        2009-07-19  1087  			break;
f1c3b0fcbb8104 James Smart        2009-07-19  1088  		}
4cc0e56e977f12 James Smart        2010-01-26  1089  
4cc0e56e977f12 James Smart        2010-01-26  1090  		list_move(evt->events_to_see.prev, &evt->events_to_get);
4cc0e56e977f12 James Smart        2010-01-26  1091  
a33c4f7bff84c3 James Smart        2013-03-01  1092  		dd_data = (struct bsg_job_data *)evt->dd_data;
a33c4f7bff84c3 James Smart        2013-03-01  1093  		job = dd_data->set_job;
a33c4f7bff84c3 James Smart        2013-03-01  1094  		dd_data->set_job = NULL;
a33c4f7bff84c3 James Smart        2013-03-01  1095  		lpfc_bsg_event_unref(evt);
4cc0e56e977f12 James Smart        2010-01-26  1096  		if (job) {
01e0e15c8b3b32 Johannes Thumshirn 2016-11-17  1097  			bsg_reply = job->reply;
01e0e15c8b3b32 Johannes Thumshirn 2016-11-17  1098  			bsg_reply->reply_payload_rcv_len = size;
4cc0e56e977f12 James Smart        2010-01-26  1099  			/* make error code available to userspace */
01e0e15c8b3b32 Johannes Thumshirn 2016-11-17  1100  			bsg_reply->result = 0;
4cc0e56e977f12 James Smart        2010-01-26  1101  			job->dd_data = NULL;
4cc0e56e977f12 James Smart        2010-01-26  1102  			/* complete the job back to userspace */
4cc0e56e977f12 James Smart        2010-01-26  1103  			spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
06548160dfecd1 Johannes Thumshirn 2016-11-17  1104  			bsg_job_done(job, bsg_reply->result,
1abaede71560fa Johannes Thumshirn 2016-11-17  1105  				       bsg_reply->reply_payload_rcv_len);
4cc0e56e977f12 James Smart        2010-01-26  1106  			spin_lock_irqsave(&phba->ct_ev_lock, flags);
4cc0e56e977f12 James Smart        2010-01-26  1107  		}
4cc0e56e977f12 James Smart        2010-01-26  1108  	}
4fede78f755247 James Smart        2010-01-26  1109  	spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
f1c3b0fcbb8104 James Smart        2009-07-19  1110  
f1c3b0fcbb8104 James Smart        2009-07-19  1111  error_ct_unsol_exit:
f1c3b0fcbb8104 James Smart        2009-07-19  1112  	if (!list_empty(&head))
f1c3b0fcbb8104 James Smart        2009-07-19  1113  		list_del(&head);
1b51197d0fd0c0 James Smart        2011-12-13  1114  	if ((phba->sli_rev < LPFC_SLI_REV4) &&
1b51197d0fd0c0 James Smart        2011-12-13  1115  	    (evt_req_id == SLI_CT_ELX_LOOPBACK))
4cc0e56e977f12 James Smart        2010-01-26  1116  		return 0;
4fede78f755247 James Smart        2010-01-26  1117  	return 1;
f1c3b0fcbb8104 James Smart        2009-07-19  1118  }
f1c3b0fcbb8104 James Smart        2009-07-19  1119  

:::::: The code at line 918 was first introduced by commit
:::::: f1c3b0fcbb8104dac92d65d5016500a09beea287 [SCSI] lpfc 8.3.4: Add bsg (SGIOv4) support for ELS/CT support

:::::: TO: James Smart <James.Smart@Emulex.Com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
