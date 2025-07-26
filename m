Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39BC2AD0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753528233; cv=none; b=B8jr+9sYl0NH5B3iLa/QArmMsmxtwV2NwX4tCP0D0ExC82foJIonFJWDKbimlmx48QnJgHbCLBj6IpmNYavv9X6XY1cCOvCJ1UPBos3y1s6wbRamvxGFmO2OXEbQ360p7oW8Nb2W/fGDfjGTdvGCUwYtTKRtLG+jRS3fTzWk2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753528233; c=relaxed/simple;
	bh=WSPOVCeN4SCu2D+96J9uHHqZFiHoz7qUqjLGrDCfMj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpaRdFxjrVLfKR5P2KbYajF8oou5SW037Jf9G52I5o3ivUgLoUB4sRRs/HkraGZHRB5DDALQhTskiezSB/dghpMEInWb/6vAqJR8D46RHcCj1rAXdMJt8FzK9iP8qi4Vc2lNbVBT8VpIBXUyBBOLTQeM2Sfc62mUxWM62fe8HcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gou5kkWC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gou5kkWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753528231; x=1785064231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WSPOVCeN4SCu2D+96J9uHHqZFiHoz7qUqjLGrDCfMj4=;
  b=gou5kkWCMzTbgGJ2ugTX816W1YVEELybiMB/WtBuVZuYwjU3wFXvoLi1
   0+jNQXbUYiIbug62dzJqiIQTz7b7VjJ7aD12eQUCIZvmxB/saMLoxDiyz
   0nF3fH+S5RRROi1nO+eRhPAbLEUc3XqG/TndVuqoDxYde0GFfMb61CYBB
   QFS5XJeuIJnWBBe0s9i9THvE271g2CwGW2rNwHIFBtSH/S3BuLBhEn+W+
   MebxGz1IVwKqqxYbwQqO5+5R+MEzTT/V0r1Lj7/byhkzn6bJAV1p/otzw
   TDoVslcuLo/HImhQL8YWq/H+uHUs9k6etRLAqcknh5BJ0CQzCx5o4If3r
   w==;
X-CSE-ConnectionGUID: IeaM7XpaSG6ZLj5GoNwRjA==
X-CSE-MsgGUID: LmidrOABT9SqZpG3KKMcWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55057919"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55057919"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:10:31 -0700
X-CSE-ConnectionGUID: H/QDkeWuQMu7DEY4geB7ug==
X-CSE-MsgGUID: OSdDlJSUTNyO2IJv4HK9EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192442296"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 04:10:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcnM-000Luy-0v;
	Sat, 26 Jul 2025 11:10:28 +0000
Date: Sat, 26 Jul 2025 19:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy 12/17]
 drivers/nfc/s3fwrn5/uart.c:96:31: error: implicit declaration of function
 'devm_gpiod_get'; did you mean 'em_pd_get'?
Message-ID: <202507261906.kb1AUVrX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy
head:   4e4c7ea9fe529fa8e413fd35d3b5e3357fc45cc8
commit: 4f7811c404ced1935fcc5336ab855e155f009796 [12/17] nfc: s3fwrn5: convert to gpio descriptors
config: um-randconfig-002-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261906.kb1AUVrX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261906.kb1AUVrX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261906.kb1AUVrX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
>> drivers/nfc/s3fwrn5/uart.c:96:31: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'em_pd_get'? [-Werror=implicit-function-declaration]
      96 |         phy->common.gpio_en = devm_gpiod_get(dev, "en", GPIOD_OUT_HIGH);
         |                               ^~~~~~~~~~~~~~
         |                               em_pd_get
>> drivers/nfc/s3fwrn5/uart.c:96:57: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function)
      96 |         phy->common.gpio_en = devm_gpiod_get(dev, "en", GPIOD_OUT_HIGH);
         |                                                         ^~~~~~~~~~~~~~
   drivers/nfc/s3fwrn5/uart.c:96:57: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nfc/s3fwrn5/uart.c:100:64: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
     100 |         phy->common.gpio_fw_wake = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
         |                                                                ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/nfc/s3fwrn5/phy_common.c: In function 's3fwrn5_phy_set_wake':
>> drivers/nfc/s3fwrn5/phy_common.c:22:9: error: implicit declaration of function 'gpiod_set_value' [-Werror=implicit-function-declaration]
      22 |         gpiod_set_value(phy->gpio_fw_wake, wake);
         |         ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +96 drivers/nfc/s3fwrn5/uart.c

    90	
    91	static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
    92	{
    93		struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
    94		struct device *dev = &serdev->dev;
    95	
  > 96		phy->common.gpio_en = devm_gpiod_get(dev, "en", GPIOD_OUT_HIGH);
    97		if (IS_ERR(phy->common.gpio_en))
    98			return PTR_ERR(phy->common.gpio_en);
    99	
 > 100		phy->common.gpio_fw_wake = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
   101		if (IS_ERR(phy->common.gpio_fw_wake))
   102			return PTR_ERR(phy->common.gpio_fw_wake);
   103	
   104		return 0;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
