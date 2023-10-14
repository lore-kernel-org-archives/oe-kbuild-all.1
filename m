Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489EB367
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gfo0ilj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697252381; x=1728788381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVvmJ4k7YSiyqyEyzkJBL6huRWiQzEm9yPYGl8xza5c=;
  b=Gfo0ilj52pm/EPFXwgCvTFYtd3ymbctKCcQ5P2MnKIP2iOwJpsAGmbov
   VyEEaAaXfQmnD+nuvV14G7W/PEtBVtU96Op4kiPENsi9u5c+OafExn74+
   gJ86Vhnw5Ung6L/2HnpjwY+iD7hucTwrZj0gtRCGD0ttpvoZKcCPs0UwY
   YoSYbp14lUY7rOFL44ukpy7JBOszq4CWIfooRIS/TPf4bI+KTmyNhr2CR
   Ml8vPUc/JGgBlOc3RAv+3Q9ctxrTBkDwgjEw1ctSIYN2VO3rme0CQVbwl
   Pq3o4eWLk5AiiaLR2+AUg8z+V/9k9dBtBxJRs4yb0OCBWXtXpvIvsTPQR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375649540"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="375649540"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 19:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825269762"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="825269762"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2023 19:59:38 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrUsH-0005dr-1t;
	Sat, 14 Oct 2023 02:59:35 +0000
Date: Sat, 14 Oct 2023 10:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 128/15768] fsl_xcvr.c:undefined
 reference to `__udivdi3'
Message-ID: <202310141058.rR6xWmYK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: bfefa84dbee3dacc0f5f16a91aeed0e8517212e7 [128/15768] MLK-25951-2: ASoC: fsl_xcvr: Add soc data of i.MX93
config: xtensa-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141058.rR6xWmYK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141058.rR6xWmYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141058.rR6xWmYK-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/signal.o: in function `ptrace_trap_notify':
   signal.c:(.text+0x1f90): undefined reference to `__umulsidi3'
   xtensa-linux-ld: signal.c:(.text+0x206b): undefined reference to `__umulsidi3'
   xtensa-linux-ld: kernel/sched/core.o:(.init.literal+0xa8): undefined reference to `__umulsidi3'
   xtensa-linux-ld: kernel/sched/core.o: in function `sched_init':
   core.c:(.init.text+0x1f7): undefined reference to `__umulsidi3'
   xtensa-linux-ld: core.c:(.init.text+0x21b): undefined reference to `__umulsidi3'
   xtensa-linux-ld: kernel/sched/core.o:core.c:(.init.text+0x23f): more undefined references to `__umulsidi3' follow
   xtensa-linux-ld: sound/soc/fsl/fsl_xcvr.o: in function `fsl_xcvr_mode_put':
>> fsl_xcvr.c:(.text+0x17d4): undefined reference to `__udivdi3'
   xtensa-linux-ld: sound/soc/fsl/fsl_xcvr.o: in function `fsl_xcvr_shutdown':
   fsl_xcvr.c:(.text+0x1896): undefined reference to `__udivdi3'
   xtensa-linux-ld: sound/virtio/virtio_chmap.o: in function `virtsnd_chmap_parse_cfg':
   virtio_chmap.c:(.text+0xb4): undefined reference to `__umulsidi3'
   xtensa-linux-ld: sound/virtio/virtio_jack.o: in function `virtsnd_jack_parse_cfg':
   virtio_jack.c:(.text+0xbf): undefined reference to `__umulsidi3'
   xtensa-linux-ld: virtio_jack.c:(.text+0x110): undefined reference to `__umulsidi3'
   xtensa-linux-ld: lib/flex_proportions.o: in function `fprop_fraction_percpu':
   flex_proportions.c:(.text+0x92e): undefined reference to `__umulsidi3'
   xtensa-linux-ld: lib/string.o: in function `strstr':
   string.c:(.text+0x960): undefined reference to `__umulsidi3'
   xtensa-linux-ld: lib/string.o:string.c:(.text+0x9d7): more undefined references to `__umulsidi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
