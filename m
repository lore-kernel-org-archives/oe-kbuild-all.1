Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8F222617B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835039; cv=none; b=FccNXO1r3EDIGkA+vkZ55PS5fCjK1pwRUMDCQX56VvxkCfD/1cip+ZYE5NJX5tCp5OFrvZXEkiGV1wJm7ygWkSuR2svDx7tiUXqX2H13CHJDX8ij6wzO417CZUERgS8scbKfjjWnuj9QgU0BGGDCRnv9yMG4Sa/x0EoujtkYs+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835039; c=relaxed/simple;
	bh=+jdXCr9defNn5D89+yLFZ1CtKJJMyHayGAOC56IXkA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4dJRB+qTo3WtumqQDgvm3xnFLWiGSwvM1b8l/Wz/7Qn/2HdYGkcqBN+nDOBN4u//2Dwg4DQSjbPc1vimK0jmjDLPkOjBqumlqS0Oe89APy69tC0ayUY8iiMIClNY+VKz03hxASu3JS6WI4AluRcIMVVJo7lI+WklE2mj01ZnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yt/LhvJk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yt/LhvJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738835038; x=1770371038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jdXCr9defNn5D89+yLFZ1CtKJJMyHayGAOC56IXkA0=;
  b=Yt/LhvJkjFCgBy3Tnu7nt1At3rNP6UdpZGf7xuKME9HyczDYS0IDuG10
   HLbPkS37PzFf1C0N5wruM1oTNLut/WFtHzQglUkskx3vD8ejwBnjdt9np
   kOFIGvT5Kdf8fQFwXO6NQ8u9jn9IogoASSCZTFazpz5L8Yoo3VvqALzup
   qD8/MMsYwt7Bwa0ruzywr+XN/JSNTxJ2GCiRnHPvbHL9ZRdiVRoc3h+Eg
   yrIvzn02A0+DdjKj0ExLJRsG5CGdm0zIR4yuwbV1GZk1jvDb28LSPwASe
   tzh4tncMyBbiQBuDB841L0e9GU1ynJNDG4fDYfFfB9PGOckdDYkAkJ4mR
   g==;
X-CSE-ConnectionGUID: epVPUOXqQQKU/gUdiA2nsg==
X-CSE-MsgGUID: /oz37ge2T+K3pnklMx4fcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39545418"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39545418"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:43:57 -0800
X-CSE-ConnectionGUID: dHJqmNg9SmGLgkk5HL5gQw==
X-CSE-MsgGUID: EEsV6HjtQl6SgCZEDIBXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115774647"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2025 01:43:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfyQL-000whb-11;
	Thu, 06 Feb 2025 09:43:53 +0000
Date: Thu, 6 Feb 2025 17:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-ccorr@32090000:
 failed to match any schema with compatible: ['mediatek,mt8196-disp-ccorr']
Message-ID: <202502061744.PIKewLEw-lkp@intel.com>
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
commit: 811d357337456b7e45debb1fab00f437b5ac3673 [35/35] CHROMIUM: arm64: dts: mt8196: Enable PQ device tree node
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250206/202502061744.PIKewLEw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061744.PIKewLEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061744.PIKewLEw-lkp@intel.com/

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
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-ccorr@32090000: failed to match any schema with compatible: ['mediatek,mt8196-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-ccorr@320a0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-ccorr']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-dither@32110000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-dither', 'mediatek,mt8183-disp-dither'] is too long
   	'mediatek,mt8196-disp-dither' is not one of ['mediatek,mt8183-disp-dither']
   	'mediatek,mt8196-disp-dither' is not one of ['mediatek,mt8186-disp-dither', 'mediatek,mt8188-disp-dither', 'mediatek,mt8192-disp-dither', 'mediatek,mt8195-disp-dither']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dither.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-dither@32110000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dither.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dither@32110000: failed to match any schema with compatible: ['mediatek,mt8196-disp-dither', 'mediatek,mt8183-disp-dither']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-gamma@32130000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-gamma', 'mediatek,mt8195-disp-gamma'] is too long
   	'mediatek,mt8196-disp-gamma' is not one of ['mediatek,mt8173-disp-gamma', 'mediatek,mt8183-disp-gamma', 'mediatek,mt8195-disp-gamma']
   	'mediatek,mt8196-disp-gamma' is not one of ['mediatek,mt6795-disp-gamma']
   	'mediatek,mt8196-disp-gamma' is not one of ['mediatek,mt8186-disp-gamma', 'mediatek,mt8188-disp-gamma', 'mediatek,mt8192-disp-gamma', 'mediatek,mt8195-disp-gamma']
   	'mediatek,mt8196-disp-gamma' is not one of ['mediatek,mt8188-disp-gamma']
   	'mediatek,mt8173-disp-gamma' was expected
   	'mediatek,mt8183-disp-gamma' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-gamma@32130000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-gamma@32130000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-gamma@32130000: failed to match any schema with compatible: ['mediatek,mt8196-disp-gamma', 'mediatek,mt8195-disp-gamma']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-tdshp@321e0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-tdshp']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: postmask@32180000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-postmask', 'mediatek,mt8192-disp-postmask'] is too long
   	'mediatek,mt8196-disp-postmask' is not one of ['mediatek,mt8192-disp-postmask']
   	'mediatek,mt8196-disp-postmask' is not one of ['mediatek,mt8186-disp-postmask', 'mediatek,mt8188-disp-postmask']
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,postmask.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: postmask@32180000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,postmask.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: postmask@32180000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
