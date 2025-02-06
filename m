Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE591A3056
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869185; cv=none; b=A/WBbUPEg5QJSvmeE7ILhjCKguh4e6+9qxMdupOjHO2ZRQgv0vuiyBXM+dAH5j+1DFJxc2RQoG5MWvBKMOhHvZJ1yt3w9gohOE8PGaZIrdtkWV69ajvYloQCk0X237FPId69SkQp4R6ITaVPZu1tlBJlXpHI/fFoAmtie7ai3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869185; c=relaxed/simple;
	bh=XDdfhyle8WXlRNyPUCRu0L7q7ZLxiuSNoaka1FCwSf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oVhKk5w9tjXJfJ+OMwO12uMpymyFC63kdMA/vjAwwrRjnK05KI+1JpQZNWIBI41wbgKy3Zgi8Sw08qD+99pXog2nNYvAlx8NoyWiGW8Q2RZYnB33pP7wLlefyFwymCRg9AOG86DzcGFoFUUIZXKJ3RqYlpdnttc6O88Xek2e75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDyrkZ2a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDyrkZ2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738869184; x=1770405184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDdfhyle8WXlRNyPUCRu0L7q7ZLxiuSNoaka1FCwSf4=;
  b=mDyrkZ2a4khx+WtTet/kb2y/cCCBtH++dJN6PeVbPy6MTBkcpTELEUg+
   Bf8CJ4NHT/2jq+Yph5EDyImTcYKUMC8aJLoDDpDaRVwgXg+cm8temZYSw
   DgHu9MRdEEh76jMYgmL5vrZgzKl/LJX75rJgkZrfaN3LlixMcswEHkrWb
   lKNOwaqn8+UDSmpjcgyyDR/7EZXG1nrBQrbmCICKvALk7OwFA0mCsGvx2
   X86dCy1of5fxFPRH1+ObbQ9E9ikiUwz4t3YDSI0ufqJfdTseSWcHj7UtT
   syuO9DaGN9B1uALFyRo8O7ykCw8aGVHZJTJ67keSKjbiqIQ+HurYwjpAK
   w==;
X-CSE-ConnectionGUID: T69kFxTaQMu+a79aaUAWew==
X-CSE-MsgGUID: CK51qM0fSoiaQX7Mwbca/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39397222"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39397222"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:13:03 -0800
X-CSE-ConnectionGUID: b4e47NGRStWff6T0hd837g==
X-CSE-MsgGUID: vNu/aBGIQu+NNv4cytrsxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111501121"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2025 11:13:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg7J6-000xEv-0t;
	Thu, 06 Feb 2025 19:13:00 +0000
Date: Fri, 7 Feb 2025 03:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/fdvfs@c220400: failed to
 match any schema with compatible: ['mediatek,fdvfs']
Message-ID: <202502070329.rVf0LPCG-lkp@intel.com>
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
commit: 89dcc6e10841258aa5eab119acfad06515ac74c0 [204/204] CHROMIUM: arm64: dts: mt8196: add cpuhvfs & fdvfs node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250207/202502070329.rVf0LPCG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070329.rVf0LPCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070329.rVf0LPCG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/fdvfs@c220400: failed to match any schema with compatible: ['mediatek,fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mcupm@c240000: failed to match any schema with compatible: ['mediatek,mt8196-mcupm']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/performance-controller@c2c0f20: failed to match any schema with compatible: ['mediatek,cpufreq-hw-v1']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/cpuhvfs@c2c2310: failed to match any schema with compatible: ['mediatek,cpufreq-hybrid']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8196-cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8196-cksys-gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/pinctrl@1002d000: failed to match any schema with compatible: ['mediatek,mt8196-pinctrl']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@102f3000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@10613000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
