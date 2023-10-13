Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4602B5DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 23:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enJMdC14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697240778; x=1728776778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NYKIUZvhW0Uc5vcOaxgAr4YwAyxwkOAqo9S067kUAG8=;
  b=enJMdC14+jb7P4T5313iQbYaRS7/EmU7FAv0rBOuGqfezuLlXHou/enk
   fIisS6YF/sE3969yWzRkbIEWHL2Avxi5m1nqYsXkUrdvjcNnL0j7u2Wik
   +rDpnzdCh8UgTkzWkh7p9IwyJEJjRd078JK+7DlS8zWajGbTKgL5ceCpZ
   qfQpsIlmuZ9KT4/jwgVCjZpH8hqWsfSh7ZSubEdYF13YJYw1crmyz0Fv7
   StxK8+guwz1oOPMVmJyjZDY6NjFk/eFJMc549v9eWEqYd0lXnZFv9C0JH
   Uhy1kFYCegvWEVbXTpTqhSz+eCrKLyLIk2ziTbgNissqMQxFsaecMLd/D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="449475962"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="449475962"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 16:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871284018"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="871284018"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 16:46:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrRrC-0005Wi-23;
	Fri, 13 Oct 2023 23:46:14 +0000
Date: Sat, 14 Oct 2023 07:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4832/15768]
 drivers/clk/imx/clk-imx8mm.c:731:23: warning: 'pll_setting_fops' defined but
 not used
Message-ID: <202310140708.I07RwOql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: fc7ba8739b847b6e0c7985170fc0483b168dcf71 [4832/15768] Merge branch 'clock/next' into next
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310140708.I07RwOql-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140708.I07RwOql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140708.I07RwOql-lkp@intel.com/

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
   include/linux/debugfs.h:54:37: note: in definition of macro 'DEFINE_DEBUGFS_ATTRIBUTE'
      54 | static const struct file_operations __fops = {                          \
         |                                     ^~~~~~


vim +/pll_setting_fops +731 drivers/clk/imx/clk-imx8mm.c

42545b9b6c6965 Jacky Bai 2020-04-07  696  
42545b9b6c6965 Jacky Bai 2020-04-07  697  static int pll_delta_k_set(void *data, u64 val)
42545b9b6c6965 Jacky Bai 2020-04-07  698  {
42545b9b6c6965 Jacky Bai 2020-04-07  699  	struct clk_hw *hw;
42545b9b6c6965 Jacky Bai 2020-04-07  700  	short int delta_k;
42545b9b6c6965 Jacky Bai 2020-04-07  701  
42545b9b6c6965 Jacky Bai 2020-04-07  702  	hw = data;
42545b9b6c6965 Jacky Bai 2020-04-07  703  	delta_k = (short int) (val & KDIV_MASK);
42545b9b6c6965 Jacky Bai 2020-04-07  704  
42545b9b6c6965 Jacky Bai 2020-04-07  705  	clk_set_delta_k(hw, val);
42545b9b6c6965 Jacky Bai 2020-04-07  706  
42545b9b6c6965 Jacky Bai 2020-04-07  707  	pr_debug("the delta k is %d\n", delta_k);
42545b9b6c6965 Jacky Bai 2020-04-07  708  	return 0;
42545b9b6c6965 Jacky Bai 2020-04-07  709  }
42545b9b6c6965 Jacky Bai 2020-04-07 @710  DEFINE_DEBUGFS_ATTRIBUTE(delta_k_fops, NULL, pll_delta_k_set, "%lld\n");
42545b9b6c6965 Jacky Bai 2020-04-07  711  
42545b9b6c6965 Jacky Bai 2020-04-07  712  static int pll_setting_show(struct seq_file *s, void *data)
42545b9b6c6965 Jacky Bai 2020-04-07  713  {
42545b9b6c6965 Jacky Bai 2020-04-07  714  	struct clk_hw *hw;
42545b9b6c6965 Jacky Bai 2020-04-07  715  	u32 pll_div_ctrl0, pll_div_ctrl1;
42545b9b6c6965 Jacky Bai 2020-04-07  716  	u32 mdiv, pdiv, sdiv, kdiv;
42545b9b6c6965 Jacky Bai 2020-04-07  717  
42545b9b6c6965 Jacky Bai 2020-04-07  718  	hw = s->private;;
42545b9b6c6965 Jacky Bai 2020-04-07  719  
42545b9b6c6965 Jacky Bai 2020-04-07  720  	clk_get_pll_setting(hw, &pll_div_ctrl0, &pll_div_ctrl1);
42545b9b6c6965 Jacky Bai 2020-04-07  721  	mdiv = (pll_div_ctrl0 & MDIV_MASK) >> MDIV_SHIFT;
42545b9b6c6965 Jacky Bai 2020-04-07  722  	pdiv = (pll_div_ctrl0 & PDIV_MASK) >> PDIV_SHIFT;
42545b9b6c6965 Jacky Bai 2020-04-07  723  	sdiv = (pll_div_ctrl0 & SDIV_MASK) >> SDIV_SHIFT;
42545b9b6c6965 Jacky Bai 2020-04-07  724  	kdiv = (pll_div_ctrl1 & KDIV_MASK);
42545b9b6c6965 Jacky Bai 2020-04-07  725  
42545b9b6c6965 Jacky Bai 2020-04-07  726  	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
42545b9b6c6965 Jacky Bai 2020-04-07  727  		mdiv, pdiv, sdiv, kdiv);
42545b9b6c6965 Jacky Bai 2020-04-07  728  
42545b9b6c6965 Jacky Bai 2020-04-07  729  	return 0;
42545b9b6c6965 Jacky Bai 2020-04-07  730  }
42545b9b6c6965 Jacky Bai 2020-04-07 @731  DEFINE_SHOW_ATTRIBUTE(pll_setting);
42545b9b6c6965 Jacky Bai 2020-04-07  732  

:::::: The code at line 731 was first introduced by commit
:::::: 42545b9b6c696513ed63bf62b3f78a983650992e MLK-23751 clk: imx: Add audio PLL debug fs for K-divider monitor control

:::::: TO: Jacky Bai <ping.bai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
