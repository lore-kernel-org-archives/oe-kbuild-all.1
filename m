Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A9A2119
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719048765; cv=none; b=Xcs8ZjMXm9dHPiVCA00xppLC4dnRypD74R35a/wMcPRcPh5qZm0tWJxradEvpSZ0cu+EM0BCSqaS++oUQ7YmVI0YyBXb2WgavB0IPfm87MYW8wUjhfNhfoJH/BXiJHhwMYFcE7TUgxiAqMfuwiFanMh/P4DRy1mc/vamp+SHN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719048765; c=relaxed/simple;
	bh=jWtOYmzLZfeyk0NI/lHtiy/A3M1OU33S0bb9g2LPaoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c0hFHIaDnHoqm7Nx7PNt8UcDNeE2Tq2cRXb3zQwPqgaUf+lJCp6b/44cJuf6wdKbX18pt1i9n6KP9JlQ8oL8adHZ4lQcOKhsStndanFetZhTZALtw80VHb7oeZyAeR4O2ZHKlltajxJ77+xJnbamz4rE/g2jjqYaImXx4KfUb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3pgF/fV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3pgF/fV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719048763; x=1750584763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWtOYmzLZfeyk0NI/lHtiy/A3M1OU33S0bb9g2LPaoc=;
  b=K3pgF/fVhmr77qoK5iR4WGgltm/S45V7zUn5vmc4SQuOqlasi/VLclT8
   d8V8KuzkTcJ9entPWiq7ysTSdqeY2IaC8L+V3ZNFNqceB0H4XGDf5mDSQ
   X/vYj3zgC7uq4lOoFIeaq+uTs5LqWNl6SowQRPywUZGh6GPOefSYRRd24
   EmTxCTR/4PHl5N3dP+vH4FgK/Z93kNpSfyFe+PLoC8e24v5uXAZ2VS6yo
   LEYw7j5LWgpWDVq2m0z8u/IDNhuiuRmiLh3rGF46db1A8fvUSybghVK8C
   rEfKli87/jd/wWfeXStRoKtIS4XRYJBy602KvibWBrNx9piAUhkwFELjm
   A==;
X-CSE-ConnectionGUID: GejXutL5SqSTRWhVHOAnSg==
X-CSE-MsgGUID: 2lRWXMuXQiif95wurOdBFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="27484897"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="27484897"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 02:32:43 -0700
X-CSE-ConnectionGUID: OdEYVu+wSnaFsYO9VbPUWA==
X-CSE-MsgGUID: cOSkdeQvTTOSLU+W/gnTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="42915705"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jun 2024 02:32:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKx6t-0009Vs-13;
	Sat, 22 Jun 2024 09:32:39 +0000
Date: Sat, 22 Jun 2024 17:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 178/184]
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning
 (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address
 format error, expected "39b540000"
Message-ID: <202406221702.I1X4BWCK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 75d3e77aa1473c0056cd1d108a49b4abc7346c4e [178/184] arm64: apple: t600x: Add sio and dpaudio device nodes
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240622/202406221702.I1X4BWCK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221702.I1X4BWCK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221702.I1X4BWCK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:477.14-491.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:493.14-502.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:276.29-281.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:215.9-224.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:264.9-273.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:421.9-430.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:511.9-520.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:532.9-541.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-common.dtsi:487.28-490.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:300.14-309.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:311.14-320.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:276.29-281.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:215.9-224.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:264.9-273.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:421.9-430.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:511.9-520.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:532.9-541.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/39b540000 +502 arch/arm64/boot/dts/apple/t600x-dieX.dtsi

 > 421			ports {
   422				#address-cells = <1>;
   423				#size-cells = <0>;
   424				port@0 {
   425					reg = <0>;
   426					DIE_NODE(dcpext1_audio): endpoint {
   427						remote-endpoint = <&DIE_NODE(dpaudio2_dcp)>;
   428					};
   429				};
   430			};
   431		};
   432	
   433		DIE_NODE(sio_dart_0): iommu@39b004000 {
   434			compatible = "apple,t6000-dart";
   435			reg = <0x3 0x9b004000 0x0 0x4000>;
   436			interrupt-parent = <&aic>;
   437			interrupts = <AIC_IRQ DIE_NO 1130 IRQ_TYPE_LEVEL_HIGH>;
   438			#iommu-cells = <1>;
   439			power-domains = <&DIE_NODE(ps_sio_cpu)>;
   440		};
   441	
   442		DIE_NODE(sio_dart_1): iommu@39b008000 {
   443			compatible = "apple,t6000-dart";
   444			reg = <0x3 0x9b008000 0x0 0x8000>;
   445			interrupt-parent = <&aic>;
   446			interrupts = <AIC_IRQ DIE_NO 1130 IRQ_TYPE_LEVEL_HIGH>;
   447			#iommu-cells = <1>;
   448			power-domains = <&DIE_NODE(ps_sio_cpu)>;
   449		};
   450	
   451		DIE_NODE(pinctrl_ap): pinctrl@39b028000 {
   452			compatible = "apple,t6000-pinctrl", "apple,pinctrl";
   453			reg = <0x3 0x9b028000 0x0 0x4000>;
   454	
   455			interrupt-parent = <&aic>;
   456			interrupts = <AIC_IRQ DIE_NO 427 IRQ_TYPE_LEVEL_HIGH>,
   457					<AIC_IRQ DIE_NO 428 IRQ_TYPE_LEVEL_HIGH>,
   458					<AIC_IRQ DIE_NO 429 IRQ_TYPE_LEVEL_HIGH>,
   459					<AIC_IRQ DIE_NO 430 IRQ_TYPE_LEVEL_HIGH>,
   460					<AIC_IRQ DIE_NO 431 IRQ_TYPE_LEVEL_HIGH>,
   461					<AIC_IRQ DIE_NO 432 IRQ_TYPE_LEVEL_HIGH>,
   462					<AIC_IRQ DIE_NO 433 IRQ_TYPE_LEVEL_HIGH>;
   463	
   464			clocks = <&clkref>;
   465			power-domains = <&DIE_NODE(ps_gpio)>;
   466	
   467			gpio-controller;
   468			#gpio-cells = <2>;
   469			gpio-ranges = <&DIE_NODE(pinctrl_ap) 0 0 255>;
   470			apple,npins = <255>;
   471	
   472			interrupt-controller;
   473			#interrupt-cells = <2>;
   474		};
   475	
   476		DIE_NODE(sio_mbox): mbox@39bc08000 {
   477			compatible = "apple,t6000-asc-mailbox", "apple,asc-mailbox-v4";
   478			reg = <0x3 0x9bc08000 0x0 0x4000>;
   479			interrupt-parent = <&aic>;
   480			interrupts = <AIC_IRQ DIE_NO 1147 IRQ_TYPE_LEVEL_HIGH>,
   481				<AIC_IRQ DIE_NO 1148 IRQ_TYPE_LEVEL_HIGH>,
   482				<AIC_IRQ DIE_NO 1149 IRQ_TYPE_LEVEL_HIGH>,
   483				<AIC_IRQ DIE_NO 1150 IRQ_TYPE_LEVEL_HIGH>;
   484			interrupt-names = "send-empty", "send-not-empty",
   485				"recv-empty", "recv-not-empty";
   486			#mbox-cells = <0>;
   487			power-domains = <&DIE_NODE(ps_sio_cpu)>;
   488		};
   489	
   490		DIE_NODE(sio): sio@39bc00000 {
   491			compatible = "apple,t6000-sio", "apple,sio";
   492			reg = <0x3 0x9bc00000 0x0 0x8000>;
   493			dma-channels = <128>;
   494			#dma-cells = <1>;
   495			mboxes = <&DIE_NODE(sio_mbox)>;
   496			iommus = <&DIE_NODE(sio_dart_0) 0>, <&DIE_NODE(sio_dart_1) 0>;
   497			power-domains = <&DIE_NODE(ps_sio_cpu)>;
   498			resets = <&DIE_NODE(ps_sio)>; /* TODO: verify reset does something */
   499			status = "disabled";
   500		};
   501	
 > 502		DIE_NODE(dpaudio1): audio-controller@39b504000 {
   503			compatible = "apple,t6000-dpaudio", "apple,dpaudio";
   504			reg = <0x3 0x9b540000 0x0 0x4000>;
   505			dmas = <&DIE_NODE(sio) 0x66>;
   506			dma-names = "tx";
   507			power-domains = <&DIE_NODE(ps_dpa1)>;
   508			reset-domains = <&DIE_NODE(ps_dpa1)>;
   509			status = "disabled";
   510	
 > 511			ports {
   512				#address-cells = <1>;
   513				#size-cells = <0>;
   514				port@0 {
   515					reg = <0>;
   516					DIE_NODE(dpaudio1_dcp): endpoint {
   517						remote-endpoint = <&DIE_NODE(dcpext0_audio)>;
   518					};
   519				};
   520			};
   521		};
   522	
 > 523		DIE_NODE(dpaudio2): audio-controller@39b508000 {
   524			compatible = "apple,t6000-dpaudio", "apple,dpaudio";
   525			reg = <0x3 0x9b580000 0x0 0x4000>;
   526			dmas = <&DIE_NODE(sio) 0x68>;
   527			dma-names = "tx";
   528			power-domains = <&DIE_NODE(ps_dpa2)>;
   529			reset-domains = <&DIE_NODE(ps_dpa2)>;
   530			status = "disabled";
   531	
 > 532			ports {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
