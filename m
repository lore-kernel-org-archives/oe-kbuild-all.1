Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3971BD004
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735942286; cv=none; b=iwhI9+iUQC7GwjOJjLGSo2ab4syodSHFV0RJ5BRmc8hiXPExiIkeXmxweZKWDGX4yZaqxT+YaKZ3bn4Rmnuw43RSW6len9NU0RAVdM/nvD9+W6FgsFFxkah2MWB11PYehWNYTkfpWVYT0w0XMr9Z7WrpfqXMiCrxXPZ6OongrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735942286; c=relaxed/simple;
	bh=mW69ce2q7At4T47gs77Y/MpgK8f+8epoZCC1gZxA2Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TVMJZoV32yLlZzJL/cEozL2+/fbSH1eVI4b5kpu7UNJ2okg5Lnc1ecbGiU+U7d2YBx3t/7u/LlDhyJBPE7DmVgd+VGQfGGOzh+ypINR8NOiqOWxHEFh2T37Qjmplm+doZRi06QxMBCVg7edBWmzsBEUBTasp780ZyO6Erxt3uKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGs8ML6n; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGs8ML6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735942284; x=1767478284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mW69ce2q7At4T47gs77Y/MpgK8f+8epoZCC1gZxA2Aw=;
  b=EGs8ML6n2QFvSz03AwhaQR8Akroo+ApDPrumCG6pFvcUtGMmLtHdVOdX
   3X20z4/3RzEhPzqQy3J2ZLUcyQA5mCiGwDyUzwd8qYYNu9MsiRYrdpWY9
   rZfC6ra0u/v1zuAy0iAvxuSiAj/CkvjuE6yYBCEaS8ZEFQ6XoaF0U3jvw
   8h+rNff8l6Iy5vLHv2sKgzb5FKdTWuANWY5LrwSMyWc5GCidHoCi9RmRj
   VAxDw/2Jw/0MRfTAHG2ubLH/HDzW+k2wYstsWiDo4GGA8vrZ+tnHDZdrF
   UM43legZnO4LK32eWRZFEZufO1BvjrL3B+HMNhVgJFQ94LYYMGhJPa0KU
   g==;
X-CSE-ConnectionGUID: o9Zx1IdaQCqVNUv5Oaz7xg==
X-CSE-MsgGUID: LJpnBxMgQgSRC4OuxPk6KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="53605324"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="53605324"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 14:11:22 -0800
X-CSE-ConnectionGUID: cE2HV6yFQ6ea6FSQeaxqmg==
X-CSE-MsgGUID: nI/lXHD7RmarejQR5gzsIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="102409250"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jan 2025 14:11:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTpsz-000ALi-2c;
	Fri, 03 Jan 2025 22:11:17 +0000
Date: Sat, 4 Jan 2025 06:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sandipan Das <sandipan@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/lib/sstep.c:1172:38: warning: variable 'rc' set but not
 used
Message-ID: <202501040544.4HAEUplS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 930d6288a26787d2e7f633705434171a506db9c5 powerpc: sstep: Add support for maddhd, maddhdu, maddld instructions
date:   6 years ago
config: powerpc-randconfig-r011-20220404 (https://download.01.org/0day-ci/archive/20250104/202501040544.4HAEUplS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040544.4HAEUplS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040544.4HAEUplS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   arch/powerpc/lib/sstep.c:482:9: note: in expansion of macro 'if'
     482 |         if (unlikely(cross_endian)) {
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/powerpc/lib/sstep.c:482:13: note: in expansion of macro 'unlikely'
     482 |         if (unlikely(cross_endian)) {
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   arch/powerpc/lib/sstep.c:482:9: note: in expansion of macro 'if'
     482 |         if (unlikely(cross_endian)) {
         |         ^~
   arch/powerpc/lib/sstep.c: In function 'do_fp_store':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   arch/powerpc/lib/sstep.c:548:9: note: in expansion of macro 'if'
     548 |         if (unlikely(cross_endian)) {
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/powerpc/lib/sstep.c:548:13: note: in expansion of macro 'unlikely'
     548 |         if (unlikely(cross_endian)) {
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   arch/powerpc/lib/sstep.c:548:9: note: in expansion of macro 'if'
     548 |         if (unlikely(cross_endian)) {
         |         ^~
   arch/powerpc/lib/sstep.c: In function 'do_vec_load':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   arch/powerpc/lib/sstep.c:577:9: note: in expansion of macro 'if'
     577 |         if (unlikely(cross_endian))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/powerpc/lib/sstep.c:577:13: note: in expansion of macro 'unlikely'
     577 |         if (unlikely(cross_endian))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   arch/powerpc/lib/sstep.c:577:9: note: in expansion of macro 'if'
     577 |         if (unlikely(cross_endian))
         |         ^~
   arch/powerpc/lib/sstep.c: In function 'do_vec_store':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   arch/powerpc/lib/sstep.c:608:9: note: in expansion of macro 'if'
     608 |         if (unlikely(cross_endian))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/powerpc/lib/sstep.c:608:13: note: in expansion of macro 'unlikely'
     608 |         if (unlikely(cross_endian))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   arch/powerpc/lib/sstep.c:608:9: note: in expansion of macro 'if'
     608 |         if (unlikely(cross_endian))
         |         ^~
   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
>> arch/powerpc/lib/sstep.c:1172:38: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
    1172 |         unsigned int opcode, ra, rb, rc, rd, spr, u;
         |                                      ^~
   arch/powerpc/lib/sstep.c: In function 'emulate_update_regs':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/bug.h:70:9: note: in expansion of macro 'if'
      70 |         if (unlikely(__ret_warn_on))                            \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:70:13: note: in expansion of macro 'unlikely'
      70 |         if (unlikely(__ret_warn_on))                            \
         |             ^~~~~~~~
   arch/powerpc/lib/sstep.c:2738:25: note: in expansion of macro 'WARN_ON_ONCE'
    2738 |                         WARN_ON_ONCE(1);
         |                         ^~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/bug.h:70:9: note: in expansion of macro 'if'
      70 |         if (unlikely(__ret_warn_on))                            \
         |         ^~
   arch/powerpc/lib/sstep.c:2738:25: note: in expansion of macro 'WARN_ON_ONCE'
    2738 |                         WARN_ON_ONCE(1);
         |                         ^~~~~~~~~~~~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/bug.h:70:9: note: in expansion of macro 'if'
      70 |         if (unlikely(__ret_warn_on))                            \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:70:13: note: in expansion of macro 'unlikely'
      70 |         if (unlikely(__ret_warn_on))                            \
         |             ^~~~~~~~
   arch/powerpc/lib/sstep.c:2754:25: note: in expansion of macro 'WARN_ON_ONCE'
    2754 |                         WARN_ON_ONCE(1);
         |                         ^~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/bug.h:70:9: note: in expansion of macro 'if'
      70 |         if (unlikely(__ret_warn_on))                            \
         |         ^~
   arch/powerpc/lib/sstep.c:2754:25: note: in expansion of macro 'WARN_ON_ONCE'
    2754 |                         WARN_ON_ONCE(1);
         |                         ^~~~~~~~~~~~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/bug.h:70:9: note: in expansion of macro 'if'
      70 |         if (unlikely(__ret_warn_on))                            \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:70:13: note: in expansion of macro 'unlikely'
      70 |         if (unlikely(__ret_warn_on))                            \
         |             ^~~~~~~~
   arch/powerpc/lib/sstep.c:2759:17: note: in expansion of macro 'WARN_ON_ONCE'
    2759 |                 WARN_ON_ONCE(1);
         |                 ^~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/bug.h:70:9: note: in expansion of macro 'if'
      70 |         if (unlikely(__ret_warn_on))                            \
         |         ^~
   arch/powerpc/lib/sstep.c:2759:17: note: in expansion of macro 'WARN_ON_ONCE'
    2759 |                 WARN_ON_ONCE(1);
         |                 ^~~~~~~~~~~~
   arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~


vim +/rc +1172 arch/powerpc/lib/sstep.c

  1157	
  1158	/*
  1159	 * Decode an instruction, and return information about it in *op
  1160	 * without changing *regs.
  1161	 * Integer arithmetic and logical instructions, branches, and barrier
  1162	 * instructions can be emulated just using the information in *op.
  1163	 *
  1164	 * Return value is 1 if the instruction can be emulated just by
  1165	 * updating *regs with the information in *op, -1 if we need the
  1166	 * GPRs but *regs doesn't contain the full register set, or 0
  1167	 * otherwise.
  1168	 */
  1169	int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
  1170			  unsigned int instr)
  1171	{
> 1172		unsigned int opcode, ra, rb, rc, rd, spr, u;
  1173		unsigned long int imm;
  1174		unsigned long int val, val2;
  1175		unsigned int mb, me, sh;
  1176		long ival;
  1177	
  1178		op->type = COMPUTE;
  1179	
  1180		opcode = instr >> 26;
  1181		switch (opcode) {
  1182		case 16:	/* bc */
  1183			op->type = BRANCH;
  1184			imm = (signed short)(instr & 0xfffc);
  1185			if ((instr & 2) == 0)
  1186				imm += regs->nip;
  1187			op->val = truncate_if_32bit(regs->msr, imm);
  1188			if (instr & 1)
  1189				op->type |= SETLK;
  1190			if (branch_taken(instr, regs, op))
  1191				op->type |= BRTAKEN;
  1192			return 1;
  1193	#ifdef CONFIG_PPC64
  1194		case 17:	/* sc */
  1195			if ((instr & 0xfe2) == 2)
  1196				op->type = SYSCALL;
  1197			else
  1198				op->type = UNKNOWN;
  1199			return 0;
  1200	#endif
  1201		case 18:	/* b */
  1202			op->type = BRANCH | BRTAKEN;
  1203			imm = instr & 0x03fffffc;
  1204			if (imm & 0x02000000)
  1205				imm -= 0x04000000;
  1206			if ((instr & 2) == 0)
  1207				imm += regs->nip;
  1208			op->val = truncate_if_32bit(regs->msr, imm);
  1209			if (instr & 1)
  1210				op->type |= SETLK;
  1211			return 1;
  1212		case 19:
  1213			switch ((instr >> 1) & 0x3ff) {
  1214			case 0:		/* mcrf */
  1215				op->type = COMPUTE + SETCC;
  1216				rd = 7 - ((instr >> 23) & 0x7);
  1217				ra = 7 - ((instr >> 18) & 0x7);
  1218				rd *= 4;
  1219				ra *= 4;
  1220				val = (regs->ccr >> ra) & 0xf;
  1221				op->ccval = (regs->ccr & ~(0xfUL << rd)) | (val << rd);
  1222				return 1;
  1223	
  1224			case 16:	/* bclr */
  1225			case 528:	/* bcctr */
  1226				op->type = BRANCH;
  1227				imm = (instr & 0x400)? regs->ctr: regs->link;
  1228				op->val = truncate_if_32bit(regs->msr, imm);
  1229				if (instr & 1)
  1230					op->type |= SETLK;
  1231				if (branch_taken(instr, regs, op))
  1232					op->type |= BRTAKEN;
  1233				return 1;
  1234	
  1235			case 18:	/* rfid, scary */
  1236				if (regs->msr & MSR_PR)
  1237					goto priv;
  1238				op->type = RFI;
  1239				return 0;
  1240	
  1241			case 150:	/* isync */
  1242				op->type = BARRIER | BARRIER_ISYNC;
  1243				return 1;
  1244	
  1245			case 33:	/* crnor */
  1246			case 129:	/* crandc */
  1247			case 193:	/* crxor */
  1248			case 225:	/* crnand */
  1249			case 257:	/* crand */
  1250			case 289:	/* creqv */
  1251			case 417:	/* crorc */
  1252			case 449:	/* cror */
  1253				op->type = COMPUTE + SETCC;
  1254				ra = (instr >> 16) & 0x1f;
  1255				rb = (instr >> 11) & 0x1f;
  1256				rd = (instr >> 21) & 0x1f;
  1257				ra = (regs->ccr >> (31 - ra)) & 1;
  1258				rb = (regs->ccr >> (31 - rb)) & 1;
  1259				val = (instr >> (6 + ra * 2 + rb)) & 1;
  1260				op->ccval = (regs->ccr & ~(1UL << (31 - rd))) |
  1261					(val << (31 - rd));
  1262				return 1;
  1263			}
  1264			break;
  1265		case 31:
  1266			switch ((instr >> 1) & 0x3ff) {
  1267			case 598:	/* sync */
  1268				op->type = BARRIER + BARRIER_SYNC;
  1269	#ifdef __powerpc64__
  1270				switch ((instr >> 21) & 3) {
  1271				case 1:		/* lwsync */
  1272					op->type = BARRIER + BARRIER_LWSYNC;
  1273					break;
  1274				case 2:		/* ptesync */
  1275					op->type = BARRIER + BARRIER_PTESYNC;
  1276					break;
  1277				}
  1278	#endif
  1279				return 1;
  1280	
  1281			case 854:	/* eieio */
  1282				op->type = BARRIER + BARRIER_EIEIO;
  1283				return 1;
  1284			}
  1285			break;
  1286		}
  1287	
  1288		/* Following cases refer to regs->gpr[], so we need all regs */
  1289		if (!FULL_REGS(regs))
  1290			return -1;
  1291	
  1292		rd = (instr >> 21) & 0x1f;
  1293		ra = (instr >> 16) & 0x1f;
  1294		rb = (instr >> 11) & 0x1f;
  1295		rc = (instr >> 6) & 0x1f;
  1296	
  1297		switch (opcode) {
  1298	#ifdef __powerpc64__
  1299		case 2:		/* tdi */
  1300			if (rd & trap_compare(regs->gpr[ra], (short) instr))
  1301				goto trap;
  1302			return 1;
  1303	#endif
  1304		case 3:		/* twi */
  1305			if (rd & trap_compare((int)regs->gpr[ra], (short) instr))
  1306				goto trap;
  1307			return 1;
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
