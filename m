Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202C215F7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 05:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774587774; cv=none; b=PqCjmzZJf3ZttNREwsSCo/5AJ2mpMWFHN6aTH8xAI/B7woLJG7hs7JWZtnXjZc8iebk2Dg9X2IetVvvvAF7HFVsL4Cq8C8aX+ZCZSS9AgMVP+9MVIRA6H73F7rBNNrLMmAOepRGRFSXcCp6UerxrMseThpGJA9Alt6qprYajheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774587774; c=relaxed/simple;
	bh=odbkMhAeYthZEUs7+W+yr3VdSZUV2X2cqSt2IR8ba+A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H6PtmBX5TGcgtYuuu61TUQmqd8VV5em+LZCbG0DCi30/Zq1KfSIewvDzckiaHWCwnaAUnt7Wr+KcmxcWPCCROp7zLY3yY8kV9HymRWRBGnCxAlif8WLvXW/QqY6j9yk1kbedw4xEMDIFdESuu6hq8N2FNLMtJ0B4PfBLZwRXKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LumajpYA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LumajpYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774587772; x=1806123772;
  h=date:from:to:cc:subject:message-id;
  bh=odbkMhAeYthZEUs7+W+yr3VdSZUV2X2cqSt2IR8ba+A=;
  b=LumajpYARXV48IniEKNTApNpucL/CXqjVFEiIybJtze1aQ2FuO4MiFeQ
   RZStZdYtHcBoFISn9uiXh2me7CfsFKqoHq9X04asbX5E1HC+ivdBFfYBq
   32M6H7U8ZiZgYbNg/tYeD9/M2BR9kkdSci3rEKoJFIcT5zpihlzoG5+yn
   f22OqrkAEc2BmIFBdS7t0B8/dZlrn3UnJZ4+tdjMevCuvCYBWnCvoRWsR
   ylbiTMeExjwllrOh8jWf14hQy3UTfRVm7NLmKWszpsc+7Bi1Yt4aospZS
   o/vcjiDObRXbRQ6tR/5fD+E44tPjheN/f1eyNP+AZ5UxKF1k7pCfkIO8u
   w==;
X-CSE-ConnectionGUID: JNk7AU+CRsKTCedY6qwQUA==
X-CSE-MsgGUID: UnzYnnciSO6MiF7TSI5nEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98275503"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="98275503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 22:02:51 -0700
X-CSE-ConnectionGUID: 08V1Dgz5SEOCnET2GmhH1w==
X-CSE-MsgGUID: ygwinpRHT2q+GANa9Vu8Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="218592641"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2026 22:02:51 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5zLN-000000009nr-0xLN;
	Fri, 27 Mar 2026 05:02:49 +0000
Date: Fri, 27 Mar 2026 13:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 13/14] kernel/irq/proc.h:7:20: error:
 redefinition of 'irq_proc_calc_prec'
Message-ID: <202603271345.EiGT0FR3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   579e60ae89fabd45c50557035a5c04cb32f9e203
commit: 70db66bab64e3ab73a66f937f80829cafe2927e7 [13/14] genirq/proc: Runtime size the chip name
config: powerpc-randconfig-001-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271345.EiGT0FR3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271345.EiGT0FR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271345.EiGT0FR3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/irq/internals.h:15,
                    from kernel/irq/irqdomain.c:2087:
>> kernel/irq/proc.h:7:20: error: redefinition of 'irq_proc_calc_prec'
    static inline void irq_proc_calc_prec(void) { }
                       ^~~~~~~~~~~~~~~~~~
   In file included from kernel/irq/irqdomain.c:23:
   kernel/irq/proc.h:7:20: note: previous definition of 'irq_proc_calc_prec' was here
    static inline void irq_proc_calc_prec(void) { }
                       ^~~~~~~~~~~~~~~~~~
   In file included from kernel/irq/internals.h:15,
                    from kernel/irq/irqdomain.c:2087:
>> kernel/irq/proc.h:8:20: error: redefinition of 'irq_proc_update_chip'
    static inline void irq_proc_update_chip(const struct irq_chip *chip) { }
                       ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/irq/irqdomain.c:23:
   kernel/irq/proc.h:8:20: note: previous definition of 'irq_proc_update_chip' was here
    static inline void irq_proc_update_chip(const struct irq_chip *chip) { }
                       ^~~~~~~~~~~~~~~~~~~~


vim +/irq_proc_calc_prec +7 kernel/irq/proc.h

     2	
     3	#if defined(CONFIG_PROC_FS) && defined(CONFIG_GENERIC_IRQ_SHOW)
     4	void irq_proc_calc_prec(void);
     5	void irq_proc_update_chip(const struct irq_chip *chip);
     6	#else
   > 7	static inline void irq_proc_calc_prec(void) { }
   > 8	static inline void irq_proc_update_chip(const struct irq_chip *chip) { }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
