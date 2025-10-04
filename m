Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4AC1C6B4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Oct 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759564886; cv=none; b=kemw5Y+ZW5v6Itnmo5uvl+HhvFm9tqv+ZM+F1zUsQD5m51k2mSsHoeNEfFGiuWNb9Lw4ftl4eIz3zZuX1NzLiYOQTrTViMdrVwkvQQVRY8hrMu05xY5sGgGKU0+GZlYG1b6Tgf5q3JRjTyBW0f/BZMFxT9Yfu4yZ5IY+mpCSBg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759564886; c=relaxed/simple;
	bh=Pj2M+0PzvorHguVW/2/QGNd1gTr+5Y1C5fIaXKaoIbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fizYkhoykrjIStO1YXXoij7IALgIxJIvO2h8+SIV3ZqHNRgBaHaNYrMd7gNhvozLCrijuQQtyRYI5edmvu5qkanZ+eANztZOhG732JuHdF0uGlnZkaplyWGRwcflxgXmvVRWEzs4AvodUnThf7dtJMNHVKkAsvArGkFU2EIrWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giAiekbN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giAiekbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759564885; x=1791100885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pj2M+0PzvorHguVW/2/QGNd1gTr+5Y1C5fIaXKaoIbE=;
  b=giAiekbNjz2reU42UXm9WbmP3iMnQaKqs2aBqDktYwv9Wv6ODncBGCML
   y/Xjszs62h/OeNA6GEDzOKFGVQOSLYJQOr4vdQU9MWp0xdIuF9EIhztLg
   pEa0XmfUElNzZ72rMSGz7Ky2SYSuXXO3JUF5InBJOVm4ZHRAvH6xEFIzW
   87SGmn7c9vFUiqL+AQ2nn0dtLUbR6GMZXi1dTOzxOsfOIg1N3/5czpMeI
   8N4I3ZvJZDQL75PuYeOikqUcOXuyUdkIuKULGaCqmLSs5mohEOBpot48u
   UYMUBtbnkOlVLvF33vERP8cigX6DoC6nCKU4S63vi10xopEQYtoXeVz6D
   Q==;
X-CSE-ConnectionGUID: 4Jgima/US4CgscLtCkJJLQ==
X-CSE-MsgGUID: 9t7ijSGwTOO4E/88JPU7Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73259140"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="73259140"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 01:01:24 -0700
X-CSE-ConnectionGUID: fa4SidByQBmpWeBlw7EcQw==
X-CSE-MsgGUID: TinRKPooQ0iL0/NC0jzhBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="210144787"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2025 01:01:23 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v4xCi-000000007bx-3geu;
	Sat, 04 Oct 2025 08:01:20 +0000
Date: Sat, 4 Oct 2025 10:00:37 +0200
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 12827/13363]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb:
 /ahb/apb/bus@1e78a000/i2c@400/pwm@53: failed to match any schema with
 compatible: ['maxim,max31785a']
Message-ID: <202510041016.51gNQdjS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47a8d4b89844f5974f634b4189a39d5ccbacd81c
commit: 26e26da13e0aeebc097b1972b77514db98281105 [12827/13363] ARM: dts: aspeed: Add Balcones system
config: arm-randconfig-2052-20251003 (https://download.01.org/0day-ci/archive/20251004/202510041016.51gNQdjS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510041016.51gNQdjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510041016.51gNQdjS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/bus@1e78a000/i2c@400/pwm@53: failed to match any schema with compatible: ['maxim,max31785a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: pressure-sensor@76 (infineon,dps310): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
