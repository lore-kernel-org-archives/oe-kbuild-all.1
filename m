Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F212B6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rx/EGqEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703870273; x=1735406273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZAJeulAkKaFe+1QLy/g6DaAsJq0x/o8vKjylsDAC44=;
  b=Rx/EGqEerQw7C/3GSdQCTUEf6W6XohHPuYDE6c9fF9/Pvv9Gq7NTIqjg
   d7IrdktphP9fXTO8ePhJra+qqUdUuwhERZF020lgdX/BVzvjn2aQzRMdt
   T/LwHHc2C1d9AROgFIT5ECx2OhOmYVtYDNrd0Xhg3LosL7vh/vBHyzezQ
   XZH7x29LqVpNpYxg/x10flujC+FyOm2LhUbzTBTmNAdNYppn4hWHodW9g
   tmUrZjwUnamRQSPKoyVx8GpfX0VU0DIzeW6/xE6xLtJN3ayko84lwTJhq
   kEd5vCtZMPTnBF8zXNg3wIdYchgXdB8X2ge6FWklN8qWaq0FO3QjnhA6A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3498594"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="3498594"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 09:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="952118052"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="952118052"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Dec 2023 09:17:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJGUV-000Hcz-1e;
	Fri, 29 Dec 2023 17:17:47 +0000
Date: Sat, 30 Dec 2023 01:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>, linux-doc@vger.kernel.org
Subject: [steev:lenovo-x13s-v6.7.0-rc7 119/146] dtbs_check:
 Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml:86:15: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202312300113.gBALy86Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.7.0-rc7
head:   98581f1b8caa68dee7a2dcd0714d845f7cb9eac2
commit: 346a3c7616be37be2c324fbf50f5f99682cdc82d [119/146] media: dt-bindings: media: i2c: Add bindings for AP1302
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231230/202312300113.gBALy86Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300113.gBALy86Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml:86:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +86 Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml

     8	
     9	maintainers:
    10	  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    11	  - Anil Kumar M <anil.mamidala@xilinx.com>
    12	
    13	description: |-
    14	  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
    15	  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
    16	  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
    17	  Frames are output side by side or on two virtual channels.
    18	
    19	  The sensors must be identical. They are connected to the AP1302 on dedicated
    20	  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
    21	  from the host.
    22	
    23	properties:
    24	  compatible:
    25	    const: onnn,ap1302
    26	
    27	  reg:
    28	    description: I2C device address.
    29	    maxItems: 1
    30	
    31	  clocks:
    32	    description: Reference to the CLK clock.
    33	    maxItems: 1
    34	
    35	  reset-gpios:
    36	    description: Reference to the GPIO connected to the RST pin (active low).
    37	    maxItems: 1
    38	
    39	  standby-gpios:
    40	    description:
    41	      Reference to the GPIO connected to the STANDBY pin (active high).
    42	    maxItems: 1
    43	
    44	  port:
    45	    $ref: /schemas/graph.yaml#/$defs/port-base
    46	    unevaluatedProperties: false
    47	    description: MIPI CSI-2 output interface to the host.
    48	
    49	    properties:
    50	      endpoint:
    51	        $ref: /schemas/graph.yaml#/$defs/endpoint-base
    52	        unevaluatedProperties: false
    53	
    54	        properties:
    55	          clock-noncontinuous:
    56	            type: boolean
    57	
    58	          data-lanes:
    59	            oneOf:
    60	              - items:
    61	                  - const: 1
    62	              - items:
    63	                  - const: 1
    64	                  - const: 2
    65	              - items:
    66	                  - const: 1
    67	                  - const: 2
    68	                  - const: 3
    69	                  - const: 4
    70	
    71	        required:
    72	          - data-lanes
    73	
    74	  sensors:
    75	    type: object
    76	    description: List of connected sensors
    77	
    78	    properties:
    79	      "#address-cells":
    80	        const: 1
    81	
    82	      "#size-cells":
    83	        const: 0
    84	
    85	      onnn,model:
  > 86	        $ref: "/schemas/types.yaml#/definitions/string"
    87	        description: |
    88	          Model of the connected sensors. Must be a valid compatible string.
    89	
    90	          If no sensor is connected, this property must no be specified, and
    91	          the AP1302 can be used with it's internal test pattern generator.
    92	
    93	    patternProperties:
    94	      "^sensor@[01]":
    95	        type: object
    96	        description: |
    97	          Sensors connected to the first and second input, with one node per
    98	          sensor.
    99	
   100	        properties:
   101	          reg:
   102	            description: AP1302 input port number
   103	            maxItems: 1
   104	
   105	        patternProperties:
   106	          ".*-supply":
   107	            description: Power supplies for the sensor
   108	
   109	        required:
   110	          - reg
   111	
   112	        additionalProperties: false
   113	
   114	    required:
   115	      - "#address-cells"
   116	      - "#size-cells"
   117	
   118	    # How can we express that onnn,model requires one sensor object to be set ?
   119	
   120	    additionalProperties: false
   121	
   122	required:
   123	  - compatible
   124	  - reg
   125	  - clocks
   126	  - port
   127	  - sensors
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
