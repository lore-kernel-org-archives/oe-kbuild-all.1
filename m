Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C215624B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765650735; cv=none; b=BcGTTOrLJYUxFDm8Qv/FOa/YKr0T+AajR0VSM30mPMoDDW3uAp1t8ruob5wUqXXFvDLCD1/oqG5IszJ1K9OREdzCxtaBYIHdcxepXokLd0a7O5PXWXeys4bD/4aS7nLEVQ76tnup9xaBpml0cTqdtsKc1VYrfhqtROTGLpXwYig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765650735; c=relaxed/simple;
	bh=tEmw8gqn0fkBfRS7Pjrtfg7oorGtT3dVlglUe1cIDWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkxdMBuGa57pTPTqv/3WaaFkfMx5B2rLO5GzzvK3qkYrheqQJMxYzszxI+VPSxY/XXqQtjdh8eF6/sI4t4qjCxVSZOa3ROdDns2Tndenpb4aXYw6lDs9du3gAeYbtOEB3223ecMZHleEI5Bu2LOakxSOvqICtIDr/IlFMW7nzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWKTw7T5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWKTw7T5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765650734; x=1797186734;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tEmw8gqn0fkBfRS7Pjrtfg7oorGtT3dVlglUe1cIDWU=;
  b=TWKTw7T5SgbACP/9CWgvzLBZ+3jLLY39NihxcXZU9/K1j2APF6jy7CIG
   Mirn0HJKItbcVKoOew4UaW4+0hM4FbVWoDCY3xHQ5Y+GijxybsBL1X7uX
   B13m1gzV1OUjDWQl/5YOEWqGZILt5cNxhI8H5NMq1nbQpKktwFY54eAhj
   NcoK+bRYKLflXoq8abhkxZde14betZFEucyleut4UjYU/SpcO4l9wQnib
   8xMyBliC9K95VR6CLiH9GLXm8RbMy5VP3Pmib8LkuohKsinJN+6XjTssB
   Gj2l6AVRztO0g2OHyMh274Z/S1VDQmtRJYMB3Y5Z860F/5v4zN+kI1BGQ
   g==;
X-CSE-ConnectionGUID: TIMtlaGtTcGVLFevT1tNsQ==
X-CSE-MsgGUID: Hbkk5eNrRa+xqjn6Woh21A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67775786"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67775786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:32:13 -0800
X-CSE-ConnectionGUID: Dnzwt2qxTYWDRbvD27YSvQ==
X-CSE-MsgGUID: 1HqkHOBRTvK6vSseNWqcog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197621440"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 10:32:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUPZ-00000000845-2Yc7;
	Sat, 13 Dec 2025 18:32:09 +0000
Date: Sun, 14 Dec 2025 02:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 2/2]
 drivers/firmware/turris-mox-rwtm.c:244:90: warning: '%08x' directive writing
 8 bytes into a region of size between 7 and 9
Message-ID: <202512140243.2cpIy03z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   16188c9444ac9af88549d1db5dfe7760418a22b7
commit: a79f256fc99d6d7aa4a8c738c28cc876e5ef1435 [2/2] firmware: turris-mox-rwtm: Deduplicate command execution code
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140243.2cpIy03z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140243.2cpIy03z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140243.2cpIy03z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/turris-mox-rwtm.c: In function 'mox_get_board_info':
>> drivers/firmware/turris-mox-rwtm.c:244:90: warning: '%08x' directive writing 8 bytes into a region of size between 7 and 9 [-Wformat-overflow=]
     244 |                         "%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
         |                                                                                          ^~~~
   drivers/firmware/turris-mox-rwtm.c:243:17: note: 'sprintf' output between 135 and 137 bytes into a destination of size 135
     243 |                 sprintf(rwtm->pubkey,
         |                 ^~~~~~~~~~~~~~~~~~~~~
     244 |                         "%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     245 |                         ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     246 |                         s[8], s[9], s[10], s[11], s[12], s[13], s[14], s[15]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +244 drivers/firmware/turris-mox-rwtm.c

389711b3749399 Marek Behún 2019-08-22  197  
389711b3749399 Marek Behún 2019-08-22  198  static int mox_get_board_info(struct mox_rwtm *rwtm)
389711b3749399 Marek Behún 2019-08-22  199  {
ed09d6d4f59386 Marek Behún 2024-08-31  200  	struct device *dev = rwtm_dev(rwtm);
389711b3749399 Marek Behún 2019-08-22  201  	struct armada_37xx_rwtm_rx_msg *reply = &rwtm->reply;
389711b3749399 Marek Behún 2019-08-22  202  	int ret;
389711b3749399 Marek Behún 2019-08-22  203  
a79f256fc99d6d Marek Behún 2024-08-31  204  	ret = mox_rwtm_exec(rwtm, MBOX_CMD_BOARD_INFO, NULL, false);
72f99888944c44 Marek Behún 2021-05-20  205  	if (ret == -ENODATA) {
ed09d6d4f59386 Marek Behún 2024-08-31  206  		dev_warn(dev,
389711b3749399 Marek Behún 2019-08-22  207  			 "Board does not have manufacturing information burned!\n");
8a4853a65b8824 Marek Behún 2024-08-31  208  	} else if (ret == -EOPNOTSUPP) {
ed09d6d4f59386 Marek Behún 2024-08-31  209  		dev_notice(dev,
72f99888944c44 Marek Behún 2021-05-20  210  			   "Firmware does not support the BOARD_INFO command\n");
72f99888944c44 Marek Behún 2021-05-20  211  	} else if (ret < 0) {
72f99888944c44 Marek Behún 2021-05-20  212  		return ret;
389711b3749399 Marek Behún 2019-08-22  213  	} else {
389711b3749399 Marek Behún 2019-08-22  214  		rwtm->serial_number = reply->status[1];
389711b3749399 Marek Behún 2019-08-22  215  		rwtm->serial_number <<= 32;
389711b3749399 Marek Behún 2019-08-22  216  		rwtm->serial_number |= reply->status[0];
389711b3749399 Marek Behún 2019-08-22  217  		rwtm->board_version = reply->status[2];
389711b3749399 Marek Behún 2019-08-22  218  		rwtm->ram_size = reply->status[3];
389711b3749399 Marek Behún 2019-08-22  219  		reply_to_mac_addr(rwtm->mac_address1, reply->status[4],
389711b3749399 Marek Behún 2019-08-22  220  				  reply->status[5]);
389711b3749399 Marek Behún 2019-08-22  221  		reply_to_mac_addr(rwtm->mac_address2, reply->status[6],
389711b3749399 Marek Behún 2019-08-22  222  				  reply->status[7]);
b787a6b8928494 Marek Behún 2024-08-31  223  		rwtm->has_board_info = true;
389711b3749399 Marek Behún 2019-08-22  224  
389711b3749399 Marek Behún 2019-08-22  225  		pr_info("Turris Mox serial number %016llX\n",
389711b3749399 Marek Behún 2019-08-22  226  			rwtm->serial_number);
389711b3749399 Marek Behún 2019-08-22  227  		pr_info("           board version %i\n", rwtm->board_version);
389711b3749399 Marek Behún 2019-08-22  228  		pr_info("           burned RAM size %i MiB\n", rwtm->ram_size);
389711b3749399 Marek Behún 2019-08-22  229  	}
389711b3749399 Marek Behún 2019-08-22  230  
a79f256fc99d6d Marek Behún 2024-08-31  231  	ret = mox_rwtm_exec(rwtm, MBOX_CMD_ECDSA_PUB_KEY, NULL, false);
72f99888944c44 Marek Behún 2021-05-20  232  	if (ret == -ENODATA) {
ed09d6d4f59386 Marek Behún 2024-08-31  233  		dev_warn(dev, "Board has no public key burned!\n");
8a4853a65b8824 Marek Behún 2024-08-31  234  	} else if (ret == -EOPNOTSUPP) {
ed09d6d4f59386 Marek Behún 2024-08-31  235  		dev_notice(dev,
72f99888944c44 Marek Behún 2021-05-20  236  			   "Firmware does not support the ECDSA_PUB_KEY command\n");
72f99888944c44 Marek Behún 2021-05-20  237  	} else if (ret < 0) {
72f99888944c44 Marek Behún 2021-05-20  238  		return ret;
389711b3749399 Marek Behún 2019-08-22  239  	} else {
389711b3749399 Marek Behún 2019-08-22  240  		u32 *s = reply->status;
389711b3749399 Marek Behún 2019-08-22  241  
b787a6b8928494 Marek Behún 2024-08-31  242  		rwtm->has_pubkey = true;
389711b3749399 Marek Behún 2019-08-22  243  		sprintf(rwtm->pubkey,
389711b3749399 Marek Behún 2019-08-22 @244  			"%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
389711b3749399 Marek Behún 2019-08-22  245  			ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
389711b3749399 Marek Behún 2019-08-22  246  			s[8], s[9], s[10], s[11], s[12], s[13], s[14], s[15]);
389711b3749399 Marek Behún 2019-08-22  247  	}
389711b3749399 Marek Behún 2019-08-22  248  
389711b3749399 Marek Behún 2019-08-22  249  	return 0;
389711b3749399 Marek Behún 2019-08-22  250  }
389711b3749399 Marek Behún 2019-08-22  251  

:::::: The code at line 244 was first introduced by commit
:::::: 389711b374939968d2d0adede01b9e1f3bb4f531 firmware: Add Turris Mox rWTM firmware driver

:::::: TO: Marek Behún <marek.behun@nic.cz>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
