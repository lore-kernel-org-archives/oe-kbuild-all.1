Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33FB38F87
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGlxwoCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272622; x=1732808622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsXCdeoPw+hdpRPy/RfrIaS9MtAA4PykZfK2PqrCbto=;
  b=kGlxwoCpSWsiY/mMewQHEjDaipxKFXQ3JSggol4pbu+fG8De5r3IfTlu
   XCqp2pfra6c7pFEhu1MRUS6gfkeEtCzjKk2UiKuXWI9XG0OeF84EEmjOt
   AzUNpbd+pr/lsO/e11K1RtLz6vi0s07fVFaYCiUKnL4rlUxb9A7iHz5t8
   tsq+mbQEuiXFKNHlRDzigMgKoFVQchrMH9/Wi0Z/v6VkAHuBara7zuiAN
   I+vQKSTmiTUJLXsv9qaAff7kzx3fAbxuLaEkbAZtB2W1TsUIKHv6fD/Q/
   d+y6eR2/dlG7c7T/mKm36Nr9RYTfO3+hnAj/Z//tTD76waKST7VgGG62O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="83295"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="83295"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:43:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839470241"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="839470241"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2023 07:43:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Miu-0000PD-02;
	Wed, 29 Nov 2023 15:43:36 +0000
Date: Wed, 29 Nov 2023 23:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/powerpc/kernel/time.c:788:9: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202311292258.2P0hVLX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
date:   4 months ago
config: powerpc-randconfig-c042-20230517 (https://download.01.org/0day-ci/archive/20231129/202311292258.2P0hVLX1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311292258.2P0hVLX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292258.2P0hVLX1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/time.c:788:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:788:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:788:9: sparse:     got unsigned long long *
>> arch/powerpc/kernel/time.c:788:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:788:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:788:9: sparse:     got unsigned long long *
>> arch/powerpc/kernel/time.c:788:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:788:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:788:9: sparse:     got unsigned long long *
>> arch/powerpc/kernel/time.c:788:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:788:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:788:9: sparse:     got unsigned long long *
>> arch/powerpc/kernel/time.c:788:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:788:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:788:9: sparse:     got unsigned long long *
   arch/powerpc/kernel/time.c:796:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:796:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:796:9: sparse:     got unsigned long long *
   arch/powerpc/kernel/time.c:796:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:796:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:796:9: sparse:     got unsigned long long *
   arch/powerpc/kernel/time.c:796:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:796:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:796:9: sparse:     got unsigned long long *
   arch/powerpc/kernel/time.c:796:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:796:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:796:9: sparse:     got unsigned long long *
   arch/powerpc/kernel/time.c:796:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:796:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:796:9: sparse:     got unsigned long long *
   arch/powerpc/kernel/time.c:504:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:504:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:504:24: sparse:     got unsigned long long *

vim +788 arch/powerpc/kernel/time.c

4a4cfe3836916e Tony Breeds            2007-09-22  784  
d831d0b83f2058 Tony Breeds            2007-09-21  785  static int decrementer_set_next_event(unsigned long evt,
d831d0b83f2058 Tony Breeds            2007-09-21  786  				      struct clock_event_device *dev)
d831d0b83f2058 Tony Breeds            2007-09-21  787  {
6601ec1c2ba929 Christophe Leroy       2020-09-29 @788  	__this_cpu_write(decrementers_next_tb, get_tb() + evt);
25aa145856cd0d Nicholas Piggin        2021-11-23  789  	set_dec_or_work(evt);
0215f7d8c53fb1 Benjamin Herrenschmidt 2014-01-14  790  
d831d0b83f2058 Tony Breeds            2007-09-21  791  	return 0;
d831d0b83f2058 Tony Breeds            2007-09-21  792  }
d831d0b83f2058 Tony Breeds            2007-09-21  793  

:::::: The code at line 788 was first introduced by commit
:::::: 6601ec1c2ba929430f5585ce7f9d9960b0e0a01d powerpc: Remove get_tb_or_rtc()

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
