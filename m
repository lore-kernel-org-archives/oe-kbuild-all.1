Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05A33ED5B9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814318; cv=none; b=iFx30mleJ4KSqwQ8YyE1fwtD4IDx8tzojrXGFWQPSlids0+RkrAhKO5SWRIE5ESEO/SfcNu99KLL38rz3I9GSn/L6cI5mWldhjuog2TyA4OvzR73S+c+K/T+PgLfQFXCn6/sLJVzhd44iDFv64tvEoB9X2Vn7CxTwFz2qTvIPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814318; c=relaxed/simple;
	bh=j7I4Z2NTval+BrmMfgoH0CwYvkpdZZLKMCOrdWlpQLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SSOCPNN6LHxdEO4k+Dc3YB3FUpcuUIg9pHTgEl8/0of+3mSuC8ZIJwsZXhdSJyuE3fFoVjrp3kUmfxSD5ZdS3jRw4ia9h9HMOFe0S/HXxiuV+zRMTM5NMhkemrNEC/RUidgd/3PaPi6GsENLb0ccXwZamADPF7DhCt7zMOMxh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvLjP3/l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvLjP3/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772814316; x=1804350316;
  h=date:from:to:cc:subject:message-id;
  bh=j7I4Z2NTval+BrmMfgoH0CwYvkpdZZLKMCOrdWlpQLo=;
  b=EvLjP3/llK/uR2DASDZYVPigjPHrG/ESld1l7Paw5ARmj2UJdzzQ0AXv
   L7ibTVUzv4/D536F5IDVuDjCJpV7hGNOMnNySYE1oewABogPIk7ERIVRV
   /zfeqmF6+UJYXr00bJzBpyQ1D/pZpNR94ZqT1TmKXk0LbGQXrrq2GbDuj
   XtjGn2OEE8ebV2PSCprg21d1DgyCXj8Z1s1dhGsSjtnMsk8m+Qqr0SHj4
   /3EUlOS5l91VuwMx6riWETjMIWzDUAFQGx3FhIqlPjDIiDQGVQgbbBYpw
   voJ22ahJ50SAA2TyoIHiJ9jXH6Uj/AJHUf7e5Zql3NBHfXgPWAyEoScQJ
   w==;
X-CSE-ConnectionGUID: K0mibdxARwOIDFmcceqfWQ==
X-CSE-MsgGUID: PQUa8y4bSdaVBC6xhwsE+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="99397490"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="99397490"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:25:15 -0800
X-CSE-ConnectionGUID: 9yt5RVrDQYyHOI3xKyuG5Q==
X-CSE-MsgGUID: es+30UCeRnq/XHqTM76rYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223750220"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Mar 2026 08:25:13 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyXzD-0000000013V-1nnw;
	Fri, 06 Mar 2026 16:25:11 +0000
Date: Sat, 07 Mar 2026 00:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fengshui 16/16] kernel/bpf/core.c:1756:17: error:
 label 'JMP_CALL_X' used but not defined
Message-ID: <202603070048.WS1VLNp3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fengshui
head:   1807a4179319a4b8ade8ff010ddb889dc90325ca
commit: 1807a4179319a4b8ade8ff010ddb889dc90325ca [16/16] [FIXME] bpf: Allow indirect calls via callx instruction
config: sparc64-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260307/202603070048.WS1VLNp3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070048.WS1VLNp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070048.WS1VLNp3-lkp@intel.com/

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
