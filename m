Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B417729
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 05:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712898335; cv=none; b=SkxNoY5yhovevMPJc0vOpPFlPDP4hYbSUhP5m0Cs+btnt0Jmb0NYFSkKcB5yPZMBVaOXnDZWZTCvnkJnCStOZ518kdDiFpHYP5a4jQUUcYq0/o4osc6xU/Q/BlPLjwKnAD4lqPmGTD0SzoOWaAkYEOceUAiz1g18DVHTZdnKheM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712898335; c=relaxed/simple;
	bh=TWaJ7P0BVA8vzolW3Ze5T8Xqg8z7pj81XJfyy4ToJes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iE4H/blOoWxo0jRvJcQBjz4AKO8YicZajY/MqRue+WKaoSnrOx2+df7aQNQjA31LLdwGu4xizkId2tY6ZGXDB6PLhdThalm44u5L9RUgpjsnz61G45MKtHFTok1WIG6rP0ekGOb78I2VHmKuX6V6n97JjthLfK/OuOuKMpqlTDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1U4XS/h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1U4XS/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712898333; x=1744434333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TWaJ7P0BVA8vzolW3Ze5T8Xqg8z7pj81XJfyy4ToJes=;
  b=C1U4XS/hZ/DV++zCK6FSb8wzQdIp3qMUhkoDSeX1rzQdh33oOc+0Is01
   ls7QvyqH55nE9UX930Etq5piEbIyM7xkM0oD34bFB6sOMRc32E5DmMegX
   MGXN2PhpeegGNA5fUylcJu6Acwjul6xGYum2v5egW9BVs/QJj2EEcLc4e
   LzLnxe3TwupozOw5KoBD4cZTkQX2xrD1GHWjm4BSirh9ELkwI7qrVr6K/
   ANBNBzZzd3n0BnkR9S4VFUj0FQOPWVMkx5bdsrdeskqKrdivC/pTlJfpk
   Hkj7OINi1lcYuiTCs5/tjkKkkOm4RHRGn+V8DxemafwgU6iyQWpfCmOvj
   Q==;
X-CSE-ConnectionGUID: NCAigx1zQti5pMctK49oHQ==
X-CSE-MsgGUID: 6XtpYbqUR468Dfq3sstpVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12128175"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="12128175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 22:05:32 -0700
X-CSE-ConnectionGUID: ssN/gshhSzK/XZMNzv2tKA==
X-CSE-MsgGUID: fRK1JRDQTBeFEu2/0ktHXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25663528"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2024 22:05:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv96O-0009OZ-0D;
	Fri, 12 Apr 2024 05:05:28 +0000
Date: Fri, 12 Apr 2024 13:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	John Garry <john.g.garry@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [mkp-scsi:for-next 112/118] drivers/usb/storage/uas.c:828:3: error:
 implicit declaration of function 'blk_queue_max_hw_sectors'; did you mean
 'queue_max_hw_sectors'?
Message-ID: <202404121247.ENzXU1Eu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   8e50d1ee8f4cdae5cba87b93de4819feb79bd049
commit: a2ad002485c492354d572d743f60af0057ebe04e [112/118] scsi: block: Remove now unused queue limits helpers
config: i386-buildonly-randconfig-001-20240412 (https://download.01.org/0day-ci/archive/20240412/202404121247.ENzXU1Eu-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121247.ENzXU1Eu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121247.ENzXU1Eu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/storage/uas.c: In function 'uas_slave_alloc':
>> drivers/usb/storage/uas.c:828:3: error: implicit declaration of function 'blk_queue_max_hw_sectors'; did you mean 'queue_max_hw_sectors'? [-Werror=implicit-function-declaration]
      blk_queue_max_hw_sectors(sdev->request_queue, 64);
      ^~~~~~~~~~~~~~~~~~~~~~~~
      queue_max_hw_sectors
   cc1: some warnings being treated as errors


vim +828 drivers/usb/storage/uas.c

1363074667a6b7 Hans de Goede      2016-04-12  819  
115bb1ffa54c39 Matthew Wilcox     2010-10-07  820  static int uas_slave_alloc(struct scsi_device *sdev)
115bb1ffa54c39 Matthew Wilcox     2010-10-07  821  {
ee136af4a064c2 Hans de Goede      2015-04-21  822  	struct uas_dev_info *devinfo =
ee136af4a064c2 Hans de Goede      2015-04-21  823  		(struct uas_dev_info *)sdev->host->hostdata;
ee136af4a064c2 Hans de Goede      2015-04-21  824  
ee136af4a064c2 Hans de Goede      2015-04-21  825  	sdev->hostdata = devinfo;
37599f9603bed3 Hans de Goede      2013-11-15  826  
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04  827  	if (devinfo->flags & US_FL_MAX_SECTORS_64)
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04 @828  		blk_queue_max_hw_sectors(sdev->request_queue, 64);
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04  829  	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04  830  		blk_queue_max_hw_sectors(sdev->request_queue, 240);
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04  831  
115bb1ffa54c39 Matthew Wilcox     2010-10-07  832  	return 0;
115bb1ffa54c39 Matthew Wilcox     2010-10-07  833  }
115bb1ffa54c39 Matthew Wilcox     2010-10-07  834  

:::::: The code at line 828 was first introduced by commit
:::::: d5c65d32dc240bf600d9e54250a8133e93ece60a Revert "uas: fix sdev->host->dma_dev"

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
