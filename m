Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD2B12F585
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713539825; cv=none; b=eBH92Xr6+aFYguA6ZzMvclRqT4n7uibkghv7tvT8je8MLb+acEDpnKBc5LNHPC5LHFHsWYXjONUaFdISbIPD9J9fq5CA8t2Jx+rWUjL83bb+M71v1UYSceQzLfYD56loGtEcvgdQ0yfyEpaJeabj1Ri9J28zOazXvR3G1BeE46s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713539825; c=relaxed/simple;
	bh=JNSQogEP4GLLIYI4cYfVfWd/n5hwrJvFQvNP6d8xzzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKoAw7TBnryHAr4SWcVKUcYtzwH4T8yJTtLHIIZiZ9doIdBBdoSHb2FRxTCVqTNAcuIO4iTR5nAGf2ZB0XJKFBxaYbiPdDrxSHzR/dBCASNfmmyXM+i5+WdeGilLz8gANcUgMQAGw95VeGZdHxPs/BFrQpeqx40mvmN6+iml5Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfgtTmnZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfgtTmnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713539824; x=1745075824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JNSQogEP4GLLIYI4cYfVfWd/n5hwrJvFQvNP6d8xzzo=;
  b=HfgtTmnZPhsxoE0XuSvCeGYsHPgpoves5boYWfGa+g7y9YumgX1lS1ml
   h/RFjL4zftsqPXWnd+nu/YH3ny4at7myE7HOR6sSOz971vdZmouH1S5vR
   6rjxgy7dXJBeBlpK4KYDlyiPy0W7jTZOF8LElvrRYV5samG/+Qf2xZB52
   KBGQlNZkznHvGke5qSn84ZkkkBSY87X1igt88Jp+9GcXkiE80vLa3GWbh
   r9Srf47zkmTO/4Itp8hjSas98EZZ47tf5/499thZBaBnX0pmBwGQyl81F
   OSgJlUYaycrvm0UOm5G49queV/wg6r3OAWE7EIQNRbyM9SKLxqHYlcjT3
   Q==;
X-CSE-ConnectionGUID: Fm9CwPkzQlGcoOJL9tTCQw==
X-CSE-MsgGUID: n0ddQu7DQEGZyNw+vD7onA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9016555"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9016555"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 08:17:03 -0700
X-CSE-ConnectionGUID: Z/WbAmkdS+Oe/wzhcM3M/w==
X-CSE-MsgGUID: BkeC25fATvSeC1ulNHBt2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="23978196"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Apr 2024 08:17:01 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxpz1-000AEZ-0V;
	Fri, 19 Apr 2024 15:16:59 +0000
Date: Fri, 19 Apr 2024 23:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 3578/18115]
 drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:3: warning: comparison
 of distinct pointer types ('typeof ((tmp)) *' (aka 'unsigned long *') and
 'uint64_t *' (aka 'unsigned long long *'))
Message-ID: <202404192322.hPFsvhYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: fbc9c63f5eaa123239b5e21fee0c41a4b52bd831 [3578/18115] LF-6250-2 phy: freescale: Add i.MX93 Synopsys DesignWare MIPI DPHY support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404192322.hPFsvhYs-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404192322.hPFsvhYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404192322.hPFsvhYs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:15:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:1748:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:3: warning: comparison of distinct pointer types ('typeof ((tmp)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:3: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:3: warning: shift count >= width of type [-Wshift-count-overflow]
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   9 warnings and 1 error generated.


vim +243 drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c

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
   204		unsigned int min_n, max_n, n, best_n;
   205		unsigned long m, best_m;
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
 > 243			do_div(tmp, n * fvco_div);
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
https://github.com/intel/lkp-tests/wiki
