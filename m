Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65D9355058
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528981; cv=none; b=O+G7C2C/5IJlzHmhWXQFCVEkkEGjqbDY6MV5GFAX8v9YkIORi69cNzVsF2mllmjZixs4vZo1Zr5CPvJoIxfWAoF5RuZTeDct35vpRGoTHWPSP9LrWrLsFV0uh8l+BqBm/jP5j1SBGhvWXS6+uG65hKCGonojpx09yjkoFllfAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528981; c=relaxed/simple;
	bh=W/0asaag7Mq1spsJYiDdDpUBTEdEYdXfdjexkfavMyk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z03mByDQ6opEmL+zaUT0FKGnv6IY/zzypdeWqEQaKV1NG3XU0V9PX3kCevTAY1gCn75HTfnxqkBwtyEqXYbuFK7sJF6zHgu1KQSMx1MgOc4l7UzZtKdSvjOqOm56ILPzp/W0NG6gkobjnMjg8nfrj+IewolnfpSDYNJgqjYREu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJuMDYPn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJuMDYPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769528980; x=1801064980;
  h=date:from:to:cc:subject:message-id;
  bh=W/0asaag7Mq1spsJYiDdDpUBTEdEYdXfdjexkfavMyk=;
  b=AJuMDYPnf9RdjBQ64xmNfI3NZTalwJdTGMyNGDCfJs4eNSIMhcAOjlJV
   tTf/nkNjNoU+wYTwdvHG7+oKXM0Scagm8GwFNjZDEFo4hEPMTFCQinuYR
   7o/qI3G07fQVPM2XAGZ3tSYd8uPtvN32nG1B6dHAvL6rcx9/TS9mB9Q2S
   d/6aPHuOwlSxtuq/2ifAKoHVwmyGTMR8wc6oib4VCtOBB1Ahan2CNzeC5
   zZ6q5mxMKc969zKq4aRv4FhSrhuK5Akc1wkxkI4ZoIV2xgkU37ZXMFSft
   /z1P6m8LrZhV4jIZZ0LTKGw+brF9yKTHxbExzbrLWaUT1Vu5GcAGN5O69
   g==;
X-CSE-ConnectionGUID: iMqrKkJ1RsOJ3U/eBEUUAA==
X-CSE-MsgGUID: HY4luhjsQ3uLP5TiOIZK/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81032815"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81032815"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 07:49:39 -0800
X-CSE-ConnectionGUID: 01Ap2jIlQc2Yvq2b7pyZug==
X-CSE-MsgGUID: Fckaj0l0SNuy8HbmQ+QAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208258458"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 07:49:37 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vklJv-000000001td-2R4k;
	Tue, 27 Jan 2026 15:49:35 +0000
Date: Tue, 27 Jan 2026 16:49:22 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb:
 pinctrl (marvell,armada-8k-cpm-pinctrl): 'copper-eth-phy-reset' does not
 match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
Message-ID: <202601271652.Y6rFJKJK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
commit: 45a8d350e72cc98e91bce2c20d4f26a8d9ccfffa dt-bindings: arm: Convert Marvell CP110 System Controller to DT schema
date:   2 months ago
config: arm64-randconfig-2051-20260126 (https://download.01.org/0day-ci/archive/20260127/202601271652.Y6rFJKJK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271652.Y6rFJKJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271652.Y6rFJKJK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pinctrl (marvell,armada-8k-cpm-pinctrl): 'copper-eth-phy-reset' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: pinctrl (marvell,armada-8k-cps-pinctrl): 'nand-rb' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: pinctrl (marvell,cp115-standalone-pinctrl): 'pintrl-names' does not match any of the regexes: '-pins(-.+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada-7k-pinctrl.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: spi@700680 (marvell,armada-380-spi): Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/marvell,orion-spi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
