Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4E7EED6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732558022; cv=none; b=HvSKwMphfSIkACXkkFNT5DAwNaD38HF/qgOcfqkUCWS62qVPWXE/eKISdHclq0vkcngWxrpFgD+nCtMxzMGCXNtGhj+0CiYHiuczCi+jF5PZYdEJnK5w7kqGSuPnYivZiShpqQwQ25fC7HOStaCEjs+t0HLOQAXsLFb4nMs4JFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732558022; c=relaxed/simple;
	bh=7SZdosfv5FSwJthesbhXqmrU2L2FFXLYftbHDW+kpXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijb8ek5bYsaFG7DPCEilyxQDqAa9WJWIfY8BsU285JmTnRpJ+puk4vgo6a/E9nkeRUeXNI1diOGGPwtFeRCZ/199avw//JI3r1p+bGzbQhMeKJ5DnU5MA3+9k8PrzO2d0fihPYiKyrA5w3IhRZOvZr3qu+HunN2Gti/pOStkDQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMRuVKa/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMRuVKa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732558021; x=1764094021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7SZdosfv5FSwJthesbhXqmrU2L2FFXLYftbHDW+kpXs=;
  b=mMRuVKa/mh+f5zTcZP1rPYxeQ/TyKBEYLB5htwJ+sIoUECokdOroSa+D
   85dtTEvYUioBc9Z/Ycv8B0xJL2IBL5riMczLg7IeO+Q/GipJSeQOaUJ3e
   C+rXdZbJerWAhfYJq6BsmsZhyslXClmO+sroMKeTnG1MWSH84bemCrNeW
   R39WWfPDNh1dDHVpfvSR0pNhn6PC3yg1wULTaVrbciDCvvHCBBh7TGfvo
   HUAMsRP8o4e3tot0X8Kf7/z8pKC7a/6IA8SlzMRqQjTIoJbeu6H87BdKo
   dN73k4pE6Id9V04BFhE6LpQZ3A7bwUT7mqP/KKM00UyxYQwMHK851YYLV
   g==;
X-CSE-ConnectionGUID: SYM9DFzyRSO1/Nkht9CvWw==
X-CSE-MsgGUID: cXgghe8gT+CHgU5YlstqCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="58092702"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="58092702"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 10:07:00 -0800
X-CSE-ConnectionGUID: sSIirpR9SYKBZN7x1g47dA==
X-CSE-MsgGUID: j/euyX/oRUeeULE/2oS/ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="96116724"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Nov 2024 10:06:44 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFdTt-0006fh-2w;
	Mon, 25 Nov 2024 18:06:41 +0000
Date: Tue, 26 Nov 2024 02:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 12501/12684]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb:
 /soc@107c000000/pixelvalve@7c410000: failed to match any schema with
 compatible: ['brcm,bcm2712-pixelvalve0']
Message-ID: <202411260159.Bci0ca5R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   85a2dd7d7c8152cb125712a1ecae1d0a6ccac250
commit: f66b382affd8fdecc8731832f722ffe1b68c822c [12501/12684] arm64: dts: broadcom: Add display pipeline support to BCM2712
config: arm64-randconfig-051-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260159.Bci0ca5R-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260159.Bci0ca5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260159.Bci0ca5R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:431.12-433.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: interrupt-controller@7cd00000: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: interrupt-controller@7cd00000: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pixelvalve@7c410000: failed to match any schema with compatible: ['brcm,bcm2712-pixelvalve0']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pixelvalve@7c411000: failed to match any schema with compatible: ['brcm,bcm2712-pixelvalve1']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/mop@7c500000: failed to match any schema with compatible: ['brcm,bcm2712-mop']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/moplet@7c501000: failed to match any schema with compatible: ['brcm,bcm2712-moplet']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: intc@7d508380: $nodename:0: 'intc@7d508380' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/hdmi@7ef00700: failed to match any schema with compatible: ['brcm,bcm2712-hdmi0']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/hdmi@7ef05700: failed to match any schema with compatible: ['brcm,bcm2712-hdmi1']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: axi: gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/gpu: failed to match any schema with compatible: ['brcm,bcm2712-vc6']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /hvs@107c580000: failed to match any schema with compatible: ['brcm,bcm2712-hvs']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
