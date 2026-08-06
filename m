Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5133EDE52
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010747; cv=none; b=goXfamQuQAVJXmHACpHjHa3U+sez1xyVx9hWgAlyEI+3aTMVuGgLPZggYkyZ5/xN9TJ1svxC+uMXrb0m8YrMq448j/MLYP+2QEbnuFDoGzjcFKNmJ7fD1f0E8jXC+wwopIx9cdvuNvkwgMV5s1ovywn36Z+7BKDYRPv/CIz++I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010747; c=relaxed/simple;
	bh=jH7PHvpK/yVJpe3+X4GOu5YKdrExwGbJakij9nCK6dE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SkBgDxg7Id4FX83rb8+Z10CHmm+KpFTYMmBOujlWNoknA7/fmt/D45FuzqHRNYctH8NePv/PK0MERx/qLMrH1HLtjZVq1NCzclzc8EAfL9zRD5n6DlnoDGwc4fdKOd81T2Uz28+oljPdMqyZxqJtwrCRy20ezEOo62dTuO75FfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGGS7VrE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGGS7VrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786010745; x=1817546745;
  h=date:from:to:cc:subject:message-id;
  bh=jH7PHvpK/yVJpe3+X4GOu5YKdrExwGbJakij9nCK6dE=;
  b=nGGS7VrE7o/glQvUK1qASGf+7IVMyEj/CXVRyfwc80ftGRZ26zUvMa0R
   b+NAoRRnbCXKCjKCm8xTtnZMVL1UR3US8FrL8RZP1mVOvKX0l7cFDtJ29
   yvUqBw2ztZjibOGnhRP/JSI1zrSF3I7yfeyeFjgMO3O1cmxj24LK6YDwF
   4xBc2jQYeJCfGqWO//Y+TxP/lVVh5nU9bFX8tNmXgR8Dc8BCw2I1ZHVt4
   f1Braq7xxmj4D5Zmae6zXsbWhJub/J3VaAKBd5pc0ZNdcBFHHePqGCZy5
   KgjBEvXgM52Z4zgUq/kCQJLDVVJ5QzLHvFgFF+UvHKyIIkilA1BBgm93p
   g==;
X-CSE-ConnectionGUID: LCPJBvk2SzuW1mNRPxivqQ==
X-CSE-MsgGUID: U8IStxvZSs+rnbTRDNTPEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="74135077"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74135077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:05:45 -0700
X-CSE-ConnectionGUID: IMc33UnfT3aC96bO6Whq0g==
X-CSE-MsgGUID: D0XT0F3HRc6h53xgPnT63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285440423"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2026 03:05:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wruyr-000000004c2-12mp;
	Thu, 06 Aug 2026 10:05:41 +0000
Date: Thu, 06 Aug 2026 12:04:42 +0200
From: kernel test robot <lkp@intel.com>
To: xiane <sangch.go@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.2.y 27/58]
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: i2c@feca0000
 (rockchip,rk3588-i2c): Unevaluated properties are not allowed ('touchscreen'
 was unexpected)
Message-ID: <202608061256.8kZHiHqS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   d2521cc718fa5ae45bdc48f40517b76d2753a185
commit: a25e7aae62aa3723c9c3ffb7bdf91e88888ae8cc [27/58] ODROID-M2: arm64/dtbs: add mipi-dsi stuffs
config: arm64-randconfig-2054-20260803 (https://download.01.org/0day-ci/archive/20260806/202608061256.8kZHiHqS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061256.8kZHiHqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061256.8kZHiHqS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts:304.11-308.6: Warning (unit_address_vs_reg): /dsi@fde20000/panel@0/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts:566.27-582.4: Warning (i2c_bus_reg): /i2c@feca0000/touchscreen: missing or empty reg property
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: i2c@feca0000 (rockchip,rk3588-i2c): Unevaluated properties are not allowed ('touchscreen' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-rk3x.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: lcd: lcd-rst-gpio: {'rockchip,pins': [[1, 8, 0, 299]], 'phandle': 141} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: touch: touch-gpio: {'rockchip,pins': [[1, 3, 0, 299], [1, 4, 0, 299]], 'phandle': 273} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
