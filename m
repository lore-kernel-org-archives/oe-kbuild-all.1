Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F102AE68
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733106640; cv=none; b=MndNFByIYogu5qZE9QbW1MYSA5LyYqg8WlEHxawR+v5uwVf69tJwv+j1lmINyZ5G9LtGeD3eGJbpqgJNT818eh6CZIb5ha/Veavmot13VQ+r04bLZhjCyU14czxehMoX49A+ID+HbTZl2EZp4BhYF9zJivni8mVLYGaU9WE4WuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733106640; c=relaxed/simple;
	bh=inyTfVEmF5tP+R1sYo0wPQOWx25z8RqNioiKEZjitOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSzt0wQ2zpMkH4pDPcmrhYUAGEsPAvxVS+/U/Wizw0gSTEowAKgeByh5RE7Qfh066iJqG26tVXLeU/s9BUEsGJpBtxG/PvZnKn7U+8rFRgHDRApy1ivxIX2pZRfF6TRFBPkE64rx2w9qi3A+qu0+1MHCcIfVASgyPJ+G4OGRP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1v2M04Z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1v2M04Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733106638; x=1764642638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=inyTfVEmF5tP+R1sYo0wPQOWx25z8RqNioiKEZjitOg=;
  b=l1v2M04ZLA1lzG02y49/XaoJ32LZ8Hh3/7XW3QTYUPyatpLG0JCb+lFP
   lKGUrT+hDIaGGkO1JyErUeyEqBC5Nfs2eaVzOjAQI0rBFKAHrH1DA9Dde
   +bT9GXIakRZogY+rGyI/8iFuDL4G73rq4s/Anr6jorLlgCL27s0a2k4xP
   x8tmpGuk9l6jFoQg3Css6gAWhb6o1zV/EwjR2qJ4SAcoL5GKtoftnqWUP
   ndGrnD4BgvyaJ0sojFKlzzVNEZ2yRxBoUzTbNYK6++I1XwHR/7qNqQ0rt
   /CNX0pNyAO9ro7jRW9CYU69WmsG91hZ183P2B9l18prKyZzKJSsQb1xv0
   g==;
X-CSE-ConnectionGUID: xLpeWM2wRkS9TLiUEh0d5A==
X-CSE-MsgGUID: QM6dCCKPRSCqw0ymtvDQ1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="20854290"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="20854290"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 18:30:37 -0800
X-CSE-ConnectionGUID: 91XXuimUQkuwLNJKZD5/bg==
X-CSE-MsgGUID: TZDuwyKpS7G5xfONI4kqrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="98092052"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Dec 2024 18:30:36 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHwCl-00021V-2x;
	Mon, 02 Dec 2024 02:30:32 +0000
Date: Mon, 2 Dec 2024 10:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-ea7682dbe6cf 88/520]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb:
 gpu@13040000: clocks: [[114, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too
 long
Message-ID: <202412021014.TQ5O8cea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-ea7682dbe6cf
head:   ac7a77c24fbce62cf3a673f994358d50cb59808a
commit: 3fe9407cb8a9cc39ae2b85f0858cb600717d3e54 [88/520] UPSTREAM: arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241202/202412021014.TQ5O8cea-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021014.TQ5O8cea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021014.TQ5O8cea-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: dp-bridge@5c: 'oneOf' conditional failed, one must be fixed:
   	'extcon' is a required property
   	'switches' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: gpu@13040000: clocks: [[114, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: jpeg-encoder@17030000: iommus: [[119, 233], [119, 234], [119, 235], [119, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: dp-bridge@5c: 'oneOf' conditional failed, one must be fixed:
   	'extcon' is a required property
   	'switches' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: gpu@13040000: clocks: [[114, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: jpeg-encoder@17030000: iommus: [[119, 233], [119, 234], [119, 235], [119, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: dp-bridge@5c: 'oneOf' conditional failed, one must be fixed:
   	'extcon' is a required property
   	'switches' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: gpu@13040000: clocks: [[114, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: jpeg-encoder@17030000: iommus: [[119, 233], [119, 234], [119, 235], [119, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: dp-bridge@5c: 'oneOf' conditional failed, one must be fixed:
   	'extcon' is a required property
   	'switches' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: gpu@13040000: clocks: [[114, 0], [45, 2], [3, 10], [3, 10], [45, 75]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: jpeg-encoder@17030000: iommus: [[119, 233], [119, 234], [119, 235], [119, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
