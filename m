Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECAD13C67C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 01:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743469976; cv=none; b=PCEY4D1NtvnQngOSsNCCmYdiT/Oe4AYNljoCFCioNRWXvTW8JRZpdpWDMMdVD5Bxn+eXiOuCfd2jPkkJVDOKmtjaQ4P8Web+N5JpFMveeLwQ8B9LJC1MIJa0p00oUxFUb9mAAuoPBF4c0EnHjaLPge5G43i5WZICqcdjZdK/jTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743469976; c=relaxed/simple;
	bh=A3BWoc2pCsMZSGVwMOBvMcujSOXLH9kTJmwl++N3+hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgQHkuIhclMWQM/fRVwq20CPjzJMkwg8v5/ryBHAGHrsQoGrwqli8Yd+KQAHcZx1wYHbulwz3f4QaToEUUQfPZphtpYFb5iPmGaGUv3pt/gQKIr7Y9nt2RPUdVXy82GiCLZkPj3GZutq+57E8rDxcv7ienq9PU7YhpUmqO7yiMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXPYwoQE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXPYwoQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743469974; x=1775005974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3BWoc2pCsMZSGVwMOBvMcujSOXLH9kTJmwl++N3+hs=;
  b=YXPYwoQEpwISMjZXVfecNTmY1sZ7JHeMPRo/CNB+sG6uUJi9UOS+iKdi
   SVr4HrxHBXGTsqkm/V1L4lCsRvA669Zk0iAEQRH0ow+ObZNwSkzNjno07
   H57KJKq/XkxuQGSnGlCOaMuR8N7CdOC0Gey41Se8xFmtfAy3Cis6bxdTS
   jYZeQ/lZXhoh7qehQ4IuiZ/cssIyIVG6oZD93m6/WT0oYik1WXF00PlFZ
   +e6EdGnHOcTydoX8i8x810v81gsDIeyW9PQMkMQvIL7wfFS9apbPt5kj/
   rYG4ZC6mRLkSX1/jSh9dSDLq9BbfSclkrHh0S+C4KJtZ8K19rHsgmZCYf
   g==;
X-CSE-ConnectionGUID: i7/d1ZBxSuSg+WZ1VaOb3Q==
X-CSE-MsgGUID: aZFUWnnNQvi3BQoHLoTWzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44787891"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="44787891"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:53 -0700
X-CSE-ConnectionGUID: nyA3zeR3S5aBwxZCFbiyXQ==
X-CSE-MsgGUID: HYWwnFIFSRiTn+k7EfiBnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="127046301"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 31 Mar 2025 18:12:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzQBO-0009Y2-0j;
	Tue, 01 Apr 2025 01:12:50 +0000
Date: Tue, 1 Apr 2025 09:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11709/14141]
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff200080:
 failed to match any schema with compatible: ['rockchip,rk3528-qos',
 'syscon']
Message-ID: <202504010949.cVJNWrDW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
commit: cee24bc73d4f3f47344a1a54100a69c72f1db061 [11709/14141] Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible"
config: arm64-randconfig-051-20250331 (https://download.01.org/0day-ci/archive/20250401/202504010949.cVJNWrDW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504010949.cVJNWrDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504010949.cVJNWrDW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:145.6-562.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:495.20-561.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff200000: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff200080: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff200100: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff200200: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff200280: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff200300: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff200380: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff210000: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff210080: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff220000: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff220080: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff240000: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff250000: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff260000: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270000: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270080: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270100: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270200: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270280: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270300: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270380: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270480: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff270500: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280000: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280080: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280100: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280180: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280200: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280280: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280300: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280380: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/qos@ff280400: failed to match any schema with compatible: ['rockchip,rk3528-qos', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/adc@ffae0000: failed to match any schema with compatible: ['rockchip,rk3528-saradc']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: mmc@ffbf0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-dwcmshc', 'rockchip,rk3588-dwcmshc'] is too long
   	'rockchip,rk3576-dwcmshc' was expected
   	'rockchip,rk3528-dwcmshc' is not one of ['rockchip,rk3568-dwcmshc', 'rockchip,rk3588-dwcmshc', 'snps,dwcmshc-sdhci', 'sophgo,cv1800b-dwcmshc', 'sophgo,sg2002-dwcmshc', 'sophgo,sg2042-dwcmshc', 'thead,th1520-dwcmshc']
   	from schema $id: http://devicetree.org/schemas/mmc/snps,dwcmshc-sdhci.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/mmc@ffbf0000: failed to match any schema with compatible: ['rockchip,rk3528-dwcmshc', 'rockchip,rk3588-dwcmshc']
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/pinctrl: failed to match any schema with compatible: ['rockchip,rk3528-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
