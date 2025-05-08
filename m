Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A0288507
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730118; cv=none; b=Ppd4HhTEuU6yJ+XKambZJjmfYalSfoWCMCG4PpNqJ4K2pvo8xbcq1Q0j8bAZA/ee25m//uTrPnNj+lDSvjgR2xAfHMHBUEygKLl+dcp0NJjDZgwXb5T4xh6lP3wrsuPciaxTsIb7sBpWbMkTNZB8UW2DL2SbpGrAlpGdY5DiYPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730118; c=relaxed/simple;
	bh=ptno/4gKyvMsrM1EhkRWrf+a+eRumgb3HvaKSv2M1q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JdTYTkDoPZ7YNCKmEyZY0lqZac8zLO8YI9TETDCnWwpIiTxQxRivuVv7+UpV+smnxT3Zz8YQcc5c2UnwbRxDEEMq/tLxxhz/9Pv6503BIiKtJW5HXSIly7vsM0LXs2Lr0fUXDFezLgGeFNwlxpu4NHsGWI8dqOX2wjqf3BFEqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdRpnBLR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdRpnBLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746730117; x=1778266117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ptno/4gKyvMsrM1EhkRWrf+a+eRumgb3HvaKSv2M1q8=;
  b=BdRpnBLR/7FcUFT/pP1upJmoQxEBboat692QFs52ig4b0Src7KxmhQzI
   UK93COWqZjWRdUDUFqUxdF5vXYGNa5IDJ8GGzP7zaU02KsVLLG0B7lxYK
   WgmfboOK76w7peddVaXMFBOLrFavuiNIWSxn+ZynZ/76r5cu5qTPTI34L
   IORpQmtdbbZQ/fzolSlsH/9AUOv3zyvthwdbK4NAsDHJKTIcgn9KgkPth
   uhhAj6fR6FMURbBBrpxN16q6sO3HJ8Tc3dwUbmO1NSJ7Sll7FgheHUP17
   6KAIsFT+vRknYNQVaLtRPo7TR7/Q3/SX1jhTpOoYhL+CykP2ga4zpNHM0
   w==;
X-CSE-ConnectionGUID: 1dJ26htnQYmWvmw3JC/JsQ==
X-CSE-MsgGUID: 5aLeAdtFQuWgX1rFavWRfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48450549"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48450549"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:48:34 -0700
X-CSE-ConnectionGUID: y+Tm9ThwRySpctlMUAtD9g==
X-CSE-MsgGUID: ghJAktntR9Kl4NY/j24Urw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="141135768"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 May 2025 11:48:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD6II-000BHF-1C;
	Thu, 08 May 2025 18:48:30 +0000
Date: Fri, 9 May 2025 02:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 63/63]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:370.34-374.6: Warning
 (unit_address_vs_reg):
 /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit
 name, but no reg or ranges property
Message-ID: <202505090224.QRkcQ4IN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0df15b2007c16153a62fd4bfaa4b4ba8a7669d04
commit: 6ac893cc97939e7b3a3b4a078c23448088ae1c65 [63/63] CHROMIUM: arm64: dts: mediatek: mt8196: navi: Add thermistors
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250509/202505090224.QRkcQ4IN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090224.QRkcQ4IN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090224.QRkcQ4IN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2648.18-2651.6: Warning (unit_address_vs_reg): /soc/opp-table-apu/opp@385000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt6363.dtsi:143.41-145.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/efuse/nvmem-layout/mt6363_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:76.41-78.7: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@5/efuse/nvmem-layout/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:66.21-68.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:69.19-71.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:72.21-75.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mfd@9/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3153.10-3157.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3159.14-3163.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:313.33-317.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:318.30-322.6: Warning (unit_address_vs_reg): /soc/thermal-zones/bulk-board-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:370.34-374.6: Warning (unit_address_vs_reg): /soc/thermal-zones/cpu-board-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:384.32-388.6: Warning (unit_address_vs_reg): /soc/thermal-zones/charger-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2595.32-2652.5: Warning (simple_bus_reg): /soc/opp-table-apu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2867.35-2873.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2875.35-2881.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4681.17-4687.5: Warning (simple_bus_reg): /soc/apusys-apummu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4689.16-4716.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4718.16-4746.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4758.38-4765.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4767.38-4774.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4776.8-4781.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4783.16-4791.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property

vim +370 arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi

   304	
   305	&thermal_zones {
   306		bulk-board-thermal {
   307			polling-delay = <1000>;
   308			polling-delay-passive = <1000>;
   309			thermal-sensors = <&cros_ec 0>;
   310			sustainable-power = <3350>; /* estimated sustainable power when saturated */
   311	
   312			trips {
   313				bulk_threshold: trip-point@0 {
   314					temperature = <40000>; /* switch on temperature */
   315					hysteresis = <2000>;
   316					type = "passive";
   317				};
   318				bulk_target: trip-point@1 {
   319					temperature = <50000>; /* desired temperature */
   320					hysteresis = <2000>;
   321					type = "passive";
   322				};
   323			};
   324	
   325			cooling-maps {
   326				map0 {
   327					trip = <&bulk_target>;
   328					cooling-device =
   329						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
   330						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
   331						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
   332						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
   333					contribution = <2048>;
   334				};
   335				map1 {
   336					trip = <&bulk_target>;
   337					cooling-device =
   338						<&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
   339						<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
   340						<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
   341					contribution = <1024>;
   342				};
   343				map2 {
   344					trip = <&bulk_target>;
   345					cooling-device =
   346						<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
   347					contribution = <768>;
   348				};
   349				map3 {
   350					trip = <&bulk_target>;
   351					cooling-device =
   352						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
   353					contribution = <1024>;
   354				};
   355				map4 {
   356					trip = <&bulk_target>;
   357					cooling-device =
   358						<&apu_top_rpmsg THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
   359					contribution = <384>;
   360				};
   361			};
   362		};
   363	
   364		cpu-board-thermal {
   365			polling-delay = <0>;
   366			polling-delay-passive = <0>;
   367			thermal-sensors = <&cros_ec 1>;
   368	
   369			trips {
 > 370				cpu_board_trip0: trip-point@0 {
   371					temperature = <80000>;
   372					hysteresis = <2000>;
   373					type = "hot";
   374				};
   375			};
   376		};
   377	
   378		charger-thermal {
   379			polling-delay = <0>;
   380			polling-delay-passive = <0>;
   381			thermal-sensors = <&cros_ec 2>;
   382	
   383			trips {
 > 384				charger_trip0: trip-point@0 {
   385					temperature = <80000>;
   386					hysteresis = <2000>;
   387					type = "hot";
   388				};
   389			};
   390		};
   391	};
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
