Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642404437
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730401367; cv=none; b=u15kDY5Hj/rIsrUK+o4e1Mxkig37LKJiRvd3/98ZjCddb5QaxNP1241TSE9Wn5GdHV8De/mIhttJkSHL2Lx0I7Bl70cuxwR0ZJ2nPbl87dt8rqwzyp5ESE60HYQaebNSGrxGvxlQLH6aw+zy0M2YKc0hu618VdgN/2EayXobVtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730401367; c=relaxed/simple;
	bh=39D45KOypaWicSWyl8AqxdxtYMUYTE8cub6isDMAyWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXCdlZY0HmKT7k/xZ6yJinVeE5owEK2Kk1D4RdZ6dGklbKsTZYxgPDh2LSrvKauv3W+NEcNcCFW8qJJzEXtDayCE5YaQRYGxth1SKeOkfxQ7q6YLHL6IeJaofdDMaCooleWIGCxWtSD6Zs+UZH8RprUQb+VGF3J58clHMpeAuJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUUwehmg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUUwehmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730401365; x=1761937365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=39D45KOypaWicSWyl8AqxdxtYMUYTE8cub6isDMAyWo=;
  b=FUUwehmgELdF/z92+yhZoAVAIh9OYH+0hImceleZqnortQ0wn2dEcGsB
   /uEU7jwHl7gNj1dXmf7lWl58JwS31eKOIyFc1kBOVW3mI7MbYP+xdq+Bt
   +tJhAxUwMpOV2IKI4htRfn0lGAReDbUrYlBX6daKjwiOkkPGhijULoFC4
   /K/ScrNL9A4WV5hhakBE5zPcTF8erqIDapsovxl7TaxpUAOh998iaM1Iq
   1txFIrVijie9Ilp9F2TF0tn+IM2zyCpWTCY8p3mS4AxkVoBKVjEDfN81S
   PTAKd/NLmti7Xje/4PWXtve/dCaYcmG7ROY3dgC37mQGf1CekdFAmPhL0
   g==;
X-CSE-ConnectionGUID: bF29CTXxRuC41i3dgKWkLg==
X-CSE-MsgGUID: 26Yuf6kvScWdByySMjqT6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="40783779"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="40783779"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 12:02:44 -0700
X-CSE-ConnectionGUID: 5QENr7USReGaiHF8Ofs8Lw==
X-CSE-MsgGUID: JLdvHD7BQqmcTAfXgqSE0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87265624"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 12:02:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6aRM-000gd4-21;
	Thu, 31 Oct 2024 19:02:40 +0000
Date: Fri, 1 Nov 2024 03:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 8715/30000]
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:671.28-673.7: Warning
 (unit_address_vs_reg): /soc/i2c@ffd72000/adv7533@39/ports/port@0/endpoint@0:
 node has a unit name, but no reg property
Message-ID: <202411010212.gnaTmiNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   ca48ea8b94307a011f58fdc6efa124ff7f5508f8
commit: 1d65a4b7a6b467a77712051466b33ba4a1c0cc8e [8715/30000] ANDROID: dts: hi3660: Fix duplicate adv7533 nodes
config: arm64-randconfig-001-20241028 (https://download.01.org/0day-ci/archive/20241101/202411010212.gnaTmiNW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010212.gnaTmiNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010212.gnaTmiNW-lkp@intel.com/

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
