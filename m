Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57AB191
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 00:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764288111; cv=none; b=rJGVEyXQCK+DahMpMmDMuUd0gZS5GKOVyR1jrKqENoEHTxnwT/fuCE5sVcgfDrqDllGHJZzrM/qmi7OnN9DtCR4uPyf5kVHvghPQK94+OxOjMhV48rT4c29Vd2gnCQZn3OfDFzwhunS6u4gHxMZPMC6BhtDPYyV7h2x4mClA8GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764288111; c=relaxed/simple;
	bh=/cX9neGQucbG1XDV/ZDi82Ptr23dJl/LzDx1KpnPYgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c/mJARQbTwO2fxaphqu7NmMIoBmlBdt1fn/L/TU4GvT5gqpWGBVQJ0CwD82u+HaV7LCdREFoElZqBMvEUD8IOTQZq7+YKTRVqgAmSiFo0w6GZcHoJtAEr/gTlKSN9U4bIH0DCXU65K6bqfmeBbhHc3+WGayy4aBS0Hf/iet0ke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlABHmmB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlABHmmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764288110; x=1795824110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cX9neGQucbG1XDV/ZDi82Ptr23dJl/LzDx1KpnPYgQ=;
  b=OlABHmmBAd6Ml9YFfFRu7REyjYc0HmPwqgCuT8ciUpG5aDiDFshY1abV
   pREFx1bQZukAAL1gRHyodr6dYLfJus+QJJ+kYoV/5asSD09zc+S+e+jVH
   /anDd3R/IAeAarbJG1zcx6vPapLCInQyjg797BjksSPEIAO9E9SaIzz4E
   2DnrPzbdksfV17YXSoG9wpB/We7dtcJ1AtVSgLIJ15AiTjH3Xnp2hhR1d
   bpy1fNypfmCRtvmCfhvrwYw4b+xiRT/5LhpHGSe2DH2RQAkJfwW77gbBn
   u3a04oBgesT1MmDXKW6OA5WBB6Zd+MFNniKMuEb5fY5tddJ5LhDTmZVGa
   g==;
X-CSE-ConnectionGUID: HN24woCZT3aBP+hmmMjung==
X-CSE-MsgGUID: 3gS4zoJNTMy+JvJljrcwXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83938578"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="83938578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 16:01:49 -0800
X-CSE-ConnectionGUID: C+oTGgapS46UelHB/tT/uA==
X-CSE-MsgGUID: GnoHA4fCRyiX2I8BdrnYhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192590254"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2025 16:01:47 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOlvl-000000001sz-234D;
	Fri, 28 Nov 2025 00:01:45 +0000
Date: Fri, 28 Nov 2025 01:01:16 +0100
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 9858/12398]
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000
 (microchip,sama7d65-ddr3phy): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202511280140.TddBqoOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 1f9793a4d5188cddc0eb69d7840b7c5c57c939a6 [9858/12398] dt-bindings: mfd: Document control-scb and sysreg-scb on pic64gx
config: arm-randconfig-2051-20251124 (https://download.01.org/0day-ci/archive/20251128/202511280140.TddBqoOT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280140.TddBqoOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280140.TddBqoOT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e182c000 (microchip,sama7d65-flexcom): i2c@600:#size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/atmel,at91sam-i2c.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	'syscon' was expected
   	'microchip,mpfs-control-scb' was expected
   	'microchip,mpfs-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clock-names: ['t0_clk', 't1_clk', 't2_clk', 'slow_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [17, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clock-names: ['t0_clk', 't1_clk', 't2_clk', 'slow_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: timer@e2814000 (atmel,sama5d2-tcb): clocks: [[2, 2, 88], [2, 2, 89], [2, 2, 90], [16, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/atmel,at91rm9200-tcb.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
   arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: ['microchip,sama7g5-ddr3phy'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
>> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: ddr3phy@e3804000 (microchip,sama7g5-ddr3phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['microchip,sama7g5-ddr3phy'] is too short
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
