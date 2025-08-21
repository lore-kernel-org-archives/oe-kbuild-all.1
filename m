Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E18253B64
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755776922; cv=none; b=pzoqlBw11Ibq++dH+liNRVQ/VmUqfunSkFK/j34BY6SCosXiAdGST5hnOFMXUfD/rHD+cRlPyP6JJwjB589gIYERhJRdvAfpukjoecIsKQeFAvQT6GGpLfNzcFzLVVYdTFkr7pdzlkAUsaq0GkKrkZeh0jp4jJn+Rwwxd5uyCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755776922; c=relaxed/simple;
	bh=mhYeXiYUa1WQleS175ow2uIerGjigYQqDqaLq/eEH0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBRH79LLqnw6WPD2kEZLjRJ53ngiQqhOhE7omv7T/sw69ETagRLrFbnn20vp+KPVhscsnNRygnYsWlBbT5mW32v43n26uLAORzvst/Lm1I0leYLxlhJp5InRIH9mbGRCxnTsa2QtZKjmKJOrZcErxmFTN/nKUZvm3NeS74BdPUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbslqRLo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbslqRLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755776920; x=1787312920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mhYeXiYUa1WQleS175ow2uIerGjigYQqDqaLq/eEH0s=;
  b=NbslqRLoQBx8qlrDlYYOwf3ofk7fGrJCn58lJXYyCK8gZrQBNtuMZnop
   sVzTXjoI2M0ursPKWg+0X1Pn0nKfYUf93XMvv922OVIkXXC6vurvgbbrB
   8+Hfbzv14U7O1Decv/7BQx0ZQMyx703Avd8SX1EM0IZ7EmOEHLxFlFjgY
   e3IPABFdexHbd1r9aNz8EDSeVLcZ51w+yeyQlvX3jjJajlzGYysvpZebB
   0FECZMH51YxkKHFMBmpWLEEA/+YLVRmi+QC2qsrt6JpV9dnfyxq2Jr3yJ
   uouvqhtolvCqtV8I0AqZiyzLaAq+fnqKkGPP8Vq/sdKarawf1W2svWodt
   w==;
X-CSE-ConnectionGUID: nu292++sTFaEVmndhxMQZw==
X-CSE-MsgGUID: n0LHNEFEQWa78twlBMKB0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57989582"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57989582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 04:48:40 -0700
X-CSE-ConnectionGUID: CGdg/7ebTXiweE1NFS65Xw==
X-CSE-MsgGUID: RHkSGrruRbqyd9wTq2ZNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172613835"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2025 04:48:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up3mN-000KEh-0B;
	Thu, 21 Aug 2025 11:48:30 +0000
Date: Thu, 21 Aug 2025 19:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 401/401]
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml:300:10: [warning] wrong
 indentation: expected 10 but found 9 (indentation)
Message-ID: <202508211932.byf27ByR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f4b6cb7ffaee92ae4b706a223ee9c5dd7ed70367
commit: 9b71aa7bc9ece22db7d235fcbc83c5edb4745188 [401/401] BACKPORT: FROMLIST: dt-bindings: mmc: Add compatible for MT8189 SoC
config: arm-randconfig-052-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211932.byf27ByR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211932.byf27ByR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211932.byf27ByR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mmc/mtk-sd.yaml:300:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
   Documentation/devicetree/bindings/mmc/mtk-sd.yaml:301:13: [warning] wrong indentation: expected 11 but found 12 (indentation)

vim +300 Documentation/devicetree/bindings/mmc/mtk-sd.yaml

     8	
     9	maintainers:
    10	  - Chaotian Jing <chaotian.jing@mediatek.com>
    11	  - Wenbin Mei <wenbin.mei@mediatek.com>
    12	
    13	properties:
    14	  compatible:
    15	    oneOf:
    16	      - enum:
    17	          - mediatek,mt2701-mmc
    18	          - mediatek,mt2712-mmc
    19	          - mediatek,mt6779-mmc
    20	          - mediatek,mt6795-mmc
    21	          - mediatek,mt7620-mmc
    22	          - mediatek,mt7622-mmc
    23	          - mediatek,mt7986-mmc
    24	          - mediatek,mt8135-mmc
    25	          - mediatek,mt8173-mmc
    26	          - mediatek,mt8183-mmc
    27	          - mediatek,mt8189-mmc
    28	          - mediatek,mt8196-mmc
    29	          - mediatek,mt8516-mmc
    30	      - items:
    31	          - const: mediatek,mt7623-mmc
    32	          - const: mediatek,mt2701-mmc
    33	      - items:
    34	          - enum:
    35	              - mediatek,mt8186-mmc
    36	              - mediatek,mt8188-mmc
    37	              - mediatek,mt8192-mmc
    38	              - mediatek,mt8195-mmc
    39	              - mediatek,mt8365-mmc
    40	          - const: mediatek,mt8183-mmc
    41	
    42	  reg:
    43	    minItems: 1
    44	    items:
    45	      - description: base register (required).
    46	      - description: top base register (required for MT8183).
    47	
    48	  clocks:
    49	    description:
    50	      Should contain phandle for the clock feeding the MMC controller.
    51	    minItems: 2
    52	    maxItems: 7
    53	
    54	  clock-names:
    55	    minItems: 2
    56	    maxItems: 7
    57	
    58	  interrupts:
    59	    description:
    60	      Should at least contain MSDC GIC interrupt. To support SDIO in-band wakeup, an extended
    61	      interrupt is required and be configured as wakeup source irq.
    62	    minItems: 1
    63	    maxItems: 2
    64	
    65	  interrupt-names:
    66	    items:
    67	      - const: msdc
    68	      - const: sdio_wakeup
    69	
    70	  pinctrl-names:
    71	    description:
    72	      Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin
    73	      will be switched between GPIO mode and SDIO DAT1 mode, state_eint is mandatory in this
    74	      scenario.
    75	    minItems: 2
    76	    items:
    77	      - const: default
    78	      - const: state_uhs
    79	      - const: state_eint
    80	
    81	  pinctrl-0:
    82	    description:
    83	      should contain default/high speed pin ctrl.
    84	    maxItems: 1
    85	
    86	  pinctrl-1:
    87	    description:
    88	      should contain uhs mode pin ctrl.
    89	    maxItems: 1
    90	
    91	  pinctrl-2:
    92	    description:
    93	      should switch dat1 pin to GPIO mode.
    94	    maxItems: 1
    95	
    96	  hs400-ds-delay:
    97	    $ref: /schemas/types.yaml#/definitions/uint32
    98	    description:
    99	      HS400 DS delay setting.
   100	    minimum: 0
   101	    maximum: 0xffffffff
   102	
   103	  mediatek,hs200-cmd-int-delay:
   104	    $ref: /schemas/types.yaml#/definitions/uint32
   105	    description:
   106	      HS200 command internal delay setting.
   107	      This field has total 32 stages.
   108	      The value is an integer from 0 to 31.
   109	    minimum: 0
   110	    maximum: 31
   111	
   112	  mediatek,hs400-cmd-int-delay:
   113	    $ref: /schemas/types.yaml#/definitions/uint32
   114	    description:
   115	      HS400 command internal delay setting.
   116	      This field has total 32 stages.
   117	      The value is an integer from 0 to 31.
   118	    minimum: 0
   119	    maximum: 31
   120	
   121	  mediatek,hs400-cmd-resp-sel-rising:
   122	    $ref: /schemas/types.yaml#/definitions/flag
   123	    description:
   124	      HS400 command response sample selection.
   125	      If present, HS400 command responses are sampled on rising edges.
   126	      If not present, HS400 command responses are sampled on falling edges.
   127	
   128	  mediatek,hs400-ds-dly3:
   129	    $ref: /schemas/types.yaml#/definitions/uint32
   130	    description:
   131	      Gear of the third delay line for DS for input data latch in data
   132	      pad macro, there are 32 stages from 0 to 31.
   133	      For different corner IC, the time is different about one step, it is
   134	      about 100ps.
   135	      The value is confirmed by doing scan and calibration to find a best
   136	      value with corner IC and it is valid only for HS400 mode.
   137	    minimum: 0
   138	    maximum: 31
   139	
   140	  mediatek,latch-ck:
   141	    $ref: /schemas/types.yaml#/definitions/uint32
   142	    description:
   143	      Some SoCs do not support enhance_rx, need set correct latch-ck to avoid
   144	      data crc error caused by stop clock(fifo full) Valid range = [0:0x7].
   145	      if not present, default value is 0.
   146	      applied to compatible "mediatek,mt2701-mmc".
   147	    minimum: 0
   148	    maximum: 7
   149	
   150	  mediatek,tuning-step:
   151	    $ref: /schemas/types.yaml#/definitions/uint32
   152	    description:
   153	      Some SoCs need extend tuning step for better delay value to avoid CRC issue.
   154	      If not present, default tuning step is 32. For eMMC and SD, this can yield
   155	      satisfactory calibration results in most cases.
   156	    enum: [32, 64]
   157	    default: 32
   158	
   159	  resets:
   160	    maxItems: 1
   161	
   162	  reset-names:
   163	    const: hrst
   164	
   165	required:
   166	  - compatible
   167	  - reg
   168	  - interrupts
   169	  - clocks
   170	  - clock-names
   171	  - pinctrl-names
   172	  - pinctrl-0
   173	  - pinctrl-1
   174	  - vmmc-supply
   175	  - vqmmc-supply
   176	
   177	allOf:
   178	  - $ref: mmc-controller.yaml#
   179	  - if:
   180	      properties:
   181	        compatible:
   182	          enum:
   183	            - mediatek,mt2701-mmc
   184	            - mediatek,mt6779-mmc
   185	            - mediatek,mt6795-mmc
   186	            - mediatek,mt7620-mmc
   187	            - mediatek,mt7622-mmc
   188	            - mediatek,mt7623-mmc
   189	            - mediatek,mt8135-mmc
   190	            - mediatek,mt8173-mmc
   191	            - mediatek,mt8183-mmc
   192	            - mediatek,mt8186-mmc
   193	            - mediatek,mt8188-mmc
   194	            - mediatek,mt8189-mmc
   195	            - mediatek,mt8195-mmc
   196	            - mediatek,mt8196-mmc
   197	            - mediatek,mt8516-mmc
   198	    then:
   199	      properties:
   200	        clocks:
   201	          minItems: 2
   202	          items:
   203	            - description: source clock
   204	            - description: HCLK which used for host
   205	            - description: independent source clock gate
   206	        clock-names:
   207	          minItems: 2
   208	          items:
   209	            - const: source
   210	            - const: hclk
   211	            - const: source_cg
   212	
   213	  - if:
   214	      properties:
   215	        compatible:
   216	          contains:
   217	            const: mediatek,mt2712-mmc
   218	    then:
   219	      properties:
   220	        clocks:
   221	          minItems: 3
   222	          items:
   223	            - description: source clock
   224	            - description: HCLK which used for host
   225	            - description: independent source clock gate
   226	            - description: bus clock used for internal register access (required for MSDC0/3).
   227	        clock-names:
   228	          minItems: 3
   229	          items:
   230	            - const: source
   231	            - const: hclk
   232	            - const: source_cg
   233	            - const: bus_clk
   234	
   235	  - if:
   236	      properties:
   237	        compatible:
   238	          contains:
   239	            const: mediatek,mt8183-mmc
   240	    then:
   241	      properties:
   242	        reg:
   243	          minItems: 2
   244	
   245	  - if:
   246	      properties:
   247	        compatible:
   248	          contains:
   249	            enum:
   250	              - mediatek,mt7986-mmc
   251	    then:
   252	      properties:
   253	        clocks:
   254	          minItems: 3
   255	          items:
   256	            - description: source clock
   257	            - description: HCLK which used for host
   258	            - description: independent source clock gate
   259	            - description: bus clock used for internal register access (required for MSDC0/3).
   260	            - description: msdc subsys clock gate
   261	        clock-names:
   262	          minItems: 3
   263	          items:
   264	            - const: source
   265	            - const: hclk
   266	            - const: source_cg
   267	            - const: bus_clk
   268	            - const: sys_cg
   269	
   270	  - if:
   271	      properties:
   272	        compatible:
   273	          enum:
   274	            - mediatek,mt8186-mmc
   275	            - mediatek,mt8188-mmc
   276	            - mediatek,mt8195-mmc
   277	    then:
   278	      properties:
   279	        clocks:
   280	          items:
   281	            - description: source clock
   282	            - description: HCLK which used for host
   283	            - description: independent source clock gate
   284	            - description: crypto clock used for data encrypt/decrypt (optional)
   285	        clock-names:
   286	          items:
   287	            - const: source
   288	            - const: hclk
   289	            - const: source_cg
   290	            - const: crypto
   291	
   292	  - if:
   293	      properties:
   294	        compatible:
   295	          contains:
   296	            const: mediatek,mt8189-mmc
   297	    then:
   298	      properties:
   299	        clocks:
 > 300	         items:
   301	            - description: source clock
   302	            - description: HCLK which used for host
   303	            - description: independent source clock gate
   304	            - description: bus clock used for internal register access
   305	            - description: peripheral bus clock gate
   306	            - description: AXI bus clock gate
   307	            - description: crypto clock used for data encrypt/decrypt (optional)
   308	        clock-names:
   309	          items:
   310	            - const: source
   311	            - const: hclk
   312	            - const: source_cg
   313	            - const: bus_clk
   314	            - const: pclk_cg
   315	            - const: axi_cg
   316	            - const: crypto
   317	
   318	  - if:
   319	      properties:
   320	        compatible:
   321	          contains:
   322	            const: mediatek,mt8192-mmc
   323	    then:
   324	      properties:
   325	        clocks:
   326	          items:
   327	            - description: source clock
   328	            - description: HCLK which used for host
   329	            - description: independent source clock gate
   330	            - description: msdc subsys clock gate
   331	            - description: peripheral bus clock gate
   332	            - description: AXI bus clock gate
   333	            - description: AHB bus clock gate
   334	        clock-names:
   335	          items:
   336	            - const: source
   337	            - const: hclk
   338	            - const: source_cg
   339	            - const: sys_cg
   340	            - const: pclk_cg
   341	            - const: axi_cg
   342	            - const: ahb_cg
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
