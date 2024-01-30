Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4897E79929
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 21:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706650840; cv=none; b=ntNe5qfTuOotifer8qrjrYdnfTMfK8YAXlbUKeuj+MoSkLidp/Kxkm1yaD8wLSCzS3hNEbmKnqZAu9tNy7w7rFG1kJr/ajkNDqe5hsylzfCXYTDAEjkOO+2E5ZqPYl6oBCLFqD1oE+5SvsHseiYQrKp2WnoFTqbrX893sKOx2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706650840; c=relaxed/simple;
	bh=mRqkA6EOC2n90DoxwdevJZ0E67mQjhvxaJkezRIaY9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iYv0QvmJ7JkVulKRLvr4j9MPAWujlZBrMC25/4DZXTBOha4LHTTWnQIfUWgl5/XkiLO3VlQ6hQyn+8BukxeimRNYMMZy4grw1mBRSvaPvgxYK5qXc01kL4WkDpWl1tAiw5DmajAlJmPu6DRoCR9JjpYH0zid5vVBwDMndp8FMXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPRbFx6R; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPRbFx6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706650838; x=1738186838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRqkA6EOC2n90DoxwdevJZ0E67mQjhvxaJkezRIaY9M=;
  b=dPRbFx6RuvHSz27MqqqRMW6a/CvoP6C0Y5z01/XT94Mk5yUS1pagbrjb
   hExa0UGS4dy+s/kCdrMTw/wUsX2idS58Fy+Ks1nD0bTVDVTWru7x4w5UB
   CPGaek8Xr58PrLKWc3J5xGL1smJaQ6rX+jpkS8bkMT9ND1gFMmMmuBdAY
   U6zyt+MmWs1Bdr1/e6vJcvJr1HKMnq61/J1uC5GEYTNl7eNTQuzll/ZP3
   8s/hL7B66CBxnSfKpwzdMcvG7+YA3QuwF1ohtnpyW2bgSCu7vDdSMfpgC
   2oGCWXN/FfM91cYM2amEUFPXa6C0oGdlsTCi9bIaTSJyM8gcgTKtOxOU8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434584464"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="434584464"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 13:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931595248"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="931595248"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2024 13:40:36 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUvqM-0000r6-0b;
	Tue, 30 Jan 2024 21:40:34 +0000
Date: Wed, 31 Jan 2024 05:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2681/2881] dtbs_check:
 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202401310530.n3p0dJu0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   370d9c06c9c2609f0c25810eb8f913fc9cdde776
commit: c21dc717760f8594e1fccae49eb86eb05e9a5f12 [2681/2881] dt-bindings: arm: Add MPAM MSC binding
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240131/202401310530.n3p0dJu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310530.n3p0dJu0-lkp@intel.com/

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
