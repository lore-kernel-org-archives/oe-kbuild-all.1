Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964AF3716F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715182233; cv=none; b=EZTVoYiTp2SE+swcKWmGotd1hmhJepaz5WAyhVXgeX89pZGTzjw/ThtBWoVqH5UNzfeTSnSkSu4mHRkMR//bEdaEw1hZTwBqFr+oKoSq5CQs1uYba3RRAeah9c+yPWeXXZdYrZas6zIJj32UmDiWDc5qs3+5aMM+GMogv4xV6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715182233; c=relaxed/simple;
	bh=3vzZQfqjxU8pXk3iEhHORk1deIpPXCB4V3YAFX7HQ5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJu7ZZ1aHcHsfScaMIPeIAWmdNS96sY7bohalFAd20pUK+TlVfPCn4ykZJURqJCfPO7lcq7ZJAaVHLNqfZLsTNphlWZy2ulyMKaUn3O145UOJIHejokYb9GIL6ep8xIzU6oXQ4OwAYih31gC27vcRSUJsrR7BD5vdE6cazvETtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDMAKLsx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDMAKLsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715182232; x=1746718232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vzZQfqjxU8pXk3iEhHORk1deIpPXCB4V3YAFX7HQ5U=;
  b=IDMAKLsxXuXoCHs+g8EsnNoy6EsUY7+c17oaHUFrO5gKnivqFgpvCnlq
   AswRt8cV02MGnyc7hyC7mH3uwDVBuGl7fdf6U55j7x1btniq4uV1WoECc
   JKfTFxmjyYy2zajbdJNY+2gosxlSjo8cVxPqr7EdG3zkF4Opq3/Lgcidu
   9ofzfsugr6UB6t+yIQYUbpDECK0cFlektp9RoXRa9Q3jmH+iyTwwZlkCq
   UOxSZ1V1R6bVLnEQvIP0TZiu4wLCOT3cvmhWoxNul/zOAh0H2FJV7+qyc
   ur3eHqE9ezszINqns0Dt79yFoocLBmOXd7KObFgGMZUnMkztJjGNRc26A
   w==;
X-CSE-ConnectionGUID: VV5VUGn+QCiuSHGJLgZWww==
X-CSE-MsgGUID: CV5ZCT8iSnyp9AfRDIK6JA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="33560472"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33560472"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 08:30:24 -0700
X-CSE-ConnectionGUID: NjnxsalnTzKE1VfOvAU3Xg==
X-CSE-MsgGUID: 5hESD9DgRI62pWM848MOqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33394298"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2024 08:30:22 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4jFL-0003gQ-1g;
	Wed, 08 May 2024 15:30:19 +0000
Date: Wed, 8 May 2024 23:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 9/80] dtbs_check:
 Documentation/devicetree/bindings/media/mediatek-aie.yaml:12:5: [warning]
 too many spaces after hyphen (hyphens)
Message-ID: <202405082322.UJRKdYNO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   db81fb7bb566fb06e8f51b7aa2e73e51eead626a
commit: d94c229df0705c1cf4577f9a4d9d5c2aaff40873 [9/80] CHROMIUM: dt-bindings: media: mediatek: convert mtk aie to yaml
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
dtschema version: 2024.5.dev2+ged9190d
reproduce: (https://download.01.org/0day-ci/archive/20240508/202405082322.UJRKdYNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082322.UJRKdYNO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/uwb/nxp,uwb-sr1xx.yaml:8:8: [warning] too many spaces after colon (colons)
>> Documentation/devicetree/bindings/media/mediatek-aie.yaml:12:5: [warning] too many spaces after hyphen (hyphens)
>> Documentation/devicetree/bindings/media/mediatek-aie.yaml:75:4: [error] no new line character at the end of file (new-line-at-end-of-file)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:22:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:24:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:29:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:136:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:138:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
--
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml: title: 'Zinitix BT4xx and BT5xx series touchscreen controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml: title: 'led-backlight bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx6sl-clock.yaml: title: 'Clock bindings for Freescale i.MX6 SoloLite' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/mediatek-aie.yaml: 'aie@15310000' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml: title: 'Common touchscreen Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml: title: "Intel Lightning Mountain SoC's Clock Controller(CGU) Binding" should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml: title: 'Motorola CPCAP PMIC ADC binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

vim +12 Documentation/devicetree/bindings/media/mediatek-aie.yaml

    10	
    11	maintainers:
  > 12	  -  MTK ISD <copy.chou@mediatek.com>
    13	
    14	description:
    15	  MediaTek AIE is the ISP unit in MediaTek SoC.
    16	
    17	properties:
    18	  compatible:
    19	    const: mt8188-aie
    20	
    21	  "#address-cells":
    22	    const: 2
    23	
    24	  "#size-cells":
    25	    const: 2
    26	
    27	  power-domains:
    28	    maxItems: 1
    29	
    30	  iommus:
    31	    description:
    32	      Points to the respective IOMMU block with master port as argument, see
    33	      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
    34	      Ports are according to the HW.
    35	
    36	required:
    37	  - compatible
    38	  - reg
    39	  - interrupts
    40	  - dma-ranges
    41	  - iommus
    42	  - power-domains
    43	  - clocks
    44	  - clock-names
    45	
    46	additionalProperties: false
    47	
    48	examples:
    49	  - |
    50	aie@15310000:
    51	  compatible: ["mediatek,mt8188-aie", "mediatek,aie-hw3.1", "mediatek,aie-hw3.0"]
    52	  reg: [0, 0x15310000, 0, 0x1000]
    53	  interrupts: [GIC_SPI, 787, IRQ_TYPE_LEVEL_HIGH, 0]
    54	  mediatek,larb: ["&larb12"]
    55	  dma-ranges: [0x2, 0x0, 0x0, 0x40000000, 0x1, 0x0]
    56	  iommus:
    57	    - "&vpp_iommu M4U_PORT_L12_FDVT_RDA_0"
    58	    - "&vpp_iommu M4U_PORT_L12_FDVT_RDB_0"
    59	    - "&vpp_iommu M4U_PORT_L12_FDVT_WRA_0"
    60	    - "&vpp_iommu M4U_PORT_L12_FDVT_WRB_0"
    61	  power-domains: ["&spm MT8188_POWER_DOMAIN_IPE"]
    62	  clocks:
    63	    - "&imgsys CLK_IMGSYS_MAIN_IPE"
    64	    - "&ipesys CLK_IPE_FDVT"
    65	    - "&ipesys CLK_IPE_SMI_LARB12"
    66	    - "&ipesys CLK_IPESYS_TOP"
    67	  clock-names:
    68	    - "IMG_IPE"
    69	    - "IPE_FDVT"
    70	    - "IPE_SMI_LARB12"
    71	    - "IPE_TOP"
    72	  operating-points-v2: ["&opp_table_ipe"]
    73	  dvfsrc-vcore-supply: ["&vmm_proxy_label"]
    74	
  > 75	...

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
