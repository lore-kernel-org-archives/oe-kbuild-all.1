Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE82030A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696278423; x=1727814423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GQZAKY6J03R6CDTNnfzvbBpL9vhtPJalcjsoCJ3z3ng=;
  b=nqi0UV6eHZMF1I/Bk5gfecUrMiqkDB6zHttSs2wccxZroieIaC783dcs
   3N9jViRF300xQZNzsbOpJKV6QIDzg67S+nR8LoE8OqFq4HCGrN+dJs+dL
   wReKnpCu+/FaPajC32sjnn3nS4DjedvxcBN469EEWwzaeFD/Vptp3eBmk
   5qUpBtQMtKE7912TyaumPxSCzOKaC+mdpJUiIa4F1O6b5wdMyvBk6yiPY
   2zmEhSaZdZ1ajT6PsllMtMNU5zJMwkxeXKOq0wCqJEdxI3cWxW1tihuP2
   rnWPyD0o0zftxKU7jFXrLpI8nZz9SfRvZ1emcZCIvexTklcx/Hmr6rrGa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="386602961"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="386602961"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 13:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="841104875"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="841104875"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2023 13:26:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnPV8-0006LV-04;
	Mon, 02 Oct 2023 20:26:46 +0000
Date: Tue, 3 Oct 2023 04:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 37/40]
 drivers/scsi/lpfc/lpfc_scsi.c:5971: warning: Function parameter or member
 'sdev' not described in 'lpfc_device_reset_handler'
Message-ID: <202310030430.DcHyxqQD-lkp@intel.com>
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
commit: 14d6e82a8650383a8699e4ed5c8588bf9a07a582 [37/40] scsi: Use scsi_device as argument to eh_device_reset_handler()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030430.DcHyxqQD-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030430.DcHyxqQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030430.DcHyxqQD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/lpfc/lpfc_scsi.c:5971: warning: Function parameter or member 'sdev' not described in 'lpfc_device_reset_handler'
>> drivers/scsi/lpfc/lpfc_scsi.c:5971: warning: Excess function parameter 'cmnd' description in 'lpfc_device_reset_handler'
   drivers/scsi/lpfc/lpfc_scsi.c:6049: warning: Function parameter or member 'starget' not described in 'lpfc_target_reset_handler'
   drivers/scsi/lpfc/lpfc_scsi.c:6049: warning: Excess function parameter 'cmnd' description in 'lpfc_target_reset_handler'
   drivers/scsi/lpfc/lpfc_scsi.c:6179: warning: Function parameter or member 'shost' not described in 'lpfc_host_reset_handler'
   drivers/scsi/lpfc/lpfc_scsi.c:6179: warning: Excess function parameter 'cmnd' description in 'lpfc_host_reset_handler'


vim +5971 drivers/scsi/lpfc/lpfc_scsi.c

bbb9d18009373b James Smart     2009-06-10  5957  
bbb9d18009373b James Smart     2009-06-10  5958  /**
bbb9d18009373b James Smart     2009-06-10  5959   * lpfc_device_reset_handler - scsi_host_template eh_device_reset entry point
bbb9d18009373b James Smart     2009-06-10  5960   * @cmnd: Pointer to scsi_cmnd data structure.
bbb9d18009373b James Smart     2009-06-10  5961   *
bbb9d18009373b James Smart     2009-06-10  5962   * This routine does a device reset by sending a LUN_RESET task management
bbb9d18009373b James Smart     2009-06-10  5963   * command.
bbb9d18009373b James Smart     2009-06-10  5964   *
bbb9d18009373b James Smart     2009-06-10  5965   * Return code :
bbb9d18009373b James Smart     2009-06-10  5966   *  0x2003 - Error
bbb9d18009373b James Smart     2009-06-10  5967   *  0x2002 - Success
bbb9d18009373b James Smart     2009-06-10  5968   **/
bbb9d18009373b James Smart     2009-06-10  5969  static int
14d6e82a865038 Hannes Reinecke 2023-10-02  5970  lpfc_device_reset_handler(struct scsi_device *sdev)
bbb9d18009373b James Smart     2009-06-10 @5971  {
14d6e82a865038 Hannes Reinecke 2023-10-02  5972  	struct Scsi_Host  *shost = sdev->host;
14d6e82a865038 Hannes Reinecke 2023-10-02  5973  	struct fc_rport *rport = starget_to_rport(scsi_target(sdev));
bbb9d18009373b James Smart     2009-06-10  5974  	struct lpfc_vport *vport = (struct lpfc_vport *) shost->hostdata;
1ba981fd3ad1f9 James Smart     2014-02-20  5975  	struct lpfc_rport_data *rdata;
1c6f4ef5d6be7e James Smart     2009-11-18  5976  	struct lpfc_nodelist *pnode;
14d6e82a865038 Hannes Reinecke 2023-10-02  5977  	unsigned tgt_id = sdev->id;
14d6e82a865038 Hannes Reinecke 2023-10-02  5978  	uint64_t lun_id = sdev->lun;
bbb9d18009373b James Smart     2009-06-10  5979  	struct lpfc_scsi_event_header scsi_event;
53151bbb83f11b James Smart     2013-10-10  5980  	int status;
da09ae4864e10b James Smart     2021-01-04  5981  	u32 logit = LOG_FCP;
bbb9d18009373b James Smart     2009-06-10  5982  
6f808bd78e8296 James Smart     2022-06-03  5983  	if (!rport)
6f808bd78e8296 James Smart     2022-06-03  5984  		return FAILED;
6f808bd78e8296 James Smart     2022-06-03  5985  
bb21fc9911eea9 Hannes Reinecke 2022-03-01  5986  	rdata = rport->dd_data;
ad490b6e70c575 James Smart     2015-04-07  5987  	if (!rdata || !rdata->pnode) {
372c187b8a705c Dick Kennedy    2020-06-30  5988  		lpfc_printf_vlog(vport, KERN_ERR, LOG_TRACE_EVENT,
32350664497279 James Smart     2019-08-14  5989  				 "0798 Device Reset rdata failure: rdata x%px\n",
ad490b6e70c575 James Smart     2015-04-07  5990  				 rdata);
1c6f4ef5d6be7e James Smart     2009-11-18  5991  		return FAILED;
1c6f4ef5d6be7e James Smart     2009-11-18  5992  	}
1c6f4ef5d6be7e James Smart     2009-11-18  5993  	pnode = rdata->pnode;
bb21fc9911eea9 Hannes Reinecke 2022-03-01  5994  	status = fc_block_rport(rport);
908e18e4e7a1e7 James Smart     2012-08-03  5995  	if (status != 0 && status != SUCCESS)
589a52d6a97e01 James Smart     2010-07-14  5996  		return status;
bbb9d18009373b James Smart     2009-06-10  5997  
e81ce97f571607 Hannes Reinecke 2022-03-01  5998  	status = lpfc_chk_tgt_mapped(vport, rport);
bbb9d18009373b James Smart     2009-06-10  5999  	if (status == FAILED) {
372c187b8a705c Dick Kennedy    2020-06-30  6000  		lpfc_printf_vlog(vport, KERN_ERR, LOG_TRACE_EVENT,
32350664497279 James Smart     2019-08-14  6001  			"0721 Device Reset rport failure: rdata x%px\n", rdata);
bbb9d18009373b James Smart     2009-06-10  6002  		return FAILED;
bbb9d18009373b James Smart     2009-06-10  6003  	}
bbb9d18009373b James Smart     2009-06-10  6004  
bbb9d18009373b James Smart     2009-06-10  6005  	scsi_event.event_type = FC_REG_SCSI_EVENT;
bbb9d18009373b James Smart     2009-06-10  6006  	scsi_event.subcategory = LPFC_EVENT_LUNRESET;
bbb9d18009373b James Smart     2009-06-10  6007  	scsi_event.lun = lun_id;
bbb9d18009373b James Smart     2009-06-10  6008  	memcpy(scsi_event.wwpn, &pnode->nlp_portname, sizeof(struct lpfc_name));
bbb9d18009373b James Smart     2009-06-10  6009  	memcpy(scsi_event.wwnn, &pnode->nlp_nodename, sizeof(struct lpfc_name));
bbb9d18009373b James Smart     2009-06-10  6010  
bbb9d18009373b James Smart     2009-06-10  6011  	fc_host_post_vendor_event(shost, fc_get_event_number(),
bbb9d18009373b James Smart     2009-06-10  6012  		sizeof(scsi_event), (char *)&scsi_event, LPFC_NL_VENDOR_ID);
bbb9d18009373b James Smart     2009-06-10  6013  
123a3af35d0845 Hannes Reinecke 2022-03-01  6014  	status = lpfc_send_taskmgmt(vport, rport, tgt_id, lun_id,
bbb9d18009373b James Smart     2009-06-10  6015  						FCP_LUN_RESET);
da09ae4864e10b James Smart     2021-01-04  6016  	if (status != SUCCESS)
da09ae4864e10b James Smart     2021-01-04  6017  		logit =  LOG_TRACE_EVENT;
bbb9d18009373b James Smart     2009-06-10  6018  
da09ae4864e10b James Smart     2021-01-04  6019  	lpfc_printf_vlog(vport, KERN_ERR, logit,
9cb78c16f5dade Hannes Reinecke 2014-06-25  6020  			 "0713 SCSI layer issued Device Reset (%d, %llu) "
bbb9d18009373b James Smart     2009-06-10  6021  			 "return x%x\n", tgt_id, lun_id, status);
bbb9d18009373b James Smart     2009-06-10  6022  
bbb9d18009373b James Smart     2009-06-10  6023  	/*
bbb9d18009373b James Smart     2009-06-10  6024  	 * We have to clean up i/o as : they may be orphaned by the TMF;
bbb9d18009373b James Smart     2009-06-10  6025  	 * or if the TMF failed, they may be in an indeterminate state.
bbb9d18009373b James Smart     2009-06-10  6026  	 * So, continue on.
bbb9d18009373b James Smart     2009-06-10  6027  	 * We will report success if all the i/o aborts successfully.
bbb9d18009373b James Smart     2009-06-10  6028  	 */
53151bbb83f11b James Smart     2013-10-10  6029  	if (status == SUCCESS)
53151bbb83f11b James Smart     2013-10-10  6030  		status = lpfc_reset_flush_io_context(vport, tgt_id, lun_id,
bbb9d18009373b James Smart     2009-06-10  6031  						LPFC_CTX_LUN);
53151bbb83f11b James Smart     2013-10-10  6032  
53151bbb83f11b James Smart     2013-10-10  6033  	return status;
bbb9d18009373b James Smart     2009-06-10  6034  }
bbb9d18009373b James Smart     2009-06-10  6035  

:::::: The code at line 5971 was first introduced by commit
:::::: bbb9d18009373bc74bfeba760097de277f395858 [SCSI] lpfc 8.3.3 : Add support for Target Reset handler entrypoint

:::::: TO: James Smart <James.Smart@Emulex.Com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
