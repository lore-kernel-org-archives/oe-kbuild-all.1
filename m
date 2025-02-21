Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A511209F33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740139097; cv=none; b=PKf/srlL1fQFoQXOm/QURPCx2vZmz1DMY7xHRokahGmHdBGAFMJYaadsoiIAXb/B/rQtuGtGmFr3iX3ko+zbaSJwPbzZtt36VApYSdCVIVnB7JisMsdpY2MoCdo/rZPu1kHb4U818ttcc5ov9nicSxBj2bkZBfhq2WnfdMbN+YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740139097; c=relaxed/simple;
	bh=fALUb78F8P70KlTgg2wn3jF4q9289n7M57FxUsF1SkE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQQBtiwjVCGSb643O1MABIGod89+4mro5DngxleOjWl5yznETgpBsbqsJskBkpWDKIKSCGecvAaDvHBxZNL914fCJ2+IiM+gp8M7Kn4W0Xn8/uTPfpK7mBdrwGkFO+4yUnpM+bZcVzEIV3yxhwPynuEEGZ1CjNDYsvBBPcP2vWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYyv1bTa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYyv1bTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740139096; x=1771675096;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fALUb78F8P70KlTgg2wn3jF4q9289n7M57FxUsF1SkE=;
  b=hYyv1bTayb32ISg0MGcobj6sMRObQQhBN/CFDQxo1AvN25NASvMn7UFD
   ObNx5j6o1rQX/MA7t0T+DzluPpZzOFceQ1tx/BHD16QON6waKr1dHymDU
   KUirneq9BjKC6MJjnVbFlEwG0JllzLQKsr+wa2knanyil4Xk36ru/XYm8
   WIGdNExwuCKAEENVyLBFpPxewzDYl0QUwSs033vypvOktBDyTHus4xeYC
   bUnFo85GMrGzvjaxc9GPSbgX3UraeS0/h4WvI+wnIYOXHa1PNqFH5FNWt
   p74SPVM6gp68nSrub2Jf/xsX/R7xfDaXldJ6k2EVlZuS6pPewhASNQtK1
   g==;
X-CSE-ConnectionGUID: kLd3FdbZS12rWsVNLPr3KQ==
X-CSE-MsgGUID: yg+NGh6+Rh2ibwoDObTZzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40668015"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40668015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:58:15 -0800
X-CSE-ConnectionGUID: gKfiOx9UQ564lAa32rIobw==
X-CSE-MsgGUID: 6Vhs+6cXR3Kr48v8vI9PFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="120455857"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Feb 2025 03:58:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlRfX-0005TL-36
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 11:58:11 +0000
Date: Fri, 21 Feb 2025 19:57:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1]
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts:16.9-19.4: Warning
 (unit_address_vs_reg): /memory: node has a reg or ranges property, but no
 unit name
Message-ID: <202502211959.29EEwfoK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 33067418cedd3a20ef5948bf7f3747dc4906f602 [1/1] Merge tag 'arm-soc/for-5.1/devicetree' of https://github.com/Broadcom/stblinux into arm/dt
config: arm-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250221/202502211959.29EEwfoK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211959.29EEwfoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211959.29EEwfoK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-phicomm-k3.dts:16.9-19.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-phicomm-k3.dts:21.12-31.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +16 arch/arm/boot/dts/bcm47094-phicomm-k3.dts

40a17923367118e Hao Dong 2019-01-20  11  
40a17923367118e Hao Dong 2019-01-20  12  / {
40a17923367118e Hao Dong 2019-01-20  13  	compatible = "phicomm,k3", "brcm,bcm47094", "brcm,bcm4708";
40a17923367118e Hao Dong 2019-01-20  14  	model = "Phicomm K3";
40a17923367118e Hao Dong 2019-01-20  15  
40a17923367118e Hao Dong 2019-01-20 @16  	memory {
40a17923367118e Hao Dong 2019-01-20  17  		reg = <0x00000000 0x08000000
40a17923367118e Hao Dong 2019-01-20  18  		       0x88000000 0x18000000>;
40a17923367118e Hao Dong 2019-01-20  19  	};
40a17923367118e Hao Dong 2019-01-20  20  
40a17923367118e Hao Dong 2019-01-20  21  	gpio-keys {
40a17923367118e Hao Dong 2019-01-20  22  		compatible = "gpio-keys";
40a17923367118e Hao Dong 2019-01-20  23  		#address-cells = <1>;
40a17923367118e Hao Dong 2019-01-20  24  		#size-cells = <0>;
40a17923367118e Hao Dong 2019-01-20  25  
40a17923367118e Hao Dong 2019-01-20  26  		restart {
40a17923367118e Hao Dong 2019-01-20  27  			label = "Reset";
40a17923367118e Hao Dong 2019-01-20  28  			linux,code = <KEY_RESTART>;
40a17923367118e Hao Dong 2019-01-20  29  			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
40a17923367118e Hao Dong 2019-01-20  30  		};
40a17923367118e Hao Dong 2019-01-20  31  	};
40a17923367118e Hao Dong 2019-01-20  32  };
40a17923367118e Hao Dong 2019-01-20  33  

:::::: The code at line 16 was first introduced by commit
:::::: 40a17923367118e32e5e413a952736dd83635b32 ARM: dts: BCM5301X: Add basic DT for Phicomm K3

:::::: TO: Hao Dong <halbertdong@gmail.com>
:::::: CC: Florian Fainelli <f.fainelli@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
