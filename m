Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2F649BD7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053657; cv=none; b=RzmUDZIKB36XrW8LVdOdwPvJ0m5lB411jrMrJZp7CkPBrIERXsbf7xEhoEdAtCCGnxliGvKQMzsTSRFY3o5l8TenOD5jqn+xALatKUiOx+MtPDvUmLsrmPtsslXgpU0wx7oETeV3Np2Pjicj36F8HLtjEOiXQNlaouQ+8+aeDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053657; c=relaxed/simple;
	bh=2trqB/Eot1zYhsfOyN2Wuwuf/ded3hZpU75txl+9KYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H4C36JTLvnS/eGJFq99tmspTIkp7aCOOq/JNJOsXIObC6xf9tw8u3Y1vuSh4gguSKU0h6U5aRu7+sIxTc9QcwsSgHMk3tVXW6bPYxCqKgWdD21Z3u+ImB6hbOBSqX5KxTZsrEHkodVtEeF0V2CCPw8+eAdRrOVbguvmK3IP5sCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKboC7lq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKboC7lq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789053651; x=1820589651;
  h=date:from:to:cc:subject:message-id;
  bh=2trqB/Eot1zYhsfOyN2Wuwuf/ded3hZpU75txl+9KYM=;
  b=bKboC7lqhXj15YleMMSiKZ+B9cmU4VqmRGiffvM1dv4Uu0TfCkKxw5H7
   pGTFYSAnHhYPX/10hhHw9CmuLS4qpsjGX1279S9psUjiY3CDjzDBCIuBA
   QxYCBnMmgylAfEab6wf+wnSZ46tsiFlpQZMKbVbXEYLxiylIJ23q3FgVw
   zp2rk4t2fsJif88Z2SNHy3eDGPyXB+J3Aco4kI6qzq/ELsLMam1bu9CYq
   Ugj9wgdiU77ipGB/hqzAvQvnhUYSF5y1uiIgTnju0Aj/4wC1U7st21Mnl
   8IEjwSK1NJoz6NRHaXVe0KCAplAVNwGTxuMGMH7PC08Jh24P+f0fw5u4p
   A==;
X-CSE-ConnectionGUID: IJrDns4dS1ClgnBJwjPtxQ==
X-CSE-MsgGUID: YNZhpKs3RsCy/Q8LMt+31A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89349988"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89349988"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:20:49 -0700
X-CSE-ConnectionGUID: IVXtvBL3RCaXYGL5rVQI9A==
X-CSE-MsgGUID: hKKaIC8iSCG2NBQ0cESXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="296650480"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2026 08:20:47 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gZw-000000000C7-3F7n;
	Thu, 10 Sep 2026 15:20:44 +0000
Date: Thu, 10 Sep 2026 22:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:renesas-clk-for-v7.4 16/16]
 drivers/clk/renesas/r9a09g077-cpg.c:966:16: error: cleanup argument not a
 function
Message-ID: <202609102224.XUOQcfuF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.4
head:   810b8b6c4e02c40991c29491cec09ebdaf5ec6d0
commit: 810b8b6c4e02c40991c29491cec09ebdaf5ec6d0 [16/16] clk: renesas: r9a09g077: Register SYSC regmap
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609102224.XUOQcfuF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609102224.XUOQcfuF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609102224.XUOQcfuF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/renesas/r9a09g077-cpg.c: In function 'r9a09g077_post_init':
>> drivers/clk/renesas/r9a09g077-cpg.c:966:16: error: cleanup argument not a function
     966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
         |                ^~~~~~~~~~~~~
>> drivers/clk/renesas/r9a09g077-cpg.c:966:58: error: implicit declaration of function 'kzalloc_obj' [-Wimplicit-function-declaration]
     966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
         |                                                          ^~~~~~~~~~~
>> drivers/clk/renesas/r9a09g077-cpg.c:966:58: error: initialization of 'struct regmap_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]


vim +966 drivers/clk/renesas/r9a09g077-cpg.c

   963	
   964	static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
   965	{
 > 966		struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
   967		struct r9a09g077_sysc_reg *sysc_reg;
   968		struct regmap *regmap;
   969		struct resource res;
   970		int ret;
   971	
   972		/*
   973		 * Return early if the SYSC sizes are not as expected, for backwards
   974		 * compatibility with older device trees that only expose the 64 KiB
   975		 * CPG register window.
   976		 */
   977		ret = of_address_to_resource(dev->of_node, 0, &res);
   978		if (ret)
   979			return ret;
   980		if (resource_size(&res) != RZT2H_CPG_REG_SIZE)
   981			return 0;
   982	
   983		ret = of_address_to_resource(dev->of_node, 1, &res);
   984		if (ret)
   985			return ret;
   986		if (resource_size(&res) != RZT2H_CPG_REG_SIZE)
   987			return 0;
   988	
   989		if (!regmap_cfg)
   990			return -ENOMEM;
   991	
   992		sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
   993		if (!sysc_reg)
   994			return -ENOMEM;
   995	
   996		/* Only allow access in the SYSC regions */
   997		sysc_reg->base[0] = pub->base0 + RZT2H_SYSC_OFFSET;
   998		sysc_reg->base[1] = pub->base1 + RZT2H_SYSC_OFFSET;
   999	
  1000		regmap_cfg->name = "rzt2h_sysc";
  1001		regmap_cfg->reg_bits = 32;
  1002		regmap_cfg->reg_stride = 4;
  1003		regmap_cfg->val_bits = 32;
  1004		regmap_cfg->fast_io = true;
  1005		regmap_cfg->max_register = RZT2H_SYSC_SIZE - 1;
  1006		regmap_cfg->readable_reg = r9a09g077_writeable_readable_sysc;
  1007		regmap_cfg->writeable_reg = r9a09g077_writeable_readable_sysc;
  1008	
  1009		regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, sysc_reg, regmap_cfg);
  1010		if (IS_ERR(regmap))
  1011			return PTR_ERR(regmap);
  1012	
  1013		return of_syscon_register_regmap(dev->of_node, regmap);
  1014	}
  1015	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
