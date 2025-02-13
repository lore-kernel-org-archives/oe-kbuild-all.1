Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E039B204F85
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739427349; cv=none; b=uvmOl2xupa9kCKKPnUYWSsCq0Uu81K9uzXJ4cDBfIU5HVr8SqPGahisRn1q9+VACGVHQRnOtpMVii5juawKBAXceL5cJpE2YB3BZEPdnWQWTMkhHRNyA+rQXMZupmIqBUqfLUTve4lB3Wos9/udF8iqTUnTw2CduPuACSQPglLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739427349; c=relaxed/simple;
	bh=Jp4qEE98/ZxPc90aHWDslrD2K7SwKegn+7vCaT+6pd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLIT5LqxU/9Nj484KwBJp3uzxOL3HMwjzu8YvVb/4E5Vi14fbcqA9yqD1zyV2Cl+ve39xnhEGwoEWXZGbfYPNrhfozT/cSW+gcYdRxm93Oa+Qa/MFIKO1ZD4V1bnt7uhh0N2WIGlbEqDiojUyoZ6EWtahCNLqpPWxurF+bYsh7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCFuVfhw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCFuVfhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739427347; x=1770963347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jp4qEE98/ZxPc90aHWDslrD2K7SwKegn+7vCaT+6pd8=;
  b=BCFuVfhwxowa/f9WyZ/vhOAwVCPjM5a7e+g+I1828HczcQeyth+8IzK6
   wZ7wA86UzjtMSmnDzcjVEdfgilY5h4acJhMODBSnWNb3yRXquv1HrAO73
   1d1IJ9bqQfsDi3V2PlDT3/Uq4wzTRWve4GP6lMiu5d0DD0zlKy24d5ulO
   UGPzqb5juz/J/+KIpX7B4hSbNlnYFwhGMZ44W5UxN5dVzhvUu2JORNejs
   02pPFRbDBf/2TMTMupjyrtGnVv8Gx1UNMF0E6xX7vYL8GwPCBsyeZ4sfn
   SfjAwTk0/moAZ9qkz5jaM2JoSmJDQ2eYl0t8I3X8W8KMfpq9AyWVswt/N
   w==;
X-CSE-ConnectionGUID: /uVd9PqXT1KVKQE/3bgzWA==
X-CSE-MsgGUID: Msg+cA4lSauVjeC0Amh60g==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="42952219"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="42952219"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 22:15:45 -0800
X-CSE-ConnectionGUID: p62JosahRDG8Eg9a/wuc1w==
X-CSE-MsgGUID: fW96oayRQyiNioYT3pn/gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113234184"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Feb 2025 22:15:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiSVh-0016cr-1R;
	Thu, 13 Feb 2025 06:15:41 +0000
Date: Thu, 13 Feb 2025 14:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 256/256]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:145.25-196.4: Warning
 (avoid_unnecessary_addr_size): /soc/i2c@13a30000/anx7625@58: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202502131430.Kl0JM6DK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   e7380abfdc679a353de27dc54c91df56ed883e37
commit: b4eab9e707187158fb4d4500df85993cf7f40817 [256/256] CHROMIUM: arm64: dts: mediatek: mt8196: hylia: Add hylia board
config: arm64-randconfig-002-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131430.Kl0JM6DK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131430.Kl0JM6DK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131430.Kl0JM6DK-lkp@intel.com/

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
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:145.25-196.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@13a30000/anx7625@58: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1276.25-1306.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1308.24-1335.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2698.28-2703.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:161.9-172.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:182.11-193.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:249.8-259.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:265.8-275.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +145 arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi

   143	
   144	&i2c4 {
 > 145		anx_bridge: anx7625@58 {
   146			compatible = "analogix,anx7625";
   147			reg = <0x58>;
   148			pinctrl-names = "default";
   149			pinctrl-0 = <&anx7625_pins>;
   150			enable-gpios = <&pio 81 GPIO_ACTIVE_HIGH>;
   151			reset-gpios = <&pio 86 GPIO_ACTIVE_HIGH>;
   152			interrupts-extended = <&pio 14 IRQ_TYPE_LEVEL_LOW>;
   153			vdd10-supply = <&pp1000_dpbrdg>;
   154			vdd18-supply = <&pp1800_dpbrdg>;
   155			vdd33-supply = <&pp3300_dpbrdg>;
   156			analogix,audio-enable;
   157			#address-cells = <1>;
   158			#size-cells = <0>;
   159			#sound-dai-cells = <0>;
   160	
 > 161			ports {
   162				#address-cells = <1>;
   163				#size-cells = <0>;
   164	
   165				port@0 {
   166					reg = <0>;
   167	
   168					anx7625_dp_in: endpoint {
   169						remote-endpoint = <&dsi_out>;
   170					};
   171				};
   172			};
   173	
   174			switches {
   175				#address-cells = <1>;
   176				#size-cells = <0>;
   177				switch@0 {
   178					compatible = "typec-switch";
   179					reg = <0>;
   180					mode-switch;
   181	
 > 182					ports {
   183						#address-cells = <1>;
   184						#size-cells = <0>;
   185	
   186						port@0 {
   187							reg = <0>;
   188	
   189							anx_typec1: endpoint {
   190								remote-endpoint = <&typec_port1>;
   191							};
   192						};
   193					};
   194				};
   195			};
   196		};
   197	};
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
