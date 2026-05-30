Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45D27467F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780174590; cv=none; b=HIjNfLa9/1xOHPUKQ3/XXpX20V4aWgAkxnxmb+DK5KEgpJCbzB5uChYzumvl0nWr4s7ojMmv/xs6wFLuW+Y+bWvKYrCfbzfVwtRBtRcFkrmwtcXTfrjRVQybJSGf/apIdR2PnW1k/phck7ZzT20PXAlAZHyA7bylW9BrTxpxsvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780174590; c=relaxed/simple;
	bh=N/NMY268M88NWmU47FvXF6yek2iX3FKdKiBBrhj2tws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TooccfmCdA9XBQxxtAGa0FkzPXNwaTxAM3f+1tBOQVE7D29vcA36/9jcQ6X14aAoTYGHKxHSVZG/ng30pNngcegCsEudOcGzYZAD82vRjM1oIRKBKFYU9BNXCSKoMmAfvF3lLEJuEA4+tPenJOLRpuk/Qz+xlva8oUMw3Msc+rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZbdTMS0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZbdTMS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780174589; x=1811710589;
  h=date:from:to:cc:subject:message-id;
  bh=N/NMY268M88NWmU47FvXF6yek2iX3FKdKiBBrhj2tws=;
  b=QZbdTMS0hUyzAhK0CsqyqK2sBU1q88o63hBrtE9i2iUC4XujWoL9CcIc
   lvTFBisGLNrHEnWulUGsdco9GH2VzBBMtewSKJAY3RkItIPkk7khx6KaA
   iAB3VTCc1nor+HUmHfj1hOenFuzkDvuiFMKc/T1yxiUkYip75xMkRQHhp
   NTw9+Zjg0ehxiZVkml1XAYQeUzVAFSsItMzFf3QFruatf22Eg0s4gA4ez
   W/UCG8o2/L6c24E1Mewv5hjfm2aj6HrAw9isZ6DNwgQaIgyZSD3XPmxVA
   UunGqHlr+i8pepaG1wa+upYSv3iwykVn6F3zX/FsNy6puw7SKEUq3mLFq
   A==;
X-CSE-ConnectionGUID: wYZotqbSTvu/dBZactkeBQ==
X-CSE-MsgGUID: uQUXxDs3S2eTZxUWCOSX8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="80716813"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="80716813"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 13:56:29 -0700
X-CSE-ConnectionGUID: mOsx7s5KT3OhojBDDsypQw==
X-CSE-MsgGUID: ZpfC8tsDTfGCn10BnDbZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="243028135"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2026 13:56:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTQjI-000000008tm-3XuG;
	Sat, 30 May 2026 20:56:24 +0000
Date: Sun, 31 May 2026 04:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7431/9870]
 kernel/sched/ext.c:7926:undefined reference to `bpf_prog_arena'
Message-ID: <202605310454.U9iByL2n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 0e2819cba977f910c7eeaf77c705e28787c3385d [7431/9870] sched_ext: Require an arena for cid-form schedulers
config: parisc-randconfig-r134-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310454.U9iByL2n-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310454.U9iByL2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605310454.U9iByL2n-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_scan_prog':
>> kernel/sched/ext.c:7926:(.text+0x4b44): undefined reference to `bpf_prog_arena'


vim +7926 kernel/sched/ext.c

  7917	
  7918	/*
  7919	 * The verifier enforces one arena per BPF program, so each struct_ops
  7920	 * member prog contributes at most one arena via bpf_prog_arena().
  7921	 * Require all non-NULL contributions to match.
  7922	 */
  7923	static int scx_arena_scan_prog(struct bpf_prog *prog, void *data)
  7924	{
  7925		struct scx_arena_scan *s = data;
> 7926		struct bpf_map *arena = bpf_prog_arena(prog);
  7927	
  7928		if (!arena)
  7929			return 0;
  7930		if (s->arena && s->arena != arena) {
  7931			s->err = -EINVAL;
  7932			return 1;
  7933		}
  7934		s->arena = arena;
  7935		return 0;
  7936	}
  7937	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
