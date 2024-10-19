Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A921B137E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 03:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729308205; cv=none; b=nN90Saa/UQg/EfE+joYAYm40vTLbhxcpC210veSEw8jNf+7TW3FI3z+TsbMHi6Kuon5JXUR9Qo2rZk2FqpvQ2anhBFv6fCePaj41Df5NznO4leX8rQm+/NAWAww0vaEAUQHQMQROtlqTJ1AlNgzbfDbPkYY7yHQGC5s16lPNCvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729308205; c=relaxed/simple;
	bh=MCl68sOFHL9IObq32GTwScefFFp92ZiL3jJTv65/9CM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLWh+9WpKfYxgWslEVGjw2Q54q+iQkQXBRJeb3A2eV/Xur9yf+M2HQT6cKXIl23vguvlKc8tLxQmluJktHYXm13iw8wFk4sx0HMFRVrdodDNsoKtH8HS65NaEjgiexOe8/H3BKqh3pkJcS6s9xQ4GW1uUSjvm27WEv+ToT4VK20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+/mf0EQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+/mf0EQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729308202; x=1760844202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MCl68sOFHL9IObq32GTwScefFFp92ZiL3jJTv65/9CM=;
  b=K+/mf0EQAZZANPcr/Gu3PYT2Jv2jY0hCaZT5e7lXK68uOMFxDR2fxq1d
   XYU4MTu0KPRyOSHZyU/OGFnmlEcWaS7Xra5UV6wInUEm4JsiFIrYEcEd6
   ZIDfNdLhtgU10dMwbRep/ut46pyiWEPH23lllXt/9WTfb3jYymyJ644ar
   UDxNnFAI8u3CuSPvvXZZqDSr1pr6xpGygb36+mk6S+H32b728r9xMprKX
   mWQx8sXye/QobKCZFyAZ3rLZ8ElF7d8MlLaZp998v9BcSaiR4vg5IeByk
   MpKqIUtHOMHpR6cMmdJ6gncp6ettOelRqKF1GhN4XHfF2TFs6dVBVFzc3
   A==;
X-CSE-ConnectionGUID: dur0r+H7TB6pCv3pKZiMmA==
X-CSE-MsgGUID: i6Zwvs2HQSeg/DmHbsqZBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28809743"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28809743"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 20:23:21 -0700
X-CSE-ConnectionGUID: MUjkMdl5RDKkGRE26Ls/og==
X-CSE-MsgGUID: 5qSfIvW/R12M6tlDkcvM3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79001902"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2024 20:23:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t203i-000Ofl-1I;
	Sat, 19 Oct 2024 03:23:18 +0000
Date: Sat, 19 Oct 2024 11:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y 5/15]
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts:771.21-826.4: Warning
 (avoid_unnecessary_addr_size):
 /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202410191127.yUjX0U62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: cf4971a4fe9cc09f07dcedfc8cc7250bbc898543 [5/15] arm64: dts: k3-j784s4: Add node for OSPI NAND Flash
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241019/202410191127.yUjX0U62-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191127.yUjX0U62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191127.yUjX0U62-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dts:771.21-826.4: Warning (avoid_unnecessary_addr_size): /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1874.34-1883.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1289.25-1329.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1352.25-1393.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1416.25-1456.4: Warning (unique_unit_address): /bus@100000/pcie@2930000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2930000)
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dts:717.21-769.4: Warning (unique_unit_address): /bus@100000/bus@28380000/bus@47000000/spi@47040000/flash@0: duplicate unit-address (also used in node /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0)

vim +771 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts

   711	
   712	&ospi0 {
   713		status = "okay";
   714		pinctrl-names = "default";
   715		pinctrl-0 = <&mcu_fss0_ospi0_pins_default>;
   716	
 > 717		ospi0_nor: flash@0 {
   718			compatible = "jedec,spi-nor";
   719			reg = <0x0>;
   720			spi-tx-bus-width = <8>;
   721			spi-rx-bus-width = <8>;
   722			spi-max-frequency = <25000000>;
   723			cdns,tshsl-ns = <60>;
   724			cdns,tsd2d-ns = <60>;
   725			cdns,tchsh-ns = <60>;
   726			cdns,tslch-ns = <60>;
   727			cdns,read-delay = <4>;
   728	
   729			partitions {
   730				compatible = "fixed-partitions";
   731				#address-cells = <1>;
   732				#size-cells = <1>;
   733	
   734				partition@0 {
   735					label = "ospi.tiboot3";
   736					reg = <0x0 0x80000>;
   737				};
   738	
   739				partition@80000 {
   740					label = "ospi.tispl";
   741					reg = <0x80000 0x200000>;
   742				};
   743	
   744				partition@280000 {
   745					label = "ospi.u-boot";
   746					reg = <0x280000 0x400000>;
   747				};
   748	
   749				partition@680000 {
   750					label = "ospi.env";
   751					reg = <0x680000 0x40000>;
   752				};
   753	
   754				partition@6c0000 {
   755					label = "ospi.env.backup";
   756					reg = <0x6c0000 0x40000>;
   757				};
   758	
   759				partition@800000 {
   760					label = "ospi.rootfs";
   761					reg = <0x800000 0x37c0000>;
   762				};
   763	
   764				partition@3fc0000 {
   765					label = "ospi.phypattern";
   766					reg = <0x3fc0000 0x40000>;
   767				};
   768			};
   769		};
   770	
 > 771		ospi0_nand: nand@0 {
   772			compatible = "spi-nand";
   773			reg = <0x0>;
   774			spi-tx-bus-width = <8>;
   775			spi-rx-bus-width = <8>;
   776			spi-max-frequency = <25000000>;
   777			cdns,tshsl-ns = <60>;
   778			cdns,tsd2d-ns = <60>;
   779			cdns,tchsh-ns = <60>;
   780			cdns,tslch-ns = <60>;
   781			cdns,read-delay = <2>;
   782			#address-cells = <1>;
   783			#size-cells = <1>;
   784			status = "disabled";
   785	
   786			partitions {
   787				compatible = "fixed-partitions";
   788				#address-cells = <1>;
   789				#size-cells = <1>;
   790	
   791				partition@0 {
   792					label = "ospi_nand.tiboot3";
   793					reg = <0x0 0x80000>;
   794				};
   795	
   796				partition@80000 {
   797					label = "ospi_nand.tispl";
   798					reg = <0x80000 0x200000>;
   799				};
   800	
   801				partition@280000 {
   802					label = "ospi_nand.u-boot";
   803					reg = <0x280000 0x400000>;
   804				};
   805	
   806				partition@680000 {
   807					label = "ospi_nand.env";
   808					reg = <0x680000 0x40000>;
   809				};
   810	
   811				partition@6c0000 {
   812					label = "ospi_nand.env.backup";
   813					reg = <0x6c0000 0x40000>;
   814				};
   815	
   816				partition@2000000 {
   817					label = "ospi_nand.rootfs";
   818					reg = <0x2000000 0x5fc0000>;
   819				};
   820	
   821				partition@7fc0000 {
   822					label = "ospi_nand.phypattern";
   823					reg = <0x7fc0000 0x40000>;
   824				};
   825			};
   826		};
   827	};
   828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
