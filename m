Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2683BB22
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 03:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220584; cv=none; b=kNeF+CCBEiQvV1PP5P4jwQj/yrsM18o68Ztr51lvBuwr30h2mwMbOocRExveVpwBXazarZ7QRCyR/FxTYfFV9NOKNNjcwpp744GfiSDoCuLDj2tjShjMTGKju/suFYgs05EpGX96tw9TgcVmjK1FmD+9bloN9JpxCz2vwDc0ZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220584; c=relaxed/simple;
	bh=07kqibCjPhnARUpDgP8OspRBduTBcOn1hqWOabS0neY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s8yN05jo47h1guPAPTWDgtKVe3bB/qpmwBpxcuvmWk8AbOPzbAbeEwaTTjMBhqm2Yr4Azfz44V2O3klriTzrs9tI/E8U8uTMggWb5uON984Q2xtEEzQzJcw6xATOUOkCB4B5ra8EHDc9mR+wo0nDYqz+7Cw4xhFRUJsWHxm23Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIXedff9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIXedff9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729220582; x=1760756582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07kqibCjPhnARUpDgP8OspRBduTBcOn1hqWOabS0neY=;
  b=PIXedff90WbVEOo+8py5AUuKrrwE+iYSDwqrgYvq1J6wia0TTanGcUCo
   SIlZDWZqbOAWL2LHirTEE/uwvhgjP//W6Jd1c0NDhwVBS2LwZtS0PY42D
   Wyxz69B/LTVA9yVHv996fau4OK3hojfequWhg5QC5a2RnGuOSQud9xdXX
   XbpnGad9pLaOHXw5Yq8CE4tmeVIiRlEFVsSDrbaZEC6u3W9Jy4r+8u5RB
   Nh4rvkNP7T2xH3cbzqNy2Io7QXfWehGPOxX+ItSVIpXZurMRATx/B48IO
   UWD3rw0nAMu2xQwKmTbJYX+J2SGQb4kWHdyeWT9a6XqW/33C2XrqsGUq0
   g==;
X-CSE-ConnectionGUID: St3T7TadRe+o0SCDVYMIrA==
X-CSE-MsgGUID: VrNuVp42QrK2SDi84EaSdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28621306"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="28621306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 20:03:02 -0700
X-CSE-ConnectionGUID: TuHPbAwgTZyupQsHqVLveg==
X-CSE-MsgGUID: neOD905lSaCJvC2McysKKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="83383153"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2024 20:03:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1dGU-000NCT-1p;
	Fri, 18 Oct 2024 03:02:58 +0000
Date: Fri, 18 Oct 2024 11:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 32/44]
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning
 (avoid_unnecessary_addr_size):
 /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202410181004.UYRhmOyp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 2640dbd4d366c468dba3337bf5aa5d8d32c63248 [32/44] arm64: dts: k3-j721s2: Add node for OSPI NAND Flash
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241018/202410181004.UYRhmOyp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181004.UYRhmOyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181004.UYRhmOyp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning (avoid_unnecessary_addr_size): /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1353.34-1362.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:469.21-521.4: Warning (unique_unit_address): /bus@100000/bus@28380000/bus@47000000/spi@47040000/flash@0: duplicate unit-address (also used in node /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0)

vim +523 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi

   463	
   464	&ospi0 {
   465		status = "okay";
   466		pinctrl-names = "default";
   467		pinctrl-0 = <&mcu_fss0_ospi0_pins_default>;
   468	
 > 469		ospi0_nor: flash@0 {
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
