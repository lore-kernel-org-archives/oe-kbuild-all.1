Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369734;
	b=ivH3kmHFSa9ge5y4Ez930KjefaPLcMdH0NUyiRIlxYsRtQNbHLixkK+GZHgTHyfO+3GH
	 evQ/GhTuxPCGN3mm12NCesdXea/DwTjNezRsAQs3/jYFZqLHrekeVok3gvFy5Zr5OI++R
	 Mv5olu3XMzyq07/CVK5jQeFC7bJZ+Ay8CaHCeGRyqjx+r3VRht3xqi2jWcOX5guiK/Roq
	 IsAavjp8FgA2FoRC455d+93bsW59m0yvRMwvgiCj9AMbYn1p6/ARZjKAamdq3E5TJEp3u
	 UbBq+A23rfr5PbvN0LUOjOium/tYJyW63CN/dnrvYte0PU6s35qPrXucG3MvsuAy1bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369734;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=COZKGDv6FN0VWECej4AYlsAwMzK7uihzCEsnwu6YXe0=;
	b=Oq0dryS3Jyr6buMVs0Nf64hO4kbcdfq/rO0T/1vbS/ILmSK5zXqx1o5JYiyYt/biFB0n
	 tBVLVPPBMiSGQUWkF5LU1VJfU9U6rbdxbgm86/nI7ARN2CGXjG6K/Ueq7kDdlTQp+co++
	 EDeVFDB8Oqqc9AuVWXi26+deef1UrCOV4ffUmwEeRWfKFeOLSUZVZqwVs73hUKldlBJNC
	 3r9zz/aWAtx/TxcGrsMweD+H+X+ZB4m6yEw7oZH2JAHjGXuYIZjR3O/VJUUzcfVtR0GVx
	 J2cK/At8DEO5u4kwJCQbQD3ahpm8vxu9VI4Wxjx1mPkWr6fNyxseE1v4N3qWITchxtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fYqmWV+v;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB73606A31D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 14:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB73606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fYqmWV+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793369733; x=1824905733;
  h=date:from:to:cc:subject:message-id;
  bh=+rXXS3JXECB63pazWpWY1my7hAqXAblVMmb+S3BvrQE=;
  b=fYqmWV+vpOh4+eExIVujH6Wf+/2rrrFl+rU8E3xJw77c3xcPZDiV1t2N
   bikmSwpmz1+a/obRIfUf5Vblw78PegIrHYga9xawPrSi689lFRGPGfVD3
   JbeyyUeW49LD1BQxGxzJwGZ1sdAsaP0vqtQaP4ocRs3GfOGnJp/BRkPLp
   MF2tx4n4cUGtwqQdJ6pRdSp8FEhpz54PhHKWSLafaNM6COvnaoW6WtBF9
   KkrqgrYTiQPt4GRZ/ZAbZLlE8mpx218QLLGA3BcjdvsCe/9qEG1CxTkDh
   cI6KUCK6+UgT9NJEuaqqUdzrfUpNSb8XJpemIB5To/nSVUC3B/SY0uiWX
   w==;
X-CSE-ConnectionGUID: 6sTNkVinQGG39n3dnCWrww==
X-CSE-MsgGUID: 3foQjXVWQ9KI7FgXiZwbGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2127655"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2127655"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 07:15:32 -0700
X-CSE-ConnectionGUID: gW0G8kU0RhGa794RnqaJsw==
X-CSE-MsgGUID: tpVBZZpiQw2d96ilBSUQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5573377"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2026 07:15:30 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMnOC-000000005bD-2bFY;
	Fri, 30 Oct 2026 14:15:28 +0000
Date: Fri, 30 Oct 2026 15:15:12 +0100
From: kernel test robot <lkp@intel.com>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>
Subject: [linux-next:master 17412/20790]
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: soc
 (simple-bus): stmmac-axi-config: 'ranges' is a required property
Message-ID: <202610301534.Sf5qbcye-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
commit: bb3f9d4267bad8948a10e12b15aeeb0daaff8fa8 [17412/20790] arm: dts: altera: add Draeger M48 CPU Module
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261030/202610301534.Sf5qbcye-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301534.Sf5qbcye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301534.Sf5qbcye-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:88.33-95.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:562.40-566.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:713.18-731.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:825.13-829.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:936.19-940.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: soc (simple-bus): stmmac-axi-config: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: soc (simple-bus): sdramedac: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: soc (simple-bus): usbphy: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: amba (simple-bus): $nodename:0: 'amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: pdma@ffe01000 (arm,pl330): $nodename:0: 'pdma@ffe01000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: osc2 (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: timer0@ffc08000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: timer1@ffc09000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: timer2@ffd00000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: timer3@ffd01000 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
