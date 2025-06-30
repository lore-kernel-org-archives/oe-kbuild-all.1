Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43297247280
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277400; cv=none; b=qYvGhYIxqZLb67oao+Ik8zWYsp9FxQ5lHurUeo6xsOndcfiZf5IztuIxkAaZrMCGe57yHn4O9M/6Jjkr8DOl7WoQ6okWyBQAFl7PmwQf4U7MoWnwAgBlTpB3EnMEghzvBKCJtO6G8ohzydVkHTRvZJU7zH37nBk4GICupmuT+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277400; c=relaxed/simple;
	bh=fhkE2Bp+6mcX4/VW/vyM0PiJUUPPSbKwX9jzJgOolNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FirJuS4WYJWgHqU3uWai/Zjn6uJnVXQZQDUW1HmiM2UFR7DrAzxKtY3baeqsJg1GH4ejc9MTVwWrfAPqSHXnBuH2B5/MSYgx3UV2A7nP5aCqOtF8OWu5SqUc/CALJUe8+rHRxEbGEMSv2EXpyZ8U4Wo5w9w0fvOjmSjnWERdBnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiV8IIsw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiV8IIsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751277398; x=1782813398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhkE2Bp+6mcX4/VW/vyM0PiJUUPPSbKwX9jzJgOolNI=;
  b=PiV8IIswDVG9rEy44pKzKpCIBdAMHfYb6hwU735u7ysNkylxhARwQcez
   XYFnv9J+xQtYWj4aR2ILegDjHhdWCMPPdYbKuUEEG7VFe/cGE+hqT7kbo
   5Y5VK0X/tsep7AgZF53/yZdg0SBmpgXvXcBX4qHAFPdpyRgxrgakUAR4d
   eSmIHTjxn36kIDx24XHwAvR9KstApSXGtgPXEhOkMm1DUFEBv++57aoa9
   othUisAKZHOD1GKoTVI9qw8RG1d3w8vubl2oLpamcbAWQ3r9Zisz/gi/V
   RoeqIoLyBcP2X59N6xwwTzJAfmXa5l2jWETyJb9QfD46NxAotkEJoTTCS
   g==;
X-CSE-ConnectionGUID: Tel5y2uEQqq+aWXwafUYZg==
X-CSE-MsgGUID: 8OLbLyE6Q/+eUPWhlpUwRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64093959"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64093959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:56:38 -0700
X-CSE-ConnectionGUID: uMUNNo4hTeuIJUPvRNd1xQ==
X-CSE-MsgGUID: SHw0d27sTMKfXVyjzNTfwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157958672"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 30 Jun 2025 02:56:37 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWBFZ-0001B9-35;
	Mon, 30 Jun 2025 09:56:33 +0000
Date: Mon, 30 Jun 2025 11:55:55 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 2048/5998]
 arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: usb_phy@2620738
 (ti,keystone-usbphy): '#address-cells', '#size-cells' do not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202506301132.an2PPip7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 222bb02ee691237f1e9393d31226faa35097e9ab [2048/5998] dt-bindings: phy: Convert ti,keystone-usbphy to DT schema
config: arm-randconfig-2053-20250625 (https://download.01.org/0day-ci/archive/20250630/202506301132.an2PPip7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301132.an2PPip7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301132.an2PPip7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/clocks/clkxge@23500c8: failed to match any schema with compatible: ['ti,keystone,psc-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/i2c@2530000: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/i2c@2530400: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/i2c@2530800: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
>> arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: usb_phy@2620738 (ti,keystone-usbphy): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,keystone-usbphy.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: usb@2680000 (ti,keystone-dwc3): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: wdt@22f0080 (ti,keystone-wdt): $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2hk-evm.dtb: nand@0,0 (ti,keystone-nand): #size-cells: 0 was expected
--
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/clocks/clkuart3@2350000: failed to match any schema with compatible: ['ti,keystone,psc-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/i2c@2530000: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/i2c@2530400: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/i2c@2530800: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
>> arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: usb_phy@2620738 (ti,keystone-usbphy): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,keystone-usbphy.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: usb@2680000 (ti,keystone-dwc3): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: wdt@22f0080 (ti,keystone-wdt): $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2l-evm.dtb: nand@0,0 (ti,keystone-nand): #size-cells: 0 was expected
--
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/clocks/clkxge@23500c8: failed to match any schema with compatible: ['ti,keystone,psc-clock']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/i2c@2530000: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/i2c@2530400: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/i2c@2530800: failed to match any schema with compatible: ['ti,davinci-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000400: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000600: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/spi@21000800: failed to match any schema with compatible: ['ti,keystone-spi', 'ti,dm6441-spi']
>> arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: usb_phy@2620738 (ti,keystone-usbphy): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/ti,keystone-usbphy.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: usb@2680000 (ti,keystone-dwc3): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'usb@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: wdt@22f0080 (ti,keystone-wdt): $nodename:0: 'wdt@22f0080' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: /soc@0/aemif@21000a00: failed to match any schema with compatible: ['ti,keystone-aemif', 'ti,davinci-aemif']
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: cs0: 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2e-evm.dtb: nand@0,0 (ti,keystone-nand): #size-cells: 0 was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
