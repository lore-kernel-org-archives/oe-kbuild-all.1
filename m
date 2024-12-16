Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5972C17993
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358514; cv=none; b=XrfEhlJkrnlmBBPV44F69aTpb+am9rqMwbbqrDotb86qALC+hGT9oLFVhZ9xT8600Fj7BaBE8srjY2fONWhXdn26O6/yEwcjYmPsuuk9/J0k9HYN0um6o8ooryQR4cIcDKbgQyK7E7NdhFfytZidpJbN4LLQgBQpJiQh56TWBx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358514; c=relaxed/simple;
	bh=S6QxhDwNiCu8hRDWNm7ZiE8iJwE3oEnF0j0Z/+koH3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JPXZ9MvxSMzRNEaN6AjIy0VhmQG/kvDyOUDSJ59+0hZfI1iu6S8llw74LyxOLuy4iLqtE49wzZFT2fCG+LKdMpu53Ho173yIVZVOLknA/2g84zVUgv6q/cwjeOp5SCHsLKlb6g2bciiMJ0fuX1oBQZyicMjGdTwiiHBtIlaumBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaXOcz3i; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaXOcz3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734358512; x=1765894512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6QxhDwNiCu8hRDWNm7ZiE8iJwE3oEnF0j0Z/+koH3M=;
  b=QaXOcz3iClu/jyW7/KvW7JJT+E+6fa2uoCDrbjatom4WI0/WyH51MO8c
   pkrVGWbbjRzaVnHtzaO7+aSvZ0ndQgrx6RFp4qa4MkS3gAVJLs965puEK
   TiKd1h/EhH6eb2Du8+a19G2Wc4z21j9IjTNYzUBRUmtZYKlD366/slrWU
   glYPckVG/4sETyWag5i7NVTi6yd198cXoUQF0P0vddb5Kh0/5EC3Gvh6p
   bvVoBGsh5ef1P2urie7Kmr1Evw5jkOibO4D/DCd81QZq/PaYmNV9Geeji
   bB2hQGds0AGW4cTslRodrRPOKD/LbHjat87foGhJvUWwvixiZf2hZym5q
   w==;
X-CSE-ConnectionGUID: U9Ey2Zx4SOSKzfE38jrw/Q==
X-CSE-MsgGUID: B26oJMNjRF6MsPk0JLJREg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22330422"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="22330422"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 06:15:12 -0800
X-CSE-ConnectionGUID: crVo/ZU+QyeR9dm7G0JoRQ==
X-CSE-MsgGUID: OgQrCSt7QxuOQsT6XFhhuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="96977971"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Dec 2024 06:15:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNBsK-000EFY-21;
	Mon, 16 Dec 2024 14:15:08 +0000
Date: Mon, 16 Dec 2024 22:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 2/2]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412162255.WAkeZWgw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   4b90329103b336277465217d780081e7bded5165
commit: 48a0621305e7453ba61f126955b090a1ebee4072 [2/2] CHROMIUM: arm64: dts: mt8186: Add unprovisioned Starmie SKUs
config: arm64-randconfig-051-20241216 (https://download.01.org/0day-ci/archive/20241216/202412162255.WAkeZWgw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412162255.WAkeZWgw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412162255.WAkeZWgw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,starmie-sku2147483640', 'google,starmie-sku2147483635', 'google,starmie-sku2147483638', 'google,starmie-sku2147483641', 'google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3', 'google,starmie', 'mediatek,mt8186'] is too long
   	['google,starmie-sku2147483640', 'google,starmie-sku2147483635', 'google,starmie-sku2147483638', 'google,starmie-sku2147483641', 'google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3', 'google,starmie', 'mediatek,mt8186'] is too short
   	'google,starmie-sku2147483640' is not one of ['mediatek,mt2701-evb']
   	'google,starmie-sku2147483640' is not one of ['mediatek,mt2712-evb']
   	'google,starmie-sku2147483640' is not one of ['mediatek,mt6580-evbp1']
   	'google,starmie-sku2147483640' is not one of ['prestigio,pmt5008-3g']
   	'google,starmie-sku2147483640' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,starmie-sku2147483640' is not one of ['mediatek,mt6592-evb']
   	'google,starmie-sku2147483640' is not one of ['mediatek,mt6755-evb']
   	'google,starmie-sku2147483640' is not one of ['mediatek,mt6765-evb']
--
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	'google,elm-rev3' was expected
   	'google,chinchou-sku5' was expected
   	'google,elm' was expected
   	'google,chinchou-sku6' was expected
   	'google,chinchou-sku7' was expected
   	'google,chinchou-sku17' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: failed to match any schema with compatible: ['google,starmie-sku2147483640', 'google,starmie-sku2147483635', 'google,starmie-sku2147483638', 'google,starmie-sku2147483641', 'google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3', 'google,starmie', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: failed to match any schema with compatible: ['google,starmie-sku2147483640', 'google,starmie-sku2147483635', 'google,starmie-sku2147483638', 'google,starmie-sku2147483641', 'google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3', 'google,starmie', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: failed to match any schema with compatible: ['google,starmie-sku2147483640', 'google,starmie-sku2147483635', 'google,starmie-sku2147483638', 'google,starmie-sku2147483641', 'google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3', 'google,starmie', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /: failed to match any schema with compatible: ['google,starmie-sku2147483640', 'google,starmie-sku2147483635', 'google,starmie-sku2147483638', 'google,starmie-sku2147483641', 'google,starmie-sku0', 'google,starmie-sku2', 'google,starmie-sku3', 'google,starmie', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,starmie-sku2147483642', 'google,starmie-sku1', 'google,starmie-sku4', 'google,starmie', 'mediatek,mt8186'] is too long
   	['google,starmie-sku2147483642', 'google,starmie-sku1', 'google,starmie-sku4', 'google,starmie', 'mediatek,mt8186'] is too short
   	'google,starmie-sku2147483642' is not one of ['mediatek,mt2701-evb']
   	'google,starmie-sku2147483642' is not one of ['mediatek,mt2712-evb']
   	'google,starmie-sku2147483642' is not one of ['mediatek,mt6580-evbp1']
   	'google,starmie-sku2147483642' is not one of ['prestigio,pmt5008-3g']
   	'google,starmie-sku2147483642' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,starmie-sku2147483642' is not one of ['mediatek,mt6592-evb']
   	'google,starmie-sku2147483642' is not one of ['mediatek,mt6755-evb']
   	'google,starmie-sku2147483642' is not one of ['mediatek,mt6765-evb']
--
   	'google,chinchou-sku3' was expected
   	'google,steelix-rev1-sku196608' was expected
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /: failed to match any schema with compatible: ['google,starmie-sku2147483642', 'google,starmie-sku1', 'google,starmie-sku4', 'google,starmie', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
