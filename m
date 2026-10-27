Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070914;
	b=x367RNiMqQDjZ871I0BvmaK3yQ+1EuDflKCw9xoH3thcVdY/gQVWcc49c6R3VdzYgExz
	 hJUnyGxsOMWDO/M2IPFVMt1lSbGxNlwbGuy7YiTtNRSh5w5LCZERmBIUzWAKkRdlw+b/r
	 fkaDI6Wrhv7oCoARt3+5HU9IGcmXeXtWeMGOPUIuoUZBisyBlleedYE4KGSUf9TWc9VjM
	 hujt1+vtX4NX35J22B0mCBGA7DGUryGjUwSWQZohpiYLohQE0l4ir0WhWRTEREzyEQAJ3
	 vNDSOWXYf2chdLK4FhHDTU5gSm2tKf2yiLOU2Lda0WLiSkqdnm0LXgObpd4E9bUcCyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070914;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ii6vBJIYZeyibefYqp7Vp7AU3CfMuoTrE7c7tR5MojU=;
	b=S7Je/Tusq6F3tHw+Uc4240z4gsddZK5RF2bYkVQgiYDIAINvBHEFlffNPG3foBNaxuTO
	 VB/M13Mj7doNe10sZkVIWgR2LG074NQI+Yt3i7D/+j8qxcOrpbBO4rDrLpIXc/uIRSG6i
	 MiYh7FPl8EVPMZV4CiS34WShuQJUyBkoSFfHwgJHNfeim5wUQEnCBJEr3P7C0lazanpLT
	 wY/LaHbOrizim0Z6XYFHgJmkHJEelwFLOvi+zNBZyVj9xeh2Ja0kAcg41AWLru7oxBQlg
	 f1vMm3t6zkpsZtS4pGbGZRuc5nU6WrWWc5TCZKF9IivZKEWFLruXz25rfnYwbnkKaig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="JWvj/N+0";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13634606A320
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 03:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13634606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JWvj/N+0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793070912; x=1824606912;
  h=date:from:to:cc:subject:message-id;
  bh=FAlxPQtvOSrdmWVXS/IxGKg4gCe1fsEhR6Km86Tg+U0=;
  b=JWvj/N+0zcIQfQLRIWneIIbyindQa6PxJNBlaZp1NazQUgmyfBZIbcvT
   IgphPC8FwXEDlW21IZdW2qfw6yEU1A8BIoJoIDgZqNASOv/t0+HqS1HtZ
   xaZmpyLFGSvcWN2AQnTyjdDYck3Ycxa7JuxUodkzR+gvQbq7lHGN0lJtU
   jFN9Bxwd2B/LaDRz2zawqN5P0HuI9PShpLC2xJkYOHTRHPM3g2tGmyG5N
   UdJsrDEepVYrzWKp1Yw3EZZHImPcdKUv9RVrjG1k4/WDen3n5pGCbTO1y
   8jq07m0+Z4RtLKvhNNVSf1lUB9p3j3w40FRuVlFYKggzKwse9c9LXerBA
   A==;
X-CSE-ConnectionGUID: cotF4d72RpG4k1zGhyWAHQ==
X-CSE-MsgGUID: hFqGvvUtSnGhZQ3HO3DpIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1662946"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1662946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:15:11 -0700
X-CSE-ConnectionGUID: 65hUI0doTpqtR47A6XxlWA==
X-CSE-MsgGUID: m+RVyDEsQ0qqpmmaCagCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4539794"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2026 20:15:09 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLXeV-000000004Mj-3QLM;
	Tue, 27 Oct 2026 03:15:07 +0000
Date: Tue, 27 Oct 2026 04:14:46 +0100
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:jit-arm64 16/26]
 arch/arm64/net/bpf_jit_comp.c:140:22: sparse: sparse: cast truncates bits
 from constant value (ffff0000 becomes 0)
Message-ID: <202610270444.263OivX5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/cilium/linux.git jit-arm64
head:   7392504323b30f65cc4558a1580250a11ee5dafd
commit: b1a0a44fcf6d15126bfa547f85cd9c98b1b8b8d1 [16/26] bpf, arm64: Use a move or mvn for the and and xor with all ones
config: arm64-randconfig-r2305-20261027 (https://download.01.org/0day-ci/archive/20261027/202610270444.263OivX5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270444.263OivX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270444.263OivX5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/net/bpf_jit_comp.c:140:22: sparse: sparse: cast truncates bits from constant value (ffff0000 becomes 0)
   arch/arm64/net/bpf_jit_comp.c:153:22: sparse: sparse: cast truncates bits from constant value (ffff0000 becomes 0)
   arch/arm64/net/bpf_jit_comp.c:164:22: sparse: sparse: cast truncates bits from constant value (ffff0000 becomes 0)

vim +140 arch/arm64/net/bpf_jit_comp.c

710618c760c0a32 Puranjay Mohan  2025-08-01  125  
cac96d79e60eec8 Daniel Borkmann 2026-10-17  126  /*
cac96d79e60eec8 Daniel Borkmann 2026-10-17  127   * A 32-bit immediate, sign extended for the 64-bit variant: a single movz
cac96d79e60eec8 Daniel Borkmann 2026-10-17  128   * or movn when one half is zero or all ones and the other half agrees with
cac96d79e60eec8 Daniel Borkmann 2026-10-17  129   * the sign the 64-bit variant extends, a single orr when it is a bitmask
cac96d79e60eec8 Daniel Borkmann 2026-10-17  130   * immediate, and the pair of a movz or movn with a movk otherwise.
cac96d79e60eec8 Daniel Borkmann 2026-10-17  131   */
e54bcde3d69d400 Zi Shen Lim     2014-08-26  132  static inline void emit_a64_mov_i(const int is64, const int reg,
e54bcde3d69d400 Zi Shen Lim     2014-08-26  133  				  const s32 val, struct jit_ctx *ctx)
e54bcde3d69d400 Zi Shen Lim     2014-08-26  134  {
e54bcde3d69d400 Zi Shen Lim     2014-08-26  135  	u16 hi = val >> 16;
e54bcde3d69d400 Zi Shen Lim     2014-08-26  136  	u16 lo = val & 0xffff;
cac96d79e60eec8 Daniel Borkmann 2026-10-17  137  	u32 insn;
e54bcde3d69d400 Zi Shen Lim     2014-08-26  138  
e54bcde3d69d400 Zi Shen Lim     2014-08-26  139  	if (hi == 0xffff) {
e54bcde3d69d400 Zi Shen Lim     2014-08-26 @140  		emit(A64_MOVN(is64, reg, (u16)~lo, 0), ctx);
cac96d79e60eec8 Daniel Borkmann 2026-10-17  141  		return;
cac96d79e60eec8 Daniel Borkmann 2026-10-17  142  	}
cac96d79e60eec8 Daniel Borkmann 2026-10-17  143  	if (!hi) {
cac96d79e60eec8 Daniel Borkmann 2026-10-17  144  		emit(A64_MOVZ(is64, reg, lo, 0), ctx);
cac96d79e60eec8 Daniel Borkmann 2026-10-17  145  		return;
cac96d79e60eec8 Daniel Borkmann 2026-10-17  146  	}
cac96d79e60eec8 Daniel Borkmann 2026-10-17  147  	/* The 64-bit variant has the upper half set or clear with the sign */
cac96d79e60eec8 Daniel Borkmann 2026-10-17  148  	if (!lo && (!is64 || !(hi & 0x8000))) {
cac96d79e60eec8 Daniel Borkmann 2026-10-17  149  		emit(A64_MOVZ(is64, reg, hi, 16), ctx);
cac96d79e60eec8 Daniel Borkmann 2026-10-17  150  		return;
cac96d79e60eec8 Daniel Borkmann 2026-10-17  151  	}
cac96d79e60eec8 Daniel Borkmann 2026-10-17  152  	if (lo == 0xffff && (!is64 || (hi & 0x8000))) {
e54bcde3d69d400 Zi Shen Lim     2014-08-26  153  		emit(A64_MOVN(is64, reg, (u16)~hi, 16), ctx);
cac96d79e60eec8 Daniel Borkmann 2026-10-17  154  		return;
cac96d79e60eec8 Daniel Borkmann 2026-10-17  155  	}
cac96d79e60eec8 Daniel Borkmann 2026-10-17  156  
cac96d79e60eec8 Daniel Borkmann 2026-10-17  157  	insn = A64_ORR_I(is64, reg, A64_ZR, val);
cac96d79e60eec8 Daniel Borkmann 2026-10-17  158  	if (insn != AARCH64_BREAK_FAULT) {
cac96d79e60eec8 Daniel Borkmann 2026-10-17  159  		emit(insn, ctx);
cac96d79e60eec8 Daniel Borkmann 2026-10-17  160  		return;
e54bcde3d69d400 Zi Shen Lim     2014-08-26  161  	}
cac96d79e60eec8 Daniel Borkmann 2026-10-17  162  
cac96d79e60eec8 Daniel Borkmann 2026-10-17  163  	if (hi & 0x8000) {
cac96d79e60eec8 Daniel Borkmann 2026-10-17  164  		emit(A64_MOVN(is64, reg, (u16)~hi, 16), ctx);
cac96d79e60eec8 Daniel Borkmann 2026-10-17  165  		emit(A64_MOVK(is64, reg, lo, 0), ctx);
e54bcde3d69d400 Zi Shen Lim     2014-08-26  166  	} else {
e54bcde3d69d400 Zi Shen Lim     2014-08-26  167  		emit(A64_MOVZ(is64, reg, lo, 0), ctx);
e54bcde3d69d400 Zi Shen Lim     2014-08-26  168  		emit(A64_MOVK(is64, reg, hi, 16), ctx);
e54bcde3d69d400 Zi Shen Lim     2014-08-26  169  	}
e54bcde3d69d400 Zi Shen Lim     2014-08-26  170  }
e54bcde3d69d400 Zi Shen Lim     2014-08-26  171  

:::::: The code at line 140 was first introduced by commit
:::::: e54bcde3d69d40023ae77727213d14f920eb264a arm64: eBPF JIT compiler

:::::: TO: Zi Shen Lim <zlim.lnx@gmail.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
