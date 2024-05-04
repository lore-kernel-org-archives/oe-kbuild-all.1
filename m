Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9933C11C83
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714819468; cv=none; b=iRzvq2bdZEglEYdzpPnZaDkOKIlPBz7uFv/C2qYYqX5VDJ9wGLPuq60RlqopSFacOkqo59K0BZpDiXCV4+NpX501USx2IRrUbY+ESUxC2KXEkTiPr8/wjNfenh6zVflxpP3C+m3e8kbYMQvrHJO8UhoRLPGsZJpVFie3N7sGKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714819468; c=relaxed/simple;
	bh=DQny5GxwTOEQc4dkuIkAS6uJwK9PmRgPvhcyB+9qJLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShILZYWiYML1h0vPBwsle4AWA9Y8Q6FFNDJGdRytR80o4wwj4s1lBGmR8xBFPS8W+Hna/sFUOUz1WcG9CgASyrd9HyK6/XRbh1F+X8PPZss9dyoagodQ/st67eoedOFrGoxzy3xvjjArl8EsHB58hu1IXPJHr3+Tm011lG3SKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g12YssVw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g12YssVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714819467; x=1746355467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQny5GxwTOEQc4dkuIkAS6uJwK9PmRgPvhcyB+9qJLo=;
  b=g12YssVwcthYmRktPafZsi2MhMVv9Y9iKz9CTgK2rkDONu80tWnpYN3r
   XwaFI8llnWVAtEjH0xkgM2zH9QY2Re1/muevyEkA+OIQ25kbZV+NWPXm/
   O2yIGb6GuQ/niNLzzA4to5NZl96xmENdG1xJFrrbNGJXwwOJnT2gK8kG9
   Zp3Vd6WCHgS5zBuDe+zx0Wg8D83t3ke5rkVuXRuaeqitUH7cXP4aL7qHq
   63wXdXlrUYy5GP9rl1ZDkpJM4bWW1K47+wlvqm3GclNHQg9v6jFkOF2y7
   2d6ypZ4qbbbl0V2veUJygZ9At4TwpNe1t13TbsZ3p4nYTM+dP+2QMT0Br
   w==;
X-CSE-ConnectionGUID: 21tyQGPLRla+MSSGedNrXA==
X-CSE-MsgGUID: 0JJluUWLRu2WiORH3c33iA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10749413"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="10749413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 03:44:26 -0700
X-CSE-ConnectionGUID: rMy/COK8RH+ru0YirTcyIA==
X-CSE-MsgGUID: +wnhgg4DTCCYuXTHC1EpWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="27662580"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 May 2024 03:44:25 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3CsQ-000CgI-2L;
	Sat, 04 May 2024 10:44:22 +0000
Date: Sat, 4 May 2024 18:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 130/1143]
 drivers/clk/clk-ast2700.c:133:16: warning: no previous prototype for
 function 'ast2700_calc_mpll'
Message-ID: <202405041846.PdTZwnIF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: d3ae9642003754e62475a7e3a3f5844a319f05e9 [130/1143] clk: add support for ast2700
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240504/202405041846.PdTZwnIF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041846.PdTZwnIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041846.PdTZwnIF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-ast2700.c:110:16: warning: no previous prototype for function 'ast2700_cpu_hw_pll' [-Wmissing-prototypes]
     110 | struct clk_hw *ast2700_cpu_hw_pll(const char *name, const char *parent_name,
         |                ^
   drivers/clk/clk-ast2700.c:110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     110 | struct clk_hw *ast2700_cpu_hw_pll(const char *name, const char *parent_name,
         | ^
         | static 
>> drivers/clk/clk-ast2700.c:133:16: warning: no previous prototype for function 'ast2700_calc_mpll' [-Wmissing-prototypes]
     133 | struct clk_hw *ast2700_calc_mpll(const char *name, const char *parent_name,
         |                ^
   drivers/clk/clk-ast2700.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     133 | struct clk_hw *ast2700_calc_mpll(const char *name, const char *parent_name,
         | ^
         | static 
   drivers/clk/clk-ast2700.c:182:16: warning: no previous prototype for function 'ast2700_calc_io_pll' [-Wmissing-prototypes]
     182 | struct clk_hw *ast2700_calc_io_pll(const char *name, const char *parent_name,
         |                ^
   drivers/clk/clk-ast2700.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | struct clk_hw *ast2700_calc_io_pll(const char *name, const char *parent_name,
         | ^
         | static 
   3 warnings generated.


vim +/ast2700_calc_mpll +133 drivers/clk/clk-ast2700.c

   131	
   132	/* MPLL 1600Mhz(default) */
 > 133	struct clk_hw *ast2700_calc_mpll(const char *name, const char *parent_name,
   134					u32 val)
   135	{
   136		unsigned int mult, div;
   137	
   138		if (val & BIT(24)) {
   139			/* Pass through mode */
   140			mult = div = 1;
   141		} else {
   142			/* F = CLKIN(25MHz) * [CLKF/(CLKR+1)] /(CLKOD+1) */
   143			u32 m = val & 0x1fff;
   144			u32 n = (val >> 13) & 0x3f;
   145			u32 p = (val >> 19) & 0xf;
   146	
   147			mult = m / (n + 1);
   148			div = (p + 1);
   149		}
   150		return clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mult,
   151						    div);
   152	};
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
