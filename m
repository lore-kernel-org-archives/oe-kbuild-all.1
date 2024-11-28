Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CE41C07E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732812637; cv=none; b=DFr3oJEhL+8hXheWh2UouV4YoYLdfFrdRHSjkgOQjJL3hfGwv8CWeLN0K0+dZPCOAvBVzhQM8bCE4/yOuTyCHE3r7S8Djj/8alB7JAPBjkbz7whV6QJ3JKIbh/jIQI9VhEj2VExpB+zvxEupMtRXzO+VS6v/OHXE+m8XkCVal8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732812637; c=relaxed/simple;
	bh=SklLmnQ42Wyy06uGmDzA1zo9OlvKGgyUwJusXfAglVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMK73DO268vaIoua1GtjDAKXco0N2IlALU39tux8bZA+wXfMjgeDVLEmCaUVgMJ08UHbIp2cDDyUU9sKchd2mfajCYiFcqsCEwO2pXaF4bHvHuR/be0hQ7JmRO7BuAOUeinOVYTFr2hJzY71WExZe/TXa2Wv6d1Qq5wkUcDqniI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPmw0ENh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPmw0ENh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732812636; x=1764348636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SklLmnQ42Wyy06uGmDzA1zo9OlvKGgyUwJusXfAglVE=;
  b=QPmw0ENh0jpH+q4MpS8Yplmf52y1mN8gvyVsqVxr5qGj3EdF/UDP1nml
   bImMhkIbDLLwUcCbu+k6Mq+Ysx+hDfEpc9ZQU8UH0zR2MuXutwl6ABkID
   b3dpQfyugY9I11UNItKs7GX9pT1082UiYXxal5OeNhnZ3ETYqUijSZgOO
   O5y1PQbt331JzwTH/NYURknoxZzn9wdEL3vuxq+U/DyGBEKQ+ymHCa3ca
   qK8aMiYzY0rINHLKLSCo5POlJHRZHFXHfMhw+DBfhIeJBsQy/6QukJ+bo
   AtYfvgjJDN3VYGd6BlyJjWqheaHK7fpHS0DDXK5wQErUz+spot5/YWoql
   Q==;
X-CSE-ConnectionGUID: 8jWYfgtWR8S0rK8pYc6fTQ==
X-CSE-MsgGUID: cYhu6VYORjC6yGl+13UVgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44112227"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="44112227"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 08:50:35 -0800
X-CSE-ConnectionGUID: MpTc3uEuRn+YmU19/XzSnA==
X-CSE-MsgGUID: oEHKSLbYQyK3lKmwx/xupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92458041"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Nov 2024 08:50:34 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGhip-0009pX-2E;
	Thu, 28 Nov 2024 16:50:31 +0000
Date: Fri, 29 Nov 2024 00:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 11/12]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /: failed to
 match any schema with compatible: ['google,squirtle-sku0',
 'google,squirtle-sku2147483647', 'google,squirtle-sku2147483391',
 'google,squirtle', 'mediatek,mt8186']
Message-ID: <202411290053.iTnrHVhH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3c6853ebba70a03ae7540022d1b4ecffe0da3703
commit: bd9dc6c0d7d2a504695dc8438b531433579b6430 [11/12] CHROMIUM: arm64: dts: mt8186: Add unprovisioned SKU IDs for Squirtle
config: arm64-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241129/202411290053.iTnrHVhH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290053.iTnrHVhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290053.iTnrHVhH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /: failed to match any schema with compatible: ['google,squirtle-sku0', 'google,squirtle-sku2147483647', 'google,squirtle-sku2147483391', 'google,squirtle', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /: failed to match any schema with compatible: ['google,squirtle-sku0', 'google,squirtle-sku2147483647', 'google,squirtle-sku2147483391', 'google,squirtle', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /: failed to match any schema with compatible: ['google,squirtle-sku0', 'google,squirtle-sku2147483647', 'google,squirtle-sku2147483391', 'google,squirtle', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /: failed to match any schema with compatible: ['google,squirtle-sku0', 'google,squirtle-sku2147483647', 'google,squirtle-sku2147483391', 'google,squirtle', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle-sku0.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
