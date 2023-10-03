Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912DDD2EB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 21:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696368043; x=1727904043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w+XGHC5d8cadilnw2x0rGS49CDnCzP2/mMdpWo/PZAM=;
  b=YxFmxCpkYt3/AaqqTd8ReabKsTqLFjhN2sXO2fCBY6AnWEzxy4xh+k+L
   HgLY/6DVjAyIc5UQnRmzv/i1UdSIl/C5YXr4b2c1CguacRyCZBs0gCeAY
   K+ALN3HkfmG8Wk+tLMoZlA5smAyWZ14YCDLwMs9bb308zl7cdbqIEEnf0
   +55qcVQVvW/hbkOOMgFULr3nol4xjVaKqEe3ucK9HKvFHwghWeEaowPVG
   gb/ViQg/lHN/alT3g2J+SlIKGnKgFRXG2UY/oWDR+EyDbws/C4eN8e9EB
   4xUdmvSZJYeKDx9upP2hzke/qhNfdYBiIV9Q1zWAm2qgtvX04gSsX2Lgn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386853915"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="386853915"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 14:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="867029741"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="867029741"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2023 14:20:41 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnmop-0009Hk-09;
	Tue, 03 Oct 2023 21:20:39 +0000
Date: Wed, 4 Oct 2023 05:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/6] dt-bindings: ufs: common: add OPP table
Message-ID: <202310040539.MPXMfcgx-lkp@intel.com>
References: <20231003111232.42663-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003111232.42663-2-manivannan.sadhasivam@linaro.org>

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.6-rc4 next-20231003]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/dt-bindings-ufs-common-add-OPP-table/20231003-191704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231003111232.42663-2-manivannan.sadhasivam%40linaro.org
patch subject: [PATCH v4 1/6] dt-bindings: ufs: common: add OPP table
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231004/202310040539.MPXMfcgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040539.MPXMfcgx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/ufs/ufs-common.yaml:90:20: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/ufs/ufs-common.yaml:91:26: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/ufs/ufs-common.yaml:91:36: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +90 Documentation/devicetree/bindings/ufs/ufs-common.yaml

     8	
     9	maintainers:
    10	  - Alim Akhtar <alim.akhtar@samsung.com>
    11	  - Avri Altman <avri.altman@wdc.com>
    12	
    13	properties:
    14	  clocks: true
    15	
    16	  clock-names: true
    17	
    18	  freq-table-hz:
    19	    items:
    20	      items:
    21	        - description: Minimum frequency for given clock in Hz
    22	        - description: Maximum frequency for given clock in Hz
    23	    deprecated: true
    24	    description: |
    25	      Preferred is operating-points-v2.
    26	
    27	      Array of <min max> operating frequencies in Hz stored in the same order
    28	      as the clocks property. If either this property or operating-points-v2 is
    29	      not defined or a value in the array is "0" then it is assumed that the
    30	      frequency is set by the parent clock or a fixed rate clock source.
    31	
    32	  operating-points-v2:
    33	    description:
    34	      Preferred over freq-table-hz.
    35	      If present, each OPP must contain array of frequencies stored in the same
    36	      order for each clock.  If clock frequency in the array is "0" then it is
    37	      assumed that the frequency is set by the parent clock or a fixed rate
    38	      clock source.
    39	
    40	  opp-table: true
    41	
    42	  interrupts:
    43	    maxItems: 1
    44	
    45	  lanes-per-direction:
    46	    $ref: /schemas/types.yaml#/definitions/uint32
    47	    enum: [1, 2]
    48	    default: 2
    49	    description:
    50	      Number of lanes available per direction.  Note that it is assume same
    51	      number of lanes is used both directions at once.
    52	
    53	  vdd-hba-supply:
    54	    description:
    55	      Phandle to UFS host controller supply regulator node.
    56	
    57	  vcc-supply:
    58	    description:
    59	      Phandle to VCC supply regulator node.
    60	
    61	  vccq-supply:
    62	    description:
    63	      Phandle to VCCQ supply regulator node.
    64	
    65	  vccq2-supply:
    66	    description:
    67	      Phandle to VCCQ2 supply regulator node.
    68	
    69	  vcc-supply-1p8:
    70	    type: boolean
    71	    description:
    72	      For embedded UFS devices, valid VCC range is 1.7-1.95V or 2.7-3.6V. This
    73	      boolean property when set, specifies to use low voltage range of
    74	      1.7-1.95V. Note for external UFS cards this property is invalid and valid
    75	      VCC range is always 2.7-3.6V.
    76	
    77	  vcc-max-microamp:
    78	    description:
    79	      Specifies max. load that can be drawn from VCC supply.
    80	
    81	  vccq-max-microamp:
    82	    description:
    83	      Specifies max. load that can be drawn from VCCQ supply.
    84	
    85	  vccq2-max-microamp:
    86	    description:
    87	      Specifies max. load that can be drawn from VCCQ2 supply.
    88	
    89	dependencies:
  > 90	  freq-table-hz: [ 'clocks' ]
    91	  operating-points-v2: [ 'clocks', 'clock-names' ]
    92	
    93	required:
    94	  - interrupts
    95	
    96	allOf:
    97	  - if:
    98	      required:
    99	        - freq-table-hz
   100	    then:
   101	      properties:
   102	        operating-points-v2: false
   103	  - if:
   104	      required:
   105	        - operating-points-v2
   106	    then:
   107	      properties:
   108	        freq-table-hz: false
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
