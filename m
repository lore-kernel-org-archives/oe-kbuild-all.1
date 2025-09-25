Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBD2E88B3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758778969; cv=none; b=Cq1MY9lr0jduAnpC+04Ku4tEHRMlFYhCc6AtkHWb3MEzydS9nH1kgt/mfqOgXrSzPhrrEjsmJcn7nOtIVJ6kWBMenPWRy5ZloX/otlFqriXWlvZeS8/Mr93n1VmY6lSO1ojAqbHpd4VDk5T7UrQzj33jQneL6pXhT7wFUShIFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758778969; c=relaxed/simple;
	bh=1zyvOrXOz4u+9Q0v+kaU+oQXnBSLHgjPJj9PLGv9pqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4uBvmbXh7hkKNB2L6DZt1aLlpzya0q+1D5gD+sjpTBIAGrB+uPlZWrcZVmt7OLJAXG82TBRcWWThZOy7S2w6axeW/zed7gfoT4R0SC8skDgMHWQpcQIae4I2vqszL+jQwxG1uXLnWCZlj5TnAKKX0vuU8aciP27OtXOoYrRFGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jtx+8xj1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jtx+8xj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758778967; x=1790314967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1zyvOrXOz4u+9Q0v+kaU+oQXnBSLHgjPJj9PLGv9pqs=;
  b=Jtx+8xj1gGr2dAyuBPkJYppE9JirjErXv32JRUoVqdGwNwKJrX4fwBE4
   H2rTgpqq/tIbekCeIyFMVx08KFCSr3ewNyLP6VlToi2zi8Zga/j4AjMiT
   eg5Io3hKOCpFrSeEF9St/wL3XcrKzGe2Vv5ahZ6XeK3lDlrQwtdfXZgm1
   e7lIoISC71NiPe6pbHUli70BZldraEt2QNKScQJWlfIrodI/KfpNLcZ9b
   i03j27KSTyNKmK200a+8cBf+AeyXJ7ozdnQR2AlWgBk0iYxkX0/oXFUTW
   vvtt3aj7859sjxKOMXjbMJe4LwMZWNVnrfCGxI+uHnIXVpr4J0Fz529tR
   A==;
X-CSE-ConnectionGUID: 2777x047Qy+TyqaVGgBC8g==
X-CSE-MsgGUID: mCdklrkPQNeoHfBL1t8mSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61195589"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="61195589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 22:42:46 -0700
X-CSE-ConnectionGUID: C9SA6SNRT9WUx4rzunParw==
X-CSE-MsgGUID: at68jEL2TqmL3vqad2J17A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181242450"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2025 22:42:45 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1ekc-0004wt-1l;
	Thu, 25 Sep 2025 05:42:42 +0000
Date: Thu, 25 Sep 2025 13:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Bastien Curutchet (Schneider Electric)" <bastien.curutchet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 11463/11867]
 arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: switch@0
 (microchip,ksz8873): pinctrl-names: ['default'] is too short
Message-ID: <202509251326.SYA3QL9j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ce7f1a983b074f6cf8609068088ca3182c569ee4
commit: e469b87e0fb0d1209edb6c291474b1a1afa45bd5 [11463/11867] dt-bindings: net: dsa: microchip: Add strap description to set SPI mode
config: arm-randconfig-053-20250923 (https://download.01.org/0day-ci/archive/20250925/202509251326.SYA3QL9j-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251326.SYA3QL9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251326.SYA3QL9j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clocks: [[31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('interrupt', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clocks: [[31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('interrupt', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('interrupt', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('interrupt', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('interrupt', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
