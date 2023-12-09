Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457E15AB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 05:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYgNIeyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702099248; x=1733635248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=itSDpXH72I3FTYHBhj6+XQ+muCzGwhGWrNEQjpPzZ9c=;
  b=VYgNIeyvpP6YIh2u0GDQLDjO+x1myA0dqKunzi5sGy1JMdISPT5tQxHU
   KWcRMtxLZeLW5pkbVV8e8Dv8ZnzDymgbk1xZJ7soUOhA0eXu7qgEXZH79
   0nMWosfVwjnaFqVvXXFTKiSalI0uYJ8HpkWbROZnUdRRdXEk/jYNmFFcE
   9uKwt7pWUCPWnyFvjKIALu2BW8wKAKkNDosuWeh2uo/hU3bYcBi8UPZhT
   N49znMM6yLmSthjTM8BZJpUcoOmkDzFOoVaI797u8OZH91NxKZ6KHzEYl
   fIj9F4a0sV2DeQ2aWlWRKh31Q74Je2s3fUK2lGTdSrtMDgUN9DpdFxi9R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="460968706"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="460968706"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 21:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="945633863"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="945633863"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2023 21:20:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBplP-000Es3-0X;
	Sat, 09 Dec 2023 05:20:34 +0000
Date: Sat, 9 Dec 2023 13:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/time.c:846:9: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202312091358.yxVj2uev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 4ebbd075bcde7884e078d4360510b989f559bfec KVM: PPC: Book3S HV P9: Use host timer accounting to avoid decrementer read
date:   2 years ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231209/202312091358.yxVj2uev-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091358.yxVj2uev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091358.yxVj2uev-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/time.c:846:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:846:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:846:9: sparse:     got unsigned long long *
>> arch/powerpc/kernel/time.c:846:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:846:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:846:9: sparse:     got unsigned long long *
>> arch/powerpc/kernel/time.c:846:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:846:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:846:9: sparse:     got unsigned long long *
>> arch/powerpc/kernel/time.c:846:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:846:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:846:9: sparse:     got unsigned long long *
>> arch/powerpc/kernel/time.c:846:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:846:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:846:9: sparse:     got unsigned long long *
   arch/powerpc/kernel/time.c:557:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/powerpc/kernel/time.c:557:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/powerpc/kernel/time.c:557:24: sparse:     got unsigned long long *

vim +846 arch/powerpc/kernel/time.c

4a4cfe3836916e Tony Breeds            2007-09-22  842  
d831d0b83f2058 Tony Breeds            2007-09-21  843  static int decrementer_set_next_event(unsigned long evt,
d831d0b83f2058 Tony Breeds            2007-09-21  844  				      struct clock_event_device *dev)
d831d0b83f2058 Tony Breeds            2007-09-21  845  {
6601ec1c2ba929 Christophe Leroy       2020-09-29 @846  	__this_cpu_write(decrementers_next_tb, get_tb() + evt);
d831d0b83f2058 Tony Breeds            2007-09-21  847  	set_dec(evt);
0215f7d8c53fb1 Benjamin Herrenschmidt 2014-01-14  848  
0215f7d8c53fb1 Benjamin Herrenschmidt 2014-01-14  849  	/* We may have raced with new irq work */
0215f7d8c53fb1 Benjamin Herrenschmidt 2014-01-14  850  	if (test_irq_work_pending())
0215f7d8c53fb1 Benjamin Herrenschmidt 2014-01-14  851  		set_dec(1);
0215f7d8c53fb1 Benjamin Herrenschmidt 2014-01-14  852  
d831d0b83f2058 Tony Breeds            2007-09-21  853  	return 0;
d831d0b83f2058 Tony Breeds            2007-09-21  854  }
d831d0b83f2058 Tony Breeds            2007-09-21  855  

:::::: The code at line 846 was first introduced by commit
:::::: 6601ec1c2ba929430f5585ce7f9d9960b0e0a01d powerpc: Remove get_tb_or_rtc()

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
