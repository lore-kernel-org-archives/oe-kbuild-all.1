Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89722D9EF3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953196; cv=none; b=E+mURrabjsMZtHe4gYOXA7OvcNs/7fqHwceq5F8y+cfwRFWzxdj+uHXZ5QbICauQuqv3ql/ui/eFP6zq+oMuwi/dzqS4Ut64PXnp1bsrh94wt1w84Tl5b7dQYQzt2WMSjGJEAbNlPsB8sOheN8FhsmZQxGA2QZ4qT2PZ5415Li0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953196; c=relaxed/simple;
	bh=dVNLGsEhjzyMH5zCyCwHe0TBnaaS+ieMSiJ5T5S71bE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SlSudTljempcxEg1yKkFzkJBkpuXQf3lXkgFn8s5gOZg/TV0SakhZreZi3+WDmueklExb1DCY7sKD6tZ0PXw9dZLVaNRk4OhKEMDfjhLeKi269ZOEGTRY1Ffe9NBmUKHjGx0F4Wmz+jt6/t8Ay6G/K7JpWqvEYB7OhUjCO976SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mubJKFwE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mubJKFwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767953194; x=1799489194;
  h=date:from:to:cc:subject:message-id;
  bh=dVNLGsEhjzyMH5zCyCwHe0TBnaaS+ieMSiJ5T5S71bE=;
  b=mubJKFwE6GvZcWRGGbKd5JXAunMqn4SNpITCCfvkiTZUUXYgPDOoDdxa
   OkJ8O+QQNENvmd6d9OXjTL86GVnPfF/hJDMaLh8YCMkzelrG2+9S4ggSx
   AWzd7dRs+Ki6E86upP+TS6slHbd/8LGh3m/mf9Na/mHaYr4RZS+gjy5ZL
   uI5w6zUkmyvPK3TWXeeHxJwIhA7YbN2zidWU+saLz9fuo6JBUZZ9FRgIs
   abU/8gm/riu3nBxQ4K7i2tq5ViM09KoswZBO7QfmuQKXLHSamRlIl54TC
   G8+KEycN/D5VHTzNFG33wbk3Pc3eyHbNDkSltdav0eawsS0zqQegVG3Z5
   A==;
X-CSE-ConnectionGUID: FgPy21xGRoqjEbbb5G8dpw==
X-CSE-MsgGUID: tfKq3jXbQrCi3kBcqkQ/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69384250"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69384250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:06:33 -0800
X-CSE-ConnectionGUID: BWQsWYuPSMGzJEMGMqhPUQ==
X-CSE-MsgGUID: Bv4YTppOSX6RYcq9byw+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203216687"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jan 2026 02:06:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve9O2-000000005jI-0PWm;
	Fri, 09 Jan 2026 10:06:30 +0000
Date: Fri, 09 Jan 2026 18:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:clk-divider-round-rate 20/24]
 drivers/clk/stm32/clk-stm32-core.c:372:57: error: passing argument 2 of
 'divider_ro_determine_rate' makes pointer from integer without a cast
Message-ID: <202601091726.rESzZopU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux clk-divider-round-rate
head:   9eb89e7dd5ecfeccd15287f3febc64260d269304
commit: bf2cd5c0bd6b682ce3e91c81cb806eb4d8c985f7 [20/24] clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
config: arm-randconfig-002-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091726.rESzZopU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091726.rESzZopU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091726.rESzZopU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/stm32/clk-stm32-core.c: In function 'clk_stm32_divider_determine_rate':
>> drivers/clk/stm32/clk-stm32-core.c:372:57: error: passing argument 2 of 'divider_ro_determine_rate' makes pointer from integer without a cast [-Wint-conversion]
     372 |                 return divider_ro_determine_rate(hw, req->rate,
         |                                                      ~~~^~~~~~
         |                                                         |
         |                                                         long unsigned int
   In file included from drivers/clk/stm32/clk-stm32-core.h:7,
                    from drivers/clk/stm32/clk-stm32-core.c:17:
   include/linux/clk-provider.h:753:75: note: expected 'struct clk_rate_request *' but argument is of type 'long unsigned int'
     753 | int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/clk/stm32/clk-stm32-core.c:373:50: error: passing argument 3 of 'divider_ro_determine_rate' from incompatible pointer type [-Wincompatible-pointer-types]
     373 |                                                  &req->best_parent_rate,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  long unsigned int *
   include/linux/clk-provider.h:754:59: note: expected 'const struct clk_div_table *' but argument is of type 'long unsigned int *'
     754 |                               const struct clk_div_table *table, u8 width,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/clk/stm32/clk-stm32-core.c:374:57: error: passing argument 4 of 'divider_ro_determine_rate' makes integer from pointer without a cast [-Wint-conversion]
     374 |                                                  divider->table,
         |                                                  ~~~~~~~^~~~~~~
         |                                                         |
         |                                                         const struct clk_div_table *
   include/linux/clk-provider.h:754:69: note: expected 'u8' {aka 'unsigned char'} but argument is of type 'const struct clk_div_table *'
     754 |                               const struct clk_div_table *table, u8 width,
         |                                                                  ~~~^~~~~
>> drivers/clk/stm32/clk-stm32-core.c:372:24: error: too many arguments to function 'divider_ro_determine_rate'; expected 6, have 7
     372 |                 return divider_ro_determine_rate(hw, req->rate,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   ......
     376 |                                                  divider->flags, val);
         |                                                                  ~~~
   include/linux/clk-provider.h:753:5: note: declared here
     753 | int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/stm32/clk-stm32-core.c: In function 'clk_stm32_composite_determine_rate':
   drivers/clk/stm32/clk-stm32-core.c:437:14: warning: unused variable 'rate' [-Wunused-variable]
     437 |         long rate;
         |              ^~~~


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
