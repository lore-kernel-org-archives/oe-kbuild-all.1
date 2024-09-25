Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9D18C910
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727270616; cv=none; b=jhNnNkKH22QRJht4ASZo49J6xOWe2Qk2LkME88agYl8kpPOg9Ohn5wzxzSAOUvbes3ZbfnLtnC/BYVLPgKJRLg8Kuv2ZNrepVQjCGmgn39luIz1GKK/gmyvw0X4zefNmvlVcDKsofb31vZ6DGy5T4EhzO44VtCQECC5d+9+ZdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727270616; c=relaxed/simple;
	bh=Klwt1dl8iK11ZGb9Ltvd8qfBs1ATSn1JQvy7u+gLXWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgF1Pn/VSwL93ARiMsDqfRkc0Kf3TCYf9hp/Bbag1wupOoU5VyCOTezYNWclUGs2Znw8BYfpZpE3BbowvKxT6HQaCCi/WTkWc6RRJUBSxxJMLv8xosl+aGnZLHOEGthqrRg7gjqECgusznuPxXSXCat7iFmEpRyCf6Yrg/X+tnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wv+tM2+d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wv+tM2+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727270614; x=1758806614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Klwt1dl8iK11ZGb9Ltvd8qfBs1ATSn1JQvy7u+gLXWo=;
  b=Wv+tM2+dCtHGSisbha/Bv/KDMykGuqWQhe6YdiAFSvzNgk181BdXCE1u
   7IuFGgG7gd0R4pneLbCinspXgpJKJ/LcIO2P+ESOF9kxlY1HdvcPJO7cP
   4ykkrH2kuh5bQBY30nOF75+fcMGqYrhzkqJk0EJ5et/0858JSUF+Sl6Xf
   3Z/KUbgMPWzJbMWcwT7jlc9JDmaHxK33GkS9R/eCahTGxDap7fiDZ45Lv
   LIRG6HYTr/jBrZ/NTyEtkUORMC8Esk9Jg8y/660Her6Xm94dgQXMHHP/K
   FLbYpsgBBCBxAiBy0OTVYtH0Tt1z2JUhkg7QYZI8L0ULzwOT4qNyMBcZK
   w==;
X-CSE-ConnectionGUID: txJuVVRLRQaZM38vxWPw0A==
X-CSE-MsgGUID: QJs65F5LQvym9UVnQhds0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30109337"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="30109337"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 06:23:20 -0700
X-CSE-ConnectionGUID: 7rgg1hveQ/uzYNkZnHZ2ZA==
X-CSE-MsgGUID: wTdFcE5yS6KH2LbbyxImgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="76275221"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2024 06:23:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stRzB-000JYv-0g;
	Wed, 25 Sep 2024 13:23:17 +0000
Date: Wed, 25 Sep 2024 21:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-remove-slave-configure 3/5]
 drivers/scsi/ibmvscsi/ibmvscsi.c:1872: warning: Function parameter or struct
 member 'lim' not described in 'ibmvscsi_device_configure'
Message-ID: <202409252122.HTojAxIr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-remove-slave-configure
head:   a5fded69fb0f4a49c1de7e7b4f83bc68a1cc99d3
commit: 74de896b64c86b8ef567baeaed830a36d9cb4ba9 [3/5] scsi: Convert SCSI drivers to .device_configure()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240925/202409252122.HTojAxIr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252122.HTojAxIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252122.HTojAxIr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/ibmvscsi/ibmvscsi.c:1043: warning: Excess function parameter 'done' description in 'ibmvscsi_queuecommand_lck'
>> drivers/scsi/ibmvscsi/ibmvscsi.c:1872: warning: Function parameter or struct member 'lim' not described in 'ibmvscsi_device_configure'
--
>> drivers/scsi/ibmvscsi/ibmvfc.c:3451: warning: Function parameter or struct member 'lim' not described in 'ibmvfc_device_configure'


vim +1872 drivers/scsi/ibmvscsi/ibmvscsi.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1861  
0979c84b4affaf Robert Jennings 2007-03-29  1862  /**
74de896b64c86b Bart Van Assche 2024-07-12  1863   * ibmvscsi_device_configure: Set the "allow_restart" flag for each disk.
0979c84b4affaf Robert Jennings 2007-03-29  1864   * @sdev:	struct scsi_device device to configure
0979c84b4affaf Robert Jennings 2007-03-29  1865   *
0979c84b4affaf Robert Jennings 2007-03-29  1866   * Enable allow_restart for a device if it is a disk.  Adjust the
0979c84b4affaf Robert Jennings 2007-03-29  1867   * queue_depth here also as is required by the documentation for
0979c84b4affaf Robert Jennings 2007-03-29  1868   * struct scsi_host_template.
0979c84b4affaf Robert Jennings 2007-03-29  1869   */
74de896b64c86b Bart Van Assche 2024-07-12  1870  static int ibmvscsi_device_configure(struct scsi_device *sdev,
74de896b64c86b Bart Van Assche 2024-07-12  1871  				     struct queue_limits *lim)
0979c84b4affaf Robert Jennings 2007-03-29 @1872  {
0979c84b4affaf Robert Jennings 2007-03-29  1873  	struct Scsi_Host *shost = sdev->host;
0979c84b4affaf Robert Jennings 2007-03-29  1874  	unsigned long lock_flags = 0;
0979c84b4affaf Robert Jennings 2007-03-29  1875  
0979c84b4affaf Robert Jennings 2007-03-29  1876  	spin_lock_irqsave(shost->host_lock, lock_flags);
d1a357fcc8348d Brian King      2007-10-25  1877  	if (sdev->type == TYPE_DISK) {
0979c84b4affaf Robert Jennings 2007-03-29  1878  		sdev->allow_restart = 1;
e1a5ce5b88d063 Robert Jennings 2009-06-08  1879  		blk_queue_rq_timeout(sdev->request_queue, 120 * HZ);
d1a357fcc8348d Brian King      2007-10-25  1880  	}
0979c84b4affaf Robert Jennings 2007-03-29  1881  	spin_unlock_irqrestore(shost->host_lock, lock_flags);
0979c84b4affaf Robert Jennings 2007-03-29  1882  	return 0;
0979c84b4affaf Robert Jennings 2007-03-29  1883  }
0979c84b4affaf Robert Jennings 2007-03-29  1884  

:::::: The code at line 1872 was first introduced by commit
:::::: 0979c84b4affaf924a894380dd0069638b64de03 [SCSI] ibmvscsi: add slave_configure to allow device restart

:::::: TO: Robert Jennings <rcj@linux.vnet.ibm.com>
:::::: CC: James Bottomley <jejb@mulgrave.il.steeleye.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
