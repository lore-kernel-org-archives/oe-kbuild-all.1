Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217833;
	b=ZiQBvoZh5vvD0m7oVwOOhfBtgz7hUup8gyHenWDhCxpMzwpIMQXV7ic9prbvuLcEWfnC
	 grSGHk8G2FYeSn3gAwqDgH+a1Ys+eqaEd/XDsa+z2fmknmXdmF+3IpvBre5QBoCvLnE2W
	 YXtGwnJJxBkGJi7bktFGjjpZgyFgPbHS+jxqu+fXe+mi3jb4rzGxj6C9VbTNaanXGhmOW
	 OVmxLw/euXOSXVB+R/r2LPlRpc8rVipePDsxizbTCxYIf4KAPRVnJAYVRlXGD/sc481Ql
	 EO9lIKFEVBOvDXMUkUVHr5Y1LLTl5tCfVMxBawY08a/Xz1DNg7fEeY2LKcR9wMLYBdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217833;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tpbnIu/d3rLM5M1JvjPqptl33WibOEP3jqE4e3G6LME=;
	b=v8plQk4ypFsIFIonjyz2W7nFzZL5X/IYNiY8umpV9iS62mK+PujpioYgcaYN1SB07J5z
	 pogY8cRjrOl7E9qVNrM9FTcjzj+ovfRUOVbQRKv5HgGhfUzH5yvHLnAAqEYeed1keqA8F
	 MKIzsqvygmLpdui6OZSDt7VraqOGL3rr8naiJZHK51lExzHpHBs6dVb+wFKo7y563JlOq
	 NvjHfCGgu0sSF5YV7dFKRcBdU08lMFx2ZRH7S3JVwDPchdjgqM20S5jQUlbunb71/rdDy
	 Sk7hetcEfbzp7IECBJJLdZPqExYUDmKtN6kcI0pGLxQbJExdrT0L/C1IQZEDpNGXBRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESYGBZyM;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE93606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 20:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE93606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESYGBZyM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793217833; x=1824753833;
  h=date:from:to:cc:subject:message-id;
  bh=UTT28YlIMxCksOhUGVqy2waCnusrPaDkZ3v66p+Rh60=;
  b=ESYGBZyMvaG7/ZG4lkIyrRCyPHVBPjKWUTZQ67bp46bSdb3ikYaYFszx
   cQYo6yMGylTVVNymgRJ8dV1BpGMka67ZGOaTi43EuU+SqaOzHm1cXUcxT
   r5pmweMO3LuQ8j8x4Jy+iNq/2hqNBEr3KKyG5b4nZk7fu+1FUIROOpH8m
   xGnhXV0lV994XNuYIRcVosYplQB74t8oby7eQ12JSExB/PNRjIdZ7ddOm
   AiOmxbHelFPe3w3Mdow1dI5lWyCB0lKTOYRBttQdDuVPd123xhmj4S5hK
   ygoWQkEt7cJXjeGHgeKh60CS1lda0A38SOC6PhMTJbgfgtIIEPZUcJmYd
   Q==;
X-CSE-ConnectionGUID: Aq0/3M2/QwiXY5xgjbPkoA==
X-CSE-MsgGUID: RVY7SbWhSAmjBL2LUSB6pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1838553"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1838553"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 13:03:52 -0700
X-CSE-ConnectionGUID: 5EdgMkTnQSyzTXBR8PE5nQ==
X-CSE-MsgGUID: hg5GYphlQg6MyieBPxLovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4868418"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 Oct 2026 13:03:50 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM9sC-000000004yD-00Lr;
	Wed, 28 Oct 2026 20:03:48 +0000
Date: Wed, 28 Oct 2026 21:03:45 +0100
From: kernel test robot <lkp@intel.com>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>
Subject: [linux-next:master 17492/20300]
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: soc
 (simple-bus): sdramedac: 'ranges' is a required property
Message-ID: <202610282129.EbfEAoVo-lkp@intel.com>
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
head:   f1ac44c32cba88ad65dcecd4a279661d14e93651
commit: bb3f9d4267bad8948a10e12b15aeeb0daaff8fa8 [17492/20300] arm: dts: altera: add Draeger M48 CPU Module
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261028/202610282129.EbfEAoVo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282129.EbfEAoVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282129.EbfEAoVo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:88.33-95.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:562.40-566.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:713.18-731.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:825.13-829.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:936.19-940.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: soc (simple-bus): sdramedac: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dtb: soc (simple-bus): stmmac-axi-config: 'ranges' is a required property
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
