Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6D23CE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 00:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758672561; cv=none; b=cFXvNYNqXCcj8O5opMpiXmDcrREUcsU/oYLC2gmge/kixmg/lu7RSeMQF1hyZdi0VESGIPaD8ZGD8gcQHJTvp/FolkPT9CwjA9fxxDsmALfZer1cFsidVWMyso5ISx2t4fj8CsEL5GkSB4d9+jldo34BvOl6ZmEdBEiwjIFatEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758672561; c=relaxed/simple;
	bh=/cGWYULSAuVZfywLOzTdhPAt/IL8XP1AmtZyw92qILQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kOvMP61iIFf36sFqDAnlkgPXvj6sa8Mm4BucHZfvO5NZhoKEqW6kllBk8N5wzOF/++e8tsaUyjU3fVQhqVAhyqF4jmHfOmtV9gxlkfZS6ex01SgMNa4zigwki1pUqAw/zrEBWmsTYvOxmV9ujp4YhGz7cjjL5WIxysojWheISR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buJzW0NI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buJzW0NI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758672559; x=1790208559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cGWYULSAuVZfywLOzTdhPAt/IL8XP1AmtZyw92qILQ=;
  b=buJzW0NIE3cdWSX4wu9J0ZKiIoGRaP86/2sWE5GUEtVTkP0uaSsA9FYN
   iayQ34z7pgiXNbzx2MBS3Hz8EW3TiwJvN7jEpPJhVJzoGovfXMKFRGz9/
   d9eCWMrxrkqecaNe+Jl7VG/84vTQXdUfaT/ZqSpibHJXHsKE3OVEHOMLx
   O+p1dMzBZb8lxZtPWu1A/d6MH+CNVEIeRoV2zccsy7IDlOeitqyBxPzRN
   0r8dp7d/sfCZdSfVlmX/kfibSG/4Hp3AhZu2fxgYV1oX1dPiG+/hBUJ90
   gkA7n/d4jNqQKQN6WDNYo/oOw0CA34DzbBVparlRoCyysC2XUymx8bZod
   g==;
X-CSE-ConnectionGUID: W/75B/LYS/CYa42exLOS9A==
X-CSE-MsgGUID: dma+86GMRm6fzAc36euKEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60852729"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="60852729"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 17:09:18 -0700
X-CSE-ConnectionGUID: z+zw7YRLQeWLphqiq98+Rg==
X-CSE-MsgGUID: 6TH+UfvDSnmHQYGQTtMVSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="180896807"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2025 17:09:16 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1D4M-0003e9-0S;
	Wed, 24 Sep 2025 00:09:14 +0000
Date: Wed, 24 Sep 2025 08:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Bastien Curutchet (Schneider Electric)" <bastien.curutchet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 11463/11867]
 arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f
 (microchip,ksz9893): pinctrl-names: ['default'] is too short
Message-ID: <202509240828.ng1OXTUj-lkp@intel.com>
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
config: arm64-randconfig-053-20250923 (https://download.01.org/0day-ci/archive/20250924/202509240828.ng1OXTUj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240828.ng1OXTUj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240828.ng1OXTUj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: switch@5f (microchip,ksz9893): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: switch@5f (microchip,ksz9893): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: switch@5f (microchip,ksz9893): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: switch@5f (microchip,ksz9893): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: switch@5f (microchip,ksz9893): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: switch@5f (microchip,ksz9896): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: switch@5f (microchip,ksz9896): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
