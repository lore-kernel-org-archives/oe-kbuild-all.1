Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A05715BD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 19:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696274798; x=1727810798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KwZZsXZB1yb2KrBclMELL4c0KvUEaY9vP9trshU2Hk0=;
  b=WiQIDDAOfDadJy95HQAByvVMGa+vppNmxBpuMaBLyG+elBTjWlL//gpW
   TxjPnKtNabppI5YI9I5wFw9LcrRawjpKT7NvpfyQ3MedGRRmqz5Q3ehln
   U23iw+/OtXqO9gKMfTCg+WSoNlKSwhVfDSsR9loEsmO3qY+BtL7IlqUHN
   Lap93RkrE9xmuPR6xlxjUHLplgoKZMbVZawp7m0fqlKH8y6j1a98/L4si
   62S4RxkyKdNUA88AjHWgGi0BXx7jVxh5XMx0t5DflYWeDq0ZFVWrCT3rI
   nqbUEIEfM5Rl1gvhaORqfxWZmPakCf3dJnY5TteWhm4wBv53+nbUUF5RG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367771701"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="367771701"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 12:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997730604"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="997730604"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2023 12:26:36 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnOYs-0006Ir-0V;
	Mon, 02 Oct 2023 19:26:34 +0000
Date: Tue, 3 Oct 2023 03:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 36/40]
 drivers/scsi/ibmvscsi/ibmvfc.c:2941: warning: Function parameter or member
 'starget' not described in 'ibmvfc_eh_target_reset_handler'
Message-ID: <202310030318.ja9azcVm-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030318.ja9azcVm-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030318.ja9azcVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030318.ja9azcVm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ibmvscsi/ibmvfc.c:2941: warning: Function parameter or member 'starget' not described in 'ibmvfc_eh_target_reset_handler'
>> drivers/scsi/ibmvscsi/ibmvfc.c:2941: warning: Excess function parameter 'cmd' description in 'ibmvfc_eh_target_reset_handler'
   drivers/scsi/ibmvscsi/ibmvfc.c:2990: warning: Function parameter or member 'shost' not described in 'ibmvfc_eh_host_reset_handler'
   drivers/scsi/ibmvscsi/ibmvfc.c:2990: warning: Excess function parameter 'cmd' description in 'ibmvfc_eh_host_reset_handler'


vim +2941 drivers/scsi/ibmvscsi/ibmvfc.c

93631b4aac7cac2 Brian King      2013-04-12  2932  
072b91f9c6510d0 Brian King      2008-07-01  2933  /**
072b91f9c6510d0 Brian King      2008-07-01  2934   * ibmvfc_eh_target_reset_handler - Reset the target
072b91f9c6510d0 Brian King      2008-07-01  2935   * @cmd:	scsi command struct
072b91f9c6510d0 Brian King      2008-07-01  2936   *
072b91f9c6510d0 Brian King      2008-07-01  2937   * Returns:
93631b4aac7cac2 Brian King      2013-04-12  2938   *	SUCCESS / FAST_IO_FAIL / FAILED
072b91f9c6510d0 Brian King      2008-07-01  2939   **/
a15aaaa5cbf5e62 Hannes Reinecke 2023-10-02  2940  static int ibmvfc_eh_target_reset_handler(struct scsi_target *starget)
072b91f9c6510d0 Brian King      2008-07-01 @2941  {
5db8363f43477ee Hannes Reinecke 2022-05-02  2942  	struct fc_rport *rport = starget_to_rport(starget);
5db8363f43477ee Hannes Reinecke 2022-05-02  2943  	struct Scsi_Host *shost = rport_to_shost(rport);
5db8363f43477ee Hannes Reinecke 2022-05-02  2944  	struct ibmvfc_host *vhost = shost_priv(shost);
93631b4aac7cac2 Brian King      2013-04-12  2945  	int block_rc;
93631b4aac7cac2 Brian King      2013-04-12  2946  	int reset_rc = 0;
ad8dcffaf9bc1d7 Brian King      2008-10-29  2947  	int rc = FAILED;
072b91f9c6510d0 Brian King      2008-07-01  2948  	unsigned long cancel_rc = 0;
5db8363f43477ee Hannes Reinecke 2022-05-02  2949  	bool tgt_reset = false;
072b91f9c6510d0 Brian King      2008-07-01  2950  
072b91f9c6510d0 Brian King      2008-07-01  2951  	ENTER;
5db8363f43477ee Hannes Reinecke 2022-05-02  2952  	block_rc = fc_block_rport(rport);
072b91f9c6510d0 Brian King      2008-07-01  2953  	ibmvfc_wait_while_resetting(vhost);
93631b4aac7cac2 Brian King      2013-04-12  2954  	if (block_rc != FAST_IO_FAIL) {
5db8363f43477ee Hannes Reinecke 2022-05-02  2955  		struct scsi_device *sdev;
5db8363f43477ee Hannes Reinecke 2022-05-02  2956  
5db8363f43477ee Hannes Reinecke 2022-05-02  2957  		shost_for_each_device(sdev, shost) {
5db8363f43477ee Hannes Reinecke 2022-05-02  2958  			if ((sdev->channel != starget->channel) ||
5db8363f43477ee Hannes Reinecke 2022-05-02  2959  			    (sdev->id != starget->id))
5db8363f43477ee Hannes Reinecke 2022-05-02  2960  				continue;
5db8363f43477ee Hannes Reinecke 2022-05-02  2961  
5db8363f43477ee Hannes Reinecke 2022-05-02  2962  			cancel_rc |= ibmvfc_cancel_all(sdev,
5db8363f43477ee Hannes Reinecke 2022-05-02  2963  						       IBMVFC_TMF_TGT_RESET);
5db8363f43477ee Hannes Reinecke 2022-05-02  2964  			if (!tgt_reset) {
5db8363f43477ee Hannes Reinecke 2022-05-02  2965  				reset_rc = ibmvfc_reset_device(sdev,
5db8363f43477ee Hannes Reinecke 2022-05-02  2966  					IBMVFC_TARGET_RESET, "target");
5db8363f43477ee Hannes Reinecke 2022-05-02  2967  				tgt_reset = true;
5db8363f43477ee Hannes Reinecke 2022-05-02  2968  			}
5db8363f43477ee Hannes Reinecke 2022-05-02  2969  		}
93631b4aac7cac2 Brian King      2013-04-12  2970  	} else
5db8363f43477ee Hannes Reinecke 2022-05-02  2971  		starget_for_each_device(starget, &cancel_rc,
5db8363f43477ee Hannes Reinecke 2022-05-02  2972  					ibmvfc_dev_cancel_all_noreset);
072b91f9c6510d0 Brian King      2008-07-01  2973  
ad8dcffaf9bc1d7 Brian King      2008-10-29  2974  	if (!cancel_rc && !reset_rc)
ad8dcffaf9bc1d7 Brian King      2008-10-29  2975  		rc = ibmvfc_wait_for_ops(vhost, starget, ibmvfc_match_target);
072b91f9c6510d0 Brian King      2008-07-01  2976  
93631b4aac7cac2 Brian King      2013-04-12  2977  	if (block_rc == FAST_IO_FAIL && rc != FAILED)
93631b4aac7cac2 Brian King      2013-04-12  2978  		rc = FAST_IO_FAIL;
93631b4aac7cac2 Brian King      2013-04-12  2979  
072b91f9c6510d0 Brian King      2008-07-01  2980  	LEAVE;
ad8dcffaf9bc1d7 Brian King      2008-10-29  2981  	return rc;
072b91f9c6510d0 Brian King      2008-07-01  2982  }
072b91f9c6510d0 Brian King      2008-07-01  2983  

:::::: The code at line 2941 was first introduced by commit
:::::: 072b91f9c6510d0ec4a49d07dbc318760c7da7b3 [SCSI] ibmvfc: IBM Power Virtual Fibre Channel Adapter Client Driver

:::::: TO: Brian King <brking@linux.vnet.ibm.com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
