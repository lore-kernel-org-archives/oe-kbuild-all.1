Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A43A1E88
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115185; cv=none; b=dO3F64QBSsWR6Smd7w1qghYDGLRvoKBnHTlqWK646WNfXkDMednqqFdPK8VFNG9Uu5pIn8A1/oXgYdE70AbcWEiJteKMNPx1iPLJljTWLCtym3T93KfgZhCeu6Jwf9rIlMd2NmjbXx/mwN+c6ZOxzaKjUj/FZp7S9ru0kmEYp58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115185; c=relaxed/simple;
	bh=xfL6lOdzYxoZ4G0DDcA7tIWEbmEbrUqfq3XZtchv6J8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fyqOX5NwH0lA7UKGEwskiq5j8Wzd1YAU4ullhTrFyBVViFFS5xrVxta2sPvtG+ivy45Q/IjANPKbLlvTX0GptbIS5sVkgrOsVFctn+xb0lz00dHBl2O15SPDUQdMSoLLHboAJ2QUXnyhgkfGpG8J56UhOZZ39nGGFb/Oa1sXaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFtd2moU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFtd2moU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772115183; x=1803651183;
  h=date:from:to:cc:subject:message-id;
  bh=xfL6lOdzYxoZ4G0DDcA7tIWEbmEbrUqfq3XZtchv6J8=;
  b=eFtd2moUCyuhnfCpjUqrv16jR/LzVZyRSidAxgr/sIZPyrQRU0fGGHB1
   B3vsUAuU1JfNYpsvE0/9AAHGvnqbWZ4JENAuJQARvWH/P8rrfnG0rzIzQ
   w1F7jrGTqosMQYodYqpix2/juhb3or4/I499u/sE/XivwCxw7jPQ8hdUv
   iWvaiqFxHT98Kp03hqSbUGHOSNi0VogqCnANW3K8aMMM9hf8tNbRwSt2y
   W83yyseGlu+Kim0JZml9z+rfimp0Kn2F5FrVspHN+pibmp5mVjaCkcoXj
   zSXeW1xhNzAsDPtCLLVMBxKIeTkReJJH0w1Tgv8cfLi9SaSi7QpDmWVYi
   Q==;
X-CSE-ConnectionGUID: bP+fIDksRZ+Bo00OHtdIxw==
X-CSE-MsgGUID: lQ5Y07BIRqWBQM0bBrNrCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73279569"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73279569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 06:13:02 -0800
X-CSE-ConnectionGUID: ytLNtgA8TxK/VG1vAyEuzw==
X-CSE-MsgGUID: P5Lo4ceNQsWelgHzfDl3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221195647"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2026 06:13:01 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvc6t-000000009TF-1KEp;
	Thu, 26 Feb 2026 14:12:59 +0000
Date: Thu, 26 Feb 2026 22:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fengshui 16/16] kernel/bpf/core.c:1756:17: error:
 label 'JMP_CALL_X' used but not defined
Message-ID: <202602262144.RusAGbhA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fengshui
head:   e03843baf0a6c7430a23438e6915412039cee3cf
commit: e03843baf0a6c7430a23438e6915412039cee3cf [16/16] [FIXME] bpf: Allow indirect calls via callx instruction
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20260226/202602262144.RusAGbhA-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602262144.RusAGbhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262144.RusAGbhA-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/core.c: In function '___bpf_prog_run':
>> kernel/bpf/core.c:1756:17: error: label 'JMP_CALL_X' used but not defined
    1756 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                 ^~~~~~~~~~~~


vim +/JMP_CALL_X +1756 kernel/bpf/core.c

5e581dad4fec0e Daniel Borkmann    2018-01-26  1738  
290af86629b25f Alexei Starovoitov 2018-01-09  1739  #ifndef CONFIG_BPF_JIT_ALWAYS_ON
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1740  /**
019d0454c61707 Randy Dunlap       2021-08-09  1741   *	___bpf_prog_run - run eBPF program on a given context
de1da68d9c9d23 Valdis Kletnieks   2019-01-28  1742   *	@regs: is the array of MAX_BPF_EXT_REG eBPF pseudo-registers
7ae457c1e5b45a Alexei Starovoitov 2014-07-30  1743   *	@insn: is the array of eBPF instructions
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1744   *
7ae457c1e5b45a Alexei Starovoitov 2014-07-30  1745   * Decode and execute eBPF instructions.
019d0454c61707 Randy Dunlap       2021-08-09  1746   *
019d0454c61707 Randy Dunlap       2021-08-09  1747   * Return: whatever value is in %BPF_R0 at program exit
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1748   */
2ec9898e9c70b9 He Fengqing        2021-03-31  1749  static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1750  {
5e581dad4fec0e Daniel Borkmann    2018-01-26  1751  #define BPF_INSN_2_LBL(x, y)    [BPF_##x | BPF_##y] = &&x##_##y
5e581dad4fec0e Daniel Borkmann    2018-01-26  1752  #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
e55a73251da335 Josh Poimboeuf     2019-06-27  1753  	static const void * const jumptable[256] __annotate_jump_table = {
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1754  		[0 ... 255] = &&default_label,
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1755  		/* Now overwrite non-defaults ... */
5e581dad4fec0e Daniel Borkmann    2018-01-26 @1756  		BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
5e581dad4fec0e Daniel Borkmann    2018-01-26  1757  		/* Non-UAPI available opcodes. */
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1758  		[BPF_JMP | BPF_CALL_ARGS] = &&JMP_CALL_ARGS,
71189fa9b092ef Alexei Starovoitov 2017-05-30  1759  		[BPF_JMP | BPF_TAIL_CALL] = &&JMP_TAIL_CALL,
f5e81d11175015 Daniel Borkmann    2021-07-13  1760  		[BPF_ST  | BPF_NOSPEC] = &&ST_NOSPEC,
2a02759ef5f8a3 Alexei Starovoitov 2019-10-15  1761  		[BPF_LDX | BPF_PROBE_MEM | BPF_B] = &&LDX_PROBE_MEM_B,
2a02759ef5f8a3 Alexei Starovoitov 2019-10-15  1762  		[BPF_LDX | BPF_PROBE_MEM | BPF_H] = &&LDX_PROBE_MEM_H,
2a02759ef5f8a3 Alexei Starovoitov 2019-10-15  1763  		[BPF_LDX | BPF_PROBE_MEM | BPF_W] = &&LDX_PROBE_MEM_W,
2a02759ef5f8a3 Alexei Starovoitov 2019-10-15  1764  		[BPF_LDX | BPF_PROBE_MEM | BPF_DW] = &&LDX_PROBE_MEM_DW,
1f9a1ea821ff25 Yonghong Song      2023-07-27  1765  		[BPF_LDX | BPF_PROBE_MEMSX | BPF_B] = &&LDX_PROBE_MEMSX_B,
1f9a1ea821ff25 Yonghong Song      2023-07-27  1766  		[BPF_LDX | BPF_PROBE_MEMSX | BPF_H] = &&LDX_PROBE_MEMSX_H,
1f9a1ea821ff25 Yonghong Song      2023-07-27  1767  		[BPF_LDX | BPF_PROBE_MEMSX | BPF_W] = &&LDX_PROBE_MEMSX_W,
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1768  	};
5e581dad4fec0e Daniel Borkmann    2018-01-26  1769  #undef BPF_INSN_3_LBL
5e581dad4fec0e Daniel Borkmann    2018-01-26  1770  #undef BPF_INSN_2_LBL
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1771  	u32 tail_call_cnt = 0;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1772  

:::::: The code at line 1756 was first introduced by commit
:::::: 5e581dad4fec0e6d062740dc35b8dc248b39d224 bpf: make unknown opcode handling more robust

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
