Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29950158D79
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693767; cv=none; b=OWZ65lazYC1d+FuiXTnFN13QeOEtewfFEbaG7nU0RHhjV5t5AeoqfrH6rrIdS13A3FmVY2XIYPqgsQkfMd3JlQbtWMSILEVrmvZXM+0+Oz8fSBWHGlPFeqhjIM1PYx+QYucgrl7K/dZ31sI96RSNys3/h6dNFCgbWYjbXYK3gHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693767; c=relaxed/simple;
	bh=lGl/Y+GlgSy923tQ6uT3BISFazC0aG7gvVi4Zf7k3Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ANVeAotUthcwnvxthvPai5oksdrliK9nJO5AFX4ZjmCvOMtMSUL6vnXNnS6duu6fjEjso/XyhweCTJ0SsD0PElaDNvJ9vw/dCvzhZYG3geMFZUZhSUHv7ZqhH8A52/7PQRrCBFNnSTiFc7k45eGHdAMpXXEG+XWVgcuWHpOZj5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Go7M/CbR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Go7M/CbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720693765; x=1752229765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGl/Y+GlgSy923tQ6uT3BISFazC0aG7gvVi4Zf7k3Dc=;
  b=Go7M/CbRe+ekGjfh7ABbrCi3oADM1/HcgO7fo+VSSF5jUJhVqww0Zbdj
   PqRv8XqAOeJ8FUyvBA+54d7okxXqXkm9hNDhvvh2XlqHZkD2j+dydB3Rz
   cIJL+LcvNbnbn47dg8icsQEox5hCdjALbDeT6VddTpWP9CC7jg8arxaq3
   RR06ZLij0YGMDRYBxDWfyZy5TTAhoLQc/CtvKwglovC0UFcmsQHdIILtp
   30NNtglu01quWr7mVnseXGdZ/uiDAX+6gAqwV8is7piy6ryANXvy/OZzW
   Xp6WeO3dOAAJh3IoDku+ijPtvrCnrdxv+sxv/k89znH0jjLMEseKrA9O7
   Q==;
X-CSE-ConnectionGUID: hOLr/EP7TKiHzHKqsClndg==
X-CSE-MsgGUID: rJCEAvRCRFu5NfMPm8u+IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28663441"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="28663441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 03:29:21 -0700
X-CSE-ConnectionGUID: dFDPeYIqSHGMVkQEpxHIqQ==
X-CSE-MsgGUID: sEqtRkkmSNeIWUbUkqs7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="48409114"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jul 2024 03:29:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRr37-000Z9g-1I;
	Thu, 11 Jul 2024 10:29:17 +0000
Date: Thu, 11 Jul 2024 18:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11857/12643]
 arch/mips/boot/dts/pic32/pic32mzda.dtsi:32.7-40.4: Warning
 (avoid_unnecessary_addr_size): /cpus: unnecessary #address-cells/#size-cells
 without "ranges", "dma-ranges" or child "reg" property
Message-ID: <202407111848.GZkeFUuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 12d638f48c082831388358cc12a1c6ee58185ad8 [11857/12643] scripts/dtc: Update to upstream version v1.7.0-93-g1df7b047fe43
config: mips-pic32mzda_defconfig (https://download.01.org/0day-ci/archive/20240711/202407111848.GZkeFUuS-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111848.GZkeFUuS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111848.GZkeFUuS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/pic32/pic32mzda.dtsi:36.9-39.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/pic32/pic32mzda_sk.dts:17.9-20.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/pic32/pic32mzda.dtsi:32.7-40.4: Warning (avoid_unnecessary_addr_size): /cpus: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/mips/boot/dts/pic32/pic32mzda.dtsi:78.34-84.4: Warning (avoid_unnecessary_addr_size): /pinctrl@1f801400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +32 arch/mips/boot/dts/pic32/pic32mzda.dtsi

842b6b16f5178c Joshua Henderson     2016-01-13   7  
842b6b16f5178c Joshua Henderson     2016-01-13   8  / {
842b6b16f5178c Joshua Henderson     2016-01-13   9  	#address-cells = <1>;
842b6b16f5178c Joshua Henderson     2016-01-13  10  	#size-cells = <1>;
842b6b16f5178c Joshua Henderson     2016-01-13  11  	interrupt-parent = <&evic>;
842b6b16f5178c Joshua Henderson     2016-01-13  12  
842b6b16f5178c Joshua Henderson     2016-01-13  13  	aliases {
842b6b16f5178c Joshua Henderson     2016-01-13  14  		gpio0 = &gpio0;
842b6b16f5178c Joshua Henderson     2016-01-13  15  		gpio1 = &gpio1;
842b6b16f5178c Joshua Henderson     2016-01-13  16  		gpio2 = &gpio2;
842b6b16f5178c Joshua Henderson     2016-01-13  17  		gpio3 = &gpio3;
842b6b16f5178c Joshua Henderson     2016-01-13  18  		gpio4 = &gpio4;
842b6b16f5178c Joshua Henderson     2016-01-13  19  		gpio5 = &gpio5;
842b6b16f5178c Joshua Henderson     2016-01-13  20  		gpio6 = &gpio6;
842b6b16f5178c Joshua Henderson     2016-01-13  21  		gpio7 = &gpio7;
842b6b16f5178c Joshua Henderson     2016-01-13  22  		gpio8 = &gpio8;
842b6b16f5178c Joshua Henderson     2016-01-13  23  		gpio9 = &gpio9;
842b6b16f5178c Joshua Henderson     2016-01-13  24  		serial0 = &uart1;
842b6b16f5178c Joshua Henderson     2016-01-13  25  		serial1 = &uart2;
842b6b16f5178c Joshua Henderson     2016-01-13  26  		serial2 = &uart3;
842b6b16f5178c Joshua Henderson     2016-01-13  27  		serial3 = &uart4;
842b6b16f5178c Joshua Henderson     2016-01-13  28  		serial4 = &uart5;
842b6b16f5178c Joshua Henderson     2016-01-13  29  		serial5 = &uart6;
842b6b16f5178c Joshua Henderson     2016-01-13  30  	};
842b6b16f5178c Joshua Henderson     2016-01-13  31  
842b6b16f5178c Joshua Henderson     2016-01-13 @32  	cpus {
842b6b16f5178c Joshua Henderson     2016-01-13  33  		#address-cells = <1>;
842b6b16f5178c Joshua Henderson     2016-01-13  34  		#size-cells = <0>;
842b6b16f5178c Joshua Henderson     2016-01-13  35  
842b6b16f5178c Joshua Henderson     2016-01-13  36  		cpu@0 {
842b6b16f5178c Joshua Henderson     2016-01-13  37  			compatible = "mti,mips14KEc";
842b6b16f5178c Joshua Henderson     2016-01-13  38  			device_type = "cpu";
842b6b16f5178c Joshua Henderson     2016-01-13  39  		};
842b6b16f5178c Joshua Henderson     2016-01-13  40  	};
842b6b16f5178c Joshua Henderson     2016-01-13  41  
842b6b16f5178c Joshua Henderson     2016-01-13  42  	soc {
842b6b16f5178c Joshua Henderson     2016-01-13  43  		compatible = "microchip,pic32mzda-infra";
842b6b16f5178c Joshua Henderson     2016-01-13  44  		interrupts = <0 IRQ_TYPE_EDGE_RISING>;
842b6b16f5178c Joshua Henderson     2016-01-13  45  	};
842b6b16f5178c Joshua Henderson     2016-01-13  46  
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  47  	/* external clock input on TxCLKI pin */
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  48  	txcki: txcki_clk {
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  49  		#clock-cells = <0>;
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  50  		compatible = "fixed-clock";
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  51  		clock-frequency = <4000000>;
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  52  		status = "disabled";
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  53  	};
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  54  
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  55  	/* external input on REFCLKIx pin */
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  56  	refix: refix_clk {
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  57  		#clock-cells = <0>;
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  58  		compatible = "fixed-clock";
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  59  		clock-frequency = <24000000>;
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  60  		status = "disabled";
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  61  	};
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  62  
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  63  	rootclk: clock-controller@1f801200 {
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  64  		compatible = "microchip,pic32mzda-clk";
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  65  		reg = <0x1f801200 0x200>;
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  66  		#clock-cells = <1>;
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  67  		microchip,pic32mzda-sosc;
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  68  	};
9125f19bbb97e7 Purna Chandra Mandal 2016-05-13  69  
842b6b16f5178c Joshua Henderson     2016-01-13  70  	evic: interrupt-controller@1f810000 {
842b6b16f5178c Joshua Henderson     2016-01-13  71  		compatible = "microchip,pic32mzda-evic";
842b6b16f5178c Joshua Henderson     2016-01-13  72  		interrupt-controller;
842b6b16f5178c Joshua Henderson     2016-01-13  73  		#interrupt-cells = <2>;
842b6b16f5178c Joshua Henderson     2016-01-13  74  		reg = <0x1f810000 0x1000>;
842b6b16f5178c Joshua Henderson     2016-01-13  75  		microchip,external-irqs = <3 8 13 18 23>;
842b6b16f5178c Joshua Henderson     2016-01-13  76  	};
842b6b16f5178c Joshua Henderson     2016-01-13  77  
842b6b16f5178c Joshua Henderson     2016-01-13 @78  	pic32_pinctrl: pinctrl@1f801400 {

:::::: The code at line 32 was first introduced by commit
:::::: 842b6b16f5178c66da0959a935dafa80a979b745 MIPS: dts: Add initial DTS for the PIC32MZDA Starter Kit

:::::: TO: Joshua Henderson <joshua.henderson@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
