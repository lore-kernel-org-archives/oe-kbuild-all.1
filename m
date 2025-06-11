Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9925C834
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633748; cv=none; b=aXWZ5Ymi/KbOjwogSgiwXUFiDG+OYjn1xuEikn7dcwDKYv75cR516QVoJEGmn3vgPP74my/wDFEbgeAhFuUumBDvzvBlY/DTo0ijuhrMiJZLt9baKGI5zCFbBlTeo/T5uI5pQ0bOooOeR9M2tsYTa39i0KSol+y+/i10Vk/c32k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633748; c=relaxed/simple;
	bh=5MsDCiP/U1zJS5EaBHsMv10aY74N3gorG7SYEbs8wX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s1w7B5sS+IT0WoS3MyUKtT3lQGaTdx78w0DvbjjQwI9ccR5W3mCCP0nQ9SDwgVBP3Dk5hcQjJ/XMrcc3Fue4+S6GuzFfxlYYeMB3imt+UIv60WtW2rkTe1JN0aIgbDhzDCts/GyZX8S4Yl0wB2OOUqDuGwXqAhNC1s82YJY15Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfjEgdE9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfjEgdE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749633747; x=1781169747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5MsDCiP/U1zJS5EaBHsMv10aY74N3gorG7SYEbs8wX0=;
  b=FfjEgdE9c7mwxCBjXVgKfc4D0eTY1u/PNiSHxNIH2HOjLXEAdH+P0MDT
   fnDrt2H7nSoVtEuCkcHfx2S4DcALKOqgL8Tl5AsjadJ8HucgaD1ATe/qk
   96O2cOuUY9eq9i9ALuDH54gf0a3s8CxuK4xmKnPFWR18qRU8ygfzXpK7b
   x/4MsC9UBVDNR1b7s6VNk63PWq/ZHezeOZqqog+OTtvkTEEIAfg9kZ6e6
   7C1ufZep0bI8pLoQSJy00XWPjvVkB8o3cKajYudYs7A4xKgzR6iu/B43Z
   YFuIxXB9VidZK9NszhmCW2wCxFd6qqqwpg65TafQfmk+Vh6Rg6TZwX/K2
   w==;
X-CSE-ConnectionGUID: OcPz19FORaqZzyfwGgCWzQ==
X-CSE-MsgGUID: pYwXdeboQuG/9WNolWK5Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51906990"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51906990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 02:22:24 -0700
X-CSE-ConnectionGUID: 6KELI+FqRJqdwqqPo1QYgg==
X-CSE-MsgGUID: GLzjtzYPQ6iFSXmkaoSiqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="178050959"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jun 2025 02:22:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPHf2-000ADa-1U;
	Wed, 11 Jun 2025 09:22:20 +0000
Date: Wed, 11 Jun 2025 17:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:log_dr6_changes 2/2]
 arch/x86/kernel/smpboot.c:236:9: error: implicit declaration of function
 'get_debugreg'
Message-ID: <202506111700.jTve5D8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git log_dr6_changes
head:   fa4845cf524d2905493e299e4650dc943be4dfe4
commit: fa4845cf524d2905493e299e4650dc943be4dfe4 [2/2] x86/traps: Log DR6 changes
config: x86_64-buildonly-randconfig-004-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111700.jTve5D8X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111700.jTve5D8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111700.jTve5D8X-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kernel/smpboot.c: In function 'start_secondary':
>> arch/x86/kernel/smpboot.c:236:9: error: implicit declaration of function 'get_debugreg' [-Werror=implicit-function-declaration]
     236 |         get_debugreg(dr6, 6);
         |         ^~~~~~~~~~~~
>> arch/x86/kernel/smpboot.c:236:9: warning: 'dr6' is used uninitialized [-Wuninitialized]
     236 |         get_debugreg(dr6, 6);
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/smpboot.c:234:23: note: 'dr6' was declared here
     234 |         unsigned long dr6;
         |                       ^~~
   cc1: some warnings being treated as errors


vim +/get_debugreg +236 arch/x86/kernel/smpboot.c

   228	
   229	/*
   230	 * Activate a secondary processor.
   231	 */
   232	static void notrace __noendbr start_secondary(void *unused)
   233	{
   234		unsigned long dr6;
   235	
 > 236		get_debugreg(dr6, 6);
   237		printk("CPU%d: Initial DR6: %016lx\n", smp_processor_id(), dr6);
   238	
   239		/*
   240		 * Don't put *anything* except direct CPU state initialization
   241		 * before cpu_init(), SMP booting is too fragile that we want to
   242		 * limit the things done here to the most necessary things.
   243		 */
   244		cr4_init();
   245	
   246		/*
   247		 * 32-bit specific. 64-bit reaches this code with the correct page
   248		 * table established. Yet another historical divergence.
   249		 */
   250		if (IS_ENABLED(CONFIG_X86_32)) {
   251			/* switch away from the initial page table */
   252			load_cr3(swapper_pg_dir);
   253			__flush_tlb_all();
   254		}
   255	
   256		cpu_init_exception_handling(false);
   257	
   258		/*
   259		 * Load the microcode before reaching the AP alive synchronization
   260		 * point below so it is not part of the full per CPU serialized
   261		 * bringup part when "parallel" bringup is enabled.
   262		 *
   263		 * That's even safe when hyperthreading is enabled in the CPU as
   264		 * the core code starts the primary threads first and leaves the
   265		 * secondary threads waiting for SIPI. Loading microcode on
   266		 * physical cores concurrently is a safe operation.
   267		 *
   268		 * This covers both the Intel specific issue that concurrent
   269		 * microcode loading on SMT siblings must be prohibited and the
   270		 * vendor independent issue`that microcode loading which changes
   271		 * CPUID, MSRs etc. must be strictly serialized to maintain
   272		 * software state correctness.
   273		 */
   274		load_ucode_ap();
   275	
   276		/*
   277		 * Synchronization point with the hotplug core. Sets this CPUs
   278		 * synchronization state to ALIVE and spin-waits for the control CPU to
   279		 * release this CPU for further bringup.
   280		 */
   281		cpuhp_ap_sync_alive();
   282	
   283		cpu_init();
   284		fpu__init_cpu();
   285		rcutree_report_cpu_starting(raw_smp_processor_id());
   286		x86_cpuinit.early_percpu_clock_init();
   287	
   288		ap_starting();
   289	
   290		/* Check TSC synchronization with the control CPU. */
   291		check_tsc_sync_target();
   292	
   293		/*
   294		 * Calibrate the delay loop after the TSC synchronization check.
   295		 * This allows to skip the calibration when TSC is synchronized
   296		 * across sockets.
   297		 */
   298		ap_calibrate_delay();
   299	
   300		speculative_store_bypass_ht_init();
   301	
   302		/*
   303		 * Lock vector_lock, set CPU online and bring the vector
   304		 * allocator online. Online must be set with vector_lock held
   305		 * to prevent a concurrent irq setup/teardown from seeing a
   306		 * half valid vector space.
   307		 */
   308		lock_vector_lock();
   309		set_cpu_online(smp_processor_id(), true);
   310		lapic_online();
   311		unlock_vector_lock();
   312		x86_platform.nmi_init();
   313	
   314		/* enable local interrupts */
   315		local_irq_enable();
   316	
   317		x86_cpuinit.setup_percpu_clockev();
   318	
   319		wmb();
   320		cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
   321	}
   322	ANNOTATE_NOENDBR_SYM(start_secondary);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
