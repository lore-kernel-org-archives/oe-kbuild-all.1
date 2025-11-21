Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4943128A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763729466; cv=none; b=NtaH3CsdJCPIzj4JwIPK5EDd5o4+m8RAc7kCOuLkTbUw+7j0D1a7pziMePHldIn1x6aa9LuK/UOg+cAfTY6JK/wNzjr92tHzwKJDnkxfIL+SkyRJi7LBgn65WJ5jJE2qPtsWUlBmojNa6SHp7uheBKZLiQHDMd38VN4WzC9yGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763729466; c=relaxed/simple;
	bh=ADDcOFrspM0MebwgW1Phk232mSMApCzVsWoR8QQ6XPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFEb/4zMcfAKJMJpX1XZ7DE90KQAQDBr1GkjyWMt6S8wUj7MlgzqCzc0RsSHpA9tuIHlQ97gB6CkVhEBvDdtDMtddXea4xTpBwaNlS2IMQz2JGkH1DoYXsPPQyZPk/dNXzFYHoMlZm0sjPOFSzIoVQcWaSVkmi7HSfPZwL2WHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXtx92ml; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXtx92ml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763729461; x=1795265461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ADDcOFrspM0MebwgW1Phk232mSMApCzVsWoR8QQ6XPk=;
  b=CXtx92mluekpsSXw8bMuvHjaGRBXHqwetqAElhvRAo5rOkxDGBtD43eJ
   WyXcLGUbbmstY3M2l1v5dR4IULjWXgafCycd+/dvY/tUx3iHYTPfhAOCw
   qKEiY8auvgoPJfRKB2Qst2J/mOCCvznlCioH6saM4+3ZNePvUxrF3B3PM
   MFFBFbIr+MHeDxyUjwF/4xH+B53aXEVSO/pTD1mmI9ObdyK2E7oJFn+8x
   an84Ljw0Wmi/4/KHRBD9yD9CijyDfrP2djOJjogI6dIOJRvPHTGK7uQc/
   5I7cqy8wsTaSqjadHi9QEllKqPj5LkbVXQth1U8s4DmgzqDn0H3cDK2DJ
   A==;
X-CSE-ConnectionGUID: r2eX2csGSGeLj6RTABXmSQ==
X-CSE-MsgGUID: wHuqQlcCQUawvc+WchQ1BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65767824"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65767824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:51:01 -0800
X-CSE-ConnectionGUID: Jm6N9iccQ2GlkxJRcXmFnA==
X-CSE-MsgGUID: PNn66GpDRou/AQOtPPRvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="222636751"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2025 04:51:00 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMQbJ-0005Ml-1O;
	Fri, 21 Nov 2025 12:50:57 +0000
Date: Fri, 21 Nov 2025 20:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21:
 warning: invalid suffix on literal; C++11 requires a space between literal
 and string macro
Message-ID: <202511212044.w0VqCIiP-lkp@intel.com>
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
head:   3f1b18215d39769abfd210cb9a02b06b47b0b4b5
commit: 0908fe0570df658beb3866ddcb7bc55b0fb834b0 [2818/2818] gcc-plugins: fix gcc 11 indigestion with plugins...
config: arm64-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20251121/202511212044.w0VqCIiP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212044.w0VqCIiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511212044.w0VqCIiP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/stackleak_plugin.c:30:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
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
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
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
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
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
   ../libexec/gcc/aarch64-linux/5.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   make[2]: *** [scripts/Makefile.build:280: scripts/mod/empty.o] Error 1 shuffle=1096673560
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1096673560
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1214: prepare0] Error 2 shuffle=1096673560
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2 shuffle=1096673560
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
