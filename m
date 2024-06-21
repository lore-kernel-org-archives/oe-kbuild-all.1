Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC4D82D72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 02:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718935878; cv=none; b=JrwMK4ZsBrJ8vqJY7dHJkuo85AV19LcWlZykondjQGOGIHJMlFCBvq9CEkyFYYpyTWMV3ZsqR9H8DqTa1dQ68bW3T0uF5unEKS8tC6okKDtH2vDp6Y8jLgo9b81o/MjRUy2AiuVSnAJVsK+wQ3C7s9CTZupLWUM1hUDreQeE534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718935878; c=relaxed/simple;
	bh=fkKBRMexMoyD9QY0ZJWI0+TIJvk0CtIJBIpPafxJcGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZ5b+TyAbBk2KUoUe4cOqP73R14Q5ajVCmFhEnzx4z26XKno+Yd36/75EBeSzaLm+qEYbp2j83N3qLxvmUCRLHvZwy4LfCVdI+sWpPgiIhAlVerD+b/vA+bxapSzqsUuOR/se+qeo9kMMGXCw5DI26yjYdDpx6nHlzV31D5H9Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNk37aeL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNk37aeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718935877; x=1750471877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fkKBRMexMoyD9QY0ZJWI0+TIJvk0CtIJBIpPafxJcGc=;
  b=kNk37aeLA22+Njlyjm/XTFdeuUj58mQBpVG9IEOQSRq5hSweKsOrscIs
   bLZpJaN5K1XXCMj9ZoKsrnnsmAWGtOWTuBa0VXPlsJXIP7KT58wPMegcZ
   K+H6II6VLIz1Q406HXKekm7d38m9jobKJPTPyf6FGTziQ7YpjKegjBJ+a
   U0aJ1qR+sd08o3X8DzZMAYwb/1io+angpUcXkFV6+1IpymWgDxb0jzz/v
   zGMnY8mUduFcFI43GGlfopjVzo/LnnDbZI7wCUOSHPZT6oDEj1HspAR+o
   l+asoLV2RbVABORZe/MneJ9GL/gEEJbFZA+FaDjPB/ppaOhkYS06y/JRn
   w==;
X-CSE-ConnectionGUID: Nm6R+3SqTLSj+f6e9wCCEQ==
X-CSE-MsgGUID: TujlQ+peQje1NaS3fclgig==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16096259"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16096259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 19:11:14 -0700
X-CSE-ConnectionGUID: sKUfL5J5TiqCMbrDHoOtbA==
X-CSE-MsgGUID: 6bmLjkmTSd6szs9DTv6Cew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42522754"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2024 19:11:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKTk6-00086w-15;
	Fri, 21 Jun 2024 02:11:10 +0000
Date: Fri, 21 Jun 2024 10:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 77/88]
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning
 (avoid_unnecessary_addr_size):
 /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406210927.u0QMtkFV-lkp@intel.com>
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
commit: 0741ba93d7db69bc8e084f822ed3be35b86de6a0 [77/88] arm64: dts: k3-j721s2: Add node for OSPI NAND Flash
config: arm64-randconfig-051-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210927.u0QMtkFV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210927.u0QMtkFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210927.u0QMtkFV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning (avoid_unnecessary_addr_size): /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1926.34-1935.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: pinctrl@11c000: 'dp0-pins-default', 'main-i2c4-pins-default' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: video-codec@4210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

vim +523 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi

   463	
   464	&ospi0 {
   465		status = "okay";
   466		pinctrl-names = "default";
   467		pinctrl-0 = <&mcu_fss0_ospi0_pins_default>;
   468	
   469		ospi0_nor: flash@0 {
   470			compatible = "jedec,spi-nor";
   471			reg = <0x0>;
   472			spi-tx-bus-width = <8>;
   473			spi-rx-bus-width = <8>;
   474			spi-max-frequency = <25000000>;
   475			cdns,tshsl-ns = <60>;
   476			cdns,tsd2d-ns = <60>;
   477			cdns,tchsh-ns = <60>;
   478			cdns,tslch-ns = <60>;
   479			cdns,read-delay = <4>;
   480	
   481			partitions {
   482				compatible = "fixed-partitions";
   483				#address-cells = <1>;
   484				#size-cells = <1>;
   485	
   486				partition@0 {
   487					label = "ospi.tiboot3";
   488					reg = <0x0 0x80000>;
   489				};
   490	
   491				partition@80000 {
   492					label = "ospi.tispl";
   493					reg = <0x80000 0x200000>;
   494				};
   495	
   496				partition@280000 {
   497					label = "ospi.u-boot";
   498					reg = <0x280000 0x400000>;
   499				};
   500	
   501				partition@680000 {
   502					label = "ospi.env";
   503					reg = <0x680000 0x40000>;
   504				};
   505	
   506				partition@6c0000 {
   507					label = "ospi.env.backup";
   508					reg = <0x6c0000 0x40000>;
   509				};
   510	
   511				partition@800000 {
   512					label = "ospi.rootfs";
   513					reg = <0x800000 0x37c0000>;
   514				};
   515	
   516				partition@3fc0000 {
   517					label = "ospi.phypattern";
   518					reg = <0x3fc0000 0x40000>;
   519				};
   520			};
   521		};
   522	
 > 523		ospi0_nand: nand@0 {
   524			compatible = "spi-nand";
   525			reg = <0x0>;
   526			spi-tx-bus-width = <8>;
   527			spi-rx-bus-width = <8>;
   528			spi-max-frequency = <25000000>;
   529			cdns,tshsl-ns = <60>;
   530			cdns,tsd2d-ns = <60>;
   531			cdns,tchsh-ns = <60>;
   532			cdns,tslch-ns = <60>;
   533			cdns,read-delay = <2>;
   534			#address-cells = <1>;
   535			#size-cells = <1>;
   536			status = "disabled";
   537	
   538			partitions {
   539				compatible = "fixed-partitions";
   540				#address-cells = <1>;
   541				#size-cells = <1>;
   542	
   543				partition@0 {
   544					label = "ospi_nand.tiboot3";
   545					reg = <0x0 0x80000>;
   546				};
   547	
   548				partition@80000 {
   549					label = "ospi_nand.tispl";
   550					reg = <0x80000 0x200000>;
   551				};
   552	
   553				partition@280000 {
   554					label = "ospi_nand.u-boot";
   555					reg = <0x280000 0x400000>;
   556				};
   557	
   558				partition@680000 {
   559					label = "ospi_nand.env";
   560					reg = <0x680000 0x40000>;
   561				};
   562	
   563				partition@6c0000 {
   564					label = "ospi_nand.env.backup";
   565					reg = <0x6c0000 0x40000>;
   566				};
   567	
   568				partition@2000000 {
   569					label = "ospi_nand.rootfs";
   570					reg = <0x2000000 0x5fc0000>;
   571				};
   572	
   573				partition@7fc0000 {
   574					label = "ospi_nand.phypattern";
   575					reg = <0x7fc0000 0x40000>;
   576				};
   577			};
   578		};
   579	};
   580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
