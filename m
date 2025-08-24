Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7818C31
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756002382; cv=none; b=sDDSRzwtsb5rdeApo1Xp9p31Yz+MA+Ua9V8SZNkgxd2QQMz/mNAejmWJL31pe/dIcCzU5HDe65lZFd0epaepqnZ6qtpJLBcrB31SF6+48pb8iaSJ1SprDiasZM+DQZHT/5kBH5D41m9ht16u00IziQsr8XP/+rmx9HOL9w2WUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756002382; c=relaxed/simple;
	bh=Y59umw0jnuFew1yiyMcUrj6IKSpUZRaXVGtCXRPDEOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KNhBqFMkhmAfQ32ghc3mIvg24J5Ec8vQGjCFyzZWE3a7BCwYY+WrFgcMoL3x5TmRQKblHusSo1W2cUPxry34P/joyR/QPmfrXaUoaAopwqnEtTc5RbNjCirU9aWD+xFudBZ1sK1fCtnqIOTFGYG5oJEnHJk9+Bputil/pbtv8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJpgJIYF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJpgJIYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756002380; x=1787538380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y59umw0jnuFew1yiyMcUrj6IKSpUZRaXVGtCXRPDEOE=;
  b=lJpgJIYFoePSSc3vZAEfQ+ozlH8pWfV0C0LOEHAqYQhePiQ2+YzOUQp9
   +KTUbtQDU2R7JC5tNted8FEP0jbeaHYXzXE7a0XYaoEzblHWZY81Lpp01
   67FYn3Nx47a8zoNrquOP47N+sC73MHrkv8RgUzGIzXUMo5ZWE6x1KHjGo
   6Pa7riype4WDs0yptNL+twy6+jGhkNPPBOgKaGtHcyczTwrXbigGrov9z
   3DDYyjxzSgq9fyaBIS9J19bot2SHtqaHER9w2ck+7rbWAGmd2mXrw7Epj
   iqbg4o/Mne6ZmgezqOY84SfM1hULNRybUg2bPFB/eq/6uOoqU//1cfsWd
   Q==;
X-CSE-ConnectionGUID: Hi0vLRMcTbaCHR/O7VoB6A==
X-CSE-MsgGUID: i1Wd3SxVQ/GB6OIZWl0Qzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="75710362"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75710362"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 19:26:20 -0700
X-CSE-ConnectionGUID: OaUN9yK2TrS9fDwwSFSbIw==
X-CSE-MsgGUID: fiVx59PsQiawtBPocV7nyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199891866"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2025 19:26:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq0Qb-000Mhz-1J;
	Sun, 24 Aug 2025 02:26:01 +0000
Date: Sun, 24 Aug 2025 10:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 17/47] drivers/hv/mshv_root_main.c:588:2:
 error: call to undeclared function 'rseq_virt_userspace_exit'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202508241053.wbAfNuDn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   eb43860d07d75ca9e20e5716da7f8dddee478ed9
commit: 0de985a3d3f07cb83e1bb418183c75579c3fd912 [17/47] rseq, virt: Retrigger RSEQ after vcpu_run()
config: x86_64-randconfig-161-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241053.wbAfNuDn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241053.wbAfNuDn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241053.wbAfNuDn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hv/mshv_root_main.c:588:2: error: call to undeclared function 'rseq_virt_userspace_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     588 |         rseq_virt_userspace_exit();
         |         ^
   1 error generated.


vim +/rseq_virt_userspace_exit +588 drivers/hv/mshv_root_main.c

   511	
   512	/* Must be called with interrupts enabled */
   513	static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
   514	{
   515		long ret;
   516	
   517		if (vp->run.flags.root_sched_blocked) {
   518			/*
   519			 * Dispatch state of this VP is blocked. Need to wait
   520			 * for the hypervisor to clear the blocked state before
   521			 * dispatching it.
   522			 */
   523			ret = mshv_vp_wait_for_hv_kick(vp);
   524			if (ret)
   525				return ret;
   526		}
   527	
   528		do {
   529			u32 flags = 0;
   530			struct hv_output_dispatch_vp output;
   531	
   532			ret = mshv_pre_guest_mode_work(vp);
   533			if (ret)
   534				break;
   535	
   536			if (vp->run.flags.intercept_suspend)
   537				flags |= HV_DISPATCH_VP_FLAG_CLEAR_INTERCEPT_SUSPEND;
   538	
   539			if (mshv_vp_interrupt_pending(vp))
   540				flags |= HV_DISPATCH_VP_FLAG_SCAN_INTERRUPT_INJECTION;
   541	
   542			ret = mshv_vp_dispatch(vp, flags, &output);
   543			if (ret)
   544				break;
   545	
   546			vp->run.flags.intercept_suspend = 0;
   547	
   548			if (output.dispatch_state == HV_VP_DISPATCH_STATE_BLOCKED) {
   549				if (output.dispatch_event ==
   550							HV_VP_DISPATCH_EVENT_SUSPEND) {
   551					/*
   552					 * TODO: remove the warning once VP canceling
   553					 *	 is supported
   554					 */
   555					WARN_ONCE(atomic64_read(&vp->run.vp_signaled_count),
   556						  "%s: vp#%d: unexpected explicit suspend\n",
   557						  __func__, vp->vp_index);
   558					/*
   559					 * Need to clear explicit suspend before
   560					 * dispatching.
   561					 * Explicit suspend is either:
   562					 * - set right after the first VP dispatch or
   563					 * - set explicitly via hypercall
   564					 * Since the latter case is not yet supported,
   565					 * simply clear it here.
   566					 */
   567					ret = mshv_vp_clear_explicit_suspend(vp);
   568					if (ret)
   569						break;
   570	
   571					ret = mshv_vp_wait_for_hv_kick(vp);
   572					if (ret)
   573						break;
   574				} else {
   575					vp->run.flags.root_sched_blocked = 1;
   576					ret = mshv_vp_wait_for_hv_kick(vp);
   577					if (ret)
   578						break;
   579				}
   580			} else {
   581				/* HV_VP_DISPATCH_STATE_READY */
   582				if (output.dispatch_event ==
   583							HV_VP_DISPATCH_EVENT_INTERCEPT)
   584					vp->run.flags.intercept_suspend = 1;
   585			}
   586		} while (!vp->run.flags.intercept_suspend);
   587	
 > 588		rseq_virt_userspace_exit();
   589	
   590		return ret;
   591	}
   592	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
