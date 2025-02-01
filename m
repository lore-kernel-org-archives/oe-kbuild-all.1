Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD61BD01D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738435909; cv=none; b=fM1MPKnmogme5gplmWoPUiTkLoikz0xkqjv6rTktAfYkhvlTgs5cHvRy0uuj2GXfXagDaRRm/qlMjsN3CF+uRQ755WnlOQVT3yVSFAN6eKD2mALpouYrjy5O5A7L57/DDdsErqTEAdXX1OLQ0gGiAAnVMPBEVxeL1v6660lTHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738435909; c=relaxed/simple;
	bh=yvCXP3IKQC4+FRWZJdHZeOQLxSvX6M4+s6u6tbE30t8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQzOxpU1KIAOI3y6DtcDb+/0YlAIXrx90Up9A69u1saF69dZ7TRnBgtvuSg7huFnN0smkxfiYrYE882gioTc5wck+Aei18mfU/54WCBiaFtaylfrnGNZrxzIEVJ1cY/oOER2FX6zmFd2ui64M3ZplF7fpzNXwokfw4CYNGy+qeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8PyRLk+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8PyRLk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738435908; x=1769971908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvCXP3IKQC4+FRWZJdHZeOQLxSvX6M4+s6u6tbE30t8=;
  b=M8PyRLk+FpgtzbzFio/UY0traICX99fQQwYm7ZOIh+qnYLORujlf2oAa
   u76Lw1jSvPl452NW+JxHTr7mNXj7flk11qcBs7Bku/xJRGwSxuz3R5r/9
   GRes4lj6nay7adKtBDoO59dgqDADO6FBWpgOi7bNjUJEZiv5D2uRK3Qxr
   E/Rri7pcWm2J7T1ZqzivaOc8MgSTYPWBhvkmfqipaBDNjlQ6QttMgKfuM
   HV57UR+j+LPminTiT3hTtEU24BXtImDKFn3UJzu1s6q+EipNA/aUMhsnl
   BDeBAnvRugUXrT16vearxSFlKx8TD5EjmliUYWaOh3/xlH1xK9DvIvH+q
   w==;
X-CSE-ConnectionGUID: LaFY0dsQRWCPGURO3Ry0ug==
X-CSE-MsgGUID: yR8pfK0QS8ikaGMBsbJ8SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="38869640"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="38869640"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 10:51:47 -0800
X-CSE-ConnectionGUID: M8NOhegvQNGDGafImtKeog==
X-CSE-MsgGUID: Qx11N/R+S9O2HHioiS3Lzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="114917396"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Feb 2025 10:51:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teIal-000oTN-2Z;
	Sat, 01 Feb 2025 18:51:43 +0000
Date: Sun, 2 Feb 2025 02:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-rc 18/19]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:33.9-35.4: Warning
 (unit_address_vs_reg): /memory: node has a reg or ranges property, but no
 unit name
Message-ID: <202502020230.sbT4Ltsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-rc
head:   91ded772cda75b861e25b75042d8ef22ded4facb
commit: 3676da83c9eb6779d1d7f5d87507bff3fdbbb91f [18/19] arm64: dts: update bpi-r4.dtsi to actual state
config: arm64-randconfig-003-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020230.sbT4Ltsx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020230.sbT4Ltsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020230.sbT4Ltsx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:671.24-692.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:704.19-726.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:33.9-35.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:671.24-692.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:704.19-726.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:787.27-952.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +33 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

    11	
    12	/ {
    13		compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
    14		model = "Banana Pi BPI-R4";
    15		chassis-type = "embedded";
    16	
    17		aliases {
    18			ethernet0 = &gmac0;
    19			ethernet1 = &gmac1;
    20			ethernet2 = &gmac2;
    21			led-boot = &led_green;
    22			led-failsafe = &led_green;
    23			led-running = &led_green;
    24			led-upgrade = &led_green;
    25		};
    26	
    27		chosen {
    28			stdout-path = "serial0:115200n8";
    29			bootargs = "loglevel=8 pci=pcie_bus_perf ubi.block=0,fit root=/dev/fit0";
    30			rootdisk-spim-nand = <&ubi_rootfs>;
    31		};
    32	
  > 33		memory {
    34			reg = <0x00 0x40000000 0x00 0x10000000>;
    35		};
    36	
    37		reg_1p8v: regulator-1p8v {
    38			compatible = "regulator-fixed";
    39			regulator-name = "fixed-1.8V";
    40			regulator-min-microvolt = <1800000>;
    41			regulator-max-microvolt = <1800000>;
    42			regulator-boot-on;
    43			regulator-always-on;
    44		};
    45	
    46		reg_3p3v: regulator-3p3v {
    47			compatible = "regulator-fixed";
    48			regulator-name = "fixed-3.3V";
    49			regulator-min-microvolt = <3300000>;
    50			regulator-max-microvolt = <3300000>;
    51			regulator-boot-on;
    52			regulator-always-on;
    53		};
    54	
    55		gpio-keys {
    56			compatible = "gpio-keys";
    57	
    58			wps {
    59				label = "WPS";
    60				linux,code = <KEY_RESTART>;
    61				gpios = <&pio 14 GPIO_ACTIVE_LOW>;
    62			};
    63		};
    64	
    65		gpio-leds {
    66			compatible = "gpio-leds";
    67	
    68			led_green: led-green {
    69				function = LED_FUNCTION_STATUS;
    70				color = <LED_COLOR_ID_GREEN>;
    71				gpios = <&pio 79 GPIO_ACTIVE_HIGH>;
    72				default-state = "on";
    73			};
    74	
    75			led_blue: led-blue {
    76				function = LED_FUNCTION_WPS;
    77				color = <LED_COLOR_ID_BLUE>;
    78				gpios = <&pio 63 GPIO_ACTIVE_HIGH>;
    79				default-state = "off";
    80			};
    81		};
    82	};
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
