Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD3F1848
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 06:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681713521; x=1713249521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKX8RflQuAAUC2nXDCSIMPr/MkwQ3Xb+k64djYzxKbs=;
  b=VXy4R5AWWI8+bW304PjEDyGYOu/hV+/CrIG3fqV8hfZrfI7PQMEJmuV+
   72fHKX7/XXT403uU7iiWWRKGgi6eOMJ3GpbBZQCuzRvx74Tv+GKp48Y3F
   gVCLcegd4CXATh6TEBKfAjDzz/VyZbZYOvg18SvvGdwLtoOZgYfHBERgA
   Mzp2K5wNBZAwkUxJBx+Iy4DwdGSjtmtsJ6s8yRdM+9CJS4MEHSRhXDH4c
   nYGSgeUBj2R3jW+unAC6PmGskbTJpRYmnP6rjbFC7JJwKw27xhKJBYHGW
   F17A4YclfNJA5E9KOTIZr1G7pl8cW0ByysL+wg6xBYrKuUyFS3zF01uBj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="325162537"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="325162537"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 23:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="684051503"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="684051503"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Apr 2023 23:38:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poIVZ-000cD1-0O;
	Mon, 17 Apr 2023 06:38:37 +0000
Date: Mon, 17 Apr 2023 14:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dirk Mueller <dmueller@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: [stable:linux-4.14.y 3076/9999]
 arch/mips/cavium-octeon/octeon-usb.c:399:3: warning: this statement may fall
 through
Message-ID: <202304171445.ueOyNWcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   f03c8bbaf6d9cbebee390e8353c5df75293aff7c
commit: 88f7a6aa7fb9aa5076b65489146045dac865f1d3 [3076/9999] scripts/dtc: Remove redundant YYLOC global declaration
config: mips-randconfig-c024-20230416 (https://download.01.org/0day-ci/archive/20230417/202304171445.ueOyNWcL-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=88f7a6aa7fb9aa5076b65489146045dac865f1d3
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout 88f7a6aa7fb9aa5076b65489146045dac865f1d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/cavium-octeon/ drivers/tty/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304171445.ueOyNWcL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/cavium-octeon/octeon-usb.c: In function 'dwc3_octeon_clocks_start':
>> arch/mips/cavium-octeon/octeon-usb.c:399:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
      dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       clock_rate);
       ~~~~~~~~~~~
   arch/mips/cavium-octeon/octeon-usb.c:401:2: note: here
     case 100000000:
     ^~~~
--
   drivers/tty/mips_ejtag_fdc.c: In function 'mips_ejtag_fdc_encode':
>> drivers/tty/mips_ejtag_fdc.c:248:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
      word.word &= 0x00ffffff;
      ~~~~~~~~~~^~~~~~~~~~~~~
   drivers/tty/mips_ejtag_fdc.c:249:2: note: here
     case 3:
     ^~~~
--
   arch/mips/cavium-octeon/executive/cvmx-pko.c: In function 'cvmx_pko_config_port':
>> arch/mips/cavium-octeon/executive/cvmx-pko.c:489:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
       if (!cvmx_octeon_is_pass1()) {
          ^
   arch/mips/cavium-octeon/executive/cvmx-pko.c:493:3: note: here
      default:
      ^~~~~~~


vim +399 arch/mips/cavium-octeon/octeon-usb.c

93e502b3c2d44d Steven J. Hill 2017-01-25  285  
93e502b3c2d44d Steven J. Hill 2017-01-25  286  static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
93e502b3c2d44d Steven J. Hill 2017-01-25  287  {
93e502b3c2d44d Steven J. Hill 2017-01-25  288  	union cvm_usbdrd_uctl_ctl uctl_ctl;
93e502b3c2d44d Steven J. Hill 2017-01-25  289  	int ref_clk_sel = 2;
93e502b3c2d44d Steven J. Hill 2017-01-25  290  	u64 div;
93e502b3c2d44d Steven J. Hill 2017-01-25  291  	u32 clock_rate;
93e502b3c2d44d Steven J. Hill 2017-01-25  292  	int mpll_mul;
93e502b3c2d44d Steven J. Hill 2017-01-25  293  	int i;
93e502b3c2d44d Steven J. Hill 2017-01-25  294  	u64 h_clk_rate;
93e502b3c2d44d Steven J. Hill 2017-01-25  295  	u64 uctl_ctl_reg = base;
93e502b3c2d44d Steven J. Hill 2017-01-25  296  
93e502b3c2d44d Steven J. Hill 2017-01-25  297  	if (dev->of_node) {
93e502b3c2d44d Steven J. Hill 2017-01-25  298  		const char *ss_clock_type;
93e502b3c2d44d Steven J. Hill 2017-01-25  299  		const char *hs_clock_type;
93e502b3c2d44d Steven J. Hill 2017-01-25  300  
93e502b3c2d44d Steven J. Hill 2017-01-25  301  		i = of_property_read_u32(dev->of_node,
93e502b3c2d44d Steven J. Hill 2017-01-25  302  					 "refclk-frequency", &clock_rate);
93e502b3c2d44d Steven J. Hill 2017-01-25  303  		if (i) {
93e502b3c2d44d Steven J. Hill 2017-01-25  304  			pr_err("No UCTL \"refclk-frequency\"\n");
93e502b3c2d44d Steven J. Hill 2017-01-25  305  			return -EINVAL;
93e502b3c2d44d Steven J. Hill 2017-01-25  306  		}
93e502b3c2d44d Steven J. Hill 2017-01-25  307  		i = of_property_read_string(dev->of_node,
93e502b3c2d44d Steven J. Hill 2017-01-25  308  					    "refclk-type-ss", &ss_clock_type);
93e502b3c2d44d Steven J. Hill 2017-01-25  309  		if (i) {
93e502b3c2d44d Steven J. Hill 2017-01-25  310  			pr_err("No UCTL \"refclk-type-ss\"\n");
93e502b3c2d44d Steven J. Hill 2017-01-25  311  			return -EINVAL;
93e502b3c2d44d Steven J. Hill 2017-01-25  312  		}
93e502b3c2d44d Steven J. Hill 2017-01-25  313  		i = of_property_read_string(dev->of_node,
93e502b3c2d44d Steven J. Hill 2017-01-25  314  					    "refclk-type-hs", &hs_clock_type);
93e502b3c2d44d Steven J. Hill 2017-01-25  315  		if (i) {
93e502b3c2d44d Steven J. Hill 2017-01-25  316  			pr_err("No UCTL \"refclk-type-hs\"\n");
93e502b3c2d44d Steven J. Hill 2017-01-25  317  			return -EINVAL;
93e502b3c2d44d Steven J. Hill 2017-01-25  318  		}
93e502b3c2d44d Steven J. Hill 2017-01-25  319  		if (strcmp("dlmc_ref_clk0", ss_clock_type) == 0) {
93e502b3c2d44d Steven J. Hill 2017-01-25  320  			if (strcmp(hs_clock_type, "dlmc_ref_clk0") == 0)
93e502b3c2d44d Steven J. Hill 2017-01-25  321  				ref_clk_sel = 0;
93e502b3c2d44d Steven J. Hill 2017-01-25  322  			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
93e502b3c2d44d Steven J. Hill 2017-01-25  323  				ref_clk_sel = 2;
93e502b3c2d44d Steven J. Hill 2017-01-25  324  			else
93e502b3c2d44d Steven J. Hill 2017-01-25  325  				pr_err("Invalid HS clock type %s, using  pll_ref_clk instead\n",
93e502b3c2d44d Steven J. Hill 2017-01-25  326  				       hs_clock_type);
93e502b3c2d44d Steven J. Hill 2017-01-25  327  		} else if (strcmp(ss_clock_type, "dlmc_ref_clk1") == 0) {
93e502b3c2d44d Steven J. Hill 2017-01-25  328  			if (strcmp(hs_clock_type, "dlmc_ref_clk1") == 0)
93e502b3c2d44d Steven J. Hill 2017-01-25  329  				ref_clk_sel = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  330  			else if (strcmp(hs_clock_type, "pll_ref_clk") == 0)
93e502b3c2d44d Steven J. Hill 2017-01-25  331  				ref_clk_sel = 3;
93e502b3c2d44d Steven J. Hill 2017-01-25  332  			else {
93e502b3c2d44d Steven J. Hill 2017-01-25  333  				pr_err("Invalid HS clock type %s, using  pll_ref_clk instead\n",
93e502b3c2d44d Steven J. Hill 2017-01-25  334  				       hs_clock_type);
93e502b3c2d44d Steven J. Hill 2017-01-25  335  				ref_clk_sel = 3;
93e502b3c2d44d Steven J. Hill 2017-01-25  336  			}
93e502b3c2d44d Steven J. Hill 2017-01-25  337  		} else
93e502b3c2d44d Steven J. Hill 2017-01-25  338  			pr_err("Invalid SS clock type %s, using  dlmc_ref_clk0 instead\n",
93e502b3c2d44d Steven J. Hill 2017-01-25  339  			       ss_clock_type);
93e502b3c2d44d Steven J. Hill 2017-01-25  340  
93e502b3c2d44d Steven J. Hill 2017-01-25  341  		if ((ref_clk_sel == 0 || ref_clk_sel == 1) &&
93e502b3c2d44d Steven J. Hill 2017-01-25  342  				  (clock_rate != 100000000))
93e502b3c2d44d Steven J. Hill 2017-01-25  343  			pr_err("Invalid UCTL clock rate of %u, using 100000000 instead\n",
93e502b3c2d44d Steven J. Hill 2017-01-25  344  			       clock_rate);
93e502b3c2d44d Steven J. Hill 2017-01-25  345  
93e502b3c2d44d Steven J. Hill 2017-01-25  346  	} else {
93e502b3c2d44d Steven J. Hill 2017-01-25  347  		pr_err("No USB UCTL device node\n");
93e502b3c2d44d Steven J. Hill 2017-01-25  348  		return -EINVAL;
93e502b3c2d44d Steven J. Hill 2017-01-25  349  	}
93e502b3c2d44d Steven J. Hill 2017-01-25  350  
93e502b3c2d44d Steven J. Hill 2017-01-25  351  	/*
93e502b3c2d44d Steven J. Hill 2017-01-25  352  	 * Step 1: Wait for all voltages to be stable...that surely
93e502b3c2d44d Steven J. Hill 2017-01-25  353  	 *         happened before starting the kernel. SKIP
93e502b3c2d44d Steven J. Hill 2017-01-25  354  	 */
93e502b3c2d44d Steven J. Hill 2017-01-25  355  
93e502b3c2d44d Steven J. Hill 2017-01-25  356  	/* Step 2: Select GPIO for overcurrent indication, if desired. SKIP */
93e502b3c2d44d Steven J. Hill 2017-01-25  357  
93e502b3c2d44d Steven J. Hill 2017-01-25  358  	/* Step 3: Assert all resets. */
93e502b3c2d44d Steven J. Hill 2017-01-25  359  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  360  	uctl_ctl.s.uphy_rst = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  361  	uctl_ctl.s.uahc_rst = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  362  	uctl_ctl.s.uctl_rst = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  363  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  364  
93e502b3c2d44d Steven J. Hill 2017-01-25  365  	/* Step 4a: Reset the clock dividers. */
93e502b3c2d44d Steven J. Hill 2017-01-25  366  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  367  	uctl_ctl.s.h_clkdiv_rst = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  368  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  369  
93e502b3c2d44d Steven J. Hill 2017-01-25  370  	/* Step 4b: Select controller clock frequency. */
93e502b3c2d44d Steven J. Hill 2017-01-25  371  	for (div = 0; div < OCTEON_H_CLKDIV_SEL; div++) {
93e502b3c2d44d Steven J. Hill 2017-01-25  372  		h_clk_rate = octeon_get_io_clock_rate() / clk_div[div];
93e502b3c2d44d Steven J. Hill 2017-01-25  373  		if (h_clk_rate <= OCTEON_MAX_H_CLK_RATE &&
93e502b3c2d44d Steven J. Hill 2017-01-25  374  				 h_clk_rate >= OCTEON_MIN_H_CLK_RATE)
93e502b3c2d44d Steven J. Hill 2017-01-25  375  			break;
93e502b3c2d44d Steven J. Hill 2017-01-25  376  	}
93e502b3c2d44d Steven J. Hill 2017-01-25  377  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  378  	uctl_ctl.s.h_clkdiv_sel = div;
93e502b3c2d44d Steven J. Hill 2017-01-25  379  	uctl_ctl.s.h_clk_en = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  380  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  381  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  382  	if ((div != uctl_ctl.s.h_clkdiv_sel) || (!uctl_ctl.s.h_clk_en)) {
93e502b3c2d44d Steven J. Hill 2017-01-25  383  		dev_err(dev, "dwc3 controller clock init failure.\n");
93e502b3c2d44d Steven J. Hill 2017-01-25  384  			return -EINVAL;
93e502b3c2d44d Steven J. Hill 2017-01-25  385  	}
93e502b3c2d44d Steven J. Hill 2017-01-25  386  
93e502b3c2d44d Steven J. Hill 2017-01-25  387  	/* Step 4c: Deassert the controller clock divider reset. */
93e502b3c2d44d Steven J. Hill 2017-01-25  388  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  389  	uctl_ctl.s.h_clkdiv_rst = 0;
93e502b3c2d44d Steven J. Hill 2017-01-25  390  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  391  
93e502b3c2d44d Steven J. Hill 2017-01-25  392  	/* Step 5a: Reference clock configuration. */
93e502b3c2d44d Steven J. Hill 2017-01-25  393  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  394  	uctl_ctl.s.ref_clk_sel = ref_clk_sel;
93e502b3c2d44d Steven J. Hill 2017-01-25  395  	uctl_ctl.s.ref_clk_fsel = 0x07;
93e502b3c2d44d Steven J. Hill 2017-01-25  396  	uctl_ctl.s.ref_clk_div2 = 0;
93e502b3c2d44d Steven J. Hill 2017-01-25  397  	switch (clock_rate) {
93e502b3c2d44d Steven J. Hill 2017-01-25  398  	default:
93e502b3c2d44d Steven J. Hill 2017-01-25 @399  		dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
93e502b3c2d44d Steven J. Hill 2017-01-25  400  			clock_rate);
93e502b3c2d44d Steven J. Hill 2017-01-25  401  	case 100000000:
93e502b3c2d44d Steven J. Hill 2017-01-25  402  		mpll_mul = 0x19;
93e502b3c2d44d Steven J. Hill 2017-01-25  403  		if (ref_clk_sel < 2)
93e502b3c2d44d Steven J. Hill 2017-01-25  404  			uctl_ctl.s.ref_clk_fsel = 0x27;
93e502b3c2d44d Steven J. Hill 2017-01-25  405  		break;
93e502b3c2d44d Steven J. Hill 2017-01-25  406  	case 50000000:
93e502b3c2d44d Steven J. Hill 2017-01-25  407  		mpll_mul = 0x32;
93e502b3c2d44d Steven J. Hill 2017-01-25  408  		break;
93e502b3c2d44d Steven J. Hill 2017-01-25  409  	case 125000000:
93e502b3c2d44d Steven J. Hill 2017-01-25  410  		mpll_mul = 0x28;
93e502b3c2d44d Steven J. Hill 2017-01-25  411  		break;
93e502b3c2d44d Steven J. Hill 2017-01-25  412  	}
93e502b3c2d44d Steven J. Hill 2017-01-25  413  	uctl_ctl.s.mpll_multiplier = mpll_mul;
93e502b3c2d44d Steven J. Hill 2017-01-25  414  
93e502b3c2d44d Steven J. Hill 2017-01-25  415  	/* Step 5b: Configure and enable spread-spectrum for SuperSpeed. */
93e502b3c2d44d Steven J. Hill 2017-01-25  416  	uctl_ctl.s.ssc_en = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  417  
93e502b3c2d44d Steven J. Hill 2017-01-25  418  	/* Step 5c: Enable SuperSpeed. */
93e502b3c2d44d Steven J. Hill 2017-01-25  419  	uctl_ctl.s.ref_ssp_en = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  420  
93e502b3c2d44d Steven J. Hill 2017-01-25  421  	/* Step 5d: Cofngiure PHYs. SKIP */
93e502b3c2d44d Steven J. Hill 2017-01-25  422  
93e502b3c2d44d Steven J. Hill 2017-01-25  423  	/* Step 6a & 6b: Power up PHYs. */
93e502b3c2d44d Steven J. Hill 2017-01-25  424  	uctl_ctl.s.hs_power_en = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  425  	uctl_ctl.s.ss_power_en = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  426  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  427  
93e502b3c2d44d Steven J. Hill 2017-01-25  428  	/* Step 7: Wait 10 controller-clock cycles to take effect. */
93e502b3c2d44d Steven J. Hill 2017-01-25  429  	udelay(10);
93e502b3c2d44d Steven J. Hill 2017-01-25  430  
93e502b3c2d44d Steven J. Hill 2017-01-25  431  	/* Step 8a: Deassert UCTL reset signal. */
93e502b3c2d44d Steven J. Hill 2017-01-25  432  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  433  	uctl_ctl.s.uctl_rst = 0;
93e502b3c2d44d Steven J. Hill 2017-01-25  434  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  435  
93e502b3c2d44d Steven J. Hill 2017-01-25  436  	/* Step 8b: Wait 10 controller-clock cycles. */
93e502b3c2d44d Steven J. Hill 2017-01-25  437  	udelay(10);
93e502b3c2d44d Steven J. Hill 2017-01-25  438  
93e502b3c2d44d Steven J. Hill 2017-01-25  439  	/* Steo 8c: Setup power-power control. */
93e502b3c2d44d Steven J. Hill 2017-01-25  440  	if (dwc3_octeon_config_power(dev, base)) {
93e502b3c2d44d Steven J. Hill 2017-01-25  441  		dev_err(dev, "Error configuring power.\n");
93e502b3c2d44d Steven J. Hill 2017-01-25  442  		return -EINVAL;
93e502b3c2d44d Steven J. Hill 2017-01-25  443  	}
93e502b3c2d44d Steven J. Hill 2017-01-25  444  
93e502b3c2d44d Steven J. Hill 2017-01-25  445  	/* Step 8d: Deassert UAHC reset signal. */
93e502b3c2d44d Steven J. Hill 2017-01-25  446  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  447  	uctl_ctl.s.uahc_rst = 0;
93e502b3c2d44d Steven J. Hill 2017-01-25  448  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  449  
93e502b3c2d44d Steven J. Hill 2017-01-25  450  	/* Step 8e: Wait 10 controller-clock cycles. */
93e502b3c2d44d Steven J. Hill 2017-01-25  451  	udelay(10);
93e502b3c2d44d Steven J. Hill 2017-01-25  452  
93e502b3c2d44d Steven J. Hill 2017-01-25  453  	/* Step 9: Enable conditional coprocessor clock of UCTL. */
93e502b3c2d44d Steven J. Hill 2017-01-25  454  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  455  	uctl_ctl.s.csclk_en = 1;
93e502b3c2d44d Steven J. Hill 2017-01-25  456  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  457  
93e502b3c2d44d Steven J. Hill 2017-01-25  458  	/*Step 10: Set for host mode only. */
93e502b3c2d44d Steven J. Hill 2017-01-25  459  	uctl_ctl.u64 = cvmx_read_csr(uctl_ctl_reg);
93e502b3c2d44d Steven J. Hill 2017-01-25  460  	uctl_ctl.s.drd_mode = 0;
93e502b3c2d44d Steven J. Hill 2017-01-25  461  	cvmx_write_csr(uctl_ctl_reg, uctl_ctl.u64);
93e502b3c2d44d Steven J. Hill 2017-01-25  462  
93e502b3c2d44d Steven J. Hill 2017-01-25  463  	return 0;
93e502b3c2d44d Steven J. Hill 2017-01-25  464  }
93e502b3c2d44d Steven J. Hill 2017-01-25  465  

:::::: The code at line 399 was first introduced by commit
:::::: 93e502b3c2d44dcb964141cbf82930282de8e40b MIPS: OCTEON: Platform support for OCTEON III USB controller

:::::: TO: Steven J. Hill <Steven.Hill@cavium.com>
:::::: CC: James Hogan <james.hogan@imgtec.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
