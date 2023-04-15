Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8DFEA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681544303; x=1713080303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=foRrXKLbjtXKV0nR1z2WbkA9NPQO5m0me82WwyrkD7g=;
  b=VrBs6i6x8Fhxw5VsN9jCQgebyDgVxnvrAMes97aXffwG1l+LuIamk50u
   nP69zeqsVszOkBalYwBHZ1JQBicWbnWHNXngHSdrcUZssz1OYxuqElVxJ
   iMqg7k8xECvCpuXQM0CHcJK8cvBeTCWBos/yceaBbkZiuuDM3xpYRZplV
   aBMDLJQtF62SOp97YqJvZidXhHggJ7a2e727Om8p4ScHgvqvCIcKhkRZE
   k+xvmHdQwMaN6DpRWzkFZO/RqSF3niIb+PBMISN9XvA7r0+28cyejmbNx
   S5H8noX7sy4cZdI1m3cwsvc6cvtRXO950t4pM5qq+12A9F8jU+pj9ISJT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324973395"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324973395"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 00:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="1019866313"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="1019866313"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Apr 2023 00:38:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnaUG-000agz-2Q;
	Sat, 15 Apr 2023 07:38:20 +0000
Date: Sat, 15 Apr 2023 15:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 3578/9838]
 drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:205:26: warning: 'best_m' is
 used uninitialized
Message-ID: <202304151507.9jX96nEL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: fbc9c63f5eaa123239b5e21fee0c41a4b52bd831 [3578/9838] LF-6250-2 phy: freescale: Add i.MX93 Synopsys DesignWare MIPI DPHY support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151507.9jX96nEL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/fbc9c63f5eaa123239b5e21fee0c41a4b52bd831
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout fbc9c63f5eaa123239b5e21fee0c41a4b52bd831
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/dma/ drivers/phy/freescale/ sound/soc/sof/amd/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151507.9jX96nEL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:25,
                    from include/linux/clk.h:13,
                    from drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:8:
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c: In function 'dw_dphy_config_from_opts':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:17: note: in expansion of macro 'do_div'
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:6:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:17: note: in expansion of macro 'do_div'
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
   include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long unsigned int *
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:17: note: in expansion of macro 'do_div'
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
>> drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:205:26: warning: 'best_m' is used uninitialized [-Wuninitialized]
     205 |         unsigned long m, best_m;
         |                          ^~~~~~
>> drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:204:39: warning: 'best_n' is used uninitialized [-Wuninitialized]
     204 |         unsigned int min_n, max_n, n, best_n;
         |                                       ^~~~~~
   cc1: some warnings being treated as errors


vim +/best_m +205 drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c

   193	
   194	static int
   195	dw_dphy_config_from_opts(struct phy *phy,
   196				 struct phy_configure_opts_mipi_dphy *dphy_opts,
   197				 struct dw_dphy_cfg *cfg)
   198	{
   199		struct dw_dphy_priv *priv = phy_get_drvdata(phy);
   200		unsigned long fin = priv->ref_clk_rate;
   201		unsigned long fout;
   202		unsigned long best_fout = 0;
   203		unsigned int fvco_div;
 > 204		unsigned int min_n, max_n, n, best_n;
 > 205		unsigned long m, best_m;
   206		unsigned long min_delta = ULONG_MAX;
   207		unsigned long tmp, delta;
   208	
   209		if (dphy_opts->hs_clk_rate < DATA_RATE_MIN_SPEED ||
   210		    dphy_opts->hs_clk_rate > DATA_RATE_MAX_SPEED) {
   211			dev_dbg(&phy->dev, "invalid data rate per lane: %lu\n",
   212				dphy_opts->hs_clk_rate);
   213			return -EINVAL;
   214		}
   215	
   216		fout = data_rate_to_fout(dphy_opts->hs_clk_rate);
   217	
   218		/* Fout = Fvco / Fvco_div = (Fin * M) / (Fvco_div * N) */
   219		fvco_div = 8UL / min(DIV_ROUND_UP(fout, FVCO_DIV_FACTOR), 8UL);
   220	
   221		/* limitation: 2MHz <= Fin / N <= 8MHz */
   222		min_n = DIV_ROUND_UP(fin, MHZ(8));
   223		max_n = DIV_ROUND_DOWN_ULL(fin, MHZ(2));
   224	
   225		/* clamp possible N(s) */
   226		min_n = clamp(min_n, N_MIN, N_MAX);
   227		max_n = clamp(max_n, N_MIN, N_MAX);
   228	
   229		dev_dbg(&phy->dev, "Fout = %lu, Fvco_div = %u, n_range = [%u, %u]\n",
   230			fout, fvco_div, min_n, max_n);
   231	
   232		for (n = min_n; n <= max_n; n++) {
   233			/* M = (Fout * N * Fvco_div) / Fin */
   234			tmp = fout * n * fvco_div;
   235			m = DIV_ROUND_CLOSEST(tmp, fin);
   236	
   237			/* check M range */
   238			if (m < M_MIN || m > M_MAX)
   239				continue;
   240	
   241			/* calculate temporary Fout */
   242			tmp = m * fin;
   243			do_div(tmp, n * fvco_div);
   244			if (tmp < FOUT_MIN || tmp > FOUT_MAX)
   245				continue;
   246	
   247			delta = abs(fout - tmp);
   248			if (delta < min_delta) {
   249				best_n = n;
   250				best_m = m;
   251				min_delta = delta;
   252				best_fout = tmp;
   253			}
   254		}
   255	
   256		if (best_fout) {
   257			cfg->m = best_m;
   258			cfg->n = best_n;
   259			dphy_opts->hs_clk_rate = best_fout * 2;
   260			dev_dbg(&phy->dev, "best Fout = %lu, m = %u, n = %u\n",
   261				best_fout, cfg->m, cfg->n);
   262		} else {
   263			dev_dbg(&phy->dev, "failed to find best Fout\n");
   264			return -EINVAL;
   265		}
   266	
   267		return 0;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
