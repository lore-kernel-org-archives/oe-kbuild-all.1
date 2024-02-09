Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2674A679E2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707471445; cv=none; b=bvUN4rw00Nv/lsYmbNcQjG7I+m3GsctuxjdnX09St97Rirfa2SMI6P3QZv2uLyWK5mirXCmGD1xc9lXB4jg6fU1zh0j0+bRdT5VjRpLPIAKU4IC+5ZvrNolj5bzSU8pSzh3UCedMQJwSKlGSc7EdUzSYBCbDCvvnioJYd9RBsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707471445; c=relaxed/simple;
	bh=BvjM4tRVH5wMMdqaymDvKzDbWBK/5/bi1kFxr069irE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OgKi1SkzJ/aW1jpN1b3KukCHoda0dXZ3hnisKit7HtORqbrdReX+cDkzB+zYvFlN98xswkp+ymiN94dmgRsutnZxEoGkJTe4HKOr6zb4Mv1xMRxM25PsU6kOiva0MmGIwEf9+g0wZ59MLSArfJIzVAQlFhdVbfgxVPqT4N5gzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYOJJj4H; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYOJJj4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707471443; x=1739007443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BvjM4tRVH5wMMdqaymDvKzDbWBK/5/bi1kFxr069irE=;
  b=UYOJJj4HPKDgd83kCVB3sZY4aaN/Lry58kycq27nzWyfmGe619so9CFv
   NRTKMy/jf9FSb0cE6nU9peBKJN+B2nW2jLccCkCuRDbufxLBZrbyFHFpm
   zG+jzzynccDZK0rIStEUlkwum8nVTYVKVHLeEMBKz8MNwukkuEekgPoGT
   hi7u1wuXN0dFYohYORp9h422Nje0f3x5l2M09IJ3UQsvZ1JG1tTpoKwAM
   siwICcgjPqriJ9o1SFWshH1RS1mMyRmnBqy1OtXBb2weg/2fKon1KHOv9
   o74Np70QUpyfCyPfjoQ5mSDM4kiDof8ZKyNbpEBZg1WrVk5Q9g+P4YwRi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1552320"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1552320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 01:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1875171"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2024 01:37:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYNJt-0004Zx-1g;
	Fri, 09 Feb 2024 09:37:17 +0000
Date: Fri, 9 Feb 2024 17:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-doc@vger.kernel.org
Subject: [esmil:d1-6.8.y 29/50] dtbs_check:
 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml:88:16:
 [error] string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202402091759.3wlzvJqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: 5da366657ae1b4fc31ebf3e2ce0f56ffc951cfde [29/50] dt-bindings: display: sun4i-tcon: Add external LVDS PHY
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402091759.3wlzvJqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091759.3wlzvJqR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml:88:16: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +88 Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml

     8	
     9	maintainers:
    10	  - Chen-Yu Tsai <wens@csie.org>
    11	  - Maxime Ripard <mripard@kernel.org>
    12	
    13	description: |
    14	  The TCON acts as a timing controller for RGB, LVDS and TV
    15	  interfaces.
    16	
    17	properties:
    18	  "#clock-cells":
    19	    const: 0
    20	
    21	  compatible:
    22	    oneOf:
    23	      - const: allwinner,sun4i-a10-tcon
    24	      - const: allwinner,sun5i-a13-tcon
    25	      - const: allwinner,sun6i-a31-tcon
    26	      - const: allwinner,sun6i-a31s-tcon
    27	      - const: allwinner,sun7i-a20-tcon
    28	      - const: allwinner,sun8i-a23-tcon
    29	      - const: allwinner,sun8i-a33-tcon
    30	      - const: allwinner,sun8i-a83t-tcon-lcd
    31	      - const: allwinner,sun8i-a83t-tcon-tv
    32	      - const: allwinner,sun8i-r40-tcon-tv
    33	      - const: allwinner,sun8i-v3s-tcon
    34	      - const: allwinner,sun9i-a80-tcon-lcd
    35	      - const: allwinner,sun9i-a80-tcon-tv
    36	      - const: allwinner,sun20i-d1-tcon-lcd
    37	      - const: allwinner,sun20i-d1-tcon-tv
    38	
    39	      - items:
    40	          - enum:
    41	              - allwinner,sun7i-a20-tcon0
    42	              - allwinner,sun7i-a20-tcon1
    43	          - const: allwinner,sun7i-a20-tcon
    44	
    45	      - items:
    46	          - enum:
    47	              - allwinner,sun50i-a64-tcon-lcd
    48	          - const: allwinner,sun8i-a83t-tcon-lcd
    49	
    50	      - items:
    51	          - enum:
    52	              - allwinner,sun8i-h3-tcon-tv
    53	              - allwinner,sun50i-a64-tcon-tv
    54	          - const: allwinner,sun8i-a83t-tcon-tv
    55	
    56	      - items:
    57	          - enum:
    58	              - allwinner,sun50i-h6-tcon-tv
    59	          - const: allwinner,sun8i-r40-tcon-tv
    60	
    61	  reg:
    62	    maxItems: 1
    63	
    64	  interrupts:
    65	    maxItems: 1
    66	
    67	  clocks:
    68	    minItems: 1
    69	    maxItems: 4
    70	
    71	  clock-names:
    72	    minItems: 1
    73	    maxItems: 4
    74	
    75	  clock-output-names:
    76	    description:
    77	      Name of the LCD pixel clock created.
    78	    maxItems: 1
    79	
    80	  dmas:
    81	    maxItems: 1
    82	
    83	  phys:
    84	    maxItems: 1
    85	
    86	  phy-names:
    87	    items:
  > 88	      - const: "lvds0"
    89	
    90	  resets:
    91	    anyOf:
    92	      - items:
    93	          - description: TCON Reset Line
    94	
    95	      - items:
    96	          - description: TCON Reset Line
    97	          - description: TCON LVDS Reset Line
    98	
    99	      - items:
   100	          - description: TCON Reset Line
   101	          - description: TCON eDP Reset Line
   102	
   103	      - items:
   104	          - description: TCON Reset Line
   105	          - description: TCON eDP Reset Line
   106	          - description: TCON LVDS Reset Line
   107	
   108	  reset-names:
   109	    oneOf:
   110	      - const: lcd
   111	
   112	      - items:
   113	          - const: lcd
   114	          - const: lvds
   115	
   116	      - items:
   117	          - const: lcd
   118	          - const: edp
   119	
   120	      - items:
   121	          - const: lcd
   122	          - const: edp
   123	          - const: lvds
   124	
   125	  ports:
   126	    $ref: /schemas/graph.yaml#/properties/ports
   127	
   128	    properties:
   129	      port@0:
   130	        $ref: /schemas/graph.yaml#/properties/port
   131	        description: |
   132	          Input endpoints of the controller.
   133	
   134	      port@1:
   135	        $ref: /schemas/graph.yaml#/$defs/port-base
   136	        unevaluatedProperties: false
   137	        description: |
   138	          Output endpoints of the controller.
   139	
   140	        patternProperties:
   141	          "^endpoint(@[0-9])$":
   142	            $ref: /schemas/graph.yaml#/$defs/endpoint-base
   143	            unevaluatedProperties: false
   144	
   145	            properties:
   146	              allwinner,tcon-channel:
   147	                $ref: /schemas/types.yaml#/definitions/uint32
   148	                description: |
   149	                  TCON can have 1 or 2 channels, usually with the
   150	                  first channel being used for the panels interfaces
   151	                  (RGB, LVDS, etc.), and the second being used for the
   152	                  outputs that require another controller (TV Encoder,
   153	                  HDMI, etc.).
   154	
   155	                  If that property is present, specifies the TCON
   156	                  channel the endpoint is associated to. If that
   157	                  property is not present, the endpoint number will be
   158	                  used as the channel number.
   159	
   160	    required:
   161	      - port@0
   162	      - port@1
   163	
   164	required:
   165	  - compatible
   166	  - reg
   167	  - interrupts
   168	  - clocks
   169	  - clock-names
   170	  - resets
   171	  - ports
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
