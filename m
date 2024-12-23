Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B878F45
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734968448; cv=none; b=hWh29yJwgZgfDyZUwBigyUMlAqQrS0PEXXaWTsDQ9cSyYfQ3DGERsV6XofVfLYAQHdcwAjUPfROwPHEqKBHodKLYKiPNZv2a0ifFCsk/vaWNJTfSw19NorHvqqPvlV6b+J444V9b8VqCP3lgNVvoOK1ftYesUq6vgc2nrEjGmuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734968448; c=relaxed/simple;
	bh=WBSlCYWBrTbe4wgVKwJ5lIQ4LTfuZAxoxJF32T0lypE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=con4XiuLwJ/NxgfSQdwmEsvrcOvwXTywewGJaqUtSdCsAPbFS2QhQeIblLzV7ZYI93werYF/4pbtdkUrQ6RnlM0q5aeNUFipGRGi5gKJSMgXkRWgqdjRVxzeMrtWhaUbzh3sID3gZAMslBSa73WywHZlFsNn/Meia4HZNWzcqa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRCJsPQH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRCJsPQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734968446; x=1766504446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBSlCYWBrTbe4wgVKwJ5lIQ4LTfuZAxoxJF32T0lypE=;
  b=DRCJsPQH2stcFWx70FTBKHi+fe6IQPjeUwKpjz8HTwTSHC42Ru2K3beB
   f5IYjK8rezWwPEk6CDi6tZFAqKm40B7Q6XYaN+xtnHBgMViqhrS095Yan
   Fwuypc/nIKWlT/hDgtAwH8BRvV4OMuQoIHuElME8vuAyO+XZ7DBzyfFQ2
   jI83OW40NGhV/JprOfaethTr17FSk0CkdNDtiS4PVvARC38xzf22BDkyK
   YqHLTDpVmM7D36h3cdYCrSt4oKT1J3PKF+hfoCM30UbR3EalNVZQ3YWAf
   zzMh1vJaVhULfUHsKkucPPOvKupgpIH30FR+8VV1644TPNfj8jaOQ/lPt
   A==;
X-CSE-ConnectionGUID: wCHf8dy4QxyGMcJv5qlAxQ==
X-CSE-MsgGUID: FkkOrcuQS5OXgdWBEzspLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46443065"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="46443065"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 07:40:46 -0800
X-CSE-ConnectionGUID: J5A4d2S8TpOSps9TEmbHzQ==
X-CSE-MsgGUID: TUNeWZUmTFqj01xRQOrL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="99756149"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Dec 2024 07:40:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPkXy-00004t-0n;
	Mon, 23 Dec 2024 15:40:42 +0000
Date: Mon, 23 Dec 2024 23:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb:
 thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0',
 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the
 regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', ...
Message-ID: <202412232314.z9dzojel-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   366a8b7d9ac4e5d9188af4e393844d0c1185cf52
commit: 0b74c239db1f555638b541a80538c235479283b4 [1/1] BACKPORT: FROMLIST: arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
config: arm64-randconfig-053-20241214 (https://download.01.org/0day-ci/archive/20241223/202412232314.z9dzojel-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412232314.z9dzojel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412232314.z9dzojel-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: jpeg-encoder@17030000: iommus: [[123, 233], [123, 234], [123, 235], [123, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: jpeg-encoder@17030000: iommus: [[126, 233], [126, 234], [126, 235], [126, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,chinchou-sku16', 'google,chinchou-sku18', 'google,chinchou-sku19', 'google,chinchou-sku21', 'google,chinchou', 'mediatek,mt8186'] is too long
   	['google,chinchou-sku16', 'google,chinchou-sku18', 'google,chinchou-sku19', 'google,chinchou-sku21', 'google,chinchou', 'mediatek,mt8186'] is too short
   	'google,chinchou-sku16' is not one of ['mediatek,mt2701-evb']
   	'google,chinchou-sku16' is not one of ['mediatek,mt2712-evb']
   	'google,chinchou-sku16' is not one of ['mediatek,mt6580-evbp1']
   	'google,chinchou-sku16' is not one of ['prestigio,pmt5008-3g']
   	'google,chinchou-sku16' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,chinchou-sku16' is not one of ['mediatek,mt6592-evb']
   	'google,chinchou-sku16' is not one of ['mediatek,mt6755-evb']
   	'google,chinchou-sku16' is not one of ['mediatek,mt6765-evb']
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: jpeg-encoder@17030000: iommus: [[126, 233], [126, 234], [126, 235], [126, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
