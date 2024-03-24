Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F233D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711256071; cv=none; b=eopu+YLCT4lwLtnyXxk6Oaa7E+I6TSeLD2PXFE5hmbyVe2/lWACY1hr8W+fy80UkAqJ4PXfdZeEWCcA7dO8mihNMQJJRvwZvQzejitoi88SlbFYR27opmITPRznIeM5W9WKDCas3g8UD8kZlyWkjaw/s0739xpci4JgstncAD3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711256071; c=relaxed/simple;
	bh=fQotmcxZBpi9QJswFVuGYvHC1d+HooV3pFpuNdeMaGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VY6axRcU2j69EeOVorPXllX0wQCuADfF1FZn1SyKMryHN6dB7Zpq2E8nAFYdbXTFa6vctpSzY0b2NzlVeSdHfWnfnq8OLNpnyr5h+rTNH7WbvOMtacrJ3QOgO3MFQ1wNpEDSZxlbSgfXB/Vf12hcPmsPG3FOvA9lgofX0jCn2fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCjT+QTS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCjT+QTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711256068; x=1742792068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fQotmcxZBpi9QJswFVuGYvHC1d+HooV3pFpuNdeMaGw=;
  b=lCjT+QTSjuXk9g5Hqi4By5yUQegi/KYIDl9GTgNOz4Xc6t9I22b+MI8c
   +EVr20txJieH13TzRIWean7DmS9+1nQ3r+WWeEM3BgxzTOVbqdJRNozno
   SHot5HuEY9GwrN8CcDA5IGOZxF6FuPqkaXkbcq40tJ7kvxgmDDVQBxNT/
   8eGYDsya5a0r5Hahj5UCMNZLJTYXPSO/kMsZ/yntN7BcaUqgIidPzvZ6k
   mq5i9S/BXvvwonwmYhbHERx9avnCS0W2FpfdDXYSyxbPKUfsU9OYYVDFh
   iRh35emKTZbu2sa7WlJ+0rjboGVni0cTgxu8RHU9lpofAOlnf3KE9/QiU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6480724"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="6480724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 21:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="19968847"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2024 21:54:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roFsG-000LfX-06;
	Sun, 24 Mar 2024 04:54:24 +0000
Date: Sun, 24 Mar 2024 12:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-limits 21/23] drivers/scsi/mpi3mr/mpi3mr_os.c:4410:
 warning: Function parameter or struct member 'lim' not described in
 'mpi3mr_device_configure'
Message-ID: <202403241202.Tku6ldDi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git scsi-limits
head:   d56272297e728376fca28b0998de7fe9642c6dee
commit: a8bd9ccf6a1fe10cdc3c835d834b0d07568325eb [21/23] mpi3mr: switch to using ->device_configure
config: arm-randconfig-002-20240324 (https://download.01.org/0day-ci/archive/20240324/202403241202.Tku6ldDi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241202.Tku6ldDi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241202.Tku6ldDi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpi3mr/mpi3mr_os.c:4410: warning: Function parameter or struct member 'lim' not described in 'mpi3mr_device_configure'


vim +4410 drivers/scsi/mpi3mr/mpi3mr_os.c

824a156633dfdb Kashyap Desai     2021-05-20  4398  
824a156633dfdb Kashyap Desai     2021-05-20  4399  /**
a8bd9ccf6a1fe1 Christoph Hellwig 2024-03-23  4400   * mpi3mr_device_configure - Slave configure callback handler
824a156633dfdb Kashyap Desai     2021-05-20  4401   * @sdev: SCSI device reference
824a156633dfdb Kashyap Desai     2021-05-20  4402   *
824a156633dfdb Kashyap Desai     2021-05-20  4403   * Configure queue depth, max hardware sectors and virt boundary
824a156633dfdb Kashyap Desai     2021-05-20  4404   * as required
824a156633dfdb Kashyap Desai     2021-05-20  4405   *
824a156633dfdb Kashyap Desai     2021-05-20  4406   * Return: 0 always.
824a156633dfdb Kashyap Desai     2021-05-20  4407   */
a8bd9ccf6a1fe1 Christoph Hellwig 2024-03-23  4408  static int mpi3mr_device_configure(struct scsi_device *sdev,
a8bd9ccf6a1fe1 Christoph Hellwig 2024-03-23  4409  		struct queue_limits *lim)
824a156633dfdb Kashyap Desai     2021-05-20 @4410  {
13ef29ea4aa065 Kashyap Desai     2021-05-20  4411  	struct scsi_target *starget;
13ef29ea4aa065 Kashyap Desai     2021-05-20  4412  	struct Scsi_Host *shost;
13ef29ea4aa065 Kashyap Desai     2021-05-20  4413  	struct mpi3mr_ioc *mrioc;
626665e9c38d3d Sreekanth Reddy   2022-08-04  4414  	struct mpi3mr_tgt_dev *tgt_dev = NULL;
13ef29ea4aa065 Kashyap Desai     2021-05-20  4415  	unsigned long flags;
824a156633dfdb Kashyap Desai     2021-05-20  4416  	int retval = 0;
626665e9c38d3d Sreekanth Reddy   2022-08-04  4417  	struct sas_rphy *rphy = NULL;
13ef29ea4aa065 Kashyap Desai     2021-05-20  4418  
13ef29ea4aa065 Kashyap Desai     2021-05-20  4419  	starget = scsi_target(sdev);
13ef29ea4aa065 Kashyap Desai     2021-05-20  4420  	shost = dev_to_shost(&starget->dev);
13ef29ea4aa065 Kashyap Desai     2021-05-20  4421  	mrioc = shost_priv(shost);
13ef29ea4aa065 Kashyap Desai     2021-05-20  4422  
13ef29ea4aa065 Kashyap Desai     2021-05-20  4423  	spin_lock_irqsave(&mrioc->tgtdev_lock, flags);
626665e9c38d3d Sreekanth Reddy   2022-08-04  4424  	if (starget->channel == mrioc->scsi_device_channel)
13ef29ea4aa065 Kashyap Desai     2021-05-20  4425  		tgt_dev = __mpi3mr_get_tgtdev_by_perst_id(mrioc, starget->id);
626665e9c38d3d Sreekanth Reddy   2022-08-04  4426  	else if (mrioc->sas_transport_enabled && !starget->channel) {
626665e9c38d3d Sreekanth Reddy   2022-08-04  4427  		rphy = dev_to_rphy(starget->dev.parent);
626665e9c38d3d Sreekanth Reddy   2022-08-04  4428  		tgt_dev = __mpi3mr_get_tgtdev_by_addr_and_rphy(mrioc,
626665e9c38d3d Sreekanth Reddy   2022-08-04  4429  		    rphy->identify.sas_address, rphy);
626665e9c38d3d Sreekanth Reddy   2022-08-04  4430  	}
13ef29ea4aa065 Kashyap Desai     2021-05-20  4431  	spin_unlock_irqrestore(&mrioc->tgtdev_lock, flags);
13ef29ea4aa065 Kashyap Desai     2021-05-20  4432  	if (!tgt_dev)
13ef29ea4aa065 Kashyap Desai     2021-05-20  4433  		return -ENXIO;
13ef29ea4aa065 Kashyap Desai     2021-05-20  4434  
0ea177343f1f8a Kashyap Desai     2021-05-20  4435  	mpi3mr_change_queue_depth(sdev, tgt_dev->q_depth);
1aa529d400253e Sreekanth Reddy   2022-05-06  4436  
1aa529d400253e Sreekanth Reddy   2022-05-06  4437  	sdev->eh_timeout = MPI3MR_EH_SCMD_TIMEOUT;
1aa529d400253e Sreekanth Reddy   2022-05-06  4438  	blk_queue_rq_timeout(sdev->request_queue, MPI3MR_SCMD_TIMEOUT);
1aa529d400253e Sreekanth Reddy   2022-05-06  4439  
a8bd9ccf6a1fe1 Christoph Hellwig 2024-03-23  4440  	mpi3mr_configure_tgt_dev(tgt_dev, lim);
13ef29ea4aa065 Kashyap Desai     2021-05-20  4441  	mpi3mr_tgtdev_put(tgt_dev);
824a156633dfdb Kashyap Desai     2021-05-20  4442  	return retval;
824a156633dfdb Kashyap Desai     2021-05-20  4443  }
824a156633dfdb Kashyap Desai     2021-05-20  4444  

:::::: The code at line 4410 was first introduced by commit
:::::: 824a156633dfdb0e17979a0d0bb2c757d1bb949c scsi: mpi3mr: Base driver code

:::::: TO: Kashyap Desai <kashyap.desai@broadcom.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
