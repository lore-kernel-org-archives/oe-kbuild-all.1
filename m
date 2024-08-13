Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53561A08C6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723565556; cv=none; b=dANZnCpJ7mB815Omj5CvN2OaD2pVNzEz2oUfpp0ZOOxh7Z/BZ+5wScBKAXFhB+uruIogud/GPs4TZsSbcXu1oRI5VPSQA0aL1Wu6hXBHIs15UvkiMj6Q+afD80lVFN+YKY8LsEHBw35lAikAgFq/0vJvqSFOo98LYWhoLwLjoEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723565556; c=relaxed/simple;
	bh=zuEi311CrczSkE4r0bZ7uHEwZdtifb7eCsOc3td8/m0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDkJ7BQkqZiI30q+wX4OiXOWhDjC2Tt4ip7RAhtmedeIRadN3j9riVJ0E/iUDZxLRSZPqKbD4e7aCmGvJAOrhGIUh7tR4JvoWMcTPgRGqJVc70SDe+OwBoBGEZVBsq9G2IQ7XoWhgRT/xT9T25tzA3VBsouXc9KfNxyDLu2h0BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyvePVL0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyvePVL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723565553; x=1755101553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zuEi311CrczSkE4r0bZ7uHEwZdtifb7eCsOc3td8/m0=;
  b=TyvePVL0V2yOaNCqnKyaJj1vxHBBa/sUAnzG+zdt+5oEQRAZF1p89TZX
   99RVfHwgqjulkL/tWO0s6kWSAfM5MPS5UBm7bOXh9chzhjeYY2Du8S3vT
   JshbM/8zzjTUXUaxlFe/KPDb1L71mHsnVRbalgF0eqNtWp++c6/qOFswF
   1NI+yDpEcKJrMtx023Qyb4ZytYuFZSOz6tclYLnVZd1fK8P412qtIi/iH
   pgBbzPgSf724ckpKF38j7Lk6enGKJEi65eEXuXVP0MZtq0UTDe5Khl3PK
   I2/AME2GdxKq7XYlIjegV+IVPNnQfL38i1bC7a9RMj5cvayrNLOC2Dwk/
   A==;
X-CSE-ConnectionGUID: 9iP+ySADSoqF73B0vFCmng==
X-CSE-MsgGUID: zi0fKsT3SZWyOnXqgVpftQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="12988044"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="12988044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 09:12:33 -0700
X-CSE-ConnectionGUID: s+dExvgDQe+mGBnbf6FmJA==
X-CSE-MsgGUID: hL2XZd3+T0KuXqKSIhZE5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="63646209"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Aug 2024 09:12:31 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdu8K-0000ZW-2J;
	Tue, 13 Aug 2024 16:12:28 +0000
Date: Wed, 14 Aug 2024 00:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [linux-next:master 3898/4224]
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00:
 'battery-detect-gpios' is a required property
Message-ID: <202408140049.pjQHYO6B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   033a4691702cdca3a613256b0623b8eeacb4985e
commit: 0dcc203956537696e6f936eef886fde70e049f54 [3898/4224] arm64: dts: sprd: rename SDHCI and fuel gauge nodes to match bindings
config: arm64-randconfig-053-20240813 (https://download.01.org/0day-ci/archive/20240814/202408140049.pjQHYO6B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140049.pjQHYO6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140049.pjQHYO6B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-apb@70000000: $nodename:0: 'ap-apb@70000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-ahb: $nodename:0: 'ap-ahb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: aon: $nodename:0: 'aon' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0: failed to match any schema with compatible: ['sprd,sc2731']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/led-controller@200: failed to match any schema with compatible: ['sprd,sc2731-bltc']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/rtc@280: failed to match any schema with compatible: ['sprd,sc2731-rtc']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/efuse@380: failed to match any schema with compatible: ['sprd,sc2731-efuse']
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'battery-detect-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'sprd,calib-resistance-micro-ohms' is a required property
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'bat-detect-gpio', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
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
