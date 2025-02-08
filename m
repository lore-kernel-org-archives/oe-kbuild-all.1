Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B38241116
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 19:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739044317; cv=none; b=tHmiDnsNLvzBic60bbIHOIhccc7FjzxUQSbfWaHiStPhbfiTRUqM/VIN/iThN1gyw21DvJK7YEkYy4yD7RZ57Wro6Y9nIwaJyb0KfRfbIf/3GvElw+/wKXbTgTEc/6I8DGgV1DXsVPqvrHWTA9SFwMY0+1ZR6JqSf/dujxvP2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739044317; c=relaxed/simple;
	bh=BAvTZPraDr9SN2MNQqzTpAfz001rOe/a4j7S+sTcn1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATKyOrIhQU8q1J8mL4yoeKP7Jm1v4q4mIQTbtqpclQJ1ZLOLnNu6WIoiN8gzOYBNI26GXEHX1czPel5XbolwV3+BoJAdVDJl7M/vaeM10Q6FEfXOfDgbL7Wx9zhf61xBQkltfF0CW52/G06SWW6dqJW/IsJ2Vi54b8SJMggIbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+f7W4GJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+f7W4GJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739044315; x=1770580315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BAvTZPraDr9SN2MNQqzTpAfz001rOe/a4j7S+sTcn1I=;
  b=R+f7W4GJRCIduY50hFL/dWlSe902TOfh3+Bni+6QYDI1uCtciY2gt05N
   DVimW9U8nvjhA6foq+GLrDHYwr7SHqxbif1xdzqU0wTvrcP9sEWy5YKw0
   NKomBVeKpzAQE/tDqih5PEwqb7deOTBo7TBp4bkLfkIstyNWyzArFAwZs
   /GAQ3kT5KR27dLGiL/v54noJmTFCpLE9SBRZ8TinfOeKSIPSmKAJq8zbu
   /iJcrPlINnyObtuxrqb7k5vwbkRYdpEvHDSIXmr4lNlwqGQSH645yB9ou
   FVswBBiBXGrZ/+fq33kl/ClAJdAPN9E/SbzXQc4BiUxLsUW89Z8cVEbSM
   A==;
X-CSE-ConnectionGUID: DlJ01S2HS6CphYXDK5DISg==
X-CSE-MsgGUID: YVZns+gwRoygLHx/0hIm7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50303870"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50303870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 11:51:52 -0800
X-CSE-ConnectionGUID: U0aengsbRtKNWdWFKRiuoA==
X-CSE-MsgGUID: OGY60HH2RX2NI8ysmVcQwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112259334"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2025 11:51:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgqrk-0010Yp-2R;
	Sat, 08 Feb 2025 19:51:48 +0000
Date: Sun, 9 Feb 2025 03:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 38/38] arch/x86/kernel/smpboot.c:281:9:
 error: implicit declaration of function
 'paravirt_sched_clock_start_secondary'
Message-ID: <202502090313.aszouF6V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   4234e8b9df9e1902968f836d9306c026adf43347
commit: 4234e8b9df9e1902968f836d9306c026adf43347 [38/38] x86/paravirt: kvmclock: Setup kvmclock early iff it's sched_clock
config: x86_64-buildonly-randconfig-001-20250209 (https://download.01.org/0day-ci/archive/20250209/202502090313.aszouF6V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090313.aszouF6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090313.aszouF6V-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/smpboot.c: In function 'start_secondary':
>> arch/x86/kernel/smpboot.c:281:9: error: implicit declaration of function 'paravirt_sched_clock_start_secondary' [-Werror=implicit-function-declaration]
     281 |         paravirt_sched_clock_start_secondary();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/paravirt_sched_clock_start_secondary +281 arch/x86/kernel/smpboot.c

   228	
   229	/*
   230	 * Activate a secondary processor.
   231	 */
   232	static void notrace start_secondary(void *unused)
   233	{
   234		/*
   235		 * Don't put *anything* except direct CPU state initialization
   236		 * before cpu_init(), SMP booting is too fragile that we want to
   237		 * limit the things done here to the most necessary things.
   238		 */
   239		cr4_init();
   240	
   241		/*
   242		 * 32-bit specific. 64-bit reaches this code with the correct page
   243		 * table established. Yet another historical divergence.
   244		 */
   245		if (IS_ENABLED(CONFIG_X86_32)) {
   246			/* switch away from the initial page table */
   247			load_cr3(swapper_pg_dir);
   248			__flush_tlb_all();
   249		}
   250	
   251		cpu_init_exception_handling(false);
   252	
   253		/*
   254		 * Load the microcode before reaching the AP alive synchronization
   255		 * point below so it is not part of the full per CPU serialized
   256		 * bringup part when "parallel" bringup is enabled.
   257		 *
   258		 * That's even safe when hyperthreading is enabled in the CPU as
   259		 * the core code starts the primary threads first and leaves the
   260		 * secondary threads waiting for SIPI. Loading microcode on
   261		 * physical cores concurrently is a safe operation.
   262		 *
   263		 * This covers both the Intel specific issue that concurrent
   264		 * microcode loading on SMT siblings must be prohibited and the
   265		 * vendor independent issue`that microcode loading which changes
   266		 * CPUID, MSRs etc. must be strictly serialized to maintain
   267		 * software state correctness.
   268		 */
   269		load_ucode_ap();
   270	
   271		/*
   272		 * Synchronization point with the hotplug core. Sets this CPUs
   273		 * synchronization state to ALIVE and spin-waits for the control CPU to
   274		 * release this CPU for further bringup.
   275		 */
   276		cpuhp_ap_sync_alive();
   277	
   278		cpu_init();
   279		fpu__init_cpu();
   280		rcutree_report_cpu_starting(raw_smp_processor_id());
 > 281		paravirt_sched_clock_start_secondary();
   282	
   283		ap_starting();
   284	
   285		/* Check TSC synchronization with the control CPU. */
   286		check_tsc_sync_target();
   287	
   288		/*
   289		 * Calibrate the delay loop after the TSC synchronization check.
   290		 * This allows to skip the calibration when TSC is synchronized
   291		 * across sockets.
   292		 */
   293		ap_calibrate_delay();
   294	
   295		speculative_store_bypass_ht_init();
   296	
   297		/*
   298		 * Lock vector_lock, set CPU online and bring the vector
   299		 * allocator online. Online must be set with vector_lock held
   300		 * to prevent a concurrent irq setup/teardown from seeing a
   301		 * half valid vector space.
   302		 */
   303		lock_vector_lock();
   304		set_cpu_online(smp_processor_id(), true);
   305		lapic_online();
   306		unlock_vector_lock();
   307		x86_platform.nmi_init();
   308	
   309		/* enable local interrupts */
   310		local_irq_enable();
   311	
   312		x86_cpuinit.setup_percpu_clockev();
   313	
   314		wmb();
   315		cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
   316	}
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
