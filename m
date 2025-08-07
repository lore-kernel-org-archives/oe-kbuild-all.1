Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE91DD9D3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 08:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754557103; cv=none; b=oAjt7IlpiDNooBY4dy+H5sbh7LQLZJRpK/XBnfONZ5VuJbc14VIM3NKjLRYPCoNtnKoWAGPqFGB83KtFM1SXftSN5/yBs1x5NPJz1U8qScraDyiaxrMl1/MiPylIgBdASGlHTAqM5hCOjaPU1uDOgbJ10AlsFNQBv7XhiZ60Y3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754557103; c=relaxed/simple;
	bh=clRiqpkEuhaaJuOMQrWZ+AE9QGbM8IoV3tSa+5JRCRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVrCl6ArQAckNJ8Fp8y3XarEPXSuuJEpVPVTomxDQ4wtnznwPlNCLRDrZIlPJr/qZ5ewa1J2mQTrr9ZwVw8uiox9LfHafaBFLWdWEuoZ+u6EKXLVt/KTOThmBTGzp9oof7dm4iBq+8l+6r2KX95FiDzS1W/IyXT/QohW4MOqaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a23IWToS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a23IWToS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754557102; x=1786093102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=clRiqpkEuhaaJuOMQrWZ+AE9QGbM8IoV3tSa+5JRCRI=;
  b=a23IWToSMcdyXcF6oeMlfvgqcwi7/4DqwOurWlQ0BJQvnyH9eLjvBAyV
   vXecfiZa0VtyZjtiHNz4e10qDJJeQyn6P1Tiu9/K82GN/vB9UCGUFVsTp
   1SS1XmjHVesq8dT83OAmv+0bODQ6xutmdcuq9a7LiN1fK2lB7vLrY7ayL
   YR+jPxYqlgRgPzbN96/F+s9qiLBH8mcYMWmDXOntRZQdCQPMAKiprWgeK
   C4MuGLQrK5j2WCdiZWyeohroD2Ny5iMr/RK3tDkMNjy2fQxGRdT3luTIu
   Vq3z218bLAeMeyhn16rFiAKeNyYpDDr6imttC3cokVlq+D163LWxppG7q
   w==;
X-CSE-ConnectionGUID: LHMe03woRvOMEP6cXx4Vmg==
X-CSE-MsgGUID: AmREzcDER6yT3huLVar1sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68262010"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68262010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 01:57:52 -0700
X-CSE-ConnectionGUID: QLp8X1R0TSGyPZ/nGDI6lg==
X-CSE-MsgGUID: jxlRRs/cRGGL/vV1SjY+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165807882"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 01:57:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujwRQ-0002bC-0E;
	Thu, 07 Aug 2025 08:57:40 +0000
Date: Thu, 7 Aug 2025 16:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425):
 Unevaluated properties are not allowed ('local-mac-address' was unexpected)
Message-ID: <202508071621.KlWlMETU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   886d2f37b79982531259490548bc83b9216ca685
commit: 896e0d9337b5d21101a399efe927841753d47f39 [1/1] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250807/202508071621.KlWlMETU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071621.KlWlMETU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071621.KlWlMETU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
