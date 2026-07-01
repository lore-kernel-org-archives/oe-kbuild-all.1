Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E46A431E64
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 22:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782945984; cv=none; b=ijkxMzMlTyI2Wz6GJMCa68pLb3j6yoiLPr7KDU8T7s7wE+UOB3Jzi1SgKUAUA74llYr3RPxVQKiFsn0vKO7GHm7kru57K2XqHMhJ5Mwz8XlJ890gKWLKcqi6xKt862G2Qhiz3qZmw4V/PhdN0BOVRwohYvE3DMn2vefG6qqTAzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782945984; c=relaxed/simple;
	bh=VJbhFQ7tWy6M+AUhrlYmf65K3OEWq0R7KOxBYSB73/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VduDJjxL0exUMpxeglCKJC4Xne2I2f6Eapd5W109BgOTh7L8T0aaeU0kUE5asJTiF95FouSeFm/ECkdhPZG4PrfDzVwjws1UtPn13+/LL4Ix32s9Rdoovs15vU99U3mYT7b+uJo8FSdwz74CiwFoC2YOouGGWFkuBLw3Tad/b8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvqhGyED; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvqhGyED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782945982; x=1814481982;
  h=date:from:to:cc:subject:message-id;
  bh=VJbhFQ7tWy6M+AUhrlYmf65K3OEWq0R7KOxBYSB73/M=;
  b=OvqhGyEDJP14ta1hbwdlGaaxR2rdvHekSeR7ph8RAkrOfr7NlAoUguT3
   s/RfzK2ZD9Arj6MCCKfmWIo3lKF8a2yum9k4BjERMz1W52TQRvWpdssJE
   hHVscwKuwMm9+ttaVD+t91v0tLz8L88eJ00Qn833E1nfbShirNXzrjKyH
   ALEj6WvRnjMCCLhDxnb4dTnjEbL51clDaqpO8FgyxBTg40ITi3j5X11xo
   EUCaa8bayvitPmiQhNs8/IjvoT7sWHyXtnzhBWxnQTzCTNAy99iEbJGL7
   WVat8DRDQ06hSMcDu0j8HGWBl1divtBbO/untzAarlF1yV/U1NZajzQvp
   Q==;
X-CSE-ConnectionGUID: GfSqgqMASRSkr0zOlgHEJg==
X-CSE-MsgGUID: JnhPYvYvT0WOZbcgzMdKcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94047338"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94047338"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:46:22 -0700
X-CSE-ConnectionGUID: i52BgmgNQzif+Wmr1U1CgQ==
X-CSE-MsgGUID: 1wN64md/RcypJFhgxHClxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="250045150"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jul 2026 15:46:20 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf3hC-000000000uz-1FdC;
	Wed, 01 Jul 2026 22:46:18 +0000
Date: Thu, 02 Jul 2026 00:45:49 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-sve-trap-mitigation 3/3]
 arch/arm64/kernel/entry-common.c:258:30: warning: unused variable
 'sve_vq_minus_one'
Message-ID: <202607020044.UmATj7HQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-sve-trap-mitigation
head:   00a72da058c10512a992dd75733d08daed8437fc
commit: 00a72da058c10512a992dd75733d08daed8437fc [3/3] arm64/sve: Disable TIF_SVE on syscall once per second
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260702/202607020044.UmATj7HQ-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020044.UmATj7HQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020044.UmATj7HQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/entry-common.c: In function 'fpsimd_syscall_enter':
>> arch/arm64/kernel/entry-common.c:258:30: warning: unused variable 'sve_vq_minus_one' [-Wunused-variable]
     258 |                 unsigned int sve_vq_minus_one;
         |                              ^~~~~~~~~~~~~~~~


vim +/sve_vq_minus_one +258 arch/arm64/kernel/entry-common.c

   239	
   240	/*
   241	 * As per the ABI exit SME streaming mode and clear the SVE state not
   242	 * shared with FPSIMD on syscall entry.
   243	 */
   244	static inline void fpsimd_syscall_enter(void)
   245	{
   246		/* Ensure PSTATE.SM is clear, but leave PSTATE.ZA as-is. */
   247		if (system_supports_sme())
   248			sme_smstop_sm();
   249	
   250		/*
   251		 * The CPU is not in streaming mode. If non-streaming SVE is not
   252		 * supported, there is no SVE state that needs to be discarded.
   253		 */
   254		if (!system_supports_sve())
   255			return;
   256	
   257		if (test_thread_flag(TIF_SVE)) {
 > 258			unsigned int sve_vq_minus_one;
   259	
   260			/*
   261			 * Ensure that tasks that don't block in a syscall
   262			 * also get a chance to drop TIF_SVE.
   263			 */
   264			if (unlikely(time_after(jiffies,
   265						current->thread.sve_timeout))) {
   266				clear_thread_flag(TIF_SVE);
   267				sve_user_disable();
   268			} else {
   269				sve_flush_live();
   270			}
   271		}
   272	
   273		/*
   274		 * Any live non-FPSIMD SVE state has been zeroed. Allow
   275		 * fpsimd_save_user_state() to lazily discard SVE state until either
   276		 * the live state is unbound or fpsimd_syscall_exit() is called.
   277		 */
   278		__this_cpu_write(fpsimd_last_state.to_save, FP_STATE_FPSIMD);
   279	}
   280	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
