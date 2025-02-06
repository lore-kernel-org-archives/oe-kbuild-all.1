Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD06239597
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868464; cv=none; b=qZCaoqscfF8jM6CAZO63C3jwHAHl5BtffU8TQ/THYLazcQB+kkYWC+9Xj/82+OTgqf2jc8jZHXFaLLyxW1rOIldnXG79rfX6MY3s88EM45Q4ERr5RiBQsagPsqKpDVwZixcvD2NCcqm0GsjnaOvyDU3mY1dN6zwWLjKj7kN3zvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868464; c=relaxed/simple;
	bh=yq80KneS+HiZkFFGT0L+GfsCTmqXIqc8Yq1BN0S8uo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KaAlBVFM+ejuNUV6S6QoVplWb6eEzYDb0AlaLBnaWQQxw5abRoAWVZDNaGkb7xo7pgqRHUH8bqeLVO0KKHOv3/kepDtlqzJnQsqRQhl8t/x0wqcjGmvvLH55uq0au7d49KPfpbsCF1vDGLTwFfe1TJ0Fn4CVUcwHPJg+XcpzrH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8Sf7a7m; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8Sf7a7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738868463; x=1770404463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yq80KneS+HiZkFFGT0L+GfsCTmqXIqc8Yq1BN0S8uo8=;
  b=h8Sf7a7mfMwyIBVcjSMlYECtliMDTz59/igfuF4Nh3DTI8EVYg0LOg3T
   TX6qYx47zUPIRjOYEzzR5JRYzjOX0RKmshCVtSj4MzgdNwAn8Z0JDJoES
   bpSL+cafXBCPoe/c6+wbQ0vD7b3qFe1pb82ohIaJgj6MRzzR5q0CzYkwT
   TtjNEF9oGE7+4HmPH7lBE5IL8CkjwSpbrlM+unx8L8uxQOJyI2pVQO36X
   4IRgNJkjAgH1vWOR3qvJ/45GM4H+rEmXTiJIRVcyL3lkMJ6SMeCFAE+AM
   vr3r2Js2no4dRh7g2rdDQZn10xZ/5x2SPPxAWtUl5r7Vut74/NqumhvIc
   Q==;
X-CSE-ConnectionGUID: JxY8EzqeTI2Ddlp8RiX/4Q==
X-CSE-MsgGUID: GtlofStDQauXG28k9Hy7hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49738488"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="49738488"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:01:02 -0800
X-CSE-ConnectionGUID: 0Znyhv7dTBem7dIU+e0lfg==
X-CSE-MsgGUID: Qo7SNXHKQzWDgwaBTMjXWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111137735"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2025 11:01:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg77S-000xEL-2f;
	Thu, 06 Feb 2025 19:00:58 +0000
Date: Fri, 7 Feb 2025 03:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /firmware/mtk-svp-heap: failed
 to match any schema with compatible: ['mediatek,secure-heap']
Message-ID: <202502070211.7I2nj2t4-lkp@intel.com>
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
commit: f5e37d37aba390d2da55a97217855369e9f19fb0 [170/170] CHROMIUM: arm64: dts: mediatek: mt8196: Add optee dtsi setting
config: arm64-randconfig-051-20250204 (https://download.01.org/0day-ci/archive/20250207/202502070211.7I2nj2t4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070211.7I2nj2t4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070211.7I2nj2t4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /firmware/mtk-svp-heap: failed to match any schema with compatible: ['mediatek,secure-heap']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/adsp-mem-region@90000000: failed to match any schema with compatible: ['mediatek,adsp-reserved-memory']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
