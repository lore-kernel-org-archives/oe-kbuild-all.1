Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5437169
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 05:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720674729; cv=none; b=N3+I8ZhHVLbISJXt3yRzA8hHFtw5Y6JKW6Vu8Dp7vgGLNf9t09pmz5FCBXRionaEz6cxq87HaYfBewvwHaw1dF3iGgjhY5Qahd2yT6SFWwhlAKrsUKP1Ue6SZeTVrq54AZhGpZ6kNzhJFBgbpyrFoKe86LkKCUwu+QEaoD0HrMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720674729; c=relaxed/simple;
	bh=MZd38XxWmIqZrcV1axvi6IGkNY/+kRVgzvxcTNf3Djk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fi3Wfv5Q1zq9x1eutrrcFut5XFNjaBS28WzQwOIZqRkUbDYOv0HthRPoZDkWJ+brGvuAK+ZOPMMu2lwB/J1hQPkFhCHdjrIlVaHKVnYAT2iC1ZyayOFy0DK3/YX/RF3ncg2wJYaa43xY0i56VWttpsXqOA7OEQq37OmiqYAzvvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCuDEfi9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCuDEfi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720674727; x=1752210727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZd38XxWmIqZrcV1axvi6IGkNY/+kRVgzvxcTNf3Djk=;
  b=nCuDEfi9pyeqyCVTpbXl43hEXJD8HFzS82PTdzHjJj/8p+kdryYG/lNq
   TKju+LQYIGCQ4VejxNepontlOHobdlKgvAK26eW9e/C4WrBDOi4Vf/L/M
   UH+mZ+hOx0mEHixksOkdaCuve3lt2WW1CGfaLJmnNkV1ok4aZE5jJTgLH
   aPKAnL84BsJDuG7udLziMkpsaFTP3Kfwh5rwNTvZLqh3EL3x6jAGRof8t
   Xip22dEUudLPOPfq291Q6QgZxoAh9LS1pQa9mPax+iZf2CrkGjuMnaZVJ
   DftHSln5SRsDiLEl/mlxnBwrYhc1596fC+OjdCttZajxbgsD5XZ38+JNg
   Q==;
X-CSE-ConnectionGUID: 67AA/ua2Q9e5K/0Lf/twzw==
X-CSE-MsgGUID: wNi1UrkiRk6nuIn2VVeJog==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17902360"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17902360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 22:12:07 -0700
X-CSE-ConnectionGUID: CHRzAthCRsWkuL64hJVWdQ==
X-CSE-MsgGUID: Hi2X5buFS42TbgssuhErgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="48435324"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jul 2024 22:12:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRm67-000YoE-21;
	Thu, 11 Jul 2024 05:12:03 +0000
Date: Thu, 11 Jul 2024 13:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Zev Weiss <zev@bewilderbeest.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@2:
 aspeed,fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array',
 'boolean', 'null'
Message-ID: <202407111300.gFJMPPU7-lkp@intel.com>
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
commit: dc4a65fdfe635da9d6a76032aa1f729c6a3c0edd ARM: dts: aspeed: Add ASRock SPC621D8HM3 BMC
date:   2 months ago
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111300.gFJMPPU7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111300.gFJMPPU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111300.gFJMPPU7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: sram@1e720000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: sgpio@1e780200: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/rtc@1e781000: failed to match any schema with compatible: ['aspeed,ast2500-rtc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/watchdog@1e785000: failed to match any schema with compatible: ['aspeed,ast2500-wdt']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/watchdog@1e785020: failed to match any schema with compatible: ['aspeed,ast2500-wdt']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/watchdog@1e785040: failed to match any schema with compatible: ['aspeed,ast2500-wdt']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2500-pwm-tacho']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@2: aspeed,fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@3: aspeed,fan-tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@4: aspeed,fan-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: lpc@1e789000: lpc-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: lpc@1e789000: reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
