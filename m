Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAFC9476
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 03:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748576253; cv=none; b=pwjaWskpqsWj78DUJXLvxZ1KbRx0wayUAMmF61wN97JeyOMzqAe/OIWb6L35aDbLBBgZbxhLhCBUUfzUWm0/KCWReFFS4gO4+nikN8Ce2lkAbyLpOqUY+W75rCIqRbSQqEXKbQJAkQTobkiXiK/7Ms4yOKHF7F6fMlTdqUVvVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748576253; c=relaxed/simple;
	bh=zYXIczI0V11yr/MBxYVEwwzLt4bvWhk6eVUW2bbF9y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FfdCfz3us+XZ+3JvVsxsNfLFGlU37WFvo1Di4wMiaWFZU9+qn3AXKv+h34ZoQ6O2sInAyn5v0UVQ59bDxl0XSWgSX+X2DJo5fR2imPm6UxKNZ34a3JTbqUX9NWVTLYFWVz1kFL+liQ04YOSghAy0zfijZK7ZQaLwr7jvBpoppzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U13Z7pZc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U13Z7pZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748576251; x=1780112251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zYXIczI0V11yr/MBxYVEwwzLt4bvWhk6eVUW2bbF9y8=;
  b=U13Z7pZcjV18278JiwUBFXOKN/xERaiGv1PGNL15axJm8lQ/Gm9oZd06
   ZXnzemjvfRXN1HUIKIiJERT0nVv5pE7xWBsP2h0r+Ui/69AVy7kCVsWYs
   kUwjEZUqgO/E8YJIJvTg1ebqa3KzTY7JlxewFEd0HKI3Xdy82C3t8qkP4
   rSSvMxClg5t4M3U96cKrmpLhAU0vpVg23xo/vEDoY6Y/DnHRAiWITjOn4
   /DKEOU+7DWdqWXHLSthIJB+7S0okmBzR2+QhTlLyhXhRkJ2eY6+xgS2ZU
   fhns2ncNKEX2wfg25mr+tde/LvWTc0MVIbIGTHumr+e2ZIUV/w7r99Kij
   Q==;
X-CSE-ConnectionGUID: XXURsdsDQ0at6Rsu73NbYw==
X-CSE-MsgGUID: 2BD4V/zNTJuUADhMf0ldyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54458944"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="54458944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 20:37:30 -0700
X-CSE-ConnectionGUID: pIAo9y0xRCuZLRYyzT+Cig==
X-CSE-MsgGUID: fg2iWTj1RjmrFG+VHNbcFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="180967818"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2025 20:37:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKqYh-000XJ6-25;
	Fri, 30 May 2025 03:37:27 +0000
Date: Fri, 30 May 2025 11:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: dp-bridge@5c
 (ite,it6505): 'extcon' is a required property
Message-ID: <202505301122.xvOa4VMN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e3e18291d3d62133d3ef23cb34a4eb0919a36a77
commit: 6974b1ee7cb35339e3d85127e148c5976b010a16 [1/1] UPSTREAM: arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250530/202505301122.xvOa4VMN-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301122.xvOa4VMN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301122.xvOa4VMN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: dp-bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: dp-bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: dp-bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
