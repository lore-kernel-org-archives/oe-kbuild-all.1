Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D733A9601
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951783; cv=none; b=aXgDIwfC9MJ55IX3eXttZtDJzqP4yzcAaquIK1Dc154G+GNx70lwG4q9h2dwx6//khHGZOHXu7LfZ9/MIUkS5BZbMSh9VhMPEuzRv6IVyXi/Hj8oOex8BNsRUK9DCYFbS1Daq0A+zq73eI4jbVJOvwQ/jillXNaivNRLfaDD6zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951783; c=relaxed/simple;
	bh=v6/hn5hF0CWBo3wScyRofQ6tY1ea+emHuxJdxIyfASI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qIhBD8RhMBglJeuZ+npBz769W4lDwu85YxPdaT/G3gYRnb/nzfjekkUaNYHjuyVKIVt5Ow/vCu8j5nPhB0csYoiOdN3vboCz3ESTbd2abUyvL90Q7T8LUFuvprhDnKuZbIBwW5juAJ/bTWvSviLGkGwWkAfaqgMDTYy6flTGXnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M04qZkwf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M04qZkwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771951782; x=1803487782;
  h=date:from:to:cc:subject:message-id;
  bh=v6/hn5hF0CWBo3wScyRofQ6tY1ea+emHuxJdxIyfASI=;
  b=M04qZkwfwV/eejxJudbA03URIOiKP1rutX8mvssW0FITTXu+FlIurwk1
   hgY24MAEwU9PQLB7FAdNzhxI3Mg3dORv9S9pvTbwg2PH5BcfkHmKTTrHW
   1s25H4JUO1ih3G0u/FFzVC/ZpP4wNC7MaxdNubQMdh5LoQ7NgGAlqjhxX
   uG8Rq+C0u+4i+vvavinDp8Fz2WyuE5Rff8Ai2OQabJ4m2gbXvWJUPNvMJ
   fuFm1S/b94PtkJxcFMpf0E/kdKShAU79/B4h8CiBZ96afP/b0nNcMv0PK
   iKuFhZpfdGqgyMLD6PPZefW44nE2Hk5h1BacIRR/VwS/u/Xb61gQwLz3b
   A==;
X-CSE-ConnectionGUID: yxL1AYW4SYKo5XAkKo9sPA==
X-CSE-MsgGUID: /bdZP0bjRhyW9ewuYgJf3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76807642"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="76807642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 08:49:42 -0800
X-CSE-ConnectionGUID: VD1e7+sVSmy8ln4Am9JJ6Q==
X-CSE-MsgGUID: 0mdoeZXZRk6CftWU1I9i0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214801476"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Feb 2026 08:49:40 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuvbD-000000002Ed-2HL6;
	Tue, 24 Feb 2026 16:49:29 +0000
Date: Wed, 25 Feb 2026 00:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fengshui 12/13] kernel/bpf/core.c:1756:3: error:
 label 'JMP_CALL_X' used but not defined
Message-ID: <202602250019.9YABJOji-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fengshui
head:   6367025f4624d524eddcd0e9ddef02cd5eccf981
commit: 06a855cd83d7c3d7120a1600da8938ebe9f3f842 [12/13] [FIXME] bpf: Allow indirect calls via callx instruction
config: parisc-randconfig-001-20260224 (https://download.01.org/0day-ci/archive/20260225/202602250019.9YABJOji-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250019.9YABJOji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250019.9YABJOji-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/core.c: In function '___bpf_prog_run':
>> kernel/bpf/core.c:1756:3: error: label 'JMP_CALL_X' used but not defined
    1756 |   BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
         |   ^~~~~~~~~~~~


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
