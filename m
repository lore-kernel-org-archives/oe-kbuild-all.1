Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E731E4A4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723561834; cv=none; b=ZUj6kttoZGtX+D+bdRaKkGvCut6Rh7nW66Jjv5GtMcaypidE4YXzBjSIIJbeRXYKpUQoIsNnb7bu86BhLLp5hPErhWc+RZXSufvaA5WsSagxLE/rk4cJvJWh2OHeNE6rbri7EK6MWBh6trwBNO0tV8xl4Zeg7XjIlMFL5QFYy9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723561834; c=relaxed/simple;
	bh=fcqaIRDAg4BbsPAvKOXAlSxeeCUsvb+LEyUhVO9aSn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOQbf3SZFEGpc5Xmd6hIDbYXNd91MyBNlORrG22nA99AJSPLk6y9kyAM4uQW2WvsMAwW6Xz1/Y1ZGkvEXPq/Ej0mkUIMZzOpWmZTH+bHA5g/pY49c+k1bg0FgTLTWKYKHt1sMydCIlgmrVbrAjmRg0x8sY3oa0OJLZRMfdgsJ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP8QolI/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP8QolI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723561832; x=1755097832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcqaIRDAg4BbsPAvKOXAlSxeeCUsvb+LEyUhVO9aSn4=;
  b=GP8QolI/Bi9DoQ4Jn7S/T8niVW+LOzS6v9tDjVPRDh3xet4z1rzdrEZ3
   ndhu4iQWBwU0UpV0bVD47bPuc4P+cOufxX0eafk1Pn01CxCD7sEP5pWqS
   Fz1ULhcog64oTnwKzNEp77McHtwGYfSKMnz5Q14RwtwS4LQSYpIOwq+Eq
   NJC6w4yrR7PXleB/lQC2zsN0ctOlJOu6PR0sUA7GvNyHw3fmfmVPORhIY
   PhRQCoWaeHt8n/ppPdCrCl9L0+teDg24WqW+BJvkYm+KSt6BbkitTHPKg
   MucvSnDSvIBrTvkjSoywIwue5utJ9j7m21q4SimaCewMrvaePFOAGdUjn
   Q==;
X-CSE-ConnectionGUID: sR1S/RbGR5u8Gm/iWWD3aQ==
X-CSE-MsgGUID: SaRuFAnKQtKiWWuD8FWUhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="39241405"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="39241405"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 08:10:31 -0700
X-CSE-ConnectionGUID: SxD5lRBVTl+vG0xhwv9xZA==
X-CSE-MsgGUID: DFOxSbvTTkq2NV7OzEO0TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="63637240"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Aug 2024 08:10:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdtAJ-0000XW-0r;
	Tue, 13 Aug 2024 15:10:27 +0000
Date: Tue, 13 Aug 2024 23:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 3920/4224]
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000:
 dpmacs:ethernet@7: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202408132356.hUcTJEkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   033a4691702cdca3a613256b0623b8eeacb4985e
commit: c25504a0ba36968f919aa30caff172ef23346299 [3920/4224] dt-bindings: net: fsl,qoriq-mc-dpmac: add missed property phys
config: arm64-randconfig-051-20240813 (https://download.01.org/0day-ci/archive/20240813/202408132356.hUcTJEkI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408132356.hUcTJEkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408132356.hUcTJEkI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: dpmacs:ethernet@7: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: dpmacs:ethernet@8: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: dpmacs:ethernet@9: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fsl-mc@80c000000: dpmacs:ethernet@a: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: ethernet@7: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: ethernet@8: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: ethernet@9: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: ethernet@a: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: dpmacs:ethernet@7: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: dpmacs:ethernet@8: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: dpmacs:ethernet@9: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fsl-mc@80c000000: dpmacs:ethernet@a: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: ethernet@7: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: ethernet@8: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: ethernet@9: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: ethernet@a: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3800000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3900000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3900000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3900000: interrupts: [[0, 103, 4], [0, 103, 4], [0, 103, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3900000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@3: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@4: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@5: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: fsl-mc@80c000000: dpmacs:ethernet@6: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: ethernet@3: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: ethernet@4: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: ethernet@5: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: ethernet@6: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
