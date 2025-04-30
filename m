Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F27435961
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 01:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975205; cv=none; b=eu7v4d2HJS41UaCoTRR+wTy0sLej9GwU/fopyRK3TLs4WFnzmPZxixf1Nmkes4AnyCbTOd5qQ+rd19yb4cf8QJeaai/BjR0k9AvnY+aGMOdrVeZKD9dIc+hr3de2YignI3Wey/sq1FblqmyhUF/dQsoLxAUC1StS/RYNCesPgD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975205; c=relaxed/simple;
	bh=hNDbKAqkN6AWoHNFODKexG8eeFSvYZOolGxJ653tZnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HuFlvFAPN4z6vlkIn/W6EE1MI+ofLCz9RNdJT3ARw2l4JvznPJPS1oE8kn0VmJpABxcBbKk09M1ZQ6aZLHNwZ2xZNBGyhCtGhSQUNjAwGKZckUwLNOohR59MfoeWRfMTWBcXzUkgSNT2sEy5/urapwGNEvdC8iOc+CDiTJ0GSpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBWxaUE6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBWxaUE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745975202; x=1777511202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hNDbKAqkN6AWoHNFODKexG8eeFSvYZOolGxJ653tZnU=;
  b=IBWxaUE656rY1SSKDiun2tM4Z81TIYoSWCW427IfTrSTP+h9VOIFB6uS
   y/AIOAVQC9UWaR2MWnoNzjCFBSclXf2iJa8oFeynic71K2dsw3WhtlIh/
   frDXosTYzCb/gU6jBE34SJUg7SNcRcMUvHcY0Y67VciPnZSkbiu6+C5W3
   msSyCsaaTBuDdzlGPOeu/TdNptqq2E+TRonlu8MAIGGyWRt4dMO1AiKMW
   tBweeBxJ5Y2ORzTSnuDWdJP8WK4X08RgDc+Km5YFCVK/dYKwi8UcpJlV4
   ZB5ZokIPRPEc/Z946JkikYh8Ujw7CObz5l9tLYNe36UnapSKJvOYhVPxO
   A==;
X-CSE-ConnectionGUID: 7Usy8F2GS/GFaLcjFNuAGw==
X-CSE-MsgGUID: jO+HQj6tTe2W4vza37Vskw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47771287"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47771287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 18:06:41 -0700
X-CSE-ConnectionGUID: YE3zjStkQgyY7rdJ1MH0Zw==
X-CSE-MsgGUID: L7qGzGrlSAiRqaqZYHkwmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133688756"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2025 18:06:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9vuG-000341-2A;
	Wed, 30 Apr 2025 01:06:36 +0000
Date: Wed, 30 Apr 2025 09:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 2372/7105]
 arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i2c-gpio):
 Unevaluated properties are not allowed ('#address-cells', '#size-cells' were
 unexpected)
Message-ID: <202504300822.T7XznjYC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: dc658570a2c683219545f5ac133bd2ac21ad0938 [2372/7105] ARM: dts: at91: usb_a9g20: move wrong RTC node
config: arm-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300822.T7XznjYC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300822.T7XznjYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300822.T7XznjYC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/usb_a9g20.dtb: nand-controller (atmel,at91sam9260-nand-controller): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/usb_a9g20.dtb: nand-controller (atmel,at91sam9260-nand-controller): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i2c-gpio): 'sda-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i2c-gpio): 'scl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
>> arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
