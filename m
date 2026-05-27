Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907D368974
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 03:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852855; cv=none; b=O9S0qNhkBXx/P/CwBSpeuDTgcQPEdk/n69qNTkbNpwMydwPAAPSTG7p+U3P4hfaejTjzPKqB5kEYzwny1TJeOzZsgo6NyT8yEKnhfJIKXq2ZCY/ap5C5SbeZjV039eRGU/yIiGwhRTc9pFLGBZDukVkXNMGN04a1X0VYq8tYfJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852855; c=relaxed/simple;
	bh=bx9KgIY+gQ68EtHeSlkZ0ZBTjl4Sx/EWKhYcJNJmdlw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K2lkgA1TBMmZ7QD+Nkvf7H3PrXBi3Im3F56ikqsA1O3N/L1CRVuoVAblTpvXhnfGxKcaPMo6c+1b9/gDuBajpLfVHOUueT692pS9S8WysUPZKZZr/kaPisR2unlxcMVv0vR3LSk7PO/ex8VgpfioIPkBC2bUIGyJAa6PfL2l4U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1CU27aa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1CU27aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779852852; x=1811388852;
  h=date:from:to:cc:subject:message-id;
  bh=bx9KgIY+gQ68EtHeSlkZ0ZBTjl4Sx/EWKhYcJNJmdlw=;
  b=J1CU27aaEmM8WYpngDgASsH8Dmjr7cdG2qRIyqxt1QodtfIQAZROV5pu
   Cbv+xHK1oI4LHj8r7Gj/kFEnbYUKGEkacYZ3rhz/jobo7NQy+AkJqBH/Q
   LG60j1p9Br3ldkhkdZkjU9FVjc37nH7MbxJ9/kwiR9r3pBoQxFYcAbpSh
   jD8kEdJG/YAeH9HzuzyudhPceNGssJBGvKgnXKzCpAzuY7/fdRqn6WsE+
   IfEnkE0DH9o6Nb3UEqcrGp0e0tPUJhaXytQIybmjBeovkNVQP7Lw95gJc
   l766xaOr1+222ihgFuunKfcyY6x51SujsxSLDV3NC1l2FApB3ImZbwkqy
   g==;
X-CSE-ConnectionGUID: qlh4nZfiQo29YwRlr4NoYg==
X-CSE-MsgGUID: foyrM4wzQfOS+UM27RrvHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79824669"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="79824669"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:34:12 -0700
X-CSE-ConnectionGUID: Z+t6GN0UQQ2OTeMPkfp5kg==
X-CSE-MsgGUID: i5e/SBc5R/SboRIzZVvc1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241947041"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 May 2026 20:34:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS521-000000003L4-0lSb;
	Wed, 27 May 2026 03:34:09 +0000
Date: Wed, 27 May 2026 11:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1]
 drivers/tty/serial/msm_geni_serial_earlycon.c:359:1: warning:
 initializer-string for character array is too long, array size is 15 but
 initializer has size 16 (including the null terminating character); did you
 mean to use the 'nonstring' attribute?
Message-ID: <202605271137.XBiuQI3W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   6f1e24a4394a59adf319d3777014cc1b3d518de0
commit: e1be87019fc97f736f2729a2a4198d250d28633b [0/1] ANDROID: serial: msm_geni_serial_earlycon: Add Earlycon support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260527/202605271137.XBiuQI3W-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271137.XBiuQI3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271137.XBiuQI3W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:18:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      18 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/tty/serial/msm_geni_serial_earlycon.c:304:6: warning: variable 'rx_trans_cfg' set but not used [-Wunused-but-set-variable]
     304 |         u32 rx_trans_cfg = 0;
         |             ^
   drivers/tty/serial/msm_geni_serial_earlycon.c:305:6: warning: variable 'rx_parity_cfg' set but not used [-Wunused-but-set-variable]
     305 |         u32 rx_parity_cfg = 0;
         |             ^
   drivers/tty/serial/msm_geni_serial_earlycon.c:307:6: warning: variable 'rx_stale' set but not used [-Wunused-but-set-variable]
     307 |         u32 rx_stale = 0;
         |             ^
>> drivers/tty/serial/msm_geni_serial_earlycon.c:359:1: warning: initializer-string for character array is too long, array size is 15 but initializer has size 16 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
     359 | OF_EARLYCON_DECLARE(msm_geni_serial, "qcom,msm-geni-console",
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     360 |                         msm_geni_serial_earlycon_setup);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:380:2: note: expanded from macro 'OF_EARLYCON_DECLARE'
     380 |         _OF_EARLYCON_DECLARE(_name, compat, fn,                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     381 |                              __UNIQUE_ID(__earlycon_##_name))
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/serial_core.h:372:15: note: expanded from macro '_OF_EARLYCON_DECLARE'
     372 |                 = { .name = __stringify(_name),                         \
         |                             ^~~~~~~~~~~~~~~~~~
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^~~~~~~~~~~~~~~~
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^~
   <scratch space>:144:1: note: expanded from here
     144 | "msm_geni_serial"
         | ^~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/nonstring +359 drivers/tty/serial/msm_geni_serial_earlycon.c

   358	
 > 359	OF_EARLYCON_DECLARE(msm_geni_serial, "qcom,msm-geni-console",

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
