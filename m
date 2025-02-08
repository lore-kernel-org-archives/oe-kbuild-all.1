Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E592286A1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 01:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738978604; cv=none; b=q6FyKpMmYsKf8JBW/XoAIF+rySMFCFBOyzOa2KABHcvDgrEm8zN800JEXHyu9cd7Fi1PTQ++WCbIQMt6nEKoERGJAQNrLErCWBPmbfx18Qd9eLC8GYscFlCqVc/qjG68iIAY/mRpnx2sY0ChaWj5XM3aIaUPRMjxy3iXEh10kWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738978604; c=relaxed/simple;
	bh=5EGu5u1f0ydDutC5y/1wybZU7GDAKmN5PAhBrwnUFfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOoXY7I33/vTy1evCO0lUgAO7HMbcQ9URQhxCZqlsglN/d1C838cRJB1F/NDs8OUPNobGaXY4+Q9cGLdFIpJzTOArzqx/F9M7y4qUYjNkJFuNwyh5QXlgN4l8UC3JFBB/4xGJzv9sl7nsxmELvliFkfOOiVG1Vc1vjfJ0i+nbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3exBdc2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3exBdc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738978602; x=1770514602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5EGu5u1f0ydDutC5y/1wybZU7GDAKmN5PAhBrwnUFfk=;
  b=I3exBdc2OFzGzS+FGYxz1f8jgAbRlklNQ9P5q5YWV1ID3mPL8kk4l6UB
   5itqCL6aih4nHKhzEZVarqUQNy7MKyZLn3BjSw5Z0QBTnBvPG/GYGOlfW
   NDxxZ3E/mxSWZ+qeGmyZ3DiCZ+lc+hL0ec3BEt7eJHCAp+P8Z0F9o+jJF
   xPRvzy3dzQvg2xSzqijPaHBWniS1+LyAB8KFCsTAUcF4g5avqe4bc+ofr
   4afxHGFxkCgf9hMTztWp5TmQ0hebcnbNpZ80WXpPjRaOS0AuAVQ6D7uad
   +Hj/B8RF5lluJkJP6m17A3Jsv+wxlgrVjuaKcDJTQ1LH/SRXM+heoI1Ve
   w==;
X-CSE-ConnectionGUID: IleDU5lqRZqpCUv99+JG7Q==
X-CSE-MsgGUID: uBkpa0otQXymGCJ5DC2vUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39502509"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39502509"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 17:36:41 -0800
X-CSE-ConnectionGUID: v70rjiL0R8mSZoLEGfxQDQ==
X-CSE-MsgGUID: t5jU+nn1SB26Iw+KGQwLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="111508027"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Feb 2025 17:36:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgZlu-000zMU-1O;
	Sat, 08 Feb 2025 01:36:38 +0000
Date: Sat, 8 Feb 2025 09:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder: failed to
 match any schema with compatible: ['mediatek,mt8196-jpgdec']
Message-ID: <202502080908.cQvYQqeF-lkp@intel.com>
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
commit: e818ec0bd11a22b46209da46ccd1a11941177a90 [211/211] CHROMIUM: arm64: dts: mt8196: add jpegdec and jpegenc nodes
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/archive/20250208/202502080908.cQvYQqeF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080908.cQvYQqeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080908.cQvYQqeF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/ghpm@4b800000: failed to match any schema with compatible: ['mediatek,ghpm']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b890000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b8b0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder/jpeg-decoder@38040000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-decoder/jpeg-decoder@38840000: failed to match any schema with compatible: ['mediatek,mt8196-jpgdec-hw']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder/jpeg-encoder@38030000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/jpeg-encoder/jpeg-encoder@38830000: failed to match any schema with compatible: ['mediatek,mt8196-jpgenc-hw']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-mt6681-sound']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
