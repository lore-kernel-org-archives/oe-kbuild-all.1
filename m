Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8021FF47
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 23:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768606641; cv=none; b=H+OxEFL9WR421XzM3SJ9UAQt+AfcermOJTpBVb0ChON3cTIBNJYOY+qa37Gl4ifuKZ/MyF+1qU3MByk25ZqHleYpUvJj21VBiJ+PdkLztmHa1GFVq7RuulaVNj4U37Iga3WlUBrS7W4iYPnFUFhD0efgEc1Y4x+WHIP2HomtTgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768606641; c=relaxed/simple;
	bh=mXBFy5gqdIx3u0UexejLB9IetMa1QojPVPNhr6/JWqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l/zvlizQ/RYDXYea0RfG7DfCBwceKzl2JcTlWFoXuoe48mB69DfSuxoebBCu8A75FwPa4QdWJDyUTB048A0sS2RRCpkDO2o/eLHn2Kdexh3QruhpOvjRp9H8FDDt/Gg6e9annqgrdM6B14TfV/80050wtnv7+wd+kjuSuqlfraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCtKo2Df; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCtKo2Df"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768606640; x=1800142640;
  h=date:from:to:cc:subject:message-id;
  bh=mXBFy5gqdIx3u0UexejLB9IetMa1QojPVPNhr6/JWqs=;
  b=LCtKo2Dfp0/mr6j1/xBLfTdCpf/kLfsCF+6NQ26+xjJVgkncJ7sDNjA0
   qKvUqC5OK8H755RRiBcwXrLP6X+W7mMNGh2UV7sTVJKvECtdjE8f3OQxE
   9jY16wNcNC/2zHHIjI7R39khvg8WoIQxL6f0pYKPp69lyQvQ1oSYEJqSv
   QhBVJNRolVGMF+QsRYjqu2/+PXffsAkZp6q9TbLvXPRqmNZnfDDFlboee
   DvEhQs3yFlxuDoVHLFShriowHJpqnWHViT+yLDD4gCy1AZ0stVDFHaaII
   jLrjQyhBfmCk2NRjck1C/UtikyDq7MkMiY5HAzaLzykqFV243IOLOewA/
   Q==;
X-CSE-ConnectionGUID: K8iQVX4OTW+jSPmL5kin4A==
X-CSE-MsgGUID: CPCxWuxPTByt7+lSHv8lJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80563308"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="80563308"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:37:19 -0800
X-CSE-ConnectionGUID: yaPUprHVQhCDl41F4CnkrQ==
X-CSE-MsgGUID: Q5cObe+CRsCBsep4MetaVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="204518325"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Jan 2026 15:37:18 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgtNT-000000001s7-3J0Q;
	Fri, 16 Jan 2026 23:37:15 +0000
Date: Sat, 17 Jan 2026 00:37:00 +0100
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 4337/6849]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: can@12440000
 (renesas,r9a09g056-canfd): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202601170030.JuQztX2d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: edd0ce2e33ce2dae0c31e3b39108d0c327b8fb2b [4337/6849] arm64: dts: renesas: r9a09g056: Add CANFD node
config: arm64-randconfig-2055-20260115 (https://download.01.org/0day-ci/archive/20260117/202601170030.JuQztX2d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170030.JuQztX2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170030.JuQztX2d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: dma-controller@12010000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: can@12440000 (renesas,r9a09g056-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
--
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: dma-controller@12010000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: can@12440000 (renesas,r9a09g056-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
--
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: dma-controller@12010000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: can@12440000 (renesas,r9a09g056-canfd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-canfd', 'renesas,r9a09g047-canfd'] is too long
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd', 'renesas,r8a779h0-canfd']
   	'renesas,r9a09g056-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,r9a09g047-canfd' was expected
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rcar-gen4-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
