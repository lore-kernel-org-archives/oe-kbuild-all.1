Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638C442044
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 22:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713651253; cv=none; b=KxgF3BR5FFRZ53CJE7nHz4n6JGH4n/E83BKY9GV4amoFxp8dXfzz0siv1T1PDGkpnV3dcdfpBwfjeYOHsRpBhMIplMjvgQrpQG3LB7opKaRIxs8cK9t+nSGqXbz/F29/EDMy+XdUHgxUmWXUNV5xZWidjNGMMPo3OKcG26cAT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713651253; c=relaxed/simple;
	bh=US7/XIMMufc7DTqN4sxsbNQgKw2Oh/zTgJK2dwtLzTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJ+vjkGbNty8Ri4eBswtV9q3kvPm7O5Bi66tlKu3AHimYwR4LTVIqjfSZ0YlYraGEXhtIChzxqKYrEpikOE+oz0++KLqYqZhfINBLumID9Kld9rgUUfkvXUibedPZpqnHx/5x9IZ20ZsitFrhR0+ixIQ5sY4PD/VneQsibVmO/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J91l9ZDU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J91l9ZDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713651250; x=1745187250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=US7/XIMMufc7DTqN4sxsbNQgKw2Oh/zTgJK2dwtLzTM=;
  b=J91l9ZDUM8/nxDuJ0n5Zmj3SS9D2+nc/0VZNBVUkJ/QW9NnrdHQWNJMC
   nVOpji2/vJIdLXmfc1fv/ruj9fRZlnBPGPoo8305cbV0HxfCktwCM1r76
   Zg+vMFQKeyNVmQF6s56R51MXWJn5vMMAbbBmLx+P8njzWnd5TtwWoGXp7
   huYg0s8d4zN+xO0/4VAnho637d2K8xMd6Lpd840EKYJMeQr/HedI1GJbI
   IxoDktKW6X89BoNKDUaG+eGrOXZ+3h6sp/78n5hHY6mcygLa1qHF8RHgp
   qjqQfU0RFu1lKVf7pRBlRIt1JDobvNK5ZhiX67+7qXyoS9i3Of7VirLUk
   A==;
X-CSE-ConnectionGUID: PmbTmXXrQVSW+qm6m+D1aQ==
X-CSE-MsgGUID: jHKDLwK7RfWzQDCC05pIvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="34625785"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="34625785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 15:14:09 -0700
X-CSE-ConnectionGUID: +MPyexwpQwmxVkvTUE/TuA==
X-CSE-MsgGUID: aUMY8HdUQbWJNNJDFzB/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="23728090"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Apr 2024 15:14:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryIyE-000BWo-0U;
	Sat, 20 Apr 2024 22:14:06 +0000
Date: Sun, 21 Apr 2024 06:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 3578/18115]
 drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:3: error: incompatible
 pointer types passing 'unsigned long *' to parameter of type 'uint64_t *'
 (aka 'unsigned long long *')
Message-ID: <202404210610.PQxeXLEM-lkp@intel.com>
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
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240421/202404210610.PQxeXLEM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404210610.PQxeXLEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404210610.PQxeXLEM-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:3: warning: comparison of distinct pointer types ('typeof ((tmp)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:3: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     243 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   drivers/phy/freescale/phy-fsl-imx93-mipi-dphy.c:243:3: warning: shift count >= width of type [-Wshift-count-overflow]
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
