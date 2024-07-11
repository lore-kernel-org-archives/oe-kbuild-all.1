Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057E339B1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 06:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720680673; cv=none; b=X7Cw4dl6zirLqlesNXfPPvZ5s+bMXpSqJ2IB9PPOrILRwX2inc94jd5nSmWogJAe4m6tuM/NjdKbt9KtGubiROeRQltK/0SiABw8dDNCbBEgLhGSr8K+25aAUNQklSTFVKMAhPS29+ZTsZThM3QZDdHLHCYzIgs11D+VQR77L1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720680673; c=relaxed/simple;
	bh=Rv3OWXJonP8x//8Hto2s3B7Uo7xTdf/CK14XpcBXeEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHD37nDTuAeTFcKnRx8fKgUbZrhZe1nWM2e7qQbqh9AD6IICsrsv3VfTaS79HIlLeFAMoOp3StRZqChr59uhzS1Kkg3OGt0sJl6v9/I6I6DCieGuV3527psnTiFB0H803FljnT1Yc7KaMYLqvhDXYFgckiVcoWKbDVuGr+sfUUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dT7Z9A1b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dT7Z9A1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720680672; x=1752216672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rv3OWXJonP8x//8Hto2s3B7Uo7xTdf/CK14XpcBXeEU=;
  b=dT7Z9A1bZpZXiUyA6cE/7Jr1ZtVgVfQdfpar46AS30VybhYz3ZtPDFPT
   DZiv8pkG/rGBJCT1MJJ63qud5hwstL/GFAvk+yu5fVOGxTlAV9uQaEnH5
   qltDotdJq+Iuh1sMvnR3yRDmilKczr2avZA1NiLJfjKNyWJMn6hr/kWA6
   dQm8md/AWlrdz0UL3yrme0hP7FssJfYDz127tF/Yk4A9o2/aDx4Z4loGh
   huvbLWQlpb0GrZcpMZy25wzIAQB1M0thenmyucUfYWa9WV9qaX9DhT6ZD
   9lmC7M5bhCrNEagWN5hkkcHcgOKv+L1i3pm0wkgWRSR9h175qeGWmdi95
   w==;
X-CSE-ConnectionGUID: s4Ym2j/gSwaC7YEsvfHP0Q==
X-CSE-MsgGUID: Ox1aQC/fT9q8b8xhr2P+0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="43462490"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="43462490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 23:51:11 -0700
X-CSE-ConnectionGUID: LwCgQ+Y9R+K2ik4Yt80p6g==
X-CSE-MsgGUID: rWueBdoPTfqnFTotKLZteg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="79595707"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jul 2024 23:51:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRne0-000YuW-00;
	Thu, 11 Jul 2024 06:51:08 +0000
Date: Thu, 11 Jul 2024 14:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Renze Nicolai <renze@rnplus.nl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@1:
 aspeed,fan-tach-ch: b'\x01' is not of type 'object', 'integer', 'array',
 'boolean', 'null'
Message-ID: <202407111415.giGVjJLu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9a2f29aefdadc86e450308ff056017a209c755
commit: f373cffbdc46f287dd01bb7c4cfbf0b8c9a52d4e ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
date:   2 months ago
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111415.giGVjJLu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111415.giGVjJLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111415.giGVjJLu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: sgpio@1e780200: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/rtc@1e781000: failed to match any schema with compatible: ['aspeed,ast2500-rtc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/watchdog@1e785000: failed to match any schema with compatible: ['aspeed,ast2500-wdt']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/watchdog@1e785020: failed to match any schema with compatible: ['aspeed,ast2500-wdt']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/watchdog@1e785040: failed to match any schema with compatible: ['aspeed,ast2500-wdt']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2500-pwm-tacho']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@1: aspeed,fan-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@2: aspeed,fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@3: aspeed,fan-tach-ch: b'\x04\x0b' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@4: aspeed,fan-tach-ch: b'\x06\r' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@5: aspeed,fan-tach-ch: b'\x05\x0c' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: lpc@1e789000: lpc-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: lpc@1e789000: reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
