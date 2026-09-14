Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F503B0AD3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414250; cv=none; b=f7iDHQo1BNG6Rj3lov0411sAAKXGK7xIZqvLh/HR7iVHJx+kDnosx9frsNlLmJUIILrASVedVjwNOtgZhOLnFiXE2C4W1ZvEykAUKwFuRLdIoUko6pC83l8tSqINRfAYogYNzDj78lO2msWJtwrsLEfGjVrRnCJXpBE2RGCORBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414250; c=relaxed/simple;
	bh=TG3LCGMc2sb3l/ZsXtMvOhhHxH2imwDm9mXAl/IS1j8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nBaxxG3aLuLK5VNGNYN/pFVbsRByFJlWbWW4kQGEtfOTx41tBr6QXOgOYaXDF3k1g6wNHASud+TGj546ymPmP37bSspX5ZhHQzyw++75TsC+Qs+lBVuZHR2TAgBAScBfVYS7gCTp/BLnPjbJwxGuHhYzbPmn0Er46Urb5fk00lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzTikYTC; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzTikYTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789414246; x=1820950246;
  h=date:from:to:cc:subject:message-id;
  bh=TG3LCGMc2sb3l/ZsXtMvOhhHxH2imwDm9mXAl/IS1j8=;
  b=jzTikYTCrevpBqt5DQL9jV7OprscEZtGkhl5/5gXLiuGyHOZTtlaHbLh
   6vCCwNapT1NOyzQrI+pXBMd/HlQsoV0u7y9bzJRowxedJKcK3B6MOrJsC
   jx1zJTFw2lmL2KL0dOD1QqvnRMiKPluB/ZPyiiHV1cv986hBT6maiv6qQ
   h35kaQH1nJFmCaM4V/pgHy/RgpauXpKetnLwuGGJnDiNtPmqQ2Vgaaq0l
   9wvr5J3KluibpAX99LfJd5toFPXD4Vk7W6q39Ro9e6LBL7W2wJy8bWtfT
   aB0W4+qYaH2/pYQsuyXPI1km9EmGpUFqruatrFZCLtboGeLyiUdywyxrU
   A==;
X-CSE-ConnectionGUID: RAatROtTQo2zzyMnZ5V0MA==
X-CSE-MsgGUID: rs4NX18iRxiaf93d4U0Xkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="282772"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="282772"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 12:30:44 -0700
X-CSE-ConnectionGUID: ESf/RpWmSfiyDBI6UKwzMg==
X-CSE-MsgGUID: eb/hbGD8SVGLVqr/FMbfrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1126244"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 14 Sep 2026 12:30:43 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6CO0-000000000Gh-49o4;
	Mon, 14 Sep 2026 19:30:41 +0000
Date: Mon, 14 Sep 2026 21:30:21 +0200
From: kernel test robot <lkp@intel.com>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 5321/6369]
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dtb:
 /reserved-memory/trustzone-bootinfo@80002000: failed to match any schema with
 compatible: ['mediatek,trustzone-bootinfo']
Message-ID: <202609142134.u9yU6yh6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   68142f986ff04b2b70b31db00f719bf690f64a9a
commit: 2e195497fc9fc0dd89cf95dab80a2d0486dab65b [5321/6369] ARM: dts: mediatek: Add basic support for Amazon ford board
config: arm-randconfig-2052-20260912 (https://download.01.org/0day-ci/archive/20260914/202609142134.u9yU6yh6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609142134.u9yU6yh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609142134.u9yU6yh6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts:21.38-28.5: Warning (unit_address_vs_reg): /chosen/framebuffer@b7a00000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/mediatek/mt8127.dtsi:62.24-66.5: Warning (simple_bus_reg): /clocks/dummy13m: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt8127.dtsi:68.21-72.5: Warning (simple_bus_reg): /clocks/dummy32k: missing or empty reg/ranges property
   arch/arm/boot/dts/mediatek/mt8127.dtsi:74.22-78.5: Warning (simple_bus_reg): /clocks/dummy26m: missing or empty reg/ranges property
>> arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dtb: /reserved-memory/trustzone-bootinfo@80002000: failed to match any schema with compatible: ['mediatek,trustzone-bootinfo']
>> arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dtb: clocks (simple-bus): dummy26m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dtb: clocks (simple-bus): dummy13m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dtb: clocks (simple-bus): dummy32k: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dtb: clocks (simple-bus): $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dtb: watchdog@10007000 (mediatek,mt8127-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8127-wdt', 'mediatek,mt6589-wdt'] is too long
   	'mediatek,mt8127-wdt' is not one of ['mediatek,mt2712-wdt', 'mediatek,mt6589-wdt', 'mediatek,mt6735-wdt', 'mediatek,mt6795-wdt', 'mediatek,mt7986-wdt', 'mediatek,mt7988-wdt', 'mediatek,mt8183-wdt', 'mediatek,mt8186-wdt', 'mediatek,mt8188-wdt', 'mediatek,mt8192-wdt', 'mediatek,mt8195-wdt']
   	'mediatek,mt8127-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,mt6572-wdt', 'mediatek,mt6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-wdt', 'mediatek,mt7623-wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', 'mediatek,mt8188-wdt', 'mediatek,mt8189-wdt', 'mediatek,mt8365-wdt', 'mediatek,mt8516-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml
   arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8127-wdt', 'mediatek,mt6589-wdt']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
