Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578BB1482EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716467946; cv=none; b=h7PKjXA6elZopTPf/gCwIZx57NZInB5GxW7ZRG9mO69RTr1Ybpg7DBwk5cET1XbUNs+mMiRO9q2oGrfdvbexGl35ACD1h8RA9eNWSgOunnYVZ9JpJ8IxdqeHwMIJkRaqxKtuctLz1KQJ0I1hUJQNIQFRwSoctXlNMUXZX3GCu+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716467946; c=relaxed/simple;
	bh=NxNHmDTyf45u7ZHwoFE+CVEyUDmnNLkRf5O6kktNz0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ephNYJeP6CrDerD9ROC2D2TXYUSA2yFxVF/eQuixg2Evoa5O3jlpPojrtI7fx0X7TEv6znYO3yxXIN3bWoH4TJH1NZpy/YXvebSb4VAXwsgv05xtvMDnwR894b1EJW0sxxXoLc3B/EECgshQk5VLht+UpLZS5KcnvORHfraJlBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nv1WFLuZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nv1WFLuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716467945; x=1748003945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NxNHmDTyf45u7ZHwoFE+CVEyUDmnNLkRf5O6kktNz0o=;
  b=nv1WFLuZerMF3kEtoXGyr/jKcLWtk/aU+JNhrt+yKnVNAGKAk0ZMmO63
   dic3eSgR3S6Tdq3INQgp29iBkDLebyT9tLsxwuh8kue9FwdB8qDfTC4bT
   7wyjckxn/fiBdEzQ+pFCZN9vt3JPqDfH0Dxb8e1ft5wcU5fglYVCXNnBo
   5usq4f7neFyM5LakA/rQSblVmiHxqU0R7twRS71vfwoIMsDCgpwjaemjl
   WX7Eq+glORHghHZ8fMIbpeuypD1cPw2b/b/vcVNNNsUnspz0BkO+Jciui
   cUJfEAvVJ4eTWYCbOjDMV9FFs/RloOjpabzVZtR5MICtNj4FhATcaRSol
   Q==;
X-CSE-ConnectionGUID: atwfSACnRCePYbJ7alXgmw==
X-CSE-MsgGUID: 9rNb8z6ySZ+h3XshNIIDAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16608178"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="16608178"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 05:39:03 -0700
X-CSE-ConnectionGUID: N0+VvKRtTvKSyJ7zisdmkw==
X-CSE-MsgGUID: yNXd5J9JSsKM+zgpr7BRxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="33666838"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2024 05:39:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA7il-0002q4-1Y;
	Thu, 23 May 2024 12:38:59 +0000
Date: Thu, 23 May 2024 20:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Shahab Vahedi <shahab@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/arc/net/bpf_jit_core.c:170:47-52: WARNING: conversion to bool
 not needed here
Message-ID: <202405232036.Xqoc3b0J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c760b3725e52403dc1b28644fb09c47a83cacea6
commit: f122668ddcce450c2585f0be4bf4478d6fd6176b ARC: Add eBPF JIT support
date:   11 days ago
config: arc-randconfig-r062-20240523 (https://download.01.org/0day-ci/archive/20240523/202405232036.Xqoc3b0J-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405232036.Xqoc3b0J-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arc/net/bpf_jit_core.c:170:47-52: WARNING: conversion to bool not needed here
--
>> arch/arc/net/bpf_jit_core.c:162:16-22: ERROR: application of sizeof to pointer
--
>> arch/arc/net/bpf_jit_core.c:586:5-8: Unneeded variable: "ret". Return "0" on line 638

vim +170 arch/arc/net/bpf_jit_core.c

   158	
   159	/* Initialise the context so there's no garbage. */
   160	static int jit_ctx_init(struct jit_context *ctx, struct bpf_prog *prog)
   161	{
 > 162		memset(ctx, 0, sizeof(ctx));
   163	
   164		ctx->orig_prog = prog;
   165	
   166		/* If constant blinding was requested but failed, scram. */
   167		ctx->prog = bpf_jit_blind_constants(prog);
   168		if (IS_ERR(ctx->prog))
   169			return PTR_ERR(ctx->prog);
 > 170		ctx->blinded = (ctx->prog == ctx->orig_prog ? false : true);
   171	
   172		/* If the verifier doesn't zero-extend, then we have to do it. */
   173		ctx->do_zext = !ctx->prog->aux->verifier_zext;
   174	
   175		ctx->is_extra_pass = ctx->prog->jited;
   176		ctx->user_bpf_prog = ctx->prog->is_func;
   177	
   178		return 0;
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
