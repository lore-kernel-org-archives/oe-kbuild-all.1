Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0A1854
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689421441; x=1720957441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wp4MInpIvlPlFKznZGACXG48RKrl7Bb4vEodr8OqV1o=;
  b=XEXb2PoOZgO1UzYfFbCE9GOwAF56ZpIyuaINfoQoDzsO4cLB5yxzuBVQ
   scyGKXtyanFCgkpDyQ2MS/VEp/K/Ekw8vMv3KeE081WSq8/HfpyDQR4b1
   MnukKJzDNABwdtGpATrq7E3KnBq/FCara3FZB44Gcaq/QNdvnJzU1goRE
   nub6FyEgjS6syin6O03c9B94D6D6h3d/AbdAwU/6TFPziGyKHJ7bpghzE
   VC3DM0T5TTcLGng9/gjTz+8Ni5Nu8PUQXHF4RUaMhkK1Wr9WEkr/lDzcg
   asWTSWvG1WJXcnOvJrhRx80AKd/urAEy507ux6Vh5DxkQsuviXrHgguz0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="396468084"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="396468084"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 04:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="757858876"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="757858876"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jul 2023 04:43:58 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKdgr-000897-2M;
	Sat, 15 Jul 2023 11:43:57 +0000
Date: Sat, 15 Jul 2023 19:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 34/48] arch/arm64/kernel/signal.c:1263:33:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202307151951.ahWWbHb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   e90b1663883e49f3f5aef612fde57503c21ad1ad
commit: a5fb94bf076e04cffb117fdaf0c7969858714867 [34/48] arm64/signal: Set up and restore the GCS context for signal handlers
config: arm64-randconfig-r073-20230713 (https://download.01.org/0day-ci/archive/20230715/202307151951.ahWWbHb4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151951.ahWWbHb4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307151951.ahWWbHb4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/signal.c:889:5: sparse: sparse: symbol 'gcs_restore_signal' was not declared. Should it be static?
   arch/arm64/kernel/signal.c:1259:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... ) @@     got void * @@
   arch/arm64/kernel/signal.c:1259:26: sparse:     expected void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... )
   arch/arm64/kernel/signal.c:1259:26: sparse:     got void *
>> arch/arm64/kernel/signal.c:1263:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *sigtramp @@     got void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... ) @@
   arch/arm64/kernel/signal.c:1263:33: sparse:     expected void *sigtramp
   arch/arm64/kernel/signal.c:1263:33: sparse:     got void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... )

vim +1263 arch/arm64/kernel/signal.c

  1207	
  1208	static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
  1209				 struct rt_sigframe_user_layout *user, int usig)
  1210	{
  1211		__sigrestore_t sigtramp;
  1212	
  1213		regs->regs[0] = usig;
  1214		regs->sp = (unsigned long)user->sigframe;
  1215		regs->regs[29] = (unsigned long)&user->next_frame->fp;
  1216		regs->pc = (unsigned long)ksig->ka.sa.sa_handler;
  1217	
  1218		/*
  1219		 * Signal delivery is a (wacky) indirect function call in
  1220		 * userspace, so simulate the same setting of BTYPE as a BLR
  1221		 * <register containing the signal handler entry point>.
  1222		 * Signal delivery to a location in a PROT_BTI guarded page
  1223		 * that is not a function entry point will now trigger a
  1224		 * SIGILL in userspace.
  1225		 *
  1226		 * If the signal handler entry point is not in a PROT_BTI
  1227		 * guarded page, this is harmless.
  1228		 */
  1229		if (system_supports_bti()) {
  1230			regs->pstate &= ~PSR_BTYPE_MASK;
  1231			regs->pstate |= PSR_BTYPE_C;
  1232		}
  1233	
  1234		/* TCO (Tag Check Override) always cleared for signal handlers */
  1235		regs->pstate &= ~PSR_TCO_BIT;
  1236	
  1237		/* Signal handlers are invoked with ZA and streaming mode disabled */
  1238		if (system_supports_sme()) {
  1239			/*
  1240			 * If we were in streaming mode the saved register
  1241			 * state was SVE but we will exit SM and use the
  1242			 * FPSIMD register state - flush the saved FPSIMD
  1243			 * register state in case it gets loaded.
  1244			 */
  1245			if (current->thread.svcr & SVCR_SM_MASK) {
  1246				memset(&current->thread.uw.fpsimd_state, 0,
  1247				       sizeof(current->thread.uw.fpsimd_state));
  1248				current->thread.fp_type = FP_STATE_FPSIMD;
  1249			}
  1250	
  1251			current->thread.svcr &= ~(SVCR_ZA_MASK |
  1252						  SVCR_SM_MASK);
  1253			sme_smstop();
  1254		}
  1255	
  1256		if (ksig->ka.sa.sa_flags & SA_RESTORER)
  1257			sigtramp = ksig->ka.sa.sa_restorer;
  1258		else
  1259			sigtramp = VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
  1260	
  1261		regs->regs[30] = (unsigned long)sigtramp;
  1262	
> 1263		return gcs_signal_entry(sigtramp, ksig);
  1264	}
  1265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
