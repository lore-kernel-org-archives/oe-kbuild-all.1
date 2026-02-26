Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157D34657E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 21:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772140404; cv=none; b=gdkWCTATai3hsHU9uj0zqC5DWjo1VuwA81mCJn/Fh/FjT1DqWyrLU95z/aAvRFY+yyUw2UkW3PzLMZikWtxzE95x7AuzXYRQJpvg5jMKL3He2tV2HejtmZqnhnxA2x57wnP0ABnYzNHmogN5lOX9voOFb701GsJPaRad3MkO30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772140404; c=relaxed/simple;
	bh=pVO1UaNGKuZpgpAbhn2sftQtIA1LcadyrlDK8+U2uHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=McNd5zHWKrLIYN1di9tIfSSACOVJPyBrh9j7A6gHdEljS3/vTDJeme1az2zDMa/NahYZ1oS4qGsVs5owUdRopEixeXGvQGImaYQ+CzvkY4ilZy+ea0XwRkaWbU3e4fKhqOfbb1KgRf/qUU93HyXhHCdwD7smQiG5EIUrGaSzRZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaS+S1Ue; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaS+S1Ue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772140400; x=1803676400;
  h=date:from:to:cc:subject:message-id;
  bh=pVO1UaNGKuZpgpAbhn2sftQtIA1LcadyrlDK8+U2uHg=;
  b=CaS+S1UegGNPhoj3T8ytJwOR7nndDmbiprOpTu5S29cxeay6NuBeJMVq
   2eF3tCGipdgGyiL0X0MuBseBR1Bg8dVKV4DqzAkiPgrgl6Xu3ka3rYTq4
   N4kdfFALV0CO/a+jBoQozvRETH3Yjpb0BzAiZEaEx6Smm2dyCypzh2rU9
   u3+7pgBgAWb14B2vge7UIHOYAPjt1IpTMvX/wHpWHmVGGAfy6IN2I1n6p
   bIs2OB+/71s4DMueL6aWvasBCJfurixSyf0W/jo/SWIK2mciw+9gwwmTa
   OzzxACzNdX5XIEfdCHUVnosuUu2zLwWBUY1Dj0jgo4uIbWP/NnYhUjNfu
   Q==;
X-CSE-ConnectionGUID: xVJFK12qSr6dmBxbpuudwg==
X-CSE-MsgGUID: LHxVgbm5SXq5xEgMkXWYYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73322387"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73322387"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 13:13:19 -0800
X-CSE-ConnectionGUID: cOlMxGXfS9aEsT8hPopmtA==
X-CSE-MsgGUID: RNO0G81iRdKqyCpZhKiI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="219987943"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2026 13:13:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvifc-000000000KD-168t;
	Thu, 26 Feb 2026 21:13:16 +0000
Date: Thu, 26 Feb 2026 22:12:51 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 205/205] htmldocs:
 Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 references a file that doesn't exist:
 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
Message-ID: <202602262209.CTEE5Gmi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35f57154fdf571b6197d177d629776af701f38a7
commit: 70ef2cc4d51e006d23e5d2559f395e1c1e4e7dbc [205/205] UPSTREAM: dt-bindings: memory: mediatek: Convert SMI to DT schema
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260226/202602262209.CTEE5Gmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262209.CTEE5Gmi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-vcodec.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
--
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-vcodec.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
