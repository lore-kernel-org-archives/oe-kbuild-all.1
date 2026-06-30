Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2BC337BA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786522; cv=none; b=Tyf4Q4rwOXCRynPhHs8hZEws8WAHwKb15dhnqLiMxOGfq945YMQ/GPHjetuVQTNMq4SKnpyIH6HF3Mbbg20a4j7NVsGIDsfClDke2SYqAhmO08GV4NYxs08D4j07UdzfnHkdCJJU1NQRX5XbxMti/eO1dTqZFtXy3FvwmG0Icic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786522; c=relaxed/simple;
	bh=y4S4gbpSGAfyJ5WLrk9EEHYrnMX4XX5kg7mgxTgQfkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qh0wU1N+zm8iLpA6yM/qNpakwzt4SiWj6y3aidpqbmEN/zmROXTsEI74lqieg3Xc+TUqfNxMNimr3TLstKIR/zQAV2VDVCqV+zFgFGog7X3HqeyqjO0fKACjZzWc6qz0Qa1ifNZmjpZ7iidZJM03z27NkdLf7mOxnFAjlkV0tcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUVhOR3R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUVhOR3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782786521; x=1814322521;
  h=date:from:to:cc:subject:message-id;
  bh=y4S4gbpSGAfyJ5WLrk9EEHYrnMX4XX5kg7mgxTgQfkQ=;
  b=ZUVhOR3R1d2m9UmpUG6gcpoHDGWH/wwEhHS00FlkfuS5bAPVq4MJA85f
   pvY5kWLLhd7spTx9uuD10+arJaTw3myg/rXhYfewosY/Pj7n75op8HjHF
   7qncke2tVVjaAtQRlBQ+0PcHSP/eN5VW2fgKD6Ckfh8yt0Fg7fhU+7zXP
   Qi6sSXeqgw0gXNciBDE0WnIcbtinnZySxiWpcW/8BC69srmyT9XAlirg5
   ajWYqEwa6tQinfG764fuLQ/Lc/aXTOknaNoTVPMmGTds1V+7lsmVudKWQ
   lmFGC3c1laucpvFca5pwBASOLf1oS+9S6fSwe0Nsrffz4e/mIkYOvqHuq
   g==;
X-CSE-ConnectionGUID: dJicL+WcScCnXr1KBbh/8g==
X-CSE-MsgGUID: 0N0XCsf7S6eeEF8TBdrtLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="109042365"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="109042365"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 19:28:41 -0700
X-CSE-ConnectionGUID: iqaVLXocSgW3k09rvv9FiA==
X-CSE-MsgGUID: FMlJOmnyQuOxNrVUb9FRrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="247674476"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 19:28:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weODE-000000007xV-1Si7;
	Tue, 30 Jun 2026 02:28:36 +0000
Date: Tue, 30 Jun 2026 10:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:sdei-nmi/diag-cpuoff-direct 5/5]
 arch/arm64/kernel/smp.c:893:14: warning: unused variable 'crash'
Message-ID: <202606301044.xcGHJhez-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git sdei-nmi/diag-cpuoff-direct
head:   256121e44ded1ba35c2d5a495426fdc4f18440be
commit: 256121e44ded1ba35c2d5a495426fdc4f18440be [5/5] DIAG: call CPU_OFF directly from the SDEI handler (do not submit)
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260630/202606301044.xcGHJhez-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301044.xcGHJhez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301044.xcGHJhez-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/smp.c: In function 'arm64_nmi_cpu_stop':
>> arch/arm64/kernel/smp.c:893:14: warning: unused variable 'crash' [-Wunused-variable]
     893 |         bool crash = IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop;
         |              ^~~~~


vim +/crash +893 arch/arm64/kernel/smp.c

45ed695ac10a23 Nicolas Pitre          2014-07-25  865  
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  866) /**
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  867)  * arm64_nmi_cpu_stop() - stop the local CPU after it is told to stop.
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  868)  * @regs: register state to record in the vmcore on a crash stop, or NULL for
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  869)  *        panic_smp_self_stop(), which has no interrupted context to save.
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  870)  * @die_on_crash: on the kdump crash path, power the CPU off via PSCI CPU_OFF
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  871)  *                (so a capture kernel can reclaim it) rather than parking it.
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  872)  *
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  873)  * The single point every arm64 stop path funnels through, keeping the
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  874)  * bookkeeping (mask interrupts, save the crash context, mark offline, mask
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  875)  * SDEI, optionally power off) in one place:
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  876)  *
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  877)  *   - the regular IPI_CPU_STOP and pseudo-NMI IPI_CPU_STOP_NMI handlers;
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  878)  *   - panic_smp_self_stop(), a CPU parking itself on a parallel panic();
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  879)  *   - the SDEI cross-CPU NMI handler (drivers/firmware/arm_sdei_nmi.c),
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  880)  *     which reaches CPUs the stop IPIs could not.
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  881)  *
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  882)  * The IPI stop handlers pass @die_on_crash true. The SDEI handler and
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  883)  * panic_smp_self_stop() pass false and only park. For SDEI that is required,
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  884)  * not just conservative: it runs inside an SDEI event that is deliberately
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  885)  * never completed (completing it has firmware resume the wedged context), and
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  886)  * a CPU_OFF from that not-yet-completed context wedges EL3 on some firmware --
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  887)  * a documented follow-up. Parking also matches this path's own fallback when
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  888)  * CPU_OFF is unavailable.
d914d4d4974529 Aaro Koskinen          2019-06-17  889   */
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  890) void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash)
d914d4d4974529 Aaro Koskinen          2019-06-17  891  {
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  892) 	unsigned int cpu = smp_processor_id();
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02 @893) 	bool crash = IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop;
08e875c16a16c9 Catalin Marinas        2012-03-05  894  
fdfa588124b635 Douglas Anderson       2024-08-21  895  	/*
fdfa588124b635 Douglas Anderson       2024-08-21  896  	 * Use local_daif_mask() instead of local_irq_disable() to make sure
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  897) 	 * that pseudo-NMIs are disabled. The "stop" code starts with an IRQ
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  898) 	 * and falls back to NMI (which might be pseudo). If the IRQ finally
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  899) 	 * goes through right as we're timing out then the NMI could interrupt
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  900) 	 * us. It's better to prevent the NMI and let the IRQ finish since the
3032112bb2ab2d Kiryl Shutsemau (Meta  2026-06-02  901) 	 * pt_regs will be better.
fdfa588124b635 Douglas Anderson       2024-08-21  902  	 */
fdfa588124b635 Douglas Anderson       2024-08-21  903  	local_daif_mask();
fdfa588124b635 Douglas Anderson       2024-08-21  904  

:::::: The code at line 893 was first introduced by commit
:::::: 3032112bb2ab2d5149f2d38b97f85caf3a8bb757 arm64: escalate smp_send_stop() to an SDEI NMI as a last resort

:::::: TO: Kiryl Shutsemau (Meta) <kas@kernel.org>
:::::: CC: Kiryl Shutsemau (Meta) <kas@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
