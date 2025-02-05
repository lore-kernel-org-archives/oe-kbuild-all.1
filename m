Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01DF20C47E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 02:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738722514; cv=none; b=mt4SuN2RI4oNA+7v6XJw1CMzQuD6Ng9Vz3JZiS+zhw7VE6GAZyHcUOgiL/jPcgp/+uqYei3DCBZZf3jl7PPAxdtC69367O01RI251mgoSroM7hDA56SXp42tTp/qvSRH8T7lVmj6RYrhL2t1/rUA607TMpqsdHJSNUB1vA3nvPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738722514; c=relaxed/simple;
	bh=POPOJfhNqXZkWeQd4g1ndQfaBJIXy3xftSZBUAJCTYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8lfXZ2ZIeQGK+8xRXmXowlwo2/TzB3XFjxTNb9RoxOj38zfvcxXOS+V65sJPxLJv5QAh272KeLjMEPMyifaWhixaUWxhhl9HC0+9eh3HUoE9TjAyea6iTofMZ8/ryrp1Y5Wfrwaw7EMglhLrh8qwUYCkJ+MECEQQWIuE7t2h9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExRWEY7a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExRWEY7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738722513; x=1770258513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=POPOJfhNqXZkWeQd4g1ndQfaBJIXy3xftSZBUAJCTYY=;
  b=ExRWEY7aLRebNQsNt3ghcW3z8p5r94qOwGbBxIVXIVEEuPNHDZeQVn7+
   yl7hntvWwV2GhWsEcrLsIAuX10bSMMZ6xk+na7f+ckik8oh9hXmRwqVGy
   e7syJhxXCfLTK/Apz6EPLmcJKd8D6SD3vALpaWVkD1a9hQZ/eqSxFeT0e
   GnKP1+ruIGKWf1r6t3AnlcExuZ51O/7v1r5tWplan5bdL7webW5KHwvcQ
   cpaB3UIKxtpscRvvyrWI/dKdAvDw5B714e0tN7QPo2p7jWwZT/OVppaRZ
   5Usik5rfvg1n/hd4bfdWuj/yIlwxOE0PlkGpBllecE4rbgTBK2IA+iom/
   w==;
X-CSE-ConnectionGUID: xqT5mh4VSx2t4kTyknvh1g==
X-CSE-MsgGUID: 10xF4qncSZSl194wmwUaNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39380934"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39380934"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 18:28:32 -0800
X-CSE-ConnectionGUID: DdJH8vqTRwuBO/uFXeghIA==
X-CSE-MsgGUID: ZVm/ba9WTNW4tOT2yKqHJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115958150"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2025 18:28:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfV9Q-000tKV-2E;
	Wed, 05 Feb 2025 02:28:28 +0000
Date: Wed, 5 Feb 2025 10:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: panel: 'power-supply' is a
 required property
Message-ID: <202502051047.ZWSggeKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   89cb8bc425a44875dc0420914465cbc1936bef3f
commit: be7a58f666a5aa1c235535a3c6a40d2765753232 [35/35] CHROMIUM: arm64: dts: mt8196-evb: add dvo and edp node
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250205/202502051047.ZWSggeKA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051047.ZWSggeKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051047.ZWSggeKA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b890000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b8b0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
