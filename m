Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D92EAFD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Dec 2023 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Via8saOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703283512; x=1734819512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bfNuE5VTKa8W7eNUfDKXOvzVD6IEXtsktG23lKOiKN4=;
  b=Via8saOu0UuZlwdATcozOYzxdnx1FPspEojzt+XEIl5obAs4HexhKZUq
   irgX0EXPvE3um1hc52S7n95Bely+4EAPWAUHZFBlFLJOSh8JpXP2V2krL
   F7UIRT5tg6cKfFFMsfSIkj4bWhQNmUbdzVvHC0ZCoqhLmtI+xFAvKt1/y
   HsXkSsukwA3K4Kt5Ah2z8fOL0CaiOVofVTeGSnB5Vd+isXGl7WLdErBtr
   s+DzghT/XUnohXYBCeEsWYfp9n/3zt05G0xYkhKAhg0mWzqy28dMA1m42
   63LbJN+Pd8Cgtq2RYv1jTDUtPeXhBJnqJ85kqPqrpGvcMm8fFsiPNgN5d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="14844418"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="14844418"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 14:18:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="867749389"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="867749389"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2023 14:18:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGnpt-0009vL-03;
	Fri, 22 Dec 2023 22:17:54 +0000
Date: Sat, 23 Dec 2023 06:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9918/9925] powerpc64-linux-ld: warning: orphan
 section `.bss..Lubsan_data794' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data794'
Message-ID: <202312230642.EBF6kiYY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: c6aa10bc7b8bfcfaca4311ac5f39b4d6eb5b1ccf [9918/9925] Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git
config: powerpc64-randconfig-r035-20211208 (https://download.01.org/0day-ci/archive/20231223/202312230642.EBF6kiYY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230642.EBF6kiYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230642.EBF6kiYY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data794' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data794'
   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `flush_module_init_free_work'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: init/main.o: in function `kernel_init':
   main.c:(.ref.text+0x224): undefined reference to `flush_module_init_free_work'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
