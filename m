Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD60D2A1CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 05:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718947951; cv=none; b=urJ+z9QPt0Fj8GVXieVeDJe0agOAtjh038oZSc6em1FcTAgPSj8Fji5gAxEF81h0XHdSUM25TTQg8UfqTtJu7aepqdTfMZIaH6UM0Mgj3IyoArvR8vBLcsmeQ2yVzea7eVJFbqvH+sRF1v0tOCMUYblB6mEwlENPGD1Jb6EfOzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718947951; c=relaxed/simple;
	bh=3bFc8xWbdl/zeaDECTX13Pg8RIZsyjY7TDBF24wLUGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rL+/tNzh907WOFq9l38Rt92Rp+oh77iFIuURs3bs9JJPu5Nqx0HdDARJJvoVnAokMUC68VGq0rsAeIXlN6dFrWrZbpWrB+ZUUDw2oYhSDkqrs/08A7fAMZssSAHR/alzYmla7ptQLsgWB97UcSGlGlM1XGcGUsd3Db/NMrHW8Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oki1Pi+z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oki1Pi+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718947949; x=1750483949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3bFc8xWbdl/zeaDECTX13Pg8RIZsyjY7TDBF24wLUGs=;
  b=Oki1Pi+zuCoF2ONXfIrTfaNlInGG8VnM9bOljOlxMV1MOr8GaJStvuTV
   ugt+6L8wIrpf7lT1VYFxPikVg2ghE+4UAMZBf8mGYY4fhrL5LCzfKDIq2
   bUklrJFBJ9Bt3vDOaFxhrwMx2VK/cpQWywZz1fKU0fEddUZzVTANfvcPr
   Ypn1LmU+QnD7M8M3+9JNfEnyZKni3Q678b1S9gSDjC7e68jMBASIZybWz
   T4IHeWMllCTjXUDKhqE+JKLp+mJP/0KOylM+8Y9pKOh9E+HvK2JP+oPyG
   0viyc0VXo7vtc1DV67w7n6IyLe8AXe2PKlnTvlNTO4sJIowAWXh5azPyg
   g==;
X-CSE-ConnectionGUID: Drjs/sE2RzKNPFqAr8QoWw==
X-CSE-MsgGUID: mh20kNIDSPqDA9fXdPjrQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15943916"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="15943916"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 22:32:29 -0700
X-CSE-ConnectionGUID: zw3SymUbTUSaztZYHi1hFw==
X-CSE-MsgGUID: zX6yx8WnQUKizmS70ZUfsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="79991736"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2024 22:32:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKWsr-0008GE-1l;
	Fri, 21 Jun 2024 05:32:25 +0000
Date: Fri, 21 Jun 2024 13:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 78/88]
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts:788.21-843.4: Warning
 (avoid_unnecessary_addr_size): /bus@f0000/bus@fc00000/spi@fc40000/nand@0:
 unnecessary #address-cells/#size-cells without "ranges" or child "reg"
 property
Message-ID: <202406211325.p1ru53tV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   a71ffc827394d68b5d873555d67674f0b5868430
commit: b0def8170b02dbd43fadfa54e3dd1ed0dca8c6fd [78/88] arm64: dts: k3-j722s: Add node for OSPI NAND Flash
config: arm64-randconfig-051-20240620 (https://download.01.org/0day-ci/archive/20240621/202406211325.p1ru53tV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211325.p1ru53tV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211325.p1ru53tV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dts:788.21-843.4: Warning (avoid_unnecessary_addr_size): /bus@f0000/bus@fc00000/spi@fc40000/nand@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:1266.21-1269.5: Warning (graph_child_address): /bus@f0000/dss@30220000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@4084000: pinctrl-single,gpio-range: [[2, 0, 21, 327687], [2, 23, 1, 327687], [2, 32, 2, 327687]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: dss-oldi-io-ctrl@8600: compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short

vim +788 arch/arm64/boot/dts/ti/k3-j722s-evm.dts

   727	
   728	&ospi0 {
   729		pinctrl-names = "default";
   730		pinctrl-0 = <&ospi0_pins_default>;
   731		status = "okay";
   732	
   733		ospi0_nor: flash@0 {
   734			compatible = "jedec,spi-nor";
   735			reg = <0x0>;
   736			spi-tx-bus-width = <8>;
   737			spi-rx-bus-width = <8>;
   738			spi-max-frequency = <25000000>;
   739			cdns,tshsl-ns = <60>;
   740			cdns,tsd2d-ns = <60>;
   741			cdns,tchsh-ns = <60>;
   742			cdns,tslch-ns = <60>;
   743			cdns,read-delay = <4>;
   744			bootph-all;
   745	
   746			partitions {
   747				compatible = "fixed-partitions";
   748				#address-cells = <1>;
   749				#size-cells = <1>;
   750	
   751				partition@0 {
   752					label = "ospi.tiboot3";
   753					reg = <0x00 0x80000>;
   754				};
   755	
   756				partition@80000 {
   757					label = "ospi.tispl";
   758					reg = <0x80000 0x200000>;
   759				};
   760	
   761				partition@280000 {
   762					label = "ospi.u-boot";
   763					reg = <0x280000 0x400000>;
   764				};
   765	
   766				partition@680000 {
   767					label = "ospi.env";
   768					reg = <0x680000 0x40000>;
   769				};
   770	
   771				partition@6c0000 {
   772					label = "ospi.env.backup";
   773					reg = <0x6c0000 0x40000>;
   774				};
   775	
   776				partition@800000 {
   777					label = "ospi.rootfs";
   778					reg = <0x800000 0x37c0000>;
   779				};
   780	
   781				partition@3fc0000 {
   782					label = "ospi.phypattern";
   783					reg = <0x3fc0000 0x40000>;
   784				};
   785			};
   786		};
   787	
 > 788		ospi0_nand: nand@0 {
   789			compatible = "spi-nand";
   790			reg = <0x0>;
   791			spi-tx-bus-width = <8>;
   792			spi-rx-bus-width = <8>;
   793			spi-max-frequency = <25000000>;
   794			cdns,tshsl-ns = <60>;
   795			cdns,tsd2d-ns = <60>;
   796			cdns,tchsh-ns = <60>;
   797			cdns,tslch-ns = <60>;
   798			cdns,read-delay = <2>;
   799			#address-cells = <1>;
   800			#size-cells = <1>;
   801			status = "disabled";
   802	
   803			partitions {
   804				compatible = "fixed-partitions";
   805				#address-cells = <1>;
   806				#size-cells = <1>;
   807	
   808				partition@0 {
   809					label = "ospi_nand.tiboot3";
   810					reg = <0x0 0x80000>;
   811				};
   812	
   813				partition@80000 {
   814					label = "ospi_nand.tispl";
   815					reg = <0x80000 0x200000>;
   816				};
   817	
   818				partition@280000 {
   819					label = "ospi_nand.u-boot";
   820					reg = <0x280000 0x400000>;
   821				};
   822	
   823				partition@680000 {
   824					label = "ospi_nand.env";
   825					reg = <0x680000 0x40000>;
   826				};
   827	
   828				partition@6c0000 {
   829					label = "ospi_nand.env.backup";
   830					reg = <0x6c0000 0x40000>;
   831				};
   832	
   833				partition@2000000 {
   834					label = "ospi_nand.rootfs";
   835					reg = <0x2000000 0x5fc0000>;
   836				};
   837	
   838				partition@7fc0000 {
   839					label = "ospi_nand.phypattern";
   840					reg = <0x7fc0000 0x40000>;
   841				};
   842			};
   843		};
   844	};
   845	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
