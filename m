Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7343625DAFC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819112; cv=none; b=Gjf0tDZbm2oMCNhTG0rz6n4nHdmfxpLUsD0unmX1T9ySTo988D2qc2q0lmLTuBydNgl3pKjwF6pGkAgb29M4kVE0whKZ88EsJ8qfrolI1GC/h8vrUHrXWsKQX5uetjLD7VAURPqPotl9cd3QOW0O5R4RKEGZiOGsVzCSeqS0lT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819112; c=relaxed/simple;
	bh=54S6IKNphFQK+gOjP11cWZTWi6EU3Es6q0sG50eCeJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ntor4pEZR2DPx/E4y3SSqarWdT1og3KB4JWifizgsx9DNFOjtHGpAfIehSZ5y6jDL6wd4CZ32q6Ns2RKx/k0oPhpnUuR5olyp7zukK9yrXNO8wSTtxTDjSJzWWxrSHoY67g9XXuJLmYqoSklvnCTtp9uMzO+v6evxMO86UIXjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PA9KhOO/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PA9KhOO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746819110; x=1778355110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54S6IKNphFQK+gOjP11cWZTWi6EU3Es6q0sG50eCeJQ=;
  b=PA9KhOO/IZEljodQJck6/WDSsIUtev7PU7FXB5Bf8xjmk4PsllDNGr98
   6/+m2xukLRv87C1XIKkaBedsETQE55vGsPLFTVP4DzQhRXk6+XtM+F7QO
   iQUX2NW4ezeSMh2wuRFW/iDlI0THPVhf0rwocZojhjefnNbGxVIYwk/NO
   /OIaYpPYyGpjYLLZpH2A3wnxDT74c/FhBY/fAhqqpbUfCEkNqcdYQvr2m
   UaJvnmGrtvo9regtCtA6d7nNmkpDdTcT/gUzaXcaxJRrwS4GT+FB2zu1s
   rEsRez3BDu+gktlpDq4TIkwYhSSCPCrrVybyK3mpv+3kVFbfTivXaF6aO
   Q==;
X-CSE-ConnectionGUID: E+plfqnpSpOqPu3JyMZ6Gw==
X-CSE-MsgGUID: Z33D2XC5TNCHrwihjgS1GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47777524"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="47777524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:31:49 -0700
X-CSE-ConnectionGUID: TmhK6pi2QTevHFATLa5vdQ==
X-CSE-MsgGUID: /H/iUvozQ7OxevrDohEbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136584939"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 May 2025 12:31:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDTRi-000CP5-0r;
	Fri, 09 May 2025 19:31:46 +0000
Date: Sat, 10 May 2025 03:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yao Zi <ziyao@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 9351/10031] drivers/clk/rockchip/clk.c:625:33:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202505100302.YVtB1zhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 621ba4d9f6db560a7406fd732af1b495ff5aa103 [9351/10031] clk: rockchip: Support MMC clocks in GRF region
config: arm-randconfig-r133-20250509 (https://download.01.org/0day-ci/archive/20250510/202505100302.YVtB1zhF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250510/202505100302.YVtB1zhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100302.YVtB1zhF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/rockchip/clk.c:625:33: sparse: sparse: Using plain integer as NULL pointer

vim +625 drivers/clk/rockchip/clk.c

   496	
   497	void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
   498					    struct rockchip_clk_branch *list,
   499					    unsigned int nr_clk)
   500	{
   501		struct regmap *grf = ctx->grf;
   502		struct rockchip_aux_grf *agrf;
   503		struct clk *clk;
   504		unsigned int idx;
   505		unsigned long flags;
   506	
   507		for (idx = 0; idx < nr_clk; idx++, list++) {
   508			flags = list->flags;
   509			clk = NULL;
   510	
   511			/* for GRF-dependent branches, choose the right grf first */
   512			if ((list->branch_type == branch_muxgrf ||
   513			     list->branch_type == branch_grf_gate ||
   514			     list->branch_type == branch_grf_mmc) &&
   515			    list->grf_type != grf_type_sys) {
   516				hash_for_each_possible(ctx->aux_grf_table, agrf, node, list->grf_type) {
   517					if (agrf->type == list->grf_type) {
   518						grf = agrf->grf;
   519						break;
   520					}
   521				}
   522			}
   523	
   524			/* catch simple muxes */
   525			switch (list->branch_type) {
   526			case branch_mux:
   527				if (list->mux_table)
   528					clk = clk_register_mux_table(NULL, list->name,
   529						list->parent_names, list->num_parents,
   530						flags,
   531						ctx->reg_base + list->muxdiv_offset,
   532						list->mux_shift, list->mux_width,
   533						list->mux_flags, list->mux_table,
   534						&ctx->lock);
   535				else
   536					clk = clk_register_mux(NULL, list->name,
   537						list->parent_names, list->num_parents,
   538						flags,
   539						ctx->reg_base + list->muxdiv_offset,
   540						list->mux_shift, list->mux_width,
   541						list->mux_flags, &ctx->lock);
   542				break;
   543			case branch_muxgrf:
   544				clk = rockchip_clk_register_muxgrf(list->name,
   545					list->parent_names, list->num_parents,
   546					flags, grf, list->muxdiv_offset,
   547					list->mux_shift, list->mux_width,
   548					list->mux_flags);
   549				break;
   550			case branch_divider:
   551				if (list->div_table)
   552					clk = clk_register_divider_table(NULL,
   553						list->name, list->parent_names[0],
   554						flags,
   555						ctx->reg_base + list->muxdiv_offset,
   556						list->div_shift, list->div_width,
   557						list->div_flags, list->div_table,
   558						&ctx->lock);
   559				else
   560					clk = clk_register_divider(NULL, list->name,
   561						list->parent_names[0], flags,
   562						ctx->reg_base + list->muxdiv_offset,
   563						list->div_shift, list->div_width,
   564						list->div_flags, &ctx->lock);
   565				break;
   566			case branch_fraction_divider:
   567				clk = rockchip_clk_register_frac_branch(ctx, list->name,
   568					list->parent_names, list->num_parents,
   569					ctx->reg_base, list->muxdiv_offset,
   570					list->div_flags,
   571					list->gate_offset, list->gate_shift,
   572					list->gate_flags, flags, list->child,
   573					&ctx->lock);
   574				break;
   575			case branch_half_divider:
   576				clk = rockchip_clk_register_halfdiv(list->name,
   577					list->parent_names, list->num_parents,
   578					ctx->reg_base, list->muxdiv_offset,
   579					list->mux_shift, list->mux_width,
   580					list->mux_flags, list->div_shift,
   581					list->div_width, list->div_flags,
   582					list->gate_offset, list->gate_shift,
   583					list->gate_flags, flags, &ctx->lock);
   584				break;
   585			case branch_gate:
   586				flags |= CLK_SET_RATE_PARENT;
   587	
   588				clk = clk_register_gate(NULL, list->name,
   589					list->parent_names[0], flags,
   590					ctx->reg_base + list->gate_offset,
   591					list->gate_shift, list->gate_flags, &ctx->lock);
   592				break;
   593			case branch_grf_gate:
   594				flags |= CLK_SET_RATE_PARENT;
   595				clk = rockchip_clk_register_gate_grf(list->name,
   596					list->parent_names[0], flags, grf,
   597					list->gate_offset, list->gate_shift,
   598					list->gate_flags);
   599				break;
   600			case branch_composite:
   601				clk = rockchip_clk_register_branch(list->name,
   602					list->parent_names, list->num_parents,
   603					ctx->reg_base, list->muxdiv_offset,
   604					list->mux_shift,
   605					list->mux_width, list->mux_flags,
   606					list->mux_table, list->div_offset,
   607					list->div_shift, list->div_width,
   608					list->div_flags, list->div_table,
   609					list->gate_offset, list->gate_shift,
   610					list->gate_flags, flags, &ctx->lock);
   611				break;
   612			case branch_mmc:
   613				clk = rockchip_clk_register_mmc(
   614					list->name,
   615					list->parent_names, list->num_parents,
   616					ctx->reg_base + list->muxdiv_offset,
   617					NULL, 0,
   618					list->div_shift
   619				);
   620				break;
   621			case branch_grf_mmc:
   622				clk = rockchip_clk_register_mmc(
   623					list->name,
   624					list->parent_names, list->num_parents,
 > 625					0,
   626					grf, list->muxdiv_offset,
   627					list->div_shift
   628				);
   629				break;
   630			case branch_inverter:
   631				clk = rockchip_clk_register_inverter(
   632					list->name, list->parent_names,
   633					list->num_parents,
   634					ctx->reg_base + list->muxdiv_offset,
   635					list->div_shift, list->div_flags, &ctx->lock);
   636				break;
   637			case branch_factor:
   638				clk = rockchip_clk_register_factor_branch(
   639					list->name, list->parent_names,
   640					list->num_parents, ctx->reg_base,
   641					list->div_shift, list->div_width,
   642					list->gate_offset, list->gate_shift,
   643					list->gate_flags, flags, &ctx->lock);
   644				break;
   645			case branch_ddrclk:
   646				clk = rockchip_clk_register_ddrclk(
   647					list->name, list->flags,
   648					list->parent_names, list->num_parents,
   649					list->muxdiv_offset, list->mux_shift,
   650					list->mux_width, list->div_shift,
   651					list->div_width, list->div_flags,
   652					ctx->reg_base, &ctx->lock);
   653				break;
   654			case branch_linked_gate:
   655				/* must be registered late, fall-through for error message */
   656				break;
   657			}
   658	
   659			/* none of the cases above matched */
   660			if (!clk) {
   661				pr_err("%s: unknown clock type %d\n",
   662				       __func__, list->branch_type);
   663				continue;
   664			}
   665	
   666			if (IS_ERR(clk)) {
   667				pr_err("%s: failed to register clock %s: %ld\n",
   668				       __func__, list->name, PTR_ERR(clk));
   669				continue;
   670			}
   671	
   672			rockchip_clk_set_lookup(ctx, clk, list->id);
   673		}
   674	}
   675	EXPORT_SYMBOL_GPL(rockchip_clk_register_branches);
   676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
