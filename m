Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96223BF91
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 03:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767930063; cv=none; b=IoK1FZYC39SxQKif0zzHEr0ZAY5MCC+skWtUhaum6Qte0aUenHDYMwZQM8Yt0uI2/9F/jVxxqYL+HY0GkXMpkxsAEKrY3964Wwo+8y6CHEkisK1zhHnV6XjMm2fVyl20wagLoVouC8gguE3j304BfVStMTZKAjDwRxOAe2gb0A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767930063; c=relaxed/simple;
	bh=6cwLbz9qoYSuw+040sLsZvoHEFn0T+lobDWMKOyCc9Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gj9uYGEoU3/IOmRAoRArHn1W4fkWxxhlYqvBYTYohN3y+Q2QlUBO/irMOyKhtNIomPHJXfhhutxnTbAsBYP6nfZ64Cu4Rq96u84NPV2AHDBjfzqUwEF8IJXMqkpLEBXrjqdCxUfU2XrQPObmD/QIAkDdgR+0euPaWdo1dRBcPSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwcaGfOV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwcaGfOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767930060; x=1799466060;
  h=date:from:to:cc:subject:message-id;
  bh=6cwLbz9qoYSuw+040sLsZvoHEFn0T+lobDWMKOyCc9Y=;
  b=dwcaGfOVPx+mH3VVyXacZXSV7sfUKMC+DyYJeoLhpLG2S8WVtWwI6DLP
   pHfGIdZ45qJ8G4jNnttUgj56eo5CC/ZCQiS5bTwH3OIbRJj7ENbcQG6D0
   VYrVRnLBr+AgioJ9JEIlPpd0NJql6UOAxifUfnzM8PT5VLoisZGA/GM03
   MNslMzgLZE4pZhAfsJHfYU5pu0dqqx4QLysCdbHheEiaWlcxtVQeBbXpk
   jFQsIbKoHjShNMI0rI3g1uIo33dcTN7hauT3yeJ0G3748D8XfWTWjTtuh
   Vnl1X/NXe45r52413nUdcT+AlIo+gw5eU4OP5fCplydvYW4UGXR+JevsA
   g==;
X-CSE-ConnectionGUID: WyDx6VqXSZuTLP9GVhs66g==
X-CSE-MsgGUID: 6WmBSpMWQfi2wmwDWcgn5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86901659"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="86901659"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 19:40:59 -0800
X-CSE-ConnectionGUID: FMLeZCn7R36MqMEaScFuwg==
X-CSE-MsgGUID: GFRTlYQXSjOYqHEOzNF5sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203398376"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 19:40:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve3Mt-000000005RK-2Zsh;
	Fri, 09 Jan 2026 03:40:55 +0000
Date: Fri, 09 Jan 2026 11:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:clk-divider-round-rate 20/24]
 drivers/clk/stm32/clk-stm32-core.c:437:14: warning: unused variable 'rate'
Message-ID: <202601091135.nTdFBXKb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux clk-divider-round-rate
head:   9eb89e7dd5ecfeccd15287f3febc64260d269304
commit: bf2cd5c0bd6b682ce3e91c81cb806eb4d8c985f7 [20/24] clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
config: arm-randconfig-002-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091135.nTdFBXKb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091135.nTdFBXKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091135.nTdFBXKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/stm32/clk-stm32-core.c: In function 'clk_stm32_divider_determine_rate':
   drivers/clk/stm32/clk-stm32-core.c:372:57: error: passing argument 2 of 'divider_ro_determine_rate' makes pointer from integer without a cast [-Wint-conversion]
     372 |                 return divider_ro_determine_rate(hw, req->rate,
         |                                                      ~~~^~~~~~
         |                                                         |
         |                                                         long unsigned int
   In file included from drivers/clk/stm32/clk-stm32-core.h:7,
                    from drivers/clk/stm32/clk-stm32-core.c:17:
   include/linux/clk-provider.h:753:75: note: expected 'struct clk_rate_request *' but argument is of type 'long unsigned int'
     753 | int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/clk/stm32/clk-stm32-core.c:373:50: error: passing argument 3 of 'divider_ro_determine_rate' from incompatible pointer type [-Wincompatible-pointer-types]
     373 |                                                  &req->best_parent_rate,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  long unsigned int *
   include/linux/clk-provider.h:754:59: note: expected 'const struct clk_div_table *' but argument is of type 'long unsigned int *'
     754 |                               const struct clk_div_table *table, u8 width,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/stm32/clk-stm32-core.c:374:57: error: passing argument 4 of 'divider_ro_determine_rate' makes integer from pointer without a cast [-Wint-conversion]
     374 |                                                  divider->table,
         |                                                  ~~~~~~~^~~~~~~
         |                                                         |
         |                                                         const struct clk_div_table *
   include/linux/clk-provider.h:754:69: note: expected 'u8' {aka 'unsigned char'} but argument is of type 'const struct clk_div_table *'
     754 |                               const struct clk_div_table *table, u8 width,
         |                                                                  ~~~^~~~~
   drivers/clk/stm32/clk-stm32-core.c:372:24: error: too many arguments to function 'divider_ro_determine_rate'; expected 6, have 7
     372 |                 return divider_ro_determine_rate(hw, req->rate,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   ......
     376 |                                                  divider->flags, val);
         |                                                                  ~~~
   include/linux/clk-provider.h:753:5: note: declared here
     753 | int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/stm32/clk-stm32-core.c: In function 'clk_stm32_composite_determine_rate':
>> drivers/clk/stm32/clk-stm32-core.c:437:14: warning: unused variable 'rate' [-Wunused-variable]
     437 |         long rate;
         |              ^~~~


vim +/rate +437 drivers/clk/stm32/clk-stm32-core.c

5f0d47213f52c0 Gabriel Fernandez 2022-05-16  431  
06ed0fc0fbacee Maxime Ripard     2023-05-05  432  static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
06ed0fc0fbacee Maxime Ripard     2023-05-05  433  					      struct clk_rate_request *req)
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  434  {
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  435  	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  436  	const struct stm32_div_cfg *divider;
790437bbe0ef7e Dan Carpenter     2023-10-10 @437  	long rate;
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  438  
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  439  	if (composite->div_id == NO_STM32_DIV)
06ed0fc0fbacee Maxime Ripard     2023-05-05  440  		return 0;
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  441  
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  442  	divider = &composite->clock_data->dividers[composite->div_id];
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  443  
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  444  	/* if read only, just return current value */
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  445  	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  446  		u32 val;
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  447  
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  448  		val =  readl(composite->base + divider->offset) >> divider->shift;
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  449  		val &= clk_div_mask(divider->width);
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  450  
bf2cd5c0bd6b68 Brian Masney      2026-01-07  451  		return divider_ro_determine_rate(hw, req, divider->table,
bf2cd5c0bd6b68 Brian Masney      2026-01-07  452  						 divider->width, divider->flags,
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  453  						 val);
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  454  	}
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  455  
98da9eb1b5ba50 Brian Masney      2026-01-07  456  	return divider_determine_rate(hw, req, divider->table, divider->width,
98da9eb1b5ba50 Brian Masney      2026-01-07  457  				      divider->flags);
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  458  }
5f0d47213f52c0 Gabriel Fernandez 2022-05-16  459  

:::::: The code at line 437 was first introduced by commit
:::::: 790437bbe0ef7e5cb5d091dd711c0d61d03945a5 clk: stm32: Fix a signedness issue in clk_stm32_composite_determine_rate()

:::::: TO: Dan Carpenter <dan.carpenter@linaro.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
