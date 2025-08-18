Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962041FBE87
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 23:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560640; cv=none; b=ZCA+6f1aJjtup9fUcAMiJJNAkG1+vupm8W6tXnr356EP/FlUOjqHKy1hPYAFKey5lFHGmkyKR1CYiNjONd2ngz4Y1z1zbdJculvVKNo+9FUYmNyTv/cZDIEAPwFsL7B+OPS40KdOeUvxgLyxujipKj1GyrGmliDeL7w/JTwDEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560640; c=relaxed/simple;
	bh=MgJFnjbjkGgb29ezPMPQGa8ZPeZDjKJK9iltwQWcLaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mBrXLiG2UewFV9Mh8RdE3Ylm58bsoWQsBh5CirGvOfvtfhVtJThnwCYunWPiQP6a3qk9v1veWUfEv0FmR5IfFAdyrL85gQ0SY7ZvUED7U5OP9KFu4SIqp5iCckyZE9ZAf+B4x4I87juUProYFcYo05hYZFpvwOLy+QaxVrPd4Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngZsOWJ4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngZsOWJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755560637; x=1787096637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MgJFnjbjkGgb29ezPMPQGa8ZPeZDjKJK9iltwQWcLaE=;
  b=ngZsOWJ4svtalozzDrsn1xm/j5+DPP2Uf4QnlYpr4f923nVPDQMYraMd
   5hh/sGutaPa8D88OpDJ8RX6YDPnEpgTT9ReoSv+5RYRZFkoDuCP9FwH58
   MeD1gRuo7K5dWRWX8IWUhYvJySwBm9h8s1GPwaZg25b82QaV3XPzkB4vL
   dRp12C7C0CPix+FL01aWHijEKdgwz3/YEEyQFfAm9Ar8au46g2ATUcG/l
   7JIt8Hc5H6WSpXxmHNzbTPyqh956KwwFMupwOU8hgjemRVRFoVzvkvSK8
   6dS7ivP3ONF2zEO7rTXnvF7NojilqFdbYt3HsUZktSpugp8jLABxTsQ0j
   Q==;
X-CSE-ConnectionGUID: hYmRKp69T1+x0y/alUVaTQ==
X-CSE-MsgGUID: ld7klO+bSd+L7ZQiZ4Ze5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61629457"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="61629457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 16:43:56 -0700
X-CSE-ConnectionGUID: Xvn8kVhiS6qd4kuFEFP3RA==
X-CSE-MsgGUID: YnyPZn2QTKKI/2Ib7HYLLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="191383169"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 18 Aug 2025 16:43:55 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo9W5-0001CZ-0c;
	Mon, 18 Aug 2025 23:43:53 +0000
Date: Tue, 19 Aug 2025 01:43:21 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2690/2690]
 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202508190101.sNK63dFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: c21dc717760f8594e1fccae49eb86eb05e9a5f12 [2690/2690] dt-bindings: arm: Add MPAM MSC binding
config: arm64-randconfig-2052-20250818 (https://download.01.org/0day-ci/archive/20250819/202508190101.sNK63dFY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190101.sNK63dFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190101.sNK63dFY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +76 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml

     8	
     9	description: |
    10	  The Arm MPAM specification can be found here:
    11	
    12	  https://developer.arm.com/documentation/ddi0598/latest
    13	
    14	maintainers:
    15	  - Rob Herring <robh@kernel.org>
    16	
    17	properties:
    18	  compatible:
    19	    items:
    20	      - const: arm,mpam-msc                   # Further details are discoverable
    21	      - const: arm,mpam-memory-controller-msc
    22	
    23	  reg:
    24	    maxItems: 1
    25	    description: A memory region containing registers as defined in the MPAM
    26	      specification.
    27	
    28	  interrupts:
    29	    minItems: 1
    30	    items:
    31	      - description: error (optional)
    32	      - description: overflow (optional, only for monitoring)
    33	
    34	  interrupt-names:
    35	    oneOf:
    36	      - items:
    37	          - enum: [ error, overflow ]
    38	      - items:
    39	          - const: error
    40	          - const: overflow
    41	
    42	  arm,not-ready-us:
    43	    description: The maximum time in microseconds for monitoring data to be
    44	      accurate after a settings change. For more information, see the
    45	      Not-Ready (NRDY) bit description in the MPAM specification.
    46	
    47	  numa-node-id: true # see NUMA binding
    48	
    49	  '#address-cells':
    50	    const: 1
    51	
    52	  '#size-cells':
    53	    const: 0
    54	
    55	patternProperties:
    56	  '^ris@[0-9a-f]$':
    57	    type: object
    58	    additionalProperties: false
    59	    description: |
    60	      RIS nodes for each RIS in an MSC. These nodes are required for each RIS
    61	      implementing known MPAM controls
    62	
    63	    properties:
    64	      compatible:
    65	        enum:
    66	            # Bulk storage for cache
    67	          - arm,mpam-cache
    68	            # Memory bandwidth
    69	          - arm,mpam-memory
    70	
    71	      reg:
    72	        minimum: 0
    73	        maximum: 0xf
    74	
    75	      cpus:
  > 76	        $ref: '/schemas/types.yaml#/definitions/phandle-array'
    77	        description:
    78	          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
    79	          device's affinity is used.
    80	
    81	      arm,mpam-device:
    82	        $ref: '/schemas/types.yaml#/definitions/phandle'
    83	        description:
    84	          By default, the MPAM enabled device associated with a RIS is the MSC's
    85	          parent node. It is possible for each RIS to be associated with different
    86	          devices in which case 'arm,mpam-device' should be used.
    87	
    88	    required:
    89	      - compatible
    90	      - reg
    91	
    92	required:
    93	  - compatible
    94	  - reg
    95	
    96	dependencies:
    97	  interrupts: [ interrupt-names ]
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
