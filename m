Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEF76A33B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738808058; cv=none; b=W9OvJ37UBF+EYd6SkX6SirIt+ETLsWYJ/zx8iJBMrigUjHvFltNq6BWy7gyrF6wFcLk1dtgX+1Jsn4snuVWz/98GoWRSKFCi7piR+HcuAZbZT+EeM6gN4noNf2t2zhtwiQKoaz1k4I1uxnahraxhXdS/0gw3gwI7OKDAyH7yZHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738808058; c=relaxed/simple;
	bh=5rQbbdDcscqar/+DF5WDExoZLhKQv6GqZnWtSVpdJ4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryMTDibCt+VMd+vN16OYdYtUMJK/N/mwRwZQ1OfxBSvmZDpD9/jtq4yq+wPFx7oHUasVcy0lxTJ2ZFia0fe4RjkHWy0LkIdqgPd8iKTxFpExqM1AC0zASfxWhUmJEEwpOAQQNk61A2lNcc3OIsCcgzhQg/EJ+IUt9c9HjKBOFuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQTWM0dt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQTWM0dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738808057; x=1770344057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rQbbdDcscqar/+DF5WDExoZLhKQv6GqZnWtSVpdJ4g=;
  b=BQTWM0dtx2kgSJ07E5Jj+EfI7KHw9PV9bxyfm172e4z9KCtix4CEEGEi
   epQa4Fa3AcPwvHeww5BfKcCGD7HiJy9HB7ryKaZrrk8vqWJZfnH4beY8K
   5/umtmNne7vabtzolMCn1YXdwYLOyS/QGd7KKH8Ds5KDj1kSBtyVVjBtD
   CgklErmzSGNLvbkjyL6lCgszp0txlR0AFqjHnO+++18D7pRPAvJIX/o99
   CCj3ZHH2LqKyZtjjYSmbH4jnUXcHMzIuBfh/zwQcjR3M5ESTu01LCMS24
   Qp8xfm/V8o2DXipi/vwDx3qqmsL+zIwor0nXHLoik2daxsIfOjIzD0J46
   g==;
X-CSE-ConnectionGUID: +T6rezx3QfCx4fKQfLTj8Q==
X-CSE-MsgGUID: 7IdwNu2vSGe/BpmwceiKeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39095439"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="39095439"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:14:13 -0800
X-CSE-ConnectionGUID: Hy7WFBV+TCuJefYnePd4EQ==
X-CSE-MsgGUID: EgwFxvvbQrSOQhRM8NwjpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="141955515"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2025 18:14:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfrP7-000wM3-2S;
	Thu, 06 Feb 2025 02:14:09 +0000
Date: Thu, 6 Feb 2025 10:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: postmask@32180000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202502061011.pk8Fe4pX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: 64b149becb1a40766689f29c58ac74bc664ff431 [35/35] CHROMIUM: arm64: dts: mt8196: Add PQ path
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250206/202502061011.pk8Fe4pX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061011.pk8Fe4pX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061011.pk8Fe4pX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32000000: 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32020000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32020000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: postmask@32180000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-postmask', 'mediatek,mt8192-disp-postmask'] is too long
   	'mediatek,mt8196-disp-postmask' is not one of ['mediatek,mt8192-disp-postmask']
   	'mediatek,mt8196-disp-postmask' is not one of ['mediatek,mt8186-disp-postmask', 'mediatek,mt8188-disp-postmask']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,postmask.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: postmask@32180000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,postmask.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: postmask@32180000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,postmask.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/postmask@32180000: failed to match any schema with compatible: ['mediatek,mt8196-disp-postmask', 'mediatek,mt8192-disp-postmask']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mdp-rsz@321a0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32240000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: syscon@32400000: 'async', 'mm-hw-ccf-regmap', 'top' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32420000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mutex@32420000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32430000: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
