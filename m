Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B22197A68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252751; cv=none; b=EneWRDLZKKNmVpHAB4XyLPfpCLvid/EKo2+Y3M1gU2WWcA5APvANHbpcrTUoakPoctiBS+b4WyDN+uvit1ngmb3iVZyzzv8A7MxhCkwchJ/SOhC9HgAuLdDZ7NRCXmqPScZMPhag/h5c9ac4vULlq5XSKVqiGNa0fsI9emr8Pj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252751; c=relaxed/simple;
	bh=OGjA3IBCBYC3WIngvrsjtMQT4VqXBeAYuB14oq2VJ90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8AOOmOJrh+xXwjdA+wGlt/3dhWLQDsG5TeYG1/iZ0P+4laJB1w5wSyn8LuTEM3Qjase6LAEuK61tmnBQfvHDJgfVMzDUyjnXFlGju6NgZ89SGRS649qkmIV3BpOdxf5wf/6SgUqvXKeFPpugUZQtCby0QDtRLdYK4O9x8gn3WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBuT19bf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBuT19bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745252748; x=1776788748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OGjA3IBCBYC3WIngvrsjtMQT4VqXBeAYuB14oq2VJ90=;
  b=HBuT19bf/2J1cW+sjq8SfKS5AtHowc7t1WrWDaAbN0qbWJrsnnaoCq/L
   BP7T0dnbkVPwTRqVut4XM0eiq8jUUPczeg4pHExh+sycO4FEXM0zyTtaO
   bMZSEvOYIY+Xeg+V2YS7AdRIT+4QIPbab6qL+mbnzsAVZ/kc/bKfIfv9M
   1/5KKmIXEQR84lVtZOOjl9wJGSijuQOqu0Sd+mVTSLS+Io8MLQNEeU0do
   lsyNJZw9gpqrdZLg/Oy0VRbM+6qr5/shEtq1HVpr+sui2utygJQOlLURQ
   WtAWH8K1PKPgB06lUXvj7lQqvrMkayVANmp1HpX+eGh5LHNHe06vWvzNZ
   A==;
X-CSE-ConnectionGUID: +d1DF7QjTZy91jyKP0wuyw==
X-CSE-MsgGUID: MyQDVjiIRqi0/eac2wPjlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="45910608"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="45910608"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 09:25:47 -0700
X-CSE-ConnectionGUID: po6jkhI+RZmqgiP7YVBcmQ==
X-CSE-MsgGUID: LZbK8DIjQseIKL6hCxGmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="162816294"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Apr 2025 09:25:40 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6txi-0000EJ-29;
	Mon, 21 Apr 2025 16:25:38 +0000
Date: Tue, 22 Apr 2025 00:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Jiayuan Chen <mrpre@163.com>, Matan Shachnai <m.shachnai@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 06/11] bpf, arm64, powerpc: Change nospec to
 include v1 barrier
Message-ID: <202504220035.SoGveGpj-lkp@intel.com>
References: <20250421091802.3234859-7-luis.gerhorst@fau.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421091802.3234859-7-luis.gerhorst@fau.de>

Hi Luis,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8582d9ab3efdebb88e0cd8beed8e0b9de76443e7]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Gerhorst/selftests-bpf-Fix-caps-for-__xlated-jited_unpriv/20250421-175926
base:   8582d9ab3efdebb88e0cd8beed8e0b9de76443e7
patch link:    https://lore.kernel.org/r/20250421091802.3234859-7-luis.gerhorst%40fau.de
patch subject: [PATCH bpf-next v2 06/11] bpf, arm64, powerpc: Change nospec to include v1 barrier
config: powerpc64-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250422/202504220035.SoGveGpj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220035.SoGveGpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220035.SoGveGpj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/net/bpf_jit_comp64.c: In function 'bpf_jit_build_body':
>> arch/powerpc/net/bpf_jit_comp64.c:814:4: error: a label can only be part of a statement and a declaration is not a statement
     814 |    bool sync_emitted = false;
         |    ^~~~
>> arch/powerpc/net/bpf_jit_comp64.c:815:4: error: expected expression before 'bool'
     815 |    bool ori31_emitted = false;
         |    ^~~~
>> arch/powerpc/net/bpf_jit_comp64.c:833:6: error: 'ori31_emitted' undeclared (first use in this function)
     833 |      ori31_emitted = true;
         |      ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp64.c:833:6: note: each undeclared identifier is reported only once for each function it appears in


vim +814 arch/powerpc/net/bpf_jit_comp64.c

   404	
   405	/* Assemble the body code between the prologue & epilogue */
   406	int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
   407			       u32 *addrs, int pass, bool extra_pass)
   408	{
   409		enum stf_barrier_type stf_barrier = stf_barrier_type_get();
   410		const struct bpf_insn *insn = fp->insnsi;
   411		int flen = fp->len;
   412		int i, ret;
   413	
   414		/* Start of epilogue code - will only be valid 2nd pass onwards */
   415		u32 exit_addr = addrs[flen];
   416	
   417		for (i = 0; i < flen; i++) {
   418			u32 code = insn[i].code;
   419			u32 dst_reg = bpf_to_ppc(insn[i].dst_reg);
   420			u32 src_reg = bpf_to_ppc(insn[i].src_reg);
   421			u32 size = BPF_SIZE(code);
   422			u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
   423			u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
   424			u32 save_reg, ret_reg;
   425			s16 off = insn[i].off;
   426			s32 imm = insn[i].imm;
   427			bool func_addr_fixed;
   428			u64 func_addr;
   429			u64 imm64;
   430			u32 true_cond;
   431			u32 tmp_idx;
   432			int j;
   433	
   434			/*
   435			 * addrs[] maps a BPF bytecode address into a real offset from
   436			 * the start of the body code.
   437			 */
   438			addrs[i] = ctx->idx * 4;
   439	
   440			/*
   441			 * As an optimization, we note down which non-volatile registers
   442			 * are used so that we can only save/restore those in our
   443			 * prologue and epilogue. We do this here regardless of whether
   444			 * the actual BPF instruction uses src/dst registers or not
   445			 * (for instance, BPF_CALL does not use them). The expectation
   446			 * is that those instructions will have src_reg/dst_reg set to
   447			 * 0. Even otherwise, we just lose some prologue/epilogue
   448			 * optimization but everything else should work without
   449			 * any issues.
   450			 */
   451			if (dst_reg >= BPF_PPC_NVR_MIN && dst_reg < 32)
   452				bpf_set_seen_register(ctx, dst_reg);
   453			if (src_reg >= BPF_PPC_NVR_MIN && src_reg < 32)
   454				bpf_set_seen_register(ctx, src_reg);
   455	
   456			switch (code) {
   457			/*
   458			 * Arithmetic operations: ADD/SUB/MUL/DIV/MOD/NEG
   459			 */
   460			case BPF_ALU | BPF_ADD | BPF_X: /* (u32) dst += (u32) src */
   461			case BPF_ALU64 | BPF_ADD | BPF_X: /* dst += src */
   462				EMIT(PPC_RAW_ADD(dst_reg, dst_reg, src_reg));
   463				goto bpf_alu32_trunc;
   464			case BPF_ALU | BPF_SUB | BPF_X: /* (u32) dst -= (u32) src */
   465			case BPF_ALU64 | BPF_SUB | BPF_X: /* dst -= src */
   466				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, src_reg));
   467				goto bpf_alu32_trunc;
   468			case BPF_ALU | BPF_ADD | BPF_K: /* (u32) dst += (u32) imm */
   469			case BPF_ALU64 | BPF_ADD | BPF_K: /* dst += imm */
   470				if (!imm) {
   471					goto bpf_alu32_trunc;
   472				} else if (imm >= -32768 && imm < 32768) {
   473					EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
   474				} else {
   475					PPC_LI32(tmp1_reg, imm);
   476					EMIT(PPC_RAW_ADD(dst_reg, dst_reg, tmp1_reg));
   477				}
   478				goto bpf_alu32_trunc;
   479			case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -= (u32) imm */
   480			case BPF_ALU64 | BPF_SUB | BPF_K: /* dst -= imm */
   481				if (!imm) {
   482					goto bpf_alu32_trunc;
   483				} else if (imm > -32768 && imm <= 32768) {
   484					EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(-imm)));
   485				} else {
   486					PPC_LI32(tmp1_reg, imm);
   487					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
   488				}
   489				goto bpf_alu32_trunc;
   490			case BPF_ALU | BPF_MUL | BPF_X: /* (u32) dst *= (u32) src */
   491			case BPF_ALU64 | BPF_MUL | BPF_X: /* dst *= src */
   492				if (BPF_CLASS(code) == BPF_ALU)
   493					EMIT(PPC_RAW_MULW(dst_reg, dst_reg, src_reg));
   494				else
   495					EMIT(PPC_RAW_MULD(dst_reg, dst_reg, src_reg));
   496				goto bpf_alu32_trunc;
   497			case BPF_ALU | BPF_MUL | BPF_K: /* (u32) dst *= (u32) imm */
   498			case BPF_ALU64 | BPF_MUL | BPF_K: /* dst *= imm */
   499				if (imm >= -32768 && imm < 32768)
   500					EMIT(PPC_RAW_MULI(dst_reg, dst_reg, IMM_L(imm)));
   501				else {
   502					PPC_LI32(tmp1_reg, imm);
   503					if (BPF_CLASS(code) == BPF_ALU)
   504						EMIT(PPC_RAW_MULW(dst_reg, dst_reg, tmp1_reg));
   505					else
   506						EMIT(PPC_RAW_MULD(dst_reg, dst_reg, tmp1_reg));
   507				}
   508				goto bpf_alu32_trunc;
   509			case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
   510			case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
   511				if (BPF_OP(code) == BPF_MOD) {
   512					if (off)
   513						EMIT(PPC_RAW_DIVW(tmp1_reg, dst_reg, src_reg));
   514					else
   515						EMIT(PPC_RAW_DIVWU(tmp1_reg, dst_reg, src_reg));
   516	
   517					EMIT(PPC_RAW_MULW(tmp1_reg, src_reg, tmp1_reg));
   518					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
   519				} else
   520					if (off)
   521						EMIT(PPC_RAW_DIVW(dst_reg, dst_reg, src_reg));
   522					else
   523						EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, src_reg));
   524				goto bpf_alu32_trunc;
   525			case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
   526			case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
   527				if (BPF_OP(code) == BPF_MOD) {
   528					if (off)
   529						EMIT(PPC_RAW_DIVD(tmp1_reg, dst_reg, src_reg));
   530					else
   531						EMIT(PPC_RAW_DIVDU(tmp1_reg, dst_reg, src_reg));
   532					EMIT(PPC_RAW_MULD(tmp1_reg, src_reg, tmp1_reg));
   533					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
   534				} else
   535					if (off)
   536						EMIT(PPC_RAW_DIVD(dst_reg, dst_reg, src_reg));
   537					else
   538						EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, src_reg));
   539				break;
   540			case BPF_ALU | BPF_MOD | BPF_K: /* (u32) dst %= (u32) imm */
   541			case BPF_ALU | BPF_DIV | BPF_K: /* (u32) dst /= (u32) imm */
   542			case BPF_ALU64 | BPF_MOD | BPF_K: /* dst %= imm */
   543			case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /= imm */
   544				if (imm == 0)
   545					return -EINVAL;
   546				if (imm == 1) {
   547					if (BPF_OP(code) == BPF_DIV) {
   548						goto bpf_alu32_trunc;
   549					} else {
   550						EMIT(PPC_RAW_LI(dst_reg, 0));
   551						break;
   552					}
   553				}
   554	
   555				PPC_LI32(tmp1_reg, imm);
   556				switch (BPF_CLASS(code)) {
   557				case BPF_ALU:
   558					if (BPF_OP(code) == BPF_MOD) {
   559						if (off)
   560							EMIT(PPC_RAW_DIVW(tmp2_reg, dst_reg, tmp1_reg));
   561						else
   562							EMIT(PPC_RAW_DIVWU(tmp2_reg, dst_reg, tmp1_reg));
   563						EMIT(PPC_RAW_MULW(tmp1_reg, tmp1_reg, tmp2_reg));
   564						EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
   565					} else
   566						if (off)
   567							EMIT(PPC_RAW_DIVW(dst_reg, dst_reg, tmp1_reg));
   568						else
   569							EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, tmp1_reg));
   570					break;
   571				case BPF_ALU64:
   572					if (BPF_OP(code) == BPF_MOD) {
   573						if (off)
   574							EMIT(PPC_RAW_DIVD(tmp2_reg, dst_reg, tmp1_reg));
   575						else
   576							EMIT(PPC_RAW_DIVDU(tmp2_reg, dst_reg, tmp1_reg));
   577						EMIT(PPC_RAW_MULD(tmp1_reg, tmp1_reg, tmp2_reg));
   578						EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
   579					} else
   580						if (off)
   581							EMIT(PPC_RAW_DIVD(dst_reg, dst_reg, tmp1_reg));
   582						else
   583							EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, tmp1_reg));
   584					break;
   585				}
   586				goto bpf_alu32_trunc;
   587			case BPF_ALU | BPF_NEG: /* (u32) dst = -dst */
   588			case BPF_ALU64 | BPF_NEG: /* dst = -dst */
   589				EMIT(PPC_RAW_NEG(dst_reg, dst_reg));
   590				goto bpf_alu32_trunc;
   591	
   592			/*
   593			 * Logical operations: AND/OR/XOR/[A]LSH/[A]RSH
   594			 */
   595			case BPF_ALU | BPF_AND | BPF_X: /* (u32) dst = dst & src */
   596			case BPF_ALU64 | BPF_AND | BPF_X: /* dst = dst & src */
   597				EMIT(PPC_RAW_AND(dst_reg, dst_reg, src_reg));
   598				goto bpf_alu32_trunc;
   599			case BPF_ALU | BPF_AND | BPF_K: /* (u32) dst = dst & imm */
   600			case BPF_ALU64 | BPF_AND | BPF_K: /* dst = dst & imm */
   601				if (!IMM_H(imm))
   602					EMIT(PPC_RAW_ANDI(dst_reg, dst_reg, IMM_L(imm)));
   603				else {
   604					/* Sign-extended */
   605					PPC_LI32(tmp1_reg, imm);
   606					EMIT(PPC_RAW_AND(dst_reg, dst_reg, tmp1_reg));
   607				}
   608				goto bpf_alu32_trunc;
   609			case BPF_ALU | BPF_OR | BPF_X: /* dst = (u32) dst | (u32) src */
   610			case BPF_ALU64 | BPF_OR | BPF_X: /* dst = dst | src */
   611				EMIT(PPC_RAW_OR(dst_reg, dst_reg, src_reg));
   612				goto bpf_alu32_trunc;
   613			case BPF_ALU | BPF_OR | BPF_K:/* dst = (u32) dst | (u32) imm */
   614			case BPF_ALU64 | BPF_OR | BPF_K:/* dst = dst | imm */
   615				if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
   616					/* Sign-extended */
   617					PPC_LI32(tmp1_reg, imm);
   618					EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp1_reg));
   619				} else {
   620					if (IMM_L(imm))
   621						EMIT(PPC_RAW_ORI(dst_reg, dst_reg, IMM_L(imm)));
   622					if (IMM_H(imm))
   623						EMIT(PPC_RAW_ORIS(dst_reg, dst_reg, IMM_H(imm)));
   624				}
   625				goto bpf_alu32_trunc;
   626			case BPF_ALU | BPF_XOR | BPF_X: /* (u32) dst ^= src */
   627			case BPF_ALU64 | BPF_XOR | BPF_X: /* dst ^= src */
   628				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, src_reg));
   629				goto bpf_alu32_trunc;
   630			case BPF_ALU | BPF_XOR | BPF_K: /* (u32) dst ^= (u32) imm */
   631			case BPF_ALU64 | BPF_XOR | BPF_K: /* dst ^= imm */
   632				if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
   633					/* Sign-extended */
   634					PPC_LI32(tmp1_reg, imm);
   635					EMIT(PPC_RAW_XOR(dst_reg, dst_reg, tmp1_reg));
   636				} else {
   637					if (IMM_L(imm))
   638						EMIT(PPC_RAW_XORI(dst_reg, dst_reg, IMM_L(imm)));
   639					if (IMM_H(imm))
   640						EMIT(PPC_RAW_XORIS(dst_reg, dst_reg, IMM_H(imm)));
   641				}
   642				goto bpf_alu32_trunc;
   643			case BPF_ALU | BPF_LSH | BPF_X: /* (u32) dst <<= (u32) src */
   644				/* slw clears top 32 bits */
   645				EMIT(PPC_RAW_SLW(dst_reg, dst_reg, src_reg));
   646				/* skip zero extension move, but set address map. */
   647				if (insn_is_zext(&insn[i + 1]))
   648					addrs[++i] = ctx->idx * 4;
   649				break;
   650			case BPF_ALU64 | BPF_LSH | BPF_X: /* dst <<= src; */
   651				EMIT(PPC_RAW_SLD(dst_reg, dst_reg, src_reg));
   652				break;
   653			case BPF_ALU | BPF_LSH | BPF_K: /* (u32) dst <<== (u32) imm */
   654				/* with imm 0, we still need to clear top 32 bits */
   655				EMIT(PPC_RAW_SLWI(dst_reg, dst_reg, imm));
   656				if (insn_is_zext(&insn[i + 1]))
   657					addrs[++i] = ctx->idx * 4;
   658				break;
   659			case BPF_ALU64 | BPF_LSH | BPF_K: /* dst <<== imm */
   660				if (imm != 0)
   661					EMIT(PPC_RAW_SLDI(dst_reg, dst_reg, imm));
   662				break;
   663			case BPF_ALU | BPF_RSH | BPF_X: /* (u32) dst >>= (u32) src */
   664				EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
   665				if (insn_is_zext(&insn[i + 1]))
   666					addrs[++i] = ctx->idx * 4;
   667				break;
   668			case BPF_ALU64 | BPF_RSH | BPF_X: /* dst >>= src */
   669				EMIT(PPC_RAW_SRD(dst_reg, dst_reg, src_reg));
   670				break;
   671			case BPF_ALU | BPF_RSH | BPF_K: /* (u32) dst >>= (u32) imm */
   672				EMIT(PPC_RAW_SRWI(dst_reg, dst_reg, imm));
   673				if (insn_is_zext(&insn[i + 1]))
   674					addrs[++i] = ctx->idx * 4;
   675				break;
   676			case BPF_ALU64 | BPF_RSH | BPF_K: /* dst >>= imm */
   677				if (imm != 0)
   678					EMIT(PPC_RAW_SRDI(dst_reg, dst_reg, imm));
   679				break;
   680			case BPF_ALU | BPF_ARSH | BPF_X: /* (s32) dst >>= src */
   681				EMIT(PPC_RAW_SRAW(dst_reg, dst_reg, src_reg));
   682				goto bpf_alu32_trunc;
   683			case BPF_ALU64 | BPF_ARSH | BPF_X: /* (s64) dst >>= src */
   684				EMIT(PPC_RAW_SRAD(dst_reg, dst_reg, src_reg));
   685				break;
   686			case BPF_ALU | BPF_ARSH | BPF_K: /* (s32) dst >>= imm */
   687				EMIT(PPC_RAW_SRAWI(dst_reg, dst_reg, imm));
   688				goto bpf_alu32_trunc;
   689			case BPF_ALU64 | BPF_ARSH | BPF_K: /* (s64) dst >>= imm */
   690				if (imm != 0)
   691					EMIT(PPC_RAW_SRADI(dst_reg, dst_reg, imm));
   692				break;
   693	
   694			/*
   695			 * MOV
   696			 */
   697			case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
   698			case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
   699				if (imm == 1) {
   700					/* special mov32 for zext */
   701					EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
   702					break;
   703				} else if (off == 8) {
   704					EMIT(PPC_RAW_EXTSB(dst_reg, src_reg));
   705				} else if (off == 16) {
   706					EMIT(PPC_RAW_EXTSH(dst_reg, src_reg));
   707				} else if (off == 32) {
   708					EMIT(PPC_RAW_EXTSW(dst_reg, src_reg));
   709				} else if (dst_reg != src_reg)
   710					EMIT(PPC_RAW_MR(dst_reg, src_reg));
   711				goto bpf_alu32_trunc;
   712			case BPF_ALU | BPF_MOV | BPF_K: /* (u32) dst = imm */
   713			case BPF_ALU64 | BPF_MOV | BPF_K: /* dst = (s64) imm */
   714				PPC_LI32(dst_reg, imm);
   715				if (imm < 0)
   716					goto bpf_alu32_trunc;
   717				else if (insn_is_zext(&insn[i + 1]))
   718					addrs[++i] = ctx->idx * 4;
   719				break;
   720	
   721	bpf_alu32_trunc:
   722			/* Truncate to 32-bits */
   723			if (BPF_CLASS(code) == BPF_ALU && !fp->aux->verifier_zext)
   724				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
   725			break;
   726	
   727			/*
   728			 * BPF_FROM_BE/LE
   729			 */
   730			case BPF_ALU | BPF_END | BPF_FROM_LE:
   731			case BPF_ALU | BPF_END | BPF_FROM_BE:
   732			case BPF_ALU64 | BPF_END | BPF_FROM_LE:
   733	#ifdef __BIG_ENDIAN__
   734				if (BPF_SRC(code) == BPF_FROM_BE)
   735					goto emit_clear;
   736	#else /* !__BIG_ENDIAN__ */
   737				if (BPF_CLASS(code) == BPF_ALU && BPF_SRC(code) == BPF_FROM_LE)
   738					goto emit_clear;
   739	#endif
   740				switch (imm) {
   741				case 16:
   742					/* Rotate 8 bits left & mask with 0x0000ff00 */
   743					EMIT(PPC_RAW_RLWINM(tmp1_reg, dst_reg, 8, 16, 23));
   744					/* Rotate 8 bits right & insert LSB to reg */
   745					EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 24, 31));
   746					/* Move result back to dst_reg */
   747					EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
   748					break;
   749				case 32:
   750					/*
   751					 * Rotate word left by 8 bits:
   752					 * 2 bytes are already in their final position
   753					 * -- byte 2 and 4 (of bytes 1, 2, 3 and 4)
   754					 */
   755					EMIT(PPC_RAW_RLWINM(tmp1_reg, dst_reg, 8, 0, 31));
   756					/* Rotate 24 bits and insert byte 1 */
   757					EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 0, 7));
   758					/* Rotate 24 bits and insert byte 3 */
   759					EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 16, 23));
   760					EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
   761					break;
   762				case 64:
   763					/* Store the value to stack and then use byte-reverse loads */
   764					EMIT(PPC_RAW_STD(dst_reg, _R1, bpf_jit_stack_local(ctx)));
   765					EMIT(PPC_RAW_ADDI(tmp1_reg, _R1, bpf_jit_stack_local(ctx)));
   766					if (cpu_has_feature(CPU_FTR_ARCH_206)) {
   767						EMIT(PPC_RAW_LDBRX(dst_reg, 0, tmp1_reg));
   768					} else {
   769						EMIT(PPC_RAW_LWBRX(dst_reg, 0, tmp1_reg));
   770						if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
   771							EMIT(PPC_RAW_SLDI(dst_reg, dst_reg, 32));
   772						EMIT(PPC_RAW_LI(tmp2_reg, 4));
   773						EMIT(PPC_RAW_LWBRX(tmp2_reg, tmp2_reg, tmp1_reg));
   774						if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
   775							EMIT(PPC_RAW_SLDI(tmp2_reg, tmp2_reg, 32));
   776						EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp2_reg));
   777					}
   778					break;
   779				}
   780				break;
   781	
   782	emit_clear:
   783				switch (imm) {
   784				case 16:
   785					/* zero-extend 16 bits into 64 bits */
   786					EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 48));
   787					if (insn_is_zext(&insn[i + 1]))
   788						addrs[++i] = ctx->idx * 4;
   789					break;
   790				case 32:
   791					if (!fp->aux->verifier_zext)
   792						/* zero-extend 32 bits into 64 bits */
   793						EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 32));
   794					break;
   795				case 64:
   796					/* nop */
   797					break;
   798				}
   799				break;
   800	
   801			/*
   802			 * BPF_ST NOSPEC (speculation barrier)
   803			 *
   804			 * The following must act as a barrier against both Spectre v1
   805			 * and v4 if we requested both mitigations. Therefore, also emit
   806			 * 'isync; sync' on E500 or 'ori31' on BOOK3S_64 in addition to
   807			 * the insns needed for a Spectre v4 barrier.
   808			 *
   809			 * If we requested only !bypass_spec_v1 OR only !bypass_spec_v4,
   810			 * we can skip the respective other barrier type as an
   811			 * optimization.
   812			 */
   813			case BPF_ST | BPF_NOSPEC:
 > 814				bool sync_emitted = false;
 > 815				bool ori31_emitted = false;
   816	#ifdef CONFIG_PPC_E500
   817				if (!bpf_jit_bypass_spec_v1()) {
   818					EMIT(PPC_RAW_ISYNC());
   819					EMIT(PPC_RAW_SYNC());
   820					sync_emitted = true;
   821				}
   822	#endif
   823				if (!bpf_jit_bypass_spec_v4()) {
   824					switch (stf_barrier) {
   825					case STF_BARRIER_EIEIO:
   826						EMIT(PPC_RAW_EIEIO() | 0x02000000);
   827						break;
   828					case STF_BARRIER_SYNC_ORI:
   829						if (!sync_emitted)
   830							EMIT(PPC_RAW_SYNC());
   831						EMIT(PPC_RAW_LD(tmp1_reg, _R13, 0));
   832						EMIT(PPC_RAW_ORI(_R31, _R31, 0));
 > 833						ori31_emitted = true;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
