Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD16F18C31
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 02:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743215199; cv=none; b=Qqawib7GdhpWkvryH51rD1b8kqfkzVk3IJEjT5RFNM3bWzqnaHMBnOd/sjdnD0lnSpWpkHzV0/xdZmSn319SUb7fK1OLRAWlw42quoNP642+IBKjapewkzSb+zkuM6/jSrfVOX5m5Q5DljCa/59sT3cnny+OCzzmxseYG+L+VIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743215199; c=relaxed/simple;
	bh=erAHbChAlk0WcEokI0g8gnPhlUqHaLpFgIGftL+kKRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FpvHjunC1Pg3ZeI0UrNDZPm6FsDsoXmrOzxc9U8tdSfeA6vJX/uMFEw7LRmFt3MAw41gZyCZ3KPDNlV4XgXh3FBQMeNJjQDvQTanHB9gxNJUca55Jf8hnicBwczmMnKtQuMPs2Tj2lKkf1fNQm8TBcTRjQnn2Bw24P+J6mi8dDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRkHFqaf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRkHFqaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743215198; x=1774751198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erAHbChAlk0WcEokI0g8gnPhlUqHaLpFgIGftL+kKRE=;
  b=VRkHFqafedBhtcNK78doUO/qE4wBgD87fn/n27Y7bSZrIS0qWHuQ1E4F
   0P6Mz2/6WOpAXunhdEg4uhWDHNvXz7f+GcRWnJTro5Qsbv4GrW/itFL2k
   tpNISz3qytg/ETjl+GIyvHO1Bl80mYlLHp3dPJ3D1cZ+8fEskymrKRIS9
   cz4E074BuM9raFMAlxOKcIUzscQ7RMv+R47fC1kaXZcQrBGKNFSazfBT2
   EBZHtkO5NSd4xzeYbmpC04Mwpzbsyv8FNZCqRLPev8ug00zzAQijOI4oY
   e4sLAHPTQ9LZVY8Nuh/pYnY5I/Fr77h2JzM8G3qPmjYLfOyF1jkPD1Bmg
   w==;
X-CSE-ConnectionGUID: X2TV/zl+RxGWazH+DBj+5A==
X-CSE-MsgGUID: EUuE9y7/T/icqZnPoxBhRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44304688"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="44304688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 19:26:38 -0700
X-CSE-ConnectionGUID: jHwaWnPrSVmie5ZBx8hRyA==
X-CSE-MsgGUID: K/fX7icUQB+wpdZZtufV4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="125426171"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2025 19:26:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyLu5-0007qq-26;
	Sat, 29 Mar 2025 02:26:33 +0000
Date: Sat, 29 Mar 2025 10:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-rsslro2 25/58]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb:
 /soc/topmisc@11d10000: failed to match any schema with compatible:
 ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
Message-ID: <202503291005.Pl2NwAKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-rsslro2
head:   9b73048865d89da6f43aff7b0b3b5ed838ce3160
commit: 36c1597276fe132da4ca665c9a242ee1fa9474ed [25/58] arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
config: arm64-randconfig-051-20250326 (https://download.01.org/0day-ci/archive/20250329/202503291005.Pl2NwAKI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291005.Pl2NwAKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291005.Pl2NwAKI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:533.24-554.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:566.19-588.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:533.24-554.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:566.19-588.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
