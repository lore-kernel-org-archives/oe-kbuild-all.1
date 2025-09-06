Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041A257437
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 16:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757176867; cv=none; b=YjsqEOuiWB5r6jVkMSwW5w3xdSt1RQbf99J28E359mSiUIH+jFOpRUWEVocDFP3khXgTaND6u5abBXYh+ZuB9sgrzK/zbSVWaEXa3GEgZAPsTzV8YqHKRubm4T+6DWm0YHy4Aev2eF9w0y6pIQZ5Rs/0R6FXJsVeWBAiCPbqrfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757176867; c=relaxed/simple;
	bh=iKzZ2thleEamYA4hSDWR+OBPeLNS+YB3J4Rmj5bQSek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkU2ehYs5sHpU1Fcwi7Q9GJpNnGI8MICLmts1ZyRn5w5T4AtOHZvmB45iNNTUdvarlULAOxnyUWPtfzelA1nXKFp0N+sSNrFSc6VDx5xkQkMG9Ynppp84AZuJq7eEQZLjc3RjP6OLRh8VmsRQ4PAVUGnIOZilQ0dJDhXnPGHL98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRv4dkz9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRv4dkz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757176864; x=1788712864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKzZ2thleEamYA4hSDWR+OBPeLNS+YB3J4Rmj5bQSek=;
  b=nRv4dkz9ZrEG3R6TC/85YFLqyEgzQ4bNQTG3AbmILVH+iM+XGahq0Usw
   QPSUuqWIVU0SfYzeEeuJePS5YAiT0fgrU03cuUysVSsz/zGi7xU3VxM+i
   tNMa9OTbh4f748Xl+HOsDU/spmHclKxE8V0uooER3pgT+kQBddzC1nsRn
   lR0M7h0YVvUwwKop7EAyR+JKAT8RLux/LTr02mOklZY2bWn7616QYdchQ
   ZsGgAPuCN84fsUH0iUo5Dg7gbxUod4ONL64d9AdkUbMv9DoTAwuUTwAZo
   kQqiHpcAn2h1KEWnN5kto+PkWAZk3DiWuTXev1kdnh4itRkypcJvS2Y7d
   g==;
X-CSE-ConnectionGUID: /AS4ok5gQ5m990bYxtRwqQ==
X-CSE-MsgGUID: Raa2kXIkTCibXwLB/X1i9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="63326457"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="63326457"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 09:41:04 -0700
X-CSE-ConnectionGUID: PzWvcVX6Rm+mj9Hf3DeXng==
X-CSE-MsgGUID: tN4mJExVQHaeA+thCiWjUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="177614003"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Sep 2025 09:41:02 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuvyG-0001dX-1Z;
	Sat, 06 Sep 2025 16:41:00 +0000
Date: Sun, 7 Sep 2025 00:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 476/476]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: touchscreen@16
 (elan,ekth6a12nay): reg:0:0: 16 was expected
Message-ID: <202509070048.Nc9wkyL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   2c6d1e1400f4882ba37af399a11b0a21d5c00cf3
commit: 695131cdc49fcc32640380dd3491ff715932910b [476/476] CHROMIUM: dts: mt8189-skywalker-baze: Add elan trackpad and touchscreen support
config: arm64-randconfig-054-20250906 (https://download.01.org/0day-ci/archive/20250907/202509070048.Nc9wkyL6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070048.Nc9wkyL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070048.Nc9wkyL6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/i2c@11b20000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/i2c@11b20000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/i2c@11b20000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/i2c@11b20000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/i2c@11b20000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/i2c@11b20000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/i2c@11b20000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/xs-phy@11b10000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/i2c@11b20000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5682i']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
