Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39372205E25
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753648646; cv=none; b=EZM8yjhkDwYBlX5kIYZAHgwFMKiS/XsaJmvdfF1/uxBPetz596P0kn52qLLRs0tS1AIoUldsZIASbGLIwdZlmSz1aP+BT5i1ih2UL4sxEeaJYDmzP2OL2xPckfiPhFeyPhCowVtxrAwFEqOFp4EvVDLX5/ficuFSmZwui2RtXIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753648646; c=relaxed/simple;
	bh=hACBl/PivNlMiRzizaEYjbtTUn3ZfvpUeEpLEhM+pqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUCfGLxFKdzjcOFcZ3C2eqY8JeuJ3BaAcAin2AKqSuxvEX+5IhEAgI4YzMII/FycmPTPIjvcFd17TJW8Zn8cnOhH01R9658EF/fpSOCN7vxFX/gHALd0c7+DDy0iSB+UXK1gF5xVLcaao6/hEsxOgCgvpv8W6sRmpUzAk3LxJX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqJ6PM7y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqJ6PM7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753648645; x=1785184645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hACBl/PivNlMiRzizaEYjbtTUn3ZfvpUeEpLEhM+pqs=;
  b=ZqJ6PM7yT4SZJnJrrKJmDUMwPcAYjPWcKzfspF7Y/8GqIMz67qlQBRAR
   s7Rb8PDvzBnKMc/OOX0yC1hqKMIYLk8B1/DcpC+/9JbxSXi3raqfOwgGO
   oiwnsAa173fzpOW1EwPUNGIvdNm1bqBW+dx10q+PsfdV8So7wdmDaBlay
   xmY6aXE9CNypBepYnHi1eCNAfj7UIjSwWlGWr1bRk6NJvS8svC6rSuk48
   9+niPXQqP8QvvfwELhajY4AapJdgJvDg+t341PVbZinVDK/bgUrVp1ivu
   IMvtabdDI+cc9FsxqBPKGyqUecKiu5UCjyGmBx+gn/OhZcgolHN/K9t/7
   w==;
X-CSE-ConnectionGUID: WWKNB4+3TPGpbGkqHIW5cQ==
X-CSE-MsgGUID: hqgy+Xb+T0Oo15x3Etw9aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="81346320"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="81346320"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 13:37:24 -0700
X-CSE-ConnectionGUID: 26gpmQOaQoSF9TQOCu/GJA==
X-CSE-MsgGUID: tzA3hCjOTEqIvpWr+fe8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="199377858"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 27 Jul 2025 13:37:23 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug87V-0000Rz-13;
	Sun, 27 Jul 2025 20:37:21 +0000
Date: Sun, 27 Jul 2025 22:36:47 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92]
 arch/arm64/kernel/stacktrace.c:161:13: warning: no previous prototype for
 'walk_stackframe_reliable'
Message-ID: <202507272231.H7Hl2f1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: f6c94c34964ebf155b3188788a086805d33bcbf3 [92/92] bytedance: arm64: introduce reliable stacktraces
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250727/202507272231.H7Hl2f1Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507272231.H7Hl2f1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507272231.H7Hl2f1Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/stacktrace.c:161:13: warning: no previous prototype for 'walk_stackframe_reliable' [-Wmissing-prototypes]
     161 | int notrace walk_stackframe_reliable(struct task_struct *tsk, struct stackframe *frame,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/walk_stackframe_reliable +161 arch/arm64/kernel/stacktrace.c

   160	
 > 161	int notrace walk_stackframe_reliable(struct task_struct *tsk, struct stackframe *frame,
   162				bool (*fn)(void *, unsigned long), void *data)
   163	{
   164		int ret = 0;
   165	
   166		if (!tsk)
   167			tsk = current;
   168	
   169		do {
   170			/* Final frame for kthread; nothing to unwind */
   171			if ((frame->fp == (unsigned long)task_pt_regs(tsk)->stackframe)
   172				&& ptrauth_strip_insn_pac(frame->pc) == (unsigned long)&kthread_return_to_user)
   173				return 0;
   174	
   175			if (!unwind_state_is_reliable(frame))
   176				return -EINVAL;
   177	
   178			ret = fn(data, ptrauth_strip_insn_pac(frame->pc));
   179			if (!ret)
   180				return ret;
   181	
   182			ret = unwind_frame(tsk, frame);
   183			if (ret < 0)
   184				break;
   185		} while (1);
   186	
   187		if (ret == -ENOENT)
   188			ret = 0;
   189	
   190		return ret;
   191	}
   192	NOKPROBE_SYMBOL(walk_stackframe_reliable);
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
