Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2932ED48
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772147125; cv=none; b=FeWfRYwM75MIBN2rXRapqeKaQ50HkVEQYNkYq01gjvALPQYRfWrpWdsaNtYT/JUSHCTUibfdztfMThkec+F96fc6lnJpFed0o6eq2dfr4+z4YBU+hRO+0QxuvwmrbzCItBiXeH1pkK4OV1St+CV2SPVhUWykHqfR7IXPSrkPtz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772147125; c=relaxed/simple;
	bh=+eSvMsPMZGKAGYS38hOe8oI3aCu4m5wtGlAzf7ho7oE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VxHx/KEU5VEBum8dPC0LlPCxKi2vNbI8vmRGfwW9vUMWPPnjcQUwl5q+xZA6ZJJF8eoDjO5Rs5lIP1xfhP+lzePDSZtk2rv4UTJPmUsY6BQdP89uCnN/caTROKmctTgCFKBv8xs4bojVv5envfKxZfJEQVp+cNwMCrVlHR0+XvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7JxonJw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7JxonJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772147122; x=1803683122;
  h=date:from:to:cc:subject:message-id;
  bh=+eSvMsPMZGKAGYS38hOe8oI3aCu4m5wtGlAzf7ho7oE=;
  b=J7JxonJwDip+8uo21OpJF4/vX4rs+qS19OMh0muOKt7zvBkVBcR/IzYL
   ZuWGqfujlUauKQOOPP09bZ8OmZR88h5tRyOuH0bp2OxCHrUAfYTP5o9Cy
   mf315hNJRZWpTtysexITRfpKB9VJJMNfw3VnK1GViavVMAb4u8INuANkG
   dFVqQGCVTNK97pBGpSMcrHP0Z3w124+KPvB6WJpr45d1ldcpsZ8TaiXij
   bqIhgNFhUSLUOwQnhGVmOYf8BZ6o2vz4KZZvYWWxUU3P9BlwbBrw/7Yrb
   4uZsgp8hREEL3r/VDAiwXxwpBku5BEKoe67KOSfqO3GZCi5BBq7+LilHM
   w==;
X-CSE-ConnectionGUID: /M6ssAfqQkyv33cxw2o5pA==
X-CSE-MsgGUID: 3HfYDcrgSjeIDSanc2hWsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77060071"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="77060071"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 15:05:22 -0800
X-CSE-ConnectionGUID: rm5I9rmYS8+BY1J4G8Dg7Q==
X-CSE-MsgGUID: BSN5UjfpS4OoOWu5iDnJIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="215395918"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2026 15:05:21 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvkQ2-000000000NZ-3jhE;
	Thu, 26 Feb 2026 23:05:18 +0000
Date: Fri, 27 Feb 2026 00:04:48 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 205/205] htmldocs:
 Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
Message-ID: <202602262336.ups5UQRr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35f57154fdf571b6197d177d629776af701f38a7
commit: b36b813e39266e9e6419d7c55f63c8f226b2b8ec [205/205] UPSTREAM: dt-bindings: usb: Convert DWC USB3 bindings to DT schema
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260226/202602262336.ups5UQRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262336.ups5UQRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
>> Warning: Documentation/devicetree/bindings/usb/exynos-usb.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
>> Warning: Documentation/devicetree/bindings/usb/omap-usb.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
>> Warning: Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/filesystems/incfs.rst references a file that doesn't exist: Documentation/ABI/testing/sys-fs-incfs
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
--
   Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
>> Warning: Documentation/devicetree/bindings/usb/exynos-usb.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
>> Warning: Documentation/devicetree/bindings/usb/omap-usb.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
>> Warning: Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/usb/dwc3.txt
   Warning: Documentation/filesystems/incfs.rst references a file that doesn't exist: Documentation/ABI/testing/sys-fs-incfs
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
