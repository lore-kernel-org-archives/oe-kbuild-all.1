Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2930F94
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNiZtXxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697475754; x=1729011754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtF9Ia7MH+KCwZsMYf6nF1mFZX1ILnWcJCLP7BKCxD4=;
  b=XNiZtXxBEaIQV1xItZJofx+p7A7GkZ9mUdduaFb9GNg/T2Iee49/OuZF
   7u4CVDDujSzkosBrbkcaL+S2q39kDmFmgpaLS4tx5XGbpLt4AYqClCaRO
   3yjcO/E3E17etqfA2tRDcen+mkFUVFPL+hBxPbNNA4+cBUFRR+8OBJ5a7
   kjikQS7XVQtDExrcmUaKNe4WQYCDbaTqTLeGFkRvU50rnhNtnq+6tYKor
   4/hx4nwssqlKKVTCnRURdupDvCYASqxvW8mKbFgwcq/pIzaW5vsaXsjEZ
   BI15W7XMqdFgh+jdgZnC3ECkSKjrdb4+XZk3R0jgj10MPAR6rxm9cXaC8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452065057"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="452065057"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929430462"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="929430462"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Oct 2023 10:00:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsQxQ-0008Wd-3A;
	Mon, 16 Oct 2023 17:00:44 +0000
Date: Tue, 17 Oct 2023 00:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Arjan van de Ven <arjan@linux.intel.com>
Subject: [tip:x86/core 13/22] arch/x86/include/asm/processor.h:698:16:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202310170010.yzc9t6Bd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
head:   92fe9bb77b0c9fade150350fdb0629a662f0923f
commit: 6e29032340b60f7aa7475c8234b17273e4424007 [13/22] x86/cpu: Move cpu_l[l2]c_id into topology info
config: x86_64-randconfig-122-20231016 (https://download.01.org/0day-ci/archive/20231017/202310170010.yzc9t6Bd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170010.yzc9t6Bd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170010.yzc9t6Bd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/amd/uncore.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> arch/x86/include/asm/processor.h:698:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned int * @@
   arch/x86/include/asm/processor.h:698:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/include/asm/processor.h:698:16: sparse:     got unsigned int *

vim +698 arch/x86/include/asm/processor.h

   695	
   696	static inline u16 per_cpu_llc_id(unsigned int cpu)
   697	{
 > 698		return per_cpu(cpu_info.topo.llc_id, cpu);
   699	}
   700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
