Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3794C1869
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718042582; cv=none; b=cyTLl2DycM69U8Cr8+BSoVsc+3aK3g/EIWkO4Iizp21P+wcNS0yTweQVZT/8ksN7NAK5eQejX5p/5gidQnc8uAZXJgMuuzOJHeWIHCKHaozqj3d62YwI2zI5hX5vUJc7xpMyTcWellbyqmF57UTunxWsStMFGF+oAvFXnhPyQl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718042582; c=relaxed/simple;
	bh=+aZlTaQ9M/bng0DWRIospVgtnvQt3eXqp1TA5pBdJg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEX4vzG9fDKKcENuMybkAO01YdAH+55IPb3rmDh072ifcjpe7MRtBKK6PLUVLs7VD2b+MuU8qahXLkpYwRmt+L1DFbqZYpdhVnEGDNw98GplXEyEy8KbJFkfHBgFw+vATak3NlMQloS6jJouhVA40UB4DXA02kXW8gXm5ud0x+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MF+RqA6e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MF+RqA6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718042581; x=1749578581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+aZlTaQ9M/bng0DWRIospVgtnvQt3eXqp1TA5pBdJg0=;
  b=MF+RqA6eGPHqHKna/+rw4jaBxj5XVw1Ir4/ev7Lho5THUoxOerqCYu/4
   ELCrlBLdHWDtVb1J41+UiSjn/9v8kdkkqYpMvDfgCLnTCGJBIQeRzpHco
   XBtKr8efcKB8Hjrl2kNJYATGVI/23ynJxdEHZOGxHG8pVVsWbpJkDtw1Z
   Ql3Vig7ltBzmFsF5i/jxs0ZOYvzbFGPM1jP8HjU6lmCsmy7dBMq88ALBd
   KGymmDmjM5UQEd2wx/waFaACRbNZ5HK5Xxu1tDt9uyCGOwohmz9tz7pSf
   ibaXgF7HatGYekDc6I7vciXqSaf+wbREd6teFLcuQVilZx75a76rbmKce
   w==;
X-CSE-ConnectionGUID: BQ3aoCXGSKWUfOaH53mvvg==
X-CSE-MsgGUID: lyELlW+hRMGoj3+bnxOhzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="37241928"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="37241928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 11:03:00 -0700
X-CSE-ConnectionGUID: tIFm/6xxS3G6WECQVRhXqg==
X-CSE-MsgGUID: 1WC3kq7FQSiew1mt0zmdpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="38983275"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2024 11:02:53 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGjM2-0002Mu-2w;
	Mon, 10 Jun 2024 18:02:50 +0000
Date: Tue, 11 Jun 2024 02:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rc 18/27]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:31.9-33.4: Warning
 (unit_address_vs_reg): /memory: node has a reg or ranges property, but no
 unit name
Message-ID: <202406110154.7zDryO7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rc
head:   fad325f97e2b1111b0ab5bbee1a0463e79782825
commit: f1b553fc5cbd76d04645e3bebf7595d6a8dc2f5c [18/27] WIP: add BPi-R4
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240611/202406110154.7zDryO7B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110154.7zDryO7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110154.7zDryO7B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:31.9-33.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1127.27-1288.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +31 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts

    11	
    12	/ {
    13		compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
    14		model = "Banana Pi BPI-R4";
    15		chassis-type = "embedded";
    16	
    17		aliases {
    18			serial0 = &uart0;
    19			led-boot = &led_green;
    20			led-failsafe = &led_green;
    21			led-running = &led_green;
    22			led-upgrade = &led_green;
    23		};
    24	
    25		chosen {
    26			stdout-path = &uart0;
    27			bootargs = "console=ttyS0,115200n1 loglevel=8 pci=pcie_bus_perf ubi.block=0,fit root=/dev/fit0";
    28			rootdisk-spim-nand = <&ubi_rootfs>;
    29		};
    30	
  > 31		memory {
    32			reg = <0x00 0x40000000 0x00 0x10000000>;
    33		};
    34	
    35		/* SFP1 cage (WAN) */
    36		sfp1: sfp1 {
    37			compatible = "sff,sfp";
    38			i2c-bus = <&i2c_sfp1>;
    39			los-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
    40			mod-def0-gpios = <&pio 82 GPIO_ACTIVE_LOW>;
    41			tx-disable-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
    42			tx-fault-gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
    43			rate-select0-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
    44			maximum-power-milliwatt = <3000>;
    45		};
    46	
    47		/* SFP2 cage (LAN) */
    48		sfp2: sfp2 {
    49			compatible = "sff,sfp";
    50			i2c-bus = <&i2c_sfp2>;
    51			los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
    52			mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
    53			tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
    54			tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
    55			rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
    56			maximum-power-milliwatt = <3000>;
    57		};
    58	
    59		gpio-keys {
    60			compatible = "gpio-keys";
    61	
    62			wps {
    63				label = "WPS";
    64				linux,code = <KEY_RESTART>;
    65				gpios = <&pio 14 GPIO_ACTIVE_LOW>;
    66			};
    67		};
    68	
    69		gpio-leds {
    70			compatible = "gpio-leds";
    71	
    72			led_green: led-green {
    73				function = LED_FUNCTION_STATUS;
    74				color = <LED_COLOR_ID_GREEN>;
    75				gpios = <&pio 79 GPIO_ACTIVE_HIGH>;
    76				default-state = "on";
    77			};
    78	
    79			led_blue: led-blue {
    80				function = LED_FUNCTION_WPS;
    81				color = <LED_COLOR_ID_BLUE>;
    82				gpios = <&pio 63 GPIO_ACTIVE_HIGH>;
    83				default-state = "off";
    84			};
    85		};
    86	};
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
