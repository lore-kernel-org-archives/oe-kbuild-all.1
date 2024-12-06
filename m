Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FE71F3D30
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 17:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505241; cv=none; b=POvb2sanaFH3q5wC5jFoNUQX2BYZ47pe8CQPnQ4hMG2mNHBkChKMu5liMqLy/sMOrnCprX4HbgLK1NmHnP+lqISrpOpJOKgqEZ5i52T9SvIy6JM0jT5oL6sigiUXYyfstHuLgoxzfyvmoTdbFHOtyaDS0fdJhGDy8q437qvAM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505241; c=relaxed/simple;
	bh=vawEwf+TH8BkZO1mu1GI44E2/898p7NsLZu+4gW+tj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eNH8RklXOYnKbeJLwjiuEDMRXplFbkTrAEDSNVNXscGFjylNFO+OAPT1JSDxMNCgRC424cJCqUT6TQgYEBJUqLBcku8QXYvMjyKQbIN/1wjCVPOw8lcJa6ay54AacG0qfx9N8hFmfPKrwzoejn1Rury7yhI+m+zaPPs+qfPPdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpAlyCrq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpAlyCrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733505240; x=1765041240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vawEwf+TH8BkZO1mu1GI44E2/898p7NsLZu+4gW+tj0=;
  b=hpAlyCrq72dYkqIPl7Ua9kamriofmT9v6yPkOKNSkP9b3fk8vGY8r/mG
   6iO/eIozkSIKp7Ak3f7JFYQuN89jGfKJ5BE+qCjmcw4avo3D08jO/1hqi
   1V/UBBrMWFQUHsn4eVU4QvnLpf/bEtLV2mtqRxYvsyfW0V2DbwdshJBMW
   /60fNzWrXxo0HMazlyiDvcxnqjijffg/3UlufRq2Oi1mWq6aegP2+yNxE
   3BDOYvxL4YztsnxS2zeW1aV4jrhsZaSZbSbjevEgFqZ5PlyOhQbu8mUp+
   A+f59jh43ZesPZuY6aC9EZXRIpiaIDMZwIwTBTod0PnouL8sd8BIzdP9b
   g==;
X-CSE-ConnectionGUID: Q621zU4QQaGTv3HRZgATCA==
X-CSE-MsgGUID: tq/ICZAQQRCcCX7oJv+6tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="56358218"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="56358218"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 09:13:59 -0800
X-CSE-ConnectionGUID: ia6MZPhDQ4iLMR7qCAwzmA==
X-CSE-MsgGUID: OonCq8ggRlycWBMir7x+vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="125364915"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Dec 2024 09:13:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJbtr-00027N-0z;
	Fri, 06 Dec 2024 17:13:55 +0000
Date: Sat, 7 Dec 2024 01:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:syscon-rework-2 10/11] drivers/clk/clk-stm32h7.c:396:25:
 error: use of undeclared identifier 'clk_divider_ops'
Message-ID: <202412070132.6Yh79CsU-lkp@intel.com>
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
config: arm-randconfig-004-20241206 (https://download.01.org/0day-ci/archive/20241207/202412070132.6Yh79CsU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070132.6Yh79CsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070132.6Yh79CsU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clk-stm32h7.c:396:25: error: use of undeclared identifier 'clk_divider_ops'
     396 |                                   gcfg->div->ops : &clk_divider_ops;
         |                                                     ^
   drivers/clk/clk-stm32h7.c:844:9: error: use of undeclared identifier 'clk_divider_ops'
     844 |         return clk_divider_ops.recalc_rate(hw, parent_rate);
         |                ^
   drivers/clk/clk-stm32h7.c:850:9: error: use of undeclared identifier 'clk_divider_ops'
     850 |         return clk_divider_ops.determine_rate(hw, req);
         |                ^
   drivers/clk/clk-stm32h7.c:867:8: error: use of undeclared identifier 'clk_divider_ops'
     867 |         ret = clk_divider_ops.set_rate(hw, rate, parent_rate);
         |               ^
   4 errors generated.
--
>> drivers/clk/nxp/clk-lpc18xx-ccu.c:221:14: error: use of undeclared identifier 'clk_divider_ro_ops'
     221 |                 div_ops = &clk_divider_ro_ops;
         |                            ^
   1 error generated.
--
>> drivers/clk/nxp/clk-lpc18xx-cgu.c:544:26: error: use of undeclared identifier 'clk_divider_ops'
     544 |                                       &clk->div.hw, &clk_divider_ops,
         |                                                      ^
   1 error generated.


vim +/clk_divider_ops +396 drivers/clk/clk-stm32h7.c

3e4d618b0722b64 Gabriel Fernandez 2017-08-21  358  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  359  static void get_cfg_composite_div(const struct composite_clk_gcfg *gcfg,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  360  		const struct composite_clk_cfg *cfg,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  361  		struct composite_cfg *composite, spinlock_t *lock)
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  362  {
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  363  	struct clk_mux     *mux = NULL;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  364  	struct clk_divider *div = NULL;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  365  	struct clk_gate    *gate = NULL;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  366  	const struct clk_ops *mux_ops, *div_ops, *gate_ops;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  367  	struct clk_hw *mux_hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  368  	struct clk_hw *div_hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  369  	struct clk_hw *gate_hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  370  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  371  	mux_ops = div_ops = gate_ops = NULL;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  372  	mux_hw = div_hw = gate_hw = NULL;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  373  
c1ea839c41d0496 Gabriel Fernandez 2017-10-11  374  	if (gcfg->mux && cfg->mux) {
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  375  		mux = _get_cmux(base + cfg->mux->offset,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  376  				cfg->mux->shift,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  377  				cfg->mux->width,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  378  				gcfg->mux->flags, lock);
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  379  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  380  		if (!IS_ERR(mux)) {
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  381  			mux_hw = &mux->hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  382  			mux_ops = gcfg->mux->ops ?
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  383  				  gcfg->mux->ops : &clk_mux_ops;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  384  		}
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  385  	}
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  386  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  387  	if (gcfg->div && cfg->div) {
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  388  		div = _get_cdiv(base + cfg->div->offset,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  389  				cfg->div->shift,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  390  				cfg->div->width,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  391  				gcfg->div->flags, lock);
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  392  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  393  		if (!IS_ERR(div)) {
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  394  			div_hw = &div->hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  395  			div_ops = gcfg->div->ops ?
3e4d618b0722b64 Gabriel Fernandez 2017-08-21 @396  				  gcfg->div->ops : &clk_divider_ops;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  397  		}
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  398  	}
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  399  
c1ea839c41d0496 Gabriel Fernandez 2017-10-11  400  	if (gcfg->gate && cfg->gate) {
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  401  		gate = _get_cgate(base + cfg->gate->offset,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  402  				cfg->gate->bit_idx,
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  403  				gcfg->gate->flags, lock);
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  404  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  405  		if (!IS_ERR(gate)) {
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  406  			gate_hw = &gate->hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  407  			gate_ops = gcfg->gate->ops ?
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  408  				   gcfg->gate->ops : &clk_gate_ops;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  409  		}
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  410  	}
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  411  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  412  	composite->mux_hw = mux_hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  413  	composite->mux_ops = mux_ops;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  414  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  415  	composite->div_hw = div_hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  416  	composite->div_ops = div_ops;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  417  
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  418  	composite->gate_hw = gate_hw;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  419  	composite->gate_ops = gate_ops;
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  420  }
3e4d618b0722b64 Gabriel Fernandez 2017-08-21  421  

:::::: The code at line 396 was first introduced by commit
:::::: 3e4d618b0722b64c551c3f2fc4c4f9cb3558ed93 clk: stm32h7: Add stm32h743 clock driver

:::::: TO: Gabriel Fernandez <gabriel.fernandez@st.com>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
