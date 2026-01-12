Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275DA2D23B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 05:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768196733; cv=none; b=Gp1MnurLquJfoGKtAnsjMXSxwXhCRn1fJcuQdZO9yXDImxrZ/f12MugmoyQJTT04h4tCHJP5/fQOuoTt3q7WxQmmdh31J1I2HDxutywskMEa7mykhFsgPNngc7SxyjXvxHcqVBgrCugIzxwKrCebYhwTDR3bWws0Fxa9IuS+Eck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768196733; c=relaxed/simple;
	bh=xHKaciquvIYR29QgUJea0K98tOv3+r4iqYofsbxU22M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pirKH84in8OQ9wWxcLHzzXhLf4zUATz1u4sHHwu+NFYAucCRlLMSlyT8sRle5LC7H3UjoRMg+Mvjcgkem8tt8dEAsUAf31k1Ww8AWAQrdezmJnVVUYVgWPs3O7iHHAYr6tNVySI0zzOkj9HU2pdR8Q2oU/6xNwpjZ2viEhcME9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drNQFtk7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drNQFtk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768196732; x=1799732732;
  h=date:from:to:cc:subject:message-id;
  bh=xHKaciquvIYR29QgUJea0K98tOv3+r4iqYofsbxU22M=;
  b=drNQFtk7iSD5IexUcCUzISups11ZUrpZaNKp6yf/8+PoU/eagBju6aiF
   jkdgDh7dEHMXPQRerbFYIdNyTmmIrDP1pM0EcKBuZ2sHxQFSCd0IgUSzq
   /SDmXcqDsmj6sM3waOczOJfcrhn9S7J4d1kFh9QQnZPzHYcKn9tDc3KzZ
   qxbQ4qal5lzAp8M9J+slBVcDMxrevHAJhsOjKwQk5KBY7EGoIQ1ZkgX5H
   hKXuuOAmNTWzIaPMQGZXLWuZ0nJGJPvNYFTlHyvhp5VIpU0R5wbTUB2nr
   +w68+AbvJpzMumEKaiXBiLqWUpRnXiKArHZ/5kcFN4Umg0WdfCbf1bygr
   A==;
X-CSE-ConnectionGUID: qGMp363dS2GpjS3t6+3w2w==
X-CSE-MsgGUID: bD0XkGaZQkGYRAAzN9LTRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69395830"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69395830"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 21:45:32 -0800
X-CSE-ConnectionGUID: LMH7DABDQaKq3b8QKt0GFw==
X-CSE-MsgGUID: kxpUJJeKS1KMAKdUH+jfEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208836551"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jan 2026 21:45:30 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfAk4-000000000ln-0CNg;
	Mon, 12 Jan 2026 05:45:28 +0000
Date: Mon, 12 Jan 2026 06:44:56 +0100
From: kernel test robot <lkp@intel.com>
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: btmrvl@2
 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match
 '^bluetooth(@.*)?$'
Message-ID: <202601120625.Y5fhi4uW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f61b1860cc3f52aef9036d7235ed1f017632193
commit: 73d2d709cc172da53402c9b2ead39bebc774ea16 dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
date:   6 weeks ago
config: arm64-randconfig-2051-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120625.Y5fhi4uW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120625.Y5fhi4uW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120625.Y5fhi4uW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rdma@14002000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rsz@14003000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rsz@14004000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/rsz@14005000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/wdma@14006000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-wdma']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rdma@14002000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rsz@14003000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rsz@14004000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/rsz@14005000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/wdma@14006000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-wdma']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: btmrvl@2 (marvell,sd8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rdma@14002000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rsz@14003000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rsz@14004000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/rsz@14005000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/wdma@14006000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-wdma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
