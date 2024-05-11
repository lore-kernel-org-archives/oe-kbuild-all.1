Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5504F52F9C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715437453; cv=none; b=mhakajtgd8L2NBStjgZJ6Khne4SlRlneghjYw0YyYS/VfiZa0tJfdxiAS9etoJcavbkWe3OZ2xfbpCrtMWDC3P+GDrYCN9Ic8vEZIJm+tjeBBi7rvTYO9PHtE2/uD4WGazAc5voxNPbfuAVdJk/eS4R8uopK+J7pFIvKsmx6LD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715437453; c=relaxed/simple;
	bh=EJLcFhJMnJwMMs4Dim9Z6hSBFaFJ+bkDDd4Yecw/2a0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LScVIlfqnsL3J4qzMpHK4OzIELUeHZwie7O2i+B9sYShuoX0pvjM8MOhxjpd/+CL9jx3cMre+sKGf1PLGUpEVWh7elQtZFCwUyuXrBcmIj1PyCn+LDUEX3VvH3V9CR5UzW0pPxHezXKny5JBsWnIDgiX+JlwMvgSWhOxqVr19Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgSaNe0X; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgSaNe0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715437451; x=1746973451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJLcFhJMnJwMMs4Dim9Z6hSBFaFJ+bkDDd4Yecw/2a0=;
  b=PgSaNe0XOlSK/20WzqfZzYPJhmBHXU/KsUGzX8yAmkPrf1VbfTdT9Opq
   WkpsSL1FwhL73Uluvly2383bcXS4zPw3IIl9FGAbDsz0Dvbo3ZKKCqS9N
   nWygBpV0G4uuJObKrJ1zYybonewtG9hVabKxoIG/0kuUpn6UfVSFcbb/l
   RZTSTHhL66YQsE7TLdDitJtPKqRXJV8d8bi0P0BniOt6l7BKfjYRc82sF
   eiqOrqEkgXdLRlr56419vpVYCzsQ0qd169c4RtJbyYZnMPMjeaDmNPMEn
   PuuLkmUYcGOihzH9q7unWn1Q7r3xS1XyLdBE8N9TVEE6uqXZ62cR9Yj4L
   g==;
X-CSE-ConnectionGUID: SCcyrpobQEWWZSxaQf0qog==
X-CSE-MsgGUID: pqShi9yxQcqwaEjlyTQwdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="15257204"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="15257204"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 07:24:11 -0700
X-CSE-ConnectionGUID: lHt5nDRoTO+2ahDwWFm3WA==
X-CSE-MsgGUID: r5xWNueGSEexdF5DWFmLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="53100250"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2024 07:24:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5ndv-0007UJ-1q;
	Sat, 11 May 2024 14:24:07 +0000
Date: Sat, 11 May 2024 22:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 894/928]
 drivers/clk/renesas/rzg2l-cpg.c:293:50: warning: passing argument 1 of
 'clk_mux_index_to_val' discards 'const' qualifier from pointer target type
Message-ID: <202405112230.YvUZCVyV-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240511/202405112230.YvUZCVyV-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405112230.YvUZCVyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405112230.YvUZCVyV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/renesas/rzg2l-cpg.c: In function 'rzg2l_cpg_sd_clk_mux_set_parent':
>> drivers/clk/renesas/rzg2l-cpg.c:293:50: warning: passing argument 1 of 'clk_mux_index_to_val' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     293 |         val = clk_mux_index_to_val(sd_mux_hw_data->mtable, CLK_MUX_ROUND_CLOSEST, index);
         |                                    ~~~~~~~~~~~~~~^~~~~~~~
   In file included from drivers/clk/renesas/rzg2l-cpg.c:16:
   include/linux/clk-provider.h:928:40: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'const u32 *' {aka 'const unsigned int *'}
     928 | unsigned int clk_mux_index_to_val(u32 *table, unsigned int flags, u8 index);
         |                                   ~~~~~^~~~~
   drivers/clk/renesas/rzg2l-cpg.c: In function 'rzg2l_cpg_sd_clk_mux_get_parent':
>> drivers/clk/renesas/rzg2l-cpg.c:321:55: warning: passing argument 2 of 'clk_mux_val_to_index' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     321 |         return clk_mux_val_to_index(hw, sd_mux_hw_data->mtable, CLK_MUX_ROUND_CLOSEST, val);
         |                                         ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/clk-provider.h:926:50: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'const u32 *' {aka 'const unsigned int *'}
     926 | int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int flags,
         |                                             ~~~~~^~~~~


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
   310	static u8 rzg2l_cpg_sd_clk_mux_get_parent(struct clk_hw *hw)
   311	{
   312		struct clk_hw_data *clk_hw_data = to_clk_hw_data(hw);
   313		struct sd_mux_hw_data *sd_mux_hw_data = to_sd_mux_hw_data(clk_hw_data);
   314		struct rzg2l_cpg_priv *priv = clk_hw_data->priv;
   315		u32 val;
   316	
   317		val = readl(priv->base + GET_REG_OFFSET(clk_hw_data->conf));
   318		val >>= GET_SHIFT(clk_hw_data->conf);
   319		val &= GENMASK(GET_WIDTH(clk_hw_data->conf) - 1, 0);
   320	
 > 321		return clk_mux_val_to_index(hw, sd_mux_hw_data->mtable, CLK_MUX_ROUND_CLOSEST, val);
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
