Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB33A8F5C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732674499; cv=none; b=RdSO0NQmJslMCPkWPE9WqdtZN/i7mvUA9bQld+jN+dY35L2COrkf/u/4debMxvWmZEVJE7wTUW78fKqQ3SPgPW7f3B56pDRqzLzyHbl96773UyHdKf5t65JPTl8QO2WiwsBYVFMMGAlZJEOiVHyDXON58icoIAul4uel/HHun+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732674499; c=relaxed/simple;
	bh=lM5RaY50IL4SRZQbt9xtn0UwEMsOVrv6w0v5tcr3K7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RZ3vnfVVQbQXKE1cROeGWIYnjSvIwF1SDPY7CMaOBZVNA70mP2l2Ladf6G6ZgwKBwMpoeqlhuxNuykvEBsds6BGFeJT/fPU9ofZVher0Naeb3QDhDwWZZRmUvlReC9sGHyOKuLMgZuJg999JbDaXICh74UMQdqgK6gquf1L6Fm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOBWxcvh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOBWxcvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732674498; x=1764210498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lM5RaY50IL4SRZQbt9xtn0UwEMsOVrv6w0v5tcr3K7E=;
  b=BOBWxcvhQHb6pGqpqsVRephHt3TrJ5TyWVd/zeBzN2xlwtYkdOL6P/Gs
   JScUZ60XxU2cLTETiSxrAaY+lkT8WURu6+wBrsWF6qdRTfzx756bA8Fhm
   pu7Ij4IaxY2pcZMz8q3unepqquWMPCfrUup7pJdfuBv9Nll4WtidMh0hG
   Okg7rt38grzsLOMRANVj+bHO3idiMsUUqFBMd835zWWtL1B2jpTP7Bhll
   skdUilfmgV0jzCcJSdBNdEFsoPT+gSarhncGagMO8Ure6iGVxS4EanC7A
   yDa6Kq5Q0Ylqg9e9ThbBNtyLEG/hMm4bMT+/SX2UqMap6xELDK5oUMsvb
   Q==;
X-CSE-ConnectionGUID: 78/sU6KvSdyEc64587kaHg==
X-CSE-MsgGUID: QgpUp3OzQNGjjmtYPRNEkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36525661"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="36525661"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 18:28:17 -0800
X-CSE-ConnectionGUID: DVUI4NJqQ5uOIqe6pm4llw==
X-CSE-MsgGUID: MlhPbvhBRBu8M863Qpc8TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="96542435"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2024 18:28:15 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG7mn-0007fH-1m;
	Wed, 27 Nov 2024 02:28:13 +0000
Date: Wed, 27 Nov 2024 10:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 8/12]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed
 to match any schema with compatible: ['google,steelix-sku131076',
 'google,steelix-sku131078', 'google,steelix-sku2147483391',
 'google,steelix-sku2147483646', 'google,steelix', 'm...
Message-ID: <202411271000.RoqdVh84-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   cf0624fcea57cf66fd358a00b59c2f7e3eccef58
commit: 93d11643735238c309981c90a447a8ee2d705161 [8/12] CHROMIUM: arm64: dts: mt8186: Add unprovisioned SKU IDs for Steelix
config: arm64-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241127/202411271000.RoqdVh84-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271000.RoqdVh84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271000.RoqdVh84-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	'google,elm-rev3' was expected
   	'google,chinchou-sku5' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131076', 'google,steelix-sku131078', 'google,steelix-sku2147483391', 'google,steelix-sku2147483646', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131076', 'google,steelix-sku131078', 'google,steelix-sku2147483391', 'google,steelix-sku2147483646', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131076', 'google,steelix-sku131078', 'google,steelix-sku2147483391', 'google,steelix-sku2147483646', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131076', 'google,steelix-sku131078', 'google,steelix-sku2147483391', 'google,steelix-sku2147483646', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
