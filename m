Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5BE7E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 19:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734204431; cv=none; b=sblD5BXVjN1XcDaMfZ9/I01cfAwBX943UcZlsZiM+aI3tuqQdtw+v4SutoLmKKnE2g6h4WyUnYyHUhDn7pEcE0Z0WJFFVJw060PT5rGnGRD9uViXLCYTlTFdLzbQipmTSQk7fyogAsbXdCviZFYRtWWt/PkGr0K0UjAQ0qCwyzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734204431; c=relaxed/simple;
	bh=D+NPgHAoiT5kWS2hvDPZh/x0MAruaeIiieg988wlBAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVJgoiqOf8Pgs7ZuL+Xu1yJ4J0h78WMB1Df5fSelfzW64f1zHLpqzVNoo9E9GHddVe0w2R8/gUv3jx/DyW645f28kNSVhCQ1GV4zQQ4vyP7HIXyEA70ytdLA7NP23bVnD7JTgUmf9tnvpXVEXE2CciAdqGd82gJlp9BZh42VaO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNrUGrCF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNrUGrCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734204428; x=1765740428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+NPgHAoiT5kWS2hvDPZh/x0MAruaeIiieg988wlBAU=;
  b=MNrUGrCF0mtHJDgroFQ2qRvIGF6WwdP1g+Ggi3zfYih3ZUzBHe1E0cOm
   kJ+MGd48k/tcKfjWsRFddrTfNXqj0XVaiEd8C6FSJzOyA7UsKXHnY3AGA
   c1oS24+Hc+bCz2D+xoZzPOiroRc+jHIEnLGy2JAhfHba1gm/5+zW4rj5c
   xnKihJjIo6TfBqyVPzwEkACIn8aFykvBbh7j2E94yhtzZbCtpcQSssSjF
   1xQg1co8n6R7GWOUbV1ayiNEBjmZwUS2V5GEg/zVm4NCpx743EvCyIZpz
   4fdzZqbKUwx7OPjm6tI8GfTekoYfxzmFHk9O9JWG4+yvZNvaT1CHpbbsf
   A==;
X-CSE-ConnectionGUID: b6BgbF6wSiWAg97Hdw99EQ==
X-CSE-MsgGUID: lfKmCNMiQeqL5J0vHUVzZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="57116846"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="57116846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 11:27:06 -0800
X-CSE-ConnectionGUID: WwFO72SDQmC2xoYmIYlLxg==
X-CSE-MsgGUID: CtYfayLWS3q8DEyBY18aHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97238414"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Dec 2024 11:27:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMXn5-000DAt-2B;
	Sat, 14 Dec 2024 19:27:03 +0000
Date: Sun, 15 Dec 2024 03:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 150/176]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb:
 thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0',
 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the
 regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', ...
Message-ID: <202412150321.5H4mNbCq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1247cc74691a7711715450d3a10311d25b925114
commit: 0b74c239db1f555638b541a80538c235479283b4 [150/176] BACKPORT: FROMLIST: arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
config: arm64-randconfig-053-20241214 (https://download.01.org/0day-ci/archive/20241215/202412150321.5H4mNbCq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150321.5H4mNbCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150321.5H4mNbCq-lkp@intel.com/

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
