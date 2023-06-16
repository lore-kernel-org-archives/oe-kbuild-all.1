Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683F13AC9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686933886; x=1718469886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tW1yRWC3AwKouOo+d914EFIrhMJtRDhrGTvwZZeIS4g=;
  b=P/pObxxbWDpJWK1jUIwyfjJUXlxCtcnsBjlSBnUXkpVwSW/LrjJYdfzY
   NZzVIYsACXIHPmCW849YlZ5ff/8hM1y6/avoFZ1YmdyRdEoJvwoQvOJYm
   0PyQBZ0jjZdvFrO+5DgJ7w8cgD274oSslN+defDr22KjHm1eDFoviPg1b
   QEBwAB+YZAMJ++Zq7PJt+Vjc5GJxjOcMfv/GWpeb6gPVYDSvOeKdttmw0
   uKIgagxeAht4QgE3EIdqhYSlxsVuva4EtKkpTy0eoGw2TjEm5FIBPBmQr
   0k4HMOdL2WsFK81IrDeLaceqNU2g4H/CeWc1oanGFKDu2YRh4N9xtxPLO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="359266393"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="359266393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 09:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="742728340"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="742728340"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 09:44:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qACZ1-0001ZV-1j;
	Fri, 16 Jun 2023 16:44:43 +0000
Date: Sat, 17 Jun 2023 00:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 17/21]
 arch/mips/kernel/cpu-probe.c:2125:9: error: duplicate case value
Message-ID: <202306170050.Ewjpvwdj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   895b71aed48a7ee9e465284c62999d2259e1c943
commit: 08396271c918fbd2764ed4d8b459483c742783b0 [17/21] MIPS: Restore Au1300 support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230617/202306170050.Ewjpvwdj-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170050.Ewjpvwdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170050.Ewjpvwdj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/cpu-probe.c: In function 'cpu_probe':
>> arch/mips/kernel/cpu-probe.c:2125:9: error: duplicate case value
    2125 |         case PRID_COMP_NETLOGIC:
         |         ^~~~
   arch/mips/kernel/cpu-probe.c:2099:9: note: previously used here
    2099 |         case PRID_COMP_NETLOGIC:
         |         ^~~~


vim +2125 arch/mips/kernel/cpu-probe.c

9966db25defba4 Ralf Baechle       2007-10-11  2070  
078a55fc824c16 Paul Gortmaker     2013-06-18  2071  void cpu_probe(void)
^1da177e4c3f41 Linus Torvalds     2005-04-16  2072  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2073  	struct cpuinfo_mips *c = &current_cpu_data;
9966db25defba4 Ralf Baechle       2007-10-11  2074  	unsigned int cpu = smp_processor_id();
^1da177e4c3f41 Linus Torvalds     2005-04-16  2075  
05510f2b481939 Marcin Nowakowski  2017-03-07  2076  	/*
05510f2b481939 Marcin Nowakowski  2017-03-07  2077  	 * Set a default elf platform, cpu probe may later
05510f2b481939 Marcin Nowakowski  2017-03-07  2078  	 * overwrite it with a more precise value
05510f2b481939 Marcin Nowakowski  2017-03-07  2079  	 */
05510f2b481939 Marcin Nowakowski  2017-03-07  2080  	set_elf_platform(cpu, "mips");
05510f2b481939 Marcin Nowakowski  2017-03-07  2081  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2082  	c->processor_id = PRID_IMP_UNKNOWN;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2083  	c->fpu_id	= FPIR_IMP_NONE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2084  	c->cputype	= CPU_UNKNOWN;
4f12b91d2da577 Markos Chandras    2014-07-18  2085  	c->writecombine = _CACHE_UNCACHED;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2086  
9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2087  	c->fpu_csr31	= FPU_CSR_RN;
9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2088  	c->fpu_msk31	= FPU_CSR_RSVD | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2089  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2090  	c->processor_id = read_c0_prid();
8ff374b9c296b9 Maciej W. Rozycki  2013-09-17  2091  	switch (c->processor_id & PRID_COMP_MASK) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2092  	case PRID_COMP_LEGACY:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2093  		cpu_probe_legacy(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2094  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2095  	case PRID_COMP_MIPS:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2096  		cpu_probe_mips(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2097  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2098  	case PRID_COMP_ALCHEMY:
08396271c918fb Manuel Lauss       2023-05-10  2099  	case PRID_COMP_NETLOGIC:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2100  		cpu_probe_alchemy(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2101  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2102  	case PRID_COMP_SIBYTE:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2103  		cpu_probe_sibyte(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2104  		break;
1c0c13eb935c95 Aurelien Jarno     2007-09-25  2105  	case PRID_COMP_BROADCOM:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2106  		cpu_probe_broadcom(c, cpu);
1c0c13eb935c95 Aurelien Jarno     2007-09-25  2107  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2108  	case PRID_COMP_SANDCRAFT:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2109  		cpu_probe_sandcraft(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2110  		break;
a92b05880d261e Daniel Laird       2008-03-06  2111  	case PRID_COMP_NXP:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2112  		cpu_probe_nxp(c, cpu);
bdf21b18b4abf9 Pete Popov         2005-07-14  2113  		break;
0dd4781bca5687 David Daney        2008-12-11  2114  	case PRID_COMP_CAVIUM:
0dd4781bca5687 David Daney        2008-12-11  2115  		cpu_probe_cavium(c, cpu);
0dd4781bca5687 David Daney        2008-12-11  2116  		break;
b2edcfc814017e Huacai Chen        2016-03-03  2117  	case PRID_COMP_LOONGSON:
b2edcfc814017e Huacai Chen        2016-03-03  2118  		cpu_probe_loongson(c, cpu);
b2edcfc814017e Huacai Chen        2016-03-03  2119  		break;
252617a4ab714d Paul Burton        2015-05-24  2120  	case PRID_COMP_INGENIC_D0:
252617a4ab714d Paul Burton        2015-05-24  2121  	case PRID_COMP_INGENIC_D1:
252617a4ab714d Paul Burton        2015-05-24  2122  	case PRID_COMP_INGENIC_E1:
83ccf69d8f1183 Lars-Peter Clausen 2010-07-17  2123  		cpu_probe_ingenic(c, cpu);
83ccf69d8f1183 Lars-Peter Clausen 2010-07-17  2124  		break;
a7117c6bddcbff Jayachandran C     2011-05-11 @2125  	case PRID_COMP_NETLOGIC:
a7117c6bddcbff Jayachandran C     2011-05-11  2126  		cpu_probe_netlogic(c, cpu);
a7117c6bddcbff Jayachandran C     2011-05-11  2127  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2128  	}
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2129  
cea7e2dfdef53f Ralf Baechle       2008-10-30  2130  	BUG_ON(!__cpu_name[cpu]);
cea7e2dfdef53f Ralf Baechle       2008-10-30  2131  	BUG_ON(c->cputype == CPU_UNKNOWN);
cea7e2dfdef53f Ralf Baechle       2008-10-30  2132  
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2133  	/*
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2134  	 * Platform code can force the cpu type to optimize code
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2135  	 * generation. In that case be sure the cpu type is correctly
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2136  	 * manually setup otherwise it could trigger some nasty bugs.
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2137  	 */
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2138  	BUG_ON(current_cpu_type() != c->cputype);
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2139  
2e274768e4dd95 Florian Fainelli   2016-02-09  2140  	if (cpu_has_rixi) {
2e274768e4dd95 Florian Fainelli   2016-02-09  2141  		/* Enable the RIXI exceptions */
2e274768e4dd95 Florian Fainelli   2016-02-09  2142  		set_c0_pagegrain(PG_IEC);
2e274768e4dd95 Florian Fainelli   2016-02-09  2143  		back_to_back_c0_hazard();
2e274768e4dd95 Florian Fainelli   2016-02-09  2144  		/* Verify the IEC bit is set */
2e274768e4dd95 Florian Fainelli   2016-02-09  2145  		if (read_c0_pagegrain() & PG_IEC)
2e274768e4dd95 Florian Fainelli   2016-02-09  2146  			c->options |= MIPS_CPU_RIXIEX;
2e274768e4dd95 Florian Fainelli   2016-02-09  2147  	}
2e274768e4dd95 Florian Fainelli   2016-02-09  2148  
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2149  	if (mips_fpu_disabled)
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2150  		c->options &= ~MIPS_CPU_FPU;
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2151  
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2152  	if (mips_dsp_disabled)
ee80f7c73dc1b1 Steven J. Hill     2012-08-03  2153  		c->ases &= ~(MIPS_ASE_DSP | MIPS_ASE_DSP2P);
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2154  
3d528b326d7da8 Markos Chandras    2014-07-14  2155  	if (mips_htw_disabled) {
3d528b326d7da8 Markos Chandras    2014-07-14  2156  		c->options &= ~MIPS_CPU_HTW;
3d528b326d7da8 Markos Chandras    2014-07-14  2157  		write_c0_pwctl(read_c0_pwctl() &
3d528b326d7da8 Markos Chandras    2014-07-14  2158  			       ~(1 << MIPS_PWCTL_PWEN_SHIFT));
3d528b326d7da8 Markos Chandras    2014-07-14  2159  	}
3d528b326d7da8 Markos Chandras    2014-07-14  2160  
7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2161  	if (c->options & MIPS_CPU_FPU)
7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2162  		cpu_set_fpu_opts(c);
7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2163  	else
7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2164  		cpu_set_nofpu_opts(c);
9966db25defba4 Ralf Baechle       2007-10-11  2165  
8d5ded16ee7564 Joshua Kinard      2015-06-02  2166  	if (cpu_has_bp_ghist)
8d5ded16ee7564 Joshua Kinard      2015-06-02  2167  		write_c0_r10k_diag(read_c0_r10k_diag() |
8d5ded16ee7564 Joshua Kinard      2015-06-02  2168  				   R10K_DIAG_E_GHIST);
8d5ded16ee7564 Joshua Kinard      2015-06-02  2169  
8b8aa636f02879 Leonid Yegoshin    2014-11-13  2170  	if (cpu_has_mips_r2_r6) {
f6771dbb27c704 Ralf Baechle       2007-11-08  2171  		c->srsets = ((read_c0_srsctl() >> 26) & 0x0f) + 1;
da4b62cd6762ce Al Cooper          2012-07-13  2172  		/* R2 has Performance Counter Interrupt indicator */
da4b62cd6762ce Al Cooper          2012-07-13  2173  		c->options |= MIPS_CPU_PCI;
da4b62cd6762ce Al Cooper          2012-07-13  2174  	}
f6771dbb27c704 Ralf Baechle       2007-11-08  2175  	else
f6771dbb27c704 Ralf Baechle       2007-11-08  2176  		c->srsets = 1;
91dfc423cc8cfd Guenter Roeck      2010-02-02  2177  
4c0630346e2fcf Paul Burton        2015-07-27  2178  	if (cpu_has_mips_r6)
4c0630346e2fcf Paul Burton        2015-07-27  2179  		elf_hwcap |= HWCAP_MIPS_R6;
4c0630346e2fcf Paul Burton        2015-07-27  2180  
a8ad136789b425 Paul Burton        2014-01-28  2181  	if (cpu_has_msa) {
a5e9a69e2cb64c Paul Burton        2014-01-27  2182  		c->msa_id = cpu_get_msa_id();
a8ad136789b425 Paul Burton        2014-01-28  2183  		WARN(c->msa_id & MSA_IR_WRPF,
a8ad136789b425 Paul Burton        2014-01-28  2184  		     "Vector register partitioning unimplemented!");
3cc9fa7fb3e38e Paul Burton        2015-07-27  2185  		elf_hwcap |= HWCAP_MIPS_MSA;
a8ad136789b425 Paul Burton        2014-01-28  2186  	}
a5e9a69e2cb64c Paul Burton        2014-01-27  2187  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2188  	if (cpu_has_mips16)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2189  		elf_hwcap |= HWCAP_MIPS_MIPS16;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2190  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2191  	if (cpu_has_mdmx)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2192  		elf_hwcap |= HWCAP_MIPS_MDMX;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2193  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2194  	if (cpu_has_mips3d)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2195  		elf_hwcap |= HWCAP_MIPS_MIPS3D;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2196  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2197  	if (cpu_has_smartmips)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2198  		elf_hwcap |= HWCAP_MIPS_SMARTMIPS;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2199  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2200  	if (cpu_has_dsp)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2201  		elf_hwcap |= HWCAP_MIPS_DSP;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2202  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2203  	if (cpu_has_dsp2)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2204  		elf_hwcap |= HWCAP_MIPS_DSP2;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2205  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2206  	if (cpu_has_dsp3)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2207  		elf_hwcap |= HWCAP_MIPS_DSP3;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2208  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2209  	if (cpu_has_mips16e2)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2210  		elf_hwcap |= HWCAP_MIPS_MIPS16E2;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2211  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2212  	if (cpu_has_loongson_mmi)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2213  		elf_hwcap |= HWCAP_LOONGSON_MMI;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2214  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2215  	if (cpu_has_loongson_ext)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2216  		elf_hwcap |= HWCAP_LOONGSON_EXT;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2217  
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2218  	if (cpu_has_loongson_ext2)
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2219  		elf_hwcap |= HWCAP_LOONGSON_EXT2;
38dffe1e4dde1d Jiaxun Yang        2019-10-10  2220  
6ad816e77ed775 James Hogan        2016-05-11  2221  	if (cpu_has_vz)
6ad816e77ed775 James Hogan        2016-05-11  2222  		cpu_probe_vz(c);
6ad816e77ed775 James Hogan        2016-05-11  2223  
91dfc423cc8cfd Guenter Roeck      2010-02-02  2224  	cpu_probe_vmbits(c);
949e51bea342da David Daney        2010-10-14  2225  

:::::: The code at line 2125 was first introduced by commit
:::::: a7117c6bddcbfff2fa237a14a853b32cb94bf59a MIPS: Netlogic XLR/XLS processor IDs.

:::::: TO: Jayachandran C <jayachandranc@netlogicmicro.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
