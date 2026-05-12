Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A040360EC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586196; cv=none; b=en+fkYv8/rimVp49FX61n9tKmNRpsnXYWWgY4Z5wyyFMFSoRmX5vWuMOBeKeRDHGXG6QztkIJOtvNgy2qyBDIK4EG2linN0D1dV1quoGM5jwXlyf4Stn+baRURQX0G7lhuqQ5Scvtx9y+Gg7YvTlbYLZv7O5a3X5nAKUnvdXGSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586196; c=relaxed/simple;
	bh=tLSQnDBO+ob5pAd6B2FMEAmSz8B64btxkNr72D+aP9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wf4egrc1tpERLdWdXDmzacHxSnisJDY43/E/zs86LIAJdvglBa7pGUeI+l70WYPwsP+LSb1soerEUA+7HOtEGaGCODLY2gEDKd5GrOYm/nXAC1hV4JzT/YSX2WBNPtoRL/VsxjRHbg+mbXvKMu7JBzkBmstK9Y32xwqqOTALa4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y92DB9bS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y92DB9bS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778586195; x=1810122195;
  h=date:from:to:cc:subject:message-id;
  bh=tLSQnDBO+ob5pAd6B2FMEAmSz8B64btxkNr72D+aP9g=;
  b=Y92DB9bSMOH69QcWlTM4thVZ6gULduBaA/hf67BOHYIgW12DyArHqJEI
   cnNKibrEqZtu7yQANANWZvqTc1o3YyFwebV/xtVAPqJk5nOlILDyjXTO3
   hqYHtkH6Ffx14JemIVpaizHbOAdegVmeum8QpPThgh1Vdkb3rav5Ww6YH
   T6i04zVvynzUaPthbesn35wjw1hHFA5N0ENf/8/bJnfPWbZIaZ8Tqt3/H
   JBX/7HiuSk2tk75mMufehcBqe+x/12BeRansPql/Yv5PwDsvp4X6UI3/M
   iBUySGa/oeMWf/2QnhZjW8gmWrfYp5vDydzcRq00OM6MQ/hMvE1Sds3qz
   w==;
X-CSE-ConnectionGUID: CTth9Zv5QeaRVXJcCOhdKQ==
X-CSE-MsgGUID: bdkIrkdAQhWLsROdmhs8og==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="97058494"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="97058494"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:43:14 -0700
X-CSE-ConnectionGUID: cIdHbZq2SH2BBBMcBzDuFA==
X-CSE-MsgGUID: dI1XOUbhQXCPkVNt+0J56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="261496785"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2026 04:43:13 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMlW3-0000000024D-0E40;
	Tue, 12 May 2026 11:43:11 +0000
Date: Tue, 12 May 2026 19:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [tglx-devel:irq/proc 15/16] kernel/irq/proc.h:7:20: error:
 redefinition of 'irq_proc_calc_prec'
Message-ID: <202605121956.gJxsylzw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/proc
head:   6aa40b910f0486df6146560b14fd0171437f9b9b
commit: 673cacc04c88b5129d117c576d2e28c4125dfb34 [15/16] genirq/proc: Runtime size the chip name
config: nios2-randconfig-002-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121956.gJxsylzw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121956.gJxsylzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121956.gJxsylzw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/irq/internals.h:15,
                    from kernel/irq/irqdomain.c:2087:
>> kernel/irq/proc.h:7:20: error: redefinition of 'irq_proc_calc_prec'
       7 | static inline void irq_proc_calc_prec(void) { }
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from kernel/irq/irqdomain.c:23:
   kernel/irq/proc.h:7:20: note: previous definition of 'irq_proc_calc_prec' was here
       7 | static inline void irq_proc_calc_prec(void) { }
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from kernel/irq/internals.h:15,
                    from kernel/irq/irqdomain.c:2087:
>> kernel/irq/proc.h:8:20: error: redefinition of 'irq_proc_update_chip'
       8 | static inline void irq_proc_update_chip(const struct irq_chip *chip) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/irq/irqdomain.c:23:
   kernel/irq/proc.h:8:20: note: previous definition of 'irq_proc_update_chip' was here
       8 | static inline void irq_proc_update_chip(const struct irq_chip *chip) { }
         |                    ^~~~~~~~~~~~~~~~~~~~


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
