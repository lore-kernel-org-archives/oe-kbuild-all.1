Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D82522F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748789225; cv=none; b=czDAwz92aacm9USZ+l68SwQifPQU8gmgwWmjCh1xo1P9CWuWqdK09Awb6Bilt7wE+Ro+uru/UZ2jATceNTCbq6S5+9W9Exwd89L6CYfNNZ7AjXTbswOM2ydxfm3vREikno8KVSUbQYK40EK3w9GsGKv91jimKmSAaZzMT7TRjlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748789225; c=relaxed/simple;
	bh=4InrsKZSPu1DLhkG47rdNlPsRdpTgoOoSQcQLeiRXFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sSICgeC0Ivp5LRL9yHf9NpL0JOevApvOS9FoDBNY6YsgbRpzdidMUZ2XVJiv6aF0i0G4UFo136ODqyD/+Dj7nnAdaRypqoClNfh2fFtTYuXDXGdT3L4UQ0nwVz42FjRzEOVancbX8TcJWc138Tf59/2gh10obcu+S0wtiooK8AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ts2RRZcg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts2RRZcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748789223; x=1780325223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4InrsKZSPu1DLhkG47rdNlPsRdpTgoOoSQcQLeiRXFY=;
  b=Ts2RRZcgsVKMFW6si1JL2zqvzmGeCjf9p53IEXJzbXEmlwJ8R3yKbPfq
   NU4mbP6maESzcg/OBryhmLrHlMeZdO5HEPm3NLNKo5fV2Rig9U5/IiLIA
   iCxxhZBJ1qzEllIsCTJ0KWv5fRrG4rBDVGRDlcInbYi4u+v9p17O4mI9a
   DeSaJFoljKpj5DoffaBJlpVrolLthV4sgAbYfrPprlodlmUW4tC2VPAtN
   uuVsTI6fM94ApHstDMNzEf9649ngVpOK2T/Ld1eRciYr4C+9xZv8wIJgP
   W3dx17IZ/fjFiqDKG8lDcqU7toCTV6lFFd1QBW6tVGmJqH30zLuriDsGd
   w==;
X-CSE-ConnectionGUID: +qUI22nOSDCO5yw7hPpPnA==
X-CSE-MsgGUID: 5tOiMskiRo2C0Q7KsEl5Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="54617723"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="54617723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 07:47:03 -0700
X-CSE-ConnectionGUID: 36fk7xc5S6GL75yL051wdw==
X-CSE-MsgGUID: fFULnqPDRpyX3V2d+1qvWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="167511706"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jun 2025 07:47:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLjxj-000Yy4-1z;
	Sun, 01 Jun 2025 14:46:59 +0000
Date: Sun, 1 Jun 2025 22:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: pmic@0 (sprd,sc2731):
 fuel-gauge@a00: 'battery-detect-gpios' is a required property
Message-ID: <202506012210.xTIFGFQf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: 131a975aba393cc81dc86687e55412137c520dec [2/2] dt-bindings: mfd: sprd,sc2731: Convert to YAML
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250601/202506012210.xTIFGFQf-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506012210.xTIFGFQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506012210.xTIFGFQf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@70b00000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-apb@70000000 (simple-bus): $nodename:0: 'ap-apb@70000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-ahb (simple-bus): $nodename:0: 'ap-ahb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: aon (simple-bus): $nodename:0: 'aon' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: pmic@0 (sprd,sc2731): fuel-gauge@a00: 'bat-detect-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/sprd,sc2731.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: pmic@0 (sprd,sc2731): fuel-gauge@a00: 'battery-detect-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/sprd,sc2731.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: pmic@0 (sprd,sc2731): fuel-gauge@a00: 'sprd,calib-resistance-micro-ohms' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/sprd,sc2731.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00 (sprd,sc2731-fgu): 'bat-detect-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00 (sprd,sc2731-fgu): 'battery-detect-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00 (sprd,sc2731-fgu): 'sprd,calib-resistance-micro-ohms' is a required property
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/pinctrl@402a0000: failed to match any schema with compatible: ['sprd,sc9860-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
