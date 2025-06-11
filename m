Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272E4221708
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633746; cv=none; b=hi9TKWnn03h0MWr+XAqQlUUxeYqArKT6+cOsa4BkJ2aNZjqL9TvQ50xvH24T1mB5DMO7DV72OfX/gYF4DVbWgb6/VAysp2Xa1UqQT2FF67oIqmUlVnf7vx3HRVZbl91lfeq5CM3akC4MdPQeu9+ykRZSlwrXIbJ8A5w2KFJ5hCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633746; c=relaxed/simple;
	bh=63ausTIawwj/GGNYovQJ3yRbCqMIhbnIpxl6JuKMg04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZgakZAlQ1ZQSurL5oNqb6P+wln1fvVxsGHgnre9chIZt1UIwOVIoe7v/VQVp2FoCRdtNKUamjTd9cbZyfDZpkDJdYNUWQuPDzXHFNT3DEa1CRaG5TrUtk2qQpb+BI4NTjOp04WYxjhf1Hj9DSjs1ffpTXiFE9897ls/3wVj4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+4ej0V0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+4ej0V0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749633744; x=1781169744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63ausTIawwj/GGNYovQJ3yRbCqMIhbnIpxl6JuKMg04=;
  b=d+4ej0V0FfojXE9chWZ4oew4sIk+y2SD6vfifxALN1OzTw8vHQURD0Nl
   lO60hisOde1oSgiWYxuGJ46sxppSyLDZ0/6NB5/AAjME04wq8ZZToobA1
   L749UoaEFuSny26YN2hupfIbbdU7k/KxbwVAieKRbr02bE7qRE6P2szpl
   9mhBbeO33R6sHxBOWJPWi5O2Yll2UgvUUB9moJc5X1HEoS+gRIsHCSX7d
   PgkUbbm60gt5yNOR8ZTppuR/v12CPIk8CR9rJ3JoxdriVhmdQVAxg7clB
   hj4fnE8tiUKXiLymEctsrUMAG3G/rKzz+hf9NvdPAu1jLX6PSlxzyFj1B
   A==;
X-CSE-ConnectionGUID: q+YBZ/o6TFOlu7cMK76F8g==
X-CSE-MsgGUID: /LV6QcxVT5uzmOanxU5cAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51906988"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51906988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 02:22:24 -0700
X-CSE-ConnectionGUID: S712/HdXQ5eX6KHrhoF0zA==
X-CSE-MsgGUID: H1Lp0XLHT2aOtkzU6Y/DEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="178050948"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jun 2025 02:22:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPHf2-000ADO-0x;
	Wed, 11 Jun 2025 09:22:20 +0000
Date: Wed, 11 Jun 2025 17:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2954/2954]
 arch/arm64/net/bpf_jit_comp.c:1514:29: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202506111719.ynqhjFZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   90ff3e07cc268a8e40bd578dcc4907a3db419c52
commit: 2a5ab77af7f94dc99ac894566927f4f934ed675b [2954/2954] bpf, arm64: Add bpf trampoline for arm64
config: arm64-randconfig-r133-20250610 (https://download.01.org/0day-ci/archive/20250611/202506111719.ynqhjFZY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250611/202506111719.ynqhjFZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111719.ynqhjFZY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/net/bpf_jit_comp.c:1514:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] * @@     got restricted __le32 [usertype] * @@
   arch/arm64/net/bpf_jit_comp.c:1514:29: sparse:     expected unsigned int [usertype] *
   arch/arm64/net/bpf_jit_comp.c:1514:29: sparse:     got restricted __le32 [usertype] *
   arch/arm64/net/bpf_jit_comp.c:1663:52: sparse: sparse: subtraction of different types can't work (different base types)

vim +1514 arch/arm64/net/bpf_jit_comp.c

  1495	
  1496	static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_progs *tp,
  1497				       int args_off, int retval_off, u32 **branches)
  1498	{
  1499		int i;
  1500	
  1501		/* The first fmod_ret program will receive a garbage return value.
  1502		 * Set this to 0 to avoid confusing the program.
  1503		 */
  1504		emit(A64_STR64I(A64_ZR, A64_SP, retval_off), ctx);
  1505		for (i = 0; i < tp->nr_progs; i++) {
  1506			invoke_bpf_prog(ctx, tp->progs[i], args_off, retval_off, true);
  1507			/* if (*(u64 *)(sp + retval_off) !=  0)
  1508			 *	goto do_fexit;
  1509			 */
  1510			emit(A64_LDR64I(A64_R(10), A64_SP, retval_off), ctx);
  1511			/* Save the location of branch, and generate a nop.
  1512			 * This nop will be replaced with a cbnz later.
  1513			 */
> 1514			branches[i] = ctx->image + ctx->idx;
  1515			emit(A64_NOP, ctx);
  1516		}
  1517	}
  1518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
