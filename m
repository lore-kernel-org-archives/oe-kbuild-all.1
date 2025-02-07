Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95E712E1CD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945173; cv=none; b=g6SImOJQbVjVV3bWNS3xDPUsfXzjD6NlVpmNWnqqG6ccfp755Shs4Hav2fmSNXJJ4Wy7SnTycI7o7t7fNHoq0ewbSX/hckRcFuSVPlmzudmjiRgdMT1bRQZZH5YDvxmef7WLU8J8NFaZf91h2W+Fdmjo3M8JUl6rT9f/v1dTpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945173; c=relaxed/simple;
	bh=xH0Igg3pkLU3XM47chgqUJCsnPJTkGVxN85f9SNRdck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLiW4PWlMqdaFdDzTnTf2f5ZTnrCW4COxnnYYRxIvYjz+etgpY6gfxjMT+KFIK8YlBHuHSaCjdwQBtBRAlz4kFPgH2ORxB8R/exjI5BYEC6jXspYKvjLV3GkelvG6M7XE3vq66Vap000qlvbMAY4tYSdL8iSmLXL56ciEs2wpI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJ1w58jy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJ1w58jy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738945170; x=1770481170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xH0Igg3pkLU3XM47chgqUJCsnPJTkGVxN85f9SNRdck=;
  b=VJ1w58jyeAvO/PrF0PjiUbuUA0IInn43AsckXXF+e2ZWzAztM/K7WxT0
   yVOLJDQp/rrQXXla+wPh3qHm+DN5zI6L62TTq2u8CIZ8+NHiFT72xWNtr
   n8NlhTrjsJq6acj4gLUOIRsyfo4ZDpL6wNFU67cxYGE4ovz3QkvQ2xAW9
   NcHpKW7FMY5At93w311b0HElX3LRDc89EzYFAxZpxuEOyhFULsDHFhJS+
   qCoX5e4bErGljqRch+qAxJrHCy9WifCV6Q/2lhcFDkfpjrwkQYbcRns+Y
   4+S8W7AfBvRymYeu6D0a8hLrY1tKRdkOnPHFDP6zIdgT3c6ubgEj1JD8+
   Q==;
X-CSE-ConnectionGUID: zwBKYg8uRamNMyySkpz/jQ==
X-CSE-MsgGUID: YXnfXpnFRLqaJeNQuEyvpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="49833073"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="49833073"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:19:28 -0800
X-CSE-ConnectionGUID: 564zWVsAQ9iskpWtXBXK+A==
X-CSE-MsgGUID: raildP85TB6oo1ryNWxN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111344119"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2025 08:19:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgR4f-000yab-1q;
	Fri, 07 Feb 2025 16:19:25 +0000
Date: Sat, 8 Feb 2025 00:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb:
 /soc/memory-controller@10236000: failed to match any schema with compatible:
 ['mediatek,mt8196-dramc']
Message-ID: <202502080034.lhMfVbhc-lkp@intel.com>
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
commit: 2905358ad1479d24cb988c6cad8be353488b2b6d [204/204] CHROMIUM: arm64: dts: mt8196: Add memory-controller node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250208/202502080034.lhMfVbhc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080034.lhMfVbhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080034.lhMfVbhc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/performance-controller@c2c0f20: failed to match any schema with compatible: ['mediatek,cpufreq-hw-v1']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/cpuhvfs@c2c2310: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8196-cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8196-cksys-gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/pinctrl@1002d000: failed to match any schema with compatible: ['mediatek,mt8196-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/memory-controller@10236000: failed to match any schema with compatible: ['mediatek,mt8196-dramc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@102f3000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@10613000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@10693000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@120a0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
