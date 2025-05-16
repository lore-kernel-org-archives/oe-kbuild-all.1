Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68EF442C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 02:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747361572; cv=none; b=PZw87ztJBARlkC9O6fnfvkp4saeB7hgArqp4+C6gn/jCrnQV4l91egr3zEVxQFBZ1aUjC1kg1BPIzoXOESia30PLswjgjCvgfHz+E4aN9ugv1g9e9A126rHBEN8sJcPFEL4AfIy4AMzfTSGWDQJ6EykfcPdsdFJyfQ0ovw41S9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747361572; c=relaxed/simple;
	bh=/endpdkOPgyDy0MJU3YBtV5raNCLgMm2NNPTVYACzTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGLsoIOgoqCZ/cJwjRPZFUSawkBiYC6geHKLO1twGpMeI6m2nuoa8S1tA3jo9OWoaipqWAHKtRxotUP2ZBmaJedCskWQCAxEiA6mCVwiDdBb6VtX0tUCh3+5OwaEZoOGSXlTle3TlfyWRwB0Q84A0PZFikZzXcDWm1BODNaKovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzLZR+ym; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzLZR+ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747361571; x=1778897571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/endpdkOPgyDy0MJU3YBtV5raNCLgMm2NNPTVYACzTA=;
  b=TzLZR+ymcMlNhS3MSDLIBPHBlL3pOqGZiFL6Pcb34AcpAvCCM+iWyUeU
   KB/LSOi0AHJ/M7qZJ/lf+Swv6+3AbOACkbIj5uxRKosOXMF/MmPmUfYkP
   O8j8yYGLjw7zkLuQlE9HyywtafBhH6axogy9N1a+Fuwl+CkdDFF2BLKJ3
   ZPOebmcCNdQC2PCHjN9JckSDimaFmtBMpAPAbldsK0exyGHbbHsErPwUG
   GaDLzRx0Fa+u8XFRBJZbPtqHOrUL4ceVKRJqc8vVkprFT/f+276DmD+3r
   MtRsStRmQvaMS/v8CVHGLLLRbO58lKyrzAbsB8uL3jPVctXBc5lKjsEcz
   g==;
X-CSE-ConnectionGUID: RX/PpINXSaSP905RbOG5Hw==
X-CSE-MsgGUID: x8VlNWz5QMOLF/R/gYMgyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74723115"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="74723115"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 19:12:50 -0700
X-CSE-ConnectionGUID: 7XJbXJIUT12MZE72SAivWw==
X-CSE-MsgGUID: xURcaCYqT5WpJPPdzZky0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="143671748"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 19:12:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFkZ4-000Iut-0R;
	Fri, 16 May 2025 02:12:46 +0000
Date: Fri, 16 May 2025 10:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next 28/33] include/linux/cpumask.h:332:14: error:
 conflicting types for 'cpumask_next_wrap'
Message-ID: <202505161033.49W9RT6g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next
head:   f5d2cd0e6f0ad7ba267dcb972d57a142cf3a3d69
commit: d365b5a3cf38800c47dfc894774cb3b0663d170f [28/33] cpumask: introduce cpumask_random()
config: riscv-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161033.49W9RT6g-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161033.49W9RT6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161033.49W9RT6g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/processor.h:55:0,
                    from arch/riscv/include/asm/thread_info.h:42,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:8:
>> include/linux/cpumask.h:332:14: error: conflicting types for 'cpumask_next_wrap'
    unsigned int cpumask_next_wrap(const struct cpumask *src)
                 ^~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:317:14: note: previous definition of 'cpumask_next_wrap' was here
    unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
                 ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2351650872
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=2351650872
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2351650872
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2351650872
   make: Target 'prepare' not remade because of errors.


vim +/cpumask_next_wrap +332 include/linux/cpumask.h

   324	
   325	/**
   326	 * cpumask_random - get random cpu in *src.
   327	 * @src: cpumask pointer
   328	 *
   329	 * Return: random set bit, or >= nr_cpu_ids if @src is empty.
   330	 */
   331	static __always_inline
 > 332	unsigned int cpumask_next_wrap(const struct cpumask *src)
   333	{
   334		return find_random_bit(cpumask_bits(src), nr_cpu_ids);
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
