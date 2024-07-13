Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42D44361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720854552; cv=none; b=jfGhgX9L6zXZV/HJJ1MZ4IZTT60WSD+dHfeEZjOI1ymXpRKMWxCKh8ArVn11Unz+xErvDq7fzZpjOwTWrPGiaj23hpDIcCPXLNM14OMWcq039KfDjt7MCKry8og4FHx5CR2pO0badp1YxW0RblhBgf+tXJ63xnyV1igw092UXnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720854552; c=relaxed/simple;
	bh=dSm8MWaeXJjcM+adezSJ7jz9GcJazvP5K5SS7RyA+uI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QgCmYwm7OgPmjqrLCe+HIrCgCarVrbc3P2fqoXpGP6eq0WRa8dhpFxcwXNs9Kl6p0B+Slf7TdJfIitlDCaNmywfHL/gAKYN01ygNG6Hcnp+vujax+YQ76ZPLAIUbjJFtdWIt25GaGmTl6jwXKFDuYMmndIHZsGnsBiherBstI08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIPpE166; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIPpE166"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720854550; x=1752390550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dSm8MWaeXJjcM+adezSJ7jz9GcJazvP5K5SS7RyA+uI=;
  b=FIPpE1668Ul76/GU/YAn4jV3bNnnRW86zMmcRsk0tMdSv539qQ8m6vbt
   lC9pucCkldS6aHlhPIIgJ0bURrP/keV3Y7+sFrRLLKVCHCU1kuZoHZgug
   Lyf4sa02n2Kcn+/rHhOKmZol4P3443WbfhkHZwYrGFf61ZjCVfW1U70eY
   K4VUMKM+ZxIioD6Zt4ZPxCo+tglLME5/zUqerUg8hZDE8GzNEIRl0WGIU
   9r9k24WiVJrIWsdWhVGKW0YAY5kfZkYngJdg2m34nskxOyCqYtBYz5Zjb
   kU3V2NY0/mrxfxBQpeFMB8Lj+FBc1d+q1D99TFPIIj0ozJMJyWsI7z4wx
   Q==;
X-CSE-ConnectionGUID: 86nrpw44TqGkTwx7PLMY2A==
X-CSE-MsgGUID: mqGPLOb/TiSSbzs0JFbyvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29695292"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="29695292"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 00:09:09 -0700
X-CSE-ConnectionGUID: mBbfsruyQeqJbwaVBnWQaQ==
X-CSE-MsgGUID: H+qTcWSjSh+IEOQrplAFVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="80215813"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2024 00:09:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSWsT-000boI-0m;
	Sat, 13 Jul 2024 07:09:05 +0000
Date: Sat, 13 Jul 2024 15:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-remove-slave-configure 2/3]
 drivers/scsi/aacraid/linit.c:389: warning: Function parameter or struct
 member 'lim' not described in 'aac_device_configure'
Message-ID: <202407131524.dUHRubLk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-remove-slave-configure
head:   3cf2ba5bb279edd16bd1606f4feb0a3bd87a5700
commit: 32e1b2bc5a1ba0efdc927a21ed513341c7b91660 [2/3] scsi: Rename .slave_configure() into .device_configure()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240713/202407131524.dUHRubLk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131524.dUHRubLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131524.dUHRubLk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/aacraid/linit.c:389: warning: Function parameter or struct member 'lim' not described in 'aac_device_configure'


vim +389 drivers/scsi/aacraid/linit.c

^1da177e4c3f41 Linus Torvalds           2005-04-16  378  
^1da177e4c3f41 Linus Torvalds           2005-04-16  379  /**
32e1b2bc5a1ba0 Bart Van Assche          2024-07-12  380   *	aac_device_configure		-	compute queue depths
^1da177e4c3f41 Linus Torvalds           2005-04-16  381   *	@sdev:	SCSI device we are considering
^1da177e4c3f41 Linus Torvalds           2005-04-16  382   *
^1da177e4c3f41 Linus Torvalds           2005-04-16  383   *	Selects queue depths for each target device based on the host adapter's
^1da177e4c3f41 Linus Torvalds           2005-04-16  384   *	total capacity and the queue depth supported by the target device.
^1da177e4c3f41 Linus Torvalds           2005-04-16  385   *	A queue depth of one automatically disables tagged queueing.
^1da177e4c3f41 Linus Torvalds           2005-04-16  386   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  387  
32e1b2bc5a1ba0 Bart Van Assche          2024-07-12  388  static int aac_device_configure(struct scsi_device *sdev, struct queue_limits *lim)
^1da177e4c3f41 Linus Torvalds           2005-04-16 @389  {
b18268fc631034 Salyzyn, Mark            2008-01-08  390  	struct aac_dev *aac = (struct aac_dev *)sdev->host->hostdata;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  391  	int chn, tid;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  392  	unsigned int depth = 0;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  393  	unsigned int set_timeout = 0;
e2fd90dd2ed87b Balsundar P              2019-10-15  394  	int timeout = 0;
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  395  	bool set_qd_dev_type = false;
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  396  	u8 devtype = 0;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  397  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  398  	chn = aac_logical_to_phys(sdev_channel(sdev));
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  399  	tid = sdev_id(sdev);
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  400  	if (chn < AAC_MAX_BUSES && tid < AAC_MAX_TARGETS && aac->sa_firmware) {
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  401  		devtype = aac->hba_map[chn][tid].devtype;
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  402  
0015437cc046e5 Sagar Biradar            2019-03-07  403  		if (devtype == AAC_DEVTYPE_NATIVE_RAW) {
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  404  			depth = aac->hba_map[chn][tid].qd_limit;
0015437cc046e5 Sagar Biradar            2019-03-07  405  			set_timeout = 1;
0015437cc046e5 Sagar Biradar            2019-03-07  406  			goto common_config;
0015437cc046e5 Sagar Biradar            2019-03-07  407  		}
0015437cc046e5 Sagar Biradar            2019-03-07  408  		if (devtype == AAC_DEVTYPE_ARC_RAW) {
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  409  			set_qd_dev_type = true;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  410  			set_timeout = 1;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  411  			goto common_config;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  412  		}
0015437cc046e5 Sagar Biradar            2019-03-07  413  	}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  414  
a4576b5da67156 Mark Salyzyn             2008-04-30  415  	if (aac->jbod && (sdev->type == TYPE_DISK))
a4576b5da67156 Mark Salyzyn             2008-04-30  416  		sdev->removable = 1;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  417  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  418  	if (sdev->type == TYPE_DISK
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  419  	 && sdev_channel(sdev) != CONTAINER_CHANNEL
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  420  	 && (!aac->jbod || sdev->inq_periph_qual)
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  421  	 && (!aac->raid_scsi_mode || (sdev_channel(sdev) != 2))) {
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  422  
e37ee4bec6c6d6 Mark Haverkamp           2007-01-26  423  		if (expose_physicals == 0)
e37ee4bec6c6d6 Mark Haverkamp           2007-01-26  424  			return -ENXIO;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  425  
b18268fc631034 Salyzyn, Mark            2008-01-08  426  		if (expose_physicals < 0)
bb08f92ebd7570 Mark Haverkamp           2006-02-01  427  			sdev->no_uld_attach = 1;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  428  	}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  429  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  430  	if (sdev->tagged_supported
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  431  	 &&  sdev->type == TYPE_DISK
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  432  	 &&  (!aac->raid_scsi_mode || (sdev_channel(sdev) != 2))
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  433  	 && !sdev->no_uld_attach) {
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  434  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  435  		struct scsi_device * dev;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  436  		struct Scsi_Host *host = sdev->host;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  437  		unsigned num_lsu = 0;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  438  		unsigned num_one = 0;
b18268fc631034 Salyzyn, Mark            2008-01-08  439  		unsigned cid;
7c00ffa314bf0f Mark Haverkamp           2005-05-16  440  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  441  		set_timeout = 1;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  442  
b18268fc631034 Salyzyn, Mark            2008-01-08  443  		for (cid = 0; cid < aac->maximum_num_containers; ++cid)
b18268fc631034 Salyzyn, Mark            2008-01-08  444  			if (aac->fsa_dev[cid].valid)
b18268fc631034 Salyzyn, Mark            2008-01-08  445  				++num_lsu;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  446  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  447  		__shost_for_each_device(dev, host) {
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  448  			if (dev->tagged_supported
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  449  			 && dev->type == TYPE_DISK
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  450  			 && (!aac->raid_scsi_mode || (sdev_channel(sdev) != 2))
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  451  			 && !dev->no_uld_attach) {
cb1042f285c216 Salyzyn, Mark            2008-01-17  452  				if ((sdev_channel(dev) != CONTAINER_CHANNEL)
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  453  				 || !aac->fsa_dev[sdev_id(dev)].valid) {
bb08f92ebd7570 Mark Haverkamp           2006-02-01  454  					++num_lsu;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  455  				}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  456  			} else {
bb08f92ebd7570 Mark Haverkamp           2006-02-01  457  				++num_one;
bb08f92ebd7570 Mark Haverkamp           2006-02-01  458  			}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  459  		}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  460  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  461  		if (num_lsu == 0)
bb08f92ebd7570 Mark Haverkamp           2006-02-01  462  			++num_lsu;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  463  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  464  		depth = (host->can_queue - num_one) / num_lsu;
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  465  
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  466  		if (sdev_channel(sdev) != NATIVE_CHANNEL)
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  467  			goto common_config;
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  468  
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  469  		set_qd_dev_type = true;
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  470  
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  471  	}
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  472  
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  473  common_config:
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  474  
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  475  	/*
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  476  	 * Check if SATA drive
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  477  	 */
58eaffe54bca77 Raghava Aditya Renukunta 2017-05-10  478  	if (set_qd_dev_type) {
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  479  		if (strncmp(sdev->vendor, "ATA", 3) == 0)
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  480  			depth = 32;
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  481  		else
d58129c96b3cde Raghava Aditya Renukunta 2017-05-10  482  			depth = 64;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  483  	}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  484  
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  485  	/*
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  486  	 * Firmware has an individual device recovery time typically
e2fd90dd2ed87b Balsundar P              2019-10-15  487  	 * of 35 seconds, give us a margin. Thor devices can take longer in
e2fd90dd2ed87b Balsundar P              2019-10-15  488  	 * error recovery, hence different value.
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  489  	 */
e2fd90dd2ed87b Balsundar P              2019-10-15  490  	if (set_timeout) {
e2fd90dd2ed87b Balsundar P              2019-10-15  491  		timeout = aac->sa_firmware ? AAC_SA_TIMEOUT : AAC_ARC_TIMEOUT;
e2fd90dd2ed87b Balsundar P              2019-10-15  492  		blk_queue_rq_timeout(sdev->request_queue, timeout * HZ);
e2fd90dd2ed87b Balsundar P              2019-10-15  493  	}
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  494  
bb08f92ebd7570 Mark Haverkamp           2006-02-01  495  	if (depth > 256)
bb08f92ebd7570 Mark Haverkamp           2006-02-01  496  		depth = 256;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  497  	else if (depth < 1)
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  498  		depth = 1;
a052865fe2871a Raghava Aditya Renukunta 2017-02-02  499  
db5ed4dfd5dd01 Christoph Hellwig        2014-11-13  500  	scsi_change_queue_depth(sdev, depth);
7c00ffa314bf0f Mark Haverkamp           2005-05-16  501  
6bf3b630d0a733 Raghava Aditya Renukunta 2016-02-03  502  	sdev->tagged_supported = 1;
6bf3b630d0a733 Raghava Aditya Renukunta 2016-02-03  503  
^1da177e4c3f41 Linus Torvalds           2005-04-16  504  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  505  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  506  

:::::: The code at line 389 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
