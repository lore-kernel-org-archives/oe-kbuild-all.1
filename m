Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78856186A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693494416; x=1725030416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBkM4i4DRozProof0GOjpaE1vN2FfY16LB1tx0wzDus=;
  b=ineTf/wxgQ2P8H7uK6u1O9ghwgohA8IBoXXuUgVJdkjqQH4dXLY1DfuF
   ewS4RV6Nur0tC2XEUeXPfFfaAKPMZOm7PGpJuEZwse0LCqIHG5vvl9JBv
   P9Q4Q1cqn64eohlcBuqAci6+22rz42o0LsmO+E3HwX/YH6nf+rWopBBm0
   Y2mn/yx2aWW2JTCh25Rm7wN5IiFp9Z7gucrJOHBGoeW03lDZhBE3J1vbv
   eDIjz4PoD6WNI7t4aqsPXQRf3eUsNOMUb69RBD0E80Fp0pMuKIf3hQoy3
   t1tJvkDYetF766Pys5i5oELd2qbU0Qq+VsTSnGopfbe90VpZlyQqUKBPe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="374885290"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="374885290"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 08:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805032893"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="805032893"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 08:06:54 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbjFz-0000Gz-2l;
	Thu, 31 Aug 2023 15:06:51 +0000
Date: Thu, 31 Aug 2023 23:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 9878/24603]
 drivers/clk/imx/clk-imx8mm.c:710:26: warning: unused variable 'delta_k_fops'
Message-ID: <202308312251.trHHTdPO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jindong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: e1ab8f0dce3e08b5ec37419160bfc04ef4f438e1 [9878/24603] MA-19046 clk: imx8mm: Support building clk-imx8mm driver as module
config: riscv-randconfig-r015-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312251.trHHTdPO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312251.trHHTdPO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312251.trHHTdPO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx8mm.c:710:26: warning: unused variable 'delta_k_fops' [-Wunused-const-variable]
   DEFINE_DEBUGFS_ATTRIBUTE(delta_k_fops, NULL, pll_delta_k_set, "%lld\n");
                            ^
>> drivers/clk/imx/clk-imx8mm.c:731:1: warning: unused variable 'pll_setting_fops' [-Wunused-const-variable]
   DEFINE_SHOW_ATTRIBUTE(pll_setting);
   ^
   include/linux/seq_file.h:186:37: note: expanded from macro 'DEFINE_SHOW_ATTRIBUTE'
   static const struct file_operations __name ## _fops = {                 \
                                       ^
   <scratch space>:151:1: note: expanded from here
   pll_setting_fops
   ^
   2 warnings generated.


vim +/delta_k_fops +710 drivers/clk/imx/clk-imx8mm.c

85a61310c03536 Jacky Bai 2020-04-07  696  
85a61310c03536 Jacky Bai 2020-04-07  697  static int pll_delta_k_set(void *data, u64 val)
85a61310c03536 Jacky Bai 2020-04-07  698  {
85a61310c03536 Jacky Bai 2020-04-07  699  	struct clk_hw *hw;
85a61310c03536 Jacky Bai 2020-04-07  700  	short int delta_k;
85a61310c03536 Jacky Bai 2020-04-07  701  
85a61310c03536 Jacky Bai 2020-04-07  702  	hw = data;
85a61310c03536 Jacky Bai 2020-04-07  703  	delta_k = (short int) (val & KDIV_MASK);
85a61310c03536 Jacky Bai 2020-04-07  704  
85a61310c03536 Jacky Bai 2020-04-07  705  	clk_set_delta_k(hw, val);
85a61310c03536 Jacky Bai 2020-04-07  706  
85a61310c03536 Jacky Bai 2020-04-07  707  	pr_debug("the delta k is %d\n", delta_k);
85a61310c03536 Jacky Bai 2020-04-07  708  	return 0;
85a61310c03536 Jacky Bai 2020-04-07  709  }
85a61310c03536 Jacky Bai 2020-04-07 @710  DEFINE_DEBUGFS_ATTRIBUTE(delta_k_fops, NULL, pll_delta_k_set, "%lld\n");
85a61310c03536 Jacky Bai 2020-04-07  711  
85a61310c03536 Jacky Bai 2020-04-07  712  static int pll_setting_show(struct seq_file *s, void *data)
85a61310c03536 Jacky Bai 2020-04-07  713  {
85a61310c03536 Jacky Bai 2020-04-07  714  	struct clk_hw *hw;
85a61310c03536 Jacky Bai 2020-04-07  715  	u32 pll_div_ctrl0, pll_div_ctrl1;
85a61310c03536 Jacky Bai 2020-04-07  716  	u32 mdiv, pdiv, sdiv, kdiv;
85a61310c03536 Jacky Bai 2020-04-07  717  
85a61310c03536 Jacky Bai 2020-04-07  718  	hw = s->private;;
85a61310c03536 Jacky Bai 2020-04-07  719  
85a61310c03536 Jacky Bai 2020-04-07  720  	clk_get_pll_setting(hw, &pll_div_ctrl0, &pll_div_ctrl1);
85a61310c03536 Jacky Bai 2020-04-07  721  	mdiv = (pll_div_ctrl0 & MDIV_MASK) >> MDIV_SHIFT;
85a61310c03536 Jacky Bai 2020-04-07  722  	pdiv = (pll_div_ctrl0 & PDIV_MASK) >> PDIV_SHIFT;
85a61310c03536 Jacky Bai 2020-04-07  723  	sdiv = (pll_div_ctrl0 & SDIV_MASK) >> SDIV_SHIFT;
85a61310c03536 Jacky Bai 2020-04-07  724  	kdiv = (pll_div_ctrl1 & KDIV_MASK);
85a61310c03536 Jacky Bai 2020-04-07  725  
85a61310c03536 Jacky Bai 2020-04-07  726  	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
85a61310c03536 Jacky Bai 2020-04-07  727  		mdiv, pdiv, sdiv, kdiv);
85a61310c03536 Jacky Bai 2020-04-07  728  
85a61310c03536 Jacky Bai 2020-04-07  729  	return 0;
85a61310c03536 Jacky Bai 2020-04-07  730  }
85a61310c03536 Jacky Bai 2020-04-07 @731  DEFINE_SHOW_ATTRIBUTE(pll_setting);
85a61310c03536 Jacky Bai 2020-04-07  732  

:::::: The code at line 710 was first introduced by commit
:::::: 85a61310c03536f1da881cc423ae83dce540ddad MLK-23751 clk: imx: Add audio PLL debug fs for K-divider monitor control

:::::: TO: Jacky Bai <ping.bai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
