Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817D62B545
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692725534; x=1724261534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g7LHkWA1qRmIXZQadUuN7Bgc63tA0DAL6/j+AWVD3Ng=;
  b=DpTKXy9gnY+9GuMADz7Fl6qd43xMwyrkspCXwHcpJX4Mo6nSnEFIX3zl
   eI34IwqAct6ZvGSUCVPNWwje0ZNwOj8oIGMW1vNXGwSzj5Q+77KQ1Cyps
   zHEspJ2gkttWBCFE7xjtHQHDto5NfnWyhWu3Gz3fwLGvbC9R3lZs/myAb
   iQESlGLR7pXmoVHAAn8uYJJtOjE7p2EY+tTLpsxer8moAS77EXUgEa2p4
   yIWW1J6Y+VACLbm1twNwwC1EUa6n6sAnUlVyQmoYnVSjr+hoZyKuArGrB
   Vz5gIuCBDjJA/dmz1g34fWvhYW0OC9yzgbjKxfMrtugYKBEEVu/pAozmt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440316364"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="440316364"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 10:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982982533"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="982982533"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 10:31:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYVEH-0000NU-0t;
	Tue, 22 Aug 2023 17:31:45 +0000
Date: Wed, 23 Aug 2023 01:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14981/30000]
 drivers/of/fdt.c:91: warning: Function parameter or member 'channel' not
 described in 'of_fdt_get_ddrhbb'
Message-ID: <202308230121.JB9mQskG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   ef983429ea2180ce7f3b17f1c8f5bff8ae61c1fa
commit: 643e14cfa2005090a6a3a3949191f4baa7b434e7 [14981/30000] ANDROID: GKI: drivers: of: Add APIs to find DDR device rank, HBB
config: x86_64-randconfig-003-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230121.JB9mQskG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230121.JB9mQskG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230121.JB9mQskG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/fdt.c:91: warning: Function parameter or member 'channel' not described in 'of_fdt_get_ddrhbb'
>> drivers/of/fdt.c:91: warning: Function parameter or member 'rank' not described in 'of_fdt_get_ddrhbb'
>> drivers/of/fdt.c:122: warning: Function parameter or member 'channel' not described in 'of_fdt_get_ddrrank'
   drivers/of/fdt.c:242: warning: Function parameter or member 'blob' not described in 'of_fdt_match'
   drivers/of/fdt.c:242: warning: Function parameter or member 'node' not described in 'of_fdt_match'
   drivers/of/fdt.c:242: warning: Function parameter or member 'compat' not described in 'of_fdt_match'
   drivers/of/fdt.c:645: warning: Function parameter or member 'node' not described in '__reserved_mem_reserve_reg'
   drivers/of/fdt.c:645: warning: Function parameter or member 'uname' not described in '__reserved_mem_reserve_reg'
   drivers/of/fdt.c:691: warning: Function parameter or member 'node' not described in '__reserved_mem_check_root'
   drivers/of/fdt.c:713: warning: Function parameter or member 'node' not described in '__fdt_scan_reserved_mem'
   drivers/of/fdt.c:713: warning: Function parameter or member 'uname' not described in '__fdt_scan_reserved_mem'
   drivers/of/fdt.c:713: warning: Function parameter or member 'depth' not described in '__fdt_scan_reserved_mem'
   drivers/of/fdt.c:713: warning: Function parameter or member 'data' not described in '__fdt_scan_reserved_mem'
   drivers/of/fdt.c:831: warning: Function parameter or member 'parent' not described in 'of_scan_flat_dt_subnodes'
   drivers/of/fdt.c:886: warning: Function parameter or member 'node' not described in 'of_get_flat_dt_prop'
   drivers/of/fdt.c:886: warning: Function parameter or member 'name' not described in 'of_get_flat_dt_prop'
   drivers/of/fdt.c:886: warning: Function parameter or member 'size' not described in 'of_get_flat_dt_prop'
   drivers/of/fdt.c:904: warning: Function parameter or member 'node' not described in 'of_flat_dt_match'
   drivers/of/fdt.c:904: warning: Function parameter or member 'compat' not described in 'of_flat_dt_match'
   drivers/of/fdt.c:912: warning: Function parameter or member 'node' not described in 'of_get_flat_dt_phandle'
   drivers/of/fdt.c:1085: warning: Function parameter or member 'node' not described in 'early_init_dt_scan_root'
   drivers/of/fdt.c:1085: warning: Function parameter or member 'uname' not described in 'early_init_dt_scan_root'
   drivers/of/fdt.c:1085: warning: Function parameter or member 'depth' not described in 'early_init_dt_scan_root'
   drivers/of/fdt.c:1085: warning: Function parameter or member 'data' not described in 'early_init_dt_scan_root'
   drivers/of/fdt.c:1121: warning: Function parameter or member 'node' not described in 'early_init_dt_scan_memory'
   drivers/of/fdt.c:1121: warning: Function parameter or member 'uname' not described in 'early_init_dt_scan_memory'
   drivers/of/fdt.c:1121: warning: Function parameter or member 'depth' not described in 'early_init_dt_scan_memory'
   drivers/of/fdt.c:1121: warning: Function parameter or member 'data' not described in 'early_init_dt_scan_memory'


vim +91 drivers/of/fdt.c

    82	
    83	/**
    84	 * of_fdt_get_ddrhbb - Return the highest bank bit of ddr on the current device
    85	 *
    86	 * On match, returns a non-zero positive value which matches the highest bank
    87	 * bit.
    88	 * Otherwise returns -ENOENT.
    89	 */
    90	int of_fdt_get_ddrhbb(int channel, int rank)
  > 91	{
    92		int memory;
    93		int len;
    94		int ret;
    95		/* Single spaces reserved for channel(0-9), rank(0-9) */
    96		char pname[] = "ddr_device_hbb_ch _rank ";
    97		fdt32_t *prop = NULL;
    98	
    99		memory = fdt_path_offset(initial_boot_params, "/memory");
   100		if (memory > 0) {
   101			snprintf(pname, sizeof(pname),
   102				 "ddr_device_hbb_ch%d_rank%d", channel, rank);
   103			prop = fdt_getprop_w(initial_boot_params, memory,
   104					     pname, &len);
   105		}
   106	
   107		if (!prop || len != sizeof(u32))
   108			return -ENOENT;
   109	
   110		ret = fdt32_to_cpu(*prop);
   111	
   112		return ret;
   113	}
   114	
   115	/**
   116	 * of_fdt_get_ddrrank - Return the rank of ddr on the current device
   117	 *
   118	 * On match, returns a non-zero positive value which matches the ddr rank.
   119	 * Otherwise returns -ENOENT.
   120	 */
   121	int of_fdt_get_ddrrank(int channel)
 > 122	{
   123		int memory;
   124		int len;
   125		int ret;
   126		/* Single space reserved for channel(0-9) */
   127		char pname[] = "ddr_device_rank_ch ";
   128		fdt32_t *prop = NULL;
   129	
   130		memory = fdt_path_offset(initial_boot_params, "/memory");
   131		if (memory > 0) {
   132			snprintf(pname, sizeof(pname),
   133				 "ddr_device_rank_ch%d", channel);
   134			prop = fdt_getprop_w(initial_boot_params, memory,
   135					     pname, &len);
   136		}
   137	
   138		if (!prop || len != sizeof(u32))
   139			return -ENOENT;
   140	
   141		ret = fdt32_to_cpu(*prop);
   142	
   143		return ret;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
