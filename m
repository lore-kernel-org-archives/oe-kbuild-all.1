Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401778C1F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759479947; cv=none; b=lsMt/oh+RhuywxjQK/kwhE68A/uWep6qQ0sPcX5DrpcxA/LpqizaGvTQLzKkXbNIokrOaxUyfn4/uEOVwE1ro2Hju0vQhHgdV46efIDGaDkgW9xNoVB9A5L1DTfqw/apn/d9YrBqmerjpxwZzEOUvpBf1SNuk9fnMJD6x8uQ8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759479947; c=relaxed/simple;
	bh=3/69UMHLJoRnvBk/wvQHZPUiA+H1SKKPVA75gbGdwyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPtGve1AYFag3WeUmcpAsBtVQTCHGArxK+GmaKR1foiqpfKTfnAXRoJ+3wTYbcVoZOAiz/p4MRN2I5vgTgbvsIMT4NAeIFMooOvZ0r1FfAvANMzfxvrjkKbHmo6WaiEcm2lSfda6Fq2Wm2f6jgJtQuk2dWeNBpPEQcQDav/RSjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkB30ULX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkB30ULX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759479945; x=1791015945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/69UMHLJoRnvBk/wvQHZPUiA+H1SKKPVA75gbGdwyM=;
  b=RkB30ULXMuCHBtGvW2RMZE6KD3lalIyYFoRJl763CyfioYmCrRtuRmiJ
   nvaf3tFLB2F6iz0mUFj1oT1pj4rFkWSl3BSOYsxofPIFyXGMn5bk0n/Kv
   9n1nt2Fd+nr6s+M/0cUaLT3IUMlXNYWXPUkfdX3DFutGKfJGKtw5DdQhr
   C31ibN24lM9/Q9xaXzCmj1PWhYQUX+iXp9Hi14IYJbQ4gEeWsWWr3km+j
   mwV0ul5PQ4xOMOns280uDDba9j3QmNouYwzwwu+FOUe4HkoBuL2lnTYPC
   9yrPgyXWKd0bGOTt4f7YYNwB0DXa3oPkVLbzQOyAXbKOVJ4W+WQlbpO3H
   g==;
X-CSE-ConnectionGUID: Ris+tPD5SsSXFuCwYjmWaw==
X-CSE-MsgGUID: souZojhzScCuEi3YNPMj+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61649874"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="61649874"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 01:25:44 -0700
X-CSE-ConnectionGUID: Y7SiVeHCRV+R1Z1qsCmCoQ==
X-CSE-MsgGUID: /9nWdUoSTcC22Kl/OJosMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="216360530"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2025 01:25:44 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4b6j-0004Pf-0U;
	Fri, 03 Oct 2025 08:25:41 +0000
Date: Fri, 3 Oct 2025 16:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 12905/13300]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: pressure-sensor@76
 (infineon,dps310): '#io-channel-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202510031615.GardRYTk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7396732143a22b42bb97710173d598aaf50daa89
commit: 26e26da13e0aeebc097b1972b77514db98281105 [12905/13300] ARM: dts: aspeed: Add Balcones system
config: arm-randconfig-052-20251003 (https://download.01.org/0day-ci/archive/20251003/202510031615.GardRYTk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510031615.GardRYTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510031615.GardRYTk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/bus@1e78a000/i2c@400/pwm@53: failed to match any schema with compatible: ['maxim,max31785a']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: pressure-sensor@76 (infineon,dps310): '#io-channel-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
