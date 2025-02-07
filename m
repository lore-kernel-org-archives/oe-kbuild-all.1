Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79D71A23A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922206; cv=none; b=XBJ5pYfuUH8poIT9ycBKEhjDYOoj1nQOHvMOTeu8UKdqKidrqEEurWOE75a607MZVkKnc5/uweZiJcfCyepSoU/aLXx44ebIYU+4+WFsDeeD/YqQBOjSCQPaYurqv/5GGeuS45VKHrVJjUesp6Wq71aHZPDax4grpzNI5tFPtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922206; c=relaxed/simple;
	bh=XbxleZdZX9oWvVDzxEokM+y/Zo5R0au4dLVXdpzNIFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aA6xQ2gBG2Vgw7bKRUVyA+hjZaYHw9RJNzMapQ/2uOkvD8/EzoFdk6LopxLEC5aEOsDGbP7tvV523Zx2t4ErAMwHP/QRh2FIs0rguo22az9PT3/zLExT3rjGozH9BB9JEt5LQv3CCmkqtmrz4yh5rhjh/+rlsYXGVuFpDvN4gOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIRCIk43; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIRCIk43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738922205; x=1770458205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XbxleZdZX9oWvVDzxEokM+y/Zo5R0au4dLVXdpzNIFA=;
  b=JIRCIk434tvzC7mKbdWqx04uqXkMblmfOSz1ueMjjl0UCN7gnXPIX1Kn
   GeH+gfls50fiB9dgJxt/yNBtKVbQOjsN2Px1yXJBKApuOWRoH7DTR/cdF
   fKg0eHI4zYdVfjTBPxFiatyeN5x91hTwfUNmP3/P1Uy1GJHW0FFLpeXzW
   zFiAoylW7lZ/qwLSWfJ3IHa+2MWYLJwP44zTXABBv0/TJ/O6Ws6N71nAK
   PH4v/Ors5/yPWiQutk2rdnRzp5rPh0qzOpgWnx6usSSg7LJEfGNxwqYu0
   4nkilQ+omaifdIvmKoQhW9U7Bj4jlojsJrxMq+F1Bpc5Qkz/j2N6TtYV1
   A==;
X-CSE-ConnectionGUID: lONiCs8oSX6oBNm7lqlabg==
X-CSE-MsgGUID: G/LplOOVTcaHPoHFCkxWMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43220253"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="43220253"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:56:45 -0800
X-CSE-ConnectionGUID: ghkCGldkTHiX7Y9Hvp+Ekw==
X-CSE-MsgGUID: bQMFdom9T4ecN00PxZabFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116683653"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Feb 2025 01:56:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgL6G-000y87-34;
	Fri, 07 Feb 2025 09:56:40 +0000
Date: Fri, 7 Feb 2025 17:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/therm-intf@114000: failed
 to match any schema with compatible: ['mediatek,therm_intf']
Message-ID: <202502071749.eBEUFnjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: f8c8dc82e45e6ef754b2cc3798fae23aff615ccc [204/204] CHROMIUM: arm64: dts: mt8196: add therm_intf node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250207/202502071749.eBEUFnjU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071749.eBEUFnjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071749.eBEUFnjU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu-qos@13f800: failed to match any schema with compatible: ['mediatek,gpu-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
