Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D81F925
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 19:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696274490; x=1727810490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNmNlwd3wz0Kid+8KPv7NiT7PY9hRZ4CsTERy6/KkDs=;
  b=C5WChZhDGXN+Fnsf6aSdOHCmSZGCMeqS4xWA4XTnU5JUMlYpkXFeeq2u
   R9bIpgz+VAg4j9OILL22Rr3vXFahu+XBb7k8EWPdlQWHRT4ljX56H9KBx
   FCuAr+KFNZxOfCc0rzxezH/UVuQZgFvwuA/pIRawwF7uYgiaElOEm0n+x
   C+5YpDH7nOIiP3dobOalOl9JsjIVvid+Rf6/DNpEKJJ3jv10Sno5XOaoU
   HCU+xXSgDQqlIPokzo/DP1zsMhvz20DPfNiyZX3GliUpupEAho8keMoyC
   VFbnnvuKiQakyY7RDxMyLFjCOM80A2S9hZ8iDJyZJPlaPZ2wsDtZEU0P0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381592350"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="381592350"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 11:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="785847352"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="785847352"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 02 Oct 2023 11:45:24 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnNuz-0006HB-2D;
	Mon, 02 Oct 2023 18:45:22 +0000
Date: Tue, 3 Oct 2023 02:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 34/40]
 drivers/scsi/lpfc/lpfc_scsi.c:6179: warning: Function parameter or member
 'shost' not described in 'lpfc_host_reset_handler'
Message-ID: <202310030237.UGpR5Tj2-lkp@intel.com>
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
commit: ba9aa6b27826de8ba176e40f9db4e9b941fbe0e9 [34/40] scsi: Use Scsi_Host as argument for eh_host_reset_handler
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030237.UGpR5Tj2-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030237.UGpR5Tj2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030237.UGpR5Tj2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/lpfc/lpfc_scsi.c:6179: warning: Function parameter or member 'shost' not described in 'lpfc_host_reset_handler'
>> drivers/scsi/lpfc/lpfc_scsi.c:6179: warning: Excess function parameter 'cmnd' description in 'lpfc_host_reset_handler'


vim +6179 drivers/scsi/lpfc/lpfc_scsi.c

dea3101e0a5c89 James Bottomley 2005-04-17  6160  
27b01b821f136e James Smart     2012-05-09  6161  /**
27b01b821f136e James Smart     2012-05-09  6162   * lpfc_host_reset_handler - scsi_host_template eh_host_reset_handler entry pt
27b01b821f136e James Smart     2012-05-09  6163   * @cmnd: Pointer to scsi_cmnd data structure.
27b01b821f136e James Smart     2012-05-09  6164   *
27b01b821f136e James Smart     2012-05-09  6165   * This routine does host reset to the adaptor port. It brings the HBA
27b01b821f136e James Smart     2012-05-09  6166   * offline, performs a board restart, and then brings the board back online.
27b01b821f136e James Smart     2012-05-09  6167   * The lpfc_offline calls lpfc_sli_hba_down which will abort and local
27b01b821f136e James Smart     2012-05-09  6168   * reject all outstanding SCSI commands to the host and error returned
27b01b821f136e James Smart     2012-05-09  6169   * back to SCSI mid-level. As this will be SCSI mid-level's last resort
27b01b821f136e James Smart     2012-05-09  6170   * of error handling, it will only return error if resetting of the adapter
27b01b821f136e James Smart     2012-05-09  6171   * is not successful; in all other cases, will return success.
27b01b821f136e James Smart     2012-05-09  6172   *
27b01b821f136e James Smart     2012-05-09  6173   * Return code :
27b01b821f136e James Smart     2012-05-09  6174   *  0x2003 - Error
27b01b821f136e James Smart     2012-05-09  6175   *  0x2002 - Success
27b01b821f136e James Smart     2012-05-09  6176   **/
27b01b821f136e James Smart     2012-05-09  6177  static int
ba9aa6b27826de Hannes Reinecke 2023-10-02  6178  lpfc_host_reset_handler(struct Scsi_Host *shost)
27b01b821f136e James Smart     2012-05-09 @6179  {
27b01b821f136e James Smart     2012-05-09  6180  	struct lpfc_vport *vport = (struct lpfc_vport *) shost->hostdata;
27b01b821f136e James Smart     2012-05-09  6181  	struct lpfc_hba *phba = vport->phba;
27b01b821f136e James Smart     2012-05-09  6182  	int rc, ret = SUCCESS;
27b01b821f136e James Smart     2012-05-09  6183  
da09ae4864e10b James Smart     2021-01-04  6184  	lpfc_printf_vlog(vport, KERN_ERR, LOG_FCP,
a88dbb6a960675 James Smart     2013-04-17  6185  			 "3172 SCSI layer issued Host Reset Data:\n");
a88dbb6a960675 James Smart     2013-04-17  6186  
618a5230b8fa62 James Smart     2012-06-12  6187  	lpfc_offline_prep(phba, LPFC_MBX_WAIT);
27b01b821f136e James Smart     2012-05-09  6188  	lpfc_offline(phba);
27b01b821f136e James Smart     2012-05-09  6189  	rc = lpfc_sli_brdrestart(phba);
27b01b821f136e James Smart     2012-05-09  6190  	if (rc)
8c24a4f643edbc James Smart     2019-08-14  6191  		goto error;
8c24a4f643edbc James Smart     2019-08-14  6192  
d305c253af693e James Smart     2021-10-20  6193  	/* Wait for successful restart of adapter */
d305c253af693e James Smart     2021-10-20  6194  	if (phba->sli_rev < LPFC_SLI_REV4) {
d305c253af693e James Smart     2021-10-20  6195  		rc = lpfc_sli_chipset_init(phba);
d305c253af693e James Smart     2021-10-20  6196  		if (rc)
d305c253af693e James Smart     2021-10-20  6197  			goto error;
d305c253af693e James Smart     2021-10-20  6198  	}
d305c253af693e James Smart     2021-10-20  6199  
a88dbb6a960675 James Smart     2013-04-17  6200  	rc = lpfc_online(phba);
a88dbb6a960675 James Smart     2013-04-17  6201  	if (rc)
8c24a4f643edbc James Smart     2019-08-14  6202  		goto error;
8c24a4f643edbc James Smart     2019-08-14  6203  
27b01b821f136e James Smart     2012-05-09  6204  	lpfc_unblock_mgmt_io(phba);
27b01b821f136e James Smart     2012-05-09  6205  
27b01b821f136e James Smart     2012-05-09  6206  	return ret;
8c24a4f643edbc James Smart     2019-08-14  6207  error:
372c187b8a705c Dick Kennedy    2020-06-30  6208  	lpfc_printf_vlog(vport, KERN_ERR, LOG_TRACE_EVENT,
8c24a4f643edbc James Smart     2019-08-14  6209  			 "3323 Failed host reset\n");
8c24a4f643edbc James Smart     2019-08-14  6210  	lpfc_unblock_mgmt_io(phba);
8c24a4f643edbc James Smart     2019-08-14  6211  	return FAILED;
27b01b821f136e James Smart     2012-05-09  6212  }
27b01b821f136e James Smart     2012-05-09  6213  

:::::: The code at line 6179 was first introduced by commit
:::::: 27b01b821f136e657c28078007a865a307816c1a [SCSI] lpfc 8.3.31: Fixed system crash due to not providing SCSI error-handling host reset handler

:::::: TO: James Smart <james.smart@emulex.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
