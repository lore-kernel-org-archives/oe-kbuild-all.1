Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C94E3A9D8A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951774; cv=none; b=pzApUE2lIBCAj/UW3p0vVhVasy01g+QDy68BsOzDOdndt7s8d9Eypq6Odm3NWgPa63IDG5kRIb9bpD5vc7XmIYF2ZyuybPyHh0sCBDoUPJlrn3tGFHELXgx2Q1M60uo4d2tur1BLduGA33NL6XleQjWcJ/BQ2kTgBDjGbmMAChg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951774; c=relaxed/simple;
	bh=nus/nhTgDIknvk8/Dy7o7ReFHHIq5oSapCzm9/n9Q2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vArEUVyXmbftaKph3pW8RwTEhkhM1Azg9DOJGXskeB2L6xx/z8YUsKY84ec47CMA44i4rdAvSxe9mXSAOB8k/odka1hiH9ifZzB+vYoRPqT3DgQ4u/Um0YG665JqvNS4mqv98L8Te1DuRshp6Kh2FjlE0COCFKOoFs51qxifyr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMMS/7ck; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMMS/7ck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771951772; x=1803487772;
  h=date:from:to:cc:subject:message-id;
  bh=nus/nhTgDIknvk8/Dy7o7ReFHHIq5oSapCzm9/n9Q2s=;
  b=LMMS/7ckyHMLamLzIcWCRLgSUpgZsgJdRFojs9E+uGM3PTmeJpVbJ/WH
   FUHC4Z7EQppYBx9waTeuLg1F09D9rvJ/v+710gepZN3tbSebiO7sTxb2y
   UpKvtSGeWd/1DRp/T4QEXbWSRsJYusm0j82q2oCx/V/IID9ZTtuXpAe1I
   3Ke9V5NAq+e1On0YEThLJeCppE552xR5o9JOl6wGko8RniEFUgePO22TM
   +b8Ou4W3hiTX9dyeOalj4S+bxHO3yeTpDlE0Aw769GK4nX+YXc5d23xUM
   Q/l/g0z58eceqJgFhdsya+UrTNqsddqZlOd5f83tnP+Iq5WK5hZ3JZuRJ
   g==;
X-CSE-ConnectionGUID: wZss1KpCTkCVD/STPnyGWg==
X-CSE-MsgGUID: D0T/F4DqRjqqNZqwAc/Bfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76807625"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="76807625"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 08:49:32 -0800
X-CSE-ConnectionGUID: s+b9Xg0dQ0mmzeoWM/y54g==
X-CSE-MsgGUID: r7kb+e/WT56XmImsZnCsyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214801460"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Feb 2026 08:49:29 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuvb9-000000002Eb-3asC;
	Tue, 24 Feb 2026 16:49:24 +0000
Date: Wed, 25 Feb 2026 00:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fengshui 12/12] kernel/bpf/core.c:1756:32: error:
 use of undeclared label 'JMP_CALL_X'
Message-ID: <202602250041.VrmS6iEP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fengshui
head:   6367025f4624d524eddcd0e9ddef02cd5eccf981
commit: 06a855cd83d7c3d7120a1600da8938ebe9f3f842 [12/12] [FIXME] bpf: Allow indirect calls via callx instruction
config: um-randconfig-r071-20260224 (https://download.01.org/0day-ci/archive/20260225/202602250041.VrmS6iEP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250041.VrmS6iEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250041.VrmS6iEP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/core.c:22:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> kernel/bpf/core.c:1756:32: error: use of undeclared label 'JMP_CALL_X'
    1756 |                 BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |                                              ^
   1 warning and 1 error generated.


vim +/JMP_CALL_X +1756 kernel/bpf/core.c

5e581dad4fec0e6 Daniel Borkmann    2018-01-26  1738  
290af86629b25ff Alexei Starovoitov 2018-01-09  1739  #ifndef CONFIG_BPF_JIT_ALWAYS_ON
f5bffecda951b59 Alexei Starovoitov 2014-07-22  1740  /**
019d0454c617078 Randy Dunlap       2021-08-09  1741   *	___bpf_prog_run - run eBPF program on a given context
de1da68d9c9d230 Valdis Kletnieks   2019-01-28  1742   *	@regs: is the array of MAX_BPF_EXT_REG eBPF pseudo-registers
7ae457c1e5b45a1 Alexei Starovoitov 2014-07-30  1743   *	@insn: is the array of eBPF instructions
f5bffecda951b59 Alexei Starovoitov 2014-07-22  1744   *
7ae457c1e5b45a1 Alexei Starovoitov 2014-07-30  1745   * Decode and execute eBPF instructions.
019d0454c617078 Randy Dunlap       2021-08-09  1746   *
019d0454c617078 Randy Dunlap       2021-08-09  1747   * Return: whatever value is in %BPF_R0 at program exit
f5bffecda951b59 Alexei Starovoitov 2014-07-22  1748   */
2ec9898e9c70b93 He Fengqing        2021-03-31  1749  static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
f5bffecda951b59 Alexei Starovoitov 2014-07-22  1750  {
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  1751  #define BPF_INSN_2_LBL(x, y)    [BPF_##x | BPF_##y] = &&x##_##y
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  1752  #define BPF_INSN_3_LBL(x, y, z) [BPF_##x | BPF_##y | BPF_##z] = &&x##_##y##_##z
e55a73251da3358 Josh Poimboeuf     2019-06-27  1753  	static const void * const jumptable[256] __annotate_jump_table = {
f5bffecda951b59 Alexei Starovoitov 2014-07-22  1754  		[0 ... 255] = &&default_label,
f5bffecda951b59 Alexei Starovoitov 2014-07-22  1755  		/* Now overwrite non-defaults ... */
5e581dad4fec0e6 Daniel Borkmann    2018-01-26 @1756  		BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  1757  		/* Non-UAPI available opcodes. */
1ea47e01ad6ea0f Alexei Starovoitov 2017-12-14  1758  		[BPF_JMP | BPF_CALL_ARGS] = &&JMP_CALL_ARGS,
71189fa9b092ef1 Alexei Starovoitov 2017-05-30  1759  		[BPF_JMP | BPF_TAIL_CALL] = &&JMP_TAIL_CALL,
f5e81d111750154 Daniel Borkmann    2021-07-13  1760  		[BPF_ST  | BPF_NOSPEC] = &&ST_NOSPEC,
2a02759ef5f8a34 Alexei Starovoitov 2019-10-15  1761  		[BPF_LDX | BPF_PROBE_MEM | BPF_B] = &&LDX_PROBE_MEM_B,
2a02759ef5f8a34 Alexei Starovoitov 2019-10-15  1762  		[BPF_LDX | BPF_PROBE_MEM | BPF_H] = &&LDX_PROBE_MEM_H,
2a02759ef5f8a34 Alexei Starovoitov 2019-10-15  1763  		[BPF_LDX | BPF_PROBE_MEM | BPF_W] = &&LDX_PROBE_MEM_W,
2a02759ef5f8a34 Alexei Starovoitov 2019-10-15  1764  		[BPF_LDX | BPF_PROBE_MEM | BPF_DW] = &&LDX_PROBE_MEM_DW,
1f9a1ea821ff253 Yonghong Song      2023-07-27  1765  		[BPF_LDX | BPF_PROBE_MEMSX | BPF_B] = &&LDX_PROBE_MEMSX_B,
1f9a1ea821ff253 Yonghong Song      2023-07-27  1766  		[BPF_LDX | BPF_PROBE_MEMSX | BPF_H] = &&LDX_PROBE_MEMSX_H,
1f9a1ea821ff253 Yonghong Song      2023-07-27  1767  		[BPF_LDX | BPF_PROBE_MEMSX | BPF_W] = &&LDX_PROBE_MEMSX_W,
f5bffecda951b59 Alexei Starovoitov 2014-07-22  1768  	};
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  1769  #undef BPF_INSN_3_LBL
5e581dad4fec0e6 Daniel Borkmann    2018-01-26  1770  #undef BPF_INSN_2_LBL
04fd61ab36ec065 Alexei Starovoitov 2015-05-19  1771  	u32 tail_call_cnt = 0;
f5bffecda951b59 Alexei Starovoitov 2014-07-22  1772  

:::::: The code at line 1756 was first introduced by commit
:::::: 5e581dad4fec0e6d062740dc35b8dc248b39d224 bpf: make unknown opcode handling more robust

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
