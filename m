Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD561ACED5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736449630; cv=none; b=qG4alQ9RcPyIFwAZpn7dfV74R2XShA9DfJ1iYGyNnODb9t53P966utBC5B+0y2sJV69FS7A0l1s5xDZiSkycL+vkiTj98kuw0u7i4gArg0OWJGUDBDsIeUN6dAjAHnbAHXO4G7ooCrJoOIm9KhBD8xypPBjMVRAu5e6n+GYdeKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736449630; c=relaxed/simple;
	bh=W5cAKS1UhdHCqV/ys/3mrstw/SsNr5OUJGvDwLdVWGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQ9cq6kwPHS2X4ZnY8GCLu4C7PE71pzJHJEbqsQLdZyHV0iwmXMnBEZXuM3i3FQLLw7r4Bnqpf0wFq2sUbgg2mVIPh735RrUeRNhTwBooSywQ87TNI+ArLFoBIM4NvTaUCavasR7uUboUmMT+ad33f+/XknMfmVQjMUxMg6tnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6V4JKdD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6V4JKdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736449628; x=1767985628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W5cAKS1UhdHCqV/ys/3mrstw/SsNr5OUJGvDwLdVWGA=;
  b=k6V4JKdDxx29h+RuNojZlh4gP4GcTEQU9UhVDYYFDSs7B6VhOjh44hnS
   qJqpaCBn4lDzmYSPM7DwzL0Pr0BjSNWcUrsJ7pCW6WhdGuzTBNXth4+9d
   0YE/1njilx0E7+KdRqfrAVVuIXIs5IzoeY2HOBmvPbyljdRFOryyBLBUs
   csZ3TwsHkdjAWI5d2Z6TtrU3772fAjbV7IZRNaI6ZOP/LfD5E5RzFY+r2
   zePzIofnY/sOqyGJiQ66LO2Tn5lVQRNSIKdgw1uJgwBKwnNlDyMMptYv9
   tAmUnj0UyqK07PIwUF/2ZZQvbEEFULrLB3GNTA1FNoh7pXLG6Tw8O6xLs
   Q==;
X-CSE-ConnectionGUID: SHWzYrM2Q160tZQmnUF5vQ==
X-CSE-MsgGUID: c8usrLrsSrqe5LHXyssnoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62105156"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="62105156"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 11:07:08 -0800
X-CSE-ConnectionGUID: s7Az6KN1TDGTQr+R/mzgwg==
X-CSE-MsgGUID: OSSEqXRPT7mnh3crpwDBpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="108495209"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jan 2025 11:07:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVxrz-000I3K-2T;
	Thu, 09 Jan 2025 19:07:03 +0000
Date: Fri, 10 Jan 2025 03:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alistair Popple <alistair@popple.id.au>
Subject: arch/powerpc/lib/sstep.c:1172:28: warning: variable 'suffix' set but
 not used
Message-ID: <202501100247.gEmkqu8j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eea6e4b4dfb8859446177c32961c96726d0117be
commit: 650b55b707fdfa764e9f2b81314d3eb4216fb962 powerpc: Add prefixed instructions to instruction data type
date:   4 years, 8 months ago
config: powerpc-randconfig-c023-20211019 (https://download.01.org/0day-ci/archive/20250110/202501100247.gEmkqu8j-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100247.gEmkqu8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100247.gEmkqu8j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
>> arch/powerpc/lib/sstep.c:1172:28: warning: variable 'suffix' set but not used [-Wunused-but-set-variable]
    1172 |         unsigned int word, suffix;
         |                            ^~~~~~
   arch/powerpc/lib/sstep.c:1168:38: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
    1168 |         unsigned int opcode, ra, rb, rc, rd, spr, u;
         |                                      ^~


vim +/suffix +1172 arch/powerpc/lib/sstep.c

  1153	
  1154	/*
  1155	 * Decode an instruction, and return information about it in *op
  1156	 * without changing *regs.
  1157	 * Integer arithmetic and logical instructions, branches, and barrier
  1158	 * instructions can be emulated just using the information in *op.
  1159	 *
  1160	 * Return value is 1 if the instruction can be emulated just by
  1161	 * updating *regs with the information in *op, -1 if we need the
  1162	 * GPRs but *regs doesn't contain the full register set, or 0
  1163	 * otherwise.
  1164	 */
  1165	int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
  1166			  struct ppc_inst instr)
  1167	{
  1168		unsigned int opcode, ra, rb, rc, rd, spr, u;
  1169		unsigned long int imm;
  1170		unsigned long int val, val2;
  1171		unsigned int mb, me, sh;
> 1172		unsigned int word, suffix;
  1173		long ival;
  1174	
  1175		word = ppc_inst_val(instr);
  1176		suffix = ppc_inst_suffix(instr);
  1177	
  1178		op->type = COMPUTE;
  1179	
  1180		opcode = ppc_inst_primary_opcode(instr);
  1181		switch (opcode) {
  1182		case 16:	/* bc */
  1183			op->type = BRANCH;
  1184			imm = (signed short)(word & 0xfffc);
  1185			if ((word & 2) == 0)
  1186				imm += regs->nip;
  1187			op->val = truncate_if_32bit(regs->msr, imm);
  1188			if (word & 1)
  1189				op->type |= SETLK;
  1190			if (branch_taken(word, regs, op))
  1191				op->type |= BRTAKEN;
  1192			return 1;
  1193	#ifdef CONFIG_PPC64
  1194		case 17:	/* sc */
  1195			if ((word & 0xfe2) == 2)
  1196				op->type = SYSCALL;
  1197			else
  1198				op->type = UNKNOWN;
  1199			return 0;
  1200	#endif
  1201		case 18:	/* b */
  1202			op->type = BRANCH | BRTAKEN;
  1203			imm = word & 0x03fffffc;
  1204			if (imm & 0x02000000)
  1205				imm -= 0x04000000;
  1206			if ((word & 2) == 0)
  1207				imm += regs->nip;
  1208			op->val = truncate_if_32bit(regs->msr, imm);
  1209			if (word & 1)
  1210				op->type |= SETLK;
  1211			return 1;
  1212		case 19:
  1213			switch ((word >> 1) & 0x3ff) {
  1214			case 0:		/* mcrf */
  1215				op->type = COMPUTE + SETCC;
  1216				rd = 7 - ((word >> 23) & 0x7);
  1217				ra = 7 - ((word >> 18) & 0x7);
  1218				rd *= 4;
  1219				ra *= 4;
  1220				val = (regs->ccr >> ra) & 0xf;
  1221				op->ccval = (regs->ccr & ~(0xfUL << rd)) | (val << rd);
  1222				return 1;
  1223	
  1224			case 16:	/* bclr */
  1225			case 528:	/* bcctr */
  1226				op->type = BRANCH;
  1227				imm = (word & 0x400)? regs->ctr: regs->link;
  1228				op->val = truncate_if_32bit(regs->msr, imm);
  1229				if (word & 1)
  1230					op->type |= SETLK;
  1231				if (branch_taken(word, regs, op))
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
  1254				ra = (word >> 16) & 0x1f;
  1255				rb = (word >> 11) & 0x1f;
  1256				rd = (word >> 21) & 0x1f;
  1257				ra = (regs->ccr >> (31 - ra)) & 1;
  1258				rb = (regs->ccr >> (31 - rb)) & 1;
  1259				val = (word >> (6 + ra * 2 + rb)) & 1;
  1260				op->ccval = (regs->ccr & ~(1UL << (31 - rd))) |
  1261					(val << (31 - rd));
  1262				return 1;
  1263			}
  1264			break;
  1265		case 31:
  1266			switch ((word >> 1) & 0x3ff) {
  1267			case 598:	/* sync */
  1268				op->type = BARRIER + BARRIER_SYNC;
  1269	#ifdef __powerpc64__
  1270				switch ((word >> 21) & 3) {
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
  1292		rd = (word >> 21) & 0x1f;
  1293		ra = (word >> 16) & 0x1f;
  1294		rb = (word >> 11) & 0x1f;
  1295		rc = (word >> 6) & 0x1f;
  1296	
  1297		switch (opcode) {
  1298	#ifdef __powerpc64__
  1299		case 2:		/* tdi */
  1300			if (rd & trap_compare(regs->gpr[ra], (short) word))
  1301				goto trap;
  1302			return 1;
  1303	#endif
  1304		case 3:		/* twi */
  1305			if (rd & trap_compare((int)regs->gpr[ra], (short) word))
  1306				goto trap;
  1307			return 1;
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
