Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464A3143C7A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718401407; cv=none; b=CwNVtED3rYEsXBJB8qmnVSFuCEkwoaEk0e1tmfMxQcc736XRvFj2FnmtHFqOkG+AuyYwuNks9Fpc75V9I9yt1tiOK9VdxBMC5ZINMyPH0qL/lwPtTk2rTjZnH5Ylq3JISN7Z8uUn9N+ynbij/7QIvzdyMxvEGoTCc3M7iZ8c430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718401407; c=relaxed/simple;
	bh=b7yfdgOUZbl1Zbk6GCSRteATrYhtAlKxWvt4WQUJgh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PdxnO+zMAHu892RPXABIVO6SrhnFbr6dd+ZhHB63sjUfz2j70fthJloWs1Zcu1W0OwZimVx3/yHUxGzSvpjQp8YE7KgT4CLtb0vaHYzX3VTJ4bmWCA3gFphOQ0KMtlhLiGcMJVYLFqdSAP5jl1d4NvzsijbF3dPjlCLDP6+NBl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTJ55AkV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTJ55AkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718401405; x=1749937405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7yfdgOUZbl1Zbk6GCSRteATrYhtAlKxWvt4WQUJgh0=;
  b=aTJ55AkV/17jslTvORs5n7jaFpTplW3+irtPyGp8zqbM9Ueu1bSOipAS
   86OLles0grfs2OugZDEaG9fKAEkDAL5TjxHjfk5Dn3Jhm32T2VQPo+xdr
   PXcumZ1BrXL70dVzjDyzEWe5gnLOD0G34cu1GNuEptzJMh3sNz8Rlbq3w
   GHtDPC2w9uHeAQLU6l/1jODAbDacNZITXqCoDmEIV0q3qMgV91Dh4kGhM
   LsMSPfrLQnCyn4PCFSoSYgb9hngs1SM55nEBivT8HQuzkmy1Y1Vi/L7wT
   hueXCDFiBOXIEstrLm8neRcsmI1t8dnr3WDo07TjqSfP/TddxCcI/oyo3
   w==;
X-CSE-ConnectionGUID: lGcqtluqTLS2rFZViP77ZA==
X-CSE-MsgGUID: hkR/GXamQemcG90xXU1fnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="32784498"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="32784498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 14:43:24 -0700
X-CSE-ConnectionGUID: KEWHHKdgRzeuJNrt8R2WiQ==
X-CSE-MsgGUID: 8aqdZSkJS9qcSXGlZEWiYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="78101967"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jun 2024 14:43:24 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIEhd-0001op-1b;
	Fri, 14 Jun 2024 21:43:21 +0000
Date: Sat, 15 Jun 2024 05:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.1.y 1/91]
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts:80.17-84.4: Warning
 (unit_address_vs_reg): /rk3568-gpiomem: node has a reg or ranges property,
 but no unit name
Message-ID: <202406150532.JC2IXlqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: 161dee9509736facbf1906dd1005e70e240389fa [1/91] ODROID-M1: Add /dev/gpiomem device
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240615/202406150532.JC2IXlqX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150532.JC2IXlqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150532.JC2IXlqX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts:80.17-84.4: Warning (unit_address_vs_reg): /rk3568-gpiomem: node has a reg or ranges property, but no unit name

vim +80 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts

    13	
    14	/ {
    15		model = "Hardkernel ODROID-M1";
    16		compatible = "rockchip,rk3568-odroid-m1", "rockchip,rk3568";
    17	
    18		aliases {
    19			ethernet0 = &gmac0;
    20			i2c0 = &i2c3;
    21			i2c3 = &i2c0;
    22			mmc0 = &sdhci;
    23			mmc1 = &sdmmc0;
    24			serial0 = &uart1;
    25			serial1 = &uart0;
    26		};
    27	
    28		chosen: chosen {
    29			stdout-path = "serial2:1500000n8";
    30		};
    31	
    32		hdmi-con {
    33			compatible = "hdmi-connector";
    34			type = "a";
    35	
    36			port {
    37				hdmi_con_in: endpoint {
    38					remote-endpoint = <&hdmi_out_con>;
    39				};
    40			};
    41		};
    42	
    43		leds: leds {
    44			compatible = "gpio-leds";
    45	
    46			led_power: led-0 {
    47				gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>;
    48				function = LED_FUNCTION_POWER;
    49				color = <LED_COLOR_ID_RED>;
    50				linux,default-trigger = "default-on";
    51				pinctrl-names = "default";
    52				pinctrl-0 = <&led_power_en>;
    53			};
    54			led_work: led-1 {
    55				gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
    56				function = LED_FUNCTION_HEARTBEAT;
    57				color = <LED_COLOR_ID_BLUE>;
    58				linux,default-trigger = "heartbeat";
    59				pinctrl-names = "default";
    60				pinctrl-0 = <&led_work_en>;
    61			};
    62		};
    63	
    64		rk809-sound {
    65			compatible = "simple-audio-card";
    66			simple-audio-card,format = "i2s";
    67			simple-audio-card,name = "ODROID-M1-FRONT";
    68			simple-audio-card,mclk-fs = <256>;
    69			status = "okay";
    70	
    71			simple-audio-card,cpu {
    72				sound-dai = <&i2s1_8ch>;
    73			};
    74	
    75			simple-audio-card,codec {
    76				sound-dai = <&rk809>;
    77			};
    78		};
    79	
  > 80		rk3568-gpiomem {
    81			compatible = "rockchip,rk3568-gpiomem";
    82			reg= <0x0 0xfd660000 0x0 0x1000>;
    83			status = "okay";
    84		};
    85	
    86		pcie30_avdd0v9: pcie30-avdd0v9 {
    87			compatible = "regulator-fixed";
    88			regulator-name = "pcie30_avdd0v9";
    89			regulator-always-on;
    90			regulator-boot-on;
    91			regulator-min-microvolt = <900000>;
    92			regulator-max-microvolt = <900000>;
    93			vin-supply = <&vcc3v3_sys>;
    94		};
    95	
    96		pcie30_avdd1v8: pcie30-avdd1v8 {
    97		        compatible = "regulator-fixed";
    98		        regulator-name = "pcie30_avdd1v8";
    99			regulator-always-on;
   100			regulator-boot-on;
   101			regulator-min-microvolt = <1800000>;
   102			regulator-max-microvolt = <1800000>;
   103			vin-supply = <&vcc3v3_sys>;
   104		};
   105	
   106		vcc12v_dcin: vcc12v-dcin {
   107			compatible = "regulator-fixed";
   108			regulator-name = "vcc12v_dcin";
   109			regulator-always-on;
   110			regulator-boot-on;
   111		};
   112	
   113		vcc3v3_pcie: gpio-regulator {
   114			compatible = "regulator-fixed";
   115			regulator-name = "vcc3v3_pcie";
   116			enable-active-high;
   117			regulator-min-microvolt = <3300000>;
   118			regulator-max-microvolt = <3300000>;
   119			gpio = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
   120			startup-delay-us = <5000>;
   121			vin-supply = <&vcc12v_dcin>;
   122		};
   123	
   124		vcc3v3_sys: vcc3v3-sys {
   125			compatible = "regulator-fixed";
   126			regulator-name = "vcc3v3_sys";
   127			regulator-always-on;
   128			regulator-boot-on;
   129			regulator-min-microvolt = <3300000>;
   130			regulator-max-microvolt = <3300000>;
   131			vin-supply = <&vcc12v_dcin>;
   132		};
   133	
   134		vcc5v0_usb: vcc5v0-usb {
   135			compatible = "regulator-fixed";
   136			regulator-name = "vcc5v0_usb";
   137			regulator-always-on;
   138			regulator-boot-on;
   139			regulator-min-microvolt = <5000000>;
   140			regulator-max-microvolt = <5000000>;
   141			vin-supply = <&vcc12v_dcin>;
   142		};
   143	
   144		vcc5v0_usb_host: vcc5v0-usb-host {
   145			compatible = "regulator-fixed";
   146			enable-active-high;
   147			gpio = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
   148			pinctrl-names = "default";
   149			pinctrl-0 = <&vcc5v0_usb_host_en>;
   150			regulator-name = "vcc5v0_usb_host";
   151			regulator-min-microvolt = <5000000>;
   152			regulator-max-microvolt = <5000000>;
   153			vin-supply = <&vcc5v0_usb>;
   154		};
   155	
   156		vcc5v0_usb_otg: vcc5v0-usb-otg {
   157			compatible = "regulator-fixed";
   158			enable-active-high;
   159			gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
   160			pinctrl-names = "default";
   161			pinctrl-0 = <&vcc5v0_usb_otg_en>;
   162			regulator-name = "vcc5v0_usb_otg";
   163			regulator-min-microvolt = <5000000>;
   164			regulator-max-microvolt = <5000000>;
   165			vin-supply = <&vcc5v0_usb>;
   166		};
   167	};
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
