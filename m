Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917B7F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715476175; cv=none; b=DrnWCVRqz39Z7N3AmIzvCGNGlMKuK6TX6niHWuYbUxfEwZBelNn155H50wWm53zbRnM0VhBXhTVUjzOEFBG37ZvfTZuQmNhbxmCfJnwXTTGnj2H8njDvaQU/9vHz/mG9Sh7xiF3XyCrUM3/uQljmOH/ME9+Ld3ma64eWIT1a7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715476175; c=relaxed/simple;
	bh=Zewilcfa1v9ypWlk32Gl9USOHk4vCDHSMMogEhQkO6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZOBXxcZnC1h5pUxzmHOGGYSelyK40ogoOeFay8P3DnZVafOca44oyoShZ8E0TGK7nK+Qd3eW6M+/K42DvQwC5WBBV4E5dK1Zudg0xYYywHjytWRvYAbtQNjjHTaYy20UE1TcWhnM/2ZxYcdwCiGEogC+YoUK+ThUHTfpfWYb4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9czCbKX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9czCbKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715476173; x=1747012173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zewilcfa1v9ypWlk32Gl9USOHk4vCDHSMMogEhQkO6I=;
  b=d9czCbKXeV4al86dIWPWQpU6afwJdRWo+x/Fdye/SYd4M90J6ZYXPJbL
   YNc7JsrgLmUmYmJQ8mm8JwCKOcdVCCiOregGjcnyDA1FLXZF/RUVe0y9+
   wnQ9yi+eC2BugRfv9AfpsgyQlO218fTLr3skkayPfqeoMk0RvjJij2JQH
   +r/SdcizxqJyZ7ahG+h/UyWP674RLiDtabiTct4IYIrR4JdQ5ZL/t6FIO
   JrL9OB6K/um2a+0byh4+LO1NT/HrmbVwY2itfJdXlHxIsbMbXwcuUQymA
   0Uz0ZQmxnWpZkSNs3NjVy88yiiX5TXyLG9NOmnmRq4lePZWVBBxEKPWK/
   w==;
X-CSE-ConnectionGUID: yTPKwWv/STmnKp+TUfsxcw==
X-CSE-MsgGUID: lFzuoK4DQC+cWHFtBNyB1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11569099"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11569099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 18:09:32 -0700
X-CSE-ConnectionGUID: wQxTxqrLTnqbHiICc+Ig6w==
X-CSE-MsgGUID: BzFdgF02SkWcCA0WSEWKCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30553199"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 May 2024 18:09:32 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5xiT-00080f-0C;
	Sun, 12 May 2024 01:09:29 +0000
Date: Sun, 12 May 2024 09:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 894/928]
 drivers/clk/renesas/rzg2l-cpg.c:293:29: error: passing 'const u32 *' (aka
 'const unsigned int *') to parameter of type 'u32 *' (aka 'unsigned int *')
 discards qualifiers
Message-ID: <202405120903.XfzFpIDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   7bfc6836ad1b96dfdfd7ea91ffdee67d0d78254e
commit: ef51a13f0720a767a067eb7389fed926a9237fe1 [894/928] clk: renesas: rzg2l: Refactor SD mux driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240512/202405120903.XfzFpIDt-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120903.XfzFpIDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405120903.XfzFpIDt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/rzg2l-cpg.c:293:29: error: passing 'const u32 *' (aka 'const unsigned int *') to parameter of type 'u32 *' (aka 'unsigned int *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     293 |         val = clk_mux_index_to_val(sd_mux_hw_data->mtable, CLK_MUX_ROUND_CLOSEST, index);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk-provider.h:928:40: note: passing argument to parameter 'table' here
     928 | unsigned int clk_mux_index_to_val(u32 *table, unsigned int flags, u8 index);
         |                                        ^
   drivers/clk/renesas/rzg2l-cpg.c:321:34: error: passing 'const u32 *' (aka 'const unsigned int *') to parameter of type 'u32 *' (aka 'unsigned int *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     321 |         return clk_mux_val_to_index(hw, sd_mux_hw_data->mtable, CLK_MUX_ROUND_CLOSEST, val);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk-provider.h:926:50: note: passing argument to parameter 'table' here
     926 | int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int flags,
         |                                                  ^
   2 errors generated.


vim +293 drivers/clk/renesas/rzg2l-cpg.c

   281	
   282	static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
   283	{
   284		struct clk_hw_data *clk_hw_data = to_clk_hw_data(hw);
   285		struct sd_mux_hw_data *sd_mux_hw_data = to_sd_mux_hw_data(clk_hw_data);
   286		struct rzg2l_cpg_priv *priv = clk_hw_data->priv;
   287		u32 off = GET_REG_OFFSET(clk_hw_data->conf);
   288		u32 shift = GET_SHIFT(clk_hw_data->conf);
   289		unsigned long flags;
   290		u32 val;
   291		int ret;
   292	
 > 293		val = clk_mux_index_to_val(sd_mux_hw_data->mtable, CLK_MUX_ROUND_CLOSEST, index);
   294	
   295		spin_lock_irqsave(&priv->rmw_lock, flags);
   296	
   297		writel((CPG_WEN_BIT | val) << shift, priv->base + off);
   298	
   299		/* Wait for the update done. */
   300		ret = rzg2l_cpg_wait_clk_update_done(priv->base, clk_hw_data->sconf);
   301	
   302		spin_unlock_irqrestore(&priv->rmw_lock, flags);
   303	
   304		if (ret)
   305			dev_err(priv->dev, "Failed to switch parent\n");
   306	
   307		return ret;
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
