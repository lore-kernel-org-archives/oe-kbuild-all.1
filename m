Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A106190678
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230575; cv=none; b=BtK675pICBct8g5HRWmh5KWBOP58o4t4A2ss4Pxt8+m+GQErvKIibKNl9imyKXS+JxD/oGF3KlP/J9vF1cD3UjyNhBrXHctdj9wh/578B4Ehu7b13cGpyy8Yf6+AhkKKCddq8ogMbHtCkiTYpDHTvMhuxuJu/oWicKEaL15eSkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230575; c=relaxed/simple;
	bh=IEuLS7BNaW+7HaA25uWFY+LkFuge6YY0H2+I4UdpMQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXVTG87XefQFxy4Fsme+B/RaUUk+/tURcGwRmpYHtWBJ2ik1OOYu17v9/gXzDKcTIvtXmDzQF5qeN6va6mNxJsxIsVtiqNtoYpqhMeE2c5dxbLEn2UHZ2MiED0rl5kE++55KDMYzm3ou8eI5LOtl/DdTAJpq5Kd5YMaEb+JKE+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEYtr307; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEYtr307"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747230573; x=1778766573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IEuLS7BNaW+7HaA25uWFY+LkFuge6YY0H2+I4UdpMQk=;
  b=SEYtr307cGrOdu41zc17ugWheM+IDGQZptnJAW75F+nUbjKeJIVedMmk
   N8e8/9jHqA0uo10iK7ydGd8sP1s4P12avAkrh9H/H9p8rOJLhyYw2mYnf
   PN7FPnBOtBp/rgMg15tsu17uTo9aF/CGuQiUQI2G6p8wkN4kttqKWwHfQ
   xJTRkiE1blgmglY3BoVtIXCTle48dXI0vIyjdh7IOEwzMOXw0gGQ5auIw
   sgPS/iKnHuqReFFFz+8k4Nw42kuZyMEP22v2OWl9zNeU425v2TCAriwSg
   73D7Rvg+gpO894tmSnvYmY62x25u3OzcwRr4qidYLify5DLWX1hEXks86
   Q==;
X-CSE-ConnectionGUID: eYUC7chHSTi+PlyBDV9GPQ==
X-CSE-MsgGUID: w31wxcJvTouCTdR5huAiEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60465291"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="60465291"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 06:49:31 -0700
X-CSE-ConnectionGUID: I3C6IGN1QCaxWKYhsIntwg==
X-CSE-MsgGUID: 6A4cGLq6TcuVTf8R8pW7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="168992604"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2025 06:49:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFCUB-000HBP-2J;
	Wed, 14 May 2025 13:49:27 +0000
Date: Wed, 14 May 2025 21:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: [linux-next:master 7301/11093]
 arch/loongarch/include/asm/topology.h:44:17: error: 'cpu_llc_shared_map'
 undeclared
Message-ID: <202505142134.zoIE14Sa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
commit: a858c56a724bbdbb895ebd166b3f78db8a66224d [7301/11093] LoongArch: Add SCHED_MC (Multi-core scheduler) support
config: loongarch-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250514/202505142134.zoIE14Sa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142134.zoIE14Sa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142134.zoIE14Sa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/topology.h:36,
                    from include/linux/gfp.h:8,
                    from include/linux/mm.h:7,
                    from arch/loongarch/kernel/asm-offsets.c:9:
   arch/loongarch/include/asm/topology.h: In function 'cpu_coregroup_mask':
>> arch/loongarch/include/asm/topology.h:44:17: error: 'cpu_llc_shared_map' undeclared (first use in this function)
      44 |         return &cpu_llc_shared_map[cpu];
         |                 ^~~~~~~~~~~~~~~~~~
   arch/loongarch/include/asm/topology.h:44:17: note: each undeclared identifier is reported only once for each function it appears in
   arch/loongarch/include/asm/topology.h:42:60: warning: parameter 'cpu' set but not used [-Wunused-but-set-parameter]
      42 | static inline const struct cpumask *cpu_coregroup_mask(int cpu)
         |                                                        ~~~~^~~
   make[3]: *** [scripts/Makefile.build:98: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=4226634471
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=4226634471
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4226634471
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4226634471
   make: Target 'prepare' not remade because of errors.


vim +/cpu_llc_shared_map +44 arch/loongarch/include/asm/topology.h

    38	
    39	/*
    40	 * Return cpus that shares the last level cache.
    41	 */
    42	static inline const struct cpumask *cpu_coregroup_mask(int cpu)
    43	{
  > 44		return &cpu_llc_shared_map[cpu];
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
