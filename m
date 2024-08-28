Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BEE44C68
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724862503; cv=none; b=RtWwCOkBwI1GplBCzNyj2Pasrj53ozr7vmS7mDP8ZNtfRY1mdyCZvHlYsK+gSpAs5VLXvCxZU+DFq+eVPuoC8UpvSI4caBTLcDqLK6Ul8Ivzooe3+RtU5/li0FpksRK5wM4N6dY/UdSWTBLeV3X4cfHosOSl2rpVkPliEvw1brw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724862503; c=relaxed/simple;
	bh=IvfXb+k2SKCV1OFsH1P7qOGDTnwqnqV12/LqHI2jYrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c0PIwbbJEmJSJAjYDuqfNxGfOa8/l4PYQELK8lEUl9cIGcCauk25wedOon6jpSDQFfoQqvCPj9cXGbGcoXgFBfixtCsmwZ7o57xfB/edo508awS+nDwyY9slPXF5N81rY6Nie7mINuG9MJxJezXuLPOMnw018gDRhYdBN80o9T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5KjjK5a; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5KjjK5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724862502; x=1756398502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IvfXb+k2SKCV1OFsH1P7qOGDTnwqnqV12/LqHI2jYrw=;
  b=L5KjjK5aS4fwsxEqlhJBusCPiu2C8w/rKLWHO25jN9rkJkMYPaPBs4yz
   pl78iAMEBX2IsmdOJgODyWTGL8rxBJbdLb2K67DlwOnUknPrvEDNpyblk
   2Axuk+KmCON3DqTmlskpQlalLHIpQJ+42G8Eu2SK0DiyX8dxU/kxWM73w
   ZQzd7GBBj6Ze6HOC0l7ZtRaASMUU2ObttOXBTBjWBQGyd+WIdoEmrdbfK
   WqFVGln9MJmBRm4DqM3g4tY3dHrKlJjZrnwvNN1bbBFgvWeyAnCG9WmET
   OGnNrev/99nYXaxCPVv+bnQVDuvzf3KudZLMgxvr4Cy/UlH2EWKlb7ld5
   Q==;
X-CSE-ConnectionGUID: AcGHxCqSQyOFMFlynr9PQg==
X-CSE-MsgGUID: GtdrM+psR6OPyvlM3YxUYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27173994"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="27173994"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 09:28:21 -0700
X-CSE-ConnectionGUID: KCkuUSdWTKKsBNOKax2/Ng==
X-CSE-MsgGUID: OqfrRgroQMOVhsUPJmw09w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63269889"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Aug 2024 09:28:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjLWr-000L9K-38;
	Wed, 28 Aug 2024 16:28:17 +0000
Date: Thu, 29 Aug 2024 00:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7283/7353]
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'bat-detect-gpio'
 does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202408290043.rBY7kxyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   195a402a75791e6e0d96d9da27ca77671bc656a8
commit: ed51c1e6d8adb0fc6ec023d7473627e03c6b0a2e [7283/7353] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git
config: arm64-randconfig-053-20240828 (https://download.01.org/0day-ci/archive/20240829/202408290043.rBY7kxyc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290043.rBY7kxyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290043.rBY7kxyc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: aon: $nodename:0: 'aon' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0: failed to match any schema with compatible: ['sprd,sc2731']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/led-controller@200: failed to match any schema with compatible: ['sprd,sc2731-bltc']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/rtc@280: failed to match any schema with compatible: ['sprd,sc2731-rtc']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/efuse@380: failed to match any schema with compatible: ['sprd,sc2731-efuse']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'battery-detect-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'sprd,calib-resistance-micro-ohms' is a required property
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'bat-detect-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/hwspinlock@40500000: failed to match any schema with compatible: ['sprd,hwspinlock-r3p0']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/pinctrl@402a0000: failed to match any schema with compatible: ['sprd,sc9860-pinctrl']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: agcp: $nodename:0: 'agcp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: etb@10003000: 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: idle-states: 'cluster_pd', 'core_pd' do not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: battery: 'constant_charge_voltage_max_microvolt', 'internal-resistance-micro-ohms' do not match any of the regexes: '^ocv-capacity-table-[0-9]+$', 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
