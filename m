Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF1178370
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718748509; cv=none; b=YHgO6JspXAJaHgVPm8KFnZxnBgCnT3hnSvNSL4dgSCP8Q7VtTRut5PFSFd3X+IXgPQ2+9HD+Y3uquJtjz0w5x7JYt4M9HA5SaQD8Vtd3PqbIgC+74lOq+87+i2+nVTmMULcmO0exhgbxeKX4H3iheOhUIrQlTcsVnliB1BtHuCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718748509; c=relaxed/simple;
	bh=O7cXgOGxWNyFqWZ989+y+Xy2eEEc6qc+6OxD8RRze/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ULT/DoD6iGu2dJOh0FULfawdqYtkcfM7TCR73nKcUmiK1AxWSQpbMQkjNYeelBwzsimrPTntB7S/PXPydiHGvG4TDF/asSkNvLkdUxGPn9lsWNWNhHWAcsUxCdb90JVlRvZouu5koEMUoyDRnKrYrZg9FtN56sOJ/66MtoHp9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Shhgg73v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Shhgg73v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718748507; x=1750284507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O7cXgOGxWNyFqWZ989+y+Xy2eEEc6qc+6OxD8RRze/Y=;
  b=Shhgg73vrEuUtgD4hr5wzaJbK5jYQIDBn1EdLU9v8iXRyVxyrxVwsQ1C
   i0IMxjcFxp9uLMVIXlxSOplAdttmZZhF39MA7fjPqoZViKiN+q1WCHehF
   EU6SMcwZQwT0fbELdVejkV3EUX/2vLNOi3J/HpgHwSmkHBS6w7iICm2ty
   mdMGaV2PtEC8GssfKdl/XKooLxec4qEzIzm6P3wJqAy/7vnVKyYfApXTt
   aDZedTjkOp/C3ryvVsltg/a87LxNYU3JhgupOMOzeynz7Jr5S63adQvXz
   n6+6osf6qo1/O4lavoVy9KUv8pjXBPF3kQXhSUQP4qxwrPk3mvw5aMHZ/
   g==;
X-CSE-ConnectionGUID: RCbsgANuQzqorInuo4hxcA==
X-CSE-MsgGUID: 3xzIegNhTHiffMyMqSqYLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="38177677"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="38177677"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 15:08:27 -0700
X-CSE-ConnectionGUID: P7YucqGJTTemkCYiO/+tjQ==
X-CSE-MsgGUID: ZjIdbkS0TdS+Q80u0iTysg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="79165391"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2024 15:08:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJh03-0005yQ-0b;
	Tue, 18 Jun 2024 22:08:23 +0000
Date: Wed, 19 Jun 2024 06:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/dt-bindings-mfd-syscon-split 7/8]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb:
 syscon@1e60000: compatible: ['syscon'] is too short
Message-ID: <202406190644.2FxVxrx7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dt-bindings-mfd-syscon-split
head:   0f4f5cdbae0695ae8533aec60f629593d2c818f8
commit: 09928d5821f837e08a75e5ffab3d16d05893aac9 [7/8] dt-bindings: mfd: syscon: Split and enforce documenting MFD children
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240619/202406190644.2FxVxrx7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190644.2FxVxrx7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190644.2FxVxrx7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-codec@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-codec@1a: 'CPVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-codec@1a: 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: thermal-zones: 'core-cluster', 'ddr-controller' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic/mt6397regulator: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@c000: Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11007000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5650']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: btmrvl@2: marvell,wakeup-gap-ms: size is 16, expected 32
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397regulator: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscon@c000: Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11007000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5650']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397regulator: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscon@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscon@c000: Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11007000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5650']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
--
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: syscon@10006000: compatible: ['mediatek,mt8365-syscfg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: syscon@10006000: Unevaluated properties are not allowed ('#power-domain-cells', 'power-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
