Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDCC27F013
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 07:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503042; cv=none; b=qQEXT0ALRCSoOvtKw3Oo1g8dsmHKFEx2nFM4E7geIIZHiWaFdYdnqsfyBSiWaT4pUXMSJpx/f4eIW47mx6Vxt1y3/XdAkoAB8VaFez/Wzb0kxvF2b4ZqpPHI/MNhYU21f51tw0k+/7y0wzf8PvtSLGcOVl/QTMoYJmXJO3AzHDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503042; c=relaxed/simple;
	bh=sjh8C6mh/XS84JI/gJ0/xbjSwJZBeSpxC7f2Hvl2Hz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMqOnMtLFicNN3uylzAoyFAYNVyz67NgJGTmUJkdU8VWuaJ0IL6HtHlsRV/e7mCN+tG8pPLXMuCGGD/PgnNxPwvLyFzS2OdX8/THFienDlNJO9PAwmg4vqCD1ZNjIfxKcCmq71qEYjL7dTBfvBeEzmfKjp/K383GZgBsrqTK1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1vHDAkg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1vHDAkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755503040; x=1787039040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjh8C6mh/XS84JI/gJ0/xbjSwJZBeSpxC7f2Hvl2Hz4=;
  b=I1vHDAkg/hwIP+r+TO1flNQtXOA2oRTcx1fV0WlRUvYlbT7RZwDjCznI
   OIMMghftm9/pPc0zZmdGQ5yr0m2qWRBRu3U1+UDTTQLB41KiwFyW+eUCd
   JsQ0zR59G3Wt3mo6NGaGimBXb3kc01Kq1g1kp8WRinmpEpMoHaNZyHnBi
   FsHrKQgPax26TOZWQFFJ26G659pBqYosMiVRq9f291Payw1veOSMimhRT
   JEN0aKTJYOAi0ygKwLoX5buNHWx2KOErNaB70jcz/RV1CN80A6PbT0jcM
   TiRqpNKcCA9s5r/JvOl9bGyKtZP2s+ainHExAkepBOgrgp6ZIHrmbPfaH
   A==;
X-CSE-ConnectionGUID: D1plYseoQ+KtvR//quAfQg==
X-CSE-MsgGUID: WX4Fim5bScmOIGEVR5+klA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="61347631"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61347631"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:43:59 -0700
X-CSE-ConnectionGUID: WdaCtSLCTbGI8hoIznPwxg==
X-CSE-MsgGUID: Tnl/eNbQRL2IYbYrmVOh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167902823"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2025 00:43:58 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unuX6-00012t-2R;
	Mon, 18 Aug 2025 07:43:56 +0000
Date: Mon, 18 Aug 2025 09:43:51 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687]
 arch/x86/events/zhaoxin/uncore.c:2761:6: warning: no previous prototype for
 function 'kx5000_uncore_cpu_init'
Message-ID: <202508180932.bKWZIbb7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   08d6c0b8f95e9c676bd9bc28b12d198df722218e
commit: dc5b97374ba722156acbdfc4e3adbc69e2dbe7f4 [2687/2687] perf/x86/zhaoxin/uncore: Add KX-7000 support
config: x86_64-buildonly-randconfig-2003-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180932.bKWZIbb7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180932.bKWZIbb7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180932.bKWZIbb7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/zhaoxin/uncore.c:3:
   In file included from arch/x86/events/zhaoxin/uncore.h:3:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/events/zhaoxin/uncore.c:2761:6: warning: no previous prototype for function 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2761 | void kx5000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2761:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2761 | void kx5000_uncore_cpu_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2770:6: warning: no previous prototype for function 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2770 | void kh40000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2770:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2770 | void kh40000_uncore_cpu_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2775:5: warning: no previous prototype for function 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2775 | int kh40000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2775:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2775 | int kh40000_uncore_pci_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2791:6: warning: no previous prototype for function 'kx8000_uncore_cpu_init' [-Wmissing-prototypes]
    2791 | void kx8000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2791:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2791 | void kx8000_uncore_cpu_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2796:5: warning: no previous prototype for function 'kx8000_uncore_pci_init' [-Wmissing-prototypes]
    2796 | int kx8000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2796:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2796 | int kx8000_uncore_pci_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2804:6: warning: no previous prototype for function 'kx8000_uncore_mmio_init' [-Wmissing-prototypes]
    2804 | void kx8000_uncore_mmio_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2804:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2804 | void kx8000_uncore_mmio_init(void)
         | ^
         | static 
   7 warnings generated.


vim +/kx5000_uncore_cpu_init +2761 arch/x86/events/zhaoxin/uncore.c

  2760	
> 2761	void kx5000_uncore_cpu_init(void)
  2762	{
  2763		uncore_msr_uncores = kx5000_msr_uncores;
  2764	}
  2765	
  2766	static const struct zhaoxin_uncore_init_fun kx5000_uncore_init __initconst = {
  2767		.cpu_init = kx5000_uncore_cpu_init,
  2768	};
  2769	
> 2770	void kh40000_uncore_cpu_init(void)
  2771	{
  2772		uncore_msr_uncores = kh40000_msr_uncores;
  2773	}
  2774	
> 2775	int kh40000_uncore_pci_init(void)
  2776	{
  2777		int ret = kh40000_pci2node_map_init();/*pci_bus to package mapping, do nothing*/
  2778	
  2779		if (ret)
  2780			return ret;
  2781		uncore_pci_uncores = kh40000_pci_uncores;
  2782		uncore_pci_driver = &kh40000_uncore_pci_driver;
  2783		return 0;
  2784	}
  2785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
