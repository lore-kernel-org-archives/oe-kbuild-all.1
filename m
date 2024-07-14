Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973010A2B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 05:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720935908; cv=none; b=fsN++iLXf4LyMeOzKNjQjhfG7HNonA4lZFnP9hIPDFQrbuzCP2qE9Qnz+qn2nbQ0OSdoXLqbZ3KIeX1z1fLdqjsWd2Z7TfGoJu0S/R6uFlKu5i1nfFjHU6s/rQebqFZBD25JrGqOMwmMpPc/nu19G+WYhzTQqcr69fHj9cJfsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720935908; c=relaxed/simple;
	bh=xJrnYdeVIUe4b+z+crEm7hj6wTC9MTJ24mjTyHQRpwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsR65p+ZMHVPtCu/GFWrSKiUchdQH5V7oHBML/TgFBGnDVx9miWaBIDRB9K+DmAdtIm22H3DoPwqjo0WnaJrtk6WSn0+rwKXkikLfpbM+4NqRPrU5np3Rf5/cPrbUB2pxHCNeZyf9XO+EkR17r6RdjDDXM40qR6MubcJxCS4Qa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTKu1S5t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTKu1S5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720935904; x=1752471904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJrnYdeVIUe4b+z+crEm7hj6wTC9MTJ24mjTyHQRpwg=;
  b=LTKu1S5thymRPBFKFnDlYwYYvmhRL+VxVQpgOQXOuBP3eX+0DvvVJyca
   ShjlhBJbi1WUpoJQmei8iwTMROXASXNYUIdo9mury12xDfyZrZc/O5f1S
   D7JwseZ4LeiXvZcJhBrynUgOX4KePsaAHjWRoT7f0gDzqUQ/IDFxW+Ckp
   ffWh8RnwjuJt9yaA7c+83Th8CpMp7P53YUa1K+1ZjqDxavaQ6rKQQK+N+
   WUBVSaaEZPTyAacKwTm7nAZjjBDY0aynjDjnY1Li5Zl23rXAjsAdXsAPj
   fsHnMFpEPawOUL39bTWQMQ8YXK/wsufJcX3GfX6KiOiHr3nrliZX8fVXp
   Q==;
X-CSE-ConnectionGUID: Z7Y4B2l+TNySMzt9/y0Zkw==
X-CSE-MsgGUID: MVucgTlCRkyd+XJ+ikcGCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="35878094"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="35878094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 22:45:04 -0700
X-CSE-ConnectionGUID: WyukxKEyRYiz2Ovce1XsjQ==
X-CSE-MsgGUID: gqS2BYrKTz2Dv+YE2iD/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="49286259"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jul 2024 22:45:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSs2e-000d8I-1g;
	Sun, 14 Jul 2024 05:45:00 +0000
Date: Sun, 14 Jul 2024 13:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9671/9748]
 arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: scm_conf@1c04:
 compatible: ['syscon'] is too short
Message-ID: <202407141314.99x7mKU3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 2428f1f8c8fb6ed020c8d6acac8a30dcc0c99579 [9671/9748] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
config: arm-randconfig-051-20240701 (https://download.01.org/0day-ci/archive/20240714/202407141314.99x7mKU3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141314.99x7mKU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141314.99x7mKU3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: scm_conf@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-sys-32k@6c4: failed to match any schema with compatible: ['ti,mux-clock']
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: scm_conf@1c04: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: scm_conf@1c24: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: dma-router@b78: dma-masters: 19 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: dma-router@b78: dma-masters: 19 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: dma-router@c78: dma-masters: 20 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: dma-router@c78: dma-masters: 20 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
--
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1b80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1b80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1bc0: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1bc0: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c00: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c00: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c60: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c60: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: scm_conf@0: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@10000: $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@10000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@10000/target-module@4000/wdt@0: failed to match any schema with compatible: ['ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: segment@20000: $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: ocmcram@40300000: $nodename:0: 'ocmcram@40300000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: ocmcram@40300000: 'sram-hs@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/ocmcram@40300000/sram-hs@0: failed to match any schema with compatible: ['ti,secure-ram']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: ocmcram@40400000: $nodename:0: 'ocmcram@40400000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: ocmcram@40500000: $nodename:0: 'ocmcram@40500000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,dra752-bandgap']
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: dsp_system@40d00000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/padconf@4844a000: failed to match any schema with compatible: ['ti,dra7-iodelay']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@43300000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@43400000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@43500000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@40d01000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@40d02000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: scm_conf@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-sys-32k@6c4: failed to match any schema with compatible: ['ti,mux-clock']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: scm_conf@1c04: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: scm_conf@1c24: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: dma-router@b78: dma-masters: 19 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: dma-router@b78: dma-masters: 19 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: dma-router@c78: dma-masters: 20 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: dma-router@c78: dma-masters: 20 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1b80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1b80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1bc0: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1bc0: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c00: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c00: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c60: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c60: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: scm_conf@0: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@10000: $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@10000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4ae00000/segment@10000/target-module@4000/wdt@0: failed to match any schema with compatible: ['ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: segment@20000: $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: ocmcram@40300000: $nodename:0: 'ocmcram@40300000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: ocmcram@40300000: 'sram-hs@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/ocmcram@40300000/sram-hs@0: failed to match any schema with compatible: ['ti,secure-ram']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: ocmcram@40400000: $nodename:0: 'ocmcram@40400000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: ocmcram@40500000: $nodename:0: 'ocmcram@40500000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,dra752-bandgap']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: dsp_system@40d00000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/padconf@4844a000: failed to match any schema with compatible: ['ti,dra7-iodelay']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@43300000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@43400000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@43500000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@40d01000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@40d02000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@4b700000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0: 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: sham@0: 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: dsp_system@41500000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@41501000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/target-module@41502000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: thermal-zones: 'core_thermal', 'cpu_thermal', 'dspeve_thermal', 'gpu_thermal', 'iva_thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /encoder@0: failed to match any schema with compatible: ['ti,tpd12s016', 'ti,tpd12s015']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /encoder@0: failed to match any schema with compatible: ['ti,tpd12s016', 'ti,tpd12s015']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: scm_conf@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-sys-32k@6c4: failed to match any schema with compatible: ['ti,mux-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: scm_conf@1c04: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: scm_conf@1c24: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: dma-router@b78: dma-masters: 19 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: dma-router@b78: dma-masters: 19 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: dma-router@c78: dma-masters: 20 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: dma-router@c78: dma-masters: 20 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1b80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1b80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1bc0: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1bc0: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c00: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c00: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c60: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c60: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: scm_conf@0: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@10000: $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@10000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4ae00000/segment@10000/target-module@4000/wdt@0: failed to match any schema with compatible: ['ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: segment@20000: $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: ocmcram@40300000: $nodename:0: 'ocmcram@40300000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: ocmcram@40300000: 'sram-hs@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/ocmcram@40300000/sram-hs@0: failed to match any schema with compatible: ['ti,secure-ram']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: ocmcram@40400000: $nodename:0: 'ocmcram@40400000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: ocmcram@40500000: $nodename:0: 'ocmcram@40500000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,dra752-bandgap']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: dsp_system@40d00000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/padconf@4844a000: failed to match any schema with compatible: ['ti,dra7-iodelay']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@43300000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@43400000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@43500000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@40d01000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@40d02000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@4b700000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sham@0: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sham@0: 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sham@0: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: sham@0: 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: dsp_system@41500000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@41501000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/target-module@41502000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: thermal-zones: 'board_thermal', 'core_thermal', 'cpu_thermal', 'dspeve_thermal', 'gpu_thermal', 'iva_thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /encoder: failed to match any schema with compatible: ['ti,tpd12s015']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: scm_conf@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-dss-deshdcp-0@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm0-tbclk-20@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm1-tbclk-21@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-ehrpwm2-tbclk-22@558: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-sys-32k@6c4: failed to match any schema with compatible: ['ti,mux-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: scm_conf@1c04: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: scm_conf@1c24: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: dma-router@b78: dma-masters: 19 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: dma-router@b78: dma-masters: 19 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: dma-router@c78: dma-masters: 20 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: dma-router@c78: dma-masters: 20 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1b80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1b80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1bc0: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1bc0: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c00: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c00: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c60: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c60: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@0/target-module@6000/prm@0/prm@1c80: failed to match any schema with compatible: ['ti,dra7-prm-inst', 'ti,omap-prm-inst']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: scm_conf@0: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@10000: $nodename:0: 'segment@10000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@10000: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4ae00000/segment@10000/target-module@4000/wdt@0: failed to match any schema with compatible: ['ti,omap3-wdt']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: segment@20000: $nodename:0: 'segment@20000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: ocmcram@40300000: $nodename:0: 'ocmcram@40300000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: ocmcram@40300000: 'sram-hs@0' does not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/ocmcram@40300000/sram-hs@0: failed to match any schema with compatible: ['ti,secure-ram']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: ocmcram@40400000: $nodename:0: 'ocmcram@40400000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: ocmcram@40500000: $nodename:0: 'ocmcram@40500000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/bandgap@4a0021e0: failed to match any schema with compatible: ['ti,dra752-bandgap']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: dsp_system@40d00000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/padconf@4844a000: failed to match any schema with compatible: ['ti,dra7-iodelay']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@43300000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@43400000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@43500000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@4e000000/dmm@0: failed to match any schema with compatible: ['ti,omap5-dmm']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@40d01000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@40d02000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@58882000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@55082000/mmu@0: failed to match any schema with compatible: ['ti,dra7-iommu']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@4b700000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0: 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: sham@0: 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@5a000000/iva: failed to match any schema with compatible: ['ti,ivahd']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: dsp_system@41500000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@41501000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/target-module@41502000/mmu@0: failed to match any schema with compatible: ['ti,dra7-dsp-iommu']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: thermal-zones: 'board_thermal', 'core_thermal', 'cpu_thermal', 'dspeve_thermal', 'gpu_thermal', 'iva_thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /encoder: failed to match any schema with compatible: ['ti,tpd12s015']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
