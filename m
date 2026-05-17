Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7343E10F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778977391; cv=none; b=b3mwkELLIeWhFkM+hD6hVku0ilYK+LFHhOcaG/B+D//EG6OH9WHWm27eOylJoRoEzO2ypSzGD4DRkSHx4/l6LkuFm584aMujzHF95KR97dGr2OXIAVxh7CQxSXYIPM3JRYXDywHyIYKwX3jTpn0YPqIGbIap9/20dHAmyhXOv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778977391; c=relaxed/simple;
	bh=Iv3Gkt6t/PRrmNON55qGwdk4dO+YMyl0miYtUvsCXkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UlSO5uf5LJh1kqNUE9XpWzSr7BLuJeAd9oBDjZM+2bHInsB8Sv3MGzaeEUBSBLBEpT1VyAXCRknV+sQ+7MX2aZ0phRa3wj1zWKE4tf/8WwHVIXRgIHmmWy+pxu2sDkYl3SzMg624jeKb3DmrJkbSuKspAJTwSJvYcn86GoRhM1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0Feor6K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0Feor6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778977388; x=1810513388;
  h=date:from:to:cc:subject:message-id;
  bh=Iv3Gkt6t/PRrmNON55qGwdk4dO+YMyl0miYtUvsCXkM=;
  b=l0Feor6K9MZRP23FA9uK6145XS87boartTwiAq80CHNDPY/U00HK05nT
   BxEgJ/lQsig7gZCm1pjppAnKMk0uSWDf7r2Ep8nLp8hGfk8IAyLNhfrk0
   k2d608BHGuo0++YA0YcCL4z8ezm2j1G8Pl2/FoLuZ69jUU88zvD0w2kzL
   u2D85roxatLnM59GLeRoWA8uAs6k1xsnFiKkjVzenhiWoVRtVhq/yGfgI
   jh8SEvkoWUpJbNndB4taKDjMKE7+kFqZ32ZWXBq+ATchDJI89k+VkHBxu
   l9t1qO+ts9l9G7fpZtt9bgqy5rBcHNIPbI7Ja+BdyyO5TGd3esQgYrnlT
   A==;
X-CSE-ConnectionGUID: ZUWCweXgTcqVZ3yOK+MfSQ==
X-CSE-MsgGUID: KX3qYezUTaSZpSkQdpWQrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="80053543"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="80053543"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 17:23:08 -0700
X-CSE-ConnectionGUID: rdGiXO7tSjeVmiv8oFltJw==
X-CSE-MsgGUID: S0ZEuwFgSSSVdhI98bVBrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="269407321"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 May 2026 17:23:07 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOPHc-000000001FC-0WT5;
	Sun, 17 May 2026 00:23:04 +0000
Date: Sun, 17 May 2026 08:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cbeznea:at91-next 6/8] drivers/clk/at91/dt-compat.c:594:3:
 error: use of undeclared identifier 'charecteristics'; did you mean
 'characteristics'?
Message-ID: <202605170820.tDwQCBtM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/claudiubeznea/linux.git at91-next
head:   f52da2147731872899626a0e61faa2b951049cc9
commit: 1d2563715880d5e865190b68f29fd98f93da717b [6/8] clk: at91: use kzalloc_flex
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260517/202605170820.tDwQCBtM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170820.tDwQCBtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170820.tDwQCBtM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/at91/sama5d3.c:28:12: error: flexible array requires brace-enclosed initializer
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   1 error generated.
--
>> drivers/clk/at91/dt-compat.c:594:3: error: use of undeclared identifier 'charecteristics'; did you mean 'characteristics'?
     594 |                 charecteristics->output[i].min = tmp;
         |                 ^~~~~~~~~~~~~~~
         |                 characteristics
   drivers/clk/at91/dt-compat.c:553:34: note: 'characteristics' declared here
     553 |         struct clk_pll_characteristics *characteristics;
         |                                         ^
   drivers/clk/at91/dt-compat.c:599:3: error: use of undeclared identifier 'charecteristics'; did you mean 'characteristics'?
     599 |                 charecteristics->output[i].max = tmp;
         |                 ^~~~~~~~~~~~~~~
         |                 characteristics
   drivers/clk/at91/dt-compat.c:553:34: note: 'characteristics' declared here
     553 |         struct clk_pll_characteristics *characteristics;
         |                                         ^
   2 errors generated.
--
>> drivers/clk/at91/sama5d4.c:28:12: error: flexible array requires brace-enclosed initializer
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   1 error generated.
--
>> drivers/clk/at91/sama5d2.c:28:12: error: flexible array requires brace-enclosed initializer
      28 |         .output = plla_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   1 error generated.
--
>> drivers/clk/at91/sama7d65.c:139:12: error: flexible array requires brace-enclosed initializer
     139 |         .output = cpu_pll_outputs,
         |                   ^~~~~~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   drivers/clk/at91/sama7d65.c:148:12: error: flexible array requires brace-enclosed initializer
     148 |         .output = pll_outputs,
         |                   ^~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   drivers/clk/at91/sama7d65.c:156:12: error: flexible array requires brace-enclosed initializer
     156 |         .output = lvdspll_outputs,
         |                   ^~~~~~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   drivers/clk/at91/sama7d65.c:164:12: error: flexible array requires brace-enclosed initializer
     164 |         .output = upll_outputs,
         |                   ^~~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   4 errors generated.
--
>> drivers/clk/at91/sama7g5.c:114:12: error: flexible array requires brace-enclosed initializer
     114 |         .output = cpu_pll_outputs,
         |                   ^~~~~~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   drivers/clk/at91/sama7g5.c:123:12: error: flexible array requires brace-enclosed initializer
     123 |         .output = pll_outputs,
         |                   ^~~~~~~~~~~
   drivers/clk/at91/pmc.h:83:19: note: initialized flexible array member 'output' is here
      83 |         struct clk_range output[] __counted_by(num_output);
         |                          ^
   2 errors generated.


vim +594 drivers/clk/at91/dt-compat.c

   527	
   528	static void __init of_at91rm9200_clk_periph_setup(struct device_node *np)
   529	{
   530		of_at91_clk_periph_setup(np, PERIPHERAL_AT91RM9200);
   531	}
   532	CLK_OF_DECLARE(at91rm9200_clk_periph, "atmel,at91rm9200-clk-peripheral",
   533		       of_at91rm9200_clk_periph_setup);
   534	
   535	static void __init of_at91sam9x5_clk_periph_setup(struct device_node *np)
   536	{
   537		of_at91_clk_periph_setup(np, PERIPHERAL_AT91SAM9X5);
   538	}
   539	CLK_OF_DECLARE(at91sam9x5_clk_periph, "atmel,at91sam9x5-clk-peripheral",
   540		       of_at91sam9x5_clk_periph_setup);
   541	
   542	static struct clk_pll_characteristics * __init
   543	of_at91_clk_pll_get_characteristics(struct device_node *np)
   544	{
   545		int i;
   546		int offset;
   547		u32 tmp;
   548		int num_output;
   549		u32 num_cells;
   550		struct clk_range input;
   551		u8 *out = NULL;
   552		u16 *icpll = NULL;
   553		struct clk_pll_characteristics *characteristics;
   554	
   555		if (of_at91_get_clk_range(np, "atmel,clk-input-range", &input))
   556			return NULL;
   557	
   558		if (of_property_read_u32(np, "#atmel,pll-clk-output-range-cells",
   559					 &num_cells))
   560			return NULL;
   561	
   562		if (num_cells < 2 || num_cells > 4)
   563			return NULL;
   564	
   565		num_output = of_property_count_u32_elems(np, "atmel,pll-clk-output-ranges");
   566		if (num_output <= 0)
   567			return NULL;
   568		num_output /= num_cells;
   569	
   570		characteristics = kzalloc_flex(*characteristics, output, num_output);
   571		if (!characteristics)
   572			return NULL;
   573	
   574		characteristics->num_output = num_output;
   575	
   576		if (num_cells > 2) {
   577			out = kcalloc(num_output, sizeof(*out), GFP_KERNEL);
   578			if (!out)
   579				goto out_free_output;
   580		}
   581	
   582		if (num_cells > 3) {
   583			icpll = kcalloc(num_output, sizeof(*icpll), GFP_KERNEL);
   584			if (!icpll)
   585				goto out_free_output;
   586		}
   587	
   588		for (i = 0; i < num_output; i++) {
   589			offset = i * num_cells;
   590			if (of_property_read_u32_index(np,
   591						       "atmel,pll-clk-output-ranges",
   592						       offset, &tmp))
   593				goto out_free_output;
 > 594			charecteristics->output[i].min = tmp;
   595			if (of_property_read_u32_index(np,
   596						       "atmel,pll-clk-output-ranges",
   597						       offset + 1, &tmp))
   598				goto out_free_output;
   599			charecteristics->output[i].max = tmp;
   600	
   601			if (num_cells == 2)
   602				continue;
   603	
   604			if (of_property_read_u32_index(np,
   605						       "atmel,pll-clk-output-ranges",
   606						       offset + 2, &tmp))
   607				goto out_free_output;
   608			out[i] = tmp;
   609	
   610			if (num_cells == 3)
   611				continue;
   612	
   613			if (of_property_read_u32_index(np,
   614						       "atmel,pll-clk-output-ranges",
   615						       offset + 3, &tmp))
   616				goto out_free_output;
   617			icpll[i] = tmp;
   618		}
   619	
   620		characteristics->input = input;
   621		characteristics->out = out;
   622		characteristics->icpll = icpll;
   623		return characteristics;
   624	
   625	out_free_output:
   626		kfree(icpll);
   627		kfree(out);
   628		kfree(characteristics);
   629		return NULL;
   630	}
   631	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
