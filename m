Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B8224C664
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038089; cv=none; b=fZNkbiTIa14fPykKthyznjO7ohRKWnDNufVizhxLrNoTkPLoUpANRUDF1HW3MQeYllpzV9j/JG3Ups1t043QyYfB2SY8ZjJGstHSkiPvjxdIprWB2VL4sEsEnWK14QDg4Vp3ECB54xGv6O9hqiux6HuCP1Cr3dVSqNczDnpakVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038089; c=relaxed/simple;
	bh=UBajsJMeBhWRs5K/zkbaV6f5CNTRuP+p/rQvJCkLaRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y6rXOzGOZcmQsiro13Zxswggtls955s2meHf3m7fDEGWjcRP6zFeD4L6TfGizeEQDlvlZjwKYL19T19691sCHrXZlefwdYsp48mSA9wzVSXKHc8ko2ImjkySLCo2KempDFU7VQlxyXsJ2+HNCWaGUecoyTyLPqBTvpKjvtbcPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amOIDEb8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amOIDEb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749038086; x=1780574086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBajsJMeBhWRs5K/zkbaV6f5CNTRuP+p/rQvJCkLaRY=;
  b=amOIDEb8z4+FGzTOu5hE8A38fkj6H6w8RL5rROZ9TXFCgBBzZU72UhiK
   ZDbuGwDGk8ttexYCDRi5HywOjEXSqbMoNievaaxPl9G5A0tmWIORPehCV
   +8R+r/HR/idwrx/qqObfYGw5QlhUMcgaXAkajs5nUalGFd6XIi6OScnZf
   RanGiv2Ww4gwWK8HMgmwHTyUV4yjoNk3R8e2QwPkYNXRS+Aw4hAhd752B
   mXMhrY7YMeDosAgOiCR5eRZNn7VZ+pMfVuxI2BiFDyTu8F8vKJFgl15qa
   koqf77Xx1V6b2xrE8Ywr+WWy/wzM0Rzw+k/jujaLNSQXVRPQ0G2GV+Ebl
   g==;
X-CSE-ConnectionGUID: e0B6W9ouTXWOmIEc0ykz0g==
X-CSE-MsgGUID: fWIYUwrhTTy+CSqAp3g35Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51116258"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51116258"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 04:54:46 -0700
X-CSE-ConnectionGUID: lQfh+SBQRgyCUnN/lE614A==
X-CSE-MsgGUID: 6HstFX7TQ0Cl1qR3+ccVRA==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="150444987"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2025 04:54:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMmhe-00036f-22;
	Wed, 04 Jun 2025 11:54:42 +0000
Date: Wed, 4 Jun 2025 19:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 13996/14339]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000
 (brcm,bcm2712-pcie): Unevaluated properties are not allowed ('rp1_nexus' was
 unexpected)
Message-ID: <202506041952.baJDYBT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   911483b25612c8bc32a706ba940738cc43299496
commit: cbaec80bda2eff19682de44bf86363472841df4e [13996/14339] arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
config: arm64-randconfig-051-20250604 (https://download.01.org/0day-ci/archive/20250604/202506041952.baJDYBT4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041952.baJDYBT4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJDYBT4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupts: [[11], [12], [13], [14], [15]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000 (brcm,bcm2712-pcie): Unevaluated properties are not allowed ('rp1_nexus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/brcm,stb-pcie.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'clock-names', 'interrupt-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[18, 4], [18, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): interrupts: [[2], [9], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:421.11-576.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:74.21-91.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:93.15-97.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:438.12-440.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: soc@107c000000 (simple-bus): firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: soc@107c000000 (simple-bus): power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupts: [[1], [2], [3], [7], [8]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupts: [[11], [12], [13], [14], [15]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'clock-names', 'interrupt-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[18, 4], [18, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hvs@107c580000 (brcm,bcm2712-hvs): interrupts: [[2], [9], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
--
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupts: [[11], [12], [13], [14], [15]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: pcie@1000120000 (brcm,bcm2712-pcie): Unevaluated properties are not allowed ('rp1_nexus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/brcm,stb-pcie.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'clock-names', 'interrupt-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[18, 4], [18, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): interrupts: [[2], [9], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
