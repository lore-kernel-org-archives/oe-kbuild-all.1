Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9637E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 00:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692749157; x=1724285157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tpe4FeFq7r2f+3xUwm+oqRIp9jWZvpwznLSrhVMPIoo=;
  b=BNtgu8MCyY8neKvA4FD2bqnzYjcNX0Fj2J89WFttncVmkJjfJ/Kn6hVz
   KKc8roYFTvMreNqXBGVXMOvE7MJRd6QSxM+kFHeFQX6Rn8Hreu6YI3LZY
   njZuFWo7SiRllrVSOIKZOo8bKs2ehwRMdf6fgZZygKuhqHQhxzzMiRPVF
   lSe/TK2b1uI8Py/bpfZ7nF4HwqL0AFSMGluFHBBwMe785laxDj7PSFtbM
   gLBq4h+qQRZY9E7jbbi8p7T+dWMqcmiio3G75M3E2T42OSkotHVNjqHYY
   ebSQAPok9ari4iUlOuWdRfUB5DIxM+zZw2L+FHUaBQjVMUJRmiO4EneC4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372910972"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="372910972"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 17:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983070486"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="983070486"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 17:05:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYbNe-0000dc-1y;
	Wed, 23 Aug 2023 00:05:50 +0000
Date: Wed, 23 Aug 2023 08:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Quinn Tran <qutran@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [mkp-scsi:for-next 111/134] drivers/scsi/qla2xxx/qla_iocb.c:594:29:
 warning: variable 'ha' set but not used
Message-ID: <202308230757.VKMIztAB-lkp@intel.com>
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
commit: efeda3bf912f269bcae16816683f432f58d68075 [111/134] scsi: qla2xxx: Move resource to allow code reuse
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230757.VKMIztAB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230757.VKMIztAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230757.VKMIztAB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/qla2xxx/qla_iocb.c: In function 'qla24xx_build_scsi_type_6_iocbs':
>> drivers/scsi/qla2xxx/qla_iocb.c:594:29: warning: variable 'ha' set but not used [-Wunused-but-set-variable]
     594 |         struct qla_hw_data *ha;
         |                             ^~


vim +/ha +594 drivers/scsi/qla2xxx/qla_iocb.c

2d70c103fd2a06 Nicholas Bellinger  2012-05-15  587  
5162cf0c4e3962 Giridhar Malavali   2011-11-18  588  static inline int
5162cf0c4e3962 Giridhar Malavali   2011-11-18  589  qla24xx_build_scsi_type_6_iocbs(srb_t *sp, struct cmd_type_6 *cmd_pkt,
5162cf0c4e3962 Giridhar Malavali   2011-11-18  590  	uint16_t tot_dsds)
5162cf0c4e3962 Giridhar Malavali   2011-11-18  591  {
15b7a68c1d030b Bart Van Assche     2019-04-17  592  	struct dsd64 *cur_dsd = NULL, *next_dsd;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  593  	scsi_qla_host_t	*vha;
5162cf0c4e3962 Giridhar Malavali   2011-11-18 @594  	struct qla_hw_data *ha;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  595  	struct scsi_cmnd *cmd;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  596  	struct	scatterlist *cur_seg;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  597  	uint8_t avail_dsds;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  598  	uint8_t first_iocb = 1;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  599  	uint32_t dsd_list_len;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  600  	struct dsd_dma *dsd_ptr;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  601  	struct ct6_dsd *ctx;
49db4d4e02aabc Quinn Tran          2020-09-03  602  	struct qla_qpair *qpair = sp->qpair;
^1da177e4c3f41 Linus Torvalds      2005-04-16  603  
9ba56b95a58890 Giridhar Malavali   2012-02-09  604  	cmd = GET_CMD_SP(sp);
^1da177e4c3f41 Linus Torvalds      2005-04-16  605  
5162cf0c4e3962 Giridhar Malavali   2011-11-18  606  	/* Update entry type to indicate Command Type 3 IOCB */
2c26348c4d090c Bart Van Assche     2019-04-04  607  	put_unaligned_le32(COMMAND_TYPE_6, &cmd_pkt->entry_type);
a9083016a5314b Giridhar Malavali   2010-04-12  608  
5162cf0c4e3962 Giridhar Malavali   2011-11-18  609  	/* No data transfer */
464ea494a40c6e Bikash Hazarika     2023-06-07  610  	if (!scsi_bufflen(cmd) || cmd->sc_data_direction == DMA_NONE ||
464ea494a40c6e Bikash Hazarika     2023-06-07  611  	    tot_dsds == 0) {
ad950360eebb5f Bart Van Assche     2015-07-09  612  		cmd_pkt->byte_count = cpu_to_le32(0);
5162cf0c4e3962 Giridhar Malavali   2011-11-18  613  		return 0;
a9083016a5314b Giridhar Malavali   2010-04-12  614  	}
5162cf0c4e3962 Giridhar Malavali   2011-11-18  615  
25ff6af10562cf Joe Carnuccio       2017-01-19  616  	vha = sp->vha;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  617  	ha = vha->hw;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  618  
5162cf0c4e3962 Giridhar Malavali   2011-11-18  619  	/* Set transfer direction */
5162cf0c4e3962 Giridhar Malavali   2011-11-18  620  	if (cmd->sc_data_direction == DMA_TO_DEVICE) {
ad950360eebb5f Bart Van Assche     2015-07-09  621  		cmd_pkt->control_flags = cpu_to_le16(CF_WRITE_DATA);
49db4d4e02aabc Quinn Tran          2020-09-03  622  		qpair->counters.output_bytes += scsi_bufflen(cmd);
49db4d4e02aabc Quinn Tran          2020-09-03  623  		qpair->counters.output_requests++;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  624  	} else if (cmd->sc_data_direction == DMA_FROM_DEVICE) {
ad950360eebb5f Bart Van Assche     2015-07-09  625  		cmd_pkt->control_flags = cpu_to_le16(CF_READ_DATA);
49db4d4e02aabc Quinn Tran          2020-09-03  626  		qpair->counters.input_bytes += scsi_bufflen(cmd);
49db4d4e02aabc Quinn Tran          2020-09-03  627  		qpair->counters.input_requests++;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  628  	}
5162cf0c4e3962 Giridhar Malavali   2011-11-18  629  
5162cf0c4e3962 Giridhar Malavali   2011-11-18  630  	cur_seg = scsi_sglist(cmd);
82d8dfd2a23826 Quinn Tran          2022-12-21  631  	ctx = &sp->u.scmd.ct6_ctx;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  632  
5162cf0c4e3962 Giridhar Malavali   2011-11-18  633  	while (tot_dsds) {
5162cf0c4e3962 Giridhar Malavali   2011-11-18  634  		avail_dsds = (tot_dsds > QLA_DSDS_PER_IOCB) ?
5162cf0c4e3962 Giridhar Malavali   2011-11-18  635  		    QLA_DSDS_PER_IOCB : tot_dsds;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  636  		tot_dsds -= avail_dsds;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  637  		dsd_list_len = (avail_dsds + 1) * QLA_DSD_SIZE;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  638  
efeda3bf912f26 Quinn Tran          2023-08-17  639  		dsd_ptr = list_first_entry(&qpair->dsd_list, struct dsd_dma, list);
5162cf0c4e3962 Giridhar Malavali   2011-11-18  640  		next_dsd = dsd_ptr->dsd_addr;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  641  		list_del(&dsd_ptr->list);
efeda3bf912f26 Quinn Tran          2023-08-17  642  		qpair->dsd_avail--;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  643  		list_add_tail(&dsd_ptr->list, &ctx->dsd_list);
5162cf0c4e3962 Giridhar Malavali   2011-11-18  644  		ctx->dsd_use_cnt++;
efeda3bf912f26 Quinn Tran          2023-08-17  645  		qpair->dsd_inuse++;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  646  
5162cf0c4e3962 Giridhar Malavali   2011-11-18  647  		if (first_iocb) {
5162cf0c4e3962 Giridhar Malavali   2011-11-18  648  			first_iocb = 0;
15b7a68c1d030b Bart Van Assche     2019-04-17  649  			put_unaligned_le64(dsd_ptr->dsd_list_dma,
15b7a68c1d030b Bart Van Assche     2019-04-17  650  					   &cmd_pkt->fcp_dsd.address);
15b7a68c1d030b Bart Van Assche     2019-04-17  651  			cmd_pkt->fcp_dsd.length = cpu_to_le32(dsd_list_len);
2b6c0cee90cecb Andrew Vasquez      2005-07-06  652  		} else {
15b7a68c1d030b Bart Van Assche     2019-04-17  653  			put_unaligned_le64(dsd_ptr->dsd_list_dma,
15b7a68c1d030b Bart Van Assche     2019-04-17  654  					   &cur_dsd->address);
15b7a68c1d030b Bart Van Assche     2019-04-17  655  			cur_dsd->length = cpu_to_le32(dsd_list_len);
15b7a68c1d030b Bart Van Assche     2019-04-17  656  			cur_dsd++;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  657  		}
15b7a68c1d030b Bart Van Assche     2019-04-17  658  		cur_dsd = next_dsd;
5162cf0c4e3962 Giridhar Malavali   2011-11-18  659  		while (avail_dsds) {
15b7a68c1d030b Bart Van Assche     2019-04-17  660  			append_dsd64(&cur_dsd, cur_seg);
5162cf0c4e3962 Giridhar Malavali   2011-11-18  661  			cur_seg = sg_next(cur_seg);
5162cf0c4e3962 Giridhar Malavali   2011-11-18  662  			avail_dsds--;
2b6c0cee90cecb Andrew Vasquez      2005-07-06  663  		}
73208dfd7ab19f Anirban Chakraborty 2008-12-09  664  	}
2b6c0cee90cecb Andrew Vasquez      2005-07-06  665  
5162cf0c4e3962 Giridhar Malavali   2011-11-18  666  	/* Null termination */
15b7a68c1d030b Bart Van Assche     2019-04-17  667  	cur_dsd->address = 0;
15b7a68c1d030b Bart Van Assche     2019-04-17  668  	cur_dsd->length = 0;
15b7a68c1d030b Bart Van Assche     2019-04-17  669  	cur_dsd++;
7ffa5b939751b6 Bart Van Assche     2020-05-18  670  	cmd_pkt->control_flags |= cpu_to_le16(CF_DATA_SEG_DESCR_ENABLE);
5162cf0c4e3962 Giridhar Malavali   2011-11-18  671  	return 0;
2b6c0cee90cecb Andrew Vasquez      2005-07-06  672  }
2b6c0cee90cecb Andrew Vasquez      2005-07-06  673  

:::::: The code at line 594 was first introduced by commit
:::::: 5162cf0c4e3962b28a9c8bc1ce89d266db67aa55 [SCSI] qla2xxx: Consolidated IOCB processing routines.

:::::: TO: Giridhar Malavali <giridhar.malavali@qlogic.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
