Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E21B4245
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737449188; cv=none; b=Q2A3tY6fmVuiYeGDu3xp1jvOd1RFk8gF31CVQ/RMR48KlRGNcC925O30FLf9nnQX39Mp2b6NnljJ43Uv8BMrxODPGI5irrQYjJsuxZQKLpp+0NreZErk43vy6oGPEk0b+T8j3y2pigMpSc4CED84Zeyp6fOOQHSYAn6yKw6Phkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737449188; c=relaxed/simple;
	bh=8JWJiztHzM8S/EGNVvCWqE2eyJZu58jL3Ab1RmK0sKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FddUszpXeS5nkjsNNAF7T4AfmACm2Nml1BmZO1hz8M22r4HBA5kDQQinaI5Z5wTtVPByhFhVtAdm9zRhrlY0NS2YZIbEFtPMSpE6Eh6TQGWpZODlaIHGNnZr93V8071LY3R0ZEWACO52I69bvfDas5j/OZYYX7xfUPTza0kk5YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQSM+rWd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQSM+rWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737449187; x=1768985187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JWJiztHzM8S/EGNVvCWqE2eyJZu58jL3Ab1RmK0sKg=;
  b=LQSM+rWdSvFxIe2hGJuPHzxzbSqvIaxEyVeojPEW66zXM68A423TynTn
   bzjtn2j0nrAR7hcKErmZQXGnupE188ze+etswtqYqhjU9Nk8YJE0zGd9q
   w8sWZTH/xCATxIM2ea14PWPcQftHVBR5TTq0N8lNA6bk6Xf3WWUoQP6pH
   shOiKukA+nskDtX6sLK1Vav6xIS8YCxdrMEsSHXlFXB7wgdvYqgjtCxIQ
   Qw4js1vfCek+dmkbSQSAIzimuk5f+iyFtfn3v/eftuf2FqQF6KBx2M7Ly
   U8uMqCWf7Od7WkXrWHgpMVMrcwiJy3Bh6pMZZcUYVz4GQIze5z0tgR05u
   Q==;
X-CSE-ConnectionGUID: rMTct0e1SWOIOvTddDASYQ==
X-CSE-MsgGUID: qDkKIJzKSpKZK+YSO1XeZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="25451135"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="25451135"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 00:46:26 -0800
X-CSE-ConnectionGUID: t+ncFJPISqeu4ydWw4zG1Q==
X-CSE-MsgGUID: o0cscHX0QxGmafAFhS5I7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144002280"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jan 2025 00:46:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta9tu-000XrH-0W;
	Tue, 21 Jan 2025 08:46:22 +0000
Date: Tue, 21 Jan 2025 16:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 333/333]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /: regulator@0: 'anyOf'
 conditional failed, one must be fixed:
Message-ID: <202501211647.KXl06wfZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1f4dbd9903f644aa6c511f8a1e145ec3f4915d3a
commit: 1468cdcfa0ac2513ba51ea93a575e951453e928f [333/333] CHROMIUM: arm64: dts: mt8196: Add usb dts
config: arm64-randconfig-052-20250120 (https://download.01.org/0day-ci/archive/20250121/202501211647.KXl06wfZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211647.KXl06wfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211647.KXl06wfZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:19.27-26.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:569.37-594.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /: regulator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8196-evb', 'mediatek,mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /: failed to match any schema with compatible: ['mediatek,mt8196-evb', 'mediatek,mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: idle-states: entry-method:0: 'psci' was expected
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: idle-states: 'clusteroff-b', 'clusteroff-l', 'clusteroff-m', 'cpuoff-b', 'cpuoff-l', 'cpuoff-m', 'mcusysoff-b', 'mcusysoff-l', 'mcusysoff-m', 's2idle', 'system-vcore' do not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: $nodename:0: 'clk-ao' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: spi@16340000: clocks: [[38, 188], [33, 60], [33, 64], [33, 66], [33, 68], [33, 62]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: spi@16340000: clock-names: ['spi', 'sf', 'axi', 'axi_s', 'bclk', '27m'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: spi@16340000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-nor.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16340000: failed to match any schema with compatible: ['mediatek,mt8196-nor', 'mediatek,mt8186-nor']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16640000: failed to match any schema with compatible: ['mediatek,mt8196-pericfg-ao', 'mediatek,mt8196-pericfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16640000: failed to match any schema with compatible: ['mediatek,mt8196-pericfg-ao', 'mediatek,mt8196-pericfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: compatible:0: 'mediatek,mtk-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: compatible: ['mediatek,mtk-xhci'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: mediatek,syscon-wakeup:0:2: 107 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb@16700000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb1@16710000: compatible:0: 'mediatek,mtk-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb1@16710000: compatible: ['mediatek,mtk-xhci'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb1@16710000: clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb1@16710000: clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb1@16710000: mediatek,syscon-wakeup:0:2: 108 is not one of [1, 2, 101, 102, 103, 104, 105, 106]
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb-phy0@16730000: $nodename:0: 'usb-phy0@16730000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb-phy0@16730000: compatible:0: 'mediatek,xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb-phy0@16730000: compatible: ['mediatek,xsphy'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb-phy0@16730000: 'usb2-phy0@0' does not match any of the regexes: '^usb-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb-phy1@16740000: $nodename:0: 'usb-phy1@16740000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb-phy1@16740000: compatible:0: 'mediatek,xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb-phy1@16740000: compatible: ['mediatek,xsphy'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb-phy1@16740000: 'usb2-phy1@0' does not match any of the regexes: '^usb-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: $nodename:0: 'usb3-phy0@16773000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: compatible:0: 'mediatek,xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: compatible: ['mediatek,xsphy'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: 'power-domains', 'usb3-phy0@16773400' do not match any of the regexes: '^usb-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@167a0000: failed to match any schema with compatible: ['mediatek,mt8196-usbwkcfg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
