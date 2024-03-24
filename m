Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4AD1841
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711302286; cv=none; b=aQIHtyeA6wNJpgh5BeafmXvMj6P11gmg0uSwPxbaIRFJ4nMkzsZoK9SNOjsH2RY0/s+crDcs7pZw14eeJ7MsBNjbfOA7apf/IpdHHONBiznWbN8HNkBwDfRPNKQQvcZ3+FX++PR47GYNtIgKNhaSaZlAcRJHEtXyslPzsKFIZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711302286; c=relaxed/simple;
	bh=zhS/1TVXxK53RBWe+bs9e36SKFb7qml0gTUXGUmT16A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQu/A5KFxj6qvVlscBorr075R8vmS75//2z+T7JzzYDG2tR1E6E92imV1eJUExLuQCh0LPZXC9ORs72lDjQo/Aba03aIuSmbgGnFJxJUgBgmvQF0WSE5LVpERcCEqW0LHgNHmMOD64GLauv5PBwe+3buhlM6NXra/T4+lPmtvQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LW20LxRL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LW20LxRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711302281; x=1742838281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhS/1TVXxK53RBWe+bs9e36SKFb7qml0gTUXGUmT16A=;
  b=LW20LxRLPJcRsnx5tcaCI8sIOUg8Vhx1uusTv2tubXYJh8jcj3Yle40C
   p/14sOJjGPCnZ1m4jwtBzsrjkHkeeNcxOPpQ2/zRVbEbzZdqPU+5egWE+
   en39/WkU2e3Sl57zh32hTERtXsniWddUehez0HG5FY4lb0HXbdYKjPP04
   pmakU7NRXjJ5GyVnSqFA75WDlCjEPleDelJN8ux5UdPZ6iK0Ru6lHWngI
   rplbhgNrN7IepKndZIfYXB3zCNF8xlNuuRkFYXleGF04C6g++P83vGlso
   RCvElOxXQYMkOTwuzUdrzgcNJoI+mTbR6pk2LnLfjog1GIm/G6zVKepb7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6485465"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="6485465"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 10:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="16060792"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2024 10:44:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roRte-000Lwt-3A;
	Sun, 24 Mar 2024 17:44:38 +0000
Date: Mon, 25 Mar 2024 01:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-limits 20/23] drivers/ata/libata-scsi.c:1148:
 warning: Function parameter or struct member 'lim' not described in
 'ata_scsi_device_configure'
Message-ID: <202403250122.ivMpHwy6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git scsi-limits
head:   e1afdd1dd5ce00bcc56acd32a4554df418477555
commit: 1d2296d51677f5461596f2d1570fd3ed08a9470e [20/23] libata: switch to using ->device_configure
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240325/202403250122.ivMpHwy6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403250122.ivMpHwy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403250122.ivMpHwy6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ata/libata-scsi.c:1148: warning: Function parameter or struct member 'lim' not described in 'ata_scsi_device_configure'


vim +1148 drivers/ata/libata-scsi.c

fb99ef17865035a drivers/ata/libata-scsi.c  Damien Le Moal    2023-08-25  1133  
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1134  /**
1d2296d51677f54 drivers/ata/libata-scsi.c  Christoph Hellwig 2024-03-21  1135   *	ata_scsi_device_configure - Set SCSI device attributes
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1136   *	@sdev: SCSI device to examine
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1137   *
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1138   *	This is called before we actually start reading
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1139   *	and writing to the device, to configure certain
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1140   *	SCSI mid-layer behaviors.
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1141   *
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1142   *	LOCKING:
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1143   *	Defined by SCSI layer.  We don't really care.
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1144   */
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1145  
1d2296d51677f54 drivers/ata/libata-scsi.c  Christoph Hellwig 2024-03-21  1146  int ata_scsi_device_configure(struct scsi_device *sdev,
1d2296d51677f54 drivers/ata/libata-scsi.c  Christoph Hellwig 2024-03-21  1147  		struct queue_limits *lim)
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17 @1148  {
315343637b988ac drivers/scsi/libata-scsi.c Tejun Heo         2006-05-31  1149  	struct ata_port *ap = ata_shost_to_port(sdev->host);
315343637b988ac drivers/scsi/libata-scsi.c Tejun Heo         2006-05-31  1150  	struct ata_device *dev = __ata_scsi_find_dev(ap, sdev);
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1151  
315343637b988ac drivers/scsi/libata-scsi.c Tejun Heo         2006-05-31  1152  	if (dev)
1d2296d51677f54 drivers/ata/libata-scsi.c  Christoph Hellwig 2024-03-21  1153  		return ata_scsi_dev_config(sdev, lim, dev);
a6cce2a79deefb3 drivers/scsi/libata-scsi.c Brian King        2006-03-17  1154  
fb99ef17865035a drivers/ata/libata-scsi.c  Damien Le Moal    2023-08-25  1155  	return 0;
^1da177e4c3f415 drivers/scsi/libata-scsi.c Linus Torvalds    2005-04-16  1156  }
1d2296d51677f54 drivers/ata/libata-scsi.c  Christoph Hellwig 2024-03-21  1157  EXPORT_SYMBOL_GPL(ata_scsi_device_configure);
^1da177e4c3f415 drivers/scsi/libata-scsi.c Linus Torvalds    2005-04-16  1158  

:::::: The code at line 1148 was first introduced by commit
:::::: a6cce2a79deefb33354561a064f0609a3b342829 [PATCH] libata: ata_scsi_slave_config cleanup

:::::: TO: Brian King <brking@us.ibm.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
