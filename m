Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0038931A7F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 13:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766669418; cv=none; b=HvHq/8z/tppfABqXSikc/26+NLRLxVDPDF4zh61KIIxZgTZUB82ejIqr8c64qh9q16KDUaa6CVdARe6Kfk60AvQssMcS+YNv40NZUygaJ+C/XBjJKMcp34gF93D5mWwD8C1w/9aU2+vfqLYukXXTgtoJnD5etnjHt4ZXJdPyejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766669418; c=relaxed/simple;
	bh=Wj1qWIoXwJ1Kx/1cItwvzf2Aa4H72w/kxOgPKRcRz0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4d2uVaxLhz0Tgmoa7C5eA3h3qH9a9VfuAXABaKUrUtKiKFtk73ArgMaBdI4MmuUKSabpsUpAKdH1zTh8+en2WrJq5ZjIqa8tIc5EeHLf8l34gg4GVRe1vb+Bq/2d5T32usT/Ub+RvMJR7NZ9QLyigJfmrCPtjeRwXZYhHx5BjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mq2VITD4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mq2VITD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766669413; x=1798205413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wj1qWIoXwJ1Kx/1cItwvzf2Aa4H72w/kxOgPKRcRz0E=;
  b=mq2VITD45fYgcL2HSObK/9AedRwaqXAoIsi6LLYy7iL3bXoEDjPF4x7C
   abtqoYM/3Vt8ayQB62wDRUp5E6etyWW6Wdjf0LAUv6Hp1wisvNfLPsoJm
   tDanDe5151Py6YmGt1Z1OieQJe9qwEdAFWbWtg5fs37+uShrtHcsJX+X3
   M/JIkQ0XIiNEL1RUv+HhsiAlIcimz4gyt02cvlL084R8CnPRbBZgD9ugN
   5dgDWN0joIqgRDlw3QoHrdzQkns84qpyN0dBz8oanKuXyY0gUqqn84T8s
   XYOxgsBh5BNS8jGfb3KsVQHPg407ksypqCQ+er2ez35VpPkIWPl5AHcR6
   w==;
X-CSE-ConnectionGUID: 4Km6dCkaRy+ooRlXngnrrw==
X-CSE-MsgGUID: sMm12t2DSDWcphZ6aZfB5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="86051249"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="86051249"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 05:30:12 -0800
X-CSE-ConnectionGUID: aeu8PkN6QDewfjKbIjES4Q==
X-CSE-MsgGUID: NgQKS9BzRiiYtpJEUTi04g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 25 Dec 2025 05:30:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYlPs-000000006ai-3aUn;
	Thu, 25 Dec 2025 13:30:08 +0000
Date: Thu, 25 Dec 2025 14:29:23 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10/10]
 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202512251456.TRkvFsjk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   610575a82bdf3c3be06ce9559609d5bfa65472e8
commit: c21dc717760f8594e1fccae49eb86eb05e9a5f12 [10/10] dt-bindings: arm: Add MPAM MSC binding
config: arm64-randconfig-2052-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251456.TRkvFsjk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e3ef26df85c317665a2c505a0d9bc179fe67bdaf)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251456.TRkvFsjk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251456.TRkvFsjk-lkp@intel.com/

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
