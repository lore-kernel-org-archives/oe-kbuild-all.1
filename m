Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F1D1FA0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691257007; x=1722793007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4OIJl4RGHqAGs7B8ca9JbJwpa2i7M05IqUIAYe3NXw=;
  b=J9eYM6if2WM2/8WDtI/coiGdwNIikJn3F7fl39b+osHudAWpV7Cho0GC
   0/19a7mowW3UBFxfutSYmh6nFSmDV9B4a1mnRKaoRZiKcQoE80wJUS7Kk
   3arb4sAXrq/zwv8hZu0VNkgHAaCqKy3xveYrG0qctGL24Zux3fS/ITSV0
   SND2ap1Spkrt2UIuvJ/44hnG8Sk/YcJ0wam7S0phYNa2hqGPCInfZqd7u
   w+Sp3jD1xKRbkdge6VbKTSjhkGVkk2UesGw1B5YGLJ385SXO9DkjaxKS1
   SFQwaBOtdxVQQxTIr4sgZstY7CmzKUpXZukcaFfVzSs8q3F/nOIITw68D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="367786069"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="367786069"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 10:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="707351760"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="707351760"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Aug 2023 10:36:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSLCm-0003nv-10;
	Sat, 05 Aug 2023 17:36:44 +0000
Date: Sun, 6 Aug 2023 01:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kselftest-dma-build 2/3] error:
 include/uapi/linux/map_benchmark.h: missing "WITH Linux-syscall-note" for
 SPDX-License-Identifier
Message-ID: <202308060141.a1sf73zv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kselftest-dma-build
head:   84e53982d97d28d101bfa317fb80a341925b3a13
commit: 4acbe2d16975fb065be4b6116d810a6def7aa7ec [2/3] dma-mapping: map-benchmark: Move UAPI header to uapi/ to fix build
config: arm-randconfig-r003-20230806 (https://download.01.org/0day-ci/archive/20230806/202308060141.a1sf73zv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060141.a1sf73zv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308060141.a1sf73zv-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> error: include/uapi/linux/map_benchmark.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/map_benchmark.h] Error 1 shuffle=1473536331
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1383: headers] Error 2 shuffle=1473536331
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1473536331
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1473536331
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
