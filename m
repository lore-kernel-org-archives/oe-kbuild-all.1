Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C819048F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729291992; cv=none; b=K0/ZpZf7oYtYy6xHXrakP7+CBQXEPjsaLfYESWbyAAVQDGMrOhymB6E359BIeugEiEkGBTfnl/GyLMxLhNny48ZJqvDeRa7jdTkZCnqC6QShDveIS7NsznTR4UEOG2d7Wr9VPU4b3yqTjzJ2EaZAcRE1G+IT2w1Tlp8b2QssT0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729291992; c=relaxed/simple;
	bh=kbCdwtQhV8AvCD6Tsj4oq+71YWg4YdVbx4gRWDGtAQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xbpi+aZf7WRf96qV1rPmlvCuWamlCEt6vi+N2NyqrRcmGAp2DC/g0AesylopPKijGrrivD99WkxS9X4Tg/Rj0V8IYizh8U9ZInY8B5Bd4tOZRPtyiFlc9LLA2LicniN8WAnJlk+oYspbJe84DCe4YhtqjaOkteAdALZiq3c7KEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ff2g03mt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ff2g03mt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729291991; x=1760827991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kbCdwtQhV8AvCD6Tsj4oq+71YWg4YdVbx4gRWDGtAQU=;
  b=Ff2g03mtU6wQMvL9Yqgk1uXnEhLIhyfZDpOfFpU5KYNmbDp3rzrHhpC2
   ca/q9qnGlP6+fNXogXI7IuGgzGbQ56WJ/yF/cVdXiy32SWoDj/lGrK2kc
   bGc6w68i1UFmLkbEeKlyAWUOPlGjKpqgeRvkDuYtMbg7hOf0Ie4AGPAQw
   iHGrW6QtsOhSez/L2FPqefHf28Et2j2qQxLT1p48pWo50mpIAPmuqNfBz
   EyVYs7IDY4xvWeLfnTSfGoMI/rNgszcVeVih/r15/AQ+EueXfdpNXseDH
   zhdLZvFi7MRE9JJPMQ1cKhJuXqD08fpoZbpATr0kq3gm0dhu13NpbeC9z
   Q==;
X-CSE-ConnectionGUID: x2jICl6eSnSxg7YsX+oykw==
X-CSE-MsgGUID: dh9jnmuORTulsCGznhl+5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28717953"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="28717953"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 15:53:08 -0700
X-CSE-ConnectionGUID: D8Mk431uS8Wdy6FCLUhhbg==
X-CSE-MsgGUID: g3bvPArBStGex+5aDpHpEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="82960924"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2024 15:53:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1vqC-000ONT-2B;
	Fri, 18 Oct 2024 22:53:04 +0000
Date: Sat, 19 Oct 2024 06:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 32/44]
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning
 (avoid_unnecessary_addr_size):
 /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202410190611.FLd42NlP-lkp@intel.com>
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
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241019/202410190611.FLd42NlP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190611.FLd42NlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190611.FLd42NlP-lkp@intel.com/

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
