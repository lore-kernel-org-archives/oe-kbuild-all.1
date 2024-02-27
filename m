Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540307BAE7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709026782; cv=none; b=evD92+zSYERbz2+Vm3Otk8TL7ucOAEqBZIm5QL2c0MWxRReaF98eRxnwTaff7l5WMGP+uBo+ytdCainm1/pIktmvH1/U7R6CoMNROeuksWWHo+kPXWQaSYU1CJ0r6H+ibXnUJXl6GdN1qFdU1hFtSI4zhPRGRMoh/NA0n+0Z+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709026782; c=relaxed/simple;
	bh=m1pfuA4ktj/QpUmaMibq5IuPwZQY5Q3jnNV8KiqmwxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiT0hA5OHx7fSj4qpAQCcI+KLJml0v83jYw6oSjqpkLrDO2T4jUoEyfKRJdmYQXts47eEOQ9JkfSE0P1RT7mo4bpkRpJfGFoSFWER1iheXPbxGhFm8d2/QI84T9GK3KiXhw6gcMWG9x68xuXBHR3XXzRQ75oDEHr2BQFckl9bGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFtHsKr6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFtHsKr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709026779; x=1740562779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1pfuA4ktj/QpUmaMibq5IuPwZQY5Q3jnNV8KiqmwxU=;
  b=gFtHsKr66WEZl2VVnC9P8vRHDDqbOtfZ3yUAatzlWbzCtsrMGF7LEJfm
   r0nI8jOg1G/yyIF9tqbDzKj5PD8HR+xbvjuyu1DW4uft0m+zh1SIm6Oq1
   jeh0D+dGv9UFQyyFF1pmt5PF9+Pu+QXWZqIIzwVDScM5uVo+8y3AIa7cX
   l/z4E16YnnvQwwP5Cmt5ysraXoC68X1VXtbeFiL3Sdb2ZJe8TagnxaafF
   XlrDxD25xtf5OCqm3gjfb4FiaMA1NBDWaTtd9uFnuZ9IX+ztHIdgGGSjr
   lQ3hqUm9j3/BeoceYievfbZtFl9Vpr7AP+c4BHLHA2BF/8HMD6xmzfMH8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3911585"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3911585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 01:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11652496"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Feb 2024 01:39:37 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1retve-000B6V-2l;
	Tue, 27 Feb 2024 09:39:28 +0000
Date: Tue, 27 Feb 2024 17:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-sve-save-support-check 2/2]
 arch/arm64/kernel/fpsimd.c:454:13: error: implicit declaration of function
 'system_support_sve'; did you mean 'system_supports_sve'?
Message-ID: <202402271740.gafPG9Ym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-sve-save-support-check
head:   fff29a9e88fc03d6dd50a8a4b99780d3646a46fa
commit: fff29a9e88fc03d6dd50a8a4b99780d3646a46fa [2/2] arm64/fp: Only check if we need to save SVE registers on systems with SVE
config: arm64-randconfig-002-20240227 (https://download.01.org/0day-ci/archive/20240227/202402271740.gafPG9Ym-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271740.gafPG9Ym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271740.gafPG9Ym-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/fpsimd.c: In function 'fpsimd_save_user_state':
>> arch/arm64/kernel/fpsimd.c:454:13: error: implicit declaration of function 'system_support_sve'; did you mean 'system_supports_sve'? [-Werror=implicit-function-declaration]
     454 |         if (system_support_sve() &&
         |             ^~~~~~~~~~~~~~~~~~
         |             system_supports_sve
   cc1: some warnings being treated as errors


vim +454 arch/arm64/kernel/fpsimd.c

   423	
   424	/*
   425	 * Ensure FPSIMD/SVE storage in memory for the loaded context is up to
   426	 * date with respect to the CPU registers. Note carefully that the
   427	 * current context is the context last bound to the CPU stored in
   428	 * last, if KVM is involved this may be the guest VM context rather
   429	 * than the host thread for the VM pointed to by current. This means
   430	 * that we must always reference the state storage via last rather
   431	 * than via current, if we are saving KVM state then it will have
   432	 * ensured that the type of registers to save is set in last->to_save.
   433	 */
   434	static void fpsimd_save_user_state(void)
   435	{
   436		struct cpu_fp_state const *last =
   437			this_cpu_ptr(&fpsimd_last_state);
   438		/* set by fpsimd_bind_task_to_cpu() or fpsimd_bind_state_to_cpu() */
   439		bool save_sve_regs = false;
   440		bool save_ffr;
   441		unsigned int vl;
   442	
   443		WARN_ON(!system_supports_fpsimd());
   444		WARN_ON(preemptible());
   445	
   446		if (test_thread_flag(TIF_FOREIGN_FPSTATE))
   447			return;
   448	
   449		/*
   450		 * If a task is in a syscall the ABI allows us to only
   451		 * preserve the state shared with FPSIMD so don't bother
   452		 * saving the full SVE state in that case.
   453		 */
 > 454		if (system_support_sve() &&
   455		    ((last->to_save == FP_STATE_CURRENT && test_thread_flag(TIF_SVE) &&
   456		      !in_syscall(current_pt_regs())) ||
   457		     last->to_save == FP_STATE_SVE)) {
   458			save_sve_regs = true;
   459			save_ffr = true;
   460			vl = last->sve_vl;
   461		}
   462	
   463		if (system_supports_sme()) {
   464			u64 *svcr = last->svcr;
   465	
   466			*svcr = read_sysreg_s(SYS_SVCR);
   467	
   468			if (*svcr & SVCR_ZA_MASK)
   469				sme_save_state(last->sme_state,
   470					       system_supports_sme2());
   471	
   472			/* If we are in streaming mode override regular SVE. */
   473			if (*svcr & SVCR_SM_MASK) {
   474				save_sve_regs = true;
   475				save_ffr = system_supports_fa64();
   476				vl = last->sme_vl;
   477			}
   478		}
   479	
   480		if (IS_ENABLED(CONFIG_ARM64_SVE) && save_sve_regs) {
   481			/* Get the configured VL from RDVL, will account for SM */
   482			if (WARN_ON(sve_get_vl() != vl)) {
   483				/*
   484				 * Can't save the user regs, so current would
   485				 * re-enter user with corrupt state.
   486				 * There's no way to recover, so kill it:
   487				 */
   488				force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
   489				return;
   490			}
   491	
   492			sve_save_state((char *)last->sve_state +
   493						sve_ffr_offset(vl),
   494				       &last->st->fpsr, save_ffr);
   495			*last->fp_type = FP_STATE_SVE;
   496		} else {
   497			fpsimd_save_state(last->st);
   498			*last->fp_type = FP_STATE_FPSIMD;
   499		}
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
