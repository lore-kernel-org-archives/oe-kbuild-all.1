Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240483;
	b=S5Es0R25mtp3oEPqEwnBBDpuPx9zPKaHsTKNgheHTgtwTeOH1K2382mAYy/ul+6KtR5C
	 uPuJwcFT5L0PvPgtPyTa90+1o7RN0+rJZG8o9GWeU+9mYV0SOSgQpqc0KRIiKAa3Uu89V
	 +zmsbAIdL7CMs1dutLRNlN4h/j5ZOABvFvDy0u7ZwxyBeygjqqWK8i2GO9NPjv4IRbLo1
	 QugmQHgJ+KZkTFsOADiF5WY3iXvaF90yWY0qMJu8GMuuO/quOnuGouKgap+1dV1F+YCmL
	 xs8bjh1vElJxolEtuxubA8YlIDR4o10EQfbTCvtxcqiPg6dnCR9rY6f7E7oJDKydxoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240483;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4n5SYWljsfHg2yfJ+u4z/LrBOlfPceBDthittcfENSk=;
	b=Hndom5mIulPi0SqFnGcfPmvvgbMmwMDOh514fWmQrFwYinZT2fLqXGGh34y75hgQ5Lnr
	 CGcDLvCS0TDuZnjWpUsLM2S0e8dDscNCXYlmuKrBX81oaFMcsativvmw3Seg/vKRzyF26
	 N6bxEjD1fa0NBHpVGmhx6jqqxmNJ4SzA2w7GZ4C3bKlctgywFQNdeI5BBoJjXSxivjmee
	 JTzzt/MAK+R4vMAu5qjlmOKTOiv/11T5fukV+PZFrxim0wBfharBvIaldXfRBirfTWCql
	 eNldIh5h255wgWV0FIviPW7qBJr7UHJJqaXIp36TRsaZW06SiFOtcn1rgJ/pECjFApw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PAlgb+Nk;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E201606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 02:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E201606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PAlgb+Nk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793240481; x=1824776481;
  h=date:from:to:cc:subject:message-id;
  bh=Fk7SMKenelRAxwnX6JRmhYMzCufCCl34K27kRyHm+u0=;
  b=PAlgb+NkU7LyoDptR9o1AuVZrw+G0IrYaCOZzMFY29LwhOtTCWgJRGXo
   lGJuYpFB2XdGtHzB60/Iy0HlJUwZbZoTuTZMNTu649bDrcIXXjnu8w49R
   4+52gFruTwr386hhEYivu7hLln+QxWu6BlK3AuZbwIE/Tt6MTCTAokMlf
   Zh1ljCn2S4Fi7zElkxYJG+lOGIpAJiZYw1+M976S+gSUkc71/kN/yUuoP
   Y6af4I8tjzWOIWGIqDGe3awVxAAMPQLPPgnSHw1yBpAJNjtrCEx4zZNKI
   IreqnRkxSneEYlgm+y2BT891v2G4+ry8g2PgOawNstzms1FC8HsYBezU5
   w==;
X-CSE-ConnectionGUID: LtBnZ3UOTEODbjNcOShXWA==
X-CSE-MsgGUID: Yl5uLFMNS4Cr6n6JPgcByg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991774"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1991774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:21:20 -0700
X-CSE-ConnectionGUID: rlGqCr5QTHOcmV2lGZVBcA==
X-CSE-MsgGUID: FVgBKta3T365aehJR8O0cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5364134"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2026 19:21:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMFlV-00000000575-1Gxs;
	Thu, 29 Oct 2026 02:21:17 +0000
Date: Thu, 29 Oct 2026 03:20:21 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 3/29]
 arch/s390/net/bpf_jit_comp.c:649:16: error: no member named
 'exception_boundary' in 'struct bpf_prog_aux'
Message-ID: <202610290313.euXk0BQ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations
head:   d085b61bdd9ef20d93fc010b4f0092f65b869e5a
commit: b1cc125c910e54e5242ef9babf1d05e267c5ebf3 [3/29] bpf: Remove exception_boundary, which nothing reads any more
config: s390-randconfig-r2303-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290313.euXk0BQ0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290313.euXk0BQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290313.euXk0BQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/net/bpf_jit_comp.c:649:16: error: no member named 'exception_boundary' in 'struct bpf_prog_aux'
     649 |                                   fp->aux->exception_boundary ? NVREGS : 0);
         |                                   ~~~~~~~  ^
   1 error generated.


vim +649 arch/s390/net/bpf_jit_comp.c

f1d5df84cd8c3e Ilya Leoshkevich        2023-01-29  603  
054623105728b0 Michael Holzheu         2015-04-01  604  /*
054623105728b0 Michael Holzheu         2015-04-01  605   * Emit function prologue
054623105728b0 Michael Holzheu         2015-04-01  606   *
054623105728b0 Michael Holzheu         2015-04-01  607   * Save registers and create stack frame if necessary.
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  608   * Stack frame layout is described by struct prog_frame.
054623105728b0 Michael Holzheu         2015-04-01  609   */
b2268d550d20ff Ilya Leoshkevich        2025-06-24  610  static void bpf_jit_prologue(struct bpf_jit *jit, struct bpf_prog *fp)
054623105728b0 Michael Holzheu         2015-04-01  611  {
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  612  	BUILD_BUG_ON(sizeof(struct prog_frame) != STACK_FRAME_OVERHEAD);
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  613  
227b4e108adcc4 Heiko Carstens          2026-07-27  614  	emit_kcfi(bpf_is_subprog(fp) ? cfi_bpf_subprog_hash : cfi_bpf_hash, jit);
227b4e108adcc4 Heiko Carstens          2026-07-27  615  
f1d5df84cd8c3e Ilya Leoshkevich        2023-01-29  616  	/* No-op for hotpatching */
f1d5df84cd8c3e Ilya Leoshkevich        2023-01-29  617  	/* brcl 0,prologue_plt */
f1d5df84cd8c3e Ilya Leoshkevich        2023-01-29  618  	EMIT6_PCREL_RILC(0xc0040000, 0, jit->prologue_plt);
f1d5df84cd8c3e Ilya Leoshkevich        2023-01-29  619  	jit->prologue_plt_ret = jit->prg;
f1d5df84cd8c3e Ilya Leoshkevich        2023-01-29  620  
9af27da6313c8f Kumar Kartikeya Dwivedi 2023-09-13  621  	if (!bpf_is_subprog(fp)) {
dd691e847d28ac Ilya Leoshkevich        2023-01-29  622  		/* Initialize the tail call counter in the main program. */
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  623  		/* xc tail_call_cnt(4,%r15),tail_call_cnt(%r15) */
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  624  		_EMIT6(0xd703f000 | offsetof(struct prog_frame, tail_call_cnt),
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  625  		       0xf000 | offsetof(struct prog_frame, tail_call_cnt));
6651ee070b3124 Michael Holzheu         2015-06-08  626  	} else {
94ad428df53688 Ilya Leoshkevich        2020-07-17  627  		/*
dd691e847d28ac Ilya Leoshkevich        2023-01-29  628  		 * Skip the tail call counter initialization in subprograms.
dd691e847d28ac Ilya Leoshkevich        2023-01-29  629  		 * Insert nops in order to have tail_call_start at a
dd691e847d28ac Ilya Leoshkevich        2023-01-29  630  		 * predictable offset.
94ad428df53688 Ilya Leoshkevich        2020-07-17  631  		 */
94ad428df53688 Ilya Leoshkevich        2020-07-17  632  		bpf_skip(jit, 6);
6651ee070b3124 Michael Holzheu         2015-06-08  633  	}
6651ee070b3124 Michael Holzheu         2015-06-08  634  	/* Tail calls have to skip above initialization */
227b4e108adcc4 Heiko Carstens          2026-07-27  635  	jit->tail_call_start = jit->prg - cfi_get_offset();
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  636  	if (fp->aux->exception_cb) {
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  637  		/*
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  638  		 * Switch stack, the new address is in the 2nd parameter.
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  639  		 *
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  640  		 * Arrange the restoration of %r6-%r15 in the epilogue.
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  641  		 * Do not restore them now, the prog does not need them.
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  642  		 */
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  643  		/* lgr %r15,%r3 */
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  644  		EMIT4(0xb9040000, REG_15, REG_3);
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  645  		jit->seen_regs |= NVREGS;
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  646  	} else {
054623105728b0 Michael Holzheu         2015-04-01  647  		/* Save registers */
b2268d550d20ff Ilya Leoshkevich        2025-06-24  648  		save_restore_regs(jit, REGS_SAVE,
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03 @649  				  fp->aux->exception_boundary ? NVREGS : 0);
fa7bd4b000a7ae Ilya Leoshkevich        2024-07-03  650  	}
c10302efe569bf Martin Schwidefsky      2012-07-31  651  	/* Setup literal pool */
fcf35131396ace Ilya Leoshkevich        2019-11-14  652  	if (is_first_pass(jit) || (jit->seen & SEEN_LITERAL)) {
c1aff5682da297 Ilya Leoshkevich        2019-11-18  653  		if (!is_first_pass(jit) &&
c1aff5682da297 Ilya Leoshkevich        2019-11-18  654  		    is_valid_ldisp(jit->size - (jit->prg + 2))) {
c1aff5682da297 Ilya Leoshkevich        2019-11-18  655  			/* basr %l,0 */
054623105728b0 Michael Holzheu         2015-04-01  656  			EMIT2(0x0d00, REG_L, REG_0);
c10302efe569bf Martin Schwidefsky      2012-07-31  657  			jit->base_ip = jit->prg;
c1aff5682da297 Ilya Leoshkevich        2019-11-18  658  		} else {
c1aff5682da297 Ilya Leoshkevich        2019-11-18  659  			/* larl %l,lit32_start */
c1aff5682da297 Ilya Leoshkevich        2019-11-18  660  			EMIT6_PCREL_RILB(0xc0000000, REG_L, jit->lit32_start);
c1aff5682da297 Ilya Leoshkevich        2019-11-18  661  			jit->base_ip = jit->lit32_start;
c1aff5682da297 Ilya Leoshkevich        2019-11-18  662  		}
c10302efe569bf Martin Schwidefsky      2012-07-31  663  	}
054623105728b0 Michael Holzheu         2015-04-01  664  	/* Setup stack and backchain */
fcf35131396ace Ilya Leoshkevich        2019-11-14  665  	if (is_first_pass(jit) || (jit->seen & SEEN_STACK)) {
88aeca15d637c2 Michael Holzheu         2015-06-01  666  		/* lgr %w1,%r15 (backchain) */
88aeca15d637c2 Michael Holzheu         2015-06-01  667  		EMIT4(0xb9040000, REG_W1, REG_15);
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  668  		/* la %bfp,unused_end(%r15) (BPF frame pointer) */
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  669  		EMIT4_DISP(0x41000000, BPF_REG_FP, REG_15,
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  670  			   offsetofend(struct prog_frame, unused));
b2268d550d20ff Ilya Leoshkevich        2025-06-24  671  		/* aghi %r15,-frame_off */
b2268d550d20ff Ilya Leoshkevich        2025-06-24  672  		EMIT4_IMM(0xa70b0000, REG_15, -jit->frame_off);
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  673  		/* stg %w1,backchain(%r15) */
88aeca15d637c2 Michael Holzheu         2015-06-01  674  		EMIT6_DISP_LH(0xe3000000, 0x0024, REG_W1, REG_0,
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  675  			      REG_15,
e26d523edf2a62 Ilya Leoshkevich        2025-06-24  676  			      offsetof(struct prog_frame, backchain));
054623105728b0 Michael Holzheu         2015-04-01  677  	}
6d59b7dbf72ed2 Daniel Borkmann         2017-12-14  678  }
c10302efe569bf Martin Schwidefsky      2012-07-31  679  

:::::: The code at line 649 was first introduced by commit
:::::: fa7bd4b000a7ae32eb6fc049125943561e5b46f3 s390/bpf: Implement exceptions

:::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
