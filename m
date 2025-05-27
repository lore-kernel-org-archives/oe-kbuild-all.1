Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D743110A1E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748314714; cv=none; b=c5D9m1HFVSpg4fLBSEFKghz1LwbH8+pMo8EebAE0mHiP1bK0HvhCcxni39Fx2Yl25Rrjv6IzdS1KtNb3kPu4NtGadBPLwt7h7clfXHUqx7cnp4rui5kPRAddk2Qaa5vLg13RCVyvAEosBr1uSbYkbnxqt8gAUfGz0i6fB52X7I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748314714; c=relaxed/simple;
	bh=hmUx3QxR8j2H9K6wYVeO5Xhu8iHIDUIVtwpNvAKZTVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WM3xIoOUH/U3sGzlgk+iiwIuLrjOyBH8+vT+eAew0J4kgOMNC1A0ySMXJdaSVZGOy9uwexWmCQyDIgTp5viAuYrG73J9Mg7X+eBUJ+KsQTBfiGN3iDiaaHKA+rWW9msjGW1L6+4KayFu1V3KUEq0z5qBYxipW05+a2cV48F6uZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCl+z7cT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCl+z7cT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748314700; x=1779850700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmUx3QxR8j2H9K6wYVeO5Xhu8iHIDUIVtwpNvAKZTVo=;
  b=PCl+z7cTh5JAIhfCn7lbLVS/xrexuJb2QRCSyD4GtMHuyVkEvlPq/rqu
   KyIORMk0Gi5/ZD1Xb9UEjWkRMFWCCX/PL+dDTmrvoe8aGWyYK5mUEbYwd
   nRtkn6nr5orpFMufnlAT4UNVjBSXaeALfpCqeAkJxBSn1nP+Qsbj3wybQ
   eaWzYSPq5O7nHRRX0EGMRAY7N5iW0RDSrQjm+J4PAJDDSg3w/+iliriz8
   RNsShSShjnyq4K7ix/ExJAIniFnPl17g8XTVHXwsKfHRwTuv10ysoZ5Qi
   2QaJwzLMDbNkZlVcGPoFQcmxImzfVXHLli19qLXS4QBVmxhhFSMD51ab1
   w==;
X-CSE-ConnectionGUID: kHtpXPD9Tv6JaIzF8FItxg==
X-CSE-MsgGUID: Mzklh/uyT9yhDgNhJkDrvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67830324"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="67830324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 19:58:18 -0700
X-CSE-ConnectionGUID: gZxh0RdrSXKEdQVzqNVNoA==
X-CSE-MsgGUID: O3MTAiPpTk+ILgvCeiZ6MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142579630"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 May 2025 19:58:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJkW5-000SqJ-2x;
	Tue, 27 May 2025 02:58:13 +0000
Date: Tue, 27 May 2025 10:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:1260.31-1264.5: Warning
 (unique_unit_address_if_enabled): /soc/gpu-fdvfs@13f800: duplicate
 unit-address (also used in node /soc/gpu-qos@13f800)
Message-ID: <202505271044.Up6Me4Vc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: aa8f4e4d0ce6a75c347479c6484e17342e049cd9 [133/133] CHROMIUM: arm64: dts: mediatek: mt8196: support gpu qos
config: arm64-randconfig-003-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271044.Up6Me4Vc-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271044.Up6Me4Vc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271044.Up6Me4Vc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5280.38-5287.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5289.8-5294.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5296.16-5304.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5306.14-5314.5: Warning (simple_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5316.12-5324.5: Warning (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5326.32-5730.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1449.37-1474.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:149.25-200.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@13a30000/anx7625@58: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:1260.31-1264.5: Warning (unique_unit_address_if_enabled): /soc/gpu-fdvfs@13f800: duplicate unit-address (also used in node /soc/gpu-qos@13f800)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1574.25-1604.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1606.24-1633.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3008.28-3013.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:165.9-176.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:186.11-197.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5280.38-5287.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5289.8-5294.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5296.16-5304.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5306.14-5314.5: Warning (simple_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5316.12-5324.5: Warning (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5326.32-5730.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1449.37-1474.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:95.25-143.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@13a30000/anx7625@58: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:1260.31-1264.5: Warning (unique_unit_address_if_enabled): /soc/gpu-fdvfs@13f800: duplicate unit-address (also used in node /soc/gpu-qos@13f800)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1574.25-1604.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1606.24-1633.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3008.28-3013.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:111.9-121.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:131.11-140.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5147.16-5199.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5201.16-5259.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5271.38-5278.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5280.38-5287.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5289.8-5294.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5296.16-5304.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5306.14-5314.5: Warning (simple_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5316.12-5324.5: Warning (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5326.32-5730.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1449.37-1474.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:1260.31-1264.5: Warning (unique_unit_address_if_enabled): /soc/gpu-fdvfs@13f800: duplicate unit-address (also used in node /soc/gpu-qos@13f800)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1574.25-1604.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1606.24-1633.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:58.8-68.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:74.8-84.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5201.16-5259.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5271.38-5278.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5280.38-5287.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5289.8-5294.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5296.16-5304.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5306.14-5314.5: Warning (simple_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5316.12-5324.5: Warning (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:5326.32-5730.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1449.37-1474.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:1260.31-1264.5: Warning (unique_unit_address_if_enabled): /soc/gpu-fdvfs@13f800: duplicate unit-address (also used in node /soc/gpu-qos@13f800)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1574.25-1604.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1606.24-1633.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3008.28-3013.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1260 arch/arm64/boot/dts/mediatek/mt8196.dtsi

3a88be54312101 Xavier Chang   2024-01-08    21  
3a88be54312101 Xavier Chang   2024-01-08    22  / {
3a88be54312101 Xavier Chang   2024-01-08    23  	compatible = "mediatek,mt8196";
3a88be54312101 Xavier Chang   2024-01-08    24  	interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08    25  	#address-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08    26  	#size-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08    27  
3a88be54312101 Xavier Chang   2024-01-08    28  	aliases {
fe693c3f6e9a12 Nancy Lin      2024-03-23    29  		blender0 = &disp_ovl0_blender0;
fe693c3f6e9a12 Nancy Lin      2024-03-23    30  		blender1 = &disp_ovl0_blender1;
fe693c3f6e9a12 Nancy Lin      2024-03-23    31  		blender2 = &disp_ovl0_blender2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    32  		blender3 = &disp_ovl0_blender3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    33  		blender4 = &disp_ovl0_blender4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    34  		blender5 = &disp_ovl0_blender5;
fe693c3f6e9a12 Nancy Lin      2024-03-23    35  		blender6 = &disp_ovl0_blender6;
fe693c3f6e9a12 Nancy Lin      2024-03-23    36  		blender7 = &disp_ovl0_blender7;
fe693c3f6e9a12 Nancy Lin      2024-03-23    37  		blender8 = &disp_ovl0_blender8;
fe693c3f6e9a12 Nancy Lin      2024-03-23    38  		blender9 = &disp_ovl0_blender9;
fe693c3f6e9a12 Nancy Lin      2024-03-23    39  		blender10 = &disp_ovl1_blender0;
fe693c3f6e9a12 Nancy Lin      2024-03-23    40  		blender11 = &disp_ovl1_blender1;
fe693c3f6e9a12 Nancy Lin      2024-03-23    41  		blender12 = &disp_ovl1_blender2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    42  		blender13 = &disp_ovl1_blender3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    43  		blender14 = &disp_ovl1_blender4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    44  		blender15 = &disp_ovl1_blender5;
fe693c3f6e9a12 Nancy Lin      2024-03-23    45  		blender16 = &disp_ovl1_blender6;
fe693c3f6e9a12 Nancy Lin      2024-03-23    46  		blender17 = &disp_ovl1_blender7;
fe693c3f6e9a12 Nancy Lin      2024-03-23    47  		blender18 = &disp_ovl1_blender8;
fe693c3f6e9a12 Nancy Lin      2024-03-23    48  		blender19 = &disp_ovl1_blender9;
811d357337456b Sunny.Shen     2024-06-24    49  		ccorr0 = &disp_ccorr0;
811d357337456b Sunny.Shen     2024-06-24    50  		ccorr1 = &disp_ccorr1;
811d357337456b Sunny.Shen     2024-06-24    51  		dither0 = &disp_dither0;
3eb254258f2631 Jason-jh Lin   2025-01-16    52  		dp-intf0 = &dp_intf0;
ebbc0e1103cfde Mac Shen       2024-06-27    53  		dp-intf1 = &dp_intf1;
13ecc998839331 Jason-jh Lin   2025-01-17    54  		dsc0 = &disp_dsc0;
13ecc998839331 Jason-jh Lin   2025-01-17    55  		dsc1 = &disp_dsc1;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16    56  		dvo0 = &disp_dvo0;
fe693c3f6e9a12 Nancy Lin      2024-03-23    57  		exdma2 = &disp_ovl0_exdma2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    58  		exdma3 = &disp_ovl0_exdma3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    59  		exdma4 = &disp_ovl0_exdma4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    60  		exdma5 = &disp_ovl0_exdma5;
fe693c3f6e9a12 Nancy Lin      2024-03-23    61  		exdma6 = &disp_ovl0_exdma6;
fe693c3f6e9a12 Nancy Lin      2024-03-23    62  		exdma7 = &disp_ovl0_exdma7;
fe693c3f6e9a12 Nancy Lin      2024-03-23    63  		exdma8 = &disp_ovl0_exdma8;
fe693c3f6e9a12 Nancy Lin      2024-03-23    64  		exdma9 = &disp_ovl0_exdma9;
fe693c3f6e9a12 Nancy Lin      2024-03-23    65  		exdma12 = &disp_ovl1_exdma2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    66  		exdma13 = &disp_ovl1_exdma3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    67  		exdma14 = &disp_ovl1_exdma4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    68  		exdma15 = &disp_ovl1_exdma5;
fe693c3f6e9a12 Nancy Lin      2024-03-23    69  		exdma16 = &disp_ovl1_exdma6;
fe693c3f6e9a12 Nancy Lin      2024-03-23    70  		exdma17 = &disp_ovl1_exdma7;
fe693c3f6e9a12 Nancy Lin      2024-03-23    71  		exdma18 = &disp_ovl1_exdma8;
fe693c3f6e9a12 Nancy Lin      2024-03-23    72  		exdma19 = &disp_ovl1_exdma9;
811d357337456b Sunny.Shen     2024-06-24    73  		gamma0 = &disp_gamma0;
3a88be54312101 Xavier Chang   2024-01-08    74  		i2c0 = &i2c0;
3a88be54312101 Xavier Chang   2024-01-08    75  		i2c1 = &i2c1;
3a88be54312101 Xavier Chang   2024-01-08    76  		i2c2 = &i2c2;
3a88be54312101 Xavier Chang   2024-01-08    77  		i2c3 = &i2c3;
3a88be54312101 Xavier Chang   2024-01-08    78  		i2c4 = &i2c4;
3a88be54312101 Xavier Chang   2024-01-08    79  		i2c5 = &i2c5;
3a88be54312101 Xavier Chang   2024-01-08    80  		i2c6 = &i2c6;
3a88be54312101 Xavier Chang   2024-01-08    81  		i2c7 = &i2c7;
3a88be54312101 Xavier Chang   2024-01-08    82  		i2c8 = &i2c8;
3a88be54312101 Xavier Chang   2024-01-08    83  		i2c9 = &i2c9;
3a88be54312101 Xavier Chang   2024-01-08    84  		i2c10 = &i2c10;
3a88be54312101 Xavier Chang   2024-01-08    85  		i2c11 = &i2c11;
3a88be54312101 Xavier Chang   2024-01-08    86  		i2c12 = &i2c12;
3a88be54312101 Xavier Chang   2024-01-08    87  		i2c13 = &i2c13;
3a88be54312101 Xavier Chang   2024-01-08    88  		i2c14 = &i2c14;
64b149becb1a40 Sunny.Shen     2024-06-24    89  		mdp-rsz0 = &disp_mdp_rsz0;
3a88be54312101 Xavier Chang   2024-01-08    90  		mmc1 = &mmc1;
3a88be54312101 Xavier Chang   2024-01-08    91  		mmc2 = &mmc2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    92  		mutex0 = &disp0_mutex;
fe693c3f6e9a12 Nancy Lin      2024-03-23    93  		mutex1 = &disp1_mutex;
fe693c3f6e9a12 Nancy Lin      2024-03-23    94  		mutex2 = &ovl0_mutex;
fe693c3f6e9a12 Nancy Lin      2024-03-23    95  		mutex3 = &ovl1_mutex;
fe693c3f6e9a12 Nancy Lin      2024-03-23    96  		outproc0 = &disp_ovl0_outproc0;
fe693c3f6e9a12 Nancy Lin      2024-03-23    97  		outproc1 = &disp_ovl0_outproc1;
fe693c3f6e9a12 Nancy Lin      2024-03-23    98  		outproc2 = &disp_ovl0_outproc2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    99  		outproc3 = &disp_ovl0_outproc3;
fe693c3f6e9a12 Nancy Lin      2024-03-23   100  		outproc4 = &disp_ovl0_outproc4;
fe693c3f6e9a12 Nancy Lin      2024-03-23   101  		outproc5 = &disp_ovl0_outproc5;
fe693c3f6e9a12 Nancy Lin      2024-03-23   102  		outproc6 = &disp_ovl1_outproc0;
fe693c3f6e9a12 Nancy Lin      2024-03-23   103  		outproc7 = &disp_ovl1_outproc1;
fe693c3f6e9a12 Nancy Lin      2024-03-23   104  		outproc8 = &disp_ovl1_outproc2;
fe693c3f6e9a12 Nancy Lin      2024-03-23   105  		outproc9 = &disp_ovl1_outproc3;
fe693c3f6e9a12 Nancy Lin      2024-03-23   106  		outproc10 = &disp_ovl1_outproc4;
fe693c3f6e9a12 Nancy Lin      2024-03-23   107  		outproc11 = &disp_ovl1_outproc5;
64b149becb1a40 Sunny.Shen     2024-06-24   108  		postmask0 = &disp_postmask0;
3a88be54312101 Xavier Chang   2024-01-08   109  		serial0 = &uart0;
3a88be54312101 Xavier Chang   2024-01-08   110  		spi0 = &spi0;
3a88be54312101 Xavier Chang   2024-01-08   111  		spi1 = &spi1;
3a88be54312101 Xavier Chang   2024-01-08   112  		spi2 = &spi2;
3a88be54312101 Xavier Chang   2024-01-08   113  		spi3 = &spi3;
3a88be54312101 Xavier Chang   2024-01-08   114  		spi4 = &spi4;
3a88be54312101 Xavier Chang   2024-01-08   115  		spi5 = &spi5;
3a88be54312101 Xavier Chang   2024-01-08   116  		spi6 = &spi6;
3a88be54312101 Xavier Chang   2024-01-08   117  		spi7 = &spi7;
811d357337456b Sunny.Shen     2024-06-24   118  		tdshp0 = &disp_tdshp0;
fe693c3f6e9a12 Nancy Lin      2024-03-23   119  		vdisp-ao = &disp_vdisp_ao_config_clk;
3a88be54312101 Xavier Chang   2024-01-08   120  	};
3a88be54312101 Xavier Chang   2024-01-08   121  
3a88be54312101 Xavier Chang   2024-01-08   122  	cpus {
3a88be54312101 Xavier Chang   2024-01-08   123  		#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08   124  		#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   125  
3a88be54312101 Xavier Chang   2024-01-08   126  		cpu0: cpu@0 {
3a88be54312101 Xavier Chang   2024-01-08   127  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   128  			compatible = "arm,cortex-a720";
3a88be54312101 Xavier Chang   2024-01-08   129  			reg = <0x000>;
3a88be54312101 Xavier Chang   2024-01-08   130  			performance-domains = <&performance 0>;
3a88be54312101 Xavier Chang   2024-01-08   131  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   132  			clock-frequency = <2100000000>;
3a88be54312101 Xavier Chang   2024-01-08   133  			capacity-dmips-mhz = <714>;
6737b000ef8c13 Wenzhen Yu     2025-02-13   134  			cpu-idle-states = <&cpuoff_l &clusteroff_l &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   135  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   136  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   137  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   138  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   139  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   140  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   141  			next-level-cache = <&l2_0>;
3a88be54312101 Xavier Chang   2024-01-08   142  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   143  		};
3a88be54312101 Xavier Chang   2024-01-08   144  
3a88be54312101 Xavier Chang   2024-01-08   145  		cpu1: cpu@100 {
3a88be54312101 Xavier Chang   2024-01-08   146  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   147  			compatible = "arm,cortex-a720";
3a88be54312101 Xavier Chang   2024-01-08   148  			reg = <0x100>;
3a88be54312101 Xavier Chang   2024-01-08   149  			performance-domains = <&performance 0>;
3a88be54312101 Xavier Chang   2024-01-08   150  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   151  			clock-frequency = <2100000000>;
3a88be54312101 Xavier Chang   2024-01-08   152  			capacity-dmips-mhz = <714>;
6737b000ef8c13 Wenzhen Yu     2025-02-13   153  			cpu-idle-states = <&cpuoff_l &clusteroff_l &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   154  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   155  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   156  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   157  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   158  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   159  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   160  			next-level-cache = <&l2_0>;
3a88be54312101 Xavier Chang   2024-01-08   161  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   162  		};
3a88be54312101 Xavier Chang   2024-01-08   163  
3a88be54312101 Xavier Chang   2024-01-08   164  		cpu2: cpu@200 {
3a88be54312101 Xavier Chang   2024-01-08   165  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   166  			compatible = "arm,cortex-a720";
3a88be54312101 Xavier Chang   2024-01-08   167  			reg = <0x200>;
3a88be54312101 Xavier Chang   2024-01-08   168  			performance-domains = <&performance 0>;
3a88be54312101 Xavier Chang   2024-01-08   169  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   170  			clock-frequency = <2100000000>;
3a88be54312101 Xavier Chang   2024-01-08   171  			capacity-dmips-mhz = <714>;
6737b000ef8c13 Wenzhen Yu     2025-02-13   172  			cpu-idle-states = <&cpuoff_l &clusteroff_l &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   173  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   174  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   175  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   176  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   177  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   178  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   179  			next-level-cache = <&l2_0>;
3a88be54312101 Xavier Chang   2024-01-08   180  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   181  		};
3a88be54312101 Xavier Chang   2024-01-08   182  
3a88be54312101 Xavier Chang   2024-01-08   183  		cpu3: cpu@300 {
3a88be54312101 Xavier Chang   2024-01-08   184  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   185  			compatible = "arm,cortex-a720";
3a88be54312101 Xavier Chang   2024-01-08   186  			reg = <0x300>;
3a88be54312101 Xavier Chang   2024-01-08   187  			performance-domains = <&performance 0>;
3a88be54312101 Xavier Chang   2024-01-08   188  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   189  			clock-frequency = <2100000000>;
3a88be54312101 Xavier Chang   2024-01-08   190  			capacity-dmips-mhz = <714>;
6737b000ef8c13 Wenzhen Yu     2025-02-13   191  			cpu-idle-states = <&cpuoff_l &clusteroff_l &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   192  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   193  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   194  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   195  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   196  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   197  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   198  			next-level-cache = <&l2_0>;
3a88be54312101 Xavier Chang   2024-01-08   199  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   200  		};
3a88be54312101 Xavier Chang   2024-01-08   201  
3a88be54312101 Xavier Chang   2024-01-08   202  		cpu4: cpu@400 {
3a88be54312101 Xavier Chang   2024-01-08   203  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   204  			compatible = "arm,cortex-x4";
3a88be54312101 Xavier Chang   2024-01-08   205  			reg = <0x400>;
3a88be54312101 Xavier Chang   2024-01-08   206  			performance-domains = <&performance 1>;
3a88be54312101 Xavier Chang   2024-01-08   207  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   208  			clock-frequency = <2800000000>;
fd00cab3fe36e4 Xavier Chang   2025-01-09   209  			capacity-dmips-mhz = <835>;
6737b000ef8c13 Wenzhen Yu     2025-02-13   210  			cpu-idle-states = <&cpuoff_m &clusteroff_m &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   211  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   212  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   213  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   214  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   215  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   216  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   217  			next-level-cache = <&l2_1>;
3a88be54312101 Xavier Chang   2024-01-08   218  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   219  		};
3a88be54312101 Xavier Chang   2024-01-08   220  
3a88be54312101 Xavier Chang   2024-01-08   221  		cpu5: cpu@500 {
3a88be54312101 Xavier Chang   2024-01-08   222  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   223  			compatible = "arm,cortex-x4";
3a88be54312101 Xavier Chang   2024-01-08   224  			reg = <0x500>;
3a88be54312101 Xavier Chang   2024-01-08   225  			performance-domains = <&performance 1>;
3a88be54312101 Xavier Chang   2024-01-08   226  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   227  			clock-frequency = <2800000000>;
fd00cab3fe36e4 Xavier Chang   2025-01-09   228  			capacity-dmips-mhz = <835>;
6737b000ef8c13 Wenzhen Yu     2025-02-13   229  			cpu-idle-states = <&cpuoff_m &clusteroff_m &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   230  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   231  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   232  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   233  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   234  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   235  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   236  			next-level-cache = <&l2_1>;
3a88be54312101 Xavier Chang   2024-01-08   237  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   238  		};
3a88be54312101 Xavier Chang   2024-01-08   239  
3a88be54312101 Xavier Chang   2024-01-08   240  		cpu6: cpu@600 {
3a88be54312101 Xavier Chang   2024-01-08   241  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   242  			compatible = "arm,cortex-x4";
3a88be54312101 Xavier Chang   2024-01-08   243  			reg = <0x600>;
3a88be54312101 Xavier Chang   2024-01-08   244  			performance-domains = <&performance 1>;
3a88be54312101 Xavier Chang   2024-01-08   245  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   246  			clock-frequency = <2800000000>;
fd00cab3fe36e4 Xavier Chang   2025-01-09   247  			capacity-dmips-mhz = <835>;
6737b000ef8c13 Wenzhen Yu     2025-02-13   248  			cpu-idle-states = <&cpuoff_m &clusteroff_m &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   249  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   250  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   251  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   252  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   253  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   254  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   255  			next-level-cache = <&l2_1>;
3a88be54312101 Xavier Chang   2024-01-08   256  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   257  		};
3a88be54312101 Xavier Chang   2024-01-08   258  
3a88be54312101 Xavier Chang   2024-01-08   259  		cpu7: cpu@700 {
3a88be54312101 Xavier Chang   2024-01-08   260  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   261  			compatible = "arm,cortex-x925";
3a88be54312101 Xavier Chang   2024-01-08   262  			reg = <0x700>;
3a88be54312101 Xavier Chang   2024-01-08   263  			performance-domains = <&performance 2>;
3a88be54312101 Xavier Chang   2024-01-08   264  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   265  			clock-frequency = <3600000000>;
fd00cab3fe36e4 Xavier Chang   2025-01-09   266  			capacity-dmips-mhz = <1024>;
6737b000ef8c13 Wenzhen Yu     2025-02-13   267  			cpu-idle-states = <&cpuoff_b &clusteroff_b &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   268  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   269  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   270  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   271  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   272  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   273  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   274  			next-level-cache = <&l2_2>;
3a88be54312101 Xavier Chang   2024-01-08   275  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   276  		};
3a88be54312101 Xavier Chang   2024-01-08   277  
3a88be54312101 Xavier Chang   2024-01-08   278  		cpu-map {
3a88be54312101 Xavier Chang   2024-01-08   279  			cluster0 {
3a88be54312101 Xavier Chang   2024-01-08   280  				core0 {
3a88be54312101 Xavier Chang   2024-01-08   281  					cpu = <&cpu0>;
3a88be54312101 Xavier Chang   2024-01-08   282  				};
3a88be54312101 Xavier Chang   2024-01-08   283  				core1 {
3a88be54312101 Xavier Chang   2024-01-08   284  					cpu = <&cpu1>;
3a88be54312101 Xavier Chang   2024-01-08   285  				};
3a88be54312101 Xavier Chang   2024-01-08   286  				core2 {
3a88be54312101 Xavier Chang   2024-01-08   287  					cpu = <&cpu2>;
3a88be54312101 Xavier Chang   2024-01-08   288  				};
3a88be54312101 Xavier Chang   2024-01-08   289  				core3 {
3a88be54312101 Xavier Chang   2024-01-08   290  					cpu = <&cpu3>;
3a88be54312101 Xavier Chang   2024-01-08   291  				};
3a88be54312101 Xavier Chang   2024-01-08   292  			};
3a88be54312101 Xavier Chang   2024-01-08   293  
3a88be54312101 Xavier Chang   2024-01-08   294  			cluster1 {
3a88be54312101 Xavier Chang   2024-01-08   295  				core0 {
3a88be54312101 Xavier Chang   2024-01-08   296  					cpu = <&cpu4>;
3a88be54312101 Xavier Chang   2024-01-08   297  				};
3a88be54312101 Xavier Chang   2024-01-08   298  				core1 {
3a88be54312101 Xavier Chang   2024-01-08   299  					cpu = <&cpu5>;
3a88be54312101 Xavier Chang   2024-01-08   300  				};
3a88be54312101 Xavier Chang   2024-01-08   301  				core2 {
3a88be54312101 Xavier Chang   2024-01-08   302  					cpu = <&cpu6>;
3a88be54312101 Xavier Chang   2024-01-08   303  				};
3a88be54312101 Xavier Chang   2024-01-08   304  			};
3a88be54312101 Xavier Chang   2024-01-08   305  
3a88be54312101 Xavier Chang   2024-01-08   306  			cluster2 {
3a88be54312101 Xavier Chang   2024-01-08   307  				core0 {
3a88be54312101 Xavier Chang   2024-01-08   308  					cpu = <&cpu7>;
3a88be54312101 Xavier Chang   2024-01-08   309  				};
3a88be54312101 Xavier Chang   2024-01-08   310  			};
3a88be54312101 Xavier Chang   2024-01-08   311  		};
3a88be54312101 Xavier Chang   2024-01-08   312  
3a88be54312101 Xavier Chang   2024-01-08   313  		idle-states {
3a88be54312101 Xavier Chang   2024-01-08   314  			entry-method = "arm,psci";
3a88be54312101 Xavier Chang   2024-01-08   315  			cpuoff_l: cpuoff-l {
3a88be54312101 Xavier Chang   2024-01-08   316  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   317  				arm,psci-suspend-param = <0x00010000>;
3a88be54312101 Xavier Chang   2024-01-08   318  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   319  				entry-latency-us = <97>;
3a88be54312101 Xavier Chang   2024-01-08   320  				exit-latency-us = <252>;
3a88be54312101 Xavier Chang   2024-01-08   321  				min-residency-us = <6710>;
3a88be54312101 Xavier Chang   2024-01-08   322  			};
3a88be54312101 Xavier Chang   2024-01-08   323  
3a88be54312101 Xavier Chang   2024-01-08   324  			cpuoff_m: cpuoff-m {
3a88be54312101 Xavier Chang   2024-01-08   325  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   326  				arm,psci-suspend-param = <0x00010000>;
3a88be54312101 Xavier Chang   2024-01-08   327  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   328  				entry-latency-us = <53>;
3a88be54312101 Xavier Chang   2024-01-08   329  				exit-latency-us = <143>;
3a88be54312101 Xavier Chang   2024-01-08   330  				min-residency-us = <2120>;
3a88be54312101 Xavier Chang   2024-01-08   331  			};
3a88be54312101 Xavier Chang   2024-01-08   332  
3a88be54312101 Xavier Chang   2024-01-08   333  			cpuoff_b: cpuoff-b {
3a88be54312101 Xavier Chang   2024-01-08   334  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   335  				arm,psci-suspend-param = <0x00010000>;
3a88be54312101 Xavier Chang   2024-01-08   336  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   337  				entry-latency-us = <40>;
3a88be54312101 Xavier Chang   2024-01-08   338  				exit-latency-us = <107>;
3a88be54312101 Xavier Chang   2024-01-08   339  				min-residency-us = <2580>;
3a88be54312101 Xavier Chang   2024-01-08   340  			};
3a88be54312101 Xavier Chang   2024-01-08   341  
3a88be54312101 Xavier Chang   2024-01-08   342  			clusteroff_l: clusteroff-l {
3a88be54312101 Xavier Chang   2024-01-08   343  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   344  				arm,psci-suspend-param = <0x01010001>;
3a88be54312101 Xavier Chang   2024-01-08   345  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   346  				entry-latency-us = <109>;
3a88be54312101 Xavier Chang   2024-01-08   347  				exit-latency-us = <325>;
3a88be54312101 Xavier Chang   2024-01-08   348  				min-residency-us = <6710>;
3a88be54312101 Xavier Chang   2024-01-08   349  			};
3a88be54312101 Xavier Chang   2024-01-08   350  
3a88be54312101 Xavier Chang   2024-01-08   351  			clusteroff_m: clusteroff-m {
3a88be54312101 Xavier Chang   2024-01-08   352  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   353  				arm,psci-suspend-param = <0x01010001>;
3a88be54312101 Xavier Chang   2024-01-08   354  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   355  				entry-latency-us = <59>;
3a88be54312101 Xavier Chang   2024-01-08   356  				exit-latency-us = <188>;
3a88be54312101 Xavier Chang   2024-01-08   357  				min-residency-us = <2120>;
3a88be54312101 Xavier Chang   2024-01-08   358  			};
3a88be54312101 Xavier Chang   2024-01-08   359  
3a88be54312101 Xavier Chang   2024-01-08   360  			clusteroff_b: clusteroff-b {
3a88be54312101 Xavier Chang   2024-01-08   361  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   362  				arm,psci-suspend-param = <0x01010001>;
3a88be54312101 Xavier Chang   2024-01-08   363  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   364  				entry-latency-us = <43>;
3a88be54312101 Xavier Chang   2024-01-08   365  				exit-latency-us = <138>;
3a88be54312101 Xavier Chang   2024-01-08   366  				min-residency-us = <2580>;
3a88be54312101 Xavier Chang   2024-01-08   367  			};
3a88be54312101 Xavier Chang   2024-01-08   368  
3a88be54312101 Xavier Chang   2024-01-08   369  			mcusysoff_l: mcusysoff-l {
3a88be54312101 Xavier Chang   2024-01-08   370  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   371  				arm,psci-suspend-param = <0x02010007>;
3a88be54312101 Xavier Chang   2024-01-08   372  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   373  				entry-latency-us = <1357>;
3a88be54312101 Xavier Chang   2024-01-08   374  				exit-latency-us = <835>;
3a88be54312101 Xavier Chang   2024-01-08   375  				min-residency-us = <6710>;
3a88be54312101 Xavier Chang   2024-01-08   376  			};
3a88be54312101 Xavier Chang   2024-01-08   377  
3a88be54312101 Xavier Chang   2024-01-08   378  			mcusysoff_m: mcusysoff-m {
3a88be54312101 Xavier Chang   2024-01-08   379  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   380  				arm,psci-suspend-param = <0x02010007>;
3a88be54312101 Xavier Chang   2024-01-08   381  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   382  				entry-latency-us = <1202>;
3a88be54312101 Xavier Chang   2024-01-08   383  				exit-latency-us = <679>;
3a88be54312101 Xavier Chang   2024-01-08   384  				min-residency-us = <2120>;
3a88be54312101 Xavier Chang   2024-01-08   385  			};
3a88be54312101 Xavier Chang   2024-01-08   386  
3a88be54312101 Xavier Chang   2024-01-08   387  			mcusysoff_b: mcusysoff-b {
3a88be54312101 Xavier Chang   2024-01-08   388  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   389  				arm,psci-suspend-param = <0x02010007>;
3a88be54312101 Xavier Chang   2024-01-08   390  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   391  				entry-latency-us = <1143>;
3a88be54312101 Xavier Chang   2024-01-08   392  				exit-latency-us = <611>;
3a88be54312101 Xavier Chang   2024-01-08   393  				min-residency-us = <2580>;
3a88be54312101 Xavier Chang   2024-01-08   394  			};
3a88be54312101 Xavier Chang   2024-01-08   395  
3a88be54312101 Xavier Chang   2024-01-08   396  			system_vcore: system-vcore {
3a88be54312101 Xavier Chang   2024-01-08   397  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   398  				arm,psci-suspend-param = <0x020100ff>;
3a88be54312101 Xavier Chang   2024-01-08   399  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   400  				entry-latency-us = <940>;
3a88be54312101 Xavier Chang   2024-01-08   401  				exit-latency-us = <3500>;
3a88be54312101 Xavier Chang   2024-01-08   402  				min-residency-us = <35200>;
3a88be54312101 Xavier Chang   2024-01-08   403  			};
3a88be54312101 Xavier Chang   2024-01-08   404  
3a88be54312101 Xavier Chang   2024-01-08   405  			s2idle: s2idle {
3a88be54312101 Xavier Chang   2024-01-08   406  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   407  				arm,psci-suspend-param = <0x020180ff>;
3a88be54312101 Xavier Chang   2024-01-08   408  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   409  				entry-latency-us = <10000>;
3a88be54312101 Xavier Chang   2024-01-08   410  				exit-latency-us = <10000>;
3a88be54312101 Xavier Chang   2024-01-08   411  				min-residency-us = <4294967295>;
3a88be54312101 Xavier Chang   2024-01-08   412  			};
3a88be54312101 Xavier Chang   2024-01-08   413  		};
3a88be54312101 Xavier Chang   2024-01-08   414  
3a88be54312101 Xavier Chang   2024-01-08   415  		l2_0: l2-cache0 {
3a88be54312101 Xavier Chang   2024-01-08   416  			compatible = "cache";
3a88be54312101 Xavier Chang   2024-01-08   417  			cache-level = <2>;
3a88be54312101 Xavier Chang   2024-01-08   418  			cache-size = <524288>;
3a88be54312101 Xavier Chang   2024-01-08   419  			cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   420  			cache-sets = <2048>;
3a88be54312101 Xavier Chang   2024-01-08   421  			next-level-cache = <&l3_0>;
3a88be54312101 Xavier Chang   2024-01-08   422  			cache-unified;
3a88be54312101 Xavier Chang   2024-01-08   423  		};
3a88be54312101 Xavier Chang   2024-01-08   424  
3a88be54312101 Xavier Chang   2024-01-08   425  		l2_1: l2-cache1 {
3a88be54312101 Xavier Chang   2024-01-08   426  			compatible = "cache";
3a88be54312101 Xavier Chang   2024-01-08   427  			cache-level = <2>;
3a88be54312101 Xavier Chang   2024-01-08   428  			cache-size = <1048576>;
3a88be54312101 Xavier Chang   2024-01-08   429  			cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   430  			cache-sets = <4096>;
3a88be54312101 Xavier Chang   2024-01-08   431  			next-level-cache = <&l3_0>;
3a88be54312101 Xavier Chang   2024-01-08   432  			cache-unified;
3a88be54312101 Xavier Chang   2024-01-08   433  		};
3a88be54312101 Xavier Chang   2024-01-08   434  
3a88be54312101 Xavier Chang   2024-01-08   435  		l2_2: l2-cache2 {
3a88be54312101 Xavier Chang   2024-01-08   436  			compatible = "cache";
3a88be54312101 Xavier Chang   2024-01-08   437  			cache-level = <2>;
3a88be54312101 Xavier Chang   2024-01-08   438  			cache-size = <2097152>;
3a88be54312101 Xavier Chang   2024-01-08   439  			cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   440  			cache-sets = <8192>;
3a88be54312101 Xavier Chang   2024-01-08   441  			next-level-cache = <&l3_0>;
3a88be54312101 Xavier Chang   2024-01-08   442  			cache-unified;
3a88be54312101 Xavier Chang   2024-01-08   443  		};
3a88be54312101 Xavier Chang   2024-01-08   444  
3a88be54312101 Xavier Chang   2024-01-08   445  		l3_0: l3-cache {
3a88be54312101 Xavier Chang   2024-01-08   446  			compatible = "cache";
3a88be54312101 Xavier Chang   2024-01-08   447  			cache-level = <3>;
3a88be54312101 Xavier Chang   2024-01-08   448  			cache-size = <12582912>;
3a88be54312101 Xavier Chang   2024-01-08   449  			cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   450  			cache-sets = <49152>;
3a88be54312101 Xavier Chang   2024-01-08   451  			cache-unified;
3a88be54312101 Xavier Chang   2024-01-08   452  		};
3a88be54312101 Xavier Chang   2024-01-08   453  	};
3a88be54312101 Xavier Chang   2024-01-08   454  
3a88be54312101 Xavier Chang   2024-01-08   455  	clk_ao: clk-ao {
3a88be54312101 Xavier Chang   2024-01-08   456  		compatible = "simple-bus";
3a88be54312101 Xavier Chang   2024-01-08   457  		#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08   458  		#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   459  	};
3a88be54312101 Xavier Chang   2024-01-08   460  
3a88be54312101 Xavier Chang   2024-01-08   461  	clkitg: clkitg {
3a88be54312101 Xavier Chang   2024-01-08   462  		compatible = "simple-bus";
3a88be54312101 Xavier Chang   2024-01-08   463  		#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08   464  		#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   465  	};
3a88be54312101 Xavier Chang   2024-01-08   466  
3a88be54312101 Xavier Chang   2024-01-08   467  	clocks {
3a88be54312101 Xavier Chang   2024-01-08   468  		clk_null: clk-null {
3a88be54312101 Xavier Chang   2024-01-08   469  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   470  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   471  			clock-frequency = <0>;
3a88be54312101 Xavier Chang   2024-01-08   472  		};
3a88be54312101 Xavier Chang   2024-01-08   473  
3a88be54312101 Xavier Chang   2024-01-08   474  		clk32k: clk32k {
3a88be54312101 Xavier Chang   2024-01-08   475  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   476  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   477  			clock-frequency = <32000>;
3a88be54312101 Xavier Chang   2024-01-08   478  		};
3a88be54312101 Xavier Chang   2024-01-08   479  
3a88be54312101 Xavier Chang   2024-01-08   480  		clk13m: clk13m {
3a88be54312101 Xavier Chang   2024-01-08   481  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   482  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   483  			clock-frequency = <13000000>;
3a88be54312101 Xavier Chang   2024-01-08   484  		};
3a88be54312101 Xavier Chang   2024-01-08   485  
3a88be54312101 Xavier Chang   2024-01-08   486  		clk26m: clk26m {
3a88be54312101 Xavier Chang   2024-01-08   487  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   488  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   489  			clock-frequency = <26000000>;
3a88be54312101 Xavier Chang   2024-01-08   490  		};
3a88be54312101 Xavier Chang   2024-01-08   491  
3a88be54312101 Xavier Chang   2024-01-08   492  		/*
3a88be54312101 Xavier Chang   2024-01-08   493  		 * ulposc: Ultra Low Power Oscillator
3a88be54312101 Xavier Chang   2024-01-08   494  		 * It is used by soc when the 26Mhz clock is turned
3a88be54312101 Xavier Chang   2024-01-08   495  		 * off. It also is used by other modules.
3a88be54312101 Xavier Chang   2024-01-08   496  		 */
3a88be54312101 Xavier Chang   2024-01-08   497  		ulposc: ulposc {
3a88be54312101 Xavier Chang   2024-01-08   498  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   499  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   500  			clock-frequency = <520000000>;
3a88be54312101 Xavier Chang   2024-01-08   501  		};
3a88be54312101 Xavier Chang   2024-01-08   502  
3a88be54312101 Xavier Chang   2024-01-08   503  		/*
3a88be54312101 Xavier Chang   2024-01-08   504  		 * ulposc3: Ultra Low Power Oscillator 3
3a88be54312101 Xavier Chang   2024-01-08   505  		 * It is used by soc when the 26Mhz clock is turned
3a88be54312101 Xavier Chang   2024-01-08   506  		 * off. It also is used by other modules.
3a88be54312101 Xavier Chang   2024-01-08   507  		 */
3a88be54312101 Xavier Chang   2024-01-08   508  		ulposc3: ulposc3 {
3a88be54312101 Xavier Chang   2024-01-08   509  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   510  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   511  			clock-frequency = <26000000>;
3a88be54312101 Xavier Chang   2024-01-08   512  		};
3a88be54312101 Xavier Chang   2024-01-08   513  
3a88be54312101 Xavier Chang   2024-01-08   514  		clk104m: clk104m {
3a88be54312101 Xavier Chang   2024-01-08   515  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   516  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   517  			clock-frequency = <104000000>;
3a88be54312101 Xavier Chang   2024-01-08   518  		};
3a88be54312101 Xavier Chang   2024-01-08   519  	};
3a88be54312101 Xavier Chang   2024-01-08   520  
f5e37d37aba390 Gavin Liu      2024-06-11   521  	firmware: firmware {
f5e37d37aba390 Gavin Liu      2024-06-11   522  		mtk-svp-heap {
f5e37d37aba390 Gavin Liu      2024-06-11   523  			compatible = "mediatek,secure-heap";
f5e37d37aba390 Gavin Liu      2024-06-11   524  			memory-region = <&restricted_region>;
f5e37d37aba390 Gavin Liu      2024-06-11   525  		};
f5e37d37aba390 Gavin Liu      2024-06-11   526  
f5e37d37aba390 Gavin Liu      2024-06-11   527  		optee {
f5e37d37aba390 Gavin Liu      2024-06-11   528  			compatible = "linaro,optee-tz";
f5e37d37aba390 Gavin Liu      2024-06-11   529  			method = "smc";
f5e37d37aba390 Gavin Liu      2024-06-11   530  			interrupts-extended = <&gic GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH 0>;
f5e37d37aba390 Gavin Liu      2024-06-11   531  		};
519d40b68a563e Kenji Yu       2024-08-30   532  
519d40b68a563e Kenji Yu       2024-08-30   533  		scmi: scmi {
519d40b68a563e Kenji Yu       2024-08-30   534  			compatible = "arm,scmi";
519d40b68a563e Kenji Yu       2024-08-30   535  			mboxes = <&tinysys_mbox 0>, <&tinysys_mbox 1>;
519d40b68a563e Kenji Yu       2024-08-30   536  			shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
519d40b68a563e Kenji Yu       2024-08-30   537  			mbox-names = "tx", "rx";
519d40b68a563e Kenji Yu       2024-08-30   538  			#address-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30   539  			#size-cells = <0>;
519d40b68a563e Kenji Yu       2024-08-30   540  
519d40b68a563e Kenji Yu       2024-08-30   541  			scmi_tinysys: protocol@80 {
519d40b68a563e Kenji Yu       2024-08-30   542  				reg = <0x80>;
519d40b68a563e Kenji Yu       2024-08-30   543  				scmi-cm = <9>;
56c32a9d43dc45 Haohao Sun     2025-03-11   544  				scmi-slbc = <10>;
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   545  				scmi-qos = <1>;
519d40b68a563e Kenji Yu       2024-08-30   546  			};
519d40b68a563e Kenji Yu       2024-08-30   547  		};
f5e37d37aba390 Gavin Liu      2024-06-11   548  	};
f5e37d37aba390 Gavin Liu      2024-06-11   549  
3a88be54312101 Xavier Chang   2024-01-08   550  	memory: memory@80000000 {
3a88be54312101 Xavier Chang   2024-01-08   551  		device_type = "memory";
3a88be54312101 Xavier Chang   2024-01-08   552  		reg = <0 0x80000000 0 0x40000000>;
3a88be54312101 Xavier Chang   2024-01-08   553  	};
3a88be54312101 Xavier Chang   2024-01-08   554  
3a88be54312101 Xavier Chang   2024-01-08   555  	pmu_hunter: pmu-hunter {
3a88be54312101 Xavier Chang   2024-01-08   556  		compatible = "arm,cortex-a720-pmu";
3a88be54312101 Xavier Chang   2024-01-08   557  		interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08   558  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
3a88be54312101 Xavier Chang   2024-01-08   559  	};
3a88be54312101 Xavier Chang   2024-01-08   560  
3a88be54312101 Xavier Chang   2024-01-08   561  	pmu_hunter_elp: pmu-hunter-elp {
3a88be54312101 Xavier Chang   2024-01-08   562  		compatible = "arm,cortex-x4-pmu";
3a88be54312101 Xavier Chang   2024-01-08   563  		interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08   564  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
3a88be54312101 Xavier Chang   2024-01-08   565  	};
3a88be54312101 Xavier Chang   2024-01-08   566  
3a88be54312101 Xavier Chang   2024-01-08   567  	pmu_blackhawk: pmu-blackhawk{
3a88be54312101 Xavier Chang   2024-01-08   568  		compatible = "arm,cortex-x925-pmu";
3a88be54312101 Xavier Chang   2024-01-08   569  		interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08   570  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
3a88be54312101 Xavier Chang   2024-01-08   571  	};
3a88be54312101 Xavier Chang   2024-01-08   572  
3a88be54312101 Xavier Chang   2024-01-08   573  	reserved-memory {
3a88be54312101 Xavier Chang   2024-01-08   574  		#address-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   575  		#size-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   576  		ranges;
57436b1dbadb65 Jjian Zhou     2024-04-01   577  
990c0028a0ae7e Hailong Fan    2024-08-05   578  		adsp_mem_reserved: adsp-mem-region@90000000 {
990c0028a0ae7e Hailong Fan    2024-08-05   579  			compatible = "mediatek,adsp-reserved-memory";
990c0028a0ae7e Hailong Fan    2024-08-05   580  			reg = <0 0x90000000 0 0x600000>;
990c0028a0ae7e Hailong Fan    2024-08-05   581  			no-map;
990c0028a0ae7e Hailong Fan    2024-08-05   582  		};
990c0028a0ae7e Hailong Fan    2024-08-05   583  
990c0028a0ae7e Hailong Fan    2024-08-05   584  		afe_dma_mem_reserved: snd-dma-mem-region@90600000 {
990c0028a0ae7e Hailong Fan    2024-08-05   585  			compatible = "shared-dma-pool";
990c0028a0ae7e Hailong Fan    2024-08-05   586  			reg = <0 0x90600000 0 0x200000>;
990c0028a0ae7e Hailong Fan    2024-08-05   587  			no-map;
990c0028a0ae7e Hailong Fan    2024-08-05   588  		};
990c0028a0ae7e Hailong Fan    2024-08-05   589  
990c0028a0ae7e Hailong Fan    2024-08-05   590  		adsp_dma_mem_reserved: adsp-dma-mem-region@90800000 {
990c0028a0ae7e Hailong Fan    2024-08-05   591  			compatible = "shared-dma-pool";
990c0028a0ae7e Hailong Fan    2024-08-05   592  			reg = <0 0x90800000 0 0x100000>;
990c0028a0ae7e Hailong Fan    2024-08-05   593  			no-map;
990c0028a0ae7e Hailong Fan    2024-08-05   594  		};
990c0028a0ae7e Hailong Fan    2024-08-05   595  
eedd3dc85418be Karl Li        2024-09-27   596  		apu_reserve_memory: apu-reserve-memory@95000000 {
eedd3dc85418be Karl Li        2024-09-27   597  			compatible = "mediatek,apu-resv-mem";
eedd3dc85418be Karl Li        2024-09-27   598  			reg = <0 0x95000000 0 0x1400000>;
eedd3dc85418be Karl Li        2024-09-27   599  			no-map;
eedd3dc85418be Karl Li        2024-09-27   600  		};
eedd3dc85418be Karl Li        2024-09-27   601  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   602  		gpueb_resv_mem: gpueb-reserved-memory@a0000000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   603  			compatible = "mediatek,gpueb-resv-mem";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   604  			reg = <0 0xa0000000 0 0x200000>; /* 2 MB */
1ac2c128a1d9a6 Andy Hsu       2024-03-29   605  			no-map;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   606  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   607  
57436b1dbadb65 Jjian Zhou     2024-04-01   608  		vcp_resv_mem: vcp-reserved-memory@a0200000 {
57436b1dbadb65 Jjian Zhou     2024-04-01   609  			compatible = "mediatek,me-vcp-reserved";
57436b1dbadb65 Jjian Zhou     2024-04-01   610  			reg = <0 0xa0200000 0 0x01e00000>; /* 30MB */
57436b1dbadb65 Jjian Zhou     2024-04-01   611  			iommu-addresses = <0 0x00000000 1 0x40000000>; /* 1G */
57436b1dbadb65 Jjian Zhou     2024-04-01   612  			no-map;
57436b1dbadb65 Jjian Zhou     2024-04-01   613  		};
f5e37d37aba390 Gavin Liu      2024-06-11   614  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   615  		mali_protected: mali-protected@a2000000 { /* 16MB */
1ac2c128a1d9a6 Andy Hsu       2024-03-29   616  			compatible = "mali-reserved";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   617  			reg = <0x0 0xa2000000 0x0 0x1000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   618  			no-map;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   619  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   620  
f5e37d37aba390 Gavin Liu      2024-06-11   621  		restricted_region: secure-region@a3000000 {
f5e37d37aba390 Gavin Liu      2024-06-11   622  			compatible = "mediatek,dynamic-restricted-region";
f5e37d37aba390 Gavin Liu      2024-06-11   623  			reg = <0 0xa3000000 0 0x1bc00000>; /* 444MB */
f5e37d37aba390 Gavin Liu      2024-06-11   624  			no-map;
f5e37d37aba390 Gavin Liu      2024-06-11   625  		};
eedd3dc85418be Karl Li        2024-09-27   626  
eedd3dc85418be Karl Li        2024-09-27   627  		apu_smmu_reserve_memory0: apu-smmu-reserve-memory0 {
eedd3dc85418be Karl Li        2024-09-27   628  			compatible = "mediatek,apu-smmu-resv-mem";
eedd3dc85418be Karl Li        2024-09-27   629  			iommu-addresses = <&apusys_rv 0x0 0x0 0x0 0x40000000>,
eedd3dc85418be Karl Li        2024-09-27   630  					  <&apusys_rv 0x0 0x4c000000 0x0 0x4000000>,
eedd3dc85418be Karl Li        2024-09-27   631  					  <&apusys_rv 0x0 0x6c000000 0x0 0x4000000>;
eedd3dc85418be Karl Li        2024-09-27   632  		};
3a88be54312101 Xavier Chang   2024-01-08   633  	};
3a88be54312101 Xavier Chang   2024-01-08   634  
3a88be54312101 Xavier Chang   2024-01-08   635  	timer: timer {
3a88be54312101 Xavier Chang   2024-01-08   636  		compatible = "arm,armv8-timer";
3a88be54312101 Xavier Chang   2024-01-08   637  		interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08   638  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
3a88be54312101 Xavier Chang   2024-01-08   639  				<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
3a88be54312101 Xavier Chang   2024-01-08   640  				<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
3a88be54312101 Xavier Chang   2024-01-08   641  				<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08   642  		clock-frequency = <13000000>;
3a88be54312101 Xavier Chang   2024-01-08   643  	};
3a88be54312101 Xavier Chang   2024-01-08   644  
3a88be54312101 Xavier Chang   2024-01-08   645  	psci {
3a88be54312101 Xavier Chang   2024-01-08   646  		compatible = "arm,psci-1.0";
3a88be54312101 Xavier Chang   2024-01-08   647  		method = "smc";
3a88be54312101 Xavier Chang   2024-01-08   648  	};
3a88be54312101 Xavier Chang   2024-01-08   649  
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   650  	qos: qos {
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   651  		compatible = "mediatek,mt8196-qos";
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   652  		mediatek,enable;
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   653  		scmi-tinysys-supply = <&scmi_tinysys>;
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   654  	};
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   655  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   656  	ged: ged {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   657  		compatible = "mediatek,ged";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   658  		gpufreq-supply = <&gpufreq>;
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   659  
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   660  		/*
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   661  		 * QoS is actually not a supply component, but by describing it this way,
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   662  		 * it informs Kernel about the dependency relationship between modules,
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   663  		 * meaning that the QoS probe must be called before the GED probe.
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   664  		 */
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23   665  		qos-supply = <&qos>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   666  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   667  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   668  	gpu_dcs: gpu-dcs {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   669  		compatible = "mediatek,gpu-dcs";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   670  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   671  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   672  	gpu_dvfs_mode: gpu-loading-mode {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   673  		compatible = "mediatek,gpu-loading-mode";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   674  		dvfs-loading-mode = <0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   675  		dvfs-workload-mode = <6>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   676  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   677  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   678  	gpu_mali_opp: opp-table-gpu {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   679  		compatible = "operating-points-v2";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   680  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   681  		opp00 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   682  			opp-hz = /bits/ 64 <1612000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   683  			opp-microvolt = <795000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   684  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   685  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   686  		opp01 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   687  			opp-hz = /bits/ 64 <1586000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   688  			opp-microvolt = <790000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   689  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   690  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   691  		opp02 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   692  			opp-hz = /bits/ 64 <1560000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   693  			opp-microvolt = <785000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   694  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   695  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   696  		opp03 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   697  			opp-hz = /bits/ 64 <1534000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   698  			opp-microvolt = <780000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   699  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   700  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   701  		opp04 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   702  			opp-hz = /bits/ 64 <1508000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   703  			opp-microvolt = <770000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   704  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   705  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   706  		opp05 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   707  			opp-hz = /bits/ 64 <1482000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   708  			opp-microvolt = <765000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   709  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   710  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   711  		opp06 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   712  			opp-hz = /bits/ 64 <1456000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   713  			opp-microvolt = <760000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   714  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   715  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   716  		opp07 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   717  			opp-hz = /bits/ 64 <1430000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   718  			opp-microvolt = <750000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   719  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   720  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   721  		opp08 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   722  			opp-hz = /bits/ 64 <1404000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   723  			opp-microvolt = <745000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   724  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   725  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   726  		opp09 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   727  			opp-hz = /bits/ 64 <1378000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   728  			opp-microvolt = <740000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   729  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   730  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   731  		opp10 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   732  			opp-hz = /bits/ 64 <1352000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   733  			opp-microvolt = <735000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   734  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   735  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   736  		opp11 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   737  			opp-hz = /bits/ 64 <1326000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   738  			opp-microvolt = <730000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   739  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   740  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   741  		opp12 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   742  			opp-hz = /bits/ 64 <1300000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   743  			opp-microvolt = <720000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   744  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   745  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   746  		opp13 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   747  			opp-hz = /bits/ 64 <1274000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   748  			opp-microvolt = <715000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   749  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   750  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   751  		opp14 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   752  			opp-hz = /bits/ 64 <1248000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   753  			opp-microvolt = <710000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   754  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   755  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   756  		opp15 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   757  			opp-hz = /bits/ 64 <1222000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   758  			opp-microvolt = <705000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   759  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   760  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   761  		opp16 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   762  			opp-hz = /bits/ 64 <1196000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   763  			opp-microvolt = <695000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   764  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   765  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   766  		opp17 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   767  			opp-hz = /bits/ 64 <1170000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   768  			opp-microvolt = <690000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   769  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   770  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   771  		opp18 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   772  			opp-hz = /bits/ 64 <1144000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   773  			opp-microvolt = <685000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   774  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   775  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   776  		opp19 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   777  			opp-hz = /bits/ 64 <1118000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   778  			opp-microvolt = <680000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   779  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   780  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   781  		opp20 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   782  			opp-hz = /bits/ 64 <1092000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   783  			opp-microvolt = <670000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   784  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   785  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   786  		opp21 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   787  			opp-hz = /bits/ 64 <1066000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   788  			opp-microvolt = <665000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   789  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   790  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   791  		opp22 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   792  			opp-hz = /bits/ 64 <1040000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   793  			opp-microvolt = <660000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   794  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   795  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   796  		opp23 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   797  			opp-hz = /bits/ 64 <1014000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   798  			opp-microvolt = <655000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   799  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   800  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   801  		opp24 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   802  			opp-hz = /bits/ 64 <988000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   803  			opp-microvolt = <645000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   804  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   805  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   806  		opp25 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   807  			opp-hz = /bits/ 64 <962000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   808  			opp-microvolt = <640000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   809  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   810  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   811  		opp26 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   812  			opp-hz = /bits/ 64 <936000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   813  			opp-microvolt = <635000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   814  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   815  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   816  		opp27 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   817  			opp-hz = /bits/ 64 <910000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   818  			opp-microvolt = <630000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   819  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   820  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   821  		opp28 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   822  			opp-hz = /bits/ 64 <884000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   823  			opp-microvolt = <620000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   824  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   825  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   826  		opp29 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   827  			opp-hz = /bits/ 64 <858000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   828  			opp-microvolt = <615000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   829  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   830  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   831  		opp30 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   832  			opp-hz = /bits/ 64 <832000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   833  			opp-microvolt = <610000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   834  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   835  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   836  		opp31 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   837  			opp-hz = /bits/ 64 <806000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   838  			opp-microvolt = <605000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   839  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   840  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   841  		opp32 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   842  			opp-hz = /bits/ 64 <780000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   843  			opp-microvolt = <600000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   844  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   845  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   846  		opp33 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   847  			opp-hz = /bits/ 64 <754000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   848  			opp-microvolt = <590000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   849  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   850  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   851  		opp34 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   852  			opp-hz = /bits/ 64 <728000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   853  			opp-microvolt = <585000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   854  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   855  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   856  		opp35 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   857  			opp-hz = /bits/ 64 <702000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   858  			opp-microvolt = <580000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   859  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   860  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   861  		opp36 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   862  			opp-hz = /bits/ 64 <676000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   863  			opp-microvolt = <575000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   864  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   865  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   866  		opp37 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   867  			opp-hz = /bits/ 64 <650000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   868  			opp-microvolt = <560000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   869  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   870  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   871  		opp38 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   872  			opp-hz = /bits/ 64 <624000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   873  			opp-microvolt = <560000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   874  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   875  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   876  		opp39 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   877  			opp-hz = /bits/ 64 <598000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   878  			opp-microvolt = <555000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   879  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   880  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   881  		opp40 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   882  			opp-hz = /bits/ 64 <572000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   883  			opp-microvolt = <550000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   884  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   885  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   886  		opp41 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   887  			opp-hz = /bits/ 64 <546000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   888  			opp-microvolt = <540000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   889  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   890  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   891  		opp42 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   892  			opp-hz = /bits/ 64 <520000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   893  			opp-microvolt = <535000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   894  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   895  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   896  		opp43 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   897  			opp-hz = /bits/ 64 <494000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   898  			opp-microvolt = <530000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   899  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   900  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   901  		opp44 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   902  			opp-hz = /bits/ 64 <468000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   903  			opp-microvolt = <525000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   904  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   905  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   906  		opp45 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   907  			opp-hz = /bits/ 64 <442000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   908  			opp-microvolt = <515000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   909  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   910  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   911  		opp46 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   912  			opp-hz = /bits/ 64 <416000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   913  			opp-microvolt = <510000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   914  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   915  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   916  		opp47 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   917  			opp-hz = /bits/ 64 <390000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   918  			opp-microvolt = <505000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   919  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   920  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   921  		opp48 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   922  			opp-hz = /bits/ 64 <364000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   923  			opp-microvolt = <500000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   924  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   925  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   926  		opp49 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   927  			opp-hz = /bits/ 64 <338000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   928  			opp-microvolt = <490000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   929  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   930  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   931  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   932  	gpu_protected_memory_allocator: protected-memory-allocator {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   933  		compatible = "arm,protected-memory-allocator";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   934  		memory-region = <&mali_protected>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   935  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   936  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   937  	gpufreq_wrapper: gpufreq-wrapper {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   938  		compatible = "mediatek,gpufreq-wrapper";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   939  		gpufreq-version = <2>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   940  		dual-buck = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   941  		gpueb-support;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   942  		ghpm-supply = <&ghpm>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   943  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   944  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   945  	mgm: mgm {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   946  		compatible = "arm,physical-memory-group-manager";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   947  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   948  
a44ecdcc67718b Yunfei Dong    2024-09-05   949  	opp_table_disp: opp-table-disp {
a44ecdcc67718b Yunfei Dong    2024-09-05   950  		compatible = "operating-points-v2";
a44ecdcc67718b Yunfei Dong    2024-09-05   951  
a44ecdcc67718b Yunfei Dong    2024-09-05   952  		opp-0 {
a44ecdcc67718b Yunfei Dong    2024-09-05   953  			opp-hz = /bits/ 64 <273000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   954  			opp-level = <0>;
a44ecdcc67718b Yunfei Dong    2024-09-05   955  		};
a44ecdcc67718b Yunfei Dong    2024-09-05   956  
a44ecdcc67718b Yunfei Dong    2024-09-05   957  		opp-1 {
a44ecdcc67718b Yunfei Dong    2024-09-05   958  			opp-hz = /bits/ 64 <364000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   959  			opp-level = <1>;
a44ecdcc67718b Yunfei Dong    2024-09-05   960  		};
a44ecdcc67718b Yunfei Dong    2024-09-05   961  
a44ecdcc67718b Yunfei Dong    2024-09-05   962  		opp-2 {
a44ecdcc67718b Yunfei Dong    2024-09-05   963  			opp-hz = /bits/ 64 <458000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   964  			opp-level = <2>;
a44ecdcc67718b Yunfei Dong    2024-09-05   965  		};
a44ecdcc67718b Yunfei Dong    2024-09-05   966  
a44ecdcc67718b Yunfei Dong    2024-09-05   967  		opp-3 {
a44ecdcc67718b Yunfei Dong    2024-09-05   968  			opp-hz = /bits/ 64 <624000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   969  			opp-level = <3>;
a44ecdcc67718b Yunfei Dong    2024-09-05   970  		};
a44ecdcc67718b Yunfei Dong    2024-09-05   971  
a44ecdcc67718b Yunfei Dong    2024-09-05   972  		opp-4 {
a44ecdcc67718b Yunfei Dong    2024-09-05   973  			opp-hz = /bits/ 64 <728000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   974  			opp-level = <4>;
a44ecdcc67718b Yunfei Dong    2024-09-05   975  		};
a44ecdcc67718b Yunfei Dong    2024-09-05   976  	};
a44ecdcc67718b Yunfei Dong    2024-09-05   977  
a44ecdcc67718b Yunfei Dong    2024-09-05   978  	opp_table_mminfra: opp-table-mminfra {
a44ecdcc67718b Yunfei Dong    2024-09-05   979  		compatible = "operating-points-v2";
a44ecdcc67718b Yunfei Dong    2024-09-05   980  
a44ecdcc67718b Yunfei Dong    2024-09-05   981  		opp-0 {
a44ecdcc67718b Yunfei Dong    2024-09-05   982  			opp-hz = /bits/ 64 <130000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   983  			opp-level = <0>;
a44ecdcc67718b Yunfei Dong    2024-09-05   984  		};
a44ecdcc67718b Yunfei Dong    2024-09-05   985  
a44ecdcc67718b Yunfei Dong    2024-09-05   986  		opp-1 {
a44ecdcc67718b Yunfei Dong    2024-09-05   987  			opp-hz = /bits/ 64 <242000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   988  			opp-level = <1>;
a44ecdcc67718b Yunfei Dong    2024-09-05   989  		};
a44ecdcc67718b Yunfei Dong    2024-09-05   990  
a44ecdcc67718b Yunfei Dong    2024-09-05   991  		opp-2 {
a44ecdcc67718b Yunfei Dong    2024-09-05   992  			opp-hz = /bits/ 64 <364000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   993  			opp-level = <2>;
a44ecdcc67718b Yunfei Dong    2024-09-05   994  		};
a44ecdcc67718b Yunfei Dong    2024-09-05   995  
a44ecdcc67718b Yunfei Dong    2024-09-05   996  		opp-3 {
a44ecdcc67718b Yunfei Dong    2024-09-05   997  			opp-hz = /bits/ 64 <458000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05   998  			opp-level = <3>;
a44ecdcc67718b Yunfei Dong    2024-09-05   999  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1000  
a44ecdcc67718b Yunfei Dong    2024-09-05  1001  		opp-4 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1002  			opp-hz = /bits/ 64 <624000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1003  			opp-level = <4>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1004  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1005  
a44ecdcc67718b Yunfei Dong    2024-09-05  1006  		opp-5 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1007  			opp-hz = /bits/ 64 <728000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1008  			opp-level = <5>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1009  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1010  
a44ecdcc67718b Yunfei Dong    2024-09-05  1011  		opp-6 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1012  			opp-hz = /bits/ 64 <832000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1013  			opp-level = <6>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1014  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1015  	};
a44ecdcc67718b Yunfei Dong    2024-09-05  1016  
a44ecdcc67718b Yunfei Dong    2024-09-05  1017  	opp_table_venc: opp-table-venc {
a44ecdcc67718b Yunfei Dong    2024-09-05  1018  		compatible = "operating-points-v2";
a44ecdcc67718b Yunfei Dong    2024-09-05  1019  
a44ecdcc67718b Yunfei Dong    2024-09-05  1020  		opp-0 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1021  			opp-hz = /bits/ 64 <250000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1022  			opp-level = <0>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1023  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1024  
a44ecdcc67718b Yunfei Dong    2024-09-05  1025  		opp-1 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1026  			opp-hz = /bits/ 64 <250000001>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1027  			opp-level = <1>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1028  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1029  
a44ecdcc67718b Yunfei Dong    2024-09-05  1030  		opp-2 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1031  			opp-hz = /bits/ 64 <312000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1032  			opp-level = <2>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1033  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1034  
a44ecdcc67718b Yunfei Dong    2024-09-05  1035  		opp-3 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1036  			opp-hz = /bits/ 64 <458000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1037  			opp-level = <3>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1038  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1039  
a44ecdcc67718b Yunfei Dong    2024-09-05  1040  		opp-4 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1041  			opp-hz = /bits/ 64 <624000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1042  			opp-level = <4>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1043  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1044  
a44ecdcc67718b Yunfei Dong    2024-09-05  1045  		opp-5 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1046  			opp-hz = /bits/ 64 <832000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1047  			opp-level = <5>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1048  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1049  
a44ecdcc67718b Yunfei Dong    2024-09-05  1050  		opp-6 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1051  			opp-hz = /bits/ 64 <832000001>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1052  			opp-level = <6>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1053  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1054  	};
a44ecdcc67718b Yunfei Dong    2024-09-05  1055  
a44ecdcc67718b Yunfei Dong    2024-09-05  1056  	opp_table_vdec: opp-table-vdec {
a44ecdcc67718b Yunfei Dong    2024-09-05  1057  		compatible = "operating-points-v2";
a44ecdcc67718b Yunfei Dong    2024-09-05  1058  
a44ecdcc67718b Yunfei Dong    2024-09-05  1059  		opp-0 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1060  			opp-hz = /bits/ 64 <218000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1061  			opp-level = <0>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1062  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1063  
a44ecdcc67718b Yunfei Dong    2024-09-05  1064  		opp-1 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1065  			opp-hz = /bits/ 64 <218000001>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1066  			opp-level = <1>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1067  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1068  
a44ecdcc67718b Yunfei Dong    2024-09-05  1069  		opp-2 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1070  			opp-hz = /bits/ 64 <273000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1071  			opp-level = <2>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1072  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1073  
a44ecdcc67718b Yunfei Dong    2024-09-05  1074  		opp-3 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1075  			opp-hz = /bits/ 64 <436000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1076  			opp-level = <3>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1077  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1078  
a44ecdcc67718b Yunfei Dong    2024-09-05  1079  		opp-4 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1080  			opp-hz = /bits/ 64 <546000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1081  			opp-level = <4>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1082  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1083  
a44ecdcc67718b Yunfei Dong    2024-09-05  1084  		opp-5 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1085  			opp-hz = /bits/ 64 <1050000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1086  			opp-level = <5>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1087  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1088  	};
a44ecdcc67718b Yunfei Dong    2024-09-05  1089  
a44ecdcc67718b Yunfei Dong    2024-09-05  1090  	opp_table_cam: opp-table-cam {
a44ecdcc67718b Yunfei Dong    2024-09-05  1091  		compatible = "operating-points-v2";
a44ecdcc67718b Yunfei Dong    2024-09-05  1092  
a44ecdcc67718b Yunfei Dong    2024-09-05  1093  		opp-0 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1094  			opp-hz = /bits/ 64 <173000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1095  			opp-level = <0>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1096  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1097  
a44ecdcc67718b Yunfei Dong    2024-09-05  1098  		opp-1 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1099  			opp-hz = /bits/ 64 <312000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1100  			opp-level = <1>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1101  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1102  
a44ecdcc67718b Yunfei Dong    2024-09-05  1103  		opp-2 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1104  			opp-hz = /bits/ 64 <416000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1105  			opp-level = <2>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1106  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1107  
a44ecdcc67718b Yunfei Dong    2024-09-05  1108  		opp-3 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1109  			opp-hz = /bits/ 64 <564000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1110  			opp-level = <3>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1111  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1112  
a44ecdcc67718b Yunfei Dong    2024-09-05  1113  		opp-4 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1114  			opp-hz = /bits/ 64 <660000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1115  			opp-level = <4>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1116  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1117  
a44ecdcc67718b Yunfei Dong    2024-09-05  1118  		opp-5 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1119  			opp-hz = /bits/ 64 <660000001>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1120  			opp-level = <5>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1121  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1122  	};
a44ecdcc67718b Yunfei Dong    2024-09-05  1123  
a44ecdcc67718b Yunfei Dong    2024-09-05  1124  	opp_table_img: opp-table-img {
a44ecdcc67718b Yunfei Dong    2024-09-05  1125  		compatible = "operating-points-v2";
a44ecdcc67718b Yunfei Dong    2024-09-05  1126  
a44ecdcc67718b Yunfei Dong    2024-09-05  1127  		opp-0 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1128  			opp-hz = /bits/ 64 <173000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1129  			opp-level = <0>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1130  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1131  
a44ecdcc67718b Yunfei Dong    2024-09-05  1132  		opp-1 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1133  			opp-hz = /bits/ 64 <312000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1134  			opp-level = <1>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1135  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1136  
a44ecdcc67718b Yunfei Dong    2024-09-05  1137  		opp-2 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1138  			opp-hz = /bits/ 64 <416000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1139  			opp-level = <2>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1140  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1141  
a44ecdcc67718b Yunfei Dong    2024-09-05  1142  		opp-3 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1143  			opp-hz = /bits/ 64 <550000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1144  			opp-level = <3>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1145  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1146  
a44ecdcc67718b Yunfei Dong    2024-09-05  1147  		opp-4 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1148  			opp-hz = /bits/ 64 <660000000>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1149  			opp-level = <4>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1150  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1151  
a44ecdcc67718b Yunfei Dong    2024-09-05  1152  		opp-5 {
a44ecdcc67718b Yunfei Dong    2024-09-05  1153  			opp-hz = /bits/ 64 <660000001>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1154  			opp-level = <5>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1155  		};
a44ecdcc67718b Yunfei Dong    2024-09-05  1156  	};
a44ecdcc67718b Yunfei Dong    2024-09-05  1157  
a44ecdcc67718b Yunfei Dong    2024-09-05  1158  	mmdvfs_mux: mmdvfs-mux {
a44ecdcc67718b Yunfei Dong    2024-09-05  1159  		compatible = "mediatek,mtk-mmdvfs-mux";
a44ecdcc67718b Yunfei Dong    2024-09-05  1160  		clocks = <&cksys_gp2_clk CLK_CK2_DISP_SEL>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1161  				<&cksys_gp2_clk CLK_CK2_MDP_SEL>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1162  				<&cksys_gp2_clk CLK_CK2_MDP_SEL>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1163  				<&cksys_gp2_clk CLK_CK2_MMINFRA_SEL>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1164  				<&cksys_gp2_clk CLK_CK2_VENC_SEL>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1165  				<&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1166  				<&cksys_gp2_clk CLK_CK2_IMG1_SEL>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1167  				<&cksys_gp2_clk CLK_CK2_CAM_SEL>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1168  		clock-names =
a44ecdcc67718b Yunfei Dong    2024-09-05  1169  				"mux-dis", "mux-mdp", "mux-mml", "mux-smi",
a44ecdcc67718b Yunfei Dong    2024-09-05  1170  				"mux-ven", "mux-vde", "mux-img", "mux-cam";
a44ecdcc67718b Yunfei Dong    2024-09-05  1171  		mediatek,mmdvfs-opp-table =
a44ecdcc67718b Yunfei Dong    2024-09-05  1172  			<&opp_table_disp>, <&opp_table_disp>, <&opp_table_disp>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1173  			<&opp_table_mminfra>, <&opp_table_venc>, <&opp_table_vdec>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1174  			<&opp_table_img>, <&opp_table_cam>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1175  		mediatek,mmdvfs-vcp-mux-id = <8>, <9>, <9>, <0>, <2>, <7>, <4>, <3>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1176  		#clock-cells = <1>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1177  		mediatek,mmdvfs-user-target =
a44ecdcc67718b Yunfei Dong    2024-09-05  1178  			<MMDVFS_MUX_DIS>, <MMDVFS_MUX_MDP>, <MMDVFS_MUX_MML>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1179  			<MMDVFS_MUX_SMI>, <MMDVFS_MUX_VEN>, <MMDVFS_MUX_VEN>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1180  			<MMDVFS_MUX_VEN>, <MMDVFS_MUX_VDE>, <MMDVFS_MUX_IMG>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1181  			<MMDVFS_MUX_CAM>, <MMDVFS_MUX_VEN>, <MMDVFS_MUX_CAM>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1182  			<MMDVFS_MUX_MDP>, <MMDVFS_MUX_VDE>, <MMDVFS_MUX_DIS>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1183  			<MMDVFS_MUX_MDP>, <MMDVFS_MUX_MML>, <MMDVFS_MUX_SMI>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1184  			<MMDVFS_MUX_VEN>, <MMDVFS_MUX_VDE>, <MMDVFS_MUX_IMG>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1185  			<MMDVFS_MUX_CAM>, <MMDVFS_MUX_SMI>, <MMDVFS_MUX_SMI>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1186  		mediatek,mmdvfs-user-names =
a44ecdcc67718b Yunfei Dong    2024-09-05  1187  			"user-disp", "user-mdp", "user-mml",
a44ecdcc67718b Yunfei Dong    2024-09-05  1188  			"user-smi", "user-jpegdec", "user-jpegenc",
a44ecdcc67718b Yunfei Dong    2024-09-05  1189  			"user-venc", "user-vfmt", "user-img",
a44ecdcc67718b Yunfei Dong    2024-09-05  1190  			"user-cam", "user-vcore", "user-vmm",
a44ecdcc67718b Yunfei Dong    2024-09-05  1191  			"user-vdisp", "user-vdec", "dummy-dis",
a44ecdcc67718b Yunfei Dong    2024-09-05  1192  			"dummy-mdp", "dummy-mml", "dummy-smi",
a44ecdcc67718b Yunfei Dong    2024-09-05  1193  			"dummy-ven", "dummy-vde", "dummy-img",
a44ecdcc67718b Yunfei Dong    2024-09-05  1194  			"dummy-cam", "user-img-smi", "user-vcp-smi";
a44ecdcc67718b Yunfei Dong    2024-09-05  1195  		mediatek,free-run;
a44ecdcc67718b Yunfei Dong    2024-09-05  1196  		mediatek,dpsw-thres = <1>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1197  		mediatek,mmdebug = <&mmdebug>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1198  		mediatek,restore-step;
a44ecdcc67718b Yunfei Dong    2024-09-05  1199  		mediatek,vcore-check-rg = <0x1c0132b0>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1200  		mediatek,vcore-check-offset = <6>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1201  		mediatek,vcp = <&vcp>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1202  		mediatek,mmup-sram;
a44ecdcc67718b Yunfei Dong    2024-09-05  1203  	};
a44ecdcc67718b Yunfei Dong    2024-09-05  1204  
a44ecdcc67718b Yunfei Dong    2024-09-05  1205  	mmdvfs-user {
a44ecdcc67718b Yunfei Dong    2024-09-05  1206  		compatible = "mediatek,mtk-mmdvfs-user";
a44ecdcc67718b Yunfei Dong    2024-09-05  1207  		clocks = <&mmdvfs_mux MMDVFS_USER_VCORE>, <&mmdvfs_mux MMDVFS_USER_VMM>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1208  				<&mmdvfs_mux MMDVFS_USER_VDISP>, <&mmdvfs_mux MMDVFS_USER_VDEC>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1209  				<&mmdvfs_mux DUMMY_USER_DIS>, <&mmdvfs_mux DUMMY_USER_MDP>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1210  				<&mmdvfs_mux DUMMY_USER_MML>, <&mmdvfs_mux DUMMY_USER_SMI>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1211  				<&mmdvfs_mux DUMMY_USER_VEN>, <&mmdvfs_mux DUMMY_USER_VDE>,
a44ecdcc67718b Yunfei Dong    2024-09-05  1212  				<&mmdvfs_mux DUMMY_USER_IMG>, <&mmdvfs_mux DUMMY_USER_CAM>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1213  		clock-names = "user-vcore", "user-vmm", "user-vdisp", "user-vdec",
a44ecdcc67718b Yunfei Dong    2024-09-05  1214  			"dummy-dis", "dummy-mdp", "dummy-mml", "dummy-smi",
a44ecdcc67718b Yunfei Dong    2024-09-05  1215  			"dummy-ven", "dummy-vde", "dummy-img", "dummy-cam";
a44ecdcc67718b Yunfei Dong    2024-09-05  1216  
a44ecdcc67718b Yunfei Dong    2024-09-05  1217  		mediatek,mmdvfs-mux = <&mmdvfs_mux>;
a44ecdcc67718b Yunfei Dong    2024-09-05  1218  	};
a44ecdcc67718b Yunfei Dong    2024-09-05  1219  
1ff04cadee53f8 Echo Zhang     2025-04-11  1220  	mmdvfs_debug: mmdvfs-debug {
1ff04cadee53f8 Echo Zhang     2025-04-11  1221  		compatible = "mediatek,mmdvfs-debug";
1ff04cadee53f8 Echo Zhang     2025-04-11  1222  		debug-version = <2>; /* OR operation of (1 << MMDVFS_DBG_VERx) */
1ff04cadee53f8 Echo Zhang     2025-04-11  1223  		mediatek,mmdebug = <&mmdebug>;
1ff04cadee53f8 Echo Zhang     2025-04-11  1224  		vcore-supply = <&mt6316_8_vbuck1>;
1ff04cadee53f8 Echo Zhang     2025-04-11  1225  		vdisp-pmic-supply = <&mt6363_vbuck1>;
1ff04cadee53f8 Echo Zhang     2025-04-11  1226  		vmm-pmic-supply = <&mt6363_vbuck2>;
1ff04cadee53f8 Echo Zhang     2025-04-11  1227  	};
1ff04cadee53f8 Echo Zhang     2025-04-11  1228  
1ff04cadee53f8 Echo Zhang     2025-04-11  1229  	mmdebug: mmdebug-vcp {
1ff04cadee53f8 Echo Zhang     2025-04-11  1230  		compatible = "mediatek,mmdebug-vcp";
1ff04cadee53f8 Echo Zhang     2025-04-11  1231  		mediatek,vcp = <&vcp>;
1ff04cadee53f8 Echo Zhang     2025-04-11  1232  	};
1ff04cadee53f8 Echo Zhang     2025-04-11  1233  
3a88be54312101 Xavier Chang   2024-01-08  1234  	soc {
3a88be54312101 Xavier Chang   2024-01-08  1235  		compatible = "simple-bus";
3a88be54312101 Xavier Chang   2024-01-08  1236  		#address-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08  1237  		#size-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08  1238  		ranges;
3a88be54312101 Xavier Chang   2024-01-08  1239  		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
3a88be54312101 Xavier Chang   2024-01-08  1240  
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1241  		therm_intf: therm-intf@114000 {
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1242  			compatible = "mediatek,therm_intf";
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1243  			reg = <0 0x00114000 0 0x400>,
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1244  			      <0 0x0c2cd450 0 0x400>;
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1245  			reg-names = "sram", "cputcm";
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1246  			mediatek,init-ttj-cpu = <95000>;
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1247  			mediatek,init-ttj-gpu = <95000>;
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1248  			mediatek,init-ttj-npu = <95000>;
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1249  		};
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12  1250  
35ddc053cc4d97 Haohao Sun     2024-08-30  1251  		slbc: slbc@117800 {
35ddc053cc4d97 Haohao Sun     2024-08-30  1252  			compatible = "mediatek,mt8196-slbc";
35ddc053cc4d97 Haohao Sun     2024-08-30  1253  			reg = <0 0x00117800 0 0x400>;
35ddc053cc4d97 Haohao Sun     2024-08-30  1254  		};
35ddc053cc4d97 Haohao Sun     2024-08-30  1255  
3a88be54312101 Xavier Chang   2024-01-08  1256  		csram_sys: csram-sysram@11bc00 {
3a88be54312101 Xavier Chang   2024-01-08  1257  			reg = <0 0x11bc00 0 0x1400>; /* 5KB */
3a88be54312101 Xavier Chang   2024-01-08  1258  		};
3a88be54312101 Xavier Chang   2024-01-08  1259  
0df15b2007c161 Andy Hsu       2025-04-24 @1260  		gpu_fdvfs: gpu-fdvfs@13f800 {
f3d6939f29f245 Andy Hsu       2025-05-14  1261  			compatible = "mediatek,gpu-fdvfs";
0df15b2007c161 Andy Hsu       2025-04-24  1262  			reg = <0 0x13f800 0 0x800>;
0df15b2007c161 Andy Hsu       2025-04-24  1263  			gpu-freq-notify-support;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  1264  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  1265  
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1266  		gpu_qos: gpu-qos@13f800 {
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1267  			compatible = "mediatek,gpu-qos";
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1268  			/*
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1269  			 * Although gpu_fdvfs and gpu_qos appear to use the same register base,
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1270  			 * the actual offsets they use are different. This is because gpu_fdvfs
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1271  			 * corresponds to the processor GPUEB, while gpu_qos corresponds to the
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1272  			 * processor SSPM. Therefore, different device tree nodes correspond to
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1273  			 * different functions and hardware, and there won't be any unexpected
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1274  			 * race conditions.
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1275  			 */
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1276  			reg = <0 0x13f800 0 0x20>;
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1277  			qos-mode = <1>;
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1278  			qos-sysram-support;
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1279  			qos-value = <0>;
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1280  		};
aa8f4e4d0ce6a7 Alvin Liu      2025-01-23  1281  
3a88be54312101 Xavier Chang   2024-01-08  1282  		cpu_mcucfg: mcusys-ao-cfg@c000000 {
3a88be54312101 Xavier Chang   2024-01-08  1283  			reg = <0 0xc000000 0 0x10000>; /* 64KB */
3a88be54312101 Xavier Chang   2024-01-08  1284  		};
3a88be54312101 Xavier Chang   2024-01-08  1285  
3a88be54312101 Xavier Chang   2024-01-08  1286  		cpu_pll: mcusys-pll1u-top@c030000 {
3a88be54312101 Xavier Chang   2024-01-08  1287  			reg = <0 0xc030000 0 0x1000>; /* 4KB */
3a88be54312101 Xavier Chang   2024-01-08  1288  		};
3a88be54312101 Xavier Chang   2024-01-08  1289  
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1290  		cm_mgr: cm-mgr@c100000 {
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1291  			compatible = "mediatek,mt8196-cm-mgr";
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1292  			reg = <0 0xc100000 0 0x9000>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1293  			reg-names = "cm_mgr_base";
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1294  			interconnects = <&dvfsrc MT6873_MASTER_MCU_1 &dvfsrc MT6873_SLAVE_DDR_EMI>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1295  			interconnect-names = "cm-perf-bw";
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1296  			cpuhvfs = <&cpuhvfs>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1297  			required-opps = <&dvfsrc_freq_opp0>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1298  					<&dvfsrc_freq_opp1>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1299  					<&dvfsrc_freq_opp2>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1300  					<&dvfsrc_freq_opp3>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1301  					<&dvfsrc_freq_opp4>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1302  					<&dvfsrc_freq_opp5>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1303  					<&dvfsrc_freq_opp6>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1304  					<&dvfsrc_freq_opp7>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1305  					<&dvfsrc_freq_opp8>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1306  					<&dvfsrc_freq_opp9>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1307  			mediatek,cm-mgr-enable;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1308  			mediatek,cm-mgr-arch = "v1p";
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1309  
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1310  			mediatek,cm-mgr-num-array = <7>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1311  			mediatek,cm-mgr,cp-down  = <100 100 100 100 100 100 100>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1312  			mediatek,cm-mgr,cp-up = <100 100 100 100 100 100 100>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1313  			mediatek,cm-mgr,dt-down = <0 0 0 0 0 0 0>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1314  			mediatek,cm-mgr,dt-up = <0 0 0 0 0 0 0>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1315  			mediatek,cm-mgr,vp-down = <100 100 100 100 100 100 100>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1316  			mediatek,cm-mgr,vp-up = <100 100 100 100 100 100 100>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1317  
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1318  			mediatek,cm-mgr-cpu-opp-to-dram = <3 3 9 9 9 9 9 9
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1319  						9 9 9 9 9 9 9 9
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1320  						9 9 9 9 9 9 9 9
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1321  						9 9 9 9 9 9 9 9>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1322  			mediatek,cm-perf-mode-enable;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1323  			mediatek,cm-perf-mode-ceiling-opp = <0>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1324  			mediatek,cm-perf-mode-thd = <5>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1325  		};
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1326  
3a88be54312101 Xavier Chang   2024-01-08  1327  		ccipll_pll_ctrl_clk: syscon@c1e0000 {
3a88be54312101 Xavier Chang   2024-01-08  1328  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1329  			compatible = "mediatek,mt8196-ccipll-pll-ctrl", "mediatek,mt8196-ccipll_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1330  			reg = <0 0xc1e0000 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  1331  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1332  		};
3a88be54312101 Xavier Chang   2024-01-08  1333  
3a88be54312101 Xavier Chang   2024-01-08  1334  		armpll_ll_pll_ctrl_clk: syscon@c1e0400 {
3a88be54312101 Xavier Chang   2024-01-08  1335  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1336  			compatible = "mediatek,mt8196-armpll-ll-pll-ctrl", "mediatek,mt8196-armpll_ll_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1337  			reg = <0 0xc1e0400 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  1338  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1339  		};
3a88be54312101 Xavier Chang   2024-01-08  1340  
3a88be54312101 Xavier Chang   2024-01-08  1341  		armpll_bl_pll_ctrl_clk: syscon@c1e0800 {
3a88be54312101 Xavier Chang   2024-01-08  1342  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1343  			compatible = "mediatek,mt8196-armpll-bl-pll-ctrl", "mediatek,mt8196-armpll_bl_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1344  			reg = <0 0xc1e0800 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  1345  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1346  		};
3a88be54312101 Xavier Chang   2024-01-08  1347  
3a88be54312101 Xavier Chang   2024-01-08  1348  		armpll_b_pll_ctrl_clk: syscon@c1e0c00 {
3a88be54312101 Xavier Chang   2024-01-08  1349  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1350  			compatible = "mediatek,mt8196-armpll-b-pll-ctrl", "mediatek,mt8196-armpll_b_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1351  			reg = <0 0xc1e0c00 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1352  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1353  		};
3a88be54312101 Xavier Chang   2024-01-08  1354  
3a88be54312101 Xavier Chang   2024-01-08  1355  		ptppll_pll_ctrl_clk: syscon@c1e4000 {
3a88be54312101 Xavier Chang   2024-01-08  1356  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1357  			compatible = "mediatek,mt8196-ptppll-pll-ctrl", "mediatek,mt8196-ptppll_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1358  			reg = <0 0xc1e4000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1359  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1360  		};
3a88be54312101 Xavier Chang   2024-01-08  1361  
89dcc6e1084125 Xiufeng Li     2024-06-21  1362  		fdvfs: fdvfs@c220400 {
89dcc6e1084125 Xiufeng Li     2024-06-21  1363  			compatible = "mediatek,fdvfs";
89dcc6e1084125 Xiufeng Li     2024-06-21  1364  			reg = <0 0x0c220400 0 0x20>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1365  				<0 0x0c220420 0 0x4>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1366  				<0 0x0c2c2034 0 0x4>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1367  			reg-names = "fdvfs-reg",
89dcc6e1084125 Xiufeng Li     2024-06-21  1368  				"fdvfs-cci-reg",
89dcc6e1084125 Xiufeng Li     2024-06-21  1369  				"fdvfs-support";
89dcc6e1084125 Xiufeng Li     2024-06-21  1370  		};
89dcc6e1084125 Xiufeng Li     2024-06-21  1371  
af8ef1affaf7bd Michael Tseng  2024-06-20  1372  		mcupm: mcupm@c240000 {
af8ef1affaf7bd Michael Tseng  2024-06-20  1373  			compatible = "mediatek,mt8196-mcupm";
af8ef1affaf7bd Michael Tseng  2024-06-20  1374  			reg = <0 0x0c240000 0 0x50000>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1375  			      <0 0x0c2cf600 0 0xa0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1376  			      <0 0x0c242004 0 0x4>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1377  			      <0 0x0c242018 0 0x4>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1378  			      <0 0x0c242000 0 0x4>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1379  			      <0 0x0c242010 0 0x4>;
af8ef1affaf7bd Michael Tseng  2024-06-20  1380  			reg-names = "mcupm_base",
af8ef1affaf7bd Michael Tseng  2024-06-20  1381  				    "mbox0_base",
af8ef1affaf7bd Michael Tseng  2024-06-20  1382  				    "mbox0_set",
af8ef1affaf7bd Michael Tseng  2024-06-20  1383  				    "mbox0_clr",
af8ef1affaf7bd Michael Tseng  2024-06-20  1384  				    "mbox0_send",
af8ef1affaf7bd Michael Tseng  2024-06-20  1385  				    "mbox0_recv";
af8ef1affaf7bd Michael Tseng  2024-06-20  1386  			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1387  				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1388  				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1389  				     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1390  				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1391  				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1392  				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1393  				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1394  				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1395  				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1396  				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1397  				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1398  				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1399  				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1400  				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1401  				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH 0>;
af8ef1affaf7bd Michael Tseng  2024-06-20  1402  			interrupt-names = "mbox0",
af8ef1affaf7bd Michael Tseng  2024-06-20  1403  					  "mbox1",
af8ef1affaf7bd Michael Tseng  2024-06-20  1404  					  "mbox2",
af8ef1affaf7bd Michael Tseng  2024-06-20  1405  					  "mbox3",
af8ef1affaf7bd Michael Tseng  2024-06-20  1406  					  "mbox4",
af8ef1affaf7bd Michael Tseng  2024-06-20  1407  					  "mbox5",
af8ef1affaf7bd Michael Tseng  2024-06-20  1408  					  "mbox6",
af8ef1affaf7bd Michael Tseng  2024-06-20  1409  					  "mbox7",
af8ef1affaf7bd Michael Tseng  2024-06-20  1410  					  "mbox8",
af8ef1affaf7bd Michael Tseng  2024-06-20  1411  					  "mbox9",
af8ef1affaf7bd Michael Tseng  2024-06-20  1412  					  "mbox10",
af8ef1affaf7bd Michael Tseng  2024-06-20  1413  					  "mbox11",
af8ef1affaf7bd Michael Tseng  2024-06-20  1414  					  "mbox12",
af8ef1affaf7bd Michael Tseng  2024-06-20  1415  					  "mbox13",
af8ef1affaf7bd Michael Tseng  2024-06-20  1416  					  "mbox14",
af8ef1affaf7bd Michael Tseng  2024-06-20  1417  					  "mbox15";
af8ef1affaf7bd Michael Tseng  2024-06-20  1418  			mediatek,mbox-extend = <16>;
af8ef1affaf7bd Michael Tseng  2024-06-20  1419  		};
af8ef1affaf7bd Michael Tseng  2024-06-20  1420  
3a88be54312101 Xavier Chang   2024-01-08  1421  		performance: performance-controller@c2c0f20 {
89dcc6e1084125 Xiufeng Li     2024-06-21  1422  			compatible = "mediatek,cpufreq-hw-v1";
3a88be54312101 Xavier Chang   2024-01-08  1423  			reg = <0 0xc2c0f20 0 0x120>,
3a88be54312101 Xavier Chang   2024-01-08  1424  			      <0 0xc2c1040 0 0x120>,
3a88be54312101 Xavier Chang   2024-01-08  1425  			      <0 0xc2c1160 0 0x120>;
3a88be54312101 Xavier Chang   2024-01-08  1426  			reg-names = "performance-domain0",
3a88be54312101 Xavier Chang   2024-01-08  1427  				    "performance-domain1",
3a88be54312101 Xavier Chang   2024-01-08  1428  				    "performance-domain2";
3a88be54312101 Xavier Chang   2024-01-08  1429  			#performance-domain-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1430  		};
3a88be54312101 Xavier Chang   2024-01-08  1431  
89dcc6e1084125 Xiufeng Li     2024-06-21  1432  		cpuhvfs: cpuhvfs@c2c2310 {
89dcc6e1084125 Xiufeng Li     2024-06-21  1433  			compatible = "mediatek,cpufreq-hybrid";
89dcc6e1084125 Xiufeng Li     2024-06-21  1434  			reg = <0 0x0c2c2310 0 0xc00>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1435  			      <0 0x0c2c0f10 0 0x1400>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1436  			      <0 0x0c2c4850 0 0x800>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1437  			      <0 0x0c2c2e50 0 0xc0>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1438  			reg-names = "USRAM", "CSRAM", "ESRAM", "FREQ_HW_STATE";
89dcc6e1084125 Xiufeng Li     2024-06-21  1439  
89dcc6e1084125 Xiufeng Li     2024-06-21  1440  			/* pll mcucfg */
89dcc6e1084125 Xiufeng Li     2024-06-21  1441  			mcucfg-ver = <0>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1442  			apmixedsys = <&cpu_pll>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1443  			clk-div-base = <&cpu_mcucfg>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1444  
89dcc6e1084125 Xiufeng Li     2024-06-21  1445  			/* csram sysram base */
89dcc6e1084125 Xiufeng Li     2024-06-21  1446  			csram-sys-base = <&csram_sys>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1447  		};
89dcc6e1084125 Xiufeng Li     2024-06-21  1448  
3a88be54312101 Xavier Chang   2024-01-08  1449  		gic: interrupt-controller@c400000 {
3a88be54312101 Xavier Chang   2024-01-08  1450  			compatible = "arm,gic-v3";
3a88be54312101 Xavier Chang   2024-01-08  1451  			reg = <0 0xc400000 0 0x40000>, /* distributor */
3a88be54312101 Xavier Chang   2024-01-08  1452  			      <0 0xc440000 0 0x200000>; /* redistributor */
3a88be54312101 Xavier Chang   2024-01-08  1453  			#interrupt-cells = <4>;
3a88be54312101 Xavier Chang   2024-01-08  1454  			#address-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08  1455  			#size-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08  1456  			#redistributor-regions = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1457  			interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08  1458  			interrupt-controller;
3a88be54312101 Xavier Chang   2024-01-08  1459  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1460  
3a88be54312101 Xavier Chang   2024-01-08  1461  			ppi-partitions {
3a88be54312101 Xavier Chang   2024-01-08  1462  				ppi_cluster0: interrupt-partition-0 {
3a88be54312101 Xavier Chang   2024-01-08  1463  					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
3a88be54312101 Xavier Chang   2024-01-08  1464  				};
3a88be54312101 Xavier Chang   2024-01-08  1465  
3a88be54312101 Xavier Chang   2024-01-08  1466  				ppi_cluster1: interrupt-partition-1 {
3a88be54312101 Xavier Chang   2024-01-08  1467  					affinity = <&cpu4 &cpu5 &cpu6>;
3a88be54312101 Xavier Chang   2024-01-08  1468  				};
3a88be54312101 Xavier Chang   2024-01-08  1469  
3a88be54312101 Xavier Chang   2024-01-08  1470  				ppi_cluster2: interrupt-partition-2 {
3a88be54312101 Xavier Chang   2024-01-08  1471  					affinity = <&cpu7>;
3a88be54312101 Xavier Chang   2024-01-08  1472  				};
3a88be54312101 Xavier Chang   2024-01-08  1473  			};
3a88be54312101 Xavier Chang   2024-01-08  1474  		};
3a88be54312101 Xavier Chang   2024-01-08  1475  
3a88be54312101 Xavier Chang   2024-01-08  1476  		cksys_clk: syscon@10000000 {
3a88be54312101 Xavier Chang   2024-01-08  1477  			compatible = "mediatek,mt8196-cksys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1478  			reg = <0 0x10000000 0 0x800>;
3a88be54312101 Xavier Chang   2024-01-08  1479  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  1480  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1481  		};
3a88be54312101 Xavier Chang   2024-01-08  1482  
3a88be54312101 Xavier Chang   2024-01-08  1483  		apmixedsys_clk: syscon@10000800 {
3a88be54312101 Xavier Chang   2024-01-08  1484  			compatible = "mediatek,mt8196-apmixedsys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1485  			reg = <0 0x10000800 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1486  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1487  		};
3a88be54312101 Xavier Chang   2024-01-08  1488  
3a88be54312101 Xavier Chang   2024-01-08  1489  		cksys_gp2_clk: syscon@1000c000 {
3a88be54312101 Xavier Chang   2024-01-08  1490  			compatible = "mediatek,mt8196-cksys-gp2", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1491  			reg = <0 0x1000c000 0 0x800>;
3a88be54312101 Xavier Chang   2024-01-08  1492  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  1493  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1494  		};
3a88be54312101 Xavier Chang   2024-01-08  1495  
3a88be54312101 Xavier Chang   2024-01-08  1496  		apmixedsys_gp2_clk: syscon@1000c800 {
3a88be54312101 Xavier Chang   2024-01-08  1497  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1498  			compatible = "mediatek,mt8196-apmixedsys-gp2", "mediatek,mt8196-apmixedsys_gp2", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1499  			reg = <0 0x1000c800 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1500  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1501  		};
3a88be54312101 Xavier Chang   2024-01-08  1502  
3a88be54312101 Xavier Chang   2024-01-08  1503  		ifr_bus: syscon@1002c000 {
3a88be54312101 Xavier Chang   2024-01-08  1504  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1505  			compatible = "mediatek,mt8196-ifr-bus", "mediatek,mt8196-ifr_bus", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1506  			reg = <0 0x1002c000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1507  		};
3a88be54312101 Xavier Chang   2024-01-08  1508  
22882fd26feeb6 Guodong Liu    2024-01-20  1509  		pio: pinctrl@1002d000 {
22882fd26feeb6 Guodong Liu    2024-01-20  1510  			compatible = "mediatek,mt8196-pinctrl";
22882fd26feeb6 Guodong Liu    2024-01-20  1511  			reg = <0 0x1002d000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1512  			      <0 0x12000000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1513  			      <0 0x12020000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1514  			      <0 0x12040000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1515  			      <0 0x12060000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1516  			      <0 0x12820000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1517  			      <0 0x12840000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1518  			      <0 0x12860000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1519  			      <0 0x13000000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1520  			      <0 0x13020000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1521  			      <0 0x13040000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1522  			      <0 0x130f0000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1523  			      <0 0x13110000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1524  			      <0 0x13800000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1525  			      <0 0x13820000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1526  			      <0 0x13860000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1527  			      <0 0x12080000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1528  			      <0 0x12880000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1529  			      <0 0x13080000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1530  			      <0 0x13880000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1531  			      <0 0x1c54a000 0 0x1000>;
22882fd26feeb6 Guodong Liu    2024-01-20  1532  			reg-names = "iocfg0",
22882fd26feeb6 Guodong Liu    2024-01-20  1533  				    "iocfg_rt",
22882fd26feeb6 Guodong Liu    2024-01-20  1534  				    "iocfg_rm1",
22882fd26feeb6 Guodong Liu    2024-01-20  1535  				    "iocfg_rm2",
22882fd26feeb6 Guodong Liu    2024-01-20  1536  				    "iocfg_rb",
22882fd26feeb6 Guodong Liu    2024-01-20  1537  				    "iocfg_bm1",
22882fd26feeb6 Guodong Liu    2024-01-20  1538  				    "iocfg_bm2",
22882fd26feeb6 Guodong Liu    2024-01-20  1539  				    "iocfg_bm3",
22882fd26feeb6 Guodong Liu    2024-01-20  1540  				    "iocfg_lt",
22882fd26feeb6 Guodong Liu    2024-01-20  1541  				    "iocfg_lm1",
22882fd26feeb6 Guodong Liu    2024-01-20  1542  				    "iocfg_lm2",
22882fd26feeb6 Guodong Liu    2024-01-20  1543  				    "iocfg_lb1",
22882fd26feeb6 Guodong Liu    2024-01-20  1544  				    "iocfg_lb2",
22882fd26feeb6 Guodong Liu    2024-01-20  1545  				    "iocfg_tm1",
22882fd26feeb6 Guodong Liu    2024-01-20  1546  				    "iocfg_tm2",
22882fd26feeb6 Guodong Liu    2024-01-20  1547  				    "iocfg_tm3",
22882fd26feeb6 Guodong Liu    2024-01-20  1548  				    "eint-e",
22882fd26feeb6 Guodong Liu    2024-01-20  1549  				    "eint-s",
22882fd26feeb6 Guodong Liu    2024-01-20  1550  				    "eint-w",
22882fd26feeb6 Guodong Liu    2024-01-20  1551  				    "eint-n",
22882fd26feeb6 Guodong Liu    2024-01-20  1552  				    "eint-c";
22882fd26feeb6 Guodong Liu    2024-01-20  1553  			gpio-controller;
22882fd26feeb6 Guodong Liu    2024-01-20  1554  			#gpio-cells = <2>;
22882fd26feeb6 Guodong Liu    2024-01-20  1555  			gpio-ranges = <&pio 0 0 271>;
22882fd26feeb6 Guodong Liu    2024-01-20  1556  			interrupt-controller;
22882fd26feeb6 Guodong Liu    2024-01-20  1557  			interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>;
22882fd26feeb6 Guodong Liu    2024-01-20  1558  			#interrupt-cells = <2>;
22882fd26feeb6 Guodong Liu    2024-01-20  1559  		};
22882fd26feeb6 Guodong Liu    2024-01-20  1560  
2905358ad1479d Crystal Guo    2024-07-24  1561  		memory-controller@10236000 {
2905358ad1479d Crystal Guo    2024-07-24  1562  			compatible = "mediatek,mt8196-dramc";
2905358ad1479d Crystal Guo    2024-07-24  1563  			reg = <0 0x10236000 0 0x2000>, /* anaphy base */
2905358ad1479d Crystal Guo    2024-07-24  1564  			      <0 0x10238000 0 0x2000>;  /* ddrphy base */
2905358ad1479d Crystal Guo    2024-07-24  1565  		};
2905358ad1479d Crystal Guo    2024-07-24  1566  
b9408b7224ce87 Runyang Chen   2024-03-26  1567  		devapc_apinfra_dramc: devapc@102f3000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1568  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1569  			reg = <0 0x102f3000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1570  			vio-idx-num = <61>;
b9408b7224ce87 Runyang Chen   2024-03-26  1571  			interrupts = <GIC_SPI 870 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1572  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1573  
3a41185f82d985 Nolan Yang     2024-05-10  1574  		nsmpu: nsmpu@1046f000 {
3a41185f82d985 Nolan Yang     2024-05-10  1575  			/* TODO: Move some property into platform data */
3a41185f82d985 Nolan Yang     2024-05-10  1576  			compatible = "mediatek,smpu";
3a41185f82d985 Nolan Yang     2024-05-10  1577  			reg = <0 0x1046f000 0 0x1000>;
3a41185f82d985 Nolan Yang     2024-05-10  1578  			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>;
3a41185f82d985 Nolan Yang     2024-05-10  1579  			name = "nsmpu";
3a41185f82d985 Nolan Yang     2024-05-10  1580  			sr-cnt = <63>;
3a41185f82d985 Nolan Yang     2024-05-10  1581  			aid-cnt = <256>;
3a41185f82d985 Nolan Yang     2024-05-10  1582  			aid-num-per-set = <32>;
3a41185f82d985 Nolan Yang     2024-05-10  1583  			dump = <0xe00 0xe08 0xe0c 0xe10 0xe14 0xe18 0xe1c 0xe20 0xe28
3a41185f82d985 Nolan Yang     2024-05-10  1584  				0xe80 0xe88 0xe8c 0xe90 0xe94 0xe98 0xe9c 0xea0 0xea8>;
3a41185f82d985 Nolan Yang     2024-05-10  1585  			dump-md = <0xe40 0xe48 0xe4c 0xe50 0xe54 0xe58 0xe5c 0xe60 0xe68
3a41185f82d985 Nolan Yang     2024-05-10  1586  				0xec0 0xec8 0xecc 0xed0 0xed4 0xed8 0xedc 0xee0 0xee8>;
3a41185f82d985 Nolan Yang     2024-05-10  1587  			clear = <0xe00 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1588  				<0xe00 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1589  				<0xe80 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1590  				<0xe80 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1591  			mask = <0xe00 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1592  				<0xe80 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1593  				<0xe40 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1594  				<0xec0 0x2 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1595  			clear-md = <0xe40 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1596  				   <0xe40 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1597  				   <0xec0 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1598  				   <0xec0 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1599  			vio-info = <0x0 0x2 0x9 0x2>;
3a41185f82d985 Nolan Yang     2024-05-10  1600  			bypass = <0xe1c 0xe9c 0xe28 0xea8>;
3a41185f82d985 Nolan Yang     2024-05-10  1601  			bypass-axi = <0x6 0xff80 0x4000 0x7 0xff01 0x4001>;
3a41185f82d985 Nolan Yang     2024-05-10  1602  			bypass-wce = <0x5 0xf3 0x7 0x16>;
3a41185f82d985 Nolan Yang     2024-05-10  1603  			mediatek,slc-b-mode;
3a41185f82d985 Nolan Yang     2024-05-10  1604  		};
3a41185f82d985 Nolan Yang     2024-05-10  1605  
3a41185f82d985 Nolan Yang     2024-05-10  1606  		ssmpu: ssmpu@1056f000{
3a41185f82d985 Nolan Yang     2024-05-10  1607  			/* TODO: Move some property into platform data */
3a41185f82d985 Nolan Yang     2024-05-10  1608  			compatible = "mediatek,smpu";
3a41185f82d985 Nolan Yang     2024-05-10  1609  			reg = <0 0x1056f000 0 0x1000>;
3a41185f82d985 Nolan Yang     2024-05-10  1610  			interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
3a41185f82d985 Nolan Yang     2024-05-10  1611  			name = "ssmpu";
3a41185f82d985 Nolan Yang     2024-05-10  1612  			dump = <0xe00 0xe08 0xe0c 0xe10 0xe14 0xe18 0xe1c 0xe20 0xe28
3a41185f82d985 Nolan Yang     2024-05-10  1613  				0xe80 0xe88 0xe8c 0xe90 0xe94 0xe98 0xe9c 0xea0 0xea8>;
3a41185f82d985 Nolan Yang     2024-05-10  1614  			dump-md = <0xe40 0xe48 0xe4c 0xe50 0xe54 0xe58 0xe5c 0xe60 0xe68
3a41185f82d985 Nolan Yang     2024-05-10  1615  				   0xec0 0xec8 0xecc 0xed0 0xed4 0xed8 0xedc 0xee0 0xee8>;
3a41185f82d985 Nolan Yang     2024-05-10  1616  			clear = <0xe00 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1617  				<0xe00 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1618  				<0xe80 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1619  				<0xe80 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1620  			mask = <0xe00 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1621  			       <0xe80 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1622  			       <0xe40 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1623  			       <0xec0 0x2 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1624  			clear-md = <0xe40 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1625  				   <0xe40 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1626  				   <0xec0 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1627  				   <0xec0 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1628  			vio-info = <0x0 0x2 0x9 0x2>;
3a41185f82d985 Nolan Yang     2024-05-10  1629  			bypass = <0xe1c 0xe9c 0xe28 0xea8>;
3a41185f82d985 Nolan Yang     2024-05-10  1630  			bypass-axi = <0x6 0xff80 0x4000 0x7 0xff01 0x4001>;
3a41185f82d985 Nolan Yang     2024-05-10  1631  			bypass-wce = <0x5 0xf3 0x7 0x16>;
3a41185f82d985 Nolan Yang     2024-05-10  1632  			mediatek,slc-b-mode;
3a41185f82d985 Nolan Yang     2024-05-10  1633  		};
3a41185f82d985 Nolan Yang     2024-05-10  1634  
3a41185f82d985 Nolan Yang     2024-05-10  1635  		nkp: nkp@1046f000 {
3a41185f82d985 Nolan Yang     2024-05-10  1636  			/* TODO: Move some property into platform data */
3a41185f82d985 Nolan Yang     2024-05-10  1637  			compatible = "mediatek,smpu";
3a41185f82d985 Nolan Yang     2024-05-10  1638  			reg = <0 0x1046f000 0 0x1000>;
3a41185f82d985 Nolan Yang     2024-05-10  1639  			interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH 0>;
3a41185f82d985 Nolan Yang     2024-05-10  1640  			name = "nkp";
3a41185f82d985 Nolan Yang     2024-05-10  1641  			dump = <0xc00 0xc04 0xc10 0xc14>;
3a41185f82d985 Nolan Yang     2024-05-10  1642  			clear = <0x410 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1643  				<0x410 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1644  			mask = <0x410 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1645  			       <0xe40 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1646  			       <0xec0 0x2 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1647  			clear-md = <0xe40 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1648  				   <0xe40 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1649  				   <0xec0 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1650  				   <0xec0 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1651  			vio-info = <0x1 0xf 0x3 0xf>;
3a41185f82d985 Nolan Yang     2024-05-10  1652  			mediatek,slc-b-mode;
3a41185f82d985 Nolan Yang     2024-05-10  1653  		};
3a41185f82d985 Nolan Yang     2024-05-10  1654  
3a41185f82d985 Nolan Yang     2024-05-10  1655  		skp: skp@1056f000 {
3a41185f82d985 Nolan Yang     2024-05-10  1656  			/* TODO: Move some property into platform data */
3a41185f82d985 Nolan Yang     2024-05-10  1657  			compatible = "mediatek,smpu";
3a41185f82d985 Nolan Yang     2024-05-10  1658  			reg = <0 0x1056f000 0 0x1000>;
3a41185f82d985 Nolan Yang     2024-05-10  1659  			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>;
3a41185f82d985 Nolan Yang     2024-05-10  1660  			name = "skp";
3a41185f82d985 Nolan Yang     2024-05-10  1661  			dump = <0xc00 0xc04 0xc10 0xc14>;
3a41185f82d985 Nolan Yang     2024-05-10  1662  			clear = <0x410 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1663  				<0x410 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1664  			mask = <0x410 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1665  			       <0xe40 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1666  			       <0xec0 0x2 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1667  			clear-md = <0xe40 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1668  				   <0xe40 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1669  				   <0xec0 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1670  				   <0xec0 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1671  			vio-info = <0x1 0xf 0x3 0xf>;
3a41185f82d985 Nolan Yang     2024-05-10  1672  			mediatek,slc-b-mode;
3a41185f82d985 Nolan Yang     2024-05-10  1673  		};
3a41185f82d985 Nolan Yang     2024-05-10  1674  
b9408b7224ce87 Runyang Chen   2024-03-26  1675  		devapc_apinfra_emi: devapc@10613000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1676  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1677  			reg = <0 0x10613000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1678  			vio-idx-num = <149>;
b9408b7224ce87 Runyang Chen   2024-03-26  1679  			interrupts = <GIC_SPI 869 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1680  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1681  
b9408b7224ce87 Runyang Chen   2024-03-26  1682  		devapc_apinfra_big4: devapc@10693000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1683  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1684  			reg = <0 0x10693000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1685  			vio-idx-num = <89>;
b9408b7224ce87 Runyang Chen   2024-03-26  1686  			interrupts = <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1687  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1688  
3a88be54312101 Xavier Chang   2024-01-08  1689  		i2c5: i2c@120a0000 {
3a88be54312101 Xavier Chang   2024-01-08  1690  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1691  			reg = <0 0x120a0000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1692  			      <0 0x16400000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1693  			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1694  			clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C5_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1695  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1696  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1697  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1698  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1699  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1700  
3a88be54312101 Xavier Chang   2024-01-08  1701  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1702  		};
3a88be54312101 Xavier Chang   2024-01-08  1703  
3a88be54312101 Xavier Chang   2024-01-08  1704  		imp_iic_wrap_e_clk: syscon@120c0000 {
3a88be54312101 Xavier Chang   2024-01-08  1705  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1706  			compatible = "mediatek,mt8196-imp-iic-wrap-e", "mediatek,mt8196-imp_iic_wrap_e", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1707  			reg = <0 0x120c0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1708  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1709  		};
3a88be54312101 Xavier Chang   2024-01-08  1710  
9a5b02d04139ce Shuijing Li    2024-07-17  1711  		mipi_tx_config0: mipi-tx-config@130b0000 {
9a5b02d04139ce Shuijing Li    2024-07-17  1712  			compatible = "mediatek,mt8196-mipi-tx";
9a5b02d04139ce Shuijing Li    2024-07-17  1713  			reg = <0 0x130b0000 0 0x1000>;
9a5b02d04139ce Shuijing Li    2024-07-17  1714  			clocks = <&clk26m>;
9a5b02d04139ce Shuijing Li    2024-07-17  1715  			#clock-cells = <0>;
9a5b02d04139ce Shuijing Li    2024-07-17  1716  			#phy-cells = <0>;
9a5b02d04139ce Shuijing Li    2024-07-17  1717  			clock-output-names = "mipi_tx0_pll";
9a5b02d04139ce Shuijing Li    2024-07-17  1718  		};
9a5b02d04139ce Shuijing Li    2024-07-17  1719  
3a88be54312101 Xavier Chang   2024-01-08  1720  		i2c0: i2c@13130000 {
3a88be54312101 Xavier Chang   2024-01-08  1721  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1722  			reg = <0 0x13130000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1723  			      <0 0x16370000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1724  			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1725  			clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C0_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1726  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1727  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1728  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1729  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1730  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1731  
3a88be54312101 Xavier Chang   2024-01-08  1732  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1733  		};
3a88be54312101 Xavier Chang   2024-01-08  1734  
3a88be54312101 Xavier Chang   2024-01-08  1735  		i2c3: i2c@13150000 {
3a88be54312101 Xavier Chang   2024-01-08  1736  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1737  			reg = <0 0x13150000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1738  			      <0 0x163c0000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1739  			interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1740  			clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C3_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1741  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1742  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1743  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1744  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1745  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1746  
3a88be54312101 Xavier Chang   2024-01-08  1747  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1748  		};
3a88be54312101 Xavier Chang   2024-01-08  1749  
3a88be54312101 Xavier Chang   2024-01-08  1750  		i2c6: i2c@13170000 {
3a88be54312101 Xavier Chang   2024-01-08  1751  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1752  			reg = <0 0x13170000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1753  			      <0 0x16410000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1754  			interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1755  			clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C6_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1756  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1757  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1758  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1759  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1760  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1761  
3a88be54312101 Xavier Chang   2024-01-08  1762  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1763  		};
3a88be54312101 Xavier Chang   2024-01-08  1764  
3a88be54312101 Xavier Chang   2024-01-08  1765  		i2c10: i2c@13190000 {
3a88be54312101 Xavier Chang   2024-01-08  1766  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1767  			reg = <0 0x13190000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1768  			      <0 0x164b0000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1769  			interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1770  			clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C10_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1771  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1772  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1773  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1774  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1775  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1776  
3a88be54312101 Xavier Chang   2024-01-08  1777  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1778  		};
3a88be54312101 Xavier Chang   2024-01-08  1779  
3a88be54312101 Xavier Chang   2024-01-08  1780  		imp_iic_wrap_w_clk: syscon@131b0000 {
3a88be54312101 Xavier Chang   2024-01-08  1781  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1782  			compatible = "mediatek,mt8196-imp-iic-wrap-w", "mediatek,mt8196-imp_iic_wrap_w", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1783  			reg = <0 0x131b0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1784  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1785  		};
3a88be54312101 Xavier Chang   2024-01-08  1786  
576847ca8eb1b0 William-tw Lin 2024-03-01  1787  		efuse: efuse@13260000 {
576847ca8eb1b0 William-tw Lin 2024-03-01  1788  			compatible = "mediatek,mt8196-efuse", "mediatek,efuse";
576847ca8eb1b0 William-tw Lin 2024-03-01  1789  			reg = <0 0x13260000 0 0x1000>;
576847ca8eb1b0 William-tw Lin 2024-03-01  1790  			#address-cells = <1>;
576847ca8eb1b0 William-tw Lin 2024-03-01  1791  			#size-cells = <1>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1792  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1793  			lvts_e_data1: data1@334 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1794  				reg = <0x334 0xc>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1795  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1796  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1797  			lvts_e_data2: data2@340 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1798  				reg = <0x340 0x14>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1799  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1800  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1801  			lvts_e_data3: data3@354 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1802  				reg = <0x354 0x20>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1803  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1804  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1805  			lvts_e_data4: data4@388 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1806  				reg = <0x388 0x20>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1807  			};
5c77cb151de366 Xavier Chang   2024-08-08  1808  
5c77cb151de366 Xavier Chang   2024-08-08  1809  			socinfo-data1@40 {
5c77cb151de366 Xavier Chang   2024-08-08  1810  				reg = <0x40 0x4>;
5c77cb151de366 Xavier Chang   2024-08-08  1811  			};
5c77cb151de366 Xavier Chang   2024-08-08  1812  
5c77cb151de366 Xavier Chang   2024-08-08  1813  			socinfo-data2@4c {
5c77cb151de366 Xavier Chang   2024-08-08  1814  				reg = <0x4c 0x4>;
5c77cb151de366 Xavier Chang   2024-08-08  1815  			};
576847ca8eb1b0 William-tw Lin 2024-03-01  1816  		};
576847ca8eb1b0 William-tw Lin 2024-03-01  1817  
3a88be54312101 Xavier Chang   2024-01-08  1818  		i2c1: i2c@13930000 {
3a88be54312101 Xavier Chang   2024-01-08  1819  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1820  			reg = <0 0x13930000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1821  			      <0 0x16380000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1822  			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1823  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C1_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1824  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1825  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1826  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1827  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1828  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1829  
3a88be54312101 Xavier Chang   2024-01-08  1830  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1831  		};
3a88be54312101 Xavier Chang   2024-01-08  1832  
3a88be54312101 Xavier Chang   2024-01-08  1833  		i2c2: i2c@139b0000 {
3a88be54312101 Xavier Chang   2024-01-08  1834  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1835  			reg = <0 0x139b0000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1836  			      <0 0x16390000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1837  			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1838  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C2_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1839  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1840  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1841  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1842  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1843  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1844  
3a88be54312101 Xavier Chang   2024-01-08  1845  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1846  		};
3a88be54312101 Xavier Chang   2024-01-08  1847  
3a88be54312101 Xavier Chang   2024-01-08  1848  		i2c4: i2c@13a30000 {
3a88be54312101 Xavier Chang   2024-01-08  1849  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1850  			reg = <0 0x13a30000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1851  			      <0 0x163d0000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1852  			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1853  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C4_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1854  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1855  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1856  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1857  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1858  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1859  
3a88be54312101 Xavier Chang   2024-01-08  1860  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1861  		};
3a88be54312101 Xavier Chang   2024-01-08  1862  
3a88be54312101 Xavier Chang   2024-01-08  1863  		i2c7: i2c@13ab0000 {
3a88be54312101 Xavier Chang   2024-01-08  1864  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1865  			reg = <0 0x13ab0000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1866  			      <0 0x16420000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1867  			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1868  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C7_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1869  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1870  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1871  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1872  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1873  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1874  
3a88be54312101 Xavier Chang   2024-01-08  1875  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1876  		};
3a88be54312101 Xavier Chang   2024-01-08  1877  
3a88be54312101 Xavier Chang   2024-01-08  1878  		i2c8: i2c@13b30000 {
3a88be54312101 Xavier Chang   2024-01-08  1879  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1880  			reg = <0 0x13b30000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1881  			      <0 0x16450000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1882  			interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1883  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C8_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1884  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1885  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1886  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1887  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1888  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1889  
3a88be54312101 Xavier Chang   2024-01-08  1890  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1891  		};
3a88be54312101 Xavier Chang   2024-01-08  1892  
3a88be54312101 Xavier Chang   2024-01-08  1893  		i2c9: i2c@13bb0000 {
3a88be54312101 Xavier Chang   2024-01-08  1894  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1895  			reg = <0 0x13bb0000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1896  			      <0 0x16480000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1897  			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1898  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C9_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1899  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1900  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1901  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1902  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1903  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1904  
3a88be54312101 Xavier Chang   2024-01-08  1905  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1906  		};
3a88be54312101 Xavier Chang   2024-01-08  1907  
3a88be54312101 Xavier Chang   2024-01-08  1908  		imp_iic_wrap_n_clk: syscon@13c30000 {
3a88be54312101 Xavier Chang   2024-01-08  1909  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1910  			compatible = "mediatek,mt8196-imp-iic-wrap-n", "mediatek,mt8196-imp_iic_wrap_n", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1911  			reg = <0 0x13c30000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1912  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  1913  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1914  		};
3a88be54312101 Xavier Chang   2024-01-08  1915  
b9408b7224ce87 Runyang Chen   2024-03-26  1916  		devapc_apinfra_io_intf: devapc@140a0000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1917  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1918  			reg = <0 0x140a0000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1919  			vio-idx-num = <8>;
b9408b7224ce87 Runyang Chen   2024-03-26  1920  			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1921  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1922  
b9408b7224ce87 Runyang Chen   2024-03-26  1923  		devapc_apinfra_mem_intf: devapc@140c0000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1924  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1925  			reg = <0 0x140c0000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1926  			vio-idx-num = <7>;
b9408b7224ce87 Runyang Chen   2024-03-26  1927  			interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1928  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1929  
b9408b7224ce87 Runyang Chen   2024-03-26  1930  		devapc_apinfra_slb: devapc@140e0000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1931  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1932  			reg = <0 0x140e0000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1933  			vio-idx-num = <14>;
b9408b7224ce87 Runyang Chen   2024-03-26  1934  			interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1935  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1936  
3a88be54312101 Xavier Chang   2024-01-08  1937  		apifrbus_ao_mem_reg_clk: syscon@14126000 {
3a88be54312101 Xavier Chang   2024-01-08  1938  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1939  			compatible = "mediatek,mt8196-apifrbus-ao-mem-reg", "mediatek,mt8196-apifrbus_ao_mem_reg", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1940  			reg = <0 0x14126000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1941  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1942  		};
3a88be54312101 Xavier Chang   2024-01-08  1943  
b9408b7224ce87 Runyang Chen   2024-03-26  1944  		devapc_apinfra_mem: devapc@14130000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1945  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1946  			reg = <0 0x14130000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1947  			vio-idx-num = <13>;
b9408b7224ce87 Runyang Chen   2024-03-26  1948  			interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1949  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1950  
b9408b7224ce87 Runyang Chen   2024-03-26  1951  		devapc_apinfra_mem_ctrl: devapc@14131000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1952  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1953  			reg = <0 0x14131000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1954  			vio-idx-num = <23>;
b9408b7224ce87 Runyang Chen   2024-03-26  1955  			interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1956  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1957  
b9408b7224ce87 Runyang Chen   2024-03-26  1958  		infracfg@14136000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1959  			compatible = "mediatek,infracfg";
b9408b7224ce87 Runyang Chen   2024-03-26  1960  			reg = <0 0x14136000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1961  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1962  
b9408b7224ce87 Runyang Chen   2024-03-26  1963  		devapc_apinfra_int: devapc@142f4000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1964  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1965  			reg = <0 0x142f4000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1966  			vio-idx-num = <26>;
b9408b7224ce87 Runyang Chen   2024-03-26  1967  			interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1968  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1969  
b9408b7224ce87 Runyang Chen   2024-03-26  1970  		devapc_apinfra_io_ctrl: devapc@14400000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1971  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1972  			reg = <0 0x14400000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1973  			vio-idx-num = <10>;
b9408b7224ce87 Runyang Chen   2024-03-26  1974  			interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1975  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1976  
b9408b7224ce87 Runyang Chen   2024-03-26  1977  		devapc_apinfra_io: devapc@14401000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1978  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1979  			reg = <0 0x14401000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1980  			vio-idx-num = <230>;
b9408b7224ce87 Runyang Chen   2024-03-26  1981  			interrupts = <GIC_SPI 867 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1982  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1983  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1984  		lvts: thermal-sensor@14414000 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1985  			compatible = "mediatek,mt8196-lvts";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1986  			reg = <0 0x14414000 0 0x1000>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1987  				<0 0x0c230000 0 0x1000>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1988  				<0 0x19004000 0 0x1000>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1989  				<0 0x4b400000 0 0x1000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1990  			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1991  					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1992  					<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH 0>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1993  					<GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH 0>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1994  			#thermal-sensor-cells = <1>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1995  			nvmem-cells = <&lvts_e_data1 &lvts_e_data2 &lvts_e_data3
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1996  					&lvts_e_data4>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1997  			nvmem-cell-names = "e_data1","e_data2","e_data3","e_data4";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1998  		};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1999  
3a88be54312101 Xavier Chang   2024-01-08  2000  		hwv: syscon@14500000 {
3a88be54312101 Xavier Chang   2024-01-08  2001  			compatible = "mediatek,mt8196-hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2002  			reg = <0 0x14500000 0 0x3000>;
3a88be54312101 Xavier Chang   2024-01-08  2003  		};
3a88be54312101 Xavier Chang   2024-01-08  2004  
b9408b7224ce87 Runyang Chen   2024-03-26  2005  		devapc_apinfra_mmu: devapc@14800000 {
b9408b7224ce87 Runyang Chen   2024-03-26  2006  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  2007  			reg = <0 0x14800000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  2008  			vio-idx-num = <20>;
b9408b7224ce87 Runyang Chen   2024-03-26  2009  			interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  2010  		};
b9408b7224ce87 Runyang Chen   2024-03-26  2011  
3a88be54312101 Xavier Chang   2024-01-08  2012  		uart0: serial@16000000 {
3a88be54312101 Xavier Chang   2024-01-08  2013  			compatible = "mediatek,mt6577-uart";
3a88be54312101 Xavier Chang   2024-01-08  2014  			reg = <0 0x16000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2015  			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2016  			clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0_BCLK_UART>;
3a88be54312101 Xavier Chang   2024-01-08  2017  			clock-names = "baud", "bus";
3a88be54312101 Xavier Chang   2024-01-08  2018  
3a88be54312101 Xavier Chang   2024-01-08  2019  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2020  		};
3a88be54312101 Xavier Chang   2024-01-08  2021  
3a88be54312101 Xavier Chang   2024-01-08  2022  		uart1: serial@16010000 {
3a88be54312101 Xavier Chang   2024-01-08  2023  			compatible = "mediatek,mt6577-uart";
3a88be54312101 Xavier Chang   2024-01-08  2024  			reg = <0 0x16010000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2025  			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2026  			clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART1_BCLK_UART>;
3a88be54312101 Xavier Chang   2024-01-08  2027  			clock-names = "baud", "bus";
3a88be54312101 Xavier Chang   2024-01-08  2028  
3a88be54312101 Xavier Chang   2024-01-08  2029  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2030  		};
3a88be54312101 Xavier Chang   2024-01-08  2031  
3a88be54312101 Xavier Chang   2024-01-08  2032  		uart2: serial@16020000 {
3a88be54312101 Xavier Chang   2024-01-08  2033  			compatible = "mediatek,mt6577-uart";
3a88be54312101 Xavier Chang   2024-01-08  2034  			reg = <0 0x16020000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2035  			interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2036  			clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART2_BCLK_UART>;
3a88be54312101 Xavier Chang   2024-01-08  2037  			clock-names = "baud", "bus";
3a88be54312101 Xavier Chang   2024-01-08  2038  
3a88be54312101 Xavier Chang   2024-01-08  2039  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2040  		};
3a88be54312101 Xavier Chang   2024-01-08  2041  
3a88be54312101 Xavier Chang   2024-01-08  2042  		uart3: serial@16030000 {
3a88be54312101 Xavier Chang   2024-01-08  2043  			compatible = "mediatek,mt6985-uart";
3a88be54312101 Xavier Chang   2024-01-08  2044  			reg = <0 0x16030000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2045  			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
3a88be54312101 Xavier Chang   2024-01-08  2046  				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH 0>;    /* uart3 wakeup irq */
3a88be54312101 Xavier Chang   2024-01-08  2047  			clocks = <&clk104m>, <&pericfg_ao_clk CLK_PERAO_UART3_BCLK_UART>;
3a88be54312101 Xavier Chang   2024-01-08  2048  			clock-names = "baud", "bus";
3a88be54312101 Xavier Chang   2024-01-08  2049  
3a88be54312101 Xavier Chang   2024-01-08  2050  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2051  		};
3a88be54312101 Xavier Chang   2024-01-08  2052  
45e3c3db4a7683 Jitao Shi      2024-04-02  2053  		disp_pwm0: disp-pwm0@160b0000 {
45e3c3db4a7683 Jitao Shi      2024-04-02  2054  			compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
45e3c3db4a7683 Jitao Shi      2024-04-02  2055  			reg = <0 0x160b0000 0 0x1000>;
45e3c3db4a7683 Jitao Shi      2024-04-02  2056  			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
45e3c3db4a7683 Jitao Shi      2024-04-02  2057  			#pwm-cells = <2>;
45e3c3db4a7683 Jitao Shi      2024-04-02  2058  			clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
45e3c3db4a7683 Jitao Shi      2024-04-02  2059  			clock-names = "main";
45e3c3db4a7683 Jitao Shi      2024-04-02  2060  			status = "disabled";
45e3c3db4a7683 Jitao Shi      2024-04-02  2061  		};
45e3c3db4a7683 Jitao Shi      2024-04-02  2062  
45e3c3db4a7683 Jitao Shi      2024-04-02  2063  		disp_pwm1: disp-pwm1@160c0000 {
45e3c3db4a7683 Jitao Shi      2024-04-02  2064  			compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
45e3c3db4a7683 Jitao Shi      2024-04-02  2065  			reg = <0 0x160c0000 0 0x1000>;
45e3c3db4a7683 Jitao Shi      2024-04-02  2066  			#pwm-cells = <2>;
45e3c3db4a7683 Jitao Shi      2024-04-02  2067  			clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
45e3c3db4a7683 Jitao Shi      2024-04-02  2068  			clock-names = "main";
45e3c3db4a7683 Jitao Shi      2024-04-02  2069  			status = "disabled";
45e3c3db4a7683 Jitao Shi      2024-04-02  2070  		};
45e3c3db4a7683 Jitao Shi      2024-04-02  2071  
3a88be54312101 Xavier Chang   2024-01-08  2072  		spi0: spi@16110000 {
3a88be54312101 Xavier Chang   2024-01-08  2073  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  2074  			reg = <0 0x16110000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  2075  			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2076  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  2077  				<&cksys_clk CLK_CK_SPI0_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2078  				<&pericfg_ao_clk CLK_PERAO_SPI0_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  2079  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  2080  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2081  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2082  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2083  
3a88be54312101 Xavier Chang   2024-01-08  2084  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2085  		};
3a88be54312101 Xavier Chang   2024-01-08  2086  
3a88be54312101 Xavier Chang   2024-01-08  2087  		spi1: spi@16130000 {
3a88be54312101 Xavier Chang   2024-01-08  2088  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  2089  			reg = <0 0x16130000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  2090  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2091  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  2092  				<&cksys_clk CLK_CK_SPI1_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2093  				<&pericfg_ao_clk CLK_PERAO_SPI1_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  2094  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  2095  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2096  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2097  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2098  
3a88be54312101 Xavier Chang   2024-01-08  2099  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2100  		};
3a88be54312101 Xavier Chang   2024-01-08  2101  
3a88be54312101 Xavier Chang   2024-01-08  2102  		spi2: spi@16150000 {
3a88be54312101 Xavier Chang   2024-01-08  2103  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  2104  			reg = <0 0x16150000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  2105  			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2106  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  2107  				<&cksys_clk CLK_CK_SPI2_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2108  				<&pericfg_ao_clk CLK_PERAO_SPI2_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  2109  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  2110  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2111  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2112  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2113  
3a88be54312101 Xavier Chang   2024-01-08  2114  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2115  		};
3a88be54312101 Xavier Chang   2024-01-08  2116  
3a88be54312101 Xavier Chang   2024-01-08  2117  		spi3: spi@16170000 {
3a88be54312101 Xavier Chang   2024-01-08  2118  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  2119  			reg = <0 0x16170000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  2120  			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2121  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  2122  				<&cksys_clk CLK_CK_SPI3_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2123  				<&pericfg_ao_clk CLK_PERAO_SPI3_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  2124  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  2125  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2126  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2127  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2128  
3a88be54312101 Xavier Chang   2024-01-08  2129  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2130  		};
3a88be54312101 Xavier Chang   2024-01-08  2131  
3a88be54312101 Xavier Chang   2024-01-08  2132  		spi4: spi@16190000 {
3a88be54312101 Xavier Chang   2024-01-08  2133  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  2134  			reg = <0 0x16190000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  2135  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2136  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  2137  				<&cksys_clk CLK_CK_SPI4_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2138  				<&pericfg_ao_clk CLK_PERAO_SPI4_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  2139  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  2140  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2141  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2142  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2143  
3a88be54312101 Xavier Chang   2024-01-08  2144  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2145  		};
3a88be54312101 Xavier Chang   2024-01-08  2146  
3a88be54312101 Xavier Chang   2024-01-08  2147  		spi5: spi@161b0000 {
3a88be54312101 Xavier Chang   2024-01-08  2148  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  2149  			reg = <0 0x161b0000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  2150  			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2151  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  2152  				<&cksys_clk CLK_CK_SPI5_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2153  				<&pericfg_ao_clk CLK_PERAO_SPI5_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  2154  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  2155  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2156  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2157  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2158  
3a88be54312101 Xavier Chang   2024-01-08  2159  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2160  		};
3a88be54312101 Xavier Chang   2024-01-08  2161  
3a88be54312101 Xavier Chang   2024-01-08  2162  		spi6: spi@161d0000 {
3a88be54312101 Xavier Chang   2024-01-08  2163  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  2164  			reg = <0 0x161d0000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  2165  			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2166  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  2167  				<&cksys_clk CLK_CK_SPI6_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2168  				<&pericfg_ao_clk CLK_PERAO_SPI6_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  2169  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  2170  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2171  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2172  			mediatek,pad-select = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2173  
3a88be54312101 Xavier Chang   2024-01-08  2174  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2175  		};
3a88be54312101 Xavier Chang   2024-01-08  2176  
3a88be54312101 Xavier Chang   2024-01-08  2177  		spi7: spi@161f0000 {
3a88be54312101 Xavier Chang   2024-01-08  2178  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  2179  			reg = <0 0x161f0000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  2180  			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2181  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  2182  				<&cksys_clk CLK_CK_SPI7_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2183  				<&pericfg_ao_clk CLK_PERAO_SPI7_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  2184  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  2185  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2186  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2187  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2188  
3a88be54312101 Xavier Chang   2024-01-08  2189  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2190  		};
3a88be54312101 Xavier Chang   2024-01-08  2191  
3a88be54312101 Xavier Chang   2024-01-08  2192  		i2c11: i2c@16200000 {
3a88be54312101 Xavier Chang   2024-01-08  2193  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  2194  			reg = <0 0x16200000 0 0x40000>,
3a88be54312101 Xavier Chang   2024-01-08  2195  			      <0 0x164c0000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  2196  			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2197  			clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C11_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  2198  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  2199  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  2200  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2201  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2202  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2203  
3a88be54312101 Xavier Chang   2024-01-08  2204  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2205  		};
3a88be54312101 Xavier Chang   2024-01-08  2206  
3a88be54312101 Xavier Chang   2024-01-08  2207  		i2c12: i2c@16240000 {
3a88be54312101 Xavier Chang   2024-01-08  2208  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  2209  			reg = <0 0x16240000 0 0x40000>,
3a88be54312101 Xavier Chang   2024-01-08  2210  			      <0 0x164d0000 0 0x20000>;
3a88be54312101 Xavier Chang   2024-01-08  2211  			interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2212  			clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C12_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  2213  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  2214  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  2215  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2216  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2217  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2218  
3a88be54312101 Xavier Chang   2024-01-08  2219  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2220  		};
3a88be54312101 Xavier Chang   2024-01-08  2221  
3a88be54312101 Xavier Chang   2024-01-08  2222  		i2c13: i2c@16280000 {
3a88be54312101 Xavier Chang   2024-01-08  2223  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  2224  			reg = <0 0x16280000 0 0x40000>,
3a88be54312101 Xavier Chang   2024-01-08  2225  			      <0 0x164f0000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  2226  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2227  			clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C13_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  2228  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  2229  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  2230  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2231  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2232  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2233  
3a88be54312101 Xavier Chang   2024-01-08  2234  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2235  		};
3a88be54312101 Xavier Chang   2024-01-08  2236  
3a88be54312101 Xavier Chang   2024-01-08  2237  		i2c14: i2c@162c0000 {
3a88be54312101 Xavier Chang   2024-01-08  2238  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  2239  			reg = <0 0x162c0000 0 0x40000>,
3a88be54312101 Xavier Chang   2024-01-08  2240  			      <0 0x16500000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  2241  			interrupts = <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2242  			clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C14_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  2243  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  2244  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  2245  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2246  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2247  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  2248  
3a88be54312101 Xavier Chang   2024-01-08  2249  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2250  		};
3a88be54312101 Xavier Chang   2024-01-08  2251  
3a88be54312101 Xavier Chang   2024-01-08  2252  		imp_iic_wrap_c_clk: syscon@16300000 {
3a88be54312101 Xavier Chang   2024-01-08  2253  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2254  			compatible = "mediatek,mt8196-imp-iic-wrap-c", "mediatek,mt8196-imp_iic_wrap_c", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2255  			reg = <0 0x16300000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2256  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2257  		};
3a88be54312101 Xavier Chang   2024-01-08  2258  
3a88be54312101 Xavier Chang   2024-01-08  2259  		mmc1: mmc@16310000 {
3a88be54312101 Xavier Chang   2024-01-08  2260  			compatible = "mediatek,mt8196-mmc";
3a88be54312101 Xavier Chang   2024-01-08  2261  			reg = <0 0x16310000 0 0x1000>,
3a88be54312101 Xavier Chang   2024-01-08  2262  			      <0 0x12a10000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2263  			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2264  			clocks = <&cksys_clk CLK_CK_MSDC30_1_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2265  					<&pericfg_ao_clk CLK_PERAO_MSDC1_AXI_MSDC1>,
3a88be54312101 Xavier Chang   2024-01-08  2266  					<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_MSDC1>,
3a88be54312101 Xavier Chang   2024-01-08  2267  					<&pericfg_ao_clk CLK_PERAO_MSDC1_MSDC_SRC_MSDC1>,
3a88be54312101 Xavier Chang   2024-01-08  2268  					<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_WRAP_MSDC1>;
3a88be54312101 Xavier Chang   2024-01-08  2269  			clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
3a88be54312101 Xavier Chang   2024-01-08  2270  
3a88be54312101 Xavier Chang   2024-01-08  2271  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2272  		};
3a88be54312101 Xavier Chang   2024-01-08  2273  
3a88be54312101 Xavier Chang   2024-01-08  2274  		mmc2: mmc@16320000 {
3a88be54312101 Xavier Chang   2024-01-08  2275  			compatible = "mediatek,mt8196-mmc";
3a88be54312101 Xavier Chang   2024-01-08  2276  			reg = <0 0x16320000 0 0x1000>,
3a88be54312101 Xavier Chang   2024-01-08  2277  			      <0 0x138a0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2278  			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  2279  			clocks = <&cksys_clk CLK_CK_MSDC30_2_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  2280  					<&pericfg_ao_clk CLK_PERAO_MSDC2_AXI_MSDC2>,
3a88be54312101 Xavier Chang   2024-01-08  2281  					<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_MSDC2>,
3a88be54312101 Xavier Chang   2024-01-08  2282  					<&pericfg_ao_clk CLK_PERAO_MSDC2_MSDC_SRC_MSDC2>,
3a88be54312101 Xavier Chang   2024-01-08  2283  					<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_WRAP_MSDC2>;
3a88be54312101 Xavier Chang   2024-01-08  2284  			clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
3a88be54312101 Xavier Chang   2024-01-08  2285  
3a88be54312101 Xavier Chang   2024-01-08  2286  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  2287  		};
3a88be54312101 Xavier Chang   2024-01-08  2288  
b30358af110519 Noah Shen      2024-03-01  2289  		pwm: pwm@16330000 {
b30358af110519 Noah Shen      2024-03-01  2290  			compatible = "mediatek,pwm";
b30358af110519 Noah Shen      2024-03-01  2291  			reg = <0 0x16330000 0 0x1000>;
b30358af110519 Noah Shen      2024-03-01  2292  			interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
b30358af110519 Noah Shen      2024-03-01  2293  
b30358af110519 Noah Shen      2024-03-01  2294  			status = "disabled";
b30358af110519 Noah Shen      2024-03-01  2295  		};
b30358af110519 Noah Shen      2024-03-01  2296  
b30358af110519 Noah Shen      2024-03-01  2297  		nor_flash: spi@16340000 {
b30358af110519 Noah Shen      2024-03-01  2298  			compatible = "mediatek,mt8196-nor",
b30358af110519 Noah Shen      2024-03-01  2299  				     "mediatek,mt8186-nor";
b30358af110519 Noah Shen      2024-03-01  2300  			reg = <0 0x16340000 0 0x1000>;
b30358af110519 Noah Shen      2024-03-01  2301  			clocks = <&cksys_clk CLK_CK_SFLASH_SEL>,
b30358af110519 Noah Shen      2024-03-01  2302  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_FLASH_FLASHIF>,
b30358af110519 Noah Shen      2024-03-01  2303  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_DRAM_FLASHIF>,
b30358af110519 Noah Shen      2024-03-01  2304  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_AXI_FLASHIF>,
b30358af110519 Noah Shen      2024-03-01  2305  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_BCLK_FLASHIF>,
b30358af110519 Noah Shen      2024-03-01  2306  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_27M_FLASHIF>;
b30358af110519 Noah Shen      2024-03-01  2307  			clock-names = "spi", "sf", "axi", "axi_s", "bclk", "27m";
b30358af110519 Noah Shen      2024-03-01  2308  			assigned-clocks = <&cksys_clk CLK_CK_SFLASH_SEL>;
b30358af110519 Noah Shen      2024-03-01  2309  			assigned-clock-parents = <&cksys_clk CLK_CK_UNIVPLL_D6_D8>;
b30358af110519 Noah Shen      2024-03-01  2310  			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
b30358af110519 Noah Shen      2024-03-01  2311  			#address-cells = <1>;
b30358af110519 Noah Shen      2024-03-01  2312  			#size-cells = <0>;
b30358af110519 Noah Shen      2024-03-01  2313  			status = "disabled";
b30358af110519 Noah Shen      2024-03-01  2314  		};
b30358af110519 Noah Shen      2024-03-01  2315  
3a88be54312101 Xavier Chang   2024-01-08  2316  		pericfg_ao_clk: syscon@16640000 {
3a88be54312101 Xavier Chang   2024-01-08  2317  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2318  			compatible = "mediatek,mt8196-pericfg-ao", "mediatek,mt8196-pericfg_ao", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2319  			reg = <0 0x16640000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2320  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  2321  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2322  		};
3a88be54312101 Xavier Chang   2024-01-08  2323  
b9408b7224ce87 Runyang Chen   2024-03-26  2324  		devapc_peri: devapc@16670000 {
b9408b7224ce87 Runyang Chen   2024-03-26  2325  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  2326  			reg = <0 0x16670000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  2327  			vio-idx-num = <204>;
b9408b7224ce87 Runyang Chen   2024-03-26  2328  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  2329  		};
b9408b7224ce87 Runyang Chen   2024-03-26  2330  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2331  		xhci0: usb@16700000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2332  			compatible = "mediatek,mtk-xhci";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2333  			reg = <0 0x16700000 0 0x1000>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2334  			      <0 0x16703e00 0 0x0100>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2335  			reg-names = "mac", "ippc";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2336  			interrupts-extended = <&gic GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2337  					      <&pio 273 IRQ_TYPE_LEVEL_LOW>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2338  			interrupt-names = "host","wakeup";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2339  			phys = <&u2port0 PHY_TYPE_USB2>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2340  			       <&u3port0 PHY_TYPE_USB3>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2341  			#address-cells = <2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2342  			#size-cells = <2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2343  			clocks = <&vlp_cksys_clk CLK_VLP_CK_USB_TOP_SEL>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2344  				 <&vlp_cksys_clk CLK_VLP_CK_USB_XHCI_SEL>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2345  				 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2346  			clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2347  			power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P0>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2348  			mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 107>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2349  			wakeup-source;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2350  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2351  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2352  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2353  		xhci1: usb1@16710000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2354  			compatible = "mediatek,mtk-xhci";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2355  			reg = <0 0x16710000 0 0x1000>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2356  			      <0 0x16713e00 0 0x0100>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2357  			reg-names = "mac", "ippc";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2358  			interrupts-extended = <&gic GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH 0>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2359  					      <&pio 276 IRQ_TYPE_LEVEL_LOW>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2360  			interrupt-names = "host","wakeup";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2361  			phys = <&u2port1 PHY_TYPE_USB2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2362  			clocks = <&cksys_clk CLK_CK_USB_TOP_1P_SEL>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2363  				 <&cksys_clk CLK_CK_USB_XHCI_1P_SEL>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2364  				 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2365  			clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2366  			power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2367  			mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 108>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2368  			wakeup-source;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2369  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2370  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2371  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2372  		u2phy0: usb-phy0@16730000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2373  			compatible = "mediatek,xsphy";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2374  			ranges = <0x0 0x0 0x16730000 0x700>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2375  			#address-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2376  			#size-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2377  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2378  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2379  			u2port0: usb2-phy0@0 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2380  				reg = <0x0 0x400>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2381  				clocks = <&clk26m>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2382  				clock-names = "ref";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2383  				#phy-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2384  				mediatek,discth = <10>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2385  			};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2386  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2387  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2388  		u2phy1: usb-phy1@16740000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2389  			compatible = "mediatek,xsphy";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2390  			ranges = <0x0 0x0 0x16740000 0x700>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2391  			#address-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2392  			#size-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2393  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2394  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2395  			u2port1: usb2-phy1@0 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2396  				reg = <0x0 0x400>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2397  				clocks = <&clk26m>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2398  				clock-names = "ref";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2399  				#phy-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2400  				mediatek,discth = <10>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2401  			};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2402  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2403  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2404  		u3phy0: usb3-phy0@16773000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2405  			compatible = "mediatek,xsphy";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2406  			ranges;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2407  			reg = <0 0x16773000 0 0x200>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2408  			#address-cells = <2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2409  			#size-cells = <2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2410  			power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2411  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2412  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2413  			u3port0: usb3-phy0@16773400 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2414  				reg = <0 0x16773400 0 0x500>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2415  				clocks = <&clk26m>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2416  				clock-names = "ref";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2417  				#phy-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2418  			};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2419  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2420  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2421  		usbwkcfg_ao_clk: syscon@167a0000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2422  			compatible = "mediatek,mt8196-usbwkcfg-ao", "syscon";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2423  			reg = <0 0x167a0000 0 0x1000>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2424  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2425  
f957c1861979d1 Noah Shen      2024-03-04  2426  		ufshci: ufshci@16810000 {
f957c1861979d1 Noah Shen      2024-03-04  2427  			compatible = "mediatek,mt8183-ufshci";
f957c1861979d1 Noah Shen      2024-03-04  2428  			reg = <0 0x16810000 0 0x2a00>;
f957c1861979d1 Noah Shen      2024-03-04  2429  
f957c1861979d1 Noah Shen      2024-03-04  2430  			interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2431  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2432  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2433  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2434  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2435  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2436  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2437  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2438  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
f957c1861979d1 Noah Shen      2024-03-04  2439  			clocks =
f957c1861979d1 Noah Shen      2024-03-04  2440  					<&cksys_clk CLK_CK_SEL>,
f957c1861979d1 Noah Shen      2024-03-04  2441  					<&cksys_clk CLK_CK_MAINPLL_D4_D2>,
f957c1861979d1 Noah Shen      2024-03-04  2442  					<&cksys_clk CLK_CK_UNIVPLL_D5>,
f957c1861979d1 Noah Shen      2024-03-04  2443  					<&cksys_clk CLK_CK_AES_UFSFDE_SEL>,
f957c1861979d1 Noah Shen      2024-03-04  2444  					<&cksys_clk CLK_CK_UNIVPLL_D6>,
f957c1861979d1 Noah Shen      2024-03-04  2445  					<&cksys_clk CLK_CK_MAINPLL_D4>,
f957c1861979d1 Noah Shen      2024-03-04  2446  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_TX_SYM_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2447  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM0_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2448  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM1_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2449  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SYS_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2450  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SAP_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2451  					<&ufscfg_ao_clk CLK_UFSAO_PHY_SAP_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2452  					<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_UFS_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2453  					<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_AES_UFS>;
f957c1861979d1 Noah Shen      2024-03-04  2454  			clock-names =
f957c1861979d1 Noah Shen      2024-03-04  2455  					"ufs_sel",
f957c1861979d1 Noah Shen      2024-03-04  2456  					"ufs_sel_min_src",
f957c1861979d1 Noah Shen      2024-03-04  2457  					"ufs_sel_max_src",
f957c1861979d1 Noah Shen      2024-03-04  2458  					"crypt_mux",
f957c1861979d1 Noah Shen      2024-03-04  2459  					"crypt_lp",
f957c1861979d1 Noah Shen      2024-03-04  2460  					"crypt_perf",
f957c1861979d1 Noah Shen      2024-03-04  2461  					"unipro_tx_sym",
f957c1861979d1 Noah Shen      2024-03-04  2462  					"unipro_rx_sym0",
f957c1861979d1 Noah Shen      2024-03-04  2463  					"unipro_rx_sym1",
f957c1861979d1 Noah Shen      2024-03-04  2464  					"unipro_sys",
f957c1861979d1 Noah Shen      2024-03-04  2465  					"unipro_sap",
f957c1861979d1 Noah Shen      2024-03-04  2466  					"ufs_phy_sap",
f957c1861979d1 Noah Shen      2024-03-04  2467  					"ufshci_ufs",
f957c1861979d1 Noah Shen      2024-03-04  2468  					"ufshci_aes";
f957c1861979d1 Noah Shen      2024-03-04  2469  			freq-table-hz =
f957c1861979d1 Noah Shen      2024-03-04  2470  					<273000000 499200000>,
f957c1861979d1 Noah Shen      2024-03-04  2471  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2472  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2473  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2474  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2475  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2476  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2477  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2478  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2479  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2480  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2481  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2482  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2483  					<0 0>;
f957c1861979d1 Noah Shen      2024-03-04  2484  			/* for clock scaling bind vcore */
8f38c8537cd3b4 Noah Shen      2025-02-13  2485  			dvfsrc-vcore-supply = <&dvfsrc_vcore>;
f957c1861979d1 Noah Shen      2024-03-04  2486  			/* 0.65V for clock scale up */
f957c1861979d1 Noah Shen      2024-03-04  2487  			boost-crypt-vcore-min = <650000>;
f957c1861979d1 Noah Shen      2024-03-04  2488  			vcc-supply = <&mt6363_vemc>;
f957c1861979d1 Noah Shen      2024-03-04  2489  			vccq-supply = <&mt6363_vufs12>;
f957c1861979d1 Noah Shen      2024-03-04  2490  			resets =	<&ufscfgao_rst 1>,
f957c1861979d1 Noah Shen      2024-03-04  2491  					<&ufscfgao_rst 2>,
f957c1861979d1 Noah Shen      2024-03-04  2492  					<&ufscfgao_rst 3>;
f957c1861979d1 Noah Shen      2024-03-04  2493  			reset-names =	"unipro_rst",
f957c1861979d1 Noah Shen      2024-03-04  2494  					"crypto_rst",
f957c1861979d1 Noah Shen      2024-03-04  2495  					"hci_rst";
f957c1861979d1 Noah Shen      2024-03-04  2496  
f957c1861979d1 Noah Shen      2024-03-04  2497  			/*
f957c1861979d1 Noah Shen      2024-03-04  2498  			 * Control mtcmos with rtff flow by ufs driver,
f957c1861979d1 Noah Shen      2024-03-04  2499  			 * Instead of scpsys by PM flow.
f957c1861979d1 Noah Shen      2024-03-04  2500  			 */
f957c1861979d1 Noah Shen      2024-03-04  2501  			mediatek,ufs-rtff-mtcmos;
f957c1861979d1 Noah Shen      2024-03-04  2502  			mediatek,ufs-boost-crypt;
f957c1861979d1 Noah Shen      2024-03-04  2503  			mediatek,ufs-pmc-via-fastauto;
f95d5459853b2b Noah Shen      2025-03-05  2504  			mediatek,ufs-broken-vcc;
f957c1861979d1 Noah Shen      2024-03-04  2505  		};
f957c1861979d1 Noah Shen      2024-03-04  2506  
3a88be54312101 Xavier Chang   2024-01-08  2507  		ufscfg_ao_sec_clk: syscon@16890000 {
3a88be54312101 Xavier Chang   2024-01-08  2508  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2509  			compatible = "mediatek,mt8196-ufscfg-ao-sec", "mediatek,mt8196-ufscfg_ao_sec", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2510  			reg = <0 0x16890000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2511  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2512  		};
3a88be54312101 Xavier Chang   2024-01-08  2513  
3a88be54312101 Xavier Chang   2024-01-08  2514  		ufscfg_ao_clk: syscon@168a0000 {
3a88be54312101 Xavier Chang   2024-01-08  2515  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2516  			compatible = "mediatek,mt8196-ufscfg-ao", "mediatek,mt8196-ufscfg_ao", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2517  			reg = <0 0x168a0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2518  			#clock-cells = <1>;
f957c1861979d1 Noah Shen      2024-03-04  2519  
f957c1861979d1 Noah Shen      2024-03-04  2520  			ufscfgao_rst: reset-controller {
f957c1861979d1 Noah Shen      2024-03-04  2521  				compatible = "ti,syscon-reset";
f957c1861979d1 Noah Shen      2024-03-04  2522  				#reset-cells = <1>;
f957c1861979d1 Noah Shen      2024-03-04  2523  
f957c1861979d1 Noah Shen      2024-03-04  2524  				ti,reset-bits = <
f957c1861979d1 Noah Shen      2024-03-04  2525  					/* ufs mphy/ufschi/crypto/unipro reset */
f957c1861979d1 Noah Shen      2024-03-04  2526  					/* 0: mphy */
f957c1861979d1 Noah Shen      2024-03-04  2527  					0x48   8 0x4c   8 0 0
f957c1861979d1 Noah Shen      2024-03-04  2528  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
f957c1861979d1 Noah Shen      2024-03-04  2529  					/* 1: unipro */
f957c1861979d1 Noah Shen      2024-03-04  2530  					0x148  0 0x14c  0 0 0
f957c1861979d1 Noah Shen      2024-03-04  2531  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
f957c1861979d1 Noah Shen      2024-03-04  2532  					/* 2: ufs-crypto */
f957c1861979d1 Noah Shen      2024-03-04  2533  					0x148  1 0x14c  1 0 0
f957c1861979d1 Noah Shen      2024-03-04  2534  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
f957c1861979d1 Noah Shen      2024-03-04  2535  					/* 3: ufshci */
f957c1861979d1 Noah Shen      2024-03-04  2536  					0x148  2 0x14c  2 0 0
f957c1861979d1 Noah Shen      2024-03-04  2537  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
f957c1861979d1 Noah Shen      2024-03-04  2538  					>;
f957c1861979d1 Noah Shen      2024-03-04  2539  			};
3a88be54312101 Xavier Chang   2024-01-08  2540  		};
3a88be54312101 Xavier Chang   2024-01-08  2541  
40e0ded60c61ea Jianjun Wang   2024-03-07  2542  		pciephy0: phy@16900000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2543  			compatible = "mediatek,mt8196-pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2544  			reg = <0 0x16900000 0 0x10000>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2545  			      <0 0x16920000 0 0x10000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2546  			reg-names = "sif", "ckm";
40e0ded60c61ea Jianjun Wang   2024-03-07  2547  
40e0ded60c61ea Jianjun Wang   2024-03-07  2548  			clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2549  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2550  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2551  
40e0ded60c61ea Jianjun Wang   2024-03-07  2552  			num-lanes = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2553  			#phy-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2554  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2555  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2556  
40e0ded60c61ea Jianjun Wang   2024-03-07  2557  		pcie0: pcie@16910000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2558  			compatible = "mediatek,mt8196-pcie";
40e0ded60c61ea Jianjun Wang   2024-03-07  2559  			device_type = "pci";
40e0ded60c61ea Jianjun Wang   2024-03-07  2560  			reg = <0 0x16910000 0 0x4000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2561  			reg-names = "pcie-mac";
40e0ded60c61ea Jianjun Wang   2024-03-07  2562  			#address-cells = <3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2563  			#size-cells = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2564  			interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2565  			bus-range = <0x00 0xff>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2566  			linux,pci-domain = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2567  			pextpcfg = <&pextp0cfg_ao_clk>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2568  			ranges = <0x82000000 0 0x50000000 0x0 0x50000000 0 0x8000000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2569  
40e0ded60c61ea Jianjun Wang   2024-03-07  2570  			clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2571  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_TL_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2572  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_REF_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2573  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2574  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2575  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2576  			clock-names = "pl_250m", "tl_26m", "peri_26m",
40e0ded60c61ea Jianjun Wang   2024-03-07  2577  				      "peri_mem", "bus", "low_power";
40e0ded60c61ea Jianjun Wang   2024-03-07  2578  			assigned-clocks = <&cksys_clk CLK_CK_TL_SEL>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2579  			assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2580  
40e0ded60c61ea Jianjun Wang   2024-03-07  2581  			resets = <&pextp0ao_rst 0>, <&pextp0ao_rst 1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2582  			reset-names = "mac", "phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2583  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2584  
40e0ded60c61ea Jianjun Wang   2024-03-07  2585  			phys = <&pciephy0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2586  			phy-names = "pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2587  
40e0ded60c61ea Jianjun Wang   2024-03-07  2588  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2589  
40e0ded60c61ea Jianjun Wang   2024-03-07  2590  			#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2591  			interrupt-map-mask = <0 0 0 7>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2592  			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2593  					<0 0 0 2 &pcie_intc0 1>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2594  					<0 0 0 3 &pcie_intc0 2>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2595  					<0 0 0 4 &pcie_intc0 3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2596  
40e0ded60c61ea Jianjun Wang   2024-03-07  2597  			pcie_intc0: interrupt-controller {
40e0ded60c61ea Jianjun Wang   2024-03-07  2598  				interrupt-controller;
40e0ded60c61ea Jianjun Wang   2024-03-07  2599  				#address-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2600  				#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2601  			};
40e0ded60c61ea Jianjun Wang   2024-03-07  2602  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2603  
40e0ded60c61ea Jianjun Wang   2024-03-07  2604  		pciephy1: phy@16930000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2605  			compatible = "mediatek,mt8196-pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2606  			reg = <0 0x16930000 0 0x10000>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2607  			      <0 0x16950000 0 0x10000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2608  			reg-names = "sif", "ckm";
40e0ded60c61ea Jianjun Wang   2024-03-07  2609  
40e0ded60c61ea Jianjun Wang   2024-03-07  2610  			clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2611  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2612  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2613  
40e0ded60c61ea Jianjun Wang   2024-03-07  2614  			num-lanes = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2615  			#phy-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2616  
40e0ded60c61ea Jianjun Wang   2024-03-07  2617  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2618  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2619  
40e0ded60c61ea Jianjun Wang   2024-03-07  2620  		pcie1: pcie@16940000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2621  			compatible = "mediatek,mt8196-pcie";
40e0ded60c61ea Jianjun Wang   2024-03-07  2622  			device_type = "pci";
40e0ded60c61ea Jianjun Wang   2024-03-07  2623  			reg = <0 0x16940000 0 0x4000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2624  			reg-names = "pcie-mac";
40e0ded60c61ea Jianjun Wang   2024-03-07  2625  			#address-cells = <3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2626  			#size-cells = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2627  			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2628  			bus-range = <0x00 0xff>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2629  			linux,pci-domain = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2630  			pextpcfg = <&pextp1cfg_ao_clk>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2631  			ranges = <0x82000000 0 0x58000000 0x0 0x58000000 0 0x18000000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2632  
40e0ded60c61ea Jianjun Wang   2024-03-07  2633  			clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2634  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2635  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2636  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2637  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2638  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2639  			clock-names = "pl_250m", "tl_26m", "peri_26m",
40e0ded60c61ea Jianjun Wang   2024-03-07  2640  				      "peri_mem", "bus", "low_power";
40e0ded60c61ea Jianjun Wang   2024-03-07  2641  			assigned-clocks = <&cksys_clk CLK_CK_TL_P1_SEL>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2642  			assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2643  
40e0ded60c61ea Jianjun Wang   2024-03-07  2644  			resets = <&pextp1ao_rst 0>, <&pextp1ao_rst 1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2645  			reset-names = "mac", "phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2646  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2647  
40e0ded60c61ea Jianjun Wang   2024-03-07  2648  			phys = <&pciephy1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2649  			phy-names = "pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2650  
40e0ded60c61ea Jianjun Wang   2024-03-07  2651  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2652  
40e0ded60c61ea Jianjun Wang   2024-03-07  2653  			#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2654  			interrupt-map-mask = <0 0 0 7>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2655  			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2656  					<0 0 0 2 &pcie_intc1 1>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2657  					<0 0 0 3 &pcie_intc1 2>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2658  					<0 0 0 4 &pcie_intc1 3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2659  
40e0ded60c61ea Jianjun Wang   2024-03-07  2660  			pcie_intc1: interrupt-controller {
40e0ded60c61ea Jianjun Wang   2024-03-07  2661  				interrupt-controller;
40e0ded60c61ea Jianjun Wang   2024-03-07  2662  				#address-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2663  				#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2664  			};
40e0ded60c61ea Jianjun Wang   2024-03-07  2665  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2666  
40e0ded60c61ea Jianjun Wang   2024-03-07  2667  		pciephy2: phy@16960000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2668  			compatible = "mediatek,mt8196-pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2669  			reg = <0 0x16960000 0 0x10000>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2670  			      <0 0x16980000 0 0x10000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2671  			reg-names = "sif", "ckm";
40e0ded60c61ea Jianjun Wang   2024-03-07  2672  
40e0ded60c61ea Jianjun Wang   2024-03-07  2673  			clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2674  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2675  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2676  
40e0ded60c61ea Jianjun Wang   2024-03-07  2677  			num-lanes = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2678  			#phy-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2679  
40e0ded60c61ea Jianjun Wang   2024-03-07  2680  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2681  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2682  
40e0ded60c61ea Jianjun Wang   2024-03-07  2683  		pcie2: pcie@16970000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2684  			device_type = "pci";
40e0ded60c61ea Jianjun Wang   2024-03-07  2685  			compatible = "mediatek,mt8196-pcie";
40e0ded60c61ea Jianjun Wang   2024-03-07  2686  			reg = <0 0x16970000 0 0x4000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2687  			reg-names = "pcie-mac";
40e0ded60c61ea Jianjun Wang   2024-03-07  2688  			#address-cells = <3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2689  			#size-cells = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2690  			interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2691  			bus-range = <0x00 0xff>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2692  			linux,pci-domain = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2693  			pextpcfg = <&pextp1cfg_ao_clk>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2694  			ranges = <0x82000000 0 0x70000000 0x0 0x70000000 0 0x8000000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2695  
40e0ded60c61ea Jianjun Wang   2024-03-07  2696  			clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2697  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2698  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2699  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2700  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2701  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2702  			clock-names = "pl_250m", "tl_26m", "peri_26m",
40e0ded60c61ea Jianjun Wang   2024-03-07  2703  				      "peri_mem", "bus", "low_power";
40e0ded60c61ea Jianjun Wang   2024-03-07  2704  			assigned-clocks = <&cksys_clk CLK_CK_TL_P2_SEL>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2705  			assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2706  
40e0ded60c61ea Jianjun Wang   2024-03-07  2707  			resets = <&pextp1ao_rst 2>, <&pextp1ao_rst 3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2708  			reset-names = "mac", "phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2709  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2710  
40e0ded60c61ea Jianjun Wang   2024-03-07  2711  			phys = <&pciephy2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2712  			phy-names = "pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2713  
40e0ded60c61ea Jianjun Wang   2024-03-07  2714  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2715  
40e0ded60c61ea Jianjun Wang   2024-03-07  2716  			#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2717  			interrupt-map-mask = <0 0 0 7>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2718  			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2719  					<0 0 0 2 &pcie_intc2 1>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2720  					<0 0 0 3 &pcie_intc2 2>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2721  					<0 0 0 4 &pcie_intc2 3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2722  
40e0ded60c61ea Jianjun Wang   2024-03-07  2723  			pcie_intc2: interrupt-controller {
40e0ded60c61ea Jianjun Wang   2024-03-07  2724  				interrupt-controller;
40e0ded60c61ea Jianjun Wang   2024-03-07  2725  				#address-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2726  				#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2727  			};
40e0ded60c61ea Jianjun Wang   2024-03-07  2728  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2729  
3a88be54312101 Xavier Chang   2024-01-08  2730  		pextp0cfg_ao_clk: syscon@169b0000 {
3a88be54312101 Xavier Chang   2024-01-08  2731  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2732  			compatible = "mediatek,mt8196-pextp0cfg-ao", "mediatek,mt8196-pextp0cfg_ao", "syscon", "simple-mfd";
3a88be54312101 Xavier Chang   2024-01-08  2733  			reg = <0 0x169b0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2734  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2735  
3a88be54312101 Xavier Chang   2024-01-08  2736  			pextp0ao_rst: reset-controller {
3a88be54312101 Xavier Chang   2024-01-08  2737  				compatible = "ti,syscon-reset";
3a88be54312101 Xavier Chang   2024-01-08  2738  				#reset-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2739  
3a88be54312101 Xavier Chang   2024-01-08  2740  				ti,reset-bits = <
3a88be54312101 Xavier Chang   2024-01-08  2741  					/* 0: PCIe0 MAC reset */
3a88be54312101 Xavier Chang   2024-01-08  2742  					0x8  0 0xc  0 0 0
3a88be54312101 Xavier Chang   2024-01-08  2743  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2744  					/* 1: PCIe0 PHY reset */
3a88be54312101 Xavier Chang   2024-01-08  2745  					0x8  1 0xc  1 0 0
3a88be54312101 Xavier Chang   2024-01-08  2746  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2747  					>;
3a88be54312101 Xavier Chang   2024-01-08  2748  			};
3a88be54312101 Xavier Chang   2024-01-08  2749  		};
3a88be54312101 Xavier Chang   2024-01-08  2750  
3a88be54312101 Xavier Chang   2024-01-08  2751  		pextp1cfg_ao_clk: syscon@169e0000 {
3a88be54312101 Xavier Chang   2024-01-08  2752  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2753  			compatible = "mediatek,mt8196-pextp1cfg-ao", "mediatek,mt8196-pextp1cfg_ao", "syscon", "simple-mfd";
3a88be54312101 Xavier Chang   2024-01-08  2754  			reg = <0 0x169e0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2755  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2756  
3a88be54312101 Xavier Chang   2024-01-08  2757  			pextp1ao_rst: reset-controller {
3a88be54312101 Xavier Chang   2024-01-08  2758  				compatible = "ti,syscon-reset";
3a88be54312101 Xavier Chang   2024-01-08  2759  				#reset-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2760  
3a88be54312101 Xavier Chang   2024-01-08  2761  				ti,reset-bits = <
3a88be54312101 Xavier Chang   2024-01-08  2762  					/* 0: PCIe1 MAC reset */
3a88be54312101 Xavier Chang   2024-01-08  2763  					0x8  0 0xc  0 0 0
3a88be54312101 Xavier Chang   2024-01-08  2764  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2765  					/* 1: PCIe1 PHY reset */
3a88be54312101 Xavier Chang   2024-01-08  2766  					0x8  1 0xc  1 0 0
3a88be54312101 Xavier Chang   2024-01-08  2767  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2768  					/* 2: PCIe2 MAC reset */
3a88be54312101 Xavier Chang   2024-01-08  2769  					0x8  8 0xc  8 0 0
3a88be54312101 Xavier Chang   2024-01-08  2770  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2771  					/* 3: PCIe2 PHY reset */
3a88be54312101 Xavier Chang   2024-01-08  2772  					0x8  9 0xc  9 0 0
3a88be54312101 Xavier Chang   2024-01-08  2773  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2774  					>;
3a88be54312101 Xavier Chang   2024-01-08  2775  			};
3a88be54312101 Xavier Chang   2024-01-08  2776  		};
3a88be54312101 Xavier Chang   2024-01-08  2777  
3a88be54312101 Xavier Chang   2024-01-08  2778  		ssr_top_clk: syscon@18000000 {
3a88be54312101 Xavier Chang   2024-01-08  2779  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2780  			compatible = "mediatek,mt8196-ssr-top", "mediatek,mt8196-ssr_top", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2781  			reg = <0 0x18000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2782  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  2783  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2784  		};
3a88be54312101 Xavier Chang   2024-01-08  2785  
b9408b7224ce87 Runyang Chen   2024-03-26  2786  		devapc_apinfra_ssr: devapc@180f3000 {
b9408b7224ce87 Runyang Chen   2024-03-26  2787  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  2788  			reg = <0 0x180f3000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  2789  			vio-idx-num = <39>;
b9408b7224ce87 Runyang Chen   2024-03-26  2790  			interrupts = <GIC_SPI 866 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  2791  		};
b9408b7224ce87 Runyang Chen   2024-03-26  2792  
eedd3dc85418be Karl Li        2024-09-27  2793  		apusys_rv: remoteproc@19001000 {
eedd3dc85418be Karl Li        2024-09-27  2794  			compatible = "mediatek,mt8196-apusys_rv";
eedd3dc85418be Karl Li        2024-09-27  2795  			reg = <0 0x19001000 0 0x1000>;
eedd3dc85418be Karl Li        2024-09-27  2796  			memory-region = <&apu_reserve_memory>, <&apu_smmu_reserve_memory0>;
eedd3dc85418be Karl Li        2024-09-27  2797  			iommus = <&apu_smmu 9>;
eedd3dc85418be Karl Li        2024-09-27  2798  			interrupts = <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH 0>;
eedd3dc85418be Karl Li        2024-09-27  2799  			interrupt-names = "apu_wdt";
eedd3dc85418be Karl Li        2024-09-27  2800  			mboxes = <&apu_mailbox 0>;
eedd3dc85418be Karl Li        2024-09-27  2801  			mediatek,mbox-spare-reg = <&apu_mailbox>;
eedd3dc85418be Karl Li        2024-09-27  2802  			mediatek,hw-logger = <&apusys_hw_logger>;
eedd3dc85418be Karl Li        2024-09-27  2803  			mediatek,apu-power = <&apu_top_3>;
eedd3dc85418be Karl Li        2024-09-27  2804  
eedd3dc85418be Karl Li        2024-09-27  2805  			apu-ctrl {
eedd3dc85418be Karl Li        2024-09-27  2806  				compatible = "mediatek,apu-ctrl-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2807  				mediatek,rpmsg-name = "apu-ctrl-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2808  			};
eedd3dc85418be Karl Li        2024-09-27  2809  
eedd3dc85418be Karl Li        2024-09-27  2810  			apu_top_rpmsg: apu-top-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2811  				compatible = "mediatek,aputop-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2812  				mediatek,rpmsg-name = "mtk_apu_pwr_ipi_tx";
eedd3dc85418be Karl Li        2024-09-27  2813  				operating-points-v2 = <&apu_opp_table>;
eedd3dc85418be Karl Li        2024-09-27  2814  				#cooling-cells = <2>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2815  				dynamic-power-coefficient = <2932>;
eedd3dc85418be Karl Li        2024-09-27  2816  			};
eedd3dc85418be Karl Li        2024-09-27  2817  
eedd3dc85418be Karl Li        2024-09-27  2818  			apu-mdw-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2819  				compatible = "mediatek,apu-mdw-rpmsg-v5";
eedd3dc85418be Karl Li        2024-09-27  2820  				mediatek,rpmsg-name = "apu-mdw-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2821  				version = <5>;
eedd3dc85418be Karl Li        2024-09-27  2822  			};
eedd3dc85418be Karl Li        2024-09-27  2823  
eedd3dc85418be Karl Li        2024-09-27  2824  			apu-apummu {
eedd3dc85418be Karl Li        2024-09-27  2825  				compatible = "mediatek,apu-apummu-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2826  				mediatek,rpmsg-name = "apu-apummu-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2827  			};
eedd3dc85418be Karl Li        2024-09-27  2828  
eedd3dc85418be Karl Li        2024-09-27  2829  			apu-apummu-rx {
eedd3dc85418be Karl Li        2024-09-27  2830  				compatible = "mediatek,apu-apummu-rx";
eedd3dc85418be Karl Li        2024-09-27  2831  				mediatek,rpmsg-name = "apu-apummu-rx";
eedd3dc85418be Karl Li        2024-09-27  2832  			};
eedd3dc85418be Karl Li        2024-09-27  2833  
eedd3dc85418be Karl Li        2024-09-27  2834  			apu-edma {
eedd3dc85418be Karl Li        2024-09-27  2835  				compatible = "mediatek,apu-edma-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2836  				mediatek,rpmsg-name = "apu-edma-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2837  			};
eedd3dc85418be Karl Li        2024-09-27  2838  
eedd3dc85418be Karl Li        2024-09-27  2839  			edma-rx {
eedd3dc85418be Karl Li        2024-09-27  2840  				compatible = "mediatek,edma-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2841  				mediatek,rpmsg-name = "edma-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2842  			};
eedd3dc85418be Karl Li        2024-09-27  2843  
eedd3dc85418be Karl Li        2024-09-27  2844  			apu-mnoc {
eedd3dc85418be Karl Li        2024-09-27  2845  				compatible = "mediatek,apu-mnoc-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2846  				mediatek,rpmsg-name = "apu-mnoc-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2847  			};
eedd3dc85418be Karl Li        2024-09-27  2848  
eedd3dc85418be Karl Li        2024-09-27  2849  			mdla-tx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2850  				compatible = "mediatek,mdla-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2851  				mediatek,rpmsg-name = "mdla-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2852  			};
eedd3dc85418be Karl Li        2024-09-27  2853  
eedd3dc85418be Karl Li        2024-09-27  2854  			mdla-rx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2855  				compatible = "mediatek,mdla-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2856  				mediatek,rpmsg-name = "mdla-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2857  			};
eedd3dc85418be Karl Li        2024-09-27  2858  
eedd3dc85418be Karl Li        2024-09-27  2859  			mvpu-tx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2860  				compatible = "mediatek,mvpu-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2861  				mediatek,rpmsg-name = "mvpu-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2862  			};
eedd3dc85418be Karl Li        2024-09-27  2863  
eedd3dc85418be Karl Li        2024-09-27  2864  			mvpu-rx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2865  				compatible = "mediatek,mvpu-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2866  				mediatek,rpmsg-name = "mvpu-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2867  			};
eedd3dc85418be Karl Li        2024-09-27  2868  
eedd3dc85418be Karl Li        2024-09-27  2869  			aps-tx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2870  				compatible = "mediatek,aps-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2871  				mediatek,rpmsg-name = "aps-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2872  			};
eedd3dc85418be Karl Li        2024-09-27  2873  
eedd3dc85418be Karl Li        2024-09-27  2874  			aps-rx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2875  				compatible = "mediatek,aps-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2876  				mediatek,rpmsg-name = "aps-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2877  			};
eedd3dc85418be Karl Li        2024-09-27  2878  
eedd3dc85418be Karl Li        2024-09-27  2879  			sapu-lock-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2880  				compatible = "mediatek,apu-lock-rv-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2881  				mediatek,rpmsg-name = "apu-lock-rv-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2882  			};
eedd3dc85418be Karl Li        2024-09-27  2883  
eedd3dc85418be Karl Li        2024-09-27  2884  			apu-scp-mdw-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2885  				compatible = "mediatek,apu-scp-mdw-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2886  				mediatek,rpmsg-name = "apu-scp-mdw-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2887  			};
eedd3dc85418be Karl Li        2024-09-27  2888  
eedd3dc85418be Karl Li        2024-09-27  2889  			apu-scp-np-recover-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2890  				compatible = "mediatek,apu-scp-np-recover-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2891  				mediatek,rpmsg-name = "apu-scp-np-recover-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2892  			};
eedd3dc85418be Karl Li        2024-09-27  2893  
eedd3dc85418be Karl Li        2024-09-27  2894  			apu-ipi-ut-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2895  				compatible = "mediatek,apu-ipi-ut-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2896  				mediatek,rpmsg-name = "apu-ipi-ut-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2897  			};
eedd3dc85418be Karl Li        2024-09-27  2898  		};
eedd3dc85418be Karl Li        2024-09-27  2899  
eedd3dc85418be Karl Li        2024-09-27  2900  		apu_opp_table: opp-table-apu {
eedd3dc85418be Karl Li        2024-09-27  2901  			compatible = "operating-points-v2";
eedd3dc85418be Karl Li        2024-09-27  2902  
eedd3dc85418be Karl Li        2024-09-27  2903  			opp@1800000000 {
eedd3dc85418be Karl Li        2024-09-27  2904  				opp-hz = /bits/ 64 <1800000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2905  				opp-microvolt = <850000>;
eedd3dc85418be Karl Li        2024-09-27  2906  			};
eedd3dc85418be Karl Li        2024-09-27  2907  
eedd3dc85418be Karl Li        2024-09-27  2908  			opp@1600000000 {
eedd3dc85418be Karl Li        2024-09-27  2909  				opp-hz = /bits/ 64 <1600000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2910  				opp-microvolt = <850000>;
eedd3dc85418be Karl Li        2024-09-27  2911  			};
eedd3dc85418be Karl Li        2024-09-27  2912  
eedd3dc85418be Karl Li        2024-09-27  2913  			opp@1450000000 {
eedd3dc85418be Karl Li        2024-09-27  2914  				opp-hz = /bits/ 64 <1450000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2915  				opp-microvolt = <850000>;
eedd3dc85418be Karl Li        2024-09-27  2916  			};
eedd3dc85418be Karl Li        2024-09-27  2917  
eedd3dc85418be Karl Li        2024-09-27  2918  			opp@1300000000 {
eedd3dc85418be Karl Li        2024-09-27  2919  				opp-hz = /bits/ 64 <1300000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2920  				opp-microvolt = <750000>;
eedd3dc85418be Karl Li        2024-09-27  2921  			};
eedd3dc85418be Karl Li        2024-09-27  2922  
eedd3dc85418be Karl Li        2024-09-27  2923  			opp@1115000000 {
eedd3dc85418be Karl Li        2024-09-27  2924  				opp-hz = /bits/ 64 <1115000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2925  				opp-microvolt = <750000>;
eedd3dc85418be Karl Li        2024-09-27  2926  			};
eedd3dc85418be Karl Li        2024-09-27  2927  
eedd3dc85418be Karl Li        2024-09-27  2928  			opp@930000000 {
eedd3dc85418be Karl Li        2024-09-27  2929  				opp-hz = /bits/ 64 <930000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2930  				opp-microvolt = <650000>;
eedd3dc85418be Karl Li        2024-09-27  2931  			};
eedd3dc85418be Karl Li        2024-09-27  2932  
eedd3dc85418be Karl Li        2024-09-27  2933  			opp@730000000 {
eedd3dc85418be Karl Li        2024-09-27  2934  				opp-hz = /bits/ 64 <730000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2935  				opp-microvolt = <600000>;
eedd3dc85418be Karl Li        2024-09-27  2936  			};
eedd3dc85418be Karl Li        2024-09-27  2937  
eedd3dc85418be Karl Li        2024-09-27  2938  			opp@630000000 {
eedd3dc85418be Karl Li        2024-09-27  2939  				opp-hz = /bits/ 64 <630000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2940  				opp-microvolt = <575000>;
eedd3dc85418be Karl Li        2024-09-27  2941  			};
eedd3dc85418be Karl Li        2024-09-27  2942  
eedd3dc85418be Karl Li        2024-09-27  2943  			opp@530000000 {
eedd3dc85418be Karl Li        2024-09-27  2944  				opp-hz = /bits/ 64 <530000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2945  				opp-microvolt = <550000>;
eedd3dc85418be Karl Li        2024-09-27  2946  			};
eedd3dc85418be Karl Li        2024-09-27  2947  
eedd3dc85418be Karl Li        2024-09-27  2948  			opp@457500000 {
eedd3dc85418be Karl Li        2024-09-27  2949  				opp-hz = /bits/ 64 <457500000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2950  				opp-microvolt = <550000>;
eedd3dc85418be Karl Li        2024-09-27  2951  			};
eedd3dc85418be Karl Li        2024-09-27  2952  
eedd3dc85418be Karl Li        2024-09-27  2953  			opp@385000000 {
eedd3dc85418be Karl Li        2024-09-27  2954  				opp-hz = /bits/ 64 <385000000>;
923cf1d389e8d3 Yu-Che Cheng   2025-03-21  2955  				opp-microvolt = <550000>;
eedd3dc85418be Karl Li        2024-09-27  2956  			};
eedd3dc85418be Karl Li        2024-09-27  2957  		};
eedd3dc85418be Karl Li        2024-09-27  2958  
eedd3dc85418be Karl Li        2024-09-27  2959  		apu_top_3: power-controller@19020000 {
eedd3dc85418be Karl Li        2024-09-27  2960  			compatible = "mt8196,apu-top-3";
eedd3dc85418be Karl Li        2024-09-27  2961  			reg = <0 0x19020000 0 0x1000>,
eedd3dc85418be Karl Li        2024-09-27  2962  			      <0 0x190e0000 0 0x4000>,
eedd3dc85418be Karl Li        2024-09-27  2963  			      <0 0x190f0000 0 0x1000>;
eedd3dc85418be Karl Li        2024-09-27  2964  			reg-names = "RCX",
eedd3dc85418be Karl Li        2024-09-27  2965  				    "VCORE",
eedd3dc85418be Karl Li        2024-09-27  2966  				    "RPC";
eedd3dc85418be Karl Li        2024-09-27  2967  			mediatek,mbox-spare-reg = <&apu_mailbox>;
eedd3dc85418be Karl Li        2024-09-27  2968  			memory-region = <&apu_reserve_memory>;
eedd3dc85418be Karl Li        2024-09-27  2969  		};
eedd3dc85418be Karl Li        2024-09-27  2970  
eedd3dc85418be Karl Li        2024-09-27  2971  		apusys_hw_logger: logger@19024000 {
eedd3dc85418be Karl Li        2024-09-27  2972  			compatible = "mediatek,apusys-hw-logger";
eedd3dc85418be Karl Li        2024-09-27  2973  			reg = <0 0x19024000 0 0x1000>;
eedd3dc85418be Karl Li        2024-09-27  2974  			interrupts = <GIC_SPI 632 IRQ_TYPE_EDGE_RISING 0>;
eedd3dc85418be Karl Li        2024-09-27  2975  			iommus = <&apu_smmu 12>;
eedd3dc85418be Karl Li        2024-09-27  2976  			mediatek,mbox-spare-reg = <&apu_mailbox>;
eedd3dc85418be Karl Li        2024-09-27  2977  			mediatek,apu-power = <&apu_top_3>;
eedd3dc85418be Karl Li        2024-09-27  2978  		};
eedd3dc85418be Karl Li        2024-09-27  2979  
990c0028a0ae7e Hailong Fan    2024-08-05  2980  		adsp: adsp@1a000000 {
990c0028a0ae7e Hailong Fan    2024-08-05  2981  			compatible = "mediatek,mt8196-dsp";
990c0028a0ae7e Hailong Fan    2024-08-05  2982  			reg = <0 0x1a000000 0 0x5000>,
990c0028a0ae7e Hailong Fan    2024-08-05  2983  			      <0 0x1a210000 0 0x80000>,
990c0028a0ae7e Hailong Fan    2024-08-05  2984  			      <0 0x1a345000 0 0x300>,
990c0028a0ae7e Hailong Fan    2024-08-05  2985  			      <0 0x1a00f000 0 0x1000>;
990c0028a0ae7e Hailong Fan    2024-08-05  2986  			reg-names = "cfg", "sram", "sec", "bus";
990c0028a0ae7e Hailong Fan    2024-08-05  2987  			interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
990c0028a0ae7e Hailong Fan    2024-08-05  2988  			interrupt-names = "wdt";
990c0028a0ae7e Hailong Fan    2024-08-05  2989  			power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
990c0028a0ae7e Hailong Fan    2024-08-05  2990  			clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
990c0028a0ae7e Hailong Fan    2024-08-05  2991  				 <&cksys_clk CLK_CK_TCK_26M_MX9>,
990c0028a0ae7e Hailong Fan    2024-08-05  2992  				 <&cksys_clk CLK_CK_ADSPPLL>;
990c0028a0ae7e Hailong Fan    2024-08-05  2993  			clock-names = "clk_top_adsp_sel",
990c0028a0ae7e Hailong Fan    2024-08-05  2994  				      "clk_top_clk26m",
990c0028a0ae7e Hailong Fan    2024-08-05  2995  				      "clk_top_adsppll";
990c0028a0ae7e Hailong Fan    2024-08-05  2996  			mbox-names = "rx", "tx";
990c0028a0ae7e Hailong Fan    2024-08-05  2997  			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
990c0028a0ae7e Hailong Fan    2024-08-05  2998  			status = "disabled";
990c0028a0ae7e Hailong Fan    2024-08-05  2999  		};
990c0028a0ae7e Hailong Fan    2024-08-05  3000  
b9408b7224ce87 Runyang Chen   2024-03-26  3001  		devapc_adsp: devapc@1a019000 {
b9408b7224ce87 Runyang Chen   2024-03-26  3002  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  3003  			reg = <0 0x1a019000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  3004  			vio-idx-num = <54>;
b9408b7224ce87 Runyang Chen   2024-03-26  3005  			interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  3006  		};
b9408b7224ce87 Runyang Chen   2024-03-26  3007  
3a88be54312101 Xavier Chang   2024-01-08  3008  		afe_clk: syscon@1a110000 {
3a88be54312101 Xavier Chang   2024-01-08  3009  			compatible = "mediatek,mt8196-audiosys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3010  			reg = <0 0x1a110000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3011  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  3012  			power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
3a88be54312101 Xavier Chang   2024-01-08  3013  		};
3a88be54312101 Xavier Chang   2024-01-08  3014  
2f2aff80fd0e0d Darren Ye      2024-04-01  3015  		afe: mt8196-afe-pcm@1a110000 {
2f2aff80fd0e0d Darren Ye      2024-04-01  3016  			compatible = "mediatek,mt8196-sound";
2f2aff80fd0e0d Darren Ye      2024-04-01  3017  			reg = <0 0x1a110000 0 0x9000>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3018  			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3019  			cksys = <&cksys_clk>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3020  			vlpcksys = <&vlp_cksys_clk>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3021  			power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3022  			clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3023  				<&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3024  				<&afe_clk CLK_AFE_UL0_ADC_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3025  				<&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3026  				<&afe_clk CLK_AFE_UL1_ADC_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3027  				<&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3028  				<&afe_clk CLK_AFE_APLL1_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3029  				<&afe_clk CLK_AFE_APLL2_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3030  				<&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3031  				<&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3032  				<&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3033  				<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3034  				<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3035  				<&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3036  				<&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3037  				<&cksys_clk CLK_CK_MAINPLL_D4_D4>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3038  				<&cksys_clk CLK_CK_AUD_1_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3039  				<&cksys_clk CLK_CK_APLL1>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3040  				<&cksys_clk CLK_CK_AUD_2_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3041  				<&cksys_clk CLK_CK_APLL2>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3042  				<&cksys_clk CLK_CK_APLL1_D4>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3043  				<&cksys_clk CLK_CK_APLL2_D4>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3044  				<&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3045  				<&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3046  				<&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3047  				<&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3048  				<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3049  				<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3050  				<&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3051  				<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3052  				<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3053  				<&cksys_clk CLK_CK_ADSP_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  3054  				<&cksys_clk CLK_CK_TCK_26M_MX9>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3055  
2f2aff80fd0e0d Darren Ye      2024-04-01  3056  			clock-names = "aud_hopping_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3057  				"aud_f26m_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3058  				"aud_ul0_adc_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3059  				"aud_ul0_adc_hires_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3060  				"aud_ul1_adc_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3061  				"aud_ul1_adc_hires_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3062  				"aud_apll1_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3063  				"aud_apll2_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3064  				"aud_apll_tuner1_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3065  				"aud_apll_tuner2_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3066  				"vlp_mux_audio_int",
2f2aff80fd0e0d Darren Ye      2024-04-01  3067  				"vlp_mux_aud_eng1",
2f2aff80fd0e0d Darren Ye      2024-04-01  3068  				"vlp_mux_aud_eng2",
2f2aff80fd0e0d Darren Ye      2024-04-01  3069  				"vlp_mux_audio_h",
2f2aff80fd0e0d Darren Ye      2024-04-01  3070  				"vlp_clk26m_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  3071  				"ck_mainpll_d4_d4",
2f2aff80fd0e0d Darren Ye      2024-04-01  3072  				"ck_mux_aud_1",
2f2aff80fd0e0d Darren Ye      2024-04-01  3073  				"ck_apll1_ck",
2f2aff80fd0e0d Darren Ye      2024-04-01  3074  				"ck_mux_aud_2",
2f2aff80fd0e0d Darren Ye      2024-04-01  3075  				"ck_apll2_ck",
2f2aff80fd0e0d Darren Ye      2024-04-01  3076  				"ck_apll1_d4",
2f2aff80fd0e0d Darren Ye      2024-04-01  3077  				"ck_apll2_d4",
2f2aff80fd0e0d Darren Ye      2024-04-01  3078  				"ck_i2sin0_m_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  3079  				"ck_i2sin1_m_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  3080  				"ck_fmi2s_m_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  3081  				"ck_tdmout_m_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  3082  				"ck_apll12_div_i2sin0",
2f2aff80fd0e0d Darren Ye      2024-04-01  3083  				"ck_apll12_div_i2sin1",
2f2aff80fd0e0d Darren Ye      2024-04-01  3084  				"ck_apll12_div_fmi2s",
2f2aff80fd0e0d Darren Ye      2024-04-01  3085  				"ck_apll12_div_tdmout_m",
2f2aff80fd0e0d Darren Ye      2024-04-01  3086  				"ck_apll12_div_tdmout_b",
2f2aff80fd0e0d Darren Ye      2024-04-01  3087  				"ck_adsp_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  3088  				"ck_clk26m_clk";
2f2aff80fd0e0d Darren Ye      2024-04-01  3089  			pinctrl-names = "aud-clk-mosi-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3090  				"aud-clk-mosi-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3091  				"aud-dat-mosi-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3092  				"aud-dat-mosi-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3093  				"aud-dat-mosi-ch34-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3094  				"aud-dat-mosi-ch34-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3095  				"aud-dat-miso0-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3096  				"aud-dat-miso0-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3097  				"aud-dat-miso1-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3098  				"aud-dat-miso1-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3099  				"aud-gpio-i2sin0-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3100  				"aud-gpio-i2sin0-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3101  				"aud-gpio-i2sout0-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3102  				"aud-gpio-i2sout0-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3103  				"aud-gpio-i2sin1-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3104  				"aud-gpio-i2sin1-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3105  				"aud-gpio-i2sout1-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3106  				"aud-gpio-i2sout1-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3107  				"aud-gpio-i2sin4-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3108  				"aud-gpio-i2sin4-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3109  				"aud-gpio-i2sout4-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3110  				"aud-gpio-i2sout4-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3111  				"aud-gpio-i2sin6-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3112  				"aud-gpio-i2sin6-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3113  				"aud-gpio-i2sout6-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3114  				"aud-gpio-i2sout6-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3115  				"aud-dat-miso-only-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3116  				"aud-dat-miso-only-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3117  				"aud-gpio-ap-dmic-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3118  				"aud-gpio-ap-dmic-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3119  				"aud-gpio-ap-dmic1-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3120  				"aud-gpio-ap-dmic1-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3121  				"aud-gpio-i2sin3-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3122  				"aud-gpio-i2sin3-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  3123  				"aud-gpio-i2sout3-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  3124  				"aud-gpio-i2sout3-on";
2f2aff80fd0e0d Darren Ye      2024-04-01  3125  
2f2aff80fd0e0d Darren Ye      2024-04-01  3126  			pinctrl-0 = <&aud_clk_mosi_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3127  			pinctrl-1 = <&aud_clk_mosi_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3128  			pinctrl-2 = <&aud_dat_mosi_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3129  			pinctrl-3 = <&aud_dat_mosi_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3130  			pinctrl-4 = <&aud_dat_mosi_ch34_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3131  			pinctrl-5 = <&aud_dat_mosi_ch34_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3132  			pinctrl-6 = <&aud_dat_miso0_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3133  			pinctrl-7 = <&aud_dat_miso0_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3134  			pinctrl-8 = <&aud_dat_miso1_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3135  			pinctrl-9 = <&aud_dat_miso1_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3136  			pinctrl-10 = <&aud_gpio_i2sin0_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3137  			pinctrl-11 = <&aud_gpio_i2sin0_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3138  			pinctrl-12 = <&aud_gpio_i2sout0_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3139  			pinctrl-13 = <&aud_gpio_i2sout0_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3140  			pinctrl-14 = <&aud_gpio_i2sin1_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3141  			pinctrl-15 = <&aud_gpio_i2sin1_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3142  			pinctrl-16 = <&aud_gpio_i2sout1_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3143  			pinctrl-17 = <&aud_gpio_i2sout1_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3144  			pinctrl-18 = <&aud_gpio_i2sin4_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3145  			pinctrl-19 = <&aud_gpio_i2sin4_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3146  			pinctrl-20 = <&aud_gpio_i2sout4_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3147  			pinctrl-21 = <&aud_gpio_i2sout4_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3148  			pinctrl-22 = <&aud_gpio_i2sin6_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3149  			pinctrl-23 = <&aud_gpio_i2sin6_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3150  			pinctrl-24 = <&aud_gpio_i2sout6_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3151  			pinctrl-25 = <&aud_gpio_i2sout6_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3152  			pinctrl-26 = <&aud_dat_miso_only_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3153  			pinctrl-27 = <&aud_dat_miso_only_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3154  			pinctrl-28 = <&aud_gpio_ap_dmic_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3155  			pinctrl-29 = <&aud_gpio_ap_dmic_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3156  			pinctrl-30 = <&aud_gpio_ap_dmic1_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3157  			pinctrl-31 = <&aud_gpio_ap_dmic1_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3158  			pinctrl-32 = <&aud_gpio_i2sin3_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3159  			pinctrl-33 = <&aud_gpio_i2sin3_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3160  			pinctrl-34 = <&aud_gpio_i2sout3_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3161  			pinctrl-35 = <&aud_gpio_i2sout3_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3162  
2f2aff80fd0e0d Darren Ye      2024-04-01  3163  			/* Only for ETDM in/out 4 */
2f2aff80fd0e0d Darren Ye      2024-04-01  3164  			etdm-out-ch = <2>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3165  			etdm-in-ch = <2>;
2f2aff80fd0e0d Darren Ye      2024-04-01  3166  			etdm-out-sync = <0>; /* 0: disable; 1: enable */
2f2aff80fd0e0d Darren Ye      2024-04-01  3167  			etdm-in-sync = <1>; /* 0: disable; 1: enable */
2f2aff80fd0e0d Darren Ye      2024-04-01  3168  			etdm-ip-mode = <0>; /* 0: One IP multi-channel 1: Multi-IP 2-channel */
2f2aff80fd0e0d Darren Ye      2024-04-01  3169  			status = "disabled";
2f2aff80fd0e0d Darren Ye      2024-04-01  3170  		};
2f2aff80fd0e0d Darren Ye      2024-04-01  3171  
990c0028a0ae7e Hailong Fan    2024-08-05  3172  		adsp_mailbox0: mailbox@1a350000 {
990c0028a0ae7e Hailong Fan    2024-08-05  3173  			compatible = "mediatek,mt8196-adsp-mbox",
990c0028a0ae7e Hailong Fan    2024-08-05  3174  				     "mediatek,mt8186-adsp-mbox";
990c0028a0ae7e Hailong Fan    2024-08-05  3175  			reg = <0 0x1a350100 0 0x1000>;
990c0028a0ae7e Hailong Fan    2024-08-05  3176  			interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
990c0028a0ae7e Hailong Fan    2024-08-05  3177  			#mbox-cells = <0>;
990c0028a0ae7e Hailong Fan    2024-08-05  3178  		};
990c0028a0ae7e Hailong Fan    2024-08-05  3179  
990c0028a0ae7e Hailong Fan    2024-08-05  3180  		adsp_mailbox1: mailbox@1a360000 {
990c0028a0ae7e Hailong Fan    2024-08-05  3181  			compatible = "mediatek,mt8196-adsp-mbox",
990c0028a0ae7e Hailong Fan    2024-08-05  3182  				     "mediatek,mt8186-adsp-mbox";
990c0028a0ae7e Hailong Fan    2024-08-05  3183  			reg = <0 0x1a360100 0 0x1000>;
990c0028a0ae7e Hailong Fan    2024-08-05  3184  			interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
990c0028a0ae7e Hailong Fan    2024-08-05  3185  			#mbox-cells = <0>;
990c0028a0ae7e Hailong Fan    2024-08-05  3186  		};
990c0028a0ae7e Hailong Fan    2024-08-05  3187  
3a88be54312101 Xavier Chang   2024-01-08  3188  		scpsys: power-controller@1c004000 {
3a88be54312101 Xavier Chang   2024-01-08  3189  			compatible = "mediatek,mt8196-scpsys-hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3190  			reg = <0 0x1c004000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3191  			#power-domain-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  3192  			apifrbus-ao-io-reg-bus = <&ifr_bus>;
3a88be54312101 Xavier Chang   2024-01-08  3193  			spm = <&scpsys_bus>;
3a88be54312101 Xavier Chang   2024-01-08  3194  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  3195  		};
3a88be54312101 Xavier Chang   2024-01-08  3196  
3a88be54312101 Xavier Chang   2024-01-08  3197  		scpsys_bus: syscon@1c00d000 {
3a88be54312101 Xavier Chang   2024-01-08  3198  			compatible = "mediatek,mt8196-scpsys-bus", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3199  			reg = <0 0x1c00d000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3200  		};
3a88be54312101 Xavier Chang   2024-01-08  3201  
3a88be54312101 Xavier Chang   2024-01-08  3202  		watchdog: watchdog@1c010000 {
3a88be54312101 Xavier Chang   2024-01-08  3203  			compatible = "mediatek,mt8196-wdt",
3a88be54312101 Xavier Chang   2024-01-08  3204  					"mediatek,mt6589-wdt",
3a88be54312101 Xavier Chang   2024-01-08  3205  					"syscon", "simple-mfd";
3a88be54312101 Xavier Chang   2024-01-08  3206  			reg = <0 0x1c010000 0 0x1000>;
0879c1ab94ac47 Zexin Wang     2025-02-13  3207  			#reset-cells = <1>;
0879c1ab94ac47 Zexin Wang     2025-02-13  3208  			mediatek,disable-extrst;
3a88be54312101 Xavier Chang   2024-01-08  3209  		};
3a88be54312101 Xavier Chang   2024-01-08  3210  
a5a854b9d1f4b6 Aming Chan     2024-07-25  3211  		dvfsrc: dvfsrc@1c013000 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3212  			compatible = "mediatek,mt8196-dvfsrc";
a5a854b9d1f4b6 Aming Chan     2024-07-25  3213  			reg = <0 0x1c013000 0 0x1000>,
a5a854b9d1f4b6 Aming Chan     2024-07-25  3214  				<0 0x1c004000 0 0x1000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3215  			reg-names = "dvfsrc", "spm";
a5a854b9d1f4b6 Aming Chan     2024-07-25  3216  			#interconnect-cells = <1>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3217  
a5a854b9d1f4b6 Aming Chan     2024-07-25  3218  			dvfsrc_vcore: dvfsrc-vcore {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3219  				regulator-name = "dvfsrc-vcore";
a5a854b9d1f4b6 Aming Chan     2024-07-25  3220  				regulator-min-microvolt = <575000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3221  				regulator-max-microvolt = <875000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3222  				regulator-always-on;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3223  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3224  
a5a854b9d1f4b6 Aming Chan     2024-07-25  3225  			dvfsrc_freq_opp9: opp9 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3226  				opp-peak-KBps = <0>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3227  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3228  			dvfsrc_freq_opp8: opp8 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3229  				opp-peak-KBps = <9800000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3230  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3231  			dvfsrc_freq_opp7: opp7 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3232  				opp-peak-KBps = <13200000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3233  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3234  			dvfsrc_freq_opp6: opp6 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3235  				opp-peak-KBps = <19700000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3236  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3237  			dvfsrc_freq_opp5: opp5 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3238  				opp-peak-KBps = <24900000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3239  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3240  			dvfsrc_freq_opp4: opp4 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3241  				opp-peak-KBps = <32400000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3242  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3243  			dvfsrc_freq_opp3: opp3 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3244  				opp-peak-KBps = <37600000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3245  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3246  			dvfsrc_freq_opp2: opp2 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3247  				opp-peak-KBps = <44300000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3248  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3249  			dvfsrc_freq_opp1: opp1 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3250  				opp-peak-KBps = <54500000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3251  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3252  			dvfsrc_freq_opp0: opp0 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  3253  				opp-peak-KBps = <61400000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  3254  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3255  		};
a5a854b9d1f4b6 Aming Chan     2024-07-25  3256  
3a88be54312101 Xavier Chang   2024-01-08  3257  		vlp_cksys_clk: syscon@1c016000 {
3a88be54312101 Xavier Chang   2024-01-08  3258  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  3259  			compatible = "mediatek,mt8196-vlp-cksys", "mediatek,mt8196-vlp_cksys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3260  			reg = <0 0x1c016000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3261  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  3262  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  3263  		};
3a88be54312101 Xavier Chang   2024-01-08  3264  
20943b200aa83b Xavier Chang   2024-07-02  3265  		spmi: spmi@1c01a000 {
20943b200aa83b Xavier Chang   2024-07-02  3266  			compatible = "mediatek,mt8196-spmi";
f1918d36e1f644 Lu Tang        2025-02-17  3267  			reg = <0 0x1c01a000 0 0x000e00>,
20943b200aa83b Xavier Chang   2024-07-02  3268  			      <0 0x1c01c000 0 0x000100>,
f1918d36e1f644 Lu Tang        2025-02-17  3269  			      <0 0x1c018000 0 0x000e00>,
20943b200aa83b Xavier Chang   2024-07-02  3270  			      <0 0x1c01c800 0 0x000100>;
20943b200aa83b Xavier Chang   2024-07-02  3271  			reg-names = "pmif", "spmimst","pmif-p","spmimst-p";
20943b200aa83b Xavier Chang   2024-07-02  3272  			interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>,
20943b200aa83b Xavier Chang   2024-07-02  3273  					      <&pio 292 IRQ_TYPE_LEVEL_HIGH>,
20943b200aa83b Xavier Chang   2024-07-02  3274  					      <&gic GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
20943b200aa83b Xavier Chang   2024-07-02  3275  					      <&gic GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
20943b200aa83b Xavier Chang   2024-07-02  3276  					      <&gic GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
20943b200aa83b Xavier Chang   2024-07-02  3277  					      <&gic GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>;
f1918d36e1f644 Lu Tang        2025-02-17  3278  			interrupt-names = "rcs_irq", "rcs_irq_p", "pmif_irq", "spmi_nack_irq",
f1918d36e1f644 Lu Tang        2025-02-17  3279  					  "pmif_p_irq", "spmi_p_nack_irq";
20943b200aa83b Xavier Chang   2024-07-02  3280  			interrupt-controller;
20943b200aa83b Xavier Chang   2024-07-02  3281  			#interrupt-cells = <1>;
20943b200aa83b Xavier Chang   2024-07-02  3282  			irq-event-en = <0x0 0x0 0x0 0x0 0x0>;
20943b200aa83b Xavier Chang   2024-07-02  3283  			spmi-dev-mask = <0x85c0>;
20943b200aa83b Xavier Chang   2024-07-02  3284  			#address-cells = <2>;
20943b200aa83b Xavier Chang   2024-07-02  3285  			#size-cells = <0>;
20943b200aa83b Xavier Chang   2024-07-02  3286  		};
20943b200aa83b Xavier Chang   2024-07-02  3287  
b9408b7224ce87 Runyang Chen   2024-03-26  3288  		devapc_vlp: devapc@1c032000 {
b9408b7224ce87 Runyang Chen   2024-03-26  3289  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  3290  			reg = <0 0x1c032000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  3291  			vio-idx-num = <101>;
b9408b7224ce87 Runyang Chen   2024-03-26  3292  			interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  3293  		};
b9408b7224ce87 Runyang Chen   2024-03-26  3294  
519d40b68a563e Kenji Yu       2024-08-30  3295  		sram@1c350000 {
519d40b68a563e Kenji Yu       2024-08-30  3296  			compatible = "mmio-sram";
519d40b68a563e Kenji Yu       2024-08-30  3297  			reg = <0x0 0x1c350000 0x0 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3298  
519d40b68a563e Kenji Yu       2024-08-30  3299  			#address-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3300  			#size-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3301  			ranges = <0 0x0 0x1c350000 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3302  
519d40b68a563e Kenji Yu       2024-08-30  3303  			scmi_tx_shmem: mailbox-sram@0 {
519d40b68a563e Kenji Yu       2024-08-30  3304  				compatible = "arm,scmi-shmem";
519d40b68a563e Kenji Yu       2024-08-30  3305  				reg = <0x0 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3306  			};
519d40b68a563e Kenji Yu       2024-08-30  3307  		};
519d40b68a563e Kenji Yu       2024-08-30  3308  
519d40b68a563e Kenji Yu       2024-08-30  3309  		tinysys_mbox: mailbox@1c351000 {
519d40b68a563e Kenji Yu       2024-08-30  3310  			compatible = "mediatek,tinysys_mbox";
519d40b68a563e Kenji Yu       2024-08-30  3311  			reg = <0 0x1c351000 0 0x1000>,
519d40b68a563e Kenji Yu       2024-08-30  3312  			      <0 0x1c361000 0 0x1000>;
519d40b68a563e Kenji Yu       2024-08-30  3313  			/* for profiling */
519d40b68a563e Kenji Yu       2024-08-30  3314  			shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
519d40b68a563e Kenji Yu       2024-08-30  3315  			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH 0>,
519d40b68a563e Kenji Yu       2024-08-30  3316  				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH 0>;
519d40b68a563e Kenji Yu       2024-08-30  3317  			#mbox-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3318  			/* notify spm clr */
519d40b68a563e Kenji Yu       2024-08-30  3319  			secure-sspm-md2spm-clr = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3320  		};
519d40b68a563e Kenji Yu       2024-08-30  3321  
519d40b68a563e Kenji Yu       2024-08-30  3322  		sram@1c360000 {
519d40b68a563e Kenji Yu       2024-08-30  3323  			compatible = "mmio-sram";
519d40b68a563e Kenji Yu       2024-08-30  3324  			reg = <0x0 0x1c360000 0x0 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3325  
519d40b68a563e Kenji Yu       2024-08-30  3326  			#address-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3327  			#size-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3328  			ranges = <0 0x0 0x1c360000 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3329  
519d40b68a563e Kenji Yu       2024-08-30  3330  			scmi_rx_shmem: mailbox-sram@0 {
519d40b68a563e Kenji Yu       2024-08-30  3331  				compatible = "arm,scmi-shmem";
519d40b68a563e Kenji Yu       2024-08-30  3332  				reg = <0x0 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3333  			};
519d40b68a563e Kenji Yu       2024-08-30  3334  		};
519d40b68a563e Kenji Yu       2024-08-30  3335  
3a88be54312101 Xavier Chang   2024-01-08  3336  		systimer: systimer@1c400000 {
3a88be54312101 Xavier Chang   2024-01-08  3337  			compatible = "mediatek,mt8196-timer",
3a88be54312101 Xavier Chang   2024-01-08  3338  				     "mediatek,mt6765-timer";
3a88be54312101 Xavier Chang   2024-01-08  3339  			reg = <0 0x1c400000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3340  			interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  3341  			clocks = <&clk13m>;
3a88be54312101 Xavier Chang   2024-01-08  3342  		};
3a88be54312101 Xavier Chang   2024-01-08  3343  
5ea44a544d5f55 Yong Wu        2024-02-04  3344  		smi_disp_common: smi-comm@30020000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3345  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3346  			reg = <0 0x30020000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3347  			mediatek,smi = <&disp_ssc0_smi_2x1_sub_comm>;
5ea44a544d5f55 Yong Wu        2024-02-04  3348  			mediatek,common-id = <0>;
5ea44a544d5f55 Yong Wu        2024-02-04  3349  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3350  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3351  
5ea44a544d5f55 Yong Wu        2024-02-04  3352  		smi_mdp_common: smi-comm@30021000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3353  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3354  			reg = <0 0x30021000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3355  			mediatek,smi = <&mdp_ssc4_smi_2x1_sub_comm>;
5ea44a544d5f55 Yong Wu        2024-02-04  3356  			mediatek,common-id = <1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3357  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3358  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3359  
b9408b7224ce87 Runyang Chen   2024-03-26  3360  		devapc_mminfra: devapc@30040000 {
b9408b7224ce87 Runyang Chen   2024-03-26  3361  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  3362  			reg = <0 0x30040000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  3363  			vio-idx-num = <699>;
b9408b7224ce87 Runyang Chen   2024-03-26  3364  			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  3365  		};
b9408b7224ce87 Runyang Chen   2024-03-26  3366  
620014904e31a2 Xavier Chang   2024-07-02  3367  		gce0: gce@300c0000 {
620014904e31a2 Xavier Chang   2024-07-02  3368  			compatible = "mediatek,mt8196-gce";
620014904e31a2 Xavier Chang   2024-07-02  3369  			reg = <0 0x300c0000 0 0x80000>;
620014904e31a2 Xavier Chang   2024-07-02  3370  			interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH 0>;
620014904e31a2 Xavier Chang   2024-07-02  3371  			#mbox-cells = <2>;
620014904e31a2 Xavier Chang   2024-07-02  3372  			iommus = <&mm_smmu 199>;
6918c019ec1fdd Jason-jh Lin   2024-07-12  3373  			mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
6918c019ec1fdd Jason-jh Lin   2024-07-12  3374  			mediatek,gce-events = <CMDQ_SYNC_SECURE_THR_EOF>;
620014904e31a2 Xavier Chang   2024-07-02  3375  		};
620014904e31a2 Xavier Chang   2024-07-02  3376  
620014904e31a2 Xavier Chang   2024-07-02  3377  		gce1: gce@30140000 {
620014904e31a2 Xavier Chang   2024-07-02  3378  			compatible = "mediatek,mt8196-gce";
620014904e31a2 Xavier Chang   2024-07-02  3379  			reg = <0 0x30140000 0 0x80000>;
620014904e31a2 Xavier Chang   2024-07-02  3380  			interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
620014904e31a2 Xavier Chang   2024-07-02  3381  			#mbox-cells = <2>;
620014904e31a2 Xavier Chang   2024-07-02  3382  			iommus = <&mm_smmu 183>;
620014904e31a2 Xavier Chang   2024-07-02  3383  		};
620014904e31a2 Xavier Chang   2024-07-02  3384  
d64301076e1f02 Yong Wu        2024-02-29  3385  		mm_smmu: iommu@30800000 {
d64301076e1f02 Yong Wu        2024-02-29  3386  			compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
d64301076e1f02 Yong Wu        2024-02-29  3387  			reg = <0 0x30800000 0 0x1e0000>;
d64301076e1f02 Yong Wu        2024-02-29  3388  			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
d64301076e1f02 Yong Wu        2024-02-29  3389  			interrupt-names = "combined";
d64301076e1f02 Yong Wu        2024-02-29  3390  			#iommu-cells = <1>;
d64301076e1f02 Yong Wu        2024-02-29  3391  		};
d64301076e1f02 Yong Wu        2024-02-29  3392  
5ea44a544d5f55 Yong Wu        2024-02-04  3393  		disp_ssc0_smi_2x1_sub_comm: smi-comm@30a30000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3394  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3395  			reg = <0 0x30a30000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3396  			mediatek,common-id = <3>;
5ea44a544d5f55 Yong Wu        2024-02-04  3397  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3398  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3399  
5ea44a544d5f55 Yong Wu        2024-02-04  3400  		disp_ssc1_smi_2x1_sub_comm: smi-comm@30a31000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3401  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3402  			reg = <0 0x30a31000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3403  			mediatek,common-id = <4>;
5ea44a544d5f55 Yong Wu        2024-02-04  3404  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3405  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3406  
5ea44a544d5f55 Yong Wu        2024-02-04  3407  		mdp_ssc4_smi_2x1_sub_comm: smi-comm@30a32000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3408  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3409  			reg = <0 0x30a32000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3410  			mediatek,common-id = <5>;
5ea44a544d5f55 Yong Wu        2024-02-04  3411  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3412  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3413  
5ea44a544d5f55 Yong Wu        2024-02-04  3414  		mdp_ssc5_smi_2x1_sub_comm: smi-comm@30a33000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3415  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3416  			reg = <0 0x30a33000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3417  			mediatek,common-id = <6>;
5ea44a544d5f55 Yong Wu        2024-02-04  3418  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3419  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3420  
57436b1dbadb65 Jjian Zhou     2024-04-01  3421  		vcp: vcp@31800000 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3422  			compatible = "mediatek,vcp";
57436b1dbadb65 Jjian Zhou     2024-04-01  3423  			reg = <0 0x31800000 0 0x60000>, /* sram */
57436b1dbadb65 Jjian Zhou     2024-04-01  3424  			      <0 0x31a04000 0 0xa000>, /* cfg */
57436b1dbadb65 Jjian Zhou     2024-04-01  3425  			      <0 0x31bd0000 0 0x1000>, /* cfg core */
57436b1dbadb65 Jjian Zhou     2024-04-01  3426  			      <0 0x31b80000 0 0x50000>, /* mbox base */
57436b1dbadb65 Jjian Zhou     2024-04-01  3427  			      <0 0x31a70020 0 0x100>, /* mbox init */
57436b1dbadb65 Jjian Zhou     2024-04-01  3428  			      <0 0x1c00091c 0 0x4>; /* vcp rdy */
57436b1dbadb65 Jjian Zhou     2024-04-01  3429  			reg-names = "sram",
57436b1dbadb65 Jjian Zhou     2024-04-01  3430  				    "cfg",
57436b1dbadb65 Jjian Zhou     2024-04-01  3431  				    "cfg_core",
57436b1dbadb65 Jjian Zhou     2024-04-01  3432  				    "mbox_base",
57436b1dbadb65 Jjian Zhou     2024-04-01  3433  				    "mbox_init",
57436b1dbadb65 Jjian Zhou     2024-04-01  3434  				    "vcp_vlp_ao_rsvd7";
57436b1dbadb65 Jjian Zhou     2024-04-01  3435  
57436b1dbadb65 Jjian Zhou     2024-04-01  3436  			interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3437  				     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3438  				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3439  				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3440  				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3441  				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3442  			interrupt-names = "wdt",
57436b1dbadb65 Jjian Zhou     2024-04-01  3443  					  "mbox0",
57436b1dbadb65 Jjian Zhou     2024-04-01  3444  					  "mbox1",
57436b1dbadb65 Jjian Zhou     2024-04-01  3445  					  "mbox2",
57436b1dbadb65 Jjian Zhou     2024-04-01  3446  					  "mbox3",
57436b1dbadb65 Jjian Zhou     2024-04-01  3447  					  "mbox4";
57436b1dbadb65 Jjian Zhou     2024-04-01  3448  
57436b1dbadb65 Jjian Zhou     2024-04-01  3449  			power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3450  			iommus = <&mm_smmu 160>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3451  			memory-region = <&vcp_resv_mem>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3452  
57436b1dbadb65 Jjian Zhou     2024-04-01  3453  			vcp-mem-tbl = <0 0x1a00000>, /* VCP_RTOS_MEM_ID 26MB */
57436b1dbadb65 Jjian Zhou     2024-04-01  3454  				      <1 0x30000>, /* VDEC_MEM_ID 192KB */
57436b1dbadb65 Jjian Zhou     2024-04-01  3455  				      <2 0x12000>, /* VENC_MEM_ID 72KB */
cf610ab361b09c Xiangzhi Tang  2025-02-21  3456  				      <3 0x1000>, /* MMDVFS_VCP_MEM_ID 4KB */
cf610ab361b09c Xiangzhi Tang  2025-02-21  3457  				      <4 0x1000>, /* MMDVFS_MMUP_MEM_ID 4KB */
cf610ab361b09c Xiangzhi Tang  2025-02-21  3458  				      <5 0x1000>; /* MMQOS_MEM_ID 4KB */
57436b1dbadb65 Jjian Zhou     2024-04-01  3459  
57436b1dbadb65 Jjian Zhou     2024-04-01  3460  			vcp@0 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3461  				compatible = "mediatek,vcp-core";
57436b1dbadb65 Jjian Zhou     2024-04-01  3462  				twohart = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3463  				sram-offset = <0x0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3464  			};
57436b1dbadb65 Jjian Zhou     2024-04-01  3465  
57436b1dbadb65 Jjian Zhou     2024-04-01  3466  			vcp@31000 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3467  				compatible = "mediatek,mmup-core";
57436b1dbadb65 Jjian Zhou     2024-04-01  3468  				twohart = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3469  				sram-offset = <0x031000>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3470  			};
57436b1dbadb65 Jjian Zhou     2024-04-01  3471  
57436b1dbadb65 Jjian Zhou     2024-04-01  3472  			send_table: mtk-send-table {
57436b1dbadb65 Jjian Zhou     2024-04-01  3473  				mbox0-0 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3474  					mbox-id = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3475  					chan-id = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3476  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3477  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3478  				mbox1-15 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3479  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3480  					chan-id = <15>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3481  					msg-size = <8>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3482  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3483  				mbox1-16 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3484  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3485  					chan-id = <16>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3486  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3487  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3488  				mbox1-9 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3489  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3490  					chan-id = <9>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3491  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3492  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3493  				mbox2-11 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3494  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3495  					chan-id = <11>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3496  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3497  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3498  				mbox2-2 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3499  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3500  					chan-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3501  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3502  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3503  				mbox2-3 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3504  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3505  					chan-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3506  					msg-size = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3507  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3508  				mbox2-32 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3509  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3510  					chan-id = <32>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3511  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3512  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3513  				mbox3-33 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3514  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3515  					chan-id = <33>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3516  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3517  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3518  				mbox3-13 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3519  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3520  					chan-id = <13>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3521  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3522  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3523  				mbox3-35 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3524  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3525  					chan-id = <35>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3526  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3527  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3528  				mbox4-20 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3529  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3530  					chan-id = <20>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3531  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3532  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3533  				mbox4-21 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3534  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3535  					chan-id = <21>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3536  					msg-size = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3537  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3538  				mbox4-23 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3539  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3540  					chan-id = <23>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3541  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3542  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3543  			};
57436b1dbadb65 Jjian Zhou     2024-04-01  3544  
57436b1dbadb65 Jjian Zhou     2024-04-01  3545  			recv_table: mtk-recv-table {
57436b1dbadb65 Jjian Zhou     2024-04-01  3546  				mbox0-1 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3547  					mbox-id = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3548  					chan-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3549  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3550  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3551  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3552  				mbox1-15 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3553  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3554  					chan-id = <15>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3555  					msg-size = <8>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3556  					recv-opt = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3557  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3558  				mbox1-17 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3559  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3560  					chan-id = <17>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3561  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3562  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3563  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3564  				mbox1-10 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3565  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3566  					chan-id = <10>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3567  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3568  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3569  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3570  				mbox2-12 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3571  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3572  					chan-id = <12>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3573  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3574  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3575  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3576  				mbox2-5 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3577  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3578  					chan-id = <5>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3579  					msg-size = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3580  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3581  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3582  				mbox2-2 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3583  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3584  					chan-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3585  					msg-size = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3586  					recv-opt = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3587  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3588  				mbox3-34 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3589  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3590  					chan-id = <34>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3591  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3592  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3593  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3594  				mbox3-14 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3595  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3596  					chan-id = <14>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3597  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3598  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3599  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3600  				mbox4-26 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3601  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3602  					chan-id = <26>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3603  					msg-size = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3604  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3605  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3606  				mbox4-20 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3607  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3608  					chan-id = <20>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3609  					msg-size = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3610  					recv-opt = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3611  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3612  			};
57436b1dbadb65 Jjian Zhou     2024-04-01  3613  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3614  
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3615  		mmqos: interconnect@30000000 {
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3616  			compatible = "mediatek,mt8196-mmqos";
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3617  			reg = <0  0x30000000 0 0x1000>,
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3618  			      <0 0x31a90000 0 0x1000>;
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3619  			clocks = <&cksys_gp2_clk CLK_CK2_MMINFRA_SEL>,
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3620  				 <&cksys_gp2_clk CLK_CK2_MMINFRA_SEL>;
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3621  			clock-names = "mm", "mdp";
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3622  			interconnects = <&dvfsrc MT6873_MASTER_MMSYS &dvfsrc MT6873_SLAVE_DDR_EMI>,
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3623  					<&dvfsrc MT6873_MASTER_HRT_MMSYS
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3624  					 &dvfsrc MT6873_SLAVE_HRT_DDR_EMI>;
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3625  			interconnect-names = "icc-bw", "icc-hrt-bw";
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3626  			#mtk-interconnect-cells = <1>;
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3627  			mediatek,larbs-supply = <&smi_larb0 &smi_larb1  &smi_larb2
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3628  						 &smi_larb3  &smi_larb4  &smi_larb5  &smi_larb6
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3629  						 &smi_larb7  &smi_larb8  &smi_larb20 &smi_larb21
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3630  						 &smi_larb24 &smi_larb32 &smi_larb33 &smi_larb34
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3631  						 &smi_larb35 &smi_larb36 &smi_larb37 &smi_larb41
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3632  						 &smi_larb42 &smi_larb47>;
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3633  			mediatek,commons-supply = <&smi_disp_common>, <&smi_mdp_common>;
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3634  			mediatek,vcp = <&vcp>;
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3635  		};
c0fbad54cc02c9 Kyrie Wu       2024-11-12  3636  
3a88be54312101 Xavier Chang   2024-01-08  3637  		mminfra_hwv: syscon@31a80000 {
3a88be54312101 Xavier Chang   2024-01-08  3638  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  3639  			compatible = "mediatek,mt8196-mminfra-hwv", "mediatek,mt8196-mminfra_hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3640  			reg = <0 0x31a80000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3641  		};
3a88be54312101 Xavier Chang   2024-01-08  3642  
b9408b7224ce87 Runyang Chen   2024-03-26  3643  		devapc_mmup: devapc@31ad5000 {
b9408b7224ce87 Runyang Chen   2024-03-26  3644  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  3645  			reg = <0 0x31ad5000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  3646  			vio-idx-num = <71>;
b9408b7224ce87 Runyang Chen   2024-03-26  3647  			interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  3648  		};
b9408b7224ce87 Runyang Chen   2024-03-26  3649  
3a88be54312101 Xavier Chang   2024-01-08  3650  		mm_hwv: syscon@31b00000 {
3a88be54312101 Xavier Chang   2024-01-08  3651  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  3652  			compatible = "mediatek,mt8196-mm-hwv", "mediatek,mt8196-mm_hwv", "syscon";
4c25607972da21 Guangjie Song  2025-02-09  3653  			reg = <0 0x31b00000 0 0x6000>;
3a88be54312101 Xavier Chang   2024-01-08  3654  		};
3a88be54312101 Xavier Chang   2024-01-08  3655  
3a88be54312101 Xavier Chang   2024-01-08  3656  		hfrpsys: power-controller@31b50000 {
3a88be54312101 Xavier Chang   2024-01-08  3657  			compatible = "mediatek,mt8196-hfrpsys-hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3658  			reg = <0 0x31b50000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3659  			#power-domain-cells = <1>;
bda1d16dc49f26 Guangjie Song  2025-01-16  3660  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_DISP_VDISP_AO_CONFIG_DISP>,
bda1d16dc49f26 Guangjie Song  2025-01-16  3661  				 <&disp_vdisp_ao_config_clk CLK_MM_V_DISP_DPC_DISP>;
bda1d16dc49f26 Guangjie Song  2025-01-16  3662  			clock-names = "disp_ao_config", "disp_dpc";
3a88be54312101 Xavier Chang   2024-01-08  3663  			mmpc = <&hfrpsys>;
3a88be54312101 Xavier Chang   2024-01-08  3664  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  3665  			mminfra-hwv-regmap = <&mminfra_hwv>;
bda1d16dc49f26 Guangjie Song  2025-01-16  3666  			disp-vcore-supply = <&vdisp>;
a2f778a6f2805b Yunfei Dong    2024-12-23  3667  			vde-vcore0-supply = <&vdec_vcore>;
3a88be54312101 Xavier Chang   2024-01-08  3668  		};
3a88be54312101 Xavier Chang   2024-01-08  3669  
3a88be54312101 Xavier Chang   2024-01-08  3670  		dispsys_config_clk: syscon@32000000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3671  			compatible = "mediatek,mt8196-dispsys0", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3672  			reg = <0 0x32000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3673  			mm-hw-ccf-regmap = <&mm_hwv>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3674  			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3675  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
3a88be54312101 Xavier Chang   2024-01-08  3676  			#clock-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3677  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3678  			async {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3679  				clocks = <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC0_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3680  					 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC1_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3681  					 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC8_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3682  					 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC1_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3683  					 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC2_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3684  					 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3685  			};
64b149becb1a40 Sunny.Shen     2024-06-24  3686  
64b149becb1a40 Sunny.Shen     2024-06-24  3687  			top {
64b149becb1a40 Sunny.Shen     2024-06-24  3688  				clocks = <&dispsys_config_clk CLK_MM_CONFIG_DISP>;
64b149becb1a40 Sunny.Shen     2024-06-24  3689  			};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3690  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3691  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3692  		disp0_mutex: mutex@32020000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3693  			compatible = "mediatek,mt8196-disp-mutex";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3694  			reg = <0 0x32020000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3695  			clocks = <&dispsys_config_clk CLK_MM_DISP_MUTEX0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3696  			mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3697  					      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
3a88be54312101 Xavier Chang   2024-01-08  3698  		};
3a88be54312101 Xavier Chang   2024-01-08  3699  
811d357337456b Sunny.Shen     2024-06-24  3700  		disp_ccorr0: disp-ccorr@32090000 {
811d357337456b Sunny.Shen     2024-06-24  3701  			compatible = "mediatek,mt8196-disp-ccorr";
811d357337456b Sunny.Shen     2024-06-24  3702  			reg = <0 0x32090000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3703  			clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR0_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3704  		};
811d357337456b Sunny.Shen     2024-06-24  3705  
811d357337456b Sunny.Shen     2024-06-24  3706  		disp_ccorr1: disp-ccorr@320a0000 {
811d357337456b Sunny.Shen     2024-06-24  3707  			compatible = "mediatek,mt8196-disp-ccorr";
811d357337456b Sunny.Shen     2024-06-24  3708  			reg = <0 0x320a0000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3709  			clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR1_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3710  		};
811d357337456b Sunny.Shen     2024-06-24  3711  
811d357337456b Sunny.Shen     2024-06-24  3712  		disp_dither0: disp-dither@32110000 {
811d357337456b Sunny.Shen     2024-06-24  3713  			compatible = "mediatek,mt8196-disp-dither",
811d357337456b Sunny.Shen     2024-06-24  3714  				     "mediatek,mt8183-disp-dither";
811d357337456b Sunny.Shen     2024-06-24  3715  			reg = <0 0x32110000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3716  			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
811d357337456b Sunny.Shen     2024-06-24  3717  			clocks = <&dispsys_config_clk CLK_MM_DISP_DITHER0_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3718  		};
811d357337456b Sunny.Shen     2024-06-24  3719  
811d357337456b Sunny.Shen     2024-06-24  3720  		disp_gamma0: disp-gamma@32130000 {
811d357337456b Sunny.Shen     2024-06-24  3721  			compatible = "mediatek,mt8196-disp-gamma",
811d357337456b Sunny.Shen     2024-06-24  3722  				     "mediatek,mt8195-disp-gamma";
811d357337456b Sunny.Shen     2024-06-24  3723  			reg = <0 0x32130000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3724  			clocks = <&dispsys_config_clk CLK_MM_DISP_GAMMA0_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3725  		};
811d357337456b Sunny.Shen     2024-06-24  3726  
811d357337456b Sunny.Shen     2024-06-24  3727  		disp_tdshp0: disp-tdshp@321e0000 {
811d357337456b Sunny.Shen     2024-06-24  3728  			compatible = "mediatek,mt8196-disp-tdshp";
811d357337456b Sunny.Shen     2024-06-24  3729  			reg = <0 0x321e0000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3730  			clocks = <&dispsys_config_clk CLK_MM_DISP_TDSHP0_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3731  		};
811d357337456b Sunny.Shen     2024-06-24  3732  
64b149becb1a40 Sunny.Shen     2024-06-24  3733  		disp_postmask0: postmask@32180000 {
64b149becb1a40 Sunny.Shen     2024-06-24  3734  			compatible = "mediatek,mt8196-disp-postmask",
64b149becb1a40 Sunny.Shen     2024-06-24  3735  				     "mediatek,mt8192-disp-postmask";
64b149becb1a40 Sunny.Shen     2024-06-24  3736  			reg = <0 0x32180000 0 0x1000>;
64b149becb1a40 Sunny.Shen     2024-06-24  3737  			clocks = <&dispsys_config_clk CLK_MM_DISP_POSTMASK0_DISP>;
64b149becb1a40 Sunny.Shen     2024-06-24  3738  		};
64b149becb1a40 Sunny.Shen     2024-06-24  3739  
64b149becb1a40 Sunny.Shen     2024-06-24  3740  		disp_mdp_rsz0: mdp-rsz@321a0000 {
64b149becb1a40 Sunny.Shen     2024-06-24  3741  			compatible = "mediatek,mt8196-disp-mdp-rsz";
64b149becb1a40 Sunny.Shen     2024-06-24  3742  			reg = <0 0x321a0000 0 0x1000>;
64b149becb1a40 Sunny.Shen     2024-06-24  3743  			clocks = <&dispsys_config_clk CLK_MM_MDP_RSZ0_DISP>;
64b149becb1a40 Sunny.Shen     2024-06-24  3744  		};
64b149becb1a40 Sunny.Shen     2024-06-24  3745  
5ea44a544d5f55 Yong Wu        2024-02-04  3746  		smi_larb32: larb@32240000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3747  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3748  			reg = <0 0x32240000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3749  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3750  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3751  				 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3752  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3753  			mediatek,smi = <&smi_disp_dram_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3754  			mediatek,larb-id = <32>;
5ea44a544d5f55 Yong Wu        2024-02-04  3755  			larb-port-real-time-type = <1 1 1 1 0 0 0 0 1 0>;
5ea44a544d5f55 Yong Wu        2024-02-04  3756  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3757  
3a88be54312101 Xavier Chang   2024-01-08  3758  		dispsys1_config_clk: syscon@32400000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3759  			compatible = "mediatek,mt8196-dispsys1", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3760  			reg = <0 0x32400000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3761  			mm-hw-ccf-regmap = <&mm_hwv>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3762  			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3763  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
3a88be54312101 Xavier Chang   2024-01-08  3764  			#clock-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3765  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3766  			async {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3767  				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC21_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3768  					 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC22_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3769  					 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC23_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3770  			};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3771  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3772  			top {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3773  				clocks = <&dispsys1_config_clk CLK_MM1_DISPSYS1_CONFIG_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3774  				clock-names = "dispsys1_config";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3775  			};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3776  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3777  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3778  		disp1_mutex: mutex@32420000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3779  			compatible = "mediatek,mt8196-disp-mutex";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3780  			reg = <0 0x32420000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3781  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_MUTEX0_DISP>;
3a88be54312101 Xavier Chang   2024-01-08  3782  		};
3a88be54312101 Xavier Chang   2024-01-08  3783  
3eb254258f2631 Jason-jh Lin   2025-01-16  3784  		dp_intf0: dp-intf@32430000 {
3eb254258f2631 Jason-jh Lin   2025-01-16  3785  			compatible = "mediatek,mt8196-dp-intf";
3eb254258f2631 Jason-jh Lin   2025-01-16  3786  			reg = <0 0x32430000 0 0x1000>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3787  			interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3788  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF0>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3789  				 <&dispsys1_config_clk CLK_MM1_MOD4>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3790  				 <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3791  				 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D4>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3792  				 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D8>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3793  				 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D16>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3794  				 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL1>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3795  				 <&cksys_clk CLK_CK_TCK_26M_MX9>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3796  			clock-names = "hf_fmm_ck",
3eb254258f2631 Jason-jh Lin   2025-01-16  3797  				      "hf_fdp_ck",
3eb254258f2631 Jason-jh Lin   2025-01-16  3798  				      "mux_dp",
3eb254258f2631 Jason-jh Lin   2025-01-16  3799  				      "tvdpll_d4",
3eb254258f2631 Jason-jh Lin   2025-01-16  3800  				      "tvdpll_d8",
3eb254258f2631 Jason-jh Lin   2025-01-16  3801  				      "tvdpll_d16",
3eb254258f2631 Jason-jh Lin   2025-01-16  3802  				      "dpi_ck",
3eb254258f2631 Jason-jh Lin   2025-01-16  3803  				      "dpi_26m";
3eb254258f2631 Jason-jh Lin   2025-01-16  3804  			phys = <&dp_tx>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3805  			phy-names = "dp_tx";
3eb254258f2631 Jason-jh Lin   2025-01-16  3806  		};
3eb254258f2631 Jason-jh Lin   2025-01-16  3807  
ebbc0e1103cfde Mac Shen       2024-06-27  3808  		dp_intf1: dp-intf@32440000 {
ebbc0e1103cfde Mac Shen       2024-06-27  3809  			compatible = "mediatek,mt8196-dp-intf";
ebbc0e1103cfde Mac Shen       2024-06-27  3810  			reg = <0 0x32440000 0 0x1000>;
ebbc0e1103cfde Mac Shen       2024-06-27  3811  			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
ebbc0e1103cfde Mac Shen       2024-06-27  3812  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF1>,
ebbc0e1103cfde Mac Shen       2024-06-27  3813  				 <&dispsys1_config_clk CLK_MM1_MOD5>,
ebbc0e1103cfde Mac Shen       2024-06-27  3814  				 <&cksys_gp2_clk CLK_CK2_DP1_SEL>,
ebbc0e1103cfde Mac Shen       2024-06-27  3815  				 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D4>,
ebbc0e1103cfde Mac Shen       2024-06-27  3816  				 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D8>,
ebbc0e1103cfde Mac Shen       2024-06-27  3817  				 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D16>,
ebbc0e1103cfde Mac Shen       2024-06-27  3818  				 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL2>,
ebbc0e1103cfde Mac Shen       2024-06-27  3819  				 <&cksys_clk CLK_CK_TCK_26M_MX9>;
ebbc0e1103cfde Mac Shen       2024-06-27  3820  			clock-names = "hf_fmm_ck",
ebbc0e1103cfde Mac Shen       2024-06-27  3821  				      "hf_fdp_ck",
ebbc0e1103cfde Mac Shen       2024-06-27  3822  				      "mux_dp",
ebbc0e1103cfde Mac Shen       2024-06-27  3823  				      "tvdpll_d4",
ebbc0e1103cfde Mac Shen       2024-06-27  3824  				      "tvdpll_d8",
ebbc0e1103cfde Mac Shen       2024-06-27  3825  				      "tvdpll_d16",
ebbc0e1103cfde Mac Shen       2024-06-27  3826  				      "dpi_ck",
ebbc0e1103cfde Mac Shen       2024-06-27  3827  				      "dpi_26m";
ebbc0e1103cfde Mac Shen       2024-06-27  3828  			phys = <&dp_tx>;
ebbc0e1103cfde Mac Shen       2024-06-27  3829  			phy-names = "dp_tx";
ebbc0e1103cfde Mac Shen       2024-06-27  3830  			status = "disabled";
ebbc0e1103cfde Mac Shen       2024-06-27  3831  		};
ebbc0e1103cfde Mac Shen       2024-06-27  3832  
13ecc998839331 Jason-jh Lin   2025-01-17  3833  		disp_dsc0: disp-dsc0-wrap0@32450000 {
13ecc998839331 Jason-jh Lin   2025-01-17  3834  			compatible = "mediatek,mt8196-disp-dsc";
13ecc998839331 Jason-jh Lin   2025-01-17  3835  			reg = <0 0x32450000 0 0x1000>;
13ecc998839331 Jason-jh Lin   2025-01-17  3836  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP0>;
13ecc998839331 Jason-jh Lin   2025-01-17  3837  		};
13ecc998839331 Jason-jh Lin   2025-01-17  3838  
13ecc998839331 Jason-jh Lin   2025-01-17  3839  		disp_dsc1: disp-dsc1-wrap1@32460000 {
13ecc998839331 Jason-jh Lin   2025-01-17  3840  			compatible = "mediatek,mt8196-disp-dsc";
13ecc998839331 Jason-jh Lin   2025-01-17  3841  			reg = <0 0x32460000 0 0x1000>;
13ecc998839331 Jason-jh Lin   2025-01-17  3842  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP1>;
13ecc998839331 Jason-jh Lin   2025-01-17  3843  		};
13ecc998839331 Jason-jh Lin   2025-01-17  3844  
9a5b02d04139ce Shuijing Li    2024-07-17  3845  		dsi0: dsi@32490000 {
9a5b02d04139ce Shuijing Li    2024-07-17  3846  			compatible = "mediatek,mt8196-dsi";
9a5b02d04139ce Shuijing Li    2024-07-17  3847  			reg = <0 0x32490000 0 0x1000>;
9a5b02d04139ce Shuijing Li    2024-07-17  3848  			interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH 0>;
9a5b02d04139ce Shuijing Li    2024-07-17  3849  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSI0_DISP>,
9a5b02d04139ce Shuijing Li    2024-07-17  3850  				 <&dispsys1_config_clk CLK_MM1_MOD1_DISP>,
9a5b02d04139ce Shuijing Li    2024-07-17  3851  				 <&mipi_tx_config0>;
9a5b02d04139ce Shuijing Li    2024-07-17  3852  			clock-names = "engine", "digital", "hs";
9a5b02d04139ce Shuijing Li    2024-07-17  3853  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DSI_PHY0>;
9a5b02d04139ce Shuijing Li    2024-07-17  3854  			phys = <&mipi_tx_config0>;
9a5b02d04139ce Shuijing Li    2024-07-17  3855  			phy-names = "dphy";
9a5b02d04139ce Shuijing Li    2024-07-17  3856  			status = "disabled";
9a5b02d04139ce Shuijing Li    2024-07-17  3857  		};
9a5b02d04139ce Shuijing Li    2024-07-17  3858  
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3859  		disp_dvo0: disp-dvo0@324c0000 {
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3860  			compatible = "mediatek,mt8196-edp-dvo";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3861  			reg = <0 0x324c0000 0 0x1000>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3862  			interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3863  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DVO0_DISP>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3864  				 <&cksys_gp2_clk CLK_CK2_DVO_SEL>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3865  				 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL3>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3866  				 <&dispsys1_config_clk CLK_MM1_MOD6>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3867  			clock-names = "engine",
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3868  				      "pixel",
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3869  				      "pll",
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3870  				      "hf_fdvo_clk";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3871  			status = "disabled";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3872  		};
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3873  
5ea44a544d5f55 Yong Wu        2024-02-04  3874  		smi_larb33: larb@32600000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3875  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3876  			reg = <0 0x32600000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3877  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3878  			clocks = <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3879  				 <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3880  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3881  			mediatek,smi = <&smi_mdp_dram_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  3882  			mediatek,larb-id = <33>;
5ea44a544d5f55 Yong Wu        2024-02-04  3883  			larb-port-real-time-type = <0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3884  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3885  
3a88be54312101 Xavier Chang   2024-01-08  3886  		ovlsys_config_clk: syscon@32800000 {
fd00cab3fe36e4 Xavier Chang   2025-01-09  3887  			compatible = "mediatek,mt8196-ovlsys0", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3888  			reg = <0 0x32800000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3889  			mm-hw-ccf-regmap = <&mm_hwv>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3890  			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3891  				 <&gce0 8 CMDQ_THR_PRIO_4>, <&gce0 9 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3892  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
3a88be54312101 Xavier Chang   2024-01-08  3893  			#clock-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3894  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3895  			async {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3896  				clocks = <&ovlsys_config_clk CLK_OVL_DLO5_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3897  					 <&ovlsys_config_clk CLK_OVL_DLO6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3898  			};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3899  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3900  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3901  		ovl0_mutex: mutex@32820000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3902  			compatible = "mediatek,mt8196-disp-mutex";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3903  			reg = <0 0x32820000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3904  			clocks = <&ovlsys_config_clk CLK_OVL_MUTEX0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3905  			mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3906  					      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3907  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3908  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3909  		disp_ovl0_exdma2: dma-controller@32850000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3910  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3911  			reg = <0 0x32850000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3912  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3913  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3914  			mediatek,larb = <&smi_larb0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3915  			iommus = <&mm_smmu 144>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3916  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  3917  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L0_P2_OVL_RDMA2)
20e31499fd9223 Nancy Lin      2024-10-11  3918  					 &mmqos SLAVE_COMMON(0)>,
20e31499fd9223 Nancy Lin      2024-10-11  3919  					<&mmqos MASTER_LARB_PORT(SMMU_L0_P2_OVL_RDMA2)
20e31499fd9223 Nancy Lin      2024-10-11  3920  					 &mmqos SLAVE_COMMON(0)>;
20e31499fd9223 Nancy Lin      2024-10-11  3921  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3922  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3923  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3924  		disp_ovl0_exdma3: dma-controller@32860000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3925  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3926  			reg = <0 0x32860000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3927  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3928  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3929  			mediatek,larb = <&smi_larb1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3930  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  3931  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L1_P2_OVL_RDMA3)
20e31499fd9223 Nancy Lin      2024-10-11  3932  					 &mmqos SLAVE_COMMON(0)>,
20e31499fd9223 Nancy Lin      2024-10-11  3933  					<&mmqos MASTER_LARB_PORT(SMMU_L1_P2_OVL_RDMA3)
20e31499fd9223 Nancy Lin      2024-10-11  3934  					 &mmqos SLAVE_COMMON(0)>;
20e31499fd9223 Nancy Lin      2024-10-11  3935  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3936  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3937  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3938  		disp_ovl0_exdma4: dma-controller@32870000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3939  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3940  			reg = <0 0x32870000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3941  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3942  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3943  			mediatek,larb = <&smi_larb20>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3944  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  3945  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L20_P3_OVL_RDMA4)
20e31499fd9223 Nancy Lin      2024-10-11  3946  					 &mmqos SLAVE_COMMON(1)>,
20e31499fd9223 Nancy Lin      2024-10-11  3947  					<&mmqos MASTER_LARB_PORT(SMMU_L20_P3_OVL_RDMA4)
20e31499fd9223 Nancy Lin      2024-10-11  3948  					 &mmqos SLAVE_COMMON(1)>;
20e31499fd9223 Nancy Lin      2024-10-11  3949  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3950  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3951  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3952  		disp_ovl0_exdma5: dma-controller@32880000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3953  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3954  			reg = <0 0x32880000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3955  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3956  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3957  			mediatek,larb = <&smi_larb21>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3958  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  3959  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L21_P3_OVL_RDMA5)
20e31499fd9223 Nancy Lin      2024-10-11  3960  					 &mmqos SLAVE_COMMON(1)>,
20e31499fd9223 Nancy Lin      2024-10-11  3961  					<&mmqos MASTER_LARB_PORT(SMMU_L21_P3_OVL_RDMA5)
20e31499fd9223 Nancy Lin      2024-10-11  3962  					 &mmqos SLAVE_COMMON(1)>;
20e31499fd9223 Nancy Lin      2024-10-11  3963  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3964  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3965  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3966  		disp_ovl0_exdma6: dma-controller@32890000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3967  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3968  			reg = <0 0x32890000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3969  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3970  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
027a1f314c8f91 Jason-jh Lin   2025-03-28  3971  			mediatek,larb = <&smi_larb1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3972  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  3973  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L1_P3_OVL_RDMA6)
20e31499fd9223 Nancy Lin      2024-10-11  3974  					 &mmqos SLAVE_COMMON(0)>,
20e31499fd9223 Nancy Lin      2024-10-11  3975  					<&mmqos MASTER_LARB_PORT(SMMU_L1_P3_OVL_RDMA6)
20e31499fd9223 Nancy Lin      2024-10-11  3976  					 &mmqos SLAVE_COMMON(0)>;
20e31499fd9223 Nancy Lin      2024-10-11  3977  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3978  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3979  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3980  		disp_ovl0_exdma7: dma-controller@328a0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3981  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3982  			reg = <0 0x328a0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3983  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA7_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3984  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3985  			mediatek,larb = <&smi_larb0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3986  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  3987  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L0_P3_OVL_RDMA7)
20e31499fd9223 Nancy Lin      2024-10-11  3988  					 &mmqos SLAVE_COMMON(0)>,
20e31499fd9223 Nancy Lin      2024-10-11  3989  					<&mmqos MASTER_LARB_PORT(SMMU_L0_P3_OVL_RDMA7)
20e31499fd9223 Nancy Lin      2024-10-11  3990  					 &mmqos SLAVE_COMMON(0)>;
20e31499fd9223 Nancy Lin      2024-10-11  3991  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3992  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3993  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3994  		disp_ovl0_exdma8: dma-controller@328b0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3995  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3996  			reg = <0 0x328b0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3997  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA8_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3998  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3999  			mediatek,larb = <&smi_larb21>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4000  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4001  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L21_P4_OVL_RDMA8)
20e31499fd9223 Nancy Lin      2024-10-11  4002  					 &mmqos SLAVE_COMMON(1)>,
20e31499fd9223 Nancy Lin      2024-10-11  4003  					<&mmqos MASTER_LARB_PORT(SMMU_L21_P4_OVL_RDMA8)
20e31499fd9223 Nancy Lin      2024-10-11  4004  					 &mmqos SLAVE_COMMON(1)>;
20e31499fd9223 Nancy Lin      2024-10-11  4005  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4006  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4007  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4008  		disp_ovl0_exdma9: dma-controller@328c0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4009  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4010  			reg = <0 0x328c0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4011  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA9_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4012  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4013  			mediatek,larb = <&smi_larb20>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4014  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4015  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L20_P4_OVL_RDMA9)
20e31499fd9223 Nancy Lin      2024-10-11  4016  					 &mmqos SLAVE_COMMON(1)>,
20e31499fd9223 Nancy Lin      2024-10-11  4017  					<&mmqos MASTER_LARB_PORT(SMMU_L20_P4_OVL_RDMA9)
20e31499fd9223 Nancy Lin      2024-10-11  4018  					 &mmqos SLAVE_COMMON(1)>;
20e31499fd9223 Nancy Lin      2024-10-11  4019  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4020  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4021  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4022  		disp_ovl0_blender0: blender@328d0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4023  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4024  			reg = <0 0x328d0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4025  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4026  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4027  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4028  		disp_ovl0_blender1: blender@328e0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4029  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4030  			reg = <0 0x328e0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4031  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER1_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4032  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4033  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4034  		disp_ovl0_blender2: blender@328f0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4035  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4036  			reg = <0 0x328f0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4037  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4038  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4039  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4040  		disp_ovl0_blender3: blender@32900000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4041  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4042  			reg = <0 0x32900000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4043  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4044  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4045  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4046  		disp_ovl0_blender4: blender@32910000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4047  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4048  			reg = <0 0x32910000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4049  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4050  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4051  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4052  		disp_ovl0_blender5: blender@32920000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4053  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4054  			reg = <0 0x32920000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4055  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4056  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4057  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4058  		disp_ovl0_blender6: blender@32930000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4059  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4060  			reg = <0 0x32930000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4061  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4062  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4063  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4064  		disp_ovl0_blender7: blender@32940000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4065  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4066  			reg = <0 0x32940000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4067  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER7_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4068  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4069  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4070  		disp_ovl0_blender8: blender@32950000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4071  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4072  			reg = <0 0x32950000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4073  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER8_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4074  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4075  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4076  		disp_ovl0_blender9: blender@32960000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4077  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4078  			reg = <0 0x32960000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4079  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER9_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4080  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4081  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4082  		disp_ovl0_outproc0: outproc@32970000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4083  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4084  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4085  			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4086  			reg = <0 0x32970000 0 0x1000>;
86aeba22de7abd Sunny.Shen     2024-09-11  4087  			mediatek,gce-events = <CMDQ_EVENT_OVL0_FRAME_DONE_SEL0>;
86aeba22de7abd Sunny.Shen     2024-09-11  4088  			mboxes = <&gce0 3 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4089  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4090  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4091  		disp_ovl0_outproc1: outproc@32980000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4092  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4093  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC1_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4094  			interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH 0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4095  			reg = <0 0x32980000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4096  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4097  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4098  		disp_ovl0_outproc2: outproc@32990000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4099  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4100  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4101  			reg = <0 0x32990000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4102  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4103  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4104  		disp_ovl0_outproc3: outproc@329a0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4105  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4106  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4107  			reg = <0 0x329a0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4108  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4109  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4110  		disp_ovl0_outproc4: outproc@329b0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4111  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4112  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4113  			reg = <0 0x329b0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4114  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4115  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4116  		disp_ovl0_outproc5: outproc@329c0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4117  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4118  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4119  			reg = <0 0x329c0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4120  		};
3a88be54312101 Xavier Chang   2024-01-08  4121  
5ea44a544d5f55 Yong Wu        2024-02-04  4122  		smi_larb0: larb@32a60000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4123  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4124  			reg = <0 0x32a60000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4125  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4126  			clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4127  				 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4128  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4129  			mediatek,smi = <&smi_disp_dram_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4130  			mediatek,larb-id = <0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4131  			larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4132  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4133  
5ea44a544d5f55 Yong Wu        2024-02-04  4134  		smi_larb1: larb@32a70000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4135  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4136  			reg = <0 0x32a70000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4137  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4138  			clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4139  				 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4140  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4141  			mediatek,smi = <&smi_disp_dram_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4142  			mediatek,larb-id = <1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4143  			larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4144  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4145  
5ea44a544d5f55 Yong Wu        2024-02-04  4146  		smi_larb20: larb@32a80000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4147  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4148  			reg = <0 0x32a80000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4149  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4150  			clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4151  				 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4152  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4153  			mediatek,smi = <&smi_mdp_dram_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4154  			mediatek,larb-id = <20>;
5ea44a544d5f55 Yong Wu        2024-02-04  4155  			larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4156  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4157  
5ea44a544d5f55 Yong Wu        2024-02-04  4158  		smi_larb21: larb@32a90000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4159  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4160  			reg = <0 0x32a90000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4161  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4162  			clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4163  				 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4164  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4165  			mediatek,smi = <&smi_mdp_dram_sub_comm3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4166  			mediatek,larb-id = <21>;
5ea44a544d5f55 Yong Wu        2024-02-04  4167  			larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4168  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4169  
3a88be54312101 Xavier Chang   2024-01-08  4170  		ovlsys1_config_clk: syscon@32c00000 {
fd00cab3fe36e4 Xavier Chang   2025-01-09  4171  			compatible = "mediatek,mt8196-ovlsys1", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4172  			reg = <0 0x32c00000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4173  			mm-hw-ccf-regmap = <&mm_hwv>;
4ca26b1cee2c39 Jason-jh Lin   2024-08-27  4174  			mboxes = <&gce0 2 CMDQ_THR_PRIO_4>, <&gce0 10 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4175  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
3a88be54312101 Xavier Chang   2024-01-08  4176  			#clock-cells = <1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4177  
5ea44a544d5f55 Yong Wu        2024-02-04  4178  			async {
5ea44a544d5f55 Yong Wu        2024-02-04  4179  				clocks = <&ovlsys1_config_clk CLK_OVL_DLO5_DISP>,
5ea44a544d5f55 Yong Wu        2024-02-04  4180  					 <&ovlsys1_config_clk CLK_OVL_DLO6_DISP>;
5ea44a544d5f55 Yong Wu        2024-02-04  4181  			};
5ea44a544d5f55 Yong Wu        2024-02-04  4182  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4183  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4184  		ovl1_mutex: mutex@32c20000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4185  			compatible = "mediatek,mt8196-disp-mutex";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4186  			reg = <0 0x32c20000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4187  			clocks = <&ovlsys1_config_clk CLK_OVL_MUTEX0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4188  			mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4189  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4190  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4191  		disp_ovl1_exdma2: dma-controller@32c50000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4192  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4193  			reg = <0 0x32c50000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4194  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4195  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4196  			mediatek,larb = <&smi_larb34>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4197  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4198  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L34_P2_OVL_RDMA2)
20e31499fd9223 Nancy Lin      2024-10-11  4199  					 &mmqos SLAVE_COMMON(1)>,
20e31499fd9223 Nancy Lin      2024-10-11  4200  					<&mmqos MASTER_LARB_PORT(SMMU_L34_P2_OVL_RDMA2)
20e31499fd9223 Nancy Lin      2024-10-11  4201  					 &mmqos SLAVE_COMMON(1)>;
20e31499fd9223 Nancy Lin      2024-10-11  4202  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4203  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4204  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4205  		disp_ovl1_exdma3: dma-controller@32c60000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4206  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4207  			reg = <0 0x32c60000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4208  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4209  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4210  			mediatek,larb = <&smi_larb35>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4211  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4212  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L35_P2_OVL_RDMA3)
20e31499fd9223 Nancy Lin      2024-10-11  4213  					 &mmqos SLAVE_COMMON(1)>,
20e31499fd9223 Nancy Lin      2024-10-11  4214  					<&mmqos MASTER_LARB_PORT(SMMU_L35_P2_OVL_RDMA3)
20e31499fd9223 Nancy Lin      2024-10-11  4215  					 &mmqos SLAVE_COMMON(1)>;
20e31499fd9223 Nancy Lin      2024-10-11  4216  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4217  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4218  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4219  		disp_ovl1_exdma4: dma-controller@32c70000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4220  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4221  			reg = <0 0x32c70000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4222  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4223  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4224  			mediatek,larb = <&smi_larb36>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4225  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4226  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L36_P3_OVL_RDMA4)
20e31499fd9223 Nancy Lin      2024-10-11  4227  					 &mmqos SLAVE_COMMON(0)>,
20e31499fd9223 Nancy Lin      2024-10-11  4228  					<&mmqos MASTER_LARB_PORT(SMMU_L36_P3_OVL_RDMA4)
20e31499fd9223 Nancy Lin      2024-10-11  4229  					 &mmqos SLAVE_COMMON(0)>;
20e31499fd9223 Nancy Lin      2024-10-11  4230  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4231  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4232  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4233  		disp_ovl1_exdma5: dma-controller@32c80000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4234  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4235  			reg = <0 0x32c80000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4236  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4237  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4238  			mediatek,larb = <&smi_larb37>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4239  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4240  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L37_P3_OVL_RDMA5)
20e31499fd9223 Nancy Lin      2024-10-11  4241  					 &mmqos SLAVE_COMMON(0)>,
20e31499fd9223 Nancy Lin      2024-10-11  4242  					<&mmqos MASTER_LARB_PORT(SMMU_L37_P3_OVL_RDMA5)
20e31499fd9223 Nancy Lin      2024-10-11  4243  					 &mmqos SLAVE_COMMON(0)>;
20e31499fd9223 Nancy Lin      2024-10-11  4244  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4245  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4246  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4247  		disp_ovl1_exdma6: dma-controller@32c90000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4248  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4249  			reg = <0 0x32c90000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4250  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4251  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4252  			mediatek,larb = <&smi_larb35>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4253  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4254  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L35_P3_OVL_RDMA6)
20e31499fd9223 Nancy Lin      2024-10-11  4255  					 &mmqos SLAVE_COMMON(1)>,
20e31499fd9223 Nancy Lin      2024-10-11  4256  					<&mmqos MASTER_LARB_PORT(SMMU_L35_P3_OVL_RDMA6)
20e31499fd9223 Nancy Lin      2024-10-11  4257  					 &mmqos SLAVE_COMMON(1)>;
20e31499fd9223 Nancy Lin      2024-10-11  4258  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4259  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4260  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4261  		disp_ovl1_exdma7: dma-controller@32ca0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4262  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4263  			reg = <0 0x32ca0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4264  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA7_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4265  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4266  			mediatek,larb = <&smi_larb34>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4267  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4268  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L34_P3_OVL_RDMA7)
20e31499fd9223 Nancy Lin      2024-10-11  4269  					 &mmqos SLAVE_COMMON(1)>,
20e31499fd9223 Nancy Lin      2024-10-11  4270  					<&mmqos MASTER_LARB_PORT(SMMU_L34_P3_OVL_RDMA7)
20e31499fd9223 Nancy Lin      2024-10-11  4271  					 &mmqos SLAVE_COMMON(1)>;
20e31499fd9223 Nancy Lin      2024-10-11  4272  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4273  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4274  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4275  		disp_ovl1_exdma8: dma-controller@32cb0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4276  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4277  			reg = <0 0x32cb0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4278  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA8_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4279  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4280  			mediatek,larb = <&smi_larb37>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4281  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4282  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L37_P4_OVL_RDMA8)
20e31499fd9223 Nancy Lin      2024-10-11  4283  					 &mmqos SLAVE_COMMON(0)>,
20e31499fd9223 Nancy Lin      2024-10-11  4284  					<&mmqos MASTER_LARB_PORT(SMMU_L37_P4_OVL_RDMA8)
20e31499fd9223 Nancy Lin      2024-10-11  4285  					 &mmqos SLAVE_COMMON(0)>;
20e31499fd9223 Nancy Lin      2024-10-11  4286  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4287  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4288  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4289  		disp_ovl1_exdma9: dma-controller@32cc0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4290  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4291  			reg = <0 0x32cc0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4292  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA9_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4293  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4294  			mediatek,larb = <&smi_larb36>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4295  			#dma-cells = <1>;
20e31499fd9223 Nancy Lin      2024-10-11  4296  			interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L36_P4_OVL_RDMA9)
20e31499fd9223 Nancy Lin      2024-10-11  4297  					 &mmqos SLAVE_COMMON(0)>,
20e31499fd9223 Nancy Lin      2024-10-11  4298  					<&mmqos MASTER_LARB_PORT(SMMU_L36_P4_OVL_RDMA9)
20e31499fd9223 Nancy Lin      2024-10-11  4299  					 &mmqos SLAVE_COMMON(0)>;
20e31499fd9223 Nancy Lin      2024-10-11  4300  			interconnect-names = "srt_qos", "hrt_qos";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4301  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4302  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4303  		disp_ovl1_blender0: blender@32cd0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4304  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4305  			reg = <0 0x32cd0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4306  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4307  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4308  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4309  		disp_ovl1_blender1: blender@32ce0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4310  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4311  			reg = <0 0x32ce0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4312  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER1_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4313  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4314  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4315  		disp_ovl1_blender2: blender@32cf0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4316  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4317  			reg = <0 0x32cf0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4318  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4319  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4320  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4321  		disp_ovl1_blender3: blender@32d00000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4322  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4323  			reg = <0 0x32d00000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4324  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4325  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4326  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4327  		disp_ovl1_blender4: blender@32d10000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4328  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4329  			reg = <0 0x32d10000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4330  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4331  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4332  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4333  		disp_ovl1_blender5: blender@32d20000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4334  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4335  			reg = <0 0x32d20000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4336  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4337  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4338  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4339  		disp_ovl1_blender6: blender@32d30000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4340  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4341  			reg = <0 0x32d30000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4342  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4343  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4344  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4345  		disp_ovl1_blender7: blender@32d40000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4346  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4347  			reg = <0 0x32d40000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4348  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER7_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4349  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4350  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4351  		disp_ovl1_blender8: blender@32d50000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4352  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4353  			reg = <0 0x32d50000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4354  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER8_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4355  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4356  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4357  		disp_ovl1_blender9: blender@32d60000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4358  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4359  			reg = <0 0x32d60000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4360  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER9_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4361  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4362  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4363  		disp_ovl1_outproc0: outproc@32d70000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4364  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4365  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4366  			interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH 0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4367  			reg = <0 0x32d70000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4368  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4369  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4370  		disp_ovl1_outproc1: outproc@32d80000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4371  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4372  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC1_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4373  			reg = <0 0x32d80000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4374  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4375  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4376  		disp_ovl1_outproc2: outproc@32d90000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4377  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4378  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4379  			reg = <0 0x32d90000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4380  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4381  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4382  		disp_ovl1_outproc3: outproc@32da0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4383  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4384  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4385  			reg = <0 0x32da0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4386  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4387  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4388  		disp_ovl1_outproc4: outproc@32db0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4389  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4390  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4391  			reg = <0 0x32db0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4392  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4393  
fe693c3f6e9a12 Nancy Lin      2024-03-23  4394  		disp_ovl1_outproc5: outproc@32dc0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  4395  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  4396  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4397  			reg = <0 0x32dc0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  4398  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  4399  
5ea44a544d5f55 Yong Wu        2024-02-04  4400  		smi_larb34: larb@32e60000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4401  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4402  			reg = <0 0x32e60000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4403  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4404  			clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4405  				 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4406  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4407  			mediatek,smi = <&smi_mdp_dram_sub_comm3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4408  			mediatek,larb-id = <34>;
5ea44a544d5f55 Yong Wu        2024-02-04  4409  			larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4410  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4411  
5ea44a544d5f55 Yong Wu        2024-02-04  4412  		smi_larb35: larb@32e70000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4413  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4414  			reg = <0 0x32e70000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4415  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4416  			clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4417  				 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4418  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4419  			mediatek,smi = <&smi_mdp_dram_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4420  			mediatek,larb-id = <35>;
5ea44a544d5f55 Yong Wu        2024-02-04  4421  			larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4422  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4423  
5ea44a544d5f55 Yong Wu        2024-02-04  4424  		smi_larb36: larb@32e80000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4425  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4426  			reg = <0 0x32e80000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4427  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4428  			clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4429  				 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4430  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4431  			mediatek,smi = <&smi_disp_dram_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4432  			mediatek,larb-id = <36>;
5ea44a544d5f55 Yong Wu        2024-02-04  4433  			larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4434  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4435  
5ea44a544d5f55 Yong Wu        2024-02-04  4436  		smi_larb37: larb@32e90000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4437  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4438  			reg = <0 0x32e90000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4439  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4440  			clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4441  				 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4442  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4443  			mediatek,smi = <&smi_disp_dram_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4444  			mediatek,larb-id = <37>;
5ea44a544d5f55 Yong Wu        2024-02-04  4445  			larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4446  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4447  
f5d71366577c8d Yunfei Dong    2024-07-11  4448  		video_codec: video@36000000 {
f5d71366577c8d Yunfei Dong    2024-07-11  4449  			compatible = "mediatek,mt8196-vcodec-dec";
f5d71366577c8d Yunfei Dong    2024-07-11  4450  			mediatek,vcp = <&vcp>;
f5d71366577c8d Yunfei Dong    2024-07-11  4451  			iommus = <&mm_smmu 177>;
f5d71366577c8d Yunfei Dong    2024-07-11  4452  			#address-cells = <2>;
f5d71366577c8d Yunfei Dong    2024-07-11  4453  			#size-cells = <2>;
f5d71366577c8d Yunfei Dong    2024-07-11  4454  			reg = <0 0x36000000 0 0x1000>,
f5d71366577c8d Yunfei Dong    2024-07-11  4455  				<0 0x36098000 0 0x1000>;
f5d71366577c8d Yunfei Dong    2024-07-11  4456  			ranges = <0 0 0 0x36000000 0 0x26000>;
f5d71366577c8d Yunfei Dong    2024-07-11  4457  
f5d71366577c8d Yunfei Dong    2024-07-11  4458  			video-codec@10000 {
f5d71366577c8d Yunfei Dong    2024-07-11  4459  				compatible = "mediatek,mtk-vcodec-lat";
f5d71366577c8d Yunfei Dong    2024-07-11  4460  				reg = <0 0x10000 0 0x800>;
f5d71366577c8d Yunfei Dong    2024-07-11  4461  				interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4462  
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4463  				mediatek,larbs = <&smi_larb5 &smi_larb6>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4464  				operating-points-v2 = <&opp_table_vdec>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4465  
f5d71366577c8d Yunfei Dong    2024-07-11  4466  				clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
f5d71366577c8d Yunfei Dong    2024-07-11  4467  					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
f5d71366577c8d Yunfei Dong    2024-07-11  4468  					 <&vdec_soc_gcon_base_clk CLK_VDE1_LAT_CKEN>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4469  					 <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4470  					 <&mmdvfs_mux MMDVFS_USER_VDEC>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4471  				clock-names = "sel", "vdec", "lat", "top", "mmdvfs_clk";
f5d71366577c8d Yunfei Dong    2024-07-11  4472  				assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
f5d71366577c8d Yunfei Dong    2024-07-11  4473  				assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4474  
f5d71366577c8d Yunfei Dong    2024-07-11  4475  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4476  
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4477  				interconnects = <&mmqos SLAVE_LARB(4) &mmqos SLAVE_COMMON(1)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4478  						<&mmqos SLAVE_LARB(50) &mmqos SLAVE_COMMON(1)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4479  						<&mmqos SLAVE_LARB(5) &mmqos SLAVE_COMMON(0)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4480  						<&mmqos SLAVE_LARB(51) &mmqos SLAVE_COMMON(0)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4481  						<&mmqos SLAVE_LARB(6) &mmqos SLAVE_COMMON(1)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4482  						<&mmqos SLAVE_LARB(52) &mmqos SLAVE_COMMON(1)>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4483  				interconnect-names = "path_larb4_r", "path_larb50_w",
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4484  						     "path_larb5_r", "path_larb51_w",
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4485  						     "path_larb6_r", "path_larb52_w";
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4486  
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4487  				bandwidth-larb-cnt = <6>;
f5d71366577c8d Yunfei Dong    2024-07-11  4488  			};
f5d71366577c8d Yunfei Dong    2024-07-11  4489  
f5d71366577c8d Yunfei Dong    2024-07-11  4490  			video-codec@25000 {
f5d71366577c8d Yunfei Dong    2024-07-11  4491  				compatible = "mediatek,mtk-vcodec-core";
f5d71366577c8d Yunfei Dong    2024-07-11  4492  				reg = <0 0x25000 0 0x1000>;		/* VDEC_CORE_MISC */
f5d71366577c8d Yunfei Dong    2024-07-11  4493  				interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4494  
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4495  				mediatek,larbs = <&smi_larb4>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4496  				operating-points-v2 = <&opp_table_vdec>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4497  
f5d71366577c8d Yunfei Dong    2024-07-11  4498  				clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
f5d71366577c8d Yunfei Dong    2024-07-11  4499  					 <&vdec_gcon_base_clk CLK_VDE2_LAT_CKEN>,
f5d71366577c8d Yunfei Dong    2024-07-11  4500  					 <&vdec_gcon_base_clk CLK_VDE2_VDEC_CKEN>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4501  					 <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4502  					 <&mmdvfs_mux MMDVFS_USER_VDEC>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4503  				clock-names = "sel", "vdec", "lat", "top", "mmdvfs_clk";
f5d71366577c8d Yunfei Dong    2024-07-11  4504  				assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
f5d71366577c8d Yunfei Dong    2024-07-11  4505  				assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4506  
f5d71366577c8d Yunfei Dong    2024-07-11  4507  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4508  
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4509  				interconnects = <&mmqos SLAVE_LARB(4) &mmqos SLAVE_COMMON(1)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4510  						<&mmqos SLAVE_LARB(50) &mmqos SLAVE_COMMON(1)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4511  						<&mmqos SLAVE_LARB(5) &mmqos SLAVE_COMMON(0)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4512  						<&mmqos SLAVE_LARB(51) &mmqos SLAVE_COMMON(0)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4513  						<&mmqos SLAVE_LARB(6) &mmqos SLAVE_COMMON(1)>,
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4514  						<&mmqos SLAVE_LARB(52) &mmqos SLAVE_COMMON(1)>;
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4515  				interconnect-names = "path_larb4_r", "path_larb50_w",
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4516  						     "path_larb5_r", "path_larb51_w",
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4517  						     "path_larb6_r", "path_larb52_w";
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4518  
58f3ab82a49fc5 Yunfei Dong    2025-03-05  4519  				bandwidth-larb-cnt = <6>;
f5d71366577c8d Yunfei Dong    2024-07-11  4520  			};
f5d71366577c8d Yunfei Dong    2024-07-11  4521  		};
f5d71366577c8d Yunfei Dong    2024-07-11  4522  
5ea44a544d5f55 Yong Wu        2024-02-04  4523  		smi_larb5: larb@3600d000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4524  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4525  			reg = <0 0x3600d000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4526  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4527  			clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
5ea44a544d5f55 Yong Wu        2024-02-04  4528  				 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4529  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4530  			mediatek,smi = <&smi_disp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4531  			mediatek,larb-id = <5>;
5ea44a544d5f55 Yong Wu        2024-02-04  4532  			larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4533  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4534  
5ea44a544d5f55 Yong Wu        2024-02-04  4535  		smi_larb6: larb@3600e000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4536  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4537  			reg = <0 0x3600e000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4538  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4539  			clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
5ea44a544d5f55 Yong Wu        2024-02-04  4540  				 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4541  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4542  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4543  			mediatek,larb-id = <6>;
5ea44a544d5f55 Yong Wu        2024-02-04  4544  			larb-port-real-time-type = <1 1 1>;
3a88be54312101 Xavier Chang   2024-01-08  4545  		};
3a88be54312101 Xavier Chang   2024-01-08  4546  
3a88be54312101 Xavier Chang   2024-01-08  4547  		vdec_soc_gcon_base_clk: syscon@3600f000 {
3a88be54312101 Xavier Chang   2024-01-08  4548  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4549  			compatible = "mediatek,mt8196-vdecsys-soc", "mediatek,mt8196-vdecsys_soc", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4550  			reg = <0 0x3600f000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4551  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4552  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
3a88be54312101 Xavier Chang   2024-01-08  4553  		};
3a88be54312101 Xavier Chang   2024-01-08  4554  
5ea44a544d5f55 Yong Wu        2024-02-04  4555  		smi_larb4: larb@3602e000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4556  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4557  			reg = <0 0x3602e000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4558  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4559  			clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
5ea44a544d5f55 Yong Wu        2024-02-04  4560  				 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4561  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4562  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4563  			mediatek,larb-id = <4>;
5ea44a544d5f55 Yong Wu        2024-02-04  4564  			larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4565  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4566  
3a88be54312101 Xavier Chang   2024-01-08  4567  		vdec_gcon_base_clk: syscon@3602f000 {
3a88be54312101 Xavier Chang   2024-01-08  4568  			compatible = "mediatek,mt8196-vdecsys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4569  			reg = <0 0x3602f000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4570  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4571  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
3a88be54312101 Xavier Chang   2024-01-08  4572  		};
3a88be54312101 Xavier Chang   2024-01-08  4573  
3a88be54312101 Xavier Chang   2024-01-08  4574  		venc_gcon_clk: syscon@38000000 {
3a88be54312101 Xavier Chang   2024-01-08  4575  			compatible = "mediatek,mt8196-vencsys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4576  			reg = <0 0x38000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4577  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  4578  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4579  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
3a88be54312101 Xavier Chang   2024-01-08  4580  		};
3a88be54312101 Xavier Chang   2024-01-08  4581  
5ea44a544d5f55 Yong Wu        2024-02-04  4582  		smi_larb7: larb@38010000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4583  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4584  			reg = <0 0x38010000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4585  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4586  			clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4587  				 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4588  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4589  			mediatek,smi = <&smi_disp_venc_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4590  			mediatek,larb-id = <7>;
5ea44a544d5f55 Yong Wu        2024-02-04  4591  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4592  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4593  
9e44a48e129d11 Irui Wang      2024-07-19  4594  		venc: video-codec@38020000 {
9e44a48e129d11 Irui Wang      2024-07-19  4595  			compatible = "mediatek,mt8196-vcodec-enc";
9e44a48e129d11 Irui Wang      2024-07-19  4596  			reg = <0 0x38020000 0 0x6000>;
9e44a48e129d11 Irui Wang      2024-07-19  4597  			mediatek,vcp = <&vcp>;
9e44a48e129d11 Irui Wang      2024-07-19  4598  			iommus = <&mm_smmu 176>;
9e44a48e129d11 Irui Wang      2024-07-19  4599  			interrupts = <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH 0>;
73a3ae202aada1 Irui Wang      2024-11-23  4600  			clocks = <&venc_gcon_clk CLK_VEN1_CKE1_VENC>,
73a3ae202aada1 Irui Wang      2024-11-23  4601  				 <&mmdvfs_mux MMDVFS_USER_VENC>;
73a3ae202aada1 Irui Wang      2024-11-23  4602  			clock-names = "venc_sel", "mmdvfs_clk";
9e44a48e129d11 Irui Wang      2024-07-19  4603  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
73a3ae202aada1 Irui Wang      2024-11-23  4604  			operating-points-v2 = <&opp_table_venc>;
73a3ae202aada1 Irui Wang      2024-11-23  4605  			interconnects = <&mmqos SLAVE_LARB(7) &mmqos SLAVE_COMMON(0)>,
73a3ae202aada1 Irui Wang      2024-11-23  4606  					<&mmqos SLAVE_LARB(53) &mmqos SLAVE_COMMON(0)>;
73a3ae202aada1 Irui Wang      2024-11-23  4607  			interconnect-names = "path_larb7_r", "path_larb53_w";
73a3ae202aada1 Irui Wang      2024-11-23  4608  			mediatek,vencsys = <&venc_gcon_clk>;
9e44a48e129d11 Irui Wang      2024-07-19  4609  		};
9e44a48e129d11 Irui Wang      2024-07-19  4610  
5ea44a544d5f55 Yong Wu        2024-02-04  4611  		smi_disp_venc_sub_comm0: smi-sub-comm@38070000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4612  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4613  			reg = <0 0x38070000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4614  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4615  			clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4616  				 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4617  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4618  			mediatek,smi = <&smi_disp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4619  			mediatek,common-id = <15>;
5ea44a544d5f55 Yong Wu        2024-02-04  4620  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4621  
5ea44a544d5f55 Yong Wu        2024-02-04  4622  		smi_larb41: larb@38090000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4623  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4624  			reg = <0 0x38090000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4625  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4626  			clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4627  				 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4628  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4629  			mediatek,smi = <&smi_disp_venc_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4630  			mediatek,larb-id = <41>;
5ea44a544d5f55 Yong Wu        2024-02-04  4631  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4632  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4633  
3a88be54312101 Xavier Chang   2024-01-08  4634  		venc_gcon_core1_clk: syscon@38800000 {
3a88be54312101 Xavier Chang   2024-01-08  4635  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4636  			compatible = "mediatek,mt8196-vencsys-c1", "mediatek,mt8196-vencsys_c1", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4637  			reg = <0 0x38800000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4638  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  4639  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4640  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
3a88be54312101 Xavier Chang   2024-01-08  4641  		};
3a88be54312101 Xavier Chang   2024-01-08  4642  
5ea44a544d5f55 Yong Wu        2024-02-04  4643  		smi_larb8: larb@38810000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4644  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4645  			reg = <0 0x38810000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4646  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4647  			clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4648  				 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4649  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4650  			mediatek,smi = <&smi_mdp_venc_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4651  			mediatek,larb-id = <8>;
5ea44a544d5f55 Yong Wu        2024-02-04  4652  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4653  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4654  
5ea44a544d5f55 Yong Wu        2024-02-04  4655  
5ea44a544d5f55 Yong Wu        2024-02-04  4656  		smi_mdp_venc_sub_comm1: smi-sub-comm@38870000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4657  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4658  			reg = <0 0x38870000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4659  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4660  			clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4661  				 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4662  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4663  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4664  			mediatek,common-id = <16>;
5ea44a544d5f55 Yong Wu        2024-02-04  4665  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4666  
5ea44a544d5f55 Yong Wu        2024-02-04  4667  		smi_larb42: larb@38890000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4668  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4669  			reg = <0 0x38890000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4670  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4671  			clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4672  				 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4673  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4674  			mediatek,smi = <&smi_mdp_venc_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4675  			mediatek,larb-id = <42>;
5ea44a544d5f55 Yong Wu        2024-02-04  4676  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4677  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4678  
3a88be54312101 Xavier Chang   2024-01-08  4679  		venc_gcon_core2_clk: syscon@38c00000 {
3a88be54312101 Xavier Chang   2024-01-08  4680  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4681  			compatible = "mediatek,mt8196-vencsys-c2", "mediatek,mt8196-vencsys_c2", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4682  			reg = <0 0x38c00000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4683  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  4684  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4685  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
3a88be54312101 Xavier Chang   2024-01-08  4686  		};
3a88be54312101 Xavier Chang   2024-01-08  4687  
5ea44a544d5f55 Yong Wu        2024-02-04  4688  		smi_larb24: larb@38c10000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4689  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4690  			reg = <0 0x38c10000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4691  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4692  			clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4693  				 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4694  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4695  			mediatek,smi = <&smi_mdp_venc_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4696  			mediatek,larb-id = <24>;
5ea44a544d5f55 Yong Wu        2024-02-04  4697  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4698  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4699  
5ea44a544d5f55 Yong Wu        2024-02-04  4700  		smi_mdp_venc_sub_comm2: smi-sub-comm@38c70000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4701  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4702  			reg = <0 0x38c70000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4703  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4704  			clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4705  				 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4706  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4707  			mediatek,smi = <&smi_mdp_venc_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4708  			mediatek,common-id = <18>;
5ea44a544d5f55 Yong Wu        2024-02-04  4709  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4710  
5ea44a544d5f55 Yong Wu        2024-02-04  4711  		smi_larb47: larb@38c90000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4712  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4713  			reg = <0 0x38c90000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4714  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4715  			clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4716  				 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4717  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4718  			mediatek,smi = <&smi_mdp_venc_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4719  			mediatek,larb-id = <47>;
5ea44a544d5f55 Yong Wu        2024-02-04  4720  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4721  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4722  
3a88be54312101 Xavier Chang   2024-01-08  4723  		mdpsys_config_clk: syscon@3e000000 {
3a88be54312101 Xavier Chang   2024-01-08  4724  			compatible = "mediatek,mt8196-mdpsys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4725  			reg = <0 0x3e000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4726  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4727  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
3a88be54312101 Xavier Chang   2024-01-08  4728  		};
3a88be54312101 Xavier Chang   2024-01-08  4729  
5ea44a544d5f55 Yong Wu        2024-02-04  4730  		smi_larb2: larb@3e030000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4731  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4732  			reg = <0 0x3e030000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4733  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4734  			clocks = <&mdpsys_config_clk CLK_MDP_SMI0_SMI>, <&mdpsys_config_clk CLK_MDP_SMI0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4735  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4736  			mediatek,smi = <&smi_disp_dram_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4737  			mediatek,larb-id = <2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4738  			larb-port-real-time-type = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4739  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4740  
3a88be54312101 Xavier Chang   2024-01-08  4741  		mdpsys1_config_clk: syscon@3e400000 {
3a88be54312101 Xavier Chang   2024-01-08  4742  			compatible = "mediatek,mt8196-mdpsys1", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4743  			reg = <0 0x3e400000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4744  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4745  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
3a88be54312101 Xavier Chang   2024-01-08  4746  		};
3a88be54312101 Xavier Chang   2024-01-08  4747  
5ea44a544d5f55 Yong Wu        2024-02-04  4748  		smi_larb3: larb@3e430000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4749  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4750  			reg = <0 0x3e430000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4751  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4752  			clocks = <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>, <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4753  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4754  			mediatek,smi = <&smi_mdp_dram_sub_comm3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4755  			mediatek,larb-id = <3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4756  			larb-port-real-time-type = <2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4757  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4758  
3a88be54312101 Xavier Chang   2024-01-08  4759  		disp_vdisp_ao_config_clk: syscon@3e800000 {
fd00cab3fe36e4 Xavier Chang   2025-01-09  4760  			compatible = "mediatek,mt8196-vdisp-ao", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4761  			reg = <0 0x3e800000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4762  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  4763  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  4764  		};
3a88be54312101 Xavier Chang   2024-01-08  4765  
5ea44a544d5f55 Yong Wu        2024-02-04  4766  		smi_disp_dram_sub_comm0: smi-sub-comm@3e810000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4767  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4768  			reg = <0 0x3e810000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4769  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
5ea44a544d5f55 Yong Wu        2024-02-04  4770  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4771  					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4772  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4773  			mediatek,smi = <&smi_disp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4774  			mediatek,common-id = <9>;
5ea44a544d5f55 Yong Wu        2024-02-04  4775  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4776  
5ea44a544d5f55 Yong Wu        2024-02-04  4777  		smi_disp_dram_sub_comm1: smi-sub-comm@3e820000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4778  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4779  			reg = <0 0x3e820000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4780  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
5ea44a544d5f55 Yong Wu        2024-02-04  4781  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4782  					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4783  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4784  			mediatek,smi = <&smi_disp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4785  			mediatek,common-id = <10>;
5ea44a544d5f55 Yong Wu        2024-02-04  4786  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4787  
5ea44a544d5f55 Yong Wu        2024-02-04  4788  		smi_mdp_dram_sub_comm2: smi-sub-comm@3e830000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4789  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4790  			reg = <0 0x3e830000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4791  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
5ea44a544d5f55 Yong Wu        2024-02-04  4792  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4793  					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4794  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4795  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4796  			mediatek,common-id = <11>;
5ea44a544d5f55 Yong Wu        2024-02-04  4797  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4798  
5ea44a544d5f55 Yong Wu        2024-02-04  4799  		smi_mdp_dram_sub_comm3: smi-sub-comm@3e840000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4800  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4801  			reg = <0 0x3e840000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4802  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
5ea44a544d5f55 Yong Wu        2024-02-04  4803  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4804  					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4805  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4806  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4807  			mediatek,common-id = <12>;
5ea44a544d5f55 Yong Wu        2024-02-04  4808  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4809  
20e31499fd9223 Nancy Lin      2024-10-11  4810  		disp_dpc: disp-dpc@3e8f0000 {
20e31499fd9223 Nancy Lin      2024-10-11  4811  			compatible = "mediatek,mt8196-disp-dpc";
20e31499fd9223 Nancy Lin      2024-10-11  4812  			reg = <0 0x3e8f0000 0 0x1000>;
20e31499fd9223 Nancy Lin      2024-10-11  4813  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
20e31499fd9223 Nancy Lin      2024-10-11  4814  			operating-points-v2 = <&opp_table_disp>;
20e31499fd9223 Nancy Lin      2024-10-11  4815  		};
20e31499fd9223 Nancy Lin      2024-10-11  4816  
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4817  		dp_tx: dp-tx@3ec00000 {
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4818  			compatible = "mediatek,mt8196-dp-tx";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4819  			reg = <0 0x3ec00000 0 0x5000>,
3eb254258f2631 Jason-jh Lin   2025-01-16  4820  			      <0 0x128b0000 0 0x1500>,
3eb254258f2631 Jason-jh Lin   2025-01-16  4821  			      <0 0x1002d600 0 0x4>,
3eb254258f2631 Jason-jh Lin   2025-01-16  4822  			      <0 0x31b50078 0 0x4>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4823  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4824  					<&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4825  			power-domain-names = "pd_dp_tx", "pd_dp_phy";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4826  			interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH 0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4827  			dptx,phy-params = <0x221c1814 0x24241e18 0x0000302a
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4828  					   0x0e080400 0x000c0600 0x00000006>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4829  			#phy-cells = <0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4830  			clocks = <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4831  				 <&cksys_clk CLK_CK_TCK_26M_MX9>;
3eb254258f2631 Jason-jh Lin   2025-01-16  4832  			clock-names = "mux_dp",
3eb254258f2631 Jason-jh Lin   2025-01-16  4833  				      "ck_26m";
17ed593debee68 Jason-jh Lin   2025-03-12  4834  			mediatek,vdisp-ao = <&disp_vdisp_ao_config_clk>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4835  		};
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4836  
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4837  		edp_tx: edp-tx@3ec40000 {
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4838  			compatible = "mediatek,mt8196-edp-tx";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4839  			reg = <0 0x3ec40000 0 0x4000>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4840  			      <0 0x130a0000 0 0x1500>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4841  			      <0 0x31b50074 0 0x4>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4842  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4843  			clocks = <&cksys_gp2_clk CLK_CK2_DVO_SEL>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4844  			clock-names = "power";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4845  			max-linkrate-mhz = <8100>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4846  			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH 0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4847  			status = "disabled";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4848  		};
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4849  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4850  		gpu: gpu@48000000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4851  			compatible = "mediatek,mali-mt8196", "mediatek,mali";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4852  			reg = <0 0x48000000 0 0x480000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4853  			interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4854  				     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4855  				     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4856  				     <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4857  				     <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4858  				     <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH 0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4859  			interrupt-names = "job",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4860  					  "mmu",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4861  					  "gpu",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4862  					  "event",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4863  					  "pwr",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4864  					  "gpueb_mbox1";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4865  			l2-hash-values = <0xb 0xe 0x0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4866  			physical-memory-group-manager = <&mgm>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4867  			protected-memory-allocator = <&gpu_protected_memory_allocator>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4868  			operating-points-v2 = <&gpu_mali_opp>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4869  			#cooling-cells = <2>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4870  			ged-supply = <&ged>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4871  			system-coherency = <31>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4872  			sleep-mode-enable;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4873  			firmware-idle-hysteresis-time-us = <0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4874  			default-glb-pwroff-timeout-us = <10>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4875  			autosuspend-delay-ms = <10>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4876  			adaptive-power-policy = <2>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4877  			reset-exception-mask = <0x0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4878  			iter-trace-enable = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4879  			gpu-frame-base-optimize = <1>;
aa38e44072143a Andy Hsu       2025-02-14  4880  			dynamic-power-coefficient = <19259>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4881  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4882  			pbha {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4883  				propagate-bits = /bits/ 8 <0xf>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4884  			};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4885  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4886  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4887  		gpufreq: gpufreq@48500000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4888  			compatible = "mediatek,gpufreq";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4889  			reg = <0 0x48500000 0 0x1000>,   /* MFG_TOP_CONFIG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4890  			      <0 0x48600000 0 0x200000>, /* MFG_SMMU */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4891  			      <0 0x48800000 0 0x1000>,   /* MFG_VGPU_BUS_DBG_TRACKER */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4892  			      <0 0x4b190000 0 0x20000>,  /* MFG_GPUEB_BUS_DBG_TRACKER */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4893  			      <0 0x4b800000 0 0x10000>,  /* MFG_RPC */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4894  			      <0 0x4b810000 0 0x400>,    /* MFG_PLL */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4895  			      <0 0x4b810400 0 0x400>,    /* MFG_PLL_SC0 */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4896  			      <0 0x4b810800 0 0x400>,    /* MFG_PLL_SC1 */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4897  			      <0 0x4b840000 0 0x1000>,   /* MFG_HBVC */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4898  			      <0 0x4b860000 0 0x1000>,   /* MFG_VCORE_AO_CFG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4899  			      <0 0x4b8b0000 0 0x1000>,   /* MFG_VCORE_DEVAPC */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4900  			      <0 0x4b900000 0 0x1000>,   /* MFG_VCORE_BUS_DBG_TRACKER */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4901  			      <0 0x0c000000 0 0x1000>,   /* MCUSYS_PAR_WRAP */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4902  			      <0 0x10000000 0 0x1000>,   /* CKSYS */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4903  			      <0 0x10404000 0 0x1000>,   /* NTH_EMICFG_AO_MEM */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4904  			      <0 0x10416000 0 0x1000>,   /* NTH_EMI_AO_DEBUG_CTRL */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4905  			      <0 0x10425000 0 0x1000>,   /* NTH_EMICFG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4906  			      <0 0x10469000 0 0x1000>,   /* EMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4907  			      <0 0x10504000 0 0x1000>,   /* STH_EMICFG_AO_MEM */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4908  			      <0 0x10516000 0 0x1000>,   /* STH_EMI_AO_DEBUG_CTRL */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4909  			      <0 0x10525000 0 0x1000>,   /* STH_EMICFG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4910  			      <0 0x10569000 0 0x1000>,   /* SUB_EMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4911  			      <0 0x10621000 0 0x1000>,   /* SEMI_MI32_SMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4912  			      <0 0x10622000 0 0x1000>,   /* NEMI_MI32_SMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4913  			      <0 0x10623000 0 0x1000>,   /* SEMI_MI33_SMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4914  			      <0 0x10624000 0 0x1000>,   /* NEMI_MI33_SMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4915  			      <0 0x10644000 0 0x1000>,   /* INFRA_AO_DEBUG_CTRL */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4916  			      <0 0x10645000 0 0x1000>,   /* EMI_INFRA_AO_BCRM */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4917  			      <0 0x10646000 0 0x1000>,   /* EMI_INFRA_AO_MEM */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4918  			      <0 0x10648000 0 0x1000>,   /* EMI_INFRA_CFG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4919  			      <0 0x1c004000 0 0x10000>;  /* SLEEP */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4920  			reg-names = "mfg_top_config",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4921  				    "mfg_smmu",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4922  				    "mfg_vgpu_bus_trk",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4923  				    "mfg_gpueb_bus_trk",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4924  				    "mfg_rpc",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4925  				    "mfg_pll",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4926  				    "mfg_pll_sc0",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4927  				    "mfg_pll_sc1",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4928  				    "mfg_hbvc",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4929  				    "mfg_vcore_ao_cfg",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4930  				    "mfg_vcore_devapc",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4931  				    "mfg_vcore_bus_trk",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4932  				    "mcusys_par_wrap",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4933  				    "cksys",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4934  				    "nth_emicfg_ao_mem",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4935  				    "nth_emi_ao_debug_ctrl",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4936  				    "nth_emicfg",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4937  				    "emi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4938  				    "sth_emicfg_ao_mem",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4939  				    "sth_emi_ao_debug_ctrl",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4940  				    "sth_emicfg",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4941  				    "sub_emi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4942  				    "semi_mi32_smi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4943  				    "nemi_mi32_smi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4944  				    "semi_mi33_smi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4945  				    "nemi_mi33_smi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4946  				    "infra_ao_debug_ctrl",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4947  				    "emi_infra_ao_bcrm",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4948  				    "emi_infra_ao_mem",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4949  				    "emi_infra_cfg",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4950  				    "sleep";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4951  			gpufreq-wrapper-supply = <&gpufreq_wrapper>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4952  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4953  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4954  		gpupdma: gpupdma@48540000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4955  			compatible = "mediatek,gpupdma";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4956  			reg = <0 0x48540000 0 0x2000>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4957  			      <0 0x4b800704 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4958  			      <0 0x13f840 0 0x28>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4959  			ringbuf-page-order = <3>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4960  			config-mode = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4961  			hw-semaphore-bit = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4962  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4963  
d64301076e1f02 Yong Wu        2024-02-29  4964  		gpu_smmu: iommu@48600000 {
d64301076e1f02 Yong Wu        2024-02-29  4965  			#iommu-cells = <1>;
d64301076e1f02 Yong Wu        2024-02-29  4966  			compatible = "mediatek,mt8196-gpu-smmu", "arm,smmu-v3";
d64301076e1f02 Yong Wu        2024-02-29  4967  			reg = <0 0x48600000 0 0x1e0000>;
d64301076e1f02 Yong Wu        2024-02-29  4968  			interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
d64301076e1f02 Yong Wu        2024-02-29  4969  			interrupt-names = "combined";
d64301076e1f02 Yong Wu        2024-02-29  4970  			status = "disabled";
d64301076e1f02 Yong Wu        2024-02-29  4971  		};
d64301076e1f02 Yong Wu        2024-02-29  4972  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4973  		gpueb: gpueb@4b000000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4974  			compatible = "mediatek,gpueb";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4975  			reg = <0 0x4b000000 0 0xa0000>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4976  			      <0 0x4b09fd00 0 0x80>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4977  			      <0 0x4b140100 0 0x200>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4978  			      <0 0x4b120000 0 0x100>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4979  			      <0 0x4b09fd80 0 0x280>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4980  			      <0 0x4b170008 0 0x4>,  /* arbitrary addr to avoid error msg */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4981  			      <0 0x4b170004 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4982  			      <0 0x4b170074 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4983  			      <0 0x4b170000 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4984  			      <0 0x4b170078 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4985  			      <0 0x4b800504 0 0x4>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4986  			reg-names = "gpueb_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4987  			            "gpueb_gpr_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4988  			            "gpueb_cfgreg_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4989  			            "gpueb_intc_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4990  			            "mbox0_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4991  			            "mbox0_init", /* dummy input for mtk_mbox_probe */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4992  			            "mbox0_set",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4993  			            "mbox0_clr",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4994  			            "mbox0_send",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4995  			            "mbox0_recv",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4996  			            "mfg0_pwr_con";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4997  			interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4998  			interrupt-names = "mbox0";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4999  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5000  			gpueb-support;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5001  			ghpm-support;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5002  			mbox-count = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5003  			mbox-size = <160>; /* 160 slot * 4 = 640 byte */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5004  			slot-size = <4>;   /* 1 slot = 4 bytes */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5005  			ts-mbox = <0>; /* mbox for timersync */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5006  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5007  			/* id, mbox, send_size */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5008  			send-table = <0 0 4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5009  				     <1 0 8>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5010  				     <2 0 3>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5011  				     <3 0 6>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5012  				     <4 0 9>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5013  				     <5 0 4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5014  				     <6 0 6>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5015  				     <7 0 6>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5016  				     <8 0 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5017  				     <9 0 4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5018  				     <10 0 4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5019  				     <11 0 1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5020  			send-name-table = "IPI_ID_FAST_DVFS_EVENT",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5021  					  "IPI_ID_GPUFREQ",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5022  					  "IPI_ID_SLEEP",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5023  					  "IPI_ID_TIMER",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5024  					  "IPI_ID_FHCTL",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5025  					  "IPI_ID_CCF",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5026  					  "IPI_ID_GPUMPU",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5027  					  "IPI_ID_FAST_DVFS",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5028  					  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5029  					  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5030  					  "IPI_ID_BRISKET",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5031  					  "IPI_ID_PPB";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5032  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5033  			/* id, mbox, recv_size, recv_opt, cb_ctx_opt */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5034  			recv-table = <0 0 4 0 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5035  				     <1 0 8 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5036  				     <2 0 1 0 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5037  				     <3 0 1 0 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5038  				     <4 0 1 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5039  				     <5 0 4 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5040  				     <6 0 1 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5041  				     <7 0 6 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5042  				     <8 0 4 0 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5043  				     <9 0 1 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5044  				     <10 0 4 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5045  				     <11 0 1 1 1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5046  			recv-name-table = "IPI_ID_FAST_DVFS_EVENT",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5047  					  "IPI_ID_GPUFREQ",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5048  					  "IPI_ID_SLEEP",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5049  					  "IPI_ID_TIMER",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5050  					  "IPI_ID_FHCTL",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5051  					  "IPI_ID_CCF",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5052  					  "IPI_ID_GPUMPU",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5053  					  "IPI_ID_FAST_DVFS",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5054  					  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5055  					  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5056  					  "IPI_ID_BRISKET",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5057  					  "IPI_ID_PPB";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5058  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5059  			gpueb-mem-table = <0 0x4000>,   /* 16KB */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5060  					  <1 0x180000>; /* 1.5MB */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5061  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5062  			gpueb-mem-name-table = "MEM_ID_GPUFREQ", /* GPUFREQ */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5063  					       "MEM_ID_LOG";     /* LOGGER */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5064  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5065  
3a88be54312101 Xavier Chang   2024-01-08  5066  		mfgpll_pll_ctrl_clk: syscon@4b810000 {
3a88be54312101 Xavier Chang   2024-01-08  5067  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  5068  			compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "mediatek,mt8196-mfgpll_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  5069  			reg = <0 0x4b810000 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  5070  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  5071  		};
3a88be54312101 Xavier Chang   2024-01-08  5072  
3a88be54312101 Xavier Chang   2024-01-08  5073  		mfgpll_sc0_pll_ctrl_clk: syscon@4b810400 {
3a88be54312101 Xavier Chang   2024-01-08  5074  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  5075  			compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl", "mediatek,mt8196-mfgpll_sc0_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  5076  			reg = <0 0x4b810400 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  5077  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  5078  		};
3a88be54312101 Xavier Chang   2024-01-08  5079  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5080  		ghpm: ghpm@4b800000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5081  			compatible = "mediatek,ghpm";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5082  			reg =
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5083  				<0 0x4b800000 0 0x1000>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5084  				<0 0x4b860000 0 0x1000>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5085  				<0 0x4b860128 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5086  				<0 0x1c004ea8 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5087  				<0 0x1c000070 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5088  				<0 0x1c000074 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5089  				<0 0x1c000078 0 0x4>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5090  			reg-names =
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5091  				"mfg_rpc",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5092  				"mfg_vcore_ao_config",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5093  				"mfg_mt8196_e2_id_con",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5094  				"spm_mfg0_pwr_con",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5095  				"clk_cfg_6",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5096  				"clk_cfg_6_set",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5097  				"clk_cfg_6_clr";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5098  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5099  			gpueb-supply = <&gpueb>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5100  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  5101  
3a88be54312101 Xavier Chang   2024-01-08  5102  		mfgpll_sc1_pll_ctrl_clk: syscon@4b810800 {
3a88be54312101 Xavier Chang   2024-01-08  5103  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  5104  			compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl", "mediatek,mt8196-mfgpll_sc1_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  5105  			reg = <0 0x4b810800 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  5106  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  5107  		};
d64301076e1f02 Yong Wu        2024-02-29  5108  
b9408b7224ce87 Runyang Chen   2024-03-26  5109  		devapc_gpu: devapc@4b890000 {
b9408b7224ce87 Runyang Chen   2024-03-26  5110  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  5111  			reg = <0 0x4b890000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  5112  			vio-idx-num = <20>;
b9408b7224ce87 Runyang Chen   2024-03-26  5113  			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  5114  		};
b9408b7224ce87 Runyang Chen   2024-03-26  5115  
b9408b7224ce87 Runyang Chen   2024-03-26  5116  		devapc_gpu1: devapc@4b8b0000 {
b9408b7224ce87 Runyang Chen   2024-03-26  5117  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  5118  			reg = <0 0x4b8b0000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  5119  			vio-idx-num = <26>;
b9408b7224ce87 Runyang Chen   2024-03-26  5120  			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  5121  		};
b9408b7224ce87 Runyang Chen   2024-03-26  5122  
d64301076e1f02 Yong Wu        2024-02-29  5123  		apu_smmu: iommu@4c000000 {
d64301076e1f02 Yong Wu        2024-02-29  5124  			compatible = "mediatek,mt8196-apu-smmu", "arm,smmu-v3";
d64301076e1f02 Yong Wu        2024-02-29  5125  			reg = <0 0x4c000000 0 0x1e0000>;
d64301076e1f02 Yong Wu        2024-02-29  5126  			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING 0>;
d64301076e1f02 Yong Wu        2024-02-29  5127  			interrupt-names = "combined";
d64301076e1f02 Yong Wu        2024-02-29  5128  			#iommu-cells = <1>;
eedd3dc85418be Karl Li        2024-09-27  5129  			smmu-mediatek-parents = <&apu_top_3>;
eedd3dc85418be Karl Li        2024-09-27  5130  		};
eedd3dc85418be Karl Li        2024-09-27  5131  
eedd3dc85418be Karl Li        2024-09-27  5132  		apu_mailbox: mailbox@4c200000 {
eedd3dc85418be Karl Li        2024-09-27  5133  			compatible = "mediatek,mt8196-apu-mailbox";
eedd3dc85418be Karl Li        2024-09-27  5134  			reg = <0 0x4c200000 0 0xfffff>;
eedd3dc85418be Karl Li        2024-09-27  5135  			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
eedd3dc85418be Karl Li        2024-09-27  5136  			#mbox-cells = <1>;
eedd3dc85418be Karl Li        2024-09-27  5137  		};
eedd3dc85418be Karl Li        2024-09-27  5138  
eedd3dc85418be Karl Li        2024-09-27  5139  		apusys-apummu {
eedd3dc85418be Karl Li        2024-09-27  5140  			compatible = "mediatek,rv-apummu-mt8196";
eedd3dc85418be Karl Li        2024-09-27  5141  			#address-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  5142  			#size-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  5143  			apu-rv-dev = <&apusys_rv>;
eedd3dc85418be Karl Li        2024-09-27  5144  			iommus = <&apu_smmu 0xd>;
d64301076e1f02 Yong Wu        2024-02-29  5145  		};
2f2aff80fd0e0d Darren Ye      2024-04-01  5146  
e818ec0bd11a22 Kyrie Wu       2024-04-29  5147  		jpeg-decoder {
e818ec0bd11a22 Kyrie Wu       2024-04-29  5148  			compatible = "mediatek,mt8196-jpgdec";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5149  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5150  			iommus = <&mm_smmu 164>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5151  			#address-cells = <2>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5152  			#size-cells = <2>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5153  			ranges;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5154  
e818ec0bd11a22 Kyrie Wu       2024-04-29  5155  			jpgdec0: jpeg-decoder@38040000 {
e818ec0bd11a22 Kyrie Wu       2024-04-29  5156  				compatible = "mediatek,mt8196-jpgdec-hw";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5157  				reg = <0 0x38040000 0 0x10000>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5158  				interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5159  				mediatek,larbs = <&smi_larb7>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5160  				operating-points-v2 = <&opp_table_venc>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5161  				clocks = <&venc_gcon_clk CLK_VEN1_CKE3_JPGDEC_JPGDEC>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5162  				         <&mmdvfs_mux MMDVFS_USER_JPEGDEC>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5163  				clock-names = "mt_cg_venc_jpgdec",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5164  					      "mmdvfs_clk";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5165  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
f140971cf554cf Kyrie Wu       2025-04-10  5166  				mediatek,smmu-config = <&jpeg_smmu0>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5167  				interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L7_P17_JPGDEC_W)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5168  						 &mmqos SLAVE_COMMON(0)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5169  						<&mmqos MASTER_LARB_PORT(SMMU_L7_P18_JPGDEC_BS)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5170  						 &mmqos SLAVE_COMMON(0)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5171  						<&mmqos MASTER_LARB_PORT(SMMU_L7_P30_JPGDEC_HUF)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5172  						 &mmqos SLAVE_COMMON(0)>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5173  				interconnect-names = "path_jpegdec_wdma",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5174  						     "path_jpegdec_bsdma",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5175  						     "path_jpegdec_huff_offset";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5176  			};
e818ec0bd11a22 Kyrie Wu       2024-04-29  5177  
e818ec0bd11a22 Kyrie Wu       2024-04-29  5178  			jpgdec1: jpeg-decoder@38840000 {
e818ec0bd11a22 Kyrie Wu       2024-04-29  5179  				compatible = "mediatek,mt8196-jpgdec-hw";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5180  				reg = <0 0x38840000 0 0x10000>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5181  				interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5182  				mediatek,larbs = <&smi_larb8>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5183  				operating-points-v2 = <&opp_table_venc>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5184  				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE3_JPGDEC_JPGDEC>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5185  				         <&mmdvfs_mux MMDVFS_USER_JPEGDEC>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5186  				clock-names = "mt_cg_venc_jpgdec2", "mmdvfs_clk";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5187  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
f140971cf554cf Kyrie Wu       2025-04-10  5188  				mediatek,smmu-config = <&jpeg_smmu1>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5189  				interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L8_P17_JPGDEC_W)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5190  						 &mmqos SLAVE_COMMON(1)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5191  						<&mmqos MASTER_LARB_PORT(SMMU_L8_P18_JPGDEC_BS)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5192  						 &mmqos SLAVE_COMMON(1)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5193  						<&mmqos MASTER_LARB_PORT(SMMU_L8_P30_JPGDEC_HUF)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5194  						 &mmqos SLAVE_COMMON(1)>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5195  				interconnect-names = "path_jpegdec_wdma",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5196  						     "path_jpegdec_bsdma",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5197  						     "path_jpegdec_huff_offset";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5198  			};
e818ec0bd11a22 Kyrie Wu       2024-04-29  5199  		};
e818ec0bd11a22 Kyrie Wu       2024-04-29  5200  
e818ec0bd11a22 Kyrie Wu       2024-04-29  5201  		jpeg-encoder {
e818ec0bd11a22 Kyrie Wu       2024-04-29  5202  			compatible = "mediatek,mt8196-jpgenc";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5203  			power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5204  			iommus = <&mm_smmu 165>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5205  			#address-cells = <2>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5206  			#size-cells = <2>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5207  			ranges;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5208  
e818ec0bd11a22 Kyrie Wu       2024-04-29  5209  			jpgenc0: jpeg-encoder@38030000 {
e818ec0bd11a22 Kyrie Wu       2024-04-29  5210  				compatible = "mediatek,mt8196-jpgenc-hw";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5211  				reg = <0 0x38030000 0 0x10000>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5212  				interrupts = <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH 0>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5213  				clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC_JPGENC>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5214  				         <&mmdvfs_mux MMDVFS_USER_JPEGENC>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5215  				clock-names = "jpgenc", "mmdvfs_clk";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5216  				power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
f140971cf554cf Kyrie Wu       2025-04-10  5217  				mediatek,smmu-config = <&jpeg_smmu0>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5218  				mediatek,larb = <&smi_larb7>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5219  				operating-points-v2 = <&opp_table_venc>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5220  				interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L7_P7_JPGENC_YRD)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5221  						 &mmqos SLAVE_COMMON(0)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5222  						<&mmqos MASTER_LARB_PORT(SMMU_L7_P8_JPGENC_CRD)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5223  						 &mmqos SLAVE_COMMON(0)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5224  						<&mmqos MASTER_LARB_PORT(SMMU_L7_P9_JPGENC_QT)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5225  						 &mmqos SLAVE_COMMON(0)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5226  						<&mmqos MASTER_LARB_PORT(SMMU_L7_P16_JPGENC_BS)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5227  						 &mmqos SLAVE_COMMON(0)>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5228  				interconnect-names = "path_jpegenc_y_rdma",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5229  						     "path_jpegenc_c_rmda",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5230  						     "path_jpegenc_q_table",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5231  						     "path_jpegenc_bsdma";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5232  			};
e818ec0bd11a22 Kyrie Wu       2024-04-29  5233  
e818ec0bd11a22 Kyrie Wu       2024-04-29  5234  			jpgenc1: jpeg-encoder@38830000 {
e818ec0bd11a22 Kyrie Wu       2024-04-29  5235  				compatible = "mediatek,mt8196-jpgenc-hw";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5236  				reg = <0 0x38830000 0 0x10000>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5237  				interrupts = <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  5238  				clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5239  				         <&venc_gcon_core1_clk  CLK_VEN2_CKE2_JPGENC_JPGENC>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5240  					 <&mmdvfs_mux MMDVFS_USER_JPEGENC>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5241  				clock-names = "jpgenc", "jpgenc_c1", "mmdvfs_clk";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5242  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
f140971cf554cf Kyrie Wu       2025-04-10  5243  				mediatek,smmu-config = <&jpeg_smmu1>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5244  				mediatek,larb = <&smi_larb7 &smi_larb8>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5245  				operating-points-v2 = <&opp_table_venc>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5246  				interconnects = <&mmqos MASTER_LARB_PORT(SMMU_L8_P7_JPGENC_YRD)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5247  						 &mmqos SLAVE_COMMON(1)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5248  						<&mmqos MASTER_LARB_PORT(SMMU_L8_P8_JPGENC_CRD)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5249  						 &mmqos SLAVE_COMMON(1)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5250  						<&mmqos MASTER_LARB_PORT(SMMU_L8_P9_JPGENC_QT)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5251  						 &mmqos SLAVE_COMMON(1)>,
42b6d6f137ce27 Kyrie Wu       2025-03-10  5252  						<&mmqos MASTER_LARB_PORT(SMMU_L8_P16_JPGENC_BS)
42b6d6f137ce27 Kyrie Wu       2025-03-10  5253  						 &mmqos SLAVE_COMMON(1)>;
42b6d6f137ce27 Kyrie Wu       2025-03-10  5254  				interconnect-names = "path_jpegenc_y_rdma",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5255  						     "path_jpegenc_c_rmda",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5256  						     "path_jpegenc_q_table",
42b6d6f137ce27 Kyrie Wu       2025-03-10  5257  						     "path_jpegenc_bsdma";
e818ec0bd11a22 Kyrie Wu       2024-04-29  5258  			};
e818ec0bd11a22 Kyrie Wu       2024-04-29  5259  		};
e818ec0bd11a22 Kyrie Wu       2024-04-29  5260  
f140971cf554cf Kyrie Wu       2025-04-10  5261  		jpeg_smmu0: syscon@380d0000 {
f140971cf554cf Kyrie Wu       2025-04-10  5262  			compatible = "mediatek,mt8196-jpeg-smmu", "syscon";
f140971cf554cf Kyrie Wu       2025-04-10  5263  			reg = <0 0x380d0000 0 0x1000>;
f140971cf554cf Kyrie Wu       2025-04-10  5264  		};
f140971cf554cf Kyrie Wu       2025-04-10  5265  
f140971cf554cf Kyrie Wu       2025-04-10  5266  		jpeg_smmu1: syscon@388d0000 {
f140971cf554cf Kyrie Wu       2025-04-10  5267  			compatible = "mediatek,mt8196-jpeg-smmu", "syscon";
f140971cf554cf Kyrie Wu       2025-04-10  5268  			reg = <0 0x388d0000 0 0x1000>;
f140971cf554cf Kyrie Wu       2025-04-10  5269  		};
f140971cf554cf Kyrie Wu       2025-04-10  5270  
eedd3dc85418be Karl Li        2024-09-27  5271  		mtk_apu_mem_code: mtk-apu-mem-code {
eedd3dc85418be Karl Li        2024-09-27  5272  			compatible = "mediatek, apu_mem_code";
eedd3dc85418be Karl Li        2024-09-27  5273  			#address-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  5274  			#size-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  5275  			type = <1>;
eedd3dc85418be Karl Li        2024-09-27  5276  			mask = /bits/ 64 <0x00000003ffffffff>;
eedd3dc85418be Karl Li        2024-09-27  5277  			iommus = <&apu_smmu 0xb>;
eedd3dc85418be Karl Li        2024-09-27  5278  		};
eedd3dc85418be Karl Li        2024-09-27  5279  
eedd3dc85418be Karl Li        2024-09-27  5280  		mtk_apu_mem_data: mtk-apu-mem-data {
eedd3dc85418be Karl Li        2024-09-27  5281  			compatible = "mediatek, apu_mem_data";
eedd3dc85418be Karl Li        2024-09-27  5282  			#address-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  5283  			#size-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  5284  			type = <2>;
eedd3dc85418be Karl Li        2024-09-27  5285  			mask = /bits/ 64 <0x00000003ffffffff>;
eedd3dc85418be Karl Li        2024-09-27  5286  			iommus = <&apu_smmu 0xa>;
eedd3dc85418be Karl Li        2024-09-27  5287  		};
eedd3dc85418be Karl Li        2024-09-27  5288  
eedd3dc85418be Karl Li        2024-09-27  5289  		mvpu {
eedd3dc85418be Karl Li        2024-09-27  5290  			compatible = "mediatek, mt8196-mvpu";
eedd3dc85418be Karl Li        2024-09-27  5291  			core-num = <2>;
eedd3dc85418be Karl Li        2024-09-27  5292  			mask = /bits/ 64 <0x00000003ffffffff>;
eedd3dc85418be Karl Li        2024-09-27  5293  			iommus = <&apu_smmu 0xf>;
eedd3dc85418be Karl Li        2024-09-27  5294  		};
eedd3dc85418be Karl Li        2024-09-27  5295  
2f2aff80fd0e0d Darren Ye      2024-04-01  5296  		sound: sound {
2f2aff80fd0e0d Darren Ye      2024-04-01  5297  			compatible = "mediatek,mt8196-mt6681-sound";
2f2aff80fd0e0d Darren Ye      2024-04-01  5298  			mediatek,platform = <&afe>;
2f2aff80fd0e0d Darren Ye      2024-04-01  5299  			/* audio-routing is added here as a placeholder to complete the
2f2aff80fd0e0d Darren Ye      2024-04-01  5300  			   probe flow.It should be removed when upstreaming */
2f2aff80fd0e0d Darren Ye      2024-04-01  5301  			audio-routing = "Headphone Jack", "HPOL",
2f2aff80fd0e0d Darren Ye      2024-04-01  5302  					"Headphone Jack", "HPOR";
2f2aff80fd0e0d Darren Ye      2024-04-01  5303  			status = "disabled";
2f2aff80fd0e0d Darren Ye      2024-04-01  5304  		};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5305  
d9575ab619e83d Nancy Lin      2024-12-19  5306  		vdisp-ctrl {
d9575ab619e83d Nancy Lin      2024-12-19  5307  			compatible = "mediatek,mt8196-vdisp-ctrl";
d9575ab619e83d Nancy Lin      2024-12-19  5308  			mediatek,hw-ccf = <&mm_hwv>;
d9575ab619e83d Nancy Lin      2024-12-19  5309  			mediatek,vcp = <&vcp>;
d9575ab619e83d Nancy Lin      2024-12-19  5310  
d9575ab619e83d Nancy Lin      2024-12-19  5311  			vdisp: vdisp {
d9575ab619e83d Nancy Lin      2024-12-19  5312  				regulator-name = "vdisp";
d9575ab619e83d Nancy Lin      2024-12-19  5313  			};
d9575ab619e83d Nancy Lin      2024-12-19  5314  		};
d9575ab619e83d Nancy Lin      2024-12-19  5315  
a2f778a6f2805b Yunfei Dong    2024-12-23  5316  		vmm: vmm {
a2f778a6f2805b Yunfei Dong    2024-12-23  5317  			compatible = "mediatek,mt8196-vmm";
a2f778a6f2805b Yunfei Dong    2024-12-23  5318  			mediatek,hw-ccf = <&mm_hwv>;
a2f778a6f2805b Yunfei Dong    2024-12-23  5319  			mediatek,vcp = <&vcp>;
a2f778a6f2805b Yunfei Dong    2024-12-23  5320  
a2f778a6f2805b Yunfei Dong    2024-12-23  5321  			vdec_vcore: vdec-vcore {
a2f778a6f2805b Yunfei Dong    2024-12-23  5322  				regulator-name = "vdec-vcore";
a2f778a6f2805b Yunfei Dong    2024-12-23  5323  			};
a2f778a6f2805b Yunfei Dong    2024-12-23  5324  		};
a2f778a6f2805b Yunfei Dong    2024-12-23  5325  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5326  		thermal_zones: thermal-zones {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5327  			soc_max: soc_max {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5328  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5329  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5330  				thermal-sensors = <&lvts 0>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5331  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5332  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5333  					soc_max_crit: so-max-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5334  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5335  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5336  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5337  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5338  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5339  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5340  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5341  			cpu-6-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5342  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5343  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5344  				thermal-sensors = <&lvts 1>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5345  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5346  					cpu_medium_core6_0_crit: cpu-medium-core6-0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5347  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5348  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5349  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5350  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5351  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5352  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5353  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5354  			cpu-6-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5355  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5356  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5357  				thermal-sensors = <&lvts 2>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5358  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5359  					cpu_medium_core6_1_crit: cpu-medium-core6-1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5360  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5361  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5362  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5363  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5364  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5365  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5366  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5367  			cpu-dsu2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5368  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5369  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5370  				thermal-sensors = <&lvts 3>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5371  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5372  					cpu_dsu2_crit: cpu-dsu2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5373  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5374  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5375  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5376  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5377  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5378  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5379  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5380  			cpu-dsu3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5381  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5382  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5383  				thermal-sensors = <&lvts 4>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5384  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5385  					cpu_dsu3_crit: cpu-dsu3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5386  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5387  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5388  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5389  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5390  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5391  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5392  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5393  			cpu-3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5394  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5395  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5396  				thermal-sensors = <&lvts 5>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5397  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5398  					cpu_little_core3_crit: cpu-little-core3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5399  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5400  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5401  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5402  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5403  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5404  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5405  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5406  			cpu-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5407  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5408  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5409  				thermal-sensors = <&lvts 6>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5410  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5411  					cpu_little_core0_crit: cpu-little-core0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5412  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5413  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5414  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5415  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5416  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5417  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5418  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5419  			cpu-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5420  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5421  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5422  				thermal-sensors = <&lvts 7>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5423  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5424  					cpu_little_core1_crit: cpu-little-core1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5425  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5426  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5427  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5428  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5429  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5430  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5431  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5432  			cpu-2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5433  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5434  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5435  				thermal-sensors = <&lvts 8>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5436  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5437  					cpu_little_core2_crit: cpu-little-core2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5438  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5439  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5440  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5441  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5442  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5443  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5444  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5445  			cpu-4-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5446  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5447  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5448  				thermal-sensors = <&lvts 9>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5449  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5450  					cpu_medium_core4_0_crit: cpu-medium-core4-0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5451  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5452  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5453  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5454  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5455  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5456  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5457  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5458  			cpu-4-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5459  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5460  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5461  				thermal-sensors = <&lvts 10>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5462  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5463  					cpu_medium_core4_1_crit: cpu-medium-core4-1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5464  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5465  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5466  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5467  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5468  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5469  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5470  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5471  			cpu-5-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5472  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5473  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5474  				thermal-sensors = <&lvts 11>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5475  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5476  					cpu_medium_core5_0_crit: cpu-medium-core5-0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5477  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5478  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5479  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5480  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5481  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5482  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5483  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5484  			cpu-5-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5485  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5486  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5487  				thermal-sensors = <&lvts 12>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5488  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5489  					cpu_medium_core5_1_crit: cpu-medium-core5-1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5490  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5491  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5492  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5493  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5494  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5495  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5496  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5497  			cpu-dsu0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5498  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5499  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5500  				thermal-sensors = <&lvts 13>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5501  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5502  					cpu_dsu0_crit: cpu-dsu0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5503  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5504  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5505  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5506  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5507  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5508  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5509  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5510  			cpu-dsu1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5511  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5512  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5513  				thermal-sensors = <&lvts 14>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5514  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5515  					cpu_dsu1_crit: cpu-dsu1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5516  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5517  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5518  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5519  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5520  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5521  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5522  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5523  			cpu-7-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5524  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5525  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5526  				thermal-sensors = <&lvts 15>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5527  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5528  					cpu_big_core7_0_crit: cpu-big-core7-0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5529  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5530  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5531  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5532  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5533  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5534  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5535  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5536  			cpu-7-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5537  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5538  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5539  				thermal-sensors = <&lvts 16>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5540  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5541  					cpu_big_core7_1_crit: cpu-big-core7-1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5542  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5543  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5544  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5545  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5546  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5547  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5548  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5549  			apu-a0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5550  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5551  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5552  				thermal-sensors = <&lvts 17>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5553  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5554  					apu_a0_crit: apu-a0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5555  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5556  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5557  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5558  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5559  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5560  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5561  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5562  			apu-a1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5563  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5564  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5565  				thermal-sensors = <&lvts 18>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5566  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5567  					apu_a1_crit: apu-a1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5568  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5569  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5570  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5571  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5572  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5573  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5574  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5575  			apu-a2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5576  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5577  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5578  				thermal-sensors = <&lvts 19>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5579  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5580  					apu_a2_crit: apu-a2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5581  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5582  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5583  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5584  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5585  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5586  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5587  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5588  			apu-a3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5589  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5590  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5591  				thermal-sensors = <&lvts 20>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5592  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5593  					apu_a3_crit: apu-a3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5594  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5595  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5596  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5597  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5598  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5599  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5600  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5601  			gpu0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5602  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5603  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5604  				thermal-sensors = <&lvts 21>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5605  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5606  					gpu0_crit: gpu0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5607  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5608  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5609  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5610  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5611  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5612  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5613  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5614  			gpu1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5615  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5616  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5617  				thermal-sensors = <&lvts 22>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5618  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5619  					gpu1_crit: gpu1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5620  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5621  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5622  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5623  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5624  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5625  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5626  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5627  			soc-top0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5628  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5629  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5630  				thermal-sensors = <&lvts 23>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5631  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5632  					soc_top0_crit: soc-top0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5633  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5634  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5635  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5636  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5637  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5638  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5639  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5640  			soc-top1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5641  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5642  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5643  				thermal-sensors = <&lvts 24>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5644  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5645  					soc_top1_crit: soc-top1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5646  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5647  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5648  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5649  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5650  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5651  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5652  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5653  			soc-top2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5654  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5655  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5656  				thermal-sensors = <&lvts 25>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5657  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5658  					soc_top2_crit: soc-top2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5659  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5660  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5661  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5662  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5663  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5664  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5665  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5666  			soc-top3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5667  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5668  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5669  				thermal-sensors = <&lvts 26>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5670  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5671  					soc_top3_crit: soc-top3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5672  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5673  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5674  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5675  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5676  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5677  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5678  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5679  			soc-bot0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5680  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5681  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5682  				thermal-sensors = <&lvts 27>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5683  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5684  					soc_bot0_crit: soc-bot0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5685  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5686  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5687  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5688  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5689  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5690  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5691  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5692  			soc-bot1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5693  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5694  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5695  				thermal-sensors = <&lvts 28>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5696  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5697  					soc_bot1_crit: soc-bot1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5698  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5699  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5700  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5701  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5702  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5703  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5704  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5705  			soc-bot2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5706  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5707  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5708  				thermal-sensors = <&lvts 29>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5709  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5710  					soc_bot2_crit: soc-bot2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5711  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5712  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5713  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5714  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5715  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5716  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5717  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5718  			soc-bot3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5719  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5720  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5721  				thermal-sensors = <&lvts 30>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5722  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5723  					soc_bot3_crit: soc-bot3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5724  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5725  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5726  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5727  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5728  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5729  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5730  		};
2f2aff80fd0e0d Darren Ye      2024-04-01  5731  	};
2f2aff80fd0e0d Darren Ye      2024-04-01  5732  };
2f2aff80fd0e0d Darren Ye      2024-04-01  5733  

:::::: The code at line 1260 was first introduced by commit
:::::: 0df15b2007c16153a62fd4bfaa4b4ba8a7669d04 CHROMIUM: arm64: dts: mediatek: mt8196: add gpu_fdvfs node

:::::: TO: Andy Hsu <andy.hsu@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
