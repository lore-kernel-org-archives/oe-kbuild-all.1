Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B245007
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 03:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728011044; cv=none; b=QJzz2F7nxvFvVCsGo3dwtxOyO04u53AqWxwKvPPdvXc5aVR0BhROhVXPPLDAiCyqINyk0r4ITn4fDhB3sqLr2HSU+1Q/SV5hgM3IH63px3J3WYVpQ6h/H1Fld1Z+lArSP/g7blQPFpBN75wRYyafSSOA89+O1BbeG9k16MbUR5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728011044; c=relaxed/simple;
	bh=NaJkEFpXgMl+EWjeMu0ljKKxLgEHkELiNAw/mOTRN6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EWB4jAzsDXFeUncnrLohWQev2RSQYtfVTh/bzLREedb/Btd5zcbqq9g3Kl34EpU2Z9qImxMmm1RGkh8J7dUBMOF3WSXUGGcUa8wuvpzbULkwCpGE/E378I1JNwD+Xg81sR+yExfNMVkLdARHPvLFaZOr+s8m2scMmhkKFmxk8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvO/NWhk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvO/NWhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728011042; x=1759547042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NaJkEFpXgMl+EWjeMu0ljKKxLgEHkELiNAw/mOTRN6M=;
  b=NvO/NWhkMCZGNpg8qccTYjGIS2zjR3dTvsnmrEH7hJY556zSCKWYOuDg
   XzJZkQHENyDIewerzrLq7ToCz1MIVcvxzUj5Gun+gKlSFIM7wxFB7H/+h
   /24IDxrpVYBeY8h7iNJ5omFGq8YY+TqKs/11SibAqI9d54ZTC3e5q/PrI
   mpfB0lMpgutxKr4d95U0EnQ6fZMr7GaaFQUtPCC4j7kw7rqFu7AJS9hvc
   H52CwmegC1VyFYkKzSs10cNzmU8v7qUu+4EXRZaSvx68ay2aVul+5O82P
   DLntTWIZ3x1m7L9eAttGnCM4x24+E18zMcYOIX2bwFxw4xcKLTbcxySb2
   Q==;
X-CSE-ConnectionGUID: sYvCIhesTYaTa5p+YtPNLw==
X-CSE-MsgGUID: qTqgzvjRSF2bWUm106x3BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27357156"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27357156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:04:02 -0700
X-CSE-ConnectionGUID: DdZdQtZNQwu8WorYcCJygQ==
X-CSE-MsgGUID: j4zNKV51STyNI4fkByHQAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="105413537"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2024 20:04:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swYbl-00019k-2g;
	Fri, 04 Oct 2024 03:03:57 +0000
Date: Fri, 4 Oct 2024 11:03:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-remove-slave-configure 20/22]
 drivers/scsi/ibmvscsi/ibmvfc.c:3455: warning: Function parameter or struct
 member 'lim' not described in 'ibmvfc_sdev_configure'
Message-ID: <202410041113.Cfkm7Itc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-remove-slave-configure
head:   b90cfbaefd9dbd694b42fdd1961da3869cca2bf4
commit: 7d0f324c1e0eb1a57b8fb7fa99a42c0c3fa03652 [20/22] scsi: Convert SCSI drivers to .sdev_configure()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410041113.Cfkm7Itc-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041113.Cfkm7Itc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041113.Cfkm7Itc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ibmvscsi/ibmvfc.c:3455: warning: Function parameter or struct member 'lim' not described in 'ibmvfc_sdev_configure'


vim +3455 drivers/scsi/ibmvscsi/ibmvfc.c

ad8dcffaf9bc1d Brian King      2008-10-29  3442  
072b91f9c6510d Brian King      2008-07-01  3443  /**
7d0f324c1e0eb1 Bart Van Assche 2024-07-12  3444   * ibmvfc_sdev_configure - Configure the device
072b91f9c6510d Brian King      2008-07-01  3445   * @sdev:	struct scsi_device device to configure
072b91f9c6510d Brian King      2008-07-01  3446   *
072b91f9c6510d Brian King      2008-07-01  3447   * Enable allow_restart for a device if it is a disk. Adjust the
072b91f9c6510d Brian King      2008-07-01  3448   * queue_depth here also.
072b91f9c6510d Brian King      2008-07-01  3449   *
072b91f9c6510d Brian King      2008-07-01  3450   * Returns:
072b91f9c6510d Brian King      2008-07-01  3451   *	0
072b91f9c6510d Brian King      2008-07-01  3452   **/
7d0f324c1e0eb1 Bart Van Assche 2024-07-12  3453  static int ibmvfc_sdev_configure(struct scsi_device *sdev,
7d0f324c1e0eb1 Bart Van Assche 2024-07-12  3454  				 struct queue_limits *lim)
072b91f9c6510d Brian King      2008-07-01 @3455  {
072b91f9c6510d Brian King      2008-07-01  3456  	struct Scsi_Host *shost = sdev->host;
072b91f9c6510d Brian King      2008-07-01  3457  	unsigned long flags = 0;
072b91f9c6510d Brian King      2008-07-01  3458  
072b91f9c6510d Brian King      2008-07-01  3459  	spin_lock_irqsave(shost->host_lock, flags);
764907293edc1a Brian King      2021-01-12  3460  	if (sdev->type == TYPE_DISK) {
072b91f9c6510d Brian King      2008-07-01  3461  		sdev->allow_restart = 1;
764907293edc1a Brian King      2021-01-12  3462  		blk_queue_rq_timeout(sdev->request_queue, 120 * HZ);
764907293edc1a Brian King      2021-01-12  3463  	}
072b91f9c6510d Brian King      2008-07-01  3464  	spin_unlock_irqrestore(shost->host_lock, flags);
072b91f9c6510d Brian King      2008-07-01  3465  	return 0;
072b91f9c6510d Brian King      2008-07-01  3466  }
072b91f9c6510d Brian King      2008-07-01  3467  

:::::: The code at line 3455 was first introduced by commit
:::::: 072b91f9c6510d0ec4a49d07dbc318760c7da7b3 [SCSI] ibmvfc: IBM Power Virtual Fibre Channel Adapter Client Driver

:::::: TO: Brian King <brking@linux.vnet.ibm.com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
