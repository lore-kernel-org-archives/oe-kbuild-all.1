Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14A18E341
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724138425; cv=none; b=DM0HEwqVmu/WIELJS2sWHVym5C3Z3SGCkpPCTIpcY3vcgDJ9TWnf91ebsQpzsHOV+JTH8tpdVzGQMfhzE0d1Up57+Ho0C1xSf4VvC/ZiqwudpDY4al4xiwiyiaUa57GM1ZZl+SYa5/F+/VTrvu88spYHFGVk42K3Qs/nglsjLjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724138425; c=relaxed/simple;
	bh=25wAd8s/cH/PBzXlK3cGCVxaNF5g3F4McT30xEMrQZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGWKZdIk+jybr6Dv0OBHs1AwouWIDlXohGEPUHg23uxNTZfsgVgeNIG1fRJcskxyCbw4donqwgcsv17RbSGm7RQ5zpJxkd3AH6D1E1NCbZL2nYmyXKAsl/63J9bPdM1vv8oYPh0rNOLqBPn6uykWT+1gMz3Cdt+tf3gFjDkWoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJOFoDPO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJOFoDPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724138423; x=1755674423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25wAd8s/cH/PBzXlK3cGCVxaNF5g3F4McT30xEMrQZ0=;
  b=EJOFoDPO1qxFHIHg/EQ2gGD8rEnSXerIZNIaVOGMsw6Cs+4ajCGo71DP
   lVZrvxE5sClhZ5Ij95fElKc4+ULmHZW67hLnDwmsibDGRdnG71RaH0OmM
   ZCiUsCJuFIcUBgJrhwuvqPfY1FHciI0Ll+jgW8QfndjDuEVJMMVuIFaoa
   Iz7TPlcHiG1d1AoEIty9kl0ht0v/742x7Iyaj+i8dcJZJyLYCqFPOrDwO
   OmZ3MKFql9wodTTTSHP+kHBl8EvvOz14O1TxcAvhrgal2faMmj45rMBO5
   Dv58JrFQR0mob23AYkC/0u6cHJram3t/WDGvetrE4iwXmrkK/SrXjGtPO
   A==;
X-CSE-ConnectionGUID: iZbiqVsDTPe3E+nyUoRDnw==
X-CSE-MsgGUID: q4pltvaIT728T1rRNOo2Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21959428"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="21959428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 00:20:22 -0700
X-CSE-ConnectionGUID: JmjTbLDJRjGUiaWUGjsTLQ==
X-CSE-MsgGUID: 9h1P/iZuSOicEK21nBjKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="61400406"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2024 00:20:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgJAA-0009q4-1I;
	Tue, 20 Aug 2024 07:20:18 +0000
Date: Tue, 20 Aug 2024 15:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Aryabhatta Dey <aryabhattadey35@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 5288/5508] arch/arc/boot/dts/axs103.dtb: pct:
 'reg' is a required property
Message-ID: <202408201521.40iWIlS9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bb1b0acdcd66e0d8eedee3570d249e076b89ab32
commit: 4b989e6e1a4fd726271fac589782ac1f4cb6bf55 [5288/5508] dt-bindings: arc: convert archs-pct.txt to yaml
config: arc-randconfig-051-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201521.40iWIlS9-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201521.40iWIlS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201521.40iWIlS9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axs103.dtb: cpu_card: 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
   arch/arc/boot/dts/axs103.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/axs103.dtb: dw-apb-gpio@2000: $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000: $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103.dtb: pct: '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb: $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb: sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb: connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: usb@40000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-gpio@2000: $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000: $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: pct: '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb: $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb: connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb: sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: usb@40000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga: interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: fpga: core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000: no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs.dtb: serial@f0000000: Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs.dtb: pct: '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga: pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: fpga: core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/haps_hs_idu.dtb: /fpga/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000: no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000: Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct: '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   arch/arc/boot/dts/hsdk.dts:201.34-205.5: Warning (simple_bus_reg): /soc/dmac-gpu-cfg-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dtb: /: memory@80000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arc/boot/dts/hsdk.dtb: /: failed to match any schema with compatible: ['snps,hsdk']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/hsdk.dtb: /idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
>> arch/arc/boot/dts/hsdk.dtb: pct: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/hsdk.dtb: pct: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/hsdk.dtb: pct: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/hsdk.dtb: /timer: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/hsdk.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']
   arch/arc/boot/dts/hsdk.dtb: soc: gpu-cfg-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc: dmac-gpu-cfg-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc: dmac-core-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc: mmcclk-ciu: 'ranges' is a required property
--
   arch/arc/boot/dts/nsimosci_hs.dtb: fpga: pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/core-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000: no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000: Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct: '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/core-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000: no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000: Unevaluated properties are not allowed ('baud', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct: '#interrupt-cells', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
