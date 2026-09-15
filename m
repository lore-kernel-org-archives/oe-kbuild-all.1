Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9B7227EBC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 02:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439011; cv=none; b=ln2CmN777Cr9OlcjEnlF9iyG/hgP7C7mgjHJ9CANap6Foc22TjgHUeJF0sE1TD11cSGVg76wfHtmzMkYVVN1UrobGLHFwNkeYU487rLLH2zlSIiS9PtbDtPd2n/XdIkblD5tcBmEU9PkMDpLAP639q+qDxmLu2Xp/Ni1BZ8nah0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439011; c=relaxed/simple;
	bh=cz6SSP9NRNeeOL0IVgQZpzX3Zt2oH4uwo2oAvcOIoCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nb1772ZIoWIGYQ30GKQZp8N3+QtsZnqYFrmklRX67yUcvTBYukCaKrpT/uJxdnDGGjr0ZnjLS/J7Ai+2DVNO2sZ9acu4WFzAONOzV/Oz5xVnbRTUNDs17b1WdRLQ+YFt4bH6/O4CyXW7qlfg5YX4kNtS51pxAj7LEb82DnrLITg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HE7T/GJk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HE7T/GJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789439009; x=1820975009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cz6SSP9NRNeeOL0IVgQZpzX3Zt2oH4uwo2oAvcOIoCI=;
  b=HE7T/GJkcW9Ajv13tO9h75q0oK51z+k1D2ig6NK+/hX30iHdgGEnMU/C
   sBf3V8JqYip4uFmh0Rt6yOou8RfFOx6RdRTKKpojOpKTIGeEPQZP8BWR1
   HhQA3NEfirWJsue4Bl7YSQTxBlMDud/UY/NKyO+NDQfqZ+rQPiWbzj8Fm
   doZ6ohIOUKAzHPum7T3Y0j4D82wW/CUupXxnVDyv6QIJT2t1tb7LtDDGO
   +UqEg0SeRoDAxUIBrRXRiDYZJPUNGID7/0YF3rQ/MeW4ur3XPHPpKUGRw
   2jp6fTvd4N/F4njit8pm/wlq2jiEILciAslEkU/NY+11QmM+iuD1nhhZy
   Q==;
X-CSE-ConnectionGUID: 3g7yVUS+Qc2WCOFjLrSajw==
X-CSE-MsgGUID: dXwScTRsRLyzS7k7IuFenQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89925444"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89925444"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 19:23:28 -0700
X-CSE-ConnectionGUID: aaxbLL0HT4yCvNmUUyqurg==
X-CSE-MsgGUID: IanpNTSgRr6L1ZYOEmOpaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276951586"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 14 Sep 2026 19:23:26 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6IpQ-000000000Sl-0uzV;
	Tue, 15 Sep 2026 02:23:24 +0000
Date: Tue, 15 Sep 2026 04:22:41 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps-v9-akpm 30/41]
 include/linux/dynamic_debug.h:519:9: warning: '_DPRINTK_CLASSBITS_INIT' macro
 redefined
Message-ID: <202609150432.LZOVGeK3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmaps-v9-akpm
head:   bc05be3d2d3a71c95bbd0c24599f0bafcd5e7326
commit: 5959d9dd620041fe8451e9b2d2545b1084526432 [30/41] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
config: x86_64-randconfig-161-20260915 (https://download.01.org/0day-ci/archive/20260915/202609150432.LZOVGeK3-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150432.LZOVGeK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150432.LZOVGeK3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:31:
>> include/linux/dynamic_debug.h:519:9: warning: '_DPRINTK_CLASSBITS_INIT' macro redefined [-Wmacro-redefined]
     519 | #define _DPRINTK_CLASSBITS_INIT 0U
         |         ^
   include/linux/dynamic_debug.h:70:9: note: previous definition is here
      70 | #define _DPRINTK_CLASSBITS_INIT ((_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ? ~0U : 0U)
         |         ^
   1 warning generated.
--
>> clang diag: include/linux/dynamic_debug.h:519:9: warning: '_DPRINTK_CLASSBITS_INIT' macro redefined [-Wmacro-redefined]
--
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:31:
>> include/linux/dynamic_debug.h:519:9: warning: '_DPRINTK_CLASSBITS_INIT' macro redefined [-Wmacro-redefined]
     519 | #define _DPRINTK_CLASSBITS_INIT 0U
         |         ^
   include/linux/dynamic_debug.h:70:9: note: previous definition is here
      70 | #define _DPRINTK_CLASSBITS_INIT ((_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ? ~0U : 0U)
         |         ^
   1 warning generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:31:
   In file included from include/linux/cpufreq.h:12:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:31:
>> include/linux/dynamic_debug.h:519:9: warning: '_DPRINTK_CLASSBITS_INIT' macro redefined [-Wmacro-redefined]
     519 | #define _DPRINTK_CLASSBITS_INIT 0U
         |         ^
   include/linux/dynamic_debug.h:70:9: note: previous definition is here
      70 | #define _DPRINTK_CLASSBITS_INIT ((_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ? ~0U : 0U)
         |         ^
   1 warning generated.
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
>> clang diag: include/linux/dynamic_debug.h:519:9: warning: '_DPRINTK_CLASSBITS_INIT' macro redefined [-Wmacro-redefined]
>> clang diag: include/linux/dynamic_debug.h:519:9: warning: '_DPRINTK_CLASSBITS_INIT' macro redefined [-Wmacro-redefined]
>> clang diag: include/linux/dynamic_debug.h:519:9: warning: '_DPRINTK_CLASSBITS_INIT' macro redefined [-Wmacro-redefined]


vim +/_DPRINTK_CLASSBITS_INIT +519 include/linux/dynamic_debug.h

   515	
   516	#if defined(DEBUG)
   517	#define _DPRINTK_CLASSBITS_INIT ~0U
   518	#else
 > 519	#define _DPRINTK_CLASSBITS_INIT 0U
   520	#endif
   521	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
