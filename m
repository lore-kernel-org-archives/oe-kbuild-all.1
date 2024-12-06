Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3720628E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733503918; cv=none; b=tKOlR3eya3X7f1gIHEptQJ1hZ9vPNYR1cjWyc34+605WJICoLqFlTEp0t5Q0I5FNgfrS6IpLtKSo85xWCbMl7KhFKQicxvBKmImSM82qIMDDxEmHveYBgmT5yzFx1bZs/Klq/8opE18KbtaifQZK2+ujb3vX30tGzKDdocMgqiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733503918; c=relaxed/simple;
	bh=rj6+QSPRmjGIetUpikz8P2E3lVFKWUaPChyzdQfrDFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzGPs2KjVXhq6XN/GDBNb3hjlClLO8c6SFXDLEcvIPVFhur7lCERBM8fxZPM2dcknjRqGnW+T1iSTEpm4sf0sBAG8Jm2LZKzJFweeJM5Yjx+iHcA5LjvB1R+1ahCAobRaqsmkkOrXZFrHE7TzOD28YaxMAubxOI1TKfciGAfPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxLAPJME; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxLAPJME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733503916; x=1765039916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rj6+QSPRmjGIetUpikz8P2E3lVFKWUaPChyzdQfrDFI=;
  b=fxLAPJMEOP+P1pnGwyruJQkg6Qd8sV6hN2VFiyMSrseGquwK3muneuMB
   fn0/Mw/xfIFVW6iSBYPQRy2XY4mRHnuPaYevF2ygPK9b9rhRlhiuL3meb
   95gbJnOq0xSGOPyv7zjHgHHvYaHDssx5mxIOAsEl/qUC542PbtFc6piYe
   hmfdv3nmHC8ANd15OmYU9LaLjf5xu3TQmuHUEcpLPZ8yhieNEsM16hNWO
   xDHexJbIbZSLHghuAOigxunmDnTEKp9A8IVmeeRGTCfSsFex/vqFGanNz
   ol8kXeLmJe/5JFk9iZD/LTcpMe1eJV4ZT6c0TK795Tn9uxeR1AJV1ca2b
   g==;
X-CSE-ConnectionGUID: yT25B0vqRI+J9m4sAUf7Sg==
X-CSE-MsgGUID: Z8EWn/f9Spy9DJ2SL4psyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33746613"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="33746613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 08:51:56 -0800
X-CSE-ConnectionGUID: sI0SjhP3STG4VeqYFmZdUw==
X-CSE-MsgGUID: XiqwZIumR7Kb6Tm+S4zU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="125292398"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2024 08:51:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJbYW-00025n-05;
	Fri, 06 Dec 2024 16:51:52 +0000
Date: Sat, 7 Dec 2024 00:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:syscon-rework-2 10/11]
 drivers/clk/renesas/rcar-gen2-cpg.c:237:49: error: 'clk_divider_ops'
 undeclared; did you mean 'clk_divider'?
Message-ID: <202412070015.CrPvTayq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework-2
head:   42a4c7e62a39fecc74b811e4faae3e4d65417107
commit: ba1fb44a6ae9fb8e6a74076ace1323094388aca5 [10/11] clk: divider, gate: trivially implement regmaps
config: arc-randconfig-002-20241206 (https://download.01.org/0day-ci/archive/20241207/202412070015.CrPvTayq-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070015.CrPvTayq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070015.CrPvTayq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/renesas/rcar-gen2-cpg.c: In function 'cpg_adsp_clk_register':
>> drivers/clk/renesas/rcar-gen2-cpg.c:237:49: error: 'clk_divider_ops' undeclared (first use in this function); did you mean 'clk_divider'?
     237 |                                      &div->hw, &clk_divider_ops,
         |                                                 ^~~~~~~~~~~~~~~
         |                                                 clk_divider
   drivers/clk/renesas/rcar-gen2-cpg.c:237:49: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +237 drivers/clk/renesas/rcar-gen2-cpg.c

468389357480f2 Sergei Shtylyov 2016-11-09  207  
468389357480f2 Sergei Shtylyov 2016-11-09  208  static struct clk * __init cpg_adsp_clk_register(const char *name,
468389357480f2 Sergei Shtylyov 2016-11-09  209  						 const char *parent_name,
468389357480f2 Sergei Shtylyov 2016-11-09  210  						 void __iomem *base)
468389357480f2 Sergei Shtylyov 2016-11-09  211  {
468389357480f2 Sergei Shtylyov 2016-11-09  212  	struct clk_divider *div;
468389357480f2 Sergei Shtylyov 2016-11-09  213  	struct clk_gate *gate;
468389357480f2 Sergei Shtylyov 2016-11-09  214  	struct clk *clk;
468389357480f2 Sergei Shtylyov 2016-11-09  215  
468389357480f2 Sergei Shtylyov 2016-11-09  216  	div = kzalloc(sizeof(*div), GFP_KERNEL);
468389357480f2 Sergei Shtylyov 2016-11-09  217  	if (!div)
468389357480f2 Sergei Shtylyov 2016-11-09  218  		return ERR_PTR(-ENOMEM);
468389357480f2 Sergei Shtylyov 2016-11-09  219  
468389357480f2 Sergei Shtylyov 2016-11-09  220  	div->reg = base + CPG_ADSPCKCR;
468389357480f2 Sergei Shtylyov 2016-11-09  221  	div->width = 4;
468389357480f2 Sergei Shtylyov 2016-11-09  222  	div->table = cpg_adsp_div_table;
468389357480f2 Sergei Shtylyov 2016-11-09  223  	div->lock = &cpg_lock;
468389357480f2 Sergei Shtylyov 2016-11-09  224  
468389357480f2 Sergei Shtylyov 2016-11-09  225  	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
468389357480f2 Sergei Shtylyov 2016-11-09  226  	if (!gate) {
468389357480f2 Sergei Shtylyov 2016-11-09  227  		kfree(div);
468389357480f2 Sergei Shtylyov 2016-11-09  228  		return ERR_PTR(-ENOMEM);
468389357480f2 Sergei Shtylyov 2016-11-09  229  	}
468389357480f2 Sergei Shtylyov 2016-11-09  230  
468389357480f2 Sergei Shtylyov 2016-11-09  231  	gate->reg = base + CPG_ADSPCKCR;
468389357480f2 Sergei Shtylyov 2016-11-09  232  	gate->bit_idx = 8;
468389357480f2 Sergei Shtylyov 2016-11-09  233  	gate->flags = CLK_GATE_SET_TO_DISABLE;
468389357480f2 Sergei Shtylyov 2016-11-09  234  	gate->lock = &cpg_lock;
468389357480f2 Sergei Shtylyov 2016-11-09  235  
468389357480f2 Sergei Shtylyov 2016-11-09  236  	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
468389357480f2 Sergei Shtylyov 2016-11-09 @237  				     &div->hw, &clk_divider_ops,
468389357480f2 Sergei Shtylyov 2016-11-09  238  				     &gate->hw, &clk_gate_ops, 0);
468389357480f2 Sergei Shtylyov 2016-11-09  239  	if (IS_ERR(clk)) {
468389357480f2 Sergei Shtylyov 2016-11-09  240  		kfree(gate);
468389357480f2 Sergei Shtylyov 2016-11-09  241  		kfree(div);
468389357480f2 Sergei Shtylyov 2016-11-09  242  	}
468389357480f2 Sergei Shtylyov 2016-11-09  243  
468389357480f2 Sergei Shtylyov 2016-11-09  244  	return clk;
468389357480f2 Sergei Shtylyov 2016-11-09  245  }
468389357480f2 Sergei Shtylyov 2016-11-09  246  

:::::: The code at line 237 was first introduced by commit
:::::: 468389357480f21febb0edfd1482d0fc8f885808 clk: renesas: cpg-mssr: Add common R-Car Gen2 support

:::::: TO: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
:::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
