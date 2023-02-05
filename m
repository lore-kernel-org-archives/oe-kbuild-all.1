Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BC7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675612585; x=1707148585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fTx4LjiPAr/AOiNeCaxXPJ3C/xdj2k6eb0Ffa0AFGDg=;
  b=fqfCM+Ao7Pu1ZC6hZCR2sF2XGtzoNZOF3sk0qhoHHSO2Mwqqp/s77Mp5
   /pCk7uCrify68FFs5KHTOeZXrlAuhOoF0yc+M3Z9pBZnWSh04jxtDTF6B
   Heewn+jid0cLPXlrp7YLpVZaQFVVn2aMNfHHgT1Gl4FHqmb53A2+Z/gtb
   Ck/Qwvn56vzXKSHXgIjggB4peWBS7R5iv7YbehpCWbbgFgPUx+5tuHATh
   ciARmuEF6avrwINzcV3N4zYNvPTm7eKIMaKSZjGC3NxphDaKx4C1G5M39
   Juag8Y57TTGBFoB1hwfFBLEA71wtwi8sz8TvLWFk6F1QOD23gp4pl1BO2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="356408395"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="356408395"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 07:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="840134927"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="840134927"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Feb 2023 07:56:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOhNO-00025I-2F;
	Sun, 05 Feb 2023 15:56:22 +0000
Date: Sun, 5 Feb 2023 23:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 9878/20208]
 drivers/clk/imx/clk-imx8mm.c:710:26: warning: unused variable 'delta_k_fops'
Message-ID: <202302052309.k1fH1YgV-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: e1ab8f0dce3e08b5ec37419160bfc04ef4f438e1 [9878/20208] MA-19046 clk: imx8mm: Support building clk-imx8mm driver as module
config: mips-buildonly-randconfig-r006-20230205 (https://download.01.org/0day-ci/archive/20230205/202302052309.k1fH1YgV-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/e1ab8f0dce3e08b5ec37419160bfc04ef4f438e1
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout e1ab8f0dce3e08b5ec37419160bfc04ef4f438e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/ar7/ drivers/clk/imx/ drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
   <scratch space>:391:1: note: expanded from here
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
https://github.com/intel/lkp-tests
