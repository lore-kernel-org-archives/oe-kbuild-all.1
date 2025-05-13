Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FD328CF53
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135582; cv=none; b=fAtN48NaVqMV8NJGor7D2dmsZfpJgm6Ciw970S31lsU+hb6+Q/u1qnGLXacIaoF+8CPhzAWMDQ9mI5bYu24kvYGywoS+7cxJEBhObgPqwFJNTuNOKQP9T181GAY3r0BFS9qnLjyHt+wu4r5CtQUPCSEzsZi+8QMVHFC4L70RyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135582; c=relaxed/simple;
	bh=EOWmd+JgPbFV5a6aqM8keWCXtYOe4qax3xOfpMNuInY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JirD5LoRAc4EHWhclasgsWx9iAOqcxlCBRJzqgqRyJaDY7T3DLqlLvQWHgWhu9WGEbeaKMiHXyHSuesvmNNZCSAso9ZW0YxRq9ZlEE8qiv8Pt4Ti8tigzIhX2I/etXsiEPjJalqAdoGflO3BhfDHZ/7WskbJVbTk39OatqtC9+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2q1tpC0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2q1tpC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747135581; x=1778671581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOWmd+JgPbFV5a6aqM8keWCXtYOe4qax3xOfpMNuInY=;
  b=J2q1tpC0cqhL+43g0hmL6K5N0bsh5A0uEKfo8DS8NwzbTrURAZ5QSKnh
   LIvgkr9q2lgblV8qt+6tLpW87cT4LJ0YuZw7b+8VSrbSk4NmI2zO8HUOI
   dR3j224ooMvNV5itpHKhwXOMN9OP1Vgxr9ghL8L7BZDfjhFqGWhXyubXG
   QC4CR97J1pLXrdHK7gTv+PlabIZdgFn3FSWRzORQX1E8dOuAXz3vPsEr3
   /Q0HTWwkD9gJrCIAHB9phvz9JsqwtdK5D3ILbd6n4Q+B5wfh5pL6FBwUo
   xKYrFYqSyhOqaCz7uZvHWOFpWviFb04l9rG+aiDe/1jFy7zTJ91C+JhTH
   Q==;
X-CSE-ConnectionGUID: FzKowCoCSvuZJj6bY7F6Eg==
X-CSE-MsgGUID: orxNDzXWQ9WhmNc4RJ4Eow==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48851871"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="48851871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 04:26:20 -0700
X-CSE-ConnectionGUID: 6z/K9hm6RxiD4K/p4vd7fg==
X-CSE-MsgGUID: z6vYAnYARfefDTMPweQJXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137542106"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 13 May 2025 04:26:19 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEnm4-0000xW-1e;
	Tue, 13 May 2025 11:26:16 +0000
Date: Tue, 13 May 2025 19:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202505131911.EBxgIjad-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8c683c781fbd8981b1fabf54cf6eec18190cebdf
commit: c21dc717760f8594e1fccae49eb86eb05e9a5f12 [2195/2195] dt-bindings: arm: Add MPAM MSC binding
config: arm64-randconfig-2053-20250504 (https://download.01.org/0day-ci/archive/20250513/202505131911.EBxgIjad-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131911.EBxgIjad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131911.EBxgIjad-lkp@intel.com/

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
