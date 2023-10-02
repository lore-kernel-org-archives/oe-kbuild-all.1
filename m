Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC22E1D53B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696276007; x=1727812007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90ADSkUJhtxprlS4Zs9CFdz6zQF+1WXu+d58M4bAW20=;
  b=M8a7evD6gU6pb6xGMPXymuHppO0ZYKklwOmGiuVjRaOYgFzKnSUwup9s
   +m4uK0CDgLHNtgYahbE/Ak5GdE39TBHln+8vemv4qBdVLfZbG0h6cRj5m
   8OFgsECqGxf8Kd3nqpwnrcc+HA3OweY69uKODSAnm6/vBca5k45skybcO
   85kbrG1lHHUoKxjX9JrjEDeEPZUnnKmqG7oj1nKuqpMig0HTmxyn750Jw
   lQu42CjqT9Kh8vUyY94pA6QqX91ZUl7QiA4CLRA1b2ykEwzJ62YGnu177
   QckvxYujY024wb1t6x81iHTCreRYnHgecjWsLwS6T3UHqVh/BPQlvidmn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446880469"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="446880469"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 12:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780048921"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="780048921"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Oct 2023 12:46:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnOsN-0006Jh-1D;
	Mon, 02 Oct 2023 19:46:43 +0000
Date: Tue, 3 Oct 2023 03:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 36/40]
 drivers/scsi/lpfc/lpfc_scsi.c:6049: warning: Function parameter or member
 'starget' not described in 'lpfc_target_reset_handler'
Message-ID: <202310030321.cHdjatgh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git eh-rework.v5
head:   2b7934b02ad769f5384351ef79c4d6b0cde694e3
commit: a15aaaa5cbf5e6268ae55019b3edb0dbff0e495e [36/40] scsi: Use scsi_target as argument for eh_target_reset_handler()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030321.cHdjatgh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030321.cHdjatgh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030321.cHdjatgh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/lpfc/lpfc_scsi.c:6049: warning: Function parameter or member 'starget' not described in 'lpfc_target_reset_handler'
>> drivers/scsi/lpfc/lpfc_scsi.c:6049: warning: Excess function parameter 'cmnd' description in 'lpfc_target_reset_handler'
   drivers/scsi/lpfc/lpfc_scsi.c:6179: warning: Function parameter or member 'shost' not described in 'lpfc_host_reset_handler'
   drivers/scsi/lpfc/lpfc_scsi.c:6179: warning: Excess function parameter 'cmnd' description in 'lpfc_host_reset_handler'


vim +6049 drivers/scsi/lpfc/lpfc_scsi.c

bbb9d18009373b James Smart     2009-06-10  6035  
bbb9d18009373b James Smart     2009-06-10  6036  /**
bbb9d18009373b James Smart     2009-06-10  6037   * lpfc_target_reset_handler - scsi_host_template eh_target_reset entry point
bbb9d18009373b James Smart     2009-06-10  6038   * @cmnd: Pointer to scsi_cmnd data structure.
bbb9d18009373b James Smart     2009-06-10  6039   *
bbb9d18009373b James Smart     2009-06-10  6040   * This routine does a target reset by sending a TARGET_RESET task management
bbb9d18009373b James Smart     2009-06-10  6041   * command.
bbb9d18009373b James Smart     2009-06-10  6042   *
bbb9d18009373b James Smart     2009-06-10  6043   * Return code :
bbb9d18009373b James Smart     2009-06-10  6044   *  0x2003 - Error
bbb9d18009373b James Smart     2009-06-10  6045   *  0x2002 - Success
bbb9d18009373b James Smart     2009-06-10  6046   **/
bbb9d18009373b James Smart     2009-06-10  6047  static int
a15aaaa5cbf5e6 Hannes Reinecke 2023-10-02  6048  lpfc_target_reset_handler(struct scsi_target *starget)
bbb9d18009373b James Smart     2009-06-10 @6049  {
a15aaaa5cbf5e6 Hannes Reinecke 2023-10-02  6050  	struct fc_rport *rport = starget_to_rport(starget);
a15aaaa5cbf5e6 Hannes Reinecke 2023-10-02  6051  	struct Scsi_Host  *shost = rport_to_shost(rport);
bbb9d18009373b James Smart     2009-06-10  6052  	struct lpfc_vport *vport = (struct lpfc_vport *) shost->hostdata;
1ba981fd3ad1f9 James Smart     2014-02-20  6053  	struct lpfc_rport_data *rdata;
1c6f4ef5d6be7e James Smart     2009-11-18  6054  	struct lpfc_nodelist *pnode;
a15aaaa5cbf5e6 Hannes Reinecke 2023-10-02  6055  	unsigned tgt_id = starget->id;
a15aaaa5cbf5e6 Hannes Reinecke 2023-10-02  6056  	uint64_t lun_id = 0;
bbb9d18009373b James Smart     2009-06-10  6057  	struct lpfc_scsi_event_header scsi_event;
53151bbb83f11b James Smart     2013-10-10  6058  	int status;
da09ae4864e10b James Smart     2021-01-04  6059  	u32 logit = LOG_FCP;
21990d3d1861c7 James Smart     2021-07-07  6060  	u32 dev_loss_tmo = vport->cfg_devloss_tmo;
31051249f12e22 James Smart     2021-01-04  6061  	unsigned long flags;
31051249f12e22 James Smart     2021-01-04  6062  	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(waitq);
bbb9d18009373b James Smart     2009-06-10  6063  
6f808bd78e8296 James Smart     2022-06-03  6064  	if (!rport)
6f808bd78e8296 James Smart     2022-06-03  6065  		return FAILED;
6f808bd78e8296 James Smart     2022-06-03  6066  
bb21fc9911eea9 Hannes Reinecke 2022-03-01  6067  	rdata = rport->dd_data;
bbd3d7380bc67c James Smart     2019-03-12  6068  	if (!rdata || !rdata->pnode) {
372c187b8a705c Dick Kennedy    2020-06-30  6069  		lpfc_printf_vlog(vport, KERN_ERR, LOG_TRACE_EVENT,
32350664497279 James Smart     2019-08-14  6070  				 "0799 Target Reset rdata failure: rdata x%px\n",
bbd3d7380bc67c James Smart     2019-03-12  6071  				 rdata);
1c6f4ef5d6be7e James Smart     2009-11-18  6072  		return FAILED;
1c6f4ef5d6be7e James Smart     2009-11-18  6073  	}
1c6f4ef5d6be7e James Smart     2009-11-18  6074  	pnode = rdata->pnode;
bb21fc9911eea9 Hannes Reinecke 2022-03-01  6075  	status = fc_block_rport(rport);
908e18e4e7a1e7 James Smart     2012-08-03  6076  	if (status != 0 && status != SUCCESS)
589a52d6a97e01 James Smart     2010-07-14  6077  		return status;
bbb9d18009373b James Smart     2009-06-10  6078  
e81ce97f571607 Hannes Reinecke 2022-03-01  6079  	status = lpfc_chk_tgt_mapped(vport, rport);
bbb9d18009373b James Smart     2009-06-10  6080  	if (status == FAILED) {
372c187b8a705c Dick Kennedy    2020-06-30  6081  		lpfc_printf_vlog(vport, KERN_ERR, LOG_TRACE_EVENT,
32350664497279 James Smart     2019-08-14  6082  			"0722 Target Reset rport failure: rdata x%px\n", rdata);
63e480fd2f598e James Smart     2015-04-07  6083  		if (pnode) {
31051249f12e22 James Smart     2021-01-04  6084  			spin_lock_irqsave(&pnode->lock, flags);
8c50d25c0edd8e James Smart     2014-09-03  6085  			pnode->nlp_flag &= ~NLP_NPR_ADISC;
8c50d25c0edd8e James Smart     2014-09-03  6086  			pnode->nlp_fcp_info &= ~NLP_FCP_2_DEVICE;
31051249f12e22 James Smart     2021-01-04  6087  			spin_unlock_irqrestore(&pnode->lock, flags);
63e480fd2f598e James Smart     2015-04-07  6088  		}
8c50d25c0edd8e James Smart     2014-09-03  6089  		lpfc_reset_flush_io_context(vport, tgt_id, lun_id,
8c50d25c0edd8e James Smart     2014-09-03  6090  					  LPFC_CTX_TGT);
8c50d25c0edd8e James Smart     2014-09-03  6091  		return FAST_IO_FAIL;
bbb9d18009373b James Smart     2009-06-10  6092  	}
bbb9d18009373b James Smart     2009-06-10  6093  
bbb9d18009373b James Smart     2009-06-10  6094  	scsi_event.event_type = FC_REG_SCSI_EVENT;
bbb9d18009373b James Smart     2009-06-10  6095  	scsi_event.subcategory = LPFC_EVENT_TGTRESET;
bbb9d18009373b James Smart     2009-06-10  6096  	scsi_event.lun = 0;
bbb9d18009373b James Smart     2009-06-10  6097  	memcpy(scsi_event.wwpn, &pnode->nlp_portname, sizeof(struct lpfc_name));
bbb9d18009373b James Smart     2009-06-10  6098  	memcpy(scsi_event.wwnn, &pnode->nlp_nodename, sizeof(struct lpfc_name));
bbb9d18009373b James Smart     2009-06-10  6099  
bbb9d18009373b James Smart     2009-06-10  6100  	fc_host_post_vendor_event(shost, fc_get_event_number(),
bbb9d18009373b James Smart     2009-06-10  6101  		sizeof(scsi_event), (char *)&scsi_event, LPFC_NL_VENDOR_ID);
bbb9d18009373b James Smart     2009-06-10  6102  
123a3af35d0845 Hannes Reinecke 2022-03-01  6103  	status = lpfc_send_taskmgmt(vport, rport, tgt_id, lun_id,
bbb9d18009373b James Smart     2009-06-10  6104  					FCP_TARGET_RESET);
21990d3d1861c7 James Smart     2021-07-07  6105  	if (status != SUCCESS) {
da09ae4864e10b James Smart     2021-01-04  6106  		logit = LOG_TRACE_EVENT;
21990d3d1861c7 James Smart     2021-07-07  6107  
21990d3d1861c7 James Smart     2021-07-07  6108  		/* Issue LOGO, if no LOGO is outstanding */
31051249f12e22 James Smart     2021-01-04  6109  		spin_lock_irqsave(&pnode->lock, flags);
af984c87293b19 James Smart     2021-10-20  6110  		if (!(pnode->save_flags & NLP_WAIT_FOR_LOGO) &&
31051249f12e22 James Smart     2021-01-04  6111  		    !pnode->logo_waitq) {
31051249f12e22 James Smart     2021-01-04  6112  			pnode->logo_waitq = &waitq;
31051249f12e22 James Smart     2021-01-04  6113  			pnode->nlp_fcp_info &= ~NLP_FCP_2_DEVICE;
31051249f12e22 James Smart     2021-01-04  6114  			pnode->nlp_flag |= NLP_ISSUE_LOGO;
af984c87293b19 James Smart     2021-10-20  6115  			pnode->save_flags |= NLP_WAIT_FOR_LOGO;
31051249f12e22 James Smart     2021-01-04  6116  			spin_unlock_irqrestore(&pnode->lock, flags);
31051249f12e22 James Smart     2021-01-04  6117  			lpfc_unreg_rpi(vport, pnode);
31051249f12e22 James Smart     2021-01-04  6118  			wait_event_timeout(waitq,
af984c87293b19 James Smart     2021-10-20  6119  					   (!(pnode->save_flags &
21990d3d1861c7 James Smart     2021-07-07  6120  					      NLP_WAIT_FOR_LOGO)),
21990d3d1861c7 James Smart     2021-07-07  6121  					   msecs_to_jiffies(dev_loss_tmo *
31051249f12e22 James Smart     2021-01-04  6122  							    1000));
31051249f12e22 James Smart     2021-01-04  6123  
af984c87293b19 James Smart     2021-10-20  6124  			if (pnode->save_flags & NLP_WAIT_FOR_LOGO) {
21990d3d1861c7 James Smart     2021-07-07  6125  				lpfc_printf_vlog(vport, KERN_ERR, logit,
21990d3d1861c7 James Smart     2021-07-07  6126  						 "0725 SCSI layer TGTRST "
21990d3d1861c7 James Smart     2021-07-07  6127  						 "failed & LOGO TMO (%d, %llu) "
21990d3d1861c7 James Smart     2021-07-07  6128  						 "return x%x\n",
21990d3d1861c7 James Smart     2021-07-07  6129  						 tgt_id, lun_id, status);
31051249f12e22 James Smart     2021-01-04  6130  				spin_lock_irqsave(&pnode->lock, flags);
af984c87293b19 James Smart     2021-10-20  6131  				pnode->save_flags &= ~NLP_WAIT_FOR_LOGO;
31051249f12e22 James Smart     2021-01-04  6132  			} else {
31051249f12e22 James Smart     2021-01-04  6133  				spin_lock_irqsave(&pnode->lock, flags);
31051249f12e22 James Smart     2021-01-04  6134  			}
31051249f12e22 James Smart     2021-01-04  6135  			pnode->logo_waitq = NULL;
31051249f12e22 James Smart     2021-01-04  6136  			spin_unlock_irqrestore(&pnode->lock, flags);
31051249f12e22 James Smart     2021-01-04  6137  			status = SUCCESS;
21990d3d1861c7 James Smart     2021-07-07  6138  
31051249f12e22 James Smart     2021-01-04  6139  		} else {
31051249f12e22 James Smart     2021-01-04  6140  			spin_unlock_irqrestore(&pnode->lock, flags);
21990d3d1861c7 James Smart     2021-07-07  6141  			status = FAILED;
21990d3d1861c7 James Smart     2021-07-07  6142  		}
31051249f12e22 James Smart     2021-01-04  6143  	}
bbb9d18009373b James Smart     2009-06-10  6144  
da09ae4864e10b James Smart     2021-01-04  6145  	lpfc_printf_vlog(vport, KERN_ERR, logit,
9cb78c16f5dade Hannes Reinecke 2014-06-25  6146  			 "0723 SCSI layer issued Target Reset (%d, %llu) "
bbb9d18009373b James Smart     2009-06-10  6147  			 "return x%x\n", tgt_id, lun_id, status);
bbb9d18009373b James Smart     2009-06-10  6148  
bbb9d18009373b James Smart     2009-06-10  6149  	/*
bbb9d18009373b James Smart     2009-06-10  6150  	 * We have to clean up i/o as : they may be orphaned by the TMF;
bbb9d18009373b James Smart     2009-06-10  6151  	 * or if the TMF failed, they may be in an indeterminate state.
bbb9d18009373b James Smart     2009-06-10  6152  	 * So, continue on.
bbb9d18009373b James Smart     2009-06-10  6153  	 * We will report success if all the i/o aborts successfully.
bbb9d18009373b James Smart     2009-06-10  6154  	 */
53151bbb83f11b James Smart     2013-10-10  6155  	if (status == SUCCESS)
53151bbb83f11b James Smart     2013-10-10  6156  		status = lpfc_reset_flush_io_context(vport, tgt_id, lun_id,
bbb9d18009373b James Smart     2009-06-10  6157  					  LPFC_CTX_TGT);
53151bbb83f11b James Smart     2013-10-10  6158  	return status;
dea3101e0a5c89 James Bottomley 2005-04-17  6159  }
dea3101e0a5c89 James Bottomley 2005-04-17  6160  

:::::: The code at line 6049 was first introduced by commit
:::::: bbb9d18009373bc74bfeba760097de277f395858 [SCSI] lpfc 8.3.3 : Add support for Target Reset handler entrypoint

:::::: TO: James Smart <James.Smart@Emulex.Com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
