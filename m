Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BADC13AF9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 19:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718913384; cv=none; b=qP6dsHkvLbprrTrqTJpUNY7hp2QLio9WDcdUgijT7imKbPZASyH5sl8LCvjdkrf5mlsoEpL6hkEWw0MUobQWQeF0suZ6hYEgxBsopr4FAIniIKnMeKShrxGH0K5d2HM1k3b7TIMfln7kxnyQvXRfie8tVE5IHCMUGK2VJiBbdYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718913384; c=relaxed/simple;
	bh=kr3F9OWTGamNJLnQ3jHU0ZsPLn8rPDb8Az71zI62yfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTkqbZHn5wAAj14gSs/4uxbdOl/p8ztfaD1B7W+IOSty/bhou3BcGCl+VLvNSAbHwD84FEUKQAN/ymh4T3tLXKe7wRfvzooj/aqWHoMwoqqcCkwwmwBIweQ+ofe7y3IR89U0Ixmn4+2ZB/rVy0Y9XA+3vgZJ1GgVg4InSMRRF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Py2FYbVL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Py2FYbVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718913382; x=1750449382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kr3F9OWTGamNJLnQ3jHU0ZsPLn8rPDb8Az71zI62yfg=;
  b=Py2FYbVLgHzXjFIy4XkQaYsA6LkeUVS9C5BCAGOVtsNbISyASHjHpvYl
   gKLYzpXZXb4TA3WSyt8o6+ulwS74s0RsKT3rg+Kr9CYqIkrcsGT75zrxc
   fbLqQsZ4QoUGazHyfOWDttDq7zO37p3jYWYMhaxptUzFV5Eztf0kL0VsL
   npQWmTiaYa777M3MMQjy/s9NSTTgYRPSTDKw91/dTPnDghDg5bJwBjZHG
   h9SPwcUHYZZ1uYf1dEfzcCPMrp1wxp8CeMxChWgprZddAUSmDaEYSLRIA
   hunbLu4SQzwKwJThZeYLOvjEEX7ZKhhKvjNYiCau8cDerZg39rTz3UYx3
   g==;
X-CSE-ConnectionGUID: 9VjalcieT0qX/Y55PsyyMw==
X-CSE-MsgGUID: rUf6wywzQSa3FmGFee8YVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="18834408"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="18834408"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 12:56:21 -0700
X-CSE-ConnectionGUID: TFInKGUoSg6N76HTl0ZJnw==
X-CSE-MsgGUID: BY+24uTgQ5uLXKzlmmUKEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42256103"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jun 2024 12:56:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKNtJ-0007sk-2X;
	Thu, 20 Jun 2024 19:56:17 +0000
Date: Fri, 21 Jun 2024 03:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 75/88]
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts:878.21-933.4: Warning
 (avoid_unnecessary_addr_size):
 /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406210339.R4XfZmgg-lkp@intel.com>
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
commit: e7d4ff914f6abf36be28a7b6ff76ac50e863c656 [75/88] arm64: dts: k3-j784s4: Add node for OSPI NAND Flash
config: arm64-randconfig-051-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210339.R4XfZmgg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210339.R4XfZmgg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210339.R4XfZmgg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dts:878.21-933.4: Warning (avoid_unnecessary_addr_size): /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:2725.34-2734.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: video-codec@4210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: video-codec@4220000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pinctrl@a40000: 'mcu-cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

vim +878 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts

   816	
   817	&ospi0 {
   818		bootph-all;
   819		status = "okay";
   820		pinctrl-names = "default";
   821		pinctrl-0 = <&mcu_fss0_ospi0_pins_default>, <&mcu_fss0_ospi0_1_pins_default>;
   822	
   823		ospi0_nor: flash@0 {
   824			compatible = "jedec,spi-nor";
   825			reg = <0x0>;
   826			spi-tx-bus-width = <8>;
   827			spi-rx-bus-width = <8>;
   828			spi-max-frequency = <25000000>;
   829			cdns,tshsl-ns = <60>;
   830			cdns,tsd2d-ns = <60>;
   831			cdns,tchsh-ns = <60>;
   832			cdns,tslch-ns = <60>;
   833			cdns,read-delay = <4>;
   834	
   835			partitions {
   836				compatible = "fixed-partitions";
   837				#address-cells = <1>;
   838				#size-cells = <1>;
   839	
   840				partition@0 {
   841					label = "ospi.tiboot3";
   842					reg = <0x0 0x80000>;
   843				};
   844	
   845				partition@80000 {
   846					label = "ospi.tispl";
   847					reg = <0x80000 0x200000>;
   848				};
   849	
   850				partition@280000 {
   851					label = "ospi.u-boot";
   852					reg = <0x280000 0x400000>;
   853				};
   854	
   855				partition@680000 {
   856					label = "ospi.env";
   857					reg = <0x680000 0x40000>;
   858				};
   859	
   860				partition@6c0000 {
   861					label = "ospi.env.backup";
   862					reg = <0x6c0000 0x40000>;
   863				};
   864	
   865				partition@800000 {
   866					label = "ospi.rootfs";
   867					reg = <0x800000 0x37c0000>;
   868				};
   869	
   870				partition@3fc0000 {
   871					bootph-all;
   872					label = "ospi.phypattern";
   873					reg = <0x3fc0000 0x40000>;
   874				};
   875			};
   876		};
   877	
 > 878		ospi0_nand: nand@0 {
   879			compatible = "spi-nand";
   880			reg = <0x0>;
   881			spi-tx-bus-width = <8>;
   882			spi-rx-bus-width = <8>;
   883			spi-max-frequency = <25000000>;
   884			cdns,tshsl-ns = <60>;
   885			cdns,tsd2d-ns = <60>;
   886			cdns,tchsh-ns = <60>;
   887			cdns,tslch-ns = <60>;
   888			cdns,read-delay = <2>;
   889			#address-cells = <1>;
   890			#size-cells = <1>;
   891			status = "disabled";
   892	
   893			partitions {
   894				compatible = "fixed-partitions";
   895				#address-cells = <1>;
   896				#size-cells = <1>;
   897	
   898				partition@0 {
   899					label = "ospi_nand.tiboot3";
   900					reg = <0x0 0x80000>;
   901				};
   902	
   903				partition@80000 {
   904					label = "ospi_nand.tispl";
   905					reg = <0x80000 0x200000>;
   906				};
   907	
   908				partition@280000 {
   909					label = "ospi_nand.u-boot";
   910					reg = <0x280000 0x400000>;
   911				};
   912	
   913				partition@680000 {
   914					label = "ospi_nand.env";
   915					reg = <0x680000 0x40000>;
   916				};
   917	
   918				partition@6c0000 {
   919					label = "ospi_nand.env.backup";
   920					reg = <0x6c0000 0x40000>;
   921				};
   922	
   923				partition@2000000 {
   924					label = "ospi_nand.rootfs";
   925					reg = <0x2000000 0x5fc0000>;
   926				};
   927	
   928				partition@7fc0000 {
   929					label = "ospi_nand.phypattern";
   930					reg = <0x7fc0000 0x40000>;
   931				};
   932			};
   933		};
   934	};
   935	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
