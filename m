Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A92358A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718174093; cv=none; b=HB/BmUkZLgHVqfcN0HoavTBxNSPGJQHAdt4qkHu2AOsL75iB8umljhC04DjQpLaVLDroiKBIa7bSN72UxJmmRCzgr/E253L7p4W9CWl4k4DT6ojH68RhcInfS8C2YTlrxf8YtzXczcqY8Br8ulv/TCw9Jka0dvVtzukrIdXLLzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718174093; c=relaxed/simple;
	bh=VtSn6Gi74AZ3ZOPem6lq8PmQBbGZw/TrSzt5ph7jLWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bU2AvJUDq4ScMgoaLoGSHPuQkS6LGMvBap8Y2mGRmaoa3XBbrto/930tcUz3Jfyk7qaX7pZ2VFBE8A12t2SpAP2CJv8wBHBDZZMOf7/tdWpTCnYmMD55ocZMOE6GTT1v6SNhOGdpeAiYCh/PNwuZ6JbeRUPRuNX6MciYrFlvcIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQzTq24J; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQzTq24J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718174092; x=1749710092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VtSn6Gi74AZ3ZOPem6lq8PmQBbGZw/TrSzt5ph7jLWA=;
  b=LQzTq24JPSHebOemNrGnPqvknoPBNAIyZ59j1c4FMz3X0DXrBhwgTkvt
   8O+gIl1CGTcrbwmWDZowMAlMuB6QjaGA5vdcXNGJLLeqx/H70D5B5Sf3c
   THPYsie+jIYY0+KsC2c71eZcjBdR2y60Tg45xAN1xiyQEiTPgT4WKeyA7
   xL7j/0QFEKfmcRQZAU8CP2xBVPnlVrRwtQUDZSXweVxpn24qn0eDQV0vm
   jg63a1g05SQMVAZCQzgJ/ktkPYvT5EMIS8MOoKkrr7VNUPunaEXmXohK/
   fJfZBY11Z5cypSHrI+cxj0uzxl/i4CGJ8TiYMXxIBXexa45+C/mH9h7H3
   g==;
X-CSE-ConnectionGUID: HLI1/dCaTo6gGSQAUgOZpQ==
X-CSE-MsgGUID: aUiC9VdhREuxYxj/cVFIKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14883009"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="14883009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 23:34:34 -0700
X-CSE-ConnectionGUID: 6FwWcU9kRzm5q66us9go4g==
X-CSE-MsgGUID: szPBOxncQaeJVVWB7JxrFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="39649580"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jun 2024 23:34:33 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHHZ1-0001Hg-1P;
	Wed, 12 Jun 2024 06:34:31 +0000
Date: Wed, 12 Jun 2024 14:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 9992/30000]
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:671.28-673.7: Warning
 (unit_address_vs_reg): /soc/i2c@ffd72000/adv7533@39/ports/port@0/endpoint@0:
 node has a unit name, but no reg property
Message-ID: <202406121409.j1Bnzkzu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   73b793dd7d4876d09ef0e420c145fab7782f199c
commit: 1d65a4b7a6b467a77712051466b33ba4a1c0cc8e [9992/30000] ANDROID: dts: hi3660: Fix duplicate adv7533 nodes
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406121409.j1Bnzkzu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121409.j1Bnzkzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121409.j1Bnzkzu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:671.28-673.7: Warning (unit_address_vs_reg): /soc/i2c@ffd72000/adv7533@39/ports/port@0/endpoint@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1136.30-1140.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1142.27-1146.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:52.34-57.5: Warning (unit_address_vs_reg): /reserved-memory/fastboot-cma-mem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:59.20-62.5: Warning (unit_address_vs_reg): /reserved-memory/uefi-reboot-mode: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:64.8-67.5: Warning (unit_address_vs_reg): /reserved-memory/bl31: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:78.13-83.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:253.19-262.4: Warning (unit_address_vs_reg): /hi3660_i2s: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:345.31-349.5: Warning (simple_bus_reg): /soc/crg_rst_controller: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:376.10-381.5: Warning (simple_bus_reg): /soc/reboot: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:390.20-394.5: Warning (simple_bus_reg): /soc/reset: missing or empty reg/ranges property

vim +671 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts

   607	
   608	&i2c1 {
   609		status = "okay";
   610	
   611		rt1711h: rt1711h@4e {
   612			compatible = "richtek,rt1711h";
   613			reg = <0x4e>;
   614			status = "ok";
   615			interrupt-parent = <&gpio27>;
   616			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
   617			pinctrl-names = "default";
   618			pinctrl-0 = <&usb_cfg_func>;
   619	
   620			usb_con: connector {
   621				compatible = "usb-c-connector";
   622				label = "USB-C";
   623				data-role = "dual";
   624				power-role = "dual";
   625				try-power-role = "sink";
   626				source-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
   627				sink-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)
   628					PDO_VAR(5000, 5000, 1000)>;
   629				op-sink-microwatt = <10000000>;
   630	
   631				ports {
   632					#address-cells = <1>;
   633					#size-cells = <0>;
   634					port@1 {
   635						reg = <1>;
   636						usb_con_ss: endpoint {
   637							remote-endpoint = <&dwc3_ss>;
   638						};
   639					};
   640				};
   641			};
   642			port {
   643				#address-cells = <1>;
   644				#size-cells = <0>;
   645	
   646				rt1711h_ep: endpoint@0 {
   647					reg = <0>;
   648					remote-endpoint = <&hikey_usb_ep1>;
   649				};
   650			};
   651		};
   652	
   653		adv7533: adv7533@39 {
   654			status = "ok";
   655			compatible = "adi,adv7533";
   656			reg = <0x39>;
   657			v1p2-supply = <&ldo3>;
   658			vdd-supply = <&ldo3>;
   659			interrupt-parent = <&gpio1>;
   660			interrupts = <1 2>;
   661			pd-gpio = <&gpio5 1 0>;
   662			sel-gpio = <&gpio2 4 0>;
   663			adi,dsi-lanes = <4>;
   664			adi,disable-timing-generator;
   665			#sound-dai-cells = <0>;
   666			ports {
   667				#address-cells = <1>;
   668				#size-cells = <0>;
   669				port@0 {
   670					reg = <0>;
 > 671					adv7533_in: endpoint@0 {
   672						remote-endpoint = <&dsi_out0>;
   673					};
   674				};
   675				port@1 {
   676					reg = <1>;
   677				};
   678			};
   679		};
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
