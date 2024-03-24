Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BFC171A2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711274677; cv=none; b=bl6z8Nt122quRMwYF/J9m487G/luvEjt/Vy5X+G87FHZNtBidGUL4juvRxlPXHx1yeoFp2fsCtmDd3LZpfiviWFvovW5xrtENZTxR4ObsO7WPbG62y1rJRKBR8U32/QkZs9qCP7g1rLv0Ki349KRTlAdwnlp7Irxltz9IhHo9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711274677; c=relaxed/simple;
	bh=ExiRDUlKHLS85OPfvFtzPRCduVMoukofsjcHFue/A+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kMwusC5jymsPxzP2D3pWiTboAaKKi+dUBW0/L7zq6RheOOEUplL8gjNQKq8daR9yg+jJiUtjWUwJlG3vRILBBh7EhnQCGZQlOMg+t3zZ00dksmbUdhb2lWsVCWJvKgUGouMsc2jO/Bdw36lfAUP2e3HRJ5AnhUDbSGlxZpZM+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbwoENuK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbwoENuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711274676; x=1742810676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ExiRDUlKHLS85OPfvFtzPRCduVMoukofsjcHFue/A+0=;
  b=LbwoENuK6yzSJpQ1LduIc0DDUDItnAV411sFo/pa3nc/5lbCYlqZ56vb
   EKP7e367fkZH6hy8H8NqXChbXBDzKd8Kk0/blUby73Qt9eFX2wKWa7XG8
   m7LRSa7OJsGwg3XqnSrIF8aREqPrvaiSBOjPK4TUg+5gLWxuy4T0XJLFh
   aVxSNm46JuFH/7feZSct/PAHqwBd2vJhULBybON1Q/pnS/2el5IVMS0uC
   d+sJI/WahlHtsaUipwG/hPRV9eRsV66wos3mbvyB2Yf7h1g3MMZg9xhBw
   YCsqeeIH/nK3JNbvrIiUA2MXH+DAgI9+UB1HADpaRAvJbStexpM2zdyVT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="9233840"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="9233840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 03:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="52801698"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2024 03:04:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roKiL-000Lla-0C;
	Sun, 24 Mar 2024 10:04:29 +0000
Date: Sun, 24 Mar 2024 18:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/platforms/85xx/smp.c:401:20: error: 'crashing_cpu'
 undeclared; did you mean 'crash_save_cpu'?
Message-ID: <202403241807.UsbRbcYO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70293240c5ce675a67bfc48f419b093023b862b3
commit: 5c4233cc0920cc90787aafe950b90f6c57a35b88 powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency
date:   7 days ago
config: powerpc64-randconfig-r023-20211203 (https://download.01.org/0day-ci/archive/20240324/202403241807.UsbRbcYO-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241807.UsbRbcYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241807.UsbRbcYO-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/85xx/smp.c: In function 'mpc85xx_smp_kexec_cpu_down':
>> arch/powerpc/platforms/85xx/smp.c:401:20: error: 'crashing_cpu' undeclared (first use in this function); did you mean 'crash_save_cpu'?
     401 |         if (cpu == crashing_cpu && cpu_thread_in_core(cpu) != 0) {
         |                    ^~~~~~~~~~~~
         |                    crash_save_cpu
   arch/powerpc/platforms/85xx/smp.c:401:20: note: each undeclared identifier is reported only once for each function it appears in


vim +401 arch/powerpc/platforms/85xx/smp.c

f933a41e419a954 Matthew McClintock 2010-07-21  380  
f933a41e419a954 Matthew McClintock 2010-07-21  381  static void mpc85xx_smp_kexec_down(void *arg)
f933a41e419a954 Matthew McClintock 2010-07-21  382  {
f933a41e419a954 Matthew McClintock 2010-07-21  383  	if (ppc_md.kexec_cpu_down)
f933a41e419a954 Matthew McClintock 2010-07-21  384  		ppc_md.kexec_cpu_down(0,1);
f933a41e419a954 Matthew McClintock 2010-07-21  385  }
939fbf00805b395 Tiejun Chen        2015-10-06  386  #else
84a61fb43fdfc52 Michael Ellerman   2021-11-24  387  static void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
939fbf00805b395 Tiejun Chen        2015-10-06  388  {
f34b3e19fd060b8 Scott Wood         2015-10-06  389  	int cpu = smp_processor_id();
f34b3e19fd060b8 Scott Wood         2015-10-06  390  	int sibling = cpu_last_thread_sibling(cpu);
f34b3e19fd060b8 Scott Wood         2015-10-06  391  	bool notified = false;
f34b3e19fd060b8 Scott Wood         2015-10-06  392  	int disable_cpu;
f34b3e19fd060b8 Scott Wood         2015-10-06  393  	int disable_threadbit = 0;
f34b3e19fd060b8 Scott Wood         2015-10-06  394  	long start = mftb();
f34b3e19fd060b8 Scott Wood         2015-10-06  395  	long now;
f34b3e19fd060b8 Scott Wood         2015-10-06  396  
939fbf00805b395 Tiejun Chen        2015-10-06  397  	local_irq_disable();
939fbf00805b395 Tiejun Chen        2015-10-06  398  	hard_irq_disable();
939fbf00805b395 Tiejun Chen        2015-10-06  399  	mpic_teardown_this_cpu(secondary);
f34b3e19fd060b8 Scott Wood         2015-10-06  400  
f34b3e19fd060b8 Scott Wood         2015-10-06 @401  	if (cpu == crashing_cpu && cpu_thread_in_core(cpu) != 0) {
f34b3e19fd060b8 Scott Wood         2015-10-06  402  		/*
f34b3e19fd060b8 Scott Wood         2015-10-06  403  		 * We enter the crash kernel on whatever cpu crashed,
f34b3e19fd060b8 Scott Wood         2015-10-06  404  		 * even if it's a secondary thread.  If that's the case,
f34b3e19fd060b8 Scott Wood         2015-10-06  405  		 * disable the corresponding primary thread.
f34b3e19fd060b8 Scott Wood         2015-10-06  406  		 */
f34b3e19fd060b8 Scott Wood         2015-10-06  407  		disable_threadbit = 1;
f34b3e19fd060b8 Scott Wood         2015-10-06  408  		disable_cpu = cpu_first_thread_sibling(cpu);
f34b3e19fd060b8 Scott Wood         2015-10-06  409  	} else if (sibling != crashing_cpu &&
f34b3e19fd060b8 Scott Wood         2015-10-06  410  		   cpu_thread_in_core(cpu) == 0 &&
f34b3e19fd060b8 Scott Wood         2015-10-06  411  		   cpu_thread_in_core(sibling) != 0) {
f34b3e19fd060b8 Scott Wood         2015-10-06  412  		disable_threadbit = 2;
f34b3e19fd060b8 Scott Wood         2015-10-06  413  		disable_cpu = sibling;
f34b3e19fd060b8 Scott Wood         2015-10-06  414  	}
f34b3e19fd060b8 Scott Wood         2015-10-06  415  
f34b3e19fd060b8 Scott Wood         2015-10-06  416  	if (disable_threadbit) {
d2e60075a3d4422 Nicholas Piggin    2018-02-14  417  		while (paca_ptrs[disable_cpu]->kexec_state < KEXEC_STATE_REAL_MODE) {
f34b3e19fd060b8 Scott Wood         2015-10-06  418  			barrier();
f34b3e19fd060b8 Scott Wood         2015-10-06  419  			now = mftb();
f34b3e19fd060b8 Scott Wood         2015-10-06  420  			if (!notified && now - start > 1000000) {
f34b3e19fd060b8 Scott Wood         2015-10-06  421  				pr_info("%s/%d: waiting for cpu %d to enter KEXEC_STATE_REAL_MODE (%d)\n",
f34b3e19fd060b8 Scott Wood         2015-10-06  422  					__func__, smp_processor_id(),
f34b3e19fd060b8 Scott Wood         2015-10-06  423  					disable_cpu,
d2e60075a3d4422 Nicholas Piggin    2018-02-14  424  					paca_ptrs[disable_cpu]->kexec_state);
f34b3e19fd060b8 Scott Wood         2015-10-06  425  				notified = true;
f34b3e19fd060b8 Scott Wood         2015-10-06  426  			}
f34b3e19fd060b8 Scott Wood         2015-10-06  427  		}
f34b3e19fd060b8 Scott Wood         2015-10-06  428  
f34b3e19fd060b8 Scott Wood         2015-10-06  429  		if (notified) {
f34b3e19fd060b8 Scott Wood         2015-10-06  430  			pr_info("%s: cpu %d done waiting\n",
f34b3e19fd060b8 Scott Wood         2015-10-06  431  				__func__, disable_cpu);
f34b3e19fd060b8 Scott Wood         2015-10-06  432  		}
f34b3e19fd060b8 Scott Wood         2015-10-06  433  
f34b3e19fd060b8 Scott Wood         2015-10-06  434  		mtspr(SPRN_TENC, disable_threadbit);
f34b3e19fd060b8 Scott Wood         2015-10-06  435  		while (mfspr(SPRN_TENSR) & disable_threadbit)
f34b3e19fd060b8 Scott Wood         2015-10-06  436  			cpu_relax();
f34b3e19fd060b8 Scott Wood         2015-10-06  437  	}
939fbf00805b395 Tiejun Chen        2015-10-06  438  }
939fbf00805b395 Tiejun Chen        2015-10-06  439  #endif
f933a41e419a954 Matthew McClintock 2010-07-21  440  

:::::: The code at line 401 was first introduced by commit
:::::: f34b3e19fd060b87e97c89050f2b40b8ada468a9 powerpc/e6500: kexec: Handle hardware threads

:::::: TO: Scott Wood <scottwood@freescale.com>
:::::: CC: Scott Wood <scottwood@freescale.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
