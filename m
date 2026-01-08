Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D04333372B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 23:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914371; cv=none; b=sfXiZu+fA4db8Iwknt13ntZPQ7lFYZXMJXVfBHkAcMiRfjivNdkS/TASOvVaHexBgCuU3K42rOq/SgoTZNxrCRoJ8fkE8ne+AbAl0Zbve2uWLTQoe1jFRgtY2kutfh4TD5T62J2oY8okK0BAlivj6Bpb1py6ecB2r25j8cIIUo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914371; c=relaxed/simple;
	bh=OTnlbV99kvE0FIdJ3Aw50iQurmfknuBbH3J471/m0Hc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bCJZpIu8mNt9ngovoJksjEqzJiz2BH0KVc2zIMkoRaFwjp4REbU7DbsEhq0UTukMw+PqIBDXF5pzkiBxtckzzeAeSeF00IB/aFj7mgSNamGYevpgTptLJk0qIeSJ3JWEpTCbeLd8h80j8J01jzqm8t+YuDtUZj9ygb68ncIPDFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQK7y+IB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQK7y+IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767914370; x=1799450370;
  h=date:from:to:cc:subject:message-id;
  bh=OTnlbV99kvE0FIdJ3Aw50iQurmfknuBbH3J471/m0Hc=;
  b=JQK7y+IBd3JNs4xDt0RaunwJCQreW+P6O5Q/cHrexxnSAIVyNNfFuG3Q
   wwgXdpTQTuwz4wBhxugALtnOne24oQQ6+wOOeESU2Qx/x50SMxsdFiKgy
   mgyH1ua755Yi/dnAbKX40o4YgRPf5kU7SiXdEwqMdhJ/juOEH8MSskWAe
   bXOZRbmKqd0StJ97mJbtd1wxpqj6ASnhv/Z5fElwlaPHpqEUMq8AlI4+6
   H9IrEwzF5wn3PUnpRmdL6ct4cHY7bb5t8gNkdI38fq0lsWK8dM1ugBB3n
   fQWgkpN5CO449rusnPKgruATOeKUMlXaFZoAjOGEuwQRMYL5cfjOJmEmL
   A==;
X-CSE-ConnectionGUID: xk1aGJ5hTRusNxT+Z7fB5g==
X-CSE-MsgGUID: 9pDqvw2gTgyqAzCgPyGf/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79597540"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="79597540"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 15:19:29 -0800
X-CSE-ConnectionGUID: pcrLeyUFTH6PenRoR3vxjQ==
X-CSE-MsgGUID: eTIPKMm5SD+JX4MCMhcMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203759713"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 15:19:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdzHp-000000005FQ-2oiA;
	Thu, 08 Jan 2026 23:19:25 +0000
Date: Fri, 09 Jan 2026 07:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:clk-divider-round-rate 20/24]
 drivers/clk/stm32/clk-stm32-core.c:372:10: error: too many arguments to
 function 'divider_ro_determine_rate'
Message-ID: <202601090757.xXf5r0Ly-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux clk-divider-round-rate
head:   9eb89e7dd5ecfeccd15287f3febc64260d269304
commit: bf2cd5c0bd6b682ce3e91c81cb806eb4d8c985f7 [20/24] clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
config: arm-randconfig-003-20260109 (https://download.01.org/0day-ci/archive/20260109/202601090757.xXf5r0Ly-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090757.xXf5r0Ly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090757.xXf5r0Ly-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/clk/stm32/clk-stm32-core.c: In function 'clk_stm32_divider_determine_rate':
>> drivers/clk/stm32/clk-stm32-core.c:372:43: warning: passing argument 2 of 'divider_ro_determine_rate' makes pointer from integer without a cast [-Wint-conversion]
      return divider_ro_determine_rate(hw, req->rate,
                                           ~~~^~~~~~
   In file included from drivers/clk/stm32/clk-stm32-core.h:7,
                    from drivers/clk/stm32/clk-stm32-core.c:17:
   include/linux/clk-provider.h:753:75: note: expected 'struct clk_rate_request *' but argument is of type 'long unsigned int'
    int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/clk/stm32/clk-stm32-core.c:373:8: error: passing argument 3 of 'divider_ro_determine_rate' from incompatible pointer type [-Werror=incompatible-pointer-types]
           &req->best_parent_rate,
           ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/stm32/clk-stm32-core.h:7,
                    from drivers/clk/stm32/clk-stm32-core.c:17:
   include/linux/clk-provider.h:754:38: note: expected 'const struct clk_div_table *' but argument is of type 'long unsigned int *'
             const struct clk_div_table *table, u8 width,
             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/clk/stm32/clk-stm32-core.c:374:15: warning: passing argument 4 of 'divider_ro_determine_rate' makes integer from pointer without a cast [-Wint-conversion]
           divider->table,
           ~~~~~~~^~~~~~~
   In file included from drivers/clk/stm32/clk-stm32-core.h:7,
                    from drivers/clk/stm32/clk-stm32-core.c:17:
   include/linux/clk-provider.h:754:48: note: expected 'u8' {aka 'unsigned char'} but argument is of type 'const struct clk_div_table * const'
             const struct clk_div_table *table, u8 width,
                                                ~~~^~~~~
>> drivers/clk/stm32/clk-stm32-core.c:372:10: error: too many arguments to function 'divider_ro_determine_rate'
      return divider_ro_determine_rate(hw, req->rate,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/stm32/clk-stm32-core.h:7,
                    from drivers/clk/stm32/clk-stm32-core.c:17:
   include/linux/clk-provider.h:753:5: note: declared here
    int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/stm32/clk-stm32-core.c: In function 'clk_stm32_composite_determine_rate':
   drivers/clk/stm32/clk-stm32-core.c:437:7: warning: unused variable 'rate' [-Wunused-variable]
     long rate;
          ^~~~
   cc1: some warnings being treated as errors


vim +/divider_ro_determine_rate +372 drivers/clk/stm32/clk-stm32-core.c

   353	
   354	static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
   355						    struct clk_rate_request *req)
   356	{
   357		struct clk_stm32_div *div = to_clk_stm32_divider(hw);
   358		const struct stm32_div_cfg *divider;
   359	
   360		if (div->div_id == NO_STM32_DIV)
   361			return 0;
   362	
   363		divider = &div->clock_data->dividers[div->div_id];
   364	
   365		/* if read only, just return current value */
   366		if (divider->flags & CLK_DIVIDER_READ_ONLY) {
   367			u32 val;
   368	
   369			val =  readl(div->base + divider->offset) >> divider->shift;
   370			val &= clk_div_mask(divider->width);
   371	
 > 372			return divider_ro_determine_rate(hw, req->rate,
 > 373							 &req->best_parent_rate,
 > 374							 divider->table,
   375							 divider->width,
   376							 divider->flags, val);
   377		}
   378	
   379		return divider_determine_rate(hw, req, divider->table, divider->width,
   380					      divider->flags);
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
