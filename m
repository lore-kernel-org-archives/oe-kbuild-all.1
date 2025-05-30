Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0725E1B85FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623122; cv=none; b=jlM/IHfFL6sZ1Ghjmrc/rUqdvgNqKr/XPbUxBgLbzTdVGTVdz9ho06bIolcQ34TnQ0AYfh04OPVortFfERGy9smCOPbZ3sTZSm+GJ2EAXZgREGV26MConjMSCSIaaOoFY5nHhyS8YUuj11xWmiIdrmCWm1eEVCyAra2UaCJ76fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623122; c=relaxed/simple;
	bh=msYl6mgdomYfoH/evHFB4EyDIne6WkmVWyixUYp7sxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qedw7pfbh1GPUTJSI6/elSBOT5zZnDp7RZ2jPwVljdWaDGpcFRBOgcKzCTJU4aRIRyM8AYYU99pJEX3UmU3g8U8eg72cXGzuRGZs3XQe6e5LQZHo5Z1ieVCOER2E97jVBQGTHjhngsPcfW+L3CE0eaRp6FyntmjtnllyvV6F248=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkaWpvxd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkaWpvxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748623119; x=1780159119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=msYl6mgdomYfoH/evHFB4EyDIne6WkmVWyixUYp7sxA=;
  b=gkaWpvxdq0OG5M6YIPRBvsm/tuqJ/QmCGzuOOWKUQrGXCTUI12umWy6r
   N07VEHntGqLlHT7kUX+a0vC0RYp26+RiMX/VfJFTJtTJ1VtN8S5TqTW7v
   6N7ccnhDvC4oa6Jw3slPqLGGd+Vrc1MyglIP3SL4lczpooIGbcbZ1tgrv
   MirBlZXftr4fN7Pg7QZ2/lybwYisrnH9fmZoPMQTj3CAaQYXv3u/RNxE0
   B9sVkeOtBLFe1Ic0YHEVKZC9k3ze4dSPbR8I6BoL1jiA02nMCna1gJ534
   g/qThX82K+5A+cwVx3Pc4R1Sx17ZO2anztzvGDgN9odbqkl8HmDqeziAU
   A==;
X-CSE-ConnectionGUID: QfHK7mHzS5C+QyOH4bM4IA==
X-CSE-MsgGUID: VKcUSwFCQeCuqhv13LOOhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49842180"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="49842180"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 09:38:38 -0700
X-CSE-ConnectionGUID: uff4cpRPRi2ajnle0hBDsQ==
X-CSE-MsgGUID: njj5tU5+RjGTDseOE7il8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144892034"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2025 09:38:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL2kc-000XoG-19;
	Fri, 30 May 2025 16:38:34 +0000
Date: Sat, 31 May 2025 00:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 11491/13944]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15110000
 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202505310032.U32J7l8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a628f951ed54c30a232230b5b58349d2a8dbb11
commit: cf57ec7b9fc546bd233427df5d8f0c6ab1ea3997 [11491/13944] arm64: dts: mediatek: mt8188: Add missing #reset-cells property
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250531/202505310032.U32J7l8z-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310032.U32J7l8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310032.U32J7l8z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/dsi@1c008000/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid078', 'himax,hx8279']
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: /soc/dsi@1c008000/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid078', 'himax,hx8279']
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f1e000 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f24000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: display@14f25000 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15110000 (mediatek,mt8188-imgsys1-dip-top): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15130000 (mediatek,mt8188-imgsys1-dip-nr): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15220000 (mediatek,mt8188-imgsys-wpe1): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15330000 (mediatek,mt8188-ipesys): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@15620000 (mediatek,mt8188-imgsys-wpe3): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1604f000 (mediatek,mt8188-camsys-rawa): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1606f000 (mediatek,mt8188-camsys-yuva): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@1608f000 (mediatek,mt8188-camsys-rawb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@160af000 (mediatek,mt8188-camsys-yuvb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/dsi@1c008000/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid078', 'himax,hx8279']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/dsi@1c008000/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid078', 'himax,hx8279']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
