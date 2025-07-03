Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD7118B47C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 05:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751520937; cv=none; b=XQFtmOOLTaMzvGSMLS5ssaqVKwtZXXkBzDbAiO9I1VcbqUXZJKpokgBXVcjbf6zbUIt7KU5RbqQfolITlZCFGqXoSLeVQxn3NbeNQlHa4CS6AqCZgiBMDUnkz6WMbLDIrI9tGL6EKH3Krt/egtjsoSF1S+dAJcwq0ucci8A90YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751520937; c=relaxed/simple;
	bh=Lx4US2KbzxV4tW0/ypJhQ+GQeLTVfZ6AiosPU9vkM/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IeYJJ7WG2JIDiUH/bPO+oDZKzbFQijmlXYuJ8r8I614NJjPmtee8wUIps6iXufS1c5hI01VOWxAh37WV/NFMFCQEwabpWIcokmscCIaxAU/6AJGjxRf60wJxUg7shRhp4jsXH1gfTXh40t9zkvWyX4rw1I9bH5o/GbxP1AxhV08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffUw2UIl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffUw2UIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751520935; x=1783056935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lx4US2KbzxV4tW0/ypJhQ+GQeLTVfZ6AiosPU9vkM/c=;
  b=ffUw2UIlvMVhfeyDxPJd85bX6b5i8BDQ1+mo7uCOo40xY1Jt/TBR2jiV
   m7CyE13pJrl7U9RkPIUhf3mM4/kp/L7GK10YA8Zi/7yyyfzN2kwLQoSrA
   d4ZXQ6qPcaZlvZJHADi2+m8jwPSHp3HCpwq/cUzEWa0Gz2XgmT8aLoNVq
   lm89cHeI6JgfpBR1IqQ9kiyi9YKbp/VRlqnCgjU436y+wFe3gPEtjW7WC
   INYeHk9BHdiZx6Q2QBtG+VpnXIwl50nS5PlWPgKXK3JHFsVHfahFFjeuv
   E3zF88v65c3w+Tx3VNrs81GrMRS96I2jmWFwU5jpPaRzinbNeomIifZL0
   w==;
X-CSE-ConnectionGUID: rfBTAYqCR3us1M6r6z4glw==
X-CSE-MsgGUID: 8wzHINj1Td+pdksTH7StKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65180191"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="65180191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 22:35:34 -0700
X-CSE-ConnectionGUID: aEPeUgJ6Sc6FhovreOWR5A==
X-CSE-MsgGUID: rfMwtCMoSQyiXBk1ciAMnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="159969533"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2025 22:35:33 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXCba-0000Pt-3C;
	Thu, 03 Jul 2025 05:35:30 +0000
Date: Thu, 3 Jul 2025 07:34:31 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>
Subject: [linux-next:master 3011/6656]
 arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: clks@80000000
 (cirrus,ep7209-clk): compatible:0: 'cirrus,ep7312-clk' was expected
Message-ID: <202507030753.ZXIq71F0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   50c8770a42faf8b1c7abe93e7c114337f580a97d
commit: add0c5621c83b4f87f9336ebd4baecc347cc6052 [3011/6656] dt-bindings: clock: Convert cirrus,ep7209-clk to DT schema
config: arm-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250703/202507030753.ZXIq71F0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030753.ZXIq71F0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030753.ZXIq71F0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/cirrus/ep7209.dtsi:44.23-49.5: Warning (unique_unit_address_if_enabled): /soc/clks@80000000: duplicate unit-address (also used in node /soc/intc@80000000)
   arch/arm/boot/dts/cirrus/ep7209.dtsi:44.23-49.5: Warning (unique_unit_address_if_enabled): /soc/clks@80000000: duplicate unit-address (also used in node /soc/gpio@80000000)
   arch/arm/boot/dts/cirrus/ep7209.dtsi:51.23-56.5: Warning (unique_unit_address_if_enabled): /soc/intc@80000000: duplicate unit-address (also used in node /soc/gpio@80000000)
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /: failed to match any schema with compatible: ['cirrus,edb7211', 'cirrus,ep7211', 'cirrus,ep7209']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /: failed to match any schema with compatible: ['cirrus,edb7211', 'cirrus,ep7211', 'cirrus,ep7209']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /: failed to match any schema with compatible: ['cirrus,edb7211', 'cirrus,ep7211', 'cirrus,ep7209']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: cpus: #address-cells: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: cpu (arm,arm720t): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: clks@80000000 (cirrus,ep7209-clk): compatible:0: 'cirrus,ep7312-clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/cirrus,ep7209-clk.yaml#
>> arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: clks@80000000 (cirrus,ep7209-clk): compatible: ['cirrus,ep7209-clk'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/cirrus,ep7209-clk.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/gpio@80000000: failed to match any schema with compatible: ['cirrus,ep7209-gpio']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/gpio@80000001: failed to match any schema with compatible: ['cirrus,ep7209-gpio']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/gpio@80000003: failed to match any schema with compatible: ['cirrus,ep7209-gpio']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/gpio@80000083: failed to match any schema with compatible: ['cirrus,ep7209-gpio']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/bus@80000180: failed to match any schema with compatible: ['cirrus,ep7209-bus', 'simple-bus']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: nor@0 (cfi-flash): $nodename:0: 'nor@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/fb@800002c0: failed to match any schema with compatible: ['cirrus,ep7209-fb']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/pwm@80000400: failed to match any schema with compatible: ['cirrus,ep7209-pwm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
