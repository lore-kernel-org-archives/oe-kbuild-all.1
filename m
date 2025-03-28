Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09632AEF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 00:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743121279; cv=none; b=Zn4v+JUiBjZyz4QOoxZ9KhPcOttWiK0gVVL0cuOqSUWivRRJrku2in1R3Pj1kWWI7Mc96WGAdwRj+NZULJeDWFI9Pt85oKvncoYUxiRUO6Ajiyef6n8X6QSK7E1qsyNbxNH5nZp0Ba+h89xh08Avqfw9zC1G7BDHZzlkf2gTgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743121279; c=relaxed/simple;
	bh=vozR5mSLW6aEeNh9vpMa2OMhi/85aLyJAS/8TUnPcYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Almx50KwYYkhWNXJdGo5QYFPvZwa7f65oT8O1JIFfC7f73CLRytjnw2tJE2Bpbjy4U3hQbbKTLQxnY0HeaAinsqeV67zyd+dpdOxPxsmKaxnCLCC01uF4eqHiQ4bTzTa4RWWz+uTxV/HaYB10gdeuVJCUckO/T7G6/5GN8il9l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mja/khlh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mja/khlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743121278; x=1774657278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vozR5mSLW6aEeNh9vpMa2OMhi/85aLyJAS/8TUnPcYU=;
  b=Mja/khlh2KS+aQTxRjcyC7/KjvKYgf9edQrofveDlNWU+UQSID4saTLB
   S+/lgMvg+uJJ21OBMV2qhdiGHBshbHplRPEiDp2y/TtmAer8pGq0hm2Sb
   vDqKb+UR5i7qXnKng/v2hG8XQU4po3t84xaFu7NnjKUN3P3oQQ5KsAIPR
   +wJDInAfIQCSiTGpQH7Aoq1nJ1zChMpF4TbLZb5HMnP1I+oofyIQHTpRN
   S8gljc5U6tqcpIwbHkYszwwDegJBxV52OjtZQ1pvNfDHK6G8pnsOSJZOv
   Kurl8gEFIvhgn5XTyWdm3xlq+qWDAKaza6XkI7nF3k+eEeqfKs3XsJlWE
   g==;
X-CSE-ConnectionGUID: BBgSmSWSTNOOiQzCxqVd0Q==
X-CSE-MsgGUID: 3jzw7HHfSaOnG+Emm6a33g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44394394"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="44394394"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 17:21:16 -0700
X-CSE-ConnectionGUID: eGui0ovKQSu4VgXSL5ixwQ==
X-CSE-MsgGUID: NRW3rO2tSiatYK3s2HqbEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="162537948"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Mar 2025 17:21:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txxTA-00071e-1Y;
	Fri, 28 Mar 2025 00:21:09 +0000
Date: Fri, 28 Mar 2025 08:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 23/23]
 arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /: failed to match
 any schema with compatible: ['google,navi-sku2', 'google,navi-sku7',
 'google,navi', 'mediatek,mt8196']
Message-ID: <202503280840.zIZxTHWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b227f84ea4ccd17e73548d7b3f3e0edce97652aa
commit: 1acc3205880162fc9ada137f8281f32f835519d6 [23/23] CHROMIUM: arm64: dts: mediatek: mt8196: navi: add SKUs with Elan fingerprint sensor
config: arm64-randconfig-051-20250327 (https://download.01.org/0day-ci/archive/20250328/202503280840.zIZxTHWo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280840.zIZxTHWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280840.zIZxTHWo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1144.37-1169.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:94.25-142.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@13a30000/anx7625@58: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1269.25-1299.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1301.24-1328.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2692.28-2697.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:110.9-120.5: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi.dtsi:130.11-139.7: Warning (graph_child_address): /soc/i2c@13a30000/anx7625@58/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:250.8-260.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:266.8-276.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   propagate-bits: size (1) error for type uint32-array
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /: failed to match any schema with compatible: ['google,navi-sku2', 'google,navi-sku7', 'google,navi', 'mediatek,mt8196']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /: failed to match any schema with compatible: ['google,navi-sku2', 'google,navi-sku7', 'google,navi', 'mediatek,mt8196']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /: failed to match any schema with compatible: ['google,navi-sku2', 'google,navi-sku7', 'google,navi', 'mediatek,mt8196']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /: failed to match any schema with compatible: ['google,navi-sku2', 'google,navi-sku7', 'google,navi', 'mediatek,mt8196']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: idle-states: entry-method:0: 'psci' was expected
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: idle-states: 'clusteroff-b', 'clusteroff-l', 'clusteroff-m', 'cpuoff-b', 'cpuoff-l', 'cpuoff-m', 'mcusysoff-b', 'mcusysoff-l', 'mcusysoff-m', 's2idle', 'system-vcore' do not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: clk-ao: $nodename:0: 'clk-ao' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: clk-ao: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: clk-ao: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
