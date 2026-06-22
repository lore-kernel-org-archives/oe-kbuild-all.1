Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A103655DD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124781; cv=none; b=nZEuosmkA1FO/Ur0fc3hJmkU0KK2oEHNkolg0veHKOK5amBQ/P0AiF9kWsvhk77tb9Z6Wecg6U/NobSn8llOHPVPd+yfUqJm/fkfFDUdrlgsRqqxXxXrtVUjb/NahRIY0g9RLQFcB8Z6lzIS/qldvJeGdh2cvTIgq9b7N26gmdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124781; c=relaxed/simple;
	bh=YHIVJ9SIgxDrhTz0/trktzBe4sqhdbsXs3ikJotrCoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f9BobN0LgciI5/HiqOAto7vO4w5XFSqAakbkg4V+EtQk64+tmzvHaUS4kr23xj+wQ56MSD+2GThe6UBlO3/WkRozE46qpohJny4plaJ3AOEy/T/8obgM7R0QQyECHP8gIVDmVHIwo6xzAaqAk67kuTGZidWGjJjmWCqj34F7G88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxcoSYEj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxcoSYEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782124779; x=1813660779;
  h=date:from:to:cc:subject:message-id;
  bh=YHIVJ9SIgxDrhTz0/trktzBe4sqhdbsXs3ikJotrCoU=;
  b=CxcoSYEjS6FPVDc7txDE76pDUeyUTB0jftYl9wG7WO9S2YifZ1oO32Q4
   p8zY9FTyhspYt3FDO9QSXV9sL13SZLjd4heR8sp5pAdI8tpGhysWv19fs
   ogn+HISo7QvmF0BK/vA9RAVaRuQFGH3tov3LW/a2HvxWatqEoZfBsCCu3
   6B7+rEanFlQzuwM+T2PugljDbLwFl+gnZem3d0iirNg43PVzwQURfW3w6
   0KiqE3sz8s+Gsqq95pSRMacMQukYwuLcBzPfv8fy/L6YJwoeS1CbopvRx
   AOi9/1qKO9dsRyEFEG540JU8AnvXjjGtNws9WZLKjwbwXXMeVxUnBVTdu
   Q==;
X-CSE-ConnectionGUID: oUVXpaSOQA2faQEyYpHabA==
X-CSE-MsgGUID: SZrX6Vh+TMybTxP4RZ5ykA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="105645709"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="105645709"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:39:37 -0700
X-CSE-ConnectionGUID: S96ZvfvLRYu1ULTv7bobTw==
X-CSE-MsgGUID: WdGROlysQ1mcInG2PhZM0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="273265735"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 03:39:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbc3w-00000000105-3j8x;
	Mon, 22 Jun 2026 10:39:32 +0000
Date: Mon, 22 Jun 2026 18:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:sdei-nmi/v3 3/3] arch/arm64/kernel/smp.c:904:17: error:
 implicit declaration of function 'crash_save_cpu'
Message-ID: <202606221842.s23xS9qu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git sdei-nmi/v3
head:   167493d30ef6c99a44291de14cddd41ced8149c4
commit: 167493d30ef6c99a44291de14cddd41ced8149c4 [3/3] arm64: escalate smp_send_stop() to an SDEI NMI as a last resort
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260622/202606221842.s23xS9qu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221842.s23xS9qu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221842.s23xS9qu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/smp.c: In function 'arm64_nmi_cpu_stop':
>> arch/arm64/kernel/smp.c:904:17: error: implicit declaration of function 'crash_save_cpu' [-Wimplicit-function-declaration]
     904 |                 crash_save_cpu(regs, cpu);
         |                 ^~~~~~~~~~~~~~


vim +/crash_save_cpu +904 arch/arm64/kernel/smp.c

45ed695ac10a23 Nicolas Pitre          2014-07-25  865  
d914d4d4974529 Aaro Koskinen          2019-06-17  866  /*
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  867)  * Bring the local CPU to a stop, saving its register state into the vmcore
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  868)  * on the kdump crash path first. The single point every arm64 stop path
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  869)  * funnels through, so the bookkeeping (mask interrupts, mark offline, mask
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  870)  * SDEI, optionally power off) lives in one place:
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  871)  *
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  872)  *   - the regular IPI_CPU_STOP and pseudo-NMI IPI_CPU_STOP_NMI handlers;
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  873)  *   - panic_smp_self_stop(), a CPU parking itself on a parallel panic();
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  874)  *   - the SDEI cross-CPU NMI handler (drivers/firmware/arm_sdei_nmi.c),
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  875)  *     which reaches CPUs the stop IPIs could not.
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  876)  *
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  877)  * @regs is the register state to record in the vmcore on a crash stop; NULL
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  878)  * means "capture the current context". @die_on_crash decides the kdump crash
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  879)  * path: the IPI stop handlers pass true and power the CPU off (PSCI CPU_OFF,
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  880)  * via __cpu_try_die()) so a capture kernel can reclaim it. The SDEI handler
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  881)  * and panic_smp_self_stop() pass false and only park. For SDEI that is
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  882)  * required, not just conservative: it runs inside an SDEI event that is
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  883)  * deliberately never completed (completing it has firmware resume the wedged
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  884)  * context), and a CPU_OFF from that not-yet-completed context wedges EL3 on
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  885)  * some firmware -- a documented follow-up. Parking also matches this path's
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  886)  * own fallback when CPU_OFF is unavailable.
d914d4d4974529 Aaro Koskinen          2019-06-17  887   */
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  888) void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash)
d914d4d4974529 Aaro Koskinen          2019-06-17  889  {
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  890) 	unsigned int cpu = smp_processor_id();
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  891) 	bool crash = IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop;
08e875c16a16c9 Catalin Marinas        2012-03-05  892  
fdfa588124b635 Douglas Anderson       2024-08-21  893  	/*
fdfa588124b635 Douglas Anderson       2024-08-21  894  	 * Use local_daif_mask() instead of local_irq_disable() to make sure
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  895) 	 * that pseudo-NMIs are disabled. The "stop" code starts with an IRQ
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  896) 	 * and falls back to NMI (which might be pseudo). If the IRQ finally
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  897) 	 * goes through right as we're timing out then the NMI could interrupt
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  898) 	 * us. It's better to prevent the NMI and let the IRQ finish since the
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  899) 	 * pt_regs will be better.
fdfa588124b635 Douglas Anderson       2024-08-21  900  	 */
fdfa588124b635 Douglas Anderson       2024-08-21  901  	local_daif_mask();
fdfa588124b635 Douglas Anderson       2024-08-21  902  
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  903) 	if (crash)
78fd584cdec051 AKASHI Takahiro        2017-04-03 @904  		crash_save_cpu(regs, cpu);
78fd584cdec051 AKASHI Takahiro        2017-04-03  905  
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  906) 	/* the ack a stop requester (e.g. smp_send_stop()) polls for */
fdfa588124b635 Douglas Anderson       2024-08-21  907  	set_cpu_online(cpu, false);
78fd584cdec051 AKASHI Takahiro        2017-04-03  908  
f5df26961853d6 James Morse            2018-01-08  909  	sdei_mask_local_cpu();
78fd584cdec051 AKASHI Takahiro        2017-04-03  910  
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  911) 	if (crash && die_on_crash)
de58ed5e16e62f Gavin Shan             2020-03-19  912  		__cpu_try_die(cpu);
78fd584cdec051 AKASHI Takahiro        2017-04-03  913  
78fd584cdec051 AKASHI Takahiro        2017-04-03  914  	/* just in case */
78fd584cdec051 AKASHI Takahiro        2017-04-03  915  	cpu_park_loop();
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  916) }
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  917) NOKPROBE_SYMBOL(arm64_nmi_cpu_stop);
167493d30ef6c9 Kiryl Shutsemau (Meta  2026-06-02  918) 

:::::: The code at line 904 was first introduced by commit
:::::: 78fd584cdec0518075cf3aa75e5ec491cc8f3ff3 arm64: kdump: implement machine_crash_shutdown()

:::::: TO: AKASHI Takahiro <takahiro.akashi@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
