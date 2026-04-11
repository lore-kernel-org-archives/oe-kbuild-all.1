Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1B2D060B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924425; cv=none; b=b3v0Q6Jf8XiFXg+ZbA3vKJwYTKudA2jfqkWaN7lxB+zShLvuNzOaokAAwNjn4Cautbj8OmmzTiY950OxTFhQz1COSwVwhpcyu7xkqhKJHMFBsGcA9D/DstE/3NrG68k0vTbCVBobgdFVFn9w8u2nV8Q5t4qSEj1QK5RDvpeOe2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924425; c=relaxed/simple;
	bh=m21W3Ts4gI8PIopQT00e/MMrRj5YbPcLYEPhVTkxb3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=enEwP2jnNOCzRjun5XaS090yUFQh8IqSi7dTMpgeousybl5twoQ++hDk7WbQYzIMsifnhUl5WDPMdQrNiQgc5dpeMD0rBYOplZoH5tq+01RmCVfVQb9fB0vdet7pz71BlhFWVVtQXa5OZa6zWDc6im0t3OrxBbtRammWikPdROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzXjMX4d; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzXjMX4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775924423; x=1807460423;
  h=date:from:to:cc:subject:message-id;
  bh=m21W3Ts4gI8PIopQT00e/MMrRj5YbPcLYEPhVTkxb3s=;
  b=SzXjMX4dHTqCeFrPSXBVWGF0DZ0wje7d61nvb3L9dmv5e2P0gFJNK+9c
   IW7nJ0/ZOcGRTQThplUSUpDP41F3HBYBhBMPHqOEVEsyWXWhMAJ0U5Dxj
   ccZ+n1UIcwTfLRjCkvM47Reh5kXjaSsWmE1k20iartFEifMQhWQDV5iGe
   lij8mX68+nE30ail0LSoBvNjYajsyZ+5W/0Vx9WxF+3LpMWDluApkLQ84
   yFqu6wFtmXoXWdqx2c2oBngIYAXGa5E38RuHhe6qhqXzsujvqakgzikYE
   BM4oNfYl0NDsxRRAGTwfkkUgoloSKs5wtSOVvnmK/Uo2zA1jCMG3PFBfr
   g==;
X-CSE-ConnectionGUID: cgRuhXEHQoGrd/crjwtq0w==
X-CSE-MsgGUID: xuOp0r0zQ7CPOOuPwu+yTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94494042"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="94494042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 09:20:22 -0700
X-CSE-ConnectionGUID: cLqW/i7MTuOZ3PG1UQH1rg==
X-CSE-MsgGUID: WDqI6PYxQiOVE005FTFBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="234298772"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2026 09:20:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBb4E-00000000B6H-2CeV;
	Sat, 11 Apr 2026 16:20:18 +0000
Date: Sat, 11 Apr 2026 18:19:32 +0200
From: kernel test robot <lkp@intel.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [linux-next:master 9891/13443]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb:
 usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells'
 is a required property
Message-ID: <202604111813.pLF7QoRv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66672af7a095d89f082c5327f3b15bc2f93d558e
commit: 6a1b6f7e56dc72ff8b4a83c728a2bed6d834e4cb [9891/13443] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
config: arm64-randconfig-2052-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111813.pLF7QoRv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111813.pLF7QoRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111813.pLF7QoRv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: ethernet-phy@0 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: ethernet-phy@1 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('txdv-skew-psec' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
