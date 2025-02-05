Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964C22A4D9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755392; cv=none; b=tkhdvs8tYnhy25K+Drnu15fpyeebdy2objTJBwbTDNSQwozpw8/0+Jadd6UH/dbbGa6tUIK9ZOxrErxXdkWqgnV+EeBkQ2PlIjcyzyJlmTBQe5dyUJwy5fT8koA0gBYDvypbBLR6QaIUG3LJ3lQZyWMjmU3iCc0zcIymQiNRyJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755392; c=relaxed/simple;
	bh=8pw2sXk9y1TWQDmP8YGN6m1nXjgCU1+O9qUan1kkQ6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQlKJSo/S20FANJaZAJZnicgqgpAosDR+G3yyUTJfvSBvFnpqo3KWFAEp8p3d7qZWcgZccrROn5adj69MpHPHk7DbqygIHfF3gTRv2fR7lxJg7RjMt/9DTy3gUWKyiowV67djN+bF58ixtpUAwB96GfByk086w4+lq5XTXl1IX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYrzkl8x; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYrzkl8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738755390; x=1770291390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pw2sXk9y1TWQDmP8YGN6m1nXjgCU1+O9qUan1kkQ6k=;
  b=jYrzkl8x3xpWBdAIXX4s0NkG/ldnTuPMghOw5RYT8FO86VdQJpU9/wf5
   jfcD9rC9CT4ycW5PVkmNkbXAINFrmkCOd+IIHEahO8Cp1DI6aKjrvZUys
   mTMXuzrAMIwoAahYTfEEoHRCitt3bg990EnANVZBPzFswrJXzdKi9jxX8
   Khh2Isl2KUF3Y7v0q/ncfmRkIVL9GWpsUXpMIJt9tseg78+xcLCfiEuSp
   Wm8MrtRh64fLFxYQbfxvja21hNiMs0c60OnNkEr77zN40mKrS/hCcGgkE
   3AUMqBHb637CoxQA0tvjSjSTrmtj4xIdYfU3TwQ5RRZAPwj9PSdi7ir+g
   Q==;
X-CSE-ConnectionGUID: XChk1Ep4T6O+VgZkmJZhVQ==
X-CSE-MsgGUID: i08H6p9vQsOyrmNq9vQRug==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61785991"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="61785991"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:36:29 -0800
X-CSE-ConnectionGUID: ZC0PXwbQQUalwPI9OwqLLA==
X-CSE-MsgGUID: HCewlNvHRneVrlc6cPWOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148080683"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Feb 2025 03:36:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfdhi-000tpP-0p;
	Wed, 05 Feb 2025 11:36:26 +0000
Date: Wed, 5 Feb 2025 19:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dsc0-wrap0@32450000:
 failed to match any schema with compatible: ['mediatek,mt8196-disp-dsc']
Message-ID: <202502051908.s76qnZcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: 13ecc998839331361a7a2182ae056b79da801118 [170/170] CHROMIUM: arm64: dts: mediatek: mt8196: Add support for dp DSC
config: arm64-randconfig-051-20250204 (https://download.01.org/0day-ci/archive/20250205/202502051908.s76qnZcZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051908.s76qnZcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051908.s76qnZcZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32400000: 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32420000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32420000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32430000: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32440000: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dsc0-wrap0@32450000: failed to match any schema with compatible: ['mediatek,mt8196-disp-dsc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dsc1-wrap1@32460000: failed to match any schema with compatible: ['mediatek,mt8196-disp-dsc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dsi@32490000: failed to match any schema with compatible: ['mediatek,mt8196-dsi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dvo0@324c0000: failed to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32820000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32820000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
