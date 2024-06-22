Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA064085D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 20:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719089348; cv=none; b=tt603p8RCPiTtCTHsFXWELlb8TdInu2hFT/hYqpjDw+83AJHvRdLFFc2+Evgr/TekYlXPCpbtZzjBfO8oL4gLXjxhWhev24tutlunh/6+ePgHhqN0ePxcjbE9k+1DRprAcQKp7IGQF9nAs3XYR3FH8Uqv3hTc/X5x15+SeTcq64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719089348; c=relaxed/simple;
	bh=iTLu5PJ4vdmipW0DFIh1wWr4N36RaonN3vhUtqsnjaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M8vWIb5kI9ybLqmGDirS6x39xTcFPABphRhpB6xwZg02r3L04KRHE1cf1F6vnURFkkslELAcq4sNSpNWCJhxPn7OMHV2RFzUNPOzlZxoAGO+zUR+zsjOXOnt2sYRHcB4JFtyDle9Ict3xWOhvckKyB414BZN73pApEIguKYJaMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ayl7K2xf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ayl7K2xf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719089346; x=1750625346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTLu5PJ4vdmipW0DFIh1wWr4N36RaonN3vhUtqsnjaU=;
  b=Ayl7K2xfs8zOwjv6kOrf49tqdQMgbCr4vTiPAy/0DdBBEQwUBcDoUDQx
   WWk00z1odJcDhQwx5yL/jqAcOgR2h0ynbqciU37gaHI7sWQp9g/oDCmdG
   CWUnRpP5XfZqJOSfZuHiY2r10+V1sTjR1tG9eFBj6ex6UCdPE7X2RFZ5N
   Sqaa9dAf7F/rWNQHRFBpGqJigEuVi69hG1JEX3EyKBV9ddg4qnK6Qn1BQ
   8wkTSInezV4fQpvpbMW8loMCFUdh1+7Ymdvm/SPuCa1+rra+1cJt7nXQa
   UWXOgbUNzZ9iLFKEI+gbppt8fxILQC+0Qi6X2IZgBwJ+tumQGOSjrn8aG
   g==;
X-CSE-ConnectionGUID: qwwZbIreRbW0N4unDcHsbw==
X-CSE-MsgGUID: Nu5gFQgnTF6vbz97TOiNLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="26783732"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="26783732"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 13:49:05 -0700
X-CSE-ConnectionGUID: 2qyphCD6RQec08XCRNHwew==
X-CSE-MsgGUID: YN/wzdLdQIGVbNOkcbCcTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="43345454"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jun 2024 13:49:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL7fR-0009zT-2M;
	Sat, 22 Jun 2024 20:49:01 +0000
Date: Sun, 23 Jun 2024 04:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 179/184]
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning
 (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address
 format error, expected "39b540000"
Message-ID: <202406230407.mfv8vk0s-lkp@intel.com>
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
commit: 37f258d8538e5c156785b30e52b71d9f5832c03c [179/184] arm64: apple: t602x: Add sio and dpaudio device nodes
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240623/202406230407.mfv8vk0s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406230407.mfv8vk0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230407.mfv8vk0s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:601.28-604.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:606.34-609.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:477.14-491.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:493.14-502.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:388.29-393.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:376.9-385.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:610.9-619.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:241.9-250.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:323.9-332.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:344.9-353.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:601.28-604.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:606.34-609.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:300.14-309.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:311.14-320.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:388.29-393.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:376.9-385.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:610.9-619.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:241.9-250.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:323.9-332.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:344.9-353.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:601.28-604.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:606.34-609.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:611.22-614.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:300.14-309.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:311.14-320.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:388.29-393.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:314.39-333.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:335.39-354.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:376.9-385.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-die0.dtsi:610.9-619.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:241.9-250.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:323.9-332.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:344.9-353.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/39b540000 +314 arch/arm64/boot/dts/apple/t602x-dieX.dtsi

 > 241			ports {
   242				#address-cells = <1>;
   243				#size-cells = <0>;
   244				port@0 {
   245					reg = <0>;
   246					DIE_NODE(dcpext1_audio): endpoint {
   247						remote-endpoint = <&DIE_NODE(dpaudio2_dcp)>;
   248					};
   249				};
   250			};
   251		};
   252	
   253		DIE_NODE(sio_dart): iommu@39b008000 {
   254			compatible = "apple,t6020-dart", "apple,t8110-dart";
   255			reg = <0x3 0x9b008000 0x0 0x4000>;
   256			interrupt-parent = <&aic>;
   257			interrupts = <AIC_IRQ DIE_NO 1231 IRQ_TYPE_LEVEL_HIGH>;
   258			#iommu-cells = <1>;
   259			power-domains = <&DIE_NODE(ps_sio)>;
   260			//apple,dma-range = <0x100 0x0001c000 0x2ff 0xfffe4000>;
   261		};
   262	
   263		DIE_NODE(pinctrl_ap): pinctrl@39b028000 {
   264			compatible = "apple,t6020-pinctrl", "apple,pinctrl";
   265			reg = <0x3 0x9b028000 0x0 0x4000>;
   266	
   267			interrupt-parent = <&aic>;
   268			interrupts = <AIC_IRQ DIE_NO 458 IRQ_TYPE_LEVEL_HIGH>,
   269					<AIC_IRQ DIE_NO 459 IRQ_TYPE_LEVEL_HIGH>,
   270					<AIC_IRQ DIE_NO 460 IRQ_TYPE_LEVEL_HIGH>,
   271					<AIC_IRQ DIE_NO 461 IRQ_TYPE_LEVEL_HIGH>,
   272					<AIC_IRQ DIE_NO 462 IRQ_TYPE_LEVEL_HIGH>,
   273					<AIC_IRQ DIE_NO 463 IRQ_TYPE_LEVEL_HIGH>,
   274					<AIC_IRQ DIE_NO 464 IRQ_TYPE_LEVEL_HIGH>;
   275	
   276			clocks = <&clkref>;
   277			power-domains = <&DIE_NODE(ps_gpio)>;
   278	
   279			gpio-controller;
   280			#gpio-cells = <2>;
   281			gpio-ranges = <&DIE_NODE(pinctrl_ap) 0 0 255>;
   282			apple,npins = <255>;
   283	
   284			interrupt-controller;
   285			#interrupt-cells = <2>;
   286		};
   287	
   288		DIE_NODE(sio_mbox): mbox@39bc08000 {
   289			compatible = "apple,t6020-asc-mailbox", "apple,asc-mailbox-v4";
   290			reg = <0x3 0x9bc08000 0x0 0x4000>;
   291			interrupt-parent = <&aic>;
   292			interrupts = <AIC_IRQ DIE_NO 1248 IRQ_TYPE_LEVEL_HIGH>,
   293				<AIC_IRQ DIE_NO 1249 IRQ_TYPE_LEVEL_HIGH>,
   294				<AIC_IRQ DIE_NO 1250 IRQ_TYPE_LEVEL_HIGH>,
   295				<AIC_IRQ DIE_NO 1251 IRQ_TYPE_LEVEL_HIGH>;
   296			interrupt-names = "send-empty", "send-not-empty",
   297				"recv-empty", "recv-not-empty";
   298			#mbox-cells = <0>;
   299			power-domains = <&DIE_NODE(ps_sio_cpu)>;
   300		};
   301	
   302		DIE_NODE(sio): sio@39bc00000 {
   303			compatible = "apple,t6020-sio", "apple,sio";
   304			reg = <0x3 0x9bc00000 0x0 0x8000>;
   305			dma-channels = <128>;
   306			#dma-cells = <1>;
   307			mboxes = <&DIE_NODE(sio_mbox)>;
   308			iommus = <&DIE_NODE(sio_dart) 0>;
   309			power-domains = <&DIE_NODE(ps_sio_cpu)>;
   310			resets = <&DIE_NODE(ps_sio_cpu)>;
   311			status = "disabled";
   312		};
   313	
 > 314		DIE_NODE(dpaudio1): audio-controller@39b504000 {
   315			compatible = "apple,t6020-dpaudio", "apple,dpaudio";
   316			reg = <0x3 0x9b540000 0x0 0x4000>;
   317			dmas = <&DIE_NODE(sio) 0x66>;
   318			dma-names = "tx";
   319			power-domains = <&DIE_NODE(ps_dpa1)>;
   320			reset-domains = <&DIE_NODE(ps_dpa1)>;
   321			status = "disabled";
   322	
 > 323			ports {
   324				#address-cells = <1>;
   325				#size-cells = <0>;
   326				port@0 {
   327					reg = <0>;
   328					DIE_NODE(dpaudio1_dcp): endpoint {
   329						remote-endpoint = <&DIE_NODE(dcpext0_audio)>;
   330					};
   331				};
   332			};
   333		};
   334	
 > 335		DIE_NODE(dpaudio2): audio-controller@39b508000 {
   336			compatible = "apple,t6020-dpaudio", "apple,dpaudio";
   337			reg = <0x3 0x9b580000 0x0 0x4000>;
   338			dmas = <&DIE_NODE(sio) 0x68>;
   339			dma-names = "tx";
   340			power-domains = <&DIE_NODE(ps_dpa2)>;
   341			reset-domains = <&DIE_NODE(ps_dpa2)>;
   342			status = "disabled";
   343	
 > 344			ports {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
