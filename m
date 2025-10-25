Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156562E8DF3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761406587; cv=none; b=SQyFOe1XxWvFy6Pleaco6BkpYMc4ELihVWiicVhOQ99/70jVZ5m1rYffBgItCmM8cPj1Ou7aVTrXlla9YGwzdXryX+/GVRNIpjP62jCnzSYK5ik0/tZ8CRK4GVOhqCvxLkTiiYFKxlkj0yaaOecNJsqdv0+vC6gR4jZLGDBkeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761406587; c=relaxed/simple;
	bh=rGBs43zBsZFd5qUflcLMcjd4nkRjPY7APmpQFK37sm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXGf6Iv1fa8wmlYIhaixiKrmbkeQuhEXNzFYS2n7ZOURaMUOaaVEZyDLCA0wL/xm67WvahawOZSIJHbBhBmSNkPOQ6jwzL3BaRdN+DuJf5zy4h5Ngag2WI8N8kdL5+kA6UYyUhzFKP3YFz1HVsuMExAvQIxZ/3Lg8+1m/e/XUyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVsaPUDi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVsaPUDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761406585; x=1792942585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rGBs43zBsZFd5qUflcLMcjd4nkRjPY7APmpQFK37sm4=;
  b=VVsaPUDiPP/n1gKrdTHScGAi4dwbEp8ox9ot35Sof2nEH2Dk5vFVtfIS
   W92z+d1uxBJVH8waMNnLaT7JYgm2ca90dFwJ+JFbawmCxTjgNMDEZq53z
   hS5M0il3oICyuItxQzU6c6FxzHkG1KmaMVPGcPYzDjMek6ntNV9QK25Xf
   KB2quDqrB+T+lj/XOyElqEMOcaLCr86pZJtou3u4KazR58lkHTCqTOx0E
   djKhipH23NIg6zzpyxr26/ZHbzLHVblBt+zhwgaO+l+wYe+2yXT3oVq9w
   Etj+UsAFv8gxEnMEbLSRbSJzzrh420pXlysHOcNhy06xJvVoVkFFUfqCE
   g==;
X-CSE-ConnectionGUID: oYBB81TuRWCBb5OyNOYabQ==
X-CSE-MsgGUID: BOo64n0QQRyIqiAOuaPu/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63257972"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63257972"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 08:36:25 -0700
X-CSE-ConnectionGUID: WbtgJ6AES2eEx4N4iDSF7g==
X-CSE-MsgGUID: wz09ipqkRKKeQdhHCaHXAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184569041"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Oct 2025 08:36:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCgJZ-000FOX-0h;
	Sat, 25 Oct 2025 15:36:21 +0000
Date: Sat, 25 Oct 2025 23:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21:
 warning: invalid suffix on literal; C++11 requires a space between literal
 and string macro
Message-ID: <202510252350.GbojS8BE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Valdis,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ca1036e548e57768ca272bbd5f5cbde3b153f803
commit: 0908fe0570df658beb3866ddcb7bc55b0fb834b0 [2818/2818] gcc-plugins: fix gcc 11 indigestion with plugins...
config: arm64-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20251025/202510252350.GbojS8BE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510252350.GbojS8BE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510252350.GbojS8BE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/stackleak_plugin.c:30:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/sancov_plugin.c:22:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/randomize_layout_plugin.c:19:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   ../libexec/gcc/aarch64-linux/5.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   make[2]: *** [scripts/Makefile.build:280: scripts/mod/empty.o] Error 1 shuffle=1096673560
   ../libexec/gcc/aarch64-linux/5.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1096673560
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1214: prepare0] Error 2 shuffle=1096673560
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2 shuffle=1096673560
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
