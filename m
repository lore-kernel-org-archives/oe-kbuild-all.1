Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89DB33E7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757096691; cv=none; b=KSprZkLva3Lv58F0lnqudsTVVAi4sjLe2IggDIgZGSrKNIt1oYvED10rZXvhFsuOiEE8VtOC4d/cMA8XiWFXJYw9DZ8U/ozHxEgO4wxWyvh2iXsomjoCRlbB9pdTv+Ch1u3X3wDVpkZlhkfRAAR/RPDdU1L0ks2Jt+2Ox3ILssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757096691; c=relaxed/simple;
	bh=7Bvk6p05HoSI/R+q3AtCY8srI4riILqq10saGvdTG/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rdJ9Pa6Isq2CRzdpJC2wATXRPigdXTTiNJcamtZPDQbVVj2BIfDoHtXJJC8E8QmDktsWOtaPCfs5C3W/yPCMFNKgLSNkdh0A69/laBH4M97NBbaUPvSxzrnSDDLbY/mj05j/na1hHPiRi/opk8NQfxwQwtuR6bPdrLm1hAQ76Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vpr7Nnlr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vpr7Nnlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757096689; x=1788632689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Bvk6p05HoSI/R+q3AtCY8srI4riILqq10saGvdTG/Y=;
  b=Vpr7Nnlr98bhU+B96m5bdMyGZs7SkUrUcbeB0b1J+++H/DlVL17t12Ri
   iG4RdDb2lyGHshkcoGYcyf4NARZjDnja/6oYPRh353EAW8Vtr45weix6b
   o6O7CTifBfe6+SGgYvIQ9LYt5K7UpZYn/qt+TD4o5VEe4D/fC9onmE2Sz
   tN9laURjMat0LwjOAJYeeojLOlLb1BB8e5caeMmaWZ18fD2FM0vtFWOv7
   MCrDw8Os05gz4ML6gWdcEchW2KspRtkGeWeVfgAs309gT2nQEnYkTxznO
   rvs3psTJbf00tyPTv3A6nyglZyOZ42PMySpYMVnl7gq4RpABMZK/3PMkY
   A==;
X-CSE-ConnectionGUID: snSJ/jbETTOLvAWyIX2qBw==
X-CSE-MsgGUID: /MQCsXbuRbC9TXpRPE4AHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70882397"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="70882397"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 11:24:49 -0700
X-CSE-ConnectionGUID: 0IxZ7c18RiWxval5G80tQQ==
X-CSE-MsgGUID: GHx+7mocTD2gnrr8P4S4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="176565037"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Sep 2025 11:24:48 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uub77-0000iN-1g;
	Fri, 05 Sep 2025 18:24:45 +0000
Date: Sat, 6 Sep 2025 02:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 6520/6776]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb:
 /axi/pcie@1000120000/rp1_nexus/pci-ep-bus@1/ethernet@40100000: failed to
 match any schema with compatible: ['raspberrypi,rp1-gem']
Message-ID: <202509060219.XUxKT1AH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5d4872e528796df9d7425f2bd9b3893eb3a42c
commit: cbdd3e7613200ee49ae8fa00020c39c4a2e1ee42 [6520/6776] arm64: dts: rp1: Add ethernet DT node
config: arm64-randconfig-051-20250905 (https://download.01.org/0day-ci/archive/20250906/202509060219.XUxKT1AH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060219.XUxKT1AH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060219.XUxKT1AH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupts: [[11], [12], [13], [14], [15]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000 (brcm,bcm2712-pcie): Unevaluated properties are not allowed ('rp1_nexus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/brcm,stb-pcie.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000120000/rp1_nexus/pci-ep-bus@1/ethernet@40100000: failed to match any schema with compatible: ['raspberrypi,rp1-gem']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'clock-names', 'interrupt-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): interrupts: [[2], [9], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
--
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupts: [[11], [12], [13], [14], [15]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: pcie@1000120000 (brcm,bcm2712-pcie): Unevaluated properties are not allowed ('rp1_nexus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/brcm,stb-pcie.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000120000/rp1_nexus/pci-ep-bus@1/ethernet@40100000: failed to match any schema with compatible: ['raspberrypi,rp1-gem']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'clock-names', 'interrupt-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): clocks: [[28, 4], [28, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): interrupts: [[2], [9], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
