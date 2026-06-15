Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C903E44E8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522568; cv=none; b=BUuKF0eq13Ibqar4gsk5SSVc956H7rN8HKJE0fdorpMK2rOaSVFPtKIRh63dkvL28tlVfigTm4HxSUwD9x3GOTJuCy9vNuVLYgq/UQMDd0aNghHM0CTSGxUmONiNuKvusQ+vI1WjNPDMQQIEV3D2XDA0rSVXrojEl0qrc6WnaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522568; c=relaxed/simple;
	bh=US8M0QpxQPCDYBSomCcFoJG5XrpPwDCigHa6uoF1zl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u/+P3x+sP9jTFlW6zbf3S47qyVFms2qnKCRjyrdJ3E/LNsGVstXJIRii0cZBy9GwnXlv6rskTB3G8LnuK13MsAzVV+mhQ4e+y0fsVXasLnbB7lRvWceAfcP1YKHvYbKi/EThhlX+yf2s4sLVndzKL0ttsdXa1DMm2O6xmTxRpHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqsQHC+i; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqsQHC+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781522567; x=1813058567;
  h=date:from:to:cc:subject:message-id;
  bh=US8M0QpxQPCDYBSomCcFoJG5XrpPwDCigHa6uoF1zl0=;
  b=WqsQHC+i7VM2y9Im0nc0PRS+FTM0AUThOZEafQFX0IfD42eYdB0cAtBR
   KoftWtEB8gnujrW5LhxirizjjA6+tTzOoGfZeel6aSlFPPddrikcWxH0w
   yajzx8AJH40FNtN6AdxiSlw9Seb/OKJ6S8zqAQz24sYvuOCoUcTpuokTG
   SdYugpIr7wh5r1WEoOkQyYkPm1+NMrCcCkseqjP0CaGT92oO3vGDskBwS
   BgE6yutW6bkwpSE3WcXqGxtZFOg3oJ6haTdLqwDswtaXLCq/cr4nJCI7r
   iEIyhGksfcuoLinjJTHLXX1xtl/1tASdFvWoVxIyrnH3qzzB433i2dk8a
   Q==;
X-CSE-ConnectionGUID: N4xURBgySZmoIafjfZS2GA==
X-CSE-MsgGUID: IGGKzbbpT8+YnuOF8LIgYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="104929729"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="104929729"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 04:22:45 -0700
X-CSE-ConnectionGUID: EnmX9VkHSLOexkGHSUpj+Q==
X-CSE-MsgGUID: npP1fcoMTJmqtNrJqKneXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="246336427"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Jun 2026 04:22:43 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ5Or-000000004s7-1UvH;
	Mon, 15 Jun 2026 11:22:41 +0000
Date: Mon, 15 Jun 2026 13:21:44 +0200
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/arm64/kernel/smp.c:904:17: error: implicit declaration
 of function 'crash_save_cpu'
Message-ID: <202606151326.2oZBRQvf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kiryl-Shutsemau/firmware-arm_sdei-add-SDEI_EVENT_SIGNAL-support/20260615-103700
head:   a86d2e2dea921ae35e48668cdb43163bf30c2836
commit: a86d2e2dea921ae35e48668cdb43163bf30c2836 arm64: escalate smp_send_stop() to an SDEI NMI as a last resort
date:   9 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260615/202606151326.2oZBRQvf-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151326.2oZBRQvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606151326.2oZBRQvf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/smp.c: In function 'arm64_nmi_cpu_stop':
>> arch/arm64/kernel/smp.c:904:17: error: implicit declaration of function 'crash_save_cpu' [-Wimplicit-function-declaration]
     904 |                 crash_save_cpu(regs, cpu);
         |                 ^~~~~~~~~~~~~~


vim +/crash_save_cpu +904 arch/arm64/kernel/smp.c

45ed695ac10a23 Nicolas Pitre          2014-07-25  865  
d914d4d4974529 Aaro Koskinen          2019-06-17  866  /*
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  867)  * Bring the local CPU to a stop, saving its register state into the vmcore
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  868)  * on the kdump crash path first. The single point every arm64 stop path
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  869)  * funnels through, so the bookkeeping (mask interrupts, mark offline, mask
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  870)  * SDEI, optionally power off) lives in one place:
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  871)  *
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  872)  *   - the regular IPI_CPU_STOP and pseudo-NMI IPI_CPU_STOP_NMI handlers;
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  873)  *   - panic_smp_self_stop(), a CPU parking itself on a parallel panic();
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  874)  *   - the SDEI cross-CPU NMI handler (drivers/firmware/arm_sdei_nmi.c),
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  875)  *     which reaches CPUs the stop IPIs could not.
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  876)  *
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  877)  * @regs is the register state to record in the vmcore on a crash stop; NULL
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  878)  * means "capture the current context". @die_on_crash decides the kdump crash
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  879)  * path: the IPI stop handlers pass true and power the CPU off (PSCI CPU_OFF,
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  880)  * via __cpu_try_die()) so a capture kernel can reclaim it. The SDEI handler
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  881)  * and panic_smp_self_stop() pass false and only park. For SDEI that is
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  882)  * required, not just conservative: it runs inside an SDEI event that is
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  883)  * deliberately never completed (completing it has firmware resume the wedged
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  884)  * context), and a CPU_OFF from that not-yet-completed context wedges EL3 on
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  885)  * some firmware -- a documented follow-up. Parking also matches this path's
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  886)  * own fallback when CPU_OFF is unavailable.
d914d4d4974529 Aaro Koskinen          2019-06-17  887   */
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  888) void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash)
d914d4d4974529 Aaro Koskinen          2019-06-17  889  {
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  890) 	unsigned int cpu = smp_processor_id();
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  891) 	bool crash = IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop;
08e875c16a16c9 Catalin Marinas        2012-03-05  892  
fdfa588124b635 Douglas Anderson       2024-08-21  893  	/*
fdfa588124b635 Douglas Anderson       2024-08-21  894  	 * Use local_daif_mask() instead of local_irq_disable() to make sure
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  895) 	 * that pseudo-NMIs are disabled. The "stop" code starts with an IRQ
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  896) 	 * and falls back to NMI (which might be pseudo). If the IRQ finally
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  897) 	 * goes through right as we're timing out then the NMI could interrupt
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  898) 	 * us. It's better to prevent the NMI and let the IRQ finish since the
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  899) 	 * pt_regs will be better.
fdfa588124b635 Douglas Anderson       2024-08-21  900  	 */
fdfa588124b635 Douglas Anderson       2024-08-21  901  	local_daif_mask();
fdfa588124b635 Douglas Anderson       2024-08-21  902  
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  903) 	if (crash)
78fd584cdec051 AKASHI Takahiro        2017-04-03 @904  		crash_save_cpu(regs, cpu);
78fd584cdec051 AKASHI Takahiro        2017-04-03  905  
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  906) 	/* the ack a stop requester (e.g. smp_send_stop()) polls for */
fdfa588124b635 Douglas Anderson       2024-08-21  907  	set_cpu_online(cpu, false);
78fd584cdec051 AKASHI Takahiro        2017-04-03  908  
f5df26961853d6 James Morse            2018-01-08  909  	sdei_mask_local_cpu();
78fd584cdec051 AKASHI Takahiro        2017-04-03  910  
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  911) 	if (crash && die_on_crash)
de58ed5e16e62f Gavin Shan             2020-03-19  912  		__cpu_try_die(cpu);
78fd584cdec051 AKASHI Takahiro        2017-04-03  913  
78fd584cdec051 AKASHI Takahiro        2017-04-03  914  	/* just in case */
78fd584cdec051 AKASHI Takahiro        2017-04-03  915  	cpu_park_loop();
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  916) }
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  917) NOKPROBE_SYMBOL(arm64_nmi_cpu_stop);
a86d2e2dea921a Kiryl Shutsemau (Meta  2026-06-15  918) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
