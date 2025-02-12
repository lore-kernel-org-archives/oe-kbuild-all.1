Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CE5256C70
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 17:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739382868; cv=none; b=azgZVI5vOGfswUa8WQnzjZojBFfLiOnmO0xUXrAvBHeAYXg359T80+han9KWqNR7tBHsINOLfo4aYF9kTG7T0/Tpn/qMXdsfrePdzzqe/cUpMOXcroc2ZAbcwyOCtj8rWwbD/mVKQ7uTXXfMIAD2zR3gaj/f1uhjqsd4uRrNkFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739382868; c=relaxed/simple;
	bh=4Ob1w/dqEoiLEIDiyjMH5jQeXp8LwFwTlwIWwXnjF5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nu/ymvyVQYVVoyXqMinnB3VIw3oZn/ff9jhR5SIJr76RqMaryiRy8lqqH9Tq34DlLkn+UcJFB/+LIU2uYl5SpTsgsSVlGWx8y5vatMXzWuiiROQvxPfqfh41n05ZpNH6ran6IC2mvSLS+GJN5NvgUDEZehSIUHC+78cNOXoL8kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IV3iiB/d; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IV3iiB/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739382866; x=1770918866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Ob1w/dqEoiLEIDiyjMH5jQeXp8LwFwTlwIWwXnjF5o=;
  b=IV3iiB/deQBHupIImNl5SiVVcnLIfyTZ6y+I6FcymSS7zuaHQuGLV8iD
   4sE9hLkjCUjv7CtgWn830APcnVwvHpcoVpc6Zq26mgCopxEL5b5HSnPtb
   JhPRRKmEE8BqdS76VQOUsZIdsGPknNeP5IMuRsHsJJ6CuHxRVl/mS8BAv
   GdhTinaxdZw3QypjHVxam47V4uieqKYh6mpc0+jZjKqIdatVvj8rEPv57
   rIjstSje/Uwtryd5WcVC4q+HFm57caOAASpyBJuxD1S7Wrg0TjttzG3p/
   5/ikl9qyCdG3o2Mh4V6HcwKkiJFFoEceaP7gE3zyKK0oZZdfF+EdvxYP+
   A==;
X-CSE-ConnectionGUID: xS8V7zyoRo2rJYWgAElQ/A==
X-CSE-MsgGUID: k1UDYrWhSBinL85SCehQJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40181405"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="40181405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 09:54:26 -0800
X-CSE-ConnectionGUID: 8yKgBfGkSXS6ndPcYu/AeQ==
X-CSE-MsgGUID: AJMnej+oRkiBBzIpppSm2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136160295"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Feb 2025 09:54:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiGwH-0015xH-2w;
	Wed, 12 Feb 2025 17:54:21 +0000
Date: Thu, 13 Feb 2025 01:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 253/253]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:90.25-137.4: Warning
 (avoid_unnecessary_addr_size): /soc/i2c@13a30000/anx7625@58: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202502130155.gk2nngGN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   93b41cad381ad306bf523ee7dbdc82329ae221db
commit: 94046e2227f4f6d6d32e97628202958d82e7f544 [253/253] CHROMIUM: arm64: dts: mediatek: mt8196: navi: correct tas2563 output channel
config: arm64-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250213/202502130155.gk2nngGN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130155.gk2nngGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130155.gk2nngGN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4715.16-4741.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4743.38-4750.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4752.38-4759.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4761.8-4766.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4768.16-4776.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4778.14-4786.5: Warning (simple_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4788.12-4796.5: Warning (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4798.32-5202.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1151.37-1176.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:90.25-137.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@13a30000/anx7625@58: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1276.25-1306.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1308.24-1335.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2698.28-2703.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:105.9-115.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:125.11-134.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:249.8-259.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:265.8-275.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +90 arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi

94046e2227f4f6 Alvin1 Chen  2024-09-12   88  
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   89  &i2c4 {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  @90  	anx_bridge: anx7625@58 {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   91  		compatible = "analogix,anx7625";
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   92  		reg = <0x58>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   93  		pinctrl-names = "default";
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   94  		pinctrl-0 = <&anx7625_pins>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   95  		enable-gpios = <&pio 81 GPIO_ACTIVE_HIGH>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   96  		reset-gpios = <&pio 86 GPIO_ACTIVE_HIGH>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   97  		interrupts-extended = <&pio 14 IRQ_TYPE_LEVEL_LOW>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   98  		vdd10-supply = <&pp1000_dpbrdg>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22   99  		vdd18-supply = <&pp1800_dpbrdg>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  100  		vdd33-supply = <&pp3300_dpbrdg>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  101  		analogix,audio-enable;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  102  		#address-cells = <1>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  103  		#size-cells = <0>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  104  
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22 @105  		ports {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  106  			#address-cells = <1>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  107  			#size-cells = <0>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  108  
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  109  			port@0 {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  110  				reg = <0>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  111  				anx7625_dp_in: endpoint {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  112  					remote-endpoint = <&dsi_out>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  113  				};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  114  			};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  115  		};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  116  
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  117  		switches {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  118  			#address-cells = <1>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  119  			#size-cells = <0>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  120  			switch@0 {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  121  				compatible = "typec-switch";
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  122  				reg = <0>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  123  				mode-switch;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  124  
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22 @125  				ports {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  126  					#address-cells = <1>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  127  					#size-cells = <0>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  128  					port@0 {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  129  						reg = <0>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  130  						anx_typec0: endpoint {
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  131  							remote-endpoint = <&typec_port0>;
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  132  						};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  133  					};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  134  				};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  135  			};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  136  		};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  137  	};
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  138  };
b0a94e3b1706cc Hsin-Yi Wang 2024-07-22  139  

:::::: The code at line 90 was first introduced by commit
:::::: b0a94e3b1706cce499847ed199b6d8ada459babd CHROMIUM: arm64: dts: mediatek: mt8196: navi: Add anx7625 node

:::::: TO: Hsin-Yi Wang <hsinyi@chromium.org>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
