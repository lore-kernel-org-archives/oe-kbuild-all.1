Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B812114F9FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734802886; cv=none; b=biEmo9nXWAz6EN9Aj9NH1sIE8Yk6aJns6CIesrU0fUlQJe07Nkbg79/WdjDeJoUAYYTGxVz4P/Vkt0luzr2KJMye/z/2Xo7ElcssaItbr8pJbNIaO/Kyv+/SXc7LF8CKnM7bfTZMmI0tzwWjg3WMmYV4hGMInfAY217K6BEhE18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734802886; c=relaxed/simple;
	bh=xttJfV2X6UAC9QsnYXdbA+UjRAoS0XvHOQelZ5zNXUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSVlBKdTNcZO631LZTaQcp9f9NCZkXo/7BwpFCE1thLZ3DYm1zlw/mJPinfZ1PDpD+Mq2cQWL9/790Nhcav58xP50UxO7iqrfuH28qopswvGKKOOjAheYOjRZYdvLY/W7O+l4KsXARdUOSXh8m6ZKiozeexNrgbT8Mgr6rX8P68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqePdWSc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqePdWSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734802884; x=1766338884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xttJfV2X6UAC9QsnYXdbA+UjRAoS0XvHOQelZ5zNXUg=;
  b=kqePdWScYwB9BhtcvJ9G/svuzzNp0D0xiWWYWpShAYxtHuyNjPJsFCzo
   JMjqsQl5HMlTqG8BbuVS+DWCMvrhVRcZh5fyGs4BgXzmpgb+DPAeM+pIg
   qq8/PagtvhCSLHodCFNbs98fynAma71XCSKrymPrFMW64guwjSgirOiWt
   npjxWjjGgbFmy1NuLR+s77OpTbifL2aqDfsBSlSd8ncbF0hgFmrmlsfa4
   cRUJLd+OBEoi0k8op7fY0N71y3Q7adVWEV54J1xlQ1I4cqOe5qu/j5eV2
   ohnlLJhApHgwU+RbTQyJkAXL1thyBKqPIXH1w+f9wp0kMI324vlO7CUlo
   g==;
X-CSE-ConnectionGUID: Pk9tsataSuG3EyVZNc0XkQ==
X-CSE-MsgGUID: XV0IdqKfSsij2jxOyry7nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46707460"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46707460"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 09:41:11 -0800
X-CSE-ConnectionGUID: dSlRlG3aTq2P72Psb4yIig==
X-CSE-MsgGUID: SNgANsnZS6acqnxMHcofGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="129631470"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2024 09:41:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP3TN-0002Lu-1L;
	Sat, 21 Dec 2024 17:41:05 +0000
Date: Sun, 22 Dec 2024 01:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 150/176]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb:
 thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0',
 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the
 regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', ...
Message-ID: <202412220109.mxybtfXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   cbdedad12232506c3f28f566960694f41d95acd3
commit: 0b74c239db1f555638b541a80538c235479283b4 [150/176] BACKPORT: FROMLIST: arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
config: arm64-randconfig-053-20241214 (https://download.01.org/0day-ci/archive/20241222/202412220109.mxybtfXu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220109.mxybtfXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220109.mxybtfXu-lkp@intel.com/

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
