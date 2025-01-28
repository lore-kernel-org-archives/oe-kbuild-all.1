Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CAC2AD2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 02:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738031302; cv=none; b=IglxXJd/JWmIqKhHNl51EFrfWV+8hvB/dpAAYf/9HHOk6LC2XnTkloePWDk4kiAEXYjArEAOnnSiXGkF0huEiSQrCV7w1DQbW0q7VAjkd5yLQF9tBTzBRWXm5mZt8YLPxn7ud+FZxWXoBWxt1tzHIZfkd+l4qEv3azxb/ATt88U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738031302; c=relaxed/simple;
	bh=sKOwVxJ7bz/F2/1ynGCL+LlcoGOQrWwSKPUB/OSMiwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmUGqEHGCmWvMEKgZBqz+FLDiT9itczFzWesogLwWTvSz+AlNxqxjI4FcPY6CsgnFPwg3pYhzFe+XdxnnW6mzW/Yfh8sB4aAu3h97zP8IrOxCf5K5pHhVgt8hqk56eEg7wv0+dJXrSx4l5pz8qIiF7M4d6Mz3e6OXDT/+jyi1so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEa1Epud; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEa1Epud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738031300; x=1769567300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sKOwVxJ7bz/F2/1ynGCL+LlcoGOQrWwSKPUB/OSMiwE=;
  b=EEa1EpudnpL/r/8av9uxjeJYJqA60DyztUBWLbK6+068W5yHCl+0LRKB
   C5Qnvy9b98IrFeE13xJq8PyRHkkc05aKEgseQsn2J8N9im2k77qLnck0s
   +hLLSoHkk2Xg2sJ5zUp5Wu7L4/Ctf424XAURPBA79gX62P4YYHkaNI1iH
   98DeUF5Cjb84PW62Q/eol3M4ddiKOHExLJ6G6rAYe72U+4Z1ncK/XA1cV
   vDmaU1WUuu+BPXnnJpCpYu4WK82SNCMuUK5KzoElX9MvYioBh25FLrSHR
   h9CDhkaiSnSQEEKXE4TYzxGBtambSKBg5sfO6KUjGZS1r5jN7F9mz8Nn7
   w==;
X-CSE-ConnectionGUID: mSBILkkeSPC1YIeEziEsMw==
X-CSE-MsgGUID: S34qNyKrQ661PpbtUAIAKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38608000"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38608000"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 18:28:19 -0800
X-CSE-ConnectionGUID: EfK2gkqoSn2shKZ829U6CQ==
X-CSE-MsgGUID: VAUYNRIpR7Opx5dCq02ErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="113652434"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2025 18:28:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcbKp-000hNn-33;
	Tue, 28 Jan 2025 02:28:15 +0000
Date: Tue, 28 Jan 2025 10:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/zen-sauce 5/31] arch/x86/include/asm/vermagic.h:129:2:
 error: unknown processor family
Message-ID: <202501281007.kNhQbFcU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/zen-sauce
head:   ae96db84281e1b10aee61ef832aabd0941743e99
commit: a9e5dbc8e772f528abd66ec63dbdcbff2eda7e13 [5/31] ZEN: Add graysky's more-uarches
config: i386-randconfig-001-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281007.kNhQbFcU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281007.kNhQbFcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281007.kNhQbFcU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/module/main.c:34:
   In file included from include/linux/vermagic.h:10:
>> arch/x86/include/asm/vermagic.h:129:2: error: unknown processor family
     129 | #error unknown processor family
         |  ^
>> kernel/module/main.c:1032:32: error: expected ';' after top level declarator
    1032 | static const char vermagic[] = VERMAGIC_STRING;
         |                                ^
   include/linux/vermagic.h:46:2: note: expanded from macro 'VERMAGIC_STRING'
      46 |         MODULE_ARCH_VERMAGIC                                            \
         |         ^
   arch/x86/include/asm/vermagic.h:133:31: note: expanded from macro 'MODULE_ARCH_VERMAGIC'
     133 | # define MODULE_ARCH_VERMAGIC MODULE_PROC_FAMILY
         |                               ^
   2 errors generated.


vim +129 arch/x86/include/asm/vermagic.h

62d0fd591db1f9 Masahiro Yamada 2020-04-22    5  
62d0fd591db1f9 Masahiro Yamada 2020-04-22    6  #ifdef CONFIG_X86_64
62d0fd591db1f9 Masahiro Yamada 2020-04-22    7  /* X86_64 does not define MODULE_PROC_FAMILY */
62d0fd591db1f9 Masahiro Yamada 2020-04-22    8  #elif defined CONFIG_M486SX
62d0fd591db1f9 Masahiro Yamada 2020-04-22    9  #define MODULE_PROC_FAMILY "486SX "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   10  #elif defined CONFIG_M486
62d0fd591db1f9 Masahiro Yamada 2020-04-22   11  #define MODULE_PROC_FAMILY "486 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   12  #elif defined CONFIG_M586
62d0fd591db1f9 Masahiro Yamada 2020-04-22   13  #define MODULE_PROC_FAMILY "586 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   14  #elif defined CONFIG_M586TSC
62d0fd591db1f9 Masahiro Yamada 2020-04-22   15  #define MODULE_PROC_FAMILY "586TSC "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   16  #elif defined CONFIG_M586MMX
62d0fd591db1f9 Masahiro Yamada 2020-04-22   17  #define MODULE_PROC_FAMILY "586MMX "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   18  #elif defined CONFIG_MCORE2
62d0fd591db1f9 Masahiro Yamada 2020-04-22   19  #define MODULE_PROC_FAMILY "CORE2 "
a9e5dbc8e772f5 graysky         2024-09-16   20  #elif defined CONFIG_MNATIVE_INTEL
a9e5dbc8e772f5 graysky         2024-09-16   21  #define MODULE_PROC_FAMILY "NATIVE_INTEL "
a9e5dbc8e772f5 graysky         2024-09-16   22  #elif defined CONFIG_MNATIVE_AMD
a9e5dbc8e772f5 graysky         2024-09-16   23  #define MODULE_PROC_FAMILY "NATIVE_AMD "
a9e5dbc8e772f5 graysky         2024-09-16   24  #elif defined CONFIG_MNEHALEM
a9e5dbc8e772f5 graysky         2024-09-16   25  #define MODULE_PROC_FAMILY "NEHALEM "
a9e5dbc8e772f5 graysky         2024-09-16   26  #elif defined CONFIG_MWESTMERE
a9e5dbc8e772f5 graysky         2024-09-16   27  #define MODULE_PROC_FAMILY "WESTMERE "
a9e5dbc8e772f5 graysky         2024-09-16   28  #elif defined CONFIG_MSILVERMONT
a9e5dbc8e772f5 graysky         2024-09-16   29  #define MODULE_PROC_FAMILY "SILVERMONT "
a9e5dbc8e772f5 graysky         2024-09-16   30  #elif defined CONFIG_MGOLDMONT
a9e5dbc8e772f5 graysky         2024-09-16   31  #define MODULE_PROC_FAMILY "GOLDMONT "
a9e5dbc8e772f5 graysky         2024-09-16   32  #elif defined CONFIG_MGOLDMONTPLUS
a9e5dbc8e772f5 graysky         2024-09-16   33  #define MODULE_PROC_FAMILY "GOLDMONTPLUS "
a9e5dbc8e772f5 graysky         2024-09-16   34  #elif defined CONFIG_MSANDYBRIDGE
a9e5dbc8e772f5 graysky         2024-09-16   35  #define MODULE_PROC_FAMILY "SANDYBRIDGE "
a9e5dbc8e772f5 graysky         2024-09-16   36  #elif defined CONFIG_MIVYBRIDGE
a9e5dbc8e772f5 graysky         2024-09-16   37  #define MODULE_PROC_FAMILY "IVYBRIDGE "
a9e5dbc8e772f5 graysky         2024-09-16   38  #elif defined CONFIG_MHASWELL
a9e5dbc8e772f5 graysky         2024-09-16   39  #define MODULE_PROC_FAMILY "HASWELL "
a9e5dbc8e772f5 graysky         2024-09-16   40  #elif defined CONFIG_MBROADWELL
a9e5dbc8e772f5 graysky         2024-09-16   41  #define MODULE_PROC_FAMILY "BROADWELL "
a9e5dbc8e772f5 graysky         2024-09-16   42  #elif defined CONFIG_MSKYLAKE
a9e5dbc8e772f5 graysky         2024-09-16   43  #define MODULE_PROC_FAMILY "SKYLAKE "
a9e5dbc8e772f5 graysky         2024-09-16   44  #elif defined CONFIG_MSKYLAKEX
a9e5dbc8e772f5 graysky         2024-09-16   45  #define MODULE_PROC_FAMILY "SKYLAKEX "
a9e5dbc8e772f5 graysky         2024-09-16   46  #elif defined CONFIG_MCANNONLAKE
a9e5dbc8e772f5 graysky         2024-09-16   47  #define MODULE_PROC_FAMILY "CANNONLAKE "
a9e5dbc8e772f5 graysky         2024-09-16   48  #elif defined CONFIG_MICELAKE
a9e5dbc8e772f5 graysky         2024-09-16   49  #define MODULE_PROC_FAMILY "ICELAKE "
a9e5dbc8e772f5 graysky         2024-09-16   50  #elif defined CONFIG_MCASCADELAKE
a9e5dbc8e772f5 graysky         2024-09-16   51  #define MODULE_PROC_FAMILY "CASCADELAKE "
a9e5dbc8e772f5 graysky         2024-09-16   52  #elif defined CONFIG_MCOOPERLAKE
a9e5dbc8e772f5 graysky         2024-09-16   53  #define MODULE_PROC_FAMILY "COOPERLAKE "
a9e5dbc8e772f5 graysky         2024-09-16   54  #elif defined CONFIG_MTIGERLAKE
a9e5dbc8e772f5 graysky         2024-09-16   55  #define MODULE_PROC_FAMILY "TIGERLAKE "
a9e5dbc8e772f5 graysky         2024-09-16   56  #elif defined CONFIG_MSAPPHIRERAPIDS
a9e5dbc8e772f5 graysky         2024-09-16   57  #define MODULE_PROC_FAMILY "SAPPHIRERAPIDS "
a9e5dbc8e772f5 graysky         2024-09-16   58  #elif defined CONFIG_ROCKETLAKE
a9e5dbc8e772f5 graysky         2024-09-16   59  #define MODULE_PROC_FAMILY "ROCKETLAKE "
a9e5dbc8e772f5 graysky         2024-09-16   60  #elif defined CONFIG_MALDERLAKE
a9e5dbc8e772f5 graysky         2024-09-16   61  #define MODULE_PROC_FAMILY "ALDERLAKE "
a9e5dbc8e772f5 graysky         2024-09-16   62  #elif defined CONFIG_MRAPTORLAKE
a9e5dbc8e772f5 graysky         2024-09-16   63  #define MODULE_PROC_FAMILY "RAPTORLAKE "
a9e5dbc8e772f5 graysky         2024-09-16   64  #elif defined CONFIG_MMETEORLAKE
a9e5dbc8e772f5 graysky         2024-09-16   65  #define MODULE_PROC_FAMILY "METEORLAKE "
a9e5dbc8e772f5 graysky         2024-09-16   66  #elif defined CONFIG_MEMERALDRAPIDS
a9e5dbc8e772f5 graysky         2024-09-16   67  #define MODULE_PROC_FAMILY "EMERALDRAPIDS "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   68  #elif defined CONFIG_MATOM
62d0fd591db1f9 Masahiro Yamada 2020-04-22   69  #define MODULE_PROC_FAMILY "ATOM "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   70  #elif defined CONFIG_M686
62d0fd591db1f9 Masahiro Yamada 2020-04-22   71  #define MODULE_PROC_FAMILY "686 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   72  #elif defined CONFIG_MPENTIUMII
62d0fd591db1f9 Masahiro Yamada 2020-04-22   73  #define MODULE_PROC_FAMILY "PENTIUMII "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   74  #elif defined CONFIG_MPENTIUMIII
62d0fd591db1f9 Masahiro Yamada 2020-04-22   75  #define MODULE_PROC_FAMILY "PENTIUMIII "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   76  #elif defined CONFIG_MPENTIUMM
62d0fd591db1f9 Masahiro Yamada 2020-04-22   77  #define MODULE_PROC_FAMILY "PENTIUMM "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   78  #elif defined CONFIG_MPENTIUM4
62d0fd591db1f9 Masahiro Yamada 2020-04-22   79  #define MODULE_PROC_FAMILY "PENTIUM4 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   80  #elif defined CONFIG_MK6
62d0fd591db1f9 Masahiro Yamada 2020-04-22   81  #define MODULE_PROC_FAMILY "K6 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   82  #elif defined CONFIG_MK7
62d0fd591db1f9 Masahiro Yamada 2020-04-22   83  #define MODULE_PROC_FAMILY "K7 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22   84  #elif defined CONFIG_MK8
62d0fd591db1f9 Masahiro Yamada 2020-04-22   85  #define MODULE_PROC_FAMILY "K8 "
a9e5dbc8e772f5 graysky         2024-09-16   86  #elif defined CONFIG_MK8SSE3
a9e5dbc8e772f5 graysky         2024-09-16   87  #define MODULE_PROC_FAMILY "K8SSE3 "
a9e5dbc8e772f5 graysky         2024-09-16   88  #elif defined CONFIG_MK10
a9e5dbc8e772f5 graysky         2024-09-16   89  #define MODULE_PROC_FAMILY "K10 "
a9e5dbc8e772f5 graysky         2024-09-16   90  #elif defined CONFIG_MBARCELONA
a9e5dbc8e772f5 graysky         2024-09-16   91  #define MODULE_PROC_FAMILY "BARCELONA "
a9e5dbc8e772f5 graysky         2024-09-16   92  #elif defined CONFIG_MBOBCAT
a9e5dbc8e772f5 graysky         2024-09-16   93  #define MODULE_PROC_FAMILY "BOBCAT "
a9e5dbc8e772f5 graysky         2024-09-16   94  #elif defined CONFIG_MBULLDOZER
a9e5dbc8e772f5 graysky         2024-09-16   95  #define MODULE_PROC_FAMILY "BULLDOZER "
a9e5dbc8e772f5 graysky         2024-09-16   96  #elif defined CONFIG_MPILEDRIVER
a9e5dbc8e772f5 graysky         2024-09-16   97  #define MODULE_PROC_FAMILY "PILEDRIVER "
a9e5dbc8e772f5 graysky         2024-09-16   98  #elif defined CONFIG_MSTEAMROLLER
a9e5dbc8e772f5 graysky         2024-09-16   99  #define MODULE_PROC_FAMILY "STEAMROLLER "
a9e5dbc8e772f5 graysky         2024-09-16  100  #elif defined CONFIG_MJAGUAR
a9e5dbc8e772f5 graysky         2024-09-16  101  #define MODULE_PROC_FAMILY "JAGUAR "
a9e5dbc8e772f5 graysky         2024-09-16  102  #elif defined CONFIG_MEXCAVATOR
a9e5dbc8e772f5 graysky         2024-09-16  103  #define MODULE_PROC_FAMILY "EXCAVATOR "
a9e5dbc8e772f5 graysky         2024-09-16  104  #elif defined CONFIG_MZEN
a9e5dbc8e772f5 graysky         2024-09-16  105  #define MODULE_PROC_FAMILY "ZEN "
a9e5dbc8e772f5 graysky         2024-09-16  106  #elif defined CONFIG_MZEN2
a9e5dbc8e772f5 graysky         2024-09-16  107  #define MODULE_PROC_FAMILY "ZEN2 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  108  #elif defined CONFIG_MELAN
62d0fd591db1f9 Masahiro Yamada 2020-04-22  109  #define MODULE_PROC_FAMILY "ELAN "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  110  #elif defined CONFIG_MCRUSOE
62d0fd591db1f9 Masahiro Yamada 2020-04-22  111  #define MODULE_PROC_FAMILY "CRUSOE "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  112  #elif defined CONFIG_MEFFICEON
62d0fd591db1f9 Masahiro Yamada 2020-04-22  113  #define MODULE_PROC_FAMILY "EFFICEON "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  114  #elif defined CONFIG_MWINCHIPC6
62d0fd591db1f9 Masahiro Yamada 2020-04-22  115  #define MODULE_PROC_FAMILY "WINCHIPC6 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  116  #elif defined CONFIG_MWINCHIP3D
62d0fd591db1f9 Masahiro Yamada 2020-04-22  117  #define MODULE_PROC_FAMILY "WINCHIP3D "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  118  #elif defined CONFIG_MCYRIXIII
62d0fd591db1f9 Masahiro Yamada 2020-04-22  119  #define MODULE_PROC_FAMILY "CYRIXIII "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  120  #elif defined CONFIG_MVIAC3_2
62d0fd591db1f9 Masahiro Yamada 2020-04-22  121  #define MODULE_PROC_FAMILY "VIAC3-2 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  122  #elif defined CONFIG_MVIAC7
62d0fd591db1f9 Masahiro Yamada 2020-04-22  123  #define MODULE_PROC_FAMILY "VIAC7 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  124  #elif defined CONFIG_MGEODEGX1
62d0fd591db1f9 Masahiro Yamada 2020-04-22  125  #define MODULE_PROC_FAMILY "GEODEGX1 "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  126  #elif defined CONFIG_MGEODE_LX
62d0fd591db1f9 Masahiro Yamada 2020-04-22  127  #define MODULE_PROC_FAMILY "GEODE "
62d0fd591db1f9 Masahiro Yamada 2020-04-22  128  #else
62d0fd591db1f9 Masahiro Yamada 2020-04-22 @129  #error unknown processor family
62d0fd591db1f9 Masahiro Yamada 2020-04-22  130  #endif
62d0fd591db1f9 Masahiro Yamada 2020-04-22  131  

:::::: The code at line 129 was first introduced by commit
:::::: 62d0fd591db1f9dcf68fb963b3a94af085a6b166 arch: split MODULE_ARCH_VERMAGIC definitions out to <asm/vermagic.h>

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
