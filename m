Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF42F14A4E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727519415; cv=none; b=JJNEWZw5uDnOBBkjv9mYyx7FdRNPN/VrWyY6dvBHS3cfWOCNnyyq2gnHRZJAq0oldEq2poiPV45bcE0IDiTbSvgcgqII5totkGCvJD7DQNXZPSVsTrk+c4kguD/SA1pmmSW1rmJ52iYM4b6+9plkQ186Q1bVHDIgK4Oqy732O00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727519415; c=relaxed/simple;
	bh=8jrojT3Yw8FYV2VSFTFLMC5NIFY6LlZX2glsJsW1oXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/9F5jax0KeG7S7t47oEgnn2KuDs67tWJuteuc/xEqmgF86cB2QMjkVzaKhihlBs2YqtVERaU2UmOC7kyJoMyAWzUsSqsd9DIg3RPIBMGlv/NfY2U9UCSkleLO7DSlRlmFC6iYZrJC2P6M2gDhGqXybL7tdt90lgFtg9tkQUjj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsOF/HGj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsOF/HGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727519413; x=1759055413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8jrojT3Yw8FYV2VSFTFLMC5NIFY6LlZX2glsJsW1oXk=;
  b=UsOF/HGjCh5WZkr1BiZOS6dxZltCj8n0B1H1K/iGe4YpScQ+rdjDV8Lw
   AvgNiFBA4zVCWNKshk2vxQhaMOkigiiSZkiWNHl4s/ZXaWc9C4WY8qlW/
   kWuoWa+Zwtv47sCUwDJ2ATOezRI9Dt479Cq5aKBtAHYm63wOvvLh3Fhlc
   gMo0ylyZAYNiwm4X1vW+9QKTRocfFsjP+TdVMn1bg9u/My7UF8Clx+4JQ
   Glx2SlSRoryw6nS3QKecsAuhnccm6e9570HEUwXpl8QNGXg8bRqFWjgeE
   7tJWiwvy3nMuGzYg0wq2nIxE+LaFAU6TF0HFAjgLplhfq10M9VSugU0L6
   w==;
X-CSE-ConnectionGUID: VG4Ub10XRluwzwBRJTW7cw==
X-CSE-MsgGUID: Iw4e+4jBQe2FSeFEpbza5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26792318"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26792318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:30:12 -0700
X-CSE-ConnectionGUID: BT1RrxThTceCFvB9Mh64cQ==
X-CSE-MsgGUID: 09b4NMVNRSytw/4Wfdtvvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103570522"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Sep 2024 03:30:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUiH-000NA1-02;
	Sat, 28 Sep 2024 10:30:09 +0000
Date: Sat, 28 Sep 2024 18:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5875/16788]
 drivers/clk/imx/clk-imx8mm.c:731:23: warning: 'pll_setting_fops' defined but
 not used
Message-ID: <202409281817.76SrrpmP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 8edc700dd52e0961f046aa8e47e812efc10ae588 [5875/16788] Merge branch 'clock/next' into next
config: arc-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281817.76SrrpmP-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281817.76SrrpmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281817.76SrrpmP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/clk/imx/clk-imx8mm.c:9:
>> drivers/clk/imx/clk-imx8mm.c:731:23: warning: 'pll_setting_fops' defined but not used [-Wunused-const-variable=]
     731 | DEFINE_SHOW_ATTRIBUTE(pll_setting);
         |                       ^~~~~~~~~~~
   include/linux/seq_file.h:202:37: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     202 | static const struct file_operations __name ## _fops = {                 \
         |                                     ^~~~~~
>> drivers/clk/imx/clk-imx8mm.c:710:26: warning: 'delta_k_fops' defined but not used [-Wunused-const-variable=]
     710 | DEFINE_DEBUGFS_ATTRIBUTE(delta_k_fops, NULL, pll_delta_k_set, "%lld\n");
         |                          ^~~~~~~~~~~~
   include/linux/debugfs.h:54:37: note: in definition of macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      54 | static const struct file_operations __fops = {                          \
         |                                     ^~~~~~
   drivers/clk/imx/clk-imx8mm.c:710:1: note: in expansion of macro 'DEFINE_DEBUGFS_ATTRIBUTE'
     710 | DEFINE_DEBUGFS_ATTRIBUTE(delta_k_fops, NULL, pll_delta_k_set, "%lld\n");
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/pll_setting_fops +731 drivers/clk/imx/clk-imx8mm.c

f2a9d6d7aea21e Jacky Bai 2020-04-07  696  
f2a9d6d7aea21e Jacky Bai 2020-04-07  697  static int pll_delta_k_set(void *data, u64 val)
f2a9d6d7aea21e Jacky Bai 2020-04-07  698  {
f2a9d6d7aea21e Jacky Bai 2020-04-07  699  	struct clk_hw *hw;
f2a9d6d7aea21e Jacky Bai 2020-04-07  700  	short int delta_k;
f2a9d6d7aea21e Jacky Bai 2020-04-07  701  
f2a9d6d7aea21e Jacky Bai 2020-04-07  702  	hw = data;
f2a9d6d7aea21e Jacky Bai 2020-04-07  703  	delta_k = (short int) (val & KDIV_MASK);
f2a9d6d7aea21e Jacky Bai 2020-04-07  704  
f2a9d6d7aea21e Jacky Bai 2020-04-07  705  	clk_set_delta_k(hw, val);
f2a9d6d7aea21e Jacky Bai 2020-04-07  706  
f2a9d6d7aea21e Jacky Bai 2020-04-07  707  	pr_debug("the delta k is %d\n", delta_k);
f2a9d6d7aea21e Jacky Bai 2020-04-07  708  	return 0;
f2a9d6d7aea21e Jacky Bai 2020-04-07  709  }
f2a9d6d7aea21e Jacky Bai 2020-04-07 @710  DEFINE_DEBUGFS_ATTRIBUTE(delta_k_fops, NULL, pll_delta_k_set, "%lld\n");
f2a9d6d7aea21e Jacky Bai 2020-04-07  711  
f2a9d6d7aea21e Jacky Bai 2020-04-07  712  static int pll_setting_show(struct seq_file *s, void *data)
f2a9d6d7aea21e Jacky Bai 2020-04-07  713  {
f2a9d6d7aea21e Jacky Bai 2020-04-07  714  	struct clk_hw *hw;
f2a9d6d7aea21e Jacky Bai 2020-04-07  715  	u32 pll_div_ctrl0, pll_div_ctrl1;
f2a9d6d7aea21e Jacky Bai 2020-04-07  716  	u32 mdiv, pdiv, sdiv, kdiv;
f2a9d6d7aea21e Jacky Bai 2020-04-07  717  
f2a9d6d7aea21e Jacky Bai 2020-04-07  718  	hw = s->private;;
f2a9d6d7aea21e Jacky Bai 2020-04-07  719  
f2a9d6d7aea21e Jacky Bai 2020-04-07  720  	clk_get_pll_setting(hw, &pll_div_ctrl0, &pll_div_ctrl1);
f2a9d6d7aea21e Jacky Bai 2020-04-07  721  	mdiv = (pll_div_ctrl0 & MDIV_MASK) >> MDIV_SHIFT;
f2a9d6d7aea21e Jacky Bai 2020-04-07  722  	pdiv = (pll_div_ctrl0 & PDIV_MASK) >> PDIV_SHIFT;
f2a9d6d7aea21e Jacky Bai 2020-04-07  723  	sdiv = (pll_div_ctrl0 & SDIV_MASK) >> SDIV_SHIFT;
f2a9d6d7aea21e Jacky Bai 2020-04-07  724  	kdiv = (pll_div_ctrl1 & KDIV_MASK);
f2a9d6d7aea21e Jacky Bai 2020-04-07  725  
f2a9d6d7aea21e Jacky Bai 2020-04-07  726  	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
f2a9d6d7aea21e Jacky Bai 2020-04-07  727  		mdiv, pdiv, sdiv, kdiv);
f2a9d6d7aea21e Jacky Bai 2020-04-07  728  
f2a9d6d7aea21e Jacky Bai 2020-04-07  729  	return 0;
f2a9d6d7aea21e Jacky Bai 2020-04-07  730  }
f2a9d6d7aea21e Jacky Bai 2020-04-07 @731  DEFINE_SHOW_ATTRIBUTE(pll_setting);
f2a9d6d7aea21e Jacky Bai 2020-04-07  732  

:::::: The code at line 731 was first introduced by commit
:::::: f2a9d6d7aea21e1aaa348eb588bc8022babe83c7 MLK-23751 clk: imx: Add audio PLL debug fs for K-divider monitor control

:::::: TO: Jacky Bai <ping.bai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
