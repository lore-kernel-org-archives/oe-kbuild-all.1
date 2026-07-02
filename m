Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DCA30C17E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 02:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782959605; cv=none; b=X3mvV7pIV6XgKNe9Y8dhWzmL9/wG1aB8Ru0/1fHkLgIVCIY0aaYw4e5hLgp9UEnT6S1yQVCOUocCeLHIeNuw8SF+0dZIeQt2GjuuKPiZ36T/t4wDc3RtfCIcPbdsll0fDPF3xZ2dKRqeMKDHr3G7PWMbIeGR6sg5aYZzG9h+6Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782959605; c=relaxed/simple;
	bh=7Fofm483Wk4jOqsyrzt6e+xNhp9G5rAcfloj4vTvZ9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lP0JVSrLqnVYHS6vx4qkC1NAEWPtv0JVaZpo4NagRRD+NksxomQZTKN4injczQHiyDQTi5hv+d72d3z9YkB4wZnS2bO2GoogqIt9RpNuWPKiACo3TvLU5ajQsf7qVsIf+sWO9Wn/EH3hc6nx2twR6oiFR+jo4TzGau/J8jaVk44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khKWMR0Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khKWMR0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782959604; x=1814495604;
  h=date:from:to:cc:subject:message-id;
  bh=7Fofm483Wk4jOqsyrzt6e+xNhp9G5rAcfloj4vTvZ9g=;
  b=khKWMR0Qfj3r4U46hdbbgJoi6DBtXHsXMKlxWMXBw30gnR/qyQdPsOCW
   8FBCI2Bystk0SFcwv+ILdbwKctF3W0xeghn29x1IhjAMhWLXCJVpw4RF5
   X4fyfRgYBq2csKpjg/iHbnOb8JFqhEIxCai+YUsy5hIdm2LQws8+cbQcx
   0Lj17ggkniWh57FRX2F4rXeyjbUcM4xfShOAIU10bBcBt52nOBkQ0YsO9
   K3eUtEqTCsaJbnhjl6FBRqJn5iyuYGZCfO/IhjvKhDzY46JTWyo4D+kuA
   akK3Vsy1K8kJqcvaLVsFkUtTDoGPhrXaXbGgT3QbJzqbVYjqdmX3KWBTD
   w==;
X-CSE-ConnectionGUID: urt/ZQ2MRoKljCEtNmOx0A==
X-CSE-MsgGUID: lQSTRhVnSiyRnpaB5MZl6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83570913"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83570913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 19:33:21 -0700
X-CSE-ConnectionGUID: ExYXFBfgTTCBhARLDZ7e5A==
X-CSE-MsgGUID: PCb9tI9JRqytKAq31ZIsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="275936141"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 19:33:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf7Er-000000009sP-1ehs;
	Thu, 02 Jul 2026 02:33:17 +0000
Date: Thu, 02 Jul 2026 10:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-sve-trap-mitigation 3/3]
 arch/arm64/kernel/entry-common.c:258:30: warning: unused variable
 'sve_vq_minus_one'
Message-ID: <202607021058.32muzb7w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-sve-trap-mitigation
head:   00a72da058c10512a992dd75733d08daed8437fc
commit: 00a72da058c10512a992dd75733d08daed8437fc [3/3] arm64/sve: Disable TIF_SVE on syscall once per second
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260702/202607021058.32muzb7w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021058.32muzb7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021058.32muzb7w-lkp@intel.com/

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
