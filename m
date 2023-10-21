Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D880ECF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6p7+XMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697888828; x=1729424828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ypGCOkg3uS5RcFd6ASv/c0q1iKpdD5tLLBdOxMLsSms=;
  b=X6p7+XMsMMnHHjndA8Bqv+Jygq1inN9NJUkq8PXVUs461zlcjzeuj4PV
   R22MXRDD6tcWMAWtKV1Zwgt9NQwQpwXpRwbWY0Yw4NkG4Kn0Yy/wsqLuQ
   UtOEedisuu8wc9+vf7n4+6QILz6h4SViblxbHVq9F+jOsSb2NJw2GLxtu
   EAq4WULzgky6JwKL9t0V2qzbhm5tHPYLZ7jVWQRNIs2+pwPZTqnDZ2gKn
   NFj5nwvdAa1uQdKeBCYnHyn0nhz+XUgsAsTQCYVIrWeFSu8q4pjVa2xEb
   f/nMMOlAnTd9KJAXu9u2C6CexnlYLjjaMmTUNLxa5ansc3Azfid45SbGv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371695617"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="371695617"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 04:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823515440"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="823515440"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Oct 2023 04:47:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quARa-0004nG-20;
	Sat, 21 Oct 2023 11:47:02 +0000
Date: Sat, 21 Oct 2023 19:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jyan Chou <jyanchou@realtek.com>, adrian.hunter@intel.com,
	ulf.hansson@linaro.org, jh80.chung@samsung.com
Cc: oe-kbuild-all@lists.linux.dev, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, benchuanggli@gmail.com,
	jyanchou@realtek.com
Subject: Re: [PATCH V2][4/4] mmc: Add dt-bindings for realtek mmc driver
Message-ID: <202310211903.42KO5zwa-lkp@intel.com>
References: <20231018055326.18256-5-jyanchou@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018055326.18256-5-jyanchou@realtek.com>

Hi Jyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on ulf-hansson-mmc-mirror/next linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jyan-Chou/mmc-Add-dt-bindings-for-realtek-mmc-driver/20231018-135538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231018055326.18256-5-jyanchou%40realtek.com
patch subject: [PATCH V2][4/4] mmc: Add dt-bindings for realtek mmc driver
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310211903.42KO5zwa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211903.42KO5zwa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mmc/realtek-dw-mshc.yaml:46:7: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/mmc/realtek-dw-mshc.yaml:46:13: [error] syntax error: expected <block end>, but found '<scalar>' (syntax)
--
>> Documentation/devicetree/bindings/mmc/realtek-dw-mshc.yaml:46:13: did not find expected key
--
>> Documentation/devicetree/bindings/mmc/realtek-dw-mshc.yaml: ignoring, error parsing file

vim +46 Documentation/devicetree/bindings/mmc/realtek-dw-mshc.yaml

     8	
     9	description:
    10	  Realtek uses the Synopsys designware mobile storage host controller
    11	  to interface a SoC with storage medium. This file documents the Realtek
    12	  specific extensions.
    13	
    14	allOf:
    15	  - $ref: synopsys-dw-mshc-common.yaml#
    16	
    17	maintainers:
    18	  - Jyan Chou <jyanchou@realtek.com>
    19	
    20	# Everything else is described in the common file
    21	properties:
    22	  compatible:
    23	    enum:
    24	      - realtek,rtd-dw-cqe-emmc
    25	  reg:
    26	    maxItems: 1
    27	
    28	  interrupts:
    29	    maxItems: 1
    30	
    31	  clocks:
    32	    minItems: 2
    33	    maxItems: 4
    34	    description:
    35	      Handle to "biu" and "ciu" clocks for the bus interface unit clock and
    36	      the card interface unit clock.
    37	
    38	  clock-names:
    39	    minItems: 2
    40	    items:
    41	      - const: biu
    42	      - const: ciu
    43	      - const: vp0
    44	      - const: vp1
    45	    description:
  > 46	      "vp0" and "vp1" are used to control the clock phases.
    47	
    48	  power-domains:
    49	    maxItems: 1
    50	
    51	  resets:
    52	    maxItems: 1
    53	
    54	  reset-names:
    55	    const: reset
    56	
    57	  speed-step:
    58	    maxItems: 1
    59	    description:
    60		"speed-step" represents the bus speed mode of emmc. "3" means HS400,
    61		"2" means HS200, "0" means HS.
    62	
    63	  pinctrl-names:
    64	    maxItems: 10
    65	    items:
    66	      - const: default
    67	      - const: sdr50
    68	      - const: ddr50
    69	      - const: hs200
    70	      - const: hs400
    71	      - const: tune0
    72	      - const: tune1
    73	      - const: tune2
    74	      - const: tune3
    75	      - const: tune4
    76	
    77	required:
    78	  - compatible
    79	  - reg
    80	  - interrupts
    81	  - clocks
    82	  - clock-names
    83	  - pinctrl-names
    84	  - pinctrl
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
