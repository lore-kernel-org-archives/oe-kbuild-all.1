Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8D210E4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717947078; cv=none; b=Az+Oz4+VOx1ftOAAazI0q3yjNhvvCTepZmfFD8IAQdnkTfXCw+Fabc0RedbdL2g/h0eBYVNOUMm5V17yuwWKJ536RhFWGCxKoc4HGbkJHPeepjWoZ/M755VomR3c6tEkWmNf2wGIPAjvVWj6WpxlRYQEMZs3XC3RWNu3+u6LDVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717947078; c=relaxed/simple;
	bh=6DFupQ2OQ1VC9a9p/vOyg0wm9JGMVy7qwHi+EupQyRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+HxL4tGTRk/n99BOBaznh8DheZeKVlgn/QwiohAKQ2fgCBZQa+LE+J0E3z1LMV8kV73bAH2cSv8L1OESmyhI/6E/ISvgV9BLi2gT5iMJs9buV3oZPZNjEdoyJeBW63313Wsamuto7jWXiOuoeY/7QEHd1v15ZB1+V326/x40zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOcdcMDv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOcdcMDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717947076; x=1749483076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6DFupQ2OQ1VC9a9p/vOyg0wm9JGMVy7qwHi+EupQyRA=;
  b=YOcdcMDvcMmK6higSoXDstwANuDS6mWjngngaXV29hm8EcwgvjjuP2sS
   16vG6xu7PXHOglJddrvGCa+GX/4Pu7xzuiF5Se/TGD8j8g3x1g9o/UMKY
   eJrcgL1sxjDdC1CNFDZIMYTBMz9lI5Cmd3api+ebkh2rBabeQpUZBwuSZ
   C5Tv6NCuPlxgOkJawrBoVM/Qq6oi6vkCtWBWOTOCBAltvnPFBAzJck5aA
   lKBgIQQW32UrrTggI0El6CNtg0Fgjdo7Y84HvDoSivEfB9PC4tE1jkXLT
   Xy3x/UgrWK73QHpBr0lUS3L/J8y1b2yljAtJbmTEMy1H0jck62ECGDMef
   Q==;
X-CSE-ConnectionGUID: MJ71GwgaQJC9JrqP6zMORA==
X-CSE-MsgGUID: ez5wGWznQSG0hmLRA2MqZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="17537921"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="17537921"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 08:31:16 -0700
X-CSE-ConnectionGUID: idf+6awATfeUsyFizAoHGw==
X-CSE-MsgGUID: rHBQZ5IIRsCZyVCNyACpVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="38750387"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2024 08:31:14 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGKVk-0001Ly-0x;
	Sun, 09 Jun 2024 15:31:12 +0000
Date: Sun, 9 Jun 2024 23:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1507/4582] dtbs_check:
 arch/microblaze/boot/dts/system.dtb: /: memory: False schema does not allow
 {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
Message-ID: <202406092325.F44hxWFE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: 32cf1deb9c04854f76c5882a959b7148b6f32e75 [1507/4582] MICROBLAZE kc705 2017.4 full with cpu-reg fix NEW with reserved memory
compiler: microblaze-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092325.F44hxWFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092325.F44hxWFE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/microblaze/boot/dts/system.dts:498.25-501.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00ba0000: unit name should not have leading "0x"
   arch/microblaze/boot/dts/system.dts:498.25-501.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00ba0000: unit name should not have leading 0s
   arch/microblaze/boot/dts/system.dts:503.25-506.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x017a0000: unit name should not have leading "0x"
   arch/microblaze/boot/dts/system.dts:503.25-506.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x017a0000: unit name should not have leading 0s
   arch/microblaze/boot/dts/system.dts:579.15-588.4: Warning (simple_bus_reg): /amba_pl/gpio-restart: missing or empty reg/ranges property
   arch/microblaze/boot/dts/system.dts:50.4-19: Warning (clocks_property): /cpus/cpu@0:clocks: cell 0 is not a phandle reference
   arch/microblaze/boot/dts/system.dts:272.4-19: Warning (clocks_property): /amba_pl/dma@41e00000:clocks: cell 0 is not a phandle reference
   arch/microblaze/boot/dts/system.dts:284.4-19: Warning (clocks_property): /amba_pl/timer@41c00000:clocks: cell 0 is not a phandle reference
   arch/microblaze/boot/dts/system.dts:339.4-19: Warning (clocks_property): /amba_pl/i2c@40800000:clocks: cell 0 is not a phandle reference
   arch/microblaze/boot/dts/system.dts:560.4-19: Warning (clocks_property): /amba_pl/serial@44a00000:clocks: cell 0 is not a phandle reference
>> arch/microblaze/boot/dts/system.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/microblaze/boot/dts/system.dtb: /: failed to match any schema with compatible: ['xlnx,microblaze']
>> arch/microblaze/boot/dts/system.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['xlnx,microblaze-10.0']
>> arch/microblaze/boot/dts/system.dtb: clk_cpu@0: 'linux,phandle', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/microblaze/boot/dts/system.dtb: clk_bus_0@1: 'linux,phandle', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/microblaze/boot/dts/system.dtb: amba_pl: $nodename:0: 'amba_pl' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/microblaze/boot/dts/system.dtb: amba_pl: gpio-restart: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/microblaze/boot/dts/system.dtb: ethernet@40c00000: reg: [[1086324736, 262144]] is too short
   	from schema $id: http://devicetree.org/schemas/net/xlnx,axi-ethernet.yaml#
>> arch/microblaze/boot/dts/system.dtb: ethernet@40c00000: 'axistream-control-connected', 'clock-frequency', 'device_type', 'linux,phandle', 'local-mac-address', 'xlnx', 'xlnx,axiliteclkrate', 'xlnx,axisclkrate', 'xlnx,clockselection', 'xlnx,enableasyncsgmii', 'xlnx,gt-type', 'xlnx,gtinex', 'xlnx,gtlocation', 'xlnx,gtrefclksrc', 'xlnx,include-dre', 'xlnx,instantiatebitslice0', 'xlnx,phyaddr', 'xlnx,rable', 'xlnx,rxlane0-placement', 'xlnx,rxlane1-placement', 'xlnx,rxnibblebitslice0used', 'xlnx,tx-in-upper-nibble', 'xlnx,txlane0-placement', 'xlnx,txlane1-placement' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,axi-ethernet.yaml#
>> arch/microblaze/boot/dts/system.dtb: /amba_pl/dma@41e00000: failed to match any schema with compatible: ['xlnx,eth-dma']
>> arch/microblaze/boot/dts/system.dtb: timer@41c00000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/timer/xlnx,xps-timer.yaml#
>> arch/microblaze/boot/dts/system.dtb: timer@41c00000: 'clock-frequency', 'xlnx,gen0-assert', 'xlnx,gen1-assert', 'xlnx,trig0-assert', 'xlnx,trig1-assert' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/xlnx,xps-timer.yaml#
>> arch/microblaze/boot/dts/system.dtb: i2c@40800000: clock-frequency:0:0: 200000000 is greater than the maximum of 5000000
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
>> arch/microblaze/boot/dts/system.dtb: i2c@40800000: clock-frequency:0:0: 200000000 is not one of [100000, 400000, 1000000]
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
>> arch/microblaze/boot/dts/system.dtb: i2c@40800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'i2cswitch@74' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
>> arch/microblaze/boot/dts/system.dtb: i2c@40800000: clock-frequency:0:0: 200000000 is greater than the maximum of 5000000
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
>> arch/microblaze/boot/dts/system.dtb: i2cswitch@74: $nodename:0: 'i2cswitch@74' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/microblaze/boot/dts/system.dtb: i2cswitch@74: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/microblaze/boot/dts/system.dtb: /amba_pl/i2c@40800000/i2cswitch@74/i2c@0/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
>> arch/microblaze/boot/dts/system.dtb: flash@60000000: 'partition@0x00000000', 'partition@0x00b00000', 'partition@0x00b80000', 'partition@0x00ba0000', 'partition@0x017a0000' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/microblaze/boot/dts/system.dtb: /amba_pl/interrupt-controller@41200000: failed to match any schema with compatible: ['xlnx,xps-intc-1.00.a']
>> arch/microblaze/boot/dts/system.dtb: /amba_pl/serial@44a00000: failed to match any schema with compatible: ['xlnx,xps-uart16550-2.00.a', 'ns16550a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
