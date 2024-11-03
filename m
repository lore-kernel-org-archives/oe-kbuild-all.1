Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB6B658
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 04:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730607198; cv=none; b=ieRLi62wR0dgCVKzMl5rUiYX45C8iViGZvhcea4OFFoUdr/hwyjd4Q2eIyWUVBZ+SCXuJ3DR0gyLpalnBnkS6rzDMHyoVWlNjWD7/z2JGOvKM4CMM0RwuN4lw44XzkpAuLBoT6UmEiWudcXJ4sU61jnqcQ/2D5MnL2tj5+SH1Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730607198; c=relaxed/simple;
	bh=ZfDD/3d8rc6FwEGpDYMV3hOV7RmJTdsGMCTjaAESWYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WP+YtgrovK1ypO9hjwQygVSzRoclUrGWYObdqTPjHZesWGnELcPTW1n+o+W7dv1XNMJx3mD5sGDkbN4uw/AXLvi5Jd4u70ZfeRoGd7VspxlR23F1MPJjyWsexNZFy5jATdCnU66QYw64boJ4iQin88rsRuyRRQQO4SPESDR8+Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNC2V7ep; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNC2V7ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730607195; x=1762143195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZfDD/3d8rc6FwEGpDYMV3hOV7RmJTdsGMCTjaAESWYw=;
  b=dNC2V7epgiioDQuxtJHxt+nAfZn/qhjItaXiD1KxcHTvrGaVo374FjC0
   RHWiBNWDQZfDM3OtaapRu8HROjMJ112z7tntLKgi/muWWjm+5Wp752gOF
   ef8G/6AKykzr4dYiCStFopKH0dRU6me7UHYIDIXfmvMSG/Z1rKhdtnG8i
   xqCQksBZ+5gzKAP+BnSMuXlWAfxrWOoMw68uCNLHs2WqupG1zZZn0adco
   oO8LC1q8HgytiIdF6tvUmEk0baD5kY2uarl5BxJG/ZyMuzpV6+hY16SZ/
   7jMeP1a6jFhjGj+3kZ+52TGeM41+FWV8wtaXfsSY1ZsdHONQ97SvSaGoq
   A==;
X-CSE-ConnectionGUID: MTFlJbcpRzubKJGgY/kMTQ==
X-CSE-MsgGUID: 4BtSN0NhTneRQV2lZSjAVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="47826862"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="47826862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 21:13:13 -0700
X-CSE-ConnectionGUID: BKxdCtMuRcebYtQbYhhI8A==
X-CSE-MsgGUID: UH2jQyf+TB+foGEcIYzTSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="88151522"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Nov 2024 21:13:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7RzA-000jfn-33;
	Sun, 03 Nov 2024 04:13:08 +0000
Date: Sun, 3 Nov 2024 12:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 83/91]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202411031220.0KvdDdrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   e21c1059f5fa6731f7a7d9460d4d64a6ed45deeb
commit: 9d93bf02978ac8934217a12c211586b005a2aef7 [83/91] CHROMIUM: arm64: dts: mt8186: Restore the elan touchpad setting in Veluza
config: arm64-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241103/202411031220.0KvdDdrv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031220.0KvdDdrv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031220.0KvdDdrv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2244.30-2248.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2250.23-2254.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2256.35-2260.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2236.32-2353.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,veluza-sku65536', 'google,veluza-sku65537', 'google,veluza', 'google,corsola', 'mediatek,mt8186'] is too long
   	['google,veluza-sku65536', 'google,veluza-sku65537', 'google,veluza', 'google,corsola', 'mediatek,mt8186'] is too short
   	'google,veluza-sku65536' is not one of ['mediatek,mt2701-evb']
   	'google,veluza-sku65536' is not one of ['mediatek,mt2712-evb']
   	'google,veluza-sku65536' is not one of ['mediatek,mt6580-evbp1']
   	'google,veluza-sku65536' is not one of ['prestigio,pmt5008-3g']
   	'google,veluza-sku65536' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,veluza-sku65536' is not one of ['mediatek,mt6592-evb']
   	'google,veluza-sku65536' is not one of ['mediatek,mt6755-evb']
   	'google,veluza-sku65536' is not one of ['mediatek,mt6765-evb']
--
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /: failed to match any schema with compatible: ['google,veluza-sku65536', 'google,veluza-sku65537', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /: failed to match any schema with compatible: ['google,veluza-sku65536', 'google,veluza-sku65537', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /: failed to match any schema with compatible: ['google,veluza-sku65536', 'google,veluza-sku65537', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /: failed to match any schema with compatible: ['google,veluza-sku65536', 'google,veluza-sku65537', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: touchpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: jpeg-encoder@17030000: iommus: [[124, 233], [124, 234], [124, 235], [124, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2244.30-2248.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2250.23-2254.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2256.35-2260.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2236.32-2353.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,veluza-sku131072', 'google,veluza-sku131074', 'google,veluza', 'google,corsola', 'mediatek,mt8186'] is too long
   	['google,veluza-sku131072', 'google,veluza-sku131074', 'google,veluza', 'google,corsola', 'mediatek,mt8186'] is too short
   	'google,veluza-sku131072' is not one of ['mediatek,mt2701-evb']
   	'google,veluza-sku131072' is not one of ['mediatek,mt2712-evb']
   	'google,veluza-sku131072' is not one of ['mediatek,mt6580-evbp1']
   	'google,veluza-sku131072' is not one of ['prestigio,pmt5008-3g']
   	'google,veluza-sku131072' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,veluza-sku131072' is not one of ['mediatek,mt6592-evb']
   	'google,veluza-sku131072' is not one of ['mediatek,mt6755-evb']
   	'google,veluza-sku131072' is not one of ['mediatek,mt6765-evb']
--
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131072', 'google,veluza-sku131074', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131072', 'google,veluza-sku131074', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131072', 'google,veluza-sku131074', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131072', 'google,veluza-sku131074', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: touchpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: jpeg-encoder@17030000: iommus: [[125, 233], [125, 234], [125, 235], [125, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2244.30-2248.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2250.23-2254.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2256.35-2260.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2236.32-2353.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,veluza-sku131073', 'google,veluza-sku131075', 'google,veluza', 'google,corsola', 'mediatek,mt8186'] is too long
   	['google,veluza-sku131073', 'google,veluza-sku131075', 'google,veluza', 'google,corsola', 'mediatek,mt8186'] is too short
   	'google,veluza-sku131073' is not one of ['mediatek,mt2701-evb']
   	'google,veluza-sku131073' is not one of ['mediatek,mt2712-evb']
   	'google,veluza-sku131073' is not one of ['mediatek,mt6580-evbp1']
   	'google,veluza-sku131073' is not one of ['prestigio,pmt5008-3g']
   	'google,veluza-sku131073' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,veluza-sku131073' is not one of ['mediatek,mt6592-evb']
   	'google,veluza-sku131073' is not one of ['mediatek,mt6755-evb']
   	'google,veluza-sku131073' is not one of ['mediatek,mt6765-evb']
--
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131073', 'google,veluza-sku131075', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131073', 'google,veluza-sku131075', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131073', 'google,veluza-sku131075', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /: failed to match any schema with compatible: ['google,veluza-sku131073', 'google,veluza-sku131075', 'google,veluza', 'google,corsola', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: touchpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/spi@11012000/tpm@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/mmc@11240000/bluetooth@2: failed to match any schema with compatible: ['mediatek,mt7921s-bluetooth']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: video-encoder@17020000: compatible:0: 'mediatek,mt8186-vcodec-enc' is not one of ['mediatek,mt8173-vcodec-enc-vp8', 'mediatek,mt8173-vcodec-enc', 'mediatek,mt8183-vcodec-enc', 'mediatek,mt8188-vcodec-enc', 'mediatek,mt8192-vcodec-enc', 'mediatek,mt8195-vcodec-enc']
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: video-encoder@17020000: compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc'] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: video-encoder@17020000: clock-names:0: 'venc_lt_sel' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: /soc/video-encoder@17020000: failed to match any schema with compatible: ['mediatek,mt8186-vcodec-enc', 'mediatek,mt8183-vcodec-enc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: jpeg-encoder@17030000: iommus: [[125, 233], [125, 234], [125, 235], [125, 236]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: thermal-zones: 'adsp', 'cam', 'cpu_big0', 'cpu_big1', 'cpu_zone0', 'cpu_zone1', 'cpu_zone2', 'mfg', 'nna', 'soc_max' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
