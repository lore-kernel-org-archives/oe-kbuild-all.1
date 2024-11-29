Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70019F419
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 18:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732904983; cv=none; b=piHpivzUlJxBdIj29oDI2atSwITZ26YklAgCgZ+7YnvHuBnYntaCJGN1FEOqAsx3NHhLts8qMzT0zE65AeZX8mZ/rUoCRGN8fhJp+4W39a5IMliIKnryMc+6xalaIMAdlJiDZ0ads1yngAHuaSEIn6ZgjI4StzQn1+oPfrzHj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732904983; c=relaxed/simple;
	bh=Od1ewHDB1GRCnRXXtHmXUYol7Uj3MVA1IyVyqbmMwxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pG2mRyqI9EOhZ3lHHn1YnFUMXlwLM+vX8mH6QcbvKIido0kq3v+UEh2ywKk+R1w9X0JgBFe6fAiG4hQ0e6f8IgD8oiuR3oFvIuHQR5AWsaU0UhcV//c+5Jic3ijGI0GdE8HlTq6oc1Rlw73HLL9IChvdOwl2BjvKUFHqkjmh94Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrEpSRuG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrEpSRuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732904981; x=1764440981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Od1ewHDB1GRCnRXXtHmXUYol7Uj3MVA1IyVyqbmMwxA=;
  b=SrEpSRuG+qA+eHa7At3EJebVPEk2yz0qsNgYBLilH28MuAfrwchcRj7k
   sJD+lBFfr1ujMFdvcAkVfpghRUE+8prR4m7QGnjwnWTHjlU2LLk5n3oT3
   VNggq7lcs5wuTUgPt63ECtDVRhh8GdCQeah6qKYg3BB04mnxsFkNgf9O8
   UQUXs8L90yidLXx5KT9cZXT4qXNlJkbyRlGLGQ4sp/EQsyONZg9AlGKKd
   /3J7ydR5JjfPpS320Kd3OgEQHVB5L/CJi7BSOpO5WmKG431jjz9sZg7sK
   nUpGjZtjqjpgh8GFmSpTYmjOroLH6FlhJvYDIiwvAujmnIGHD2a2Q1udJ
   A==;
X-CSE-ConnectionGUID: GINzmHuhQ7yR+KpHVkOivA==
X-CSE-MsgGUID: LjQH2RDfQz67l0KMgTNFAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32888588"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="32888588"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 10:29:40 -0800
X-CSE-ConnectionGUID: mNVkc9leQoaizWe3g1YVWw==
X-CSE-MsgGUID: QgszIcY0Q3KvPE/4G8dr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92718650"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Nov 2024 10:29:39 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH5kH-0000cH-0T;
	Fri, 29 Nov 2024 18:29:37 +0000
Date: Sat, 30 Nov 2024 02:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 4/12]
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pcie@112f0000:
 Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply',
 'pcie3v3-supply' were unexpected)
Message-ID: <202411300236.GvYkKLzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   22391773c96a76f5cba5972c786b97987346a51e
commit: e36cbaa8b87ddca6de0b22c587aa4991210b87ff [4/12] CHROMIUM: arm64: dts: mediatek: mt8188-geralt: Add PCIe power supplies and reset
config: arm64-randconfig-051-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300236.GvYkKLzL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300236.GvYkKLzL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300236.GvYkKLzL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pcie@1,0: '#address-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@1,0: '#address-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@1,0: '#address-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue1:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pcie@1,0: '#address-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: compatible: ['ti,tas2563', 'ti,tas2781'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: Unevaluated properties are not allowed ('compatible', 'reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pcie@1,0: '#address-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: compatible: ['ti,tas2563', 'ti,tas2781'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: Unevaluated properties are not allowed ('compatible', 'reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pcie@1,0: '#address-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: compatible: ['ti,tas2563', 'ti,tas2781'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: Unevaluated properties are not allowed ('compatible', 'reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pcie@1,0: '#address-cells' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue2:snps,priority: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue3:snps,priority: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: compatible: ['ti,tas2563', 'ti,tas2781'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: reg: [[79], [76]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: Unevaluated properties are not allowed ('compatible', 'reg', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2562.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@1,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pcie@1,0: '#address-cells' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
