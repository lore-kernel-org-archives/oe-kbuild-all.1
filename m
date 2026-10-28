Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217833;
	b=IPWqUeTpU9krnYG9nM0ffzWEL4wXkeSfjH8OwgbjR/jHatwvWG/mWZ3enxwxbx4HI7hl
	 F+k+l0PtKTQUFnwJcHeHIx/++6Z/zft8zoruHc0NvfSvAnDCdHnahrUembi7ybMAEvszJ
	 NE2nTodb6E+/Pi8nhEO+98Mla6au08C0R+0uC5zqHeafxfdsmtKSiNOaxw1rPQb+gFauk
	 zejId9t2uRqWXxDjWENtGMLbL1HWRMhco9LbPjIdxldcXOUA6YM26gSRwYwPNZ3ht1tJt
	 LTDCJl5g7MCcIbUWK9sWA9TC+tgbo5kKdkFEVTIEha0weHeJHsb9qXehxk1AD0yCBvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217833;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o9HySPFa8L1+i3e+Wx7Q/DlVhmmb6GGX7c9KKx8dcIQ=;
	b=pMOH1JbGBTccxctwGXwJmcSs8UvUh7PMFfnOa8cLorYXemGGdW0z/kvBVUb3bVJgLWjw
	 OWgw9xMYvriZlgH+swi+xaJfhUt1X/YKUAGUkuPrrOG0w9nbg2vkeqn6YMgct15d2akYi
	 pi3pNhcyKE2ipPzZNKQofuCswg88FL4KDpQagGyRWOkKGVu3orDbmDzaKs3yQfCnwATZG
	 0hya+ystWhvSVsvuhCDeRmTisWrWoarmO0Lw+RTCY8laLVjbyxFiSQIk5/oYd1zqsDyWB
	 3TuDwbotvQF1aTyEpxIq1hJd96YxLN7SwfGhWt8VqGwQTWlQEDOyPrqer0YDOQo4+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LbJIRCQc;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE4E606A31D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 20:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE4E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LbJIRCQc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793217832; x=1824753832;
  h=date:from:to:cc:subject:message-id;
  bh=d8+LodBk1GCCOwj6A3+4STCB4vLjLuJKr9hDs8nngoM=;
  b=LbJIRCQcjL6vS/0o+elRlew2iFwO1I6AT/bidsT50ml+6qYiLx+s4YCS
   X1Jt5whlXy5m9G6FEzocpaNfGd2zeTU//raaQFv3MeVckPoweCnNZdRuq
   lKDmCY+rwHRpQgHWAUQAJKCaD4SABQp0OyQWTjnnEGaTqlOJvrVxIH9aj
   7RGvJVu70wdcr4bZH/rviIurFv+lNNHRS3+G+8YJnQUcHY0q0LkLNtwNw
   8H0GLByrHVqaMHhMgZBVZISVpEluj1wwPloNrnxkl3JHUx24sTvwCh5wS
   TCBYEQlEQnwd5RDuWkmZddBqG2XkMH79awTxiekT/Vonm2QWer6yi5Xcv
   Q==;
X-CSE-ConnectionGUID: ZqFevC5yTHa4lccg0gACnw==
X-CSE-MsgGUID: jvbHjMY8QuSBrsBt5KFSFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2046504"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="2046504"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 13:03:52 -0700
X-CSE-ConnectionGUID: IMGNJTsJSYyBpj0ktjyeig==
X-CSE-MsgGUID: khQp+6yJR+m5jjwKyK0Urg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5026726"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2026 13:03:50 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM9sB-000000004yB-405W;
	Wed, 28 Oct 2026 20:03:47 +0000
Date: Wed, 28 Oct 2026 21:03:32 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 3/29]
 arch/s390/net/bpf_jit_comp.c:649:42: error: 'struct bpf_prog_aux' has no
 member named 'exception_boundary'
Message-ID: <202610282018.wVaIICD7-lkp@intel.com>
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
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261028/202610282018.wVaIICD7-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282018.wVaIICD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282018.wVaIICD7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/net/bpf_jit_comp.c: In function 'bpf_jit_prologue':
>> arch/s390/net/bpf_jit_comp.c:649:42: error: 'struct bpf_prog_aux' has no member named 'exception_boundary'
     649 |                                   fp->aux->exception_boundary ? NVREGS : 0);
         |                                          ^~


vim +649 arch/s390/net/bpf_jit_comp.c

f1d5df84cd8c3ec Ilya Leoshkevich        2023-01-29  603  
054623105728b06 Michael Holzheu         2015-04-01  604  /*
054623105728b06 Michael Holzheu         2015-04-01  605   * Emit function prologue
054623105728b06 Michael Holzheu         2015-04-01  606   *
054623105728b06 Michael Holzheu         2015-04-01  607   * Save registers and create stack frame if necessary.
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  608   * Stack frame layout is described by struct prog_frame.
054623105728b06 Michael Holzheu         2015-04-01  609   */
b2268d550d20ff8 Ilya Leoshkevich        2025-06-24  610  static void bpf_jit_prologue(struct bpf_jit *jit, struct bpf_prog *fp)
054623105728b06 Michael Holzheu         2015-04-01  611  {
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  612  	BUILD_BUG_ON(sizeof(struct prog_frame) != STACK_FRAME_OVERHEAD);
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  613  
227b4e108adcc4e Heiko Carstens          2026-07-27  614  	emit_kcfi(bpf_is_subprog(fp) ? cfi_bpf_subprog_hash : cfi_bpf_hash, jit);
227b4e108adcc4e Heiko Carstens          2026-07-27  615  
f1d5df84cd8c3ec Ilya Leoshkevich        2023-01-29  616  	/* No-op for hotpatching */
f1d5df84cd8c3ec Ilya Leoshkevich        2023-01-29  617  	/* brcl 0,prologue_plt */
f1d5df84cd8c3ec Ilya Leoshkevich        2023-01-29  618  	EMIT6_PCREL_RILC(0xc0040000, 0, jit->prologue_plt);
f1d5df84cd8c3ec Ilya Leoshkevich        2023-01-29  619  	jit->prologue_plt_ret = jit->prg;
f1d5df84cd8c3ec Ilya Leoshkevich        2023-01-29  620  
9af27da6313c8f8 Kumar Kartikeya Dwivedi 2023-09-13  621  	if (!bpf_is_subprog(fp)) {
dd691e847d28ac5 Ilya Leoshkevich        2023-01-29  622  		/* Initialize the tail call counter in the main program. */
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  623  		/* xc tail_call_cnt(4,%r15),tail_call_cnt(%r15) */
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  624  		_EMIT6(0xd703f000 | offsetof(struct prog_frame, tail_call_cnt),
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  625  		       0xf000 | offsetof(struct prog_frame, tail_call_cnt));
6651ee070b3124f Michael Holzheu         2015-06-08  626  	} else {
94ad428df53688a Ilya Leoshkevich        2020-07-17  627  		/*
dd691e847d28ac5 Ilya Leoshkevich        2023-01-29  628  		 * Skip the tail call counter initialization in subprograms.
dd691e847d28ac5 Ilya Leoshkevich        2023-01-29  629  		 * Insert nops in order to have tail_call_start at a
dd691e847d28ac5 Ilya Leoshkevich        2023-01-29  630  		 * predictable offset.
94ad428df53688a Ilya Leoshkevich        2020-07-17  631  		 */
94ad428df53688a Ilya Leoshkevich        2020-07-17  632  		bpf_skip(jit, 6);
6651ee070b3124f Michael Holzheu         2015-06-08  633  	}
6651ee070b3124f Michael Holzheu         2015-06-08  634  	/* Tail calls have to skip above initialization */
227b4e108adcc4e Heiko Carstens          2026-07-27  635  	jit->tail_call_start = jit->prg - cfi_get_offset();
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  636  	if (fp->aux->exception_cb) {
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  637  		/*
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  638  		 * Switch stack, the new address is in the 2nd parameter.
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  639  		 *
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  640  		 * Arrange the restoration of %r6-%r15 in the epilogue.
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  641  		 * Do not restore them now, the prog does not need them.
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  642  		 */
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  643  		/* lgr %r15,%r3 */
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  644  		EMIT4(0xb9040000, REG_15, REG_3);
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  645  		jit->seen_regs |= NVREGS;
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  646  	} else {
054623105728b06 Michael Holzheu         2015-04-01  647  		/* Save registers */
b2268d550d20ff8 Ilya Leoshkevich        2025-06-24  648  		save_restore_regs(jit, REGS_SAVE,
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03 @649  				  fp->aux->exception_boundary ? NVREGS : 0);
fa7bd4b000a7ae3 Ilya Leoshkevich        2024-07-03  650  	}
c10302efe569bfd Martin Schwidefsky      2012-07-31  651  	/* Setup literal pool */
fcf35131396ace1 Ilya Leoshkevich        2019-11-14  652  	if (is_first_pass(jit) || (jit->seen & SEEN_LITERAL)) {
c1aff5682da2977 Ilya Leoshkevich        2019-11-18  653  		if (!is_first_pass(jit) &&
c1aff5682da2977 Ilya Leoshkevich        2019-11-18  654  		    is_valid_ldisp(jit->size - (jit->prg + 2))) {
c1aff5682da2977 Ilya Leoshkevich        2019-11-18  655  			/* basr %l,0 */
054623105728b06 Michael Holzheu         2015-04-01  656  			EMIT2(0x0d00, REG_L, REG_0);
c10302efe569bfd Martin Schwidefsky      2012-07-31  657  			jit->base_ip = jit->prg;
c1aff5682da2977 Ilya Leoshkevich        2019-11-18  658  		} else {
c1aff5682da2977 Ilya Leoshkevich        2019-11-18  659  			/* larl %l,lit32_start */
c1aff5682da2977 Ilya Leoshkevich        2019-11-18  660  			EMIT6_PCREL_RILB(0xc0000000, REG_L, jit->lit32_start);
c1aff5682da2977 Ilya Leoshkevich        2019-11-18  661  			jit->base_ip = jit->lit32_start;
c1aff5682da2977 Ilya Leoshkevich        2019-11-18  662  		}
c10302efe569bfd Martin Schwidefsky      2012-07-31  663  	}
054623105728b06 Michael Holzheu         2015-04-01  664  	/* Setup stack and backchain */
fcf35131396ace1 Ilya Leoshkevich        2019-11-14  665  	if (is_first_pass(jit) || (jit->seen & SEEN_STACK)) {
88aeca15d637c27 Michael Holzheu         2015-06-01  666  		/* lgr %w1,%r15 (backchain) */
88aeca15d637c27 Michael Holzheu         2015-06-01  667  		EMIT4(0xb9040000, REG_W1, REG_15);
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  668  		/* la %bfp,unused_end(%r15) (BPF frame pointer) */
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  669  		EMIT4_DISP(0x41000000, BPF_REG_FP, REG_15,
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  670  			   offsetofend(struct prog_frame, unused));
b2268d550d20ff8 Ilya Leoshkevich        2025-06-24  671  		/* aghi %r15,-frame_off */
b2268d550d20ff8 Ilya Leoshkevich        2025-06-24  672  		EMIT4_IMM(0xa70b0000, REG_15, -jit->frame_off);
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  673  		/* stg %w1,backchain(%r15) */
88aeca15d637c27 Michael Holzheu         2015-06-01  674  		EMIT6_DISP_LH(0xe3000000, 0x0024, REG_W1, REG_0,
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  675  			      REG_15,
e26d523edf2a62b Ilya Leoshkevich        2025-06-24  676  			      offsetof(struct prog_frame, backchain));
054623105728b06 Michael Holzheu         2015-04-01  677  	}
6d59b7dbf72ed20 Daniel Borkmann         2017-12-14  678  }
c10302efe569bfd Martin Schwidefsky      2012-07-31  679  

:::::: The code at line 649 was first introduced by commit
:::::: fa7bd4b000a7ae32eb6fc049125943561e5b46f3 s390/bpf: Implement exceptions

:::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
