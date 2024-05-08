Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94443364
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 00:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715127901; cv=none; b=Jh4j0V4MYNuyOvHJiO1DYGjWmwXO33wxcWV2L4sUQ6jLSqAz8jnMNG3y2hmDp2lKrVSO/73ls9ATeo6q2GhmZ9laFNyuouzAn47ZVQlhDT1ISNDvnin+CWl9vuXlAjmt9QMBG9oj8WteGMtEyuhSKYdVs4u2ZyPMtPwtqq9GMXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715127901; c=relaxed/simple;
	bh=JHraJgFDi8n5simWn5u27iBV6ClauUVARB5Qwck4JfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/kHof64MlIdOPmbVnrWH831HNy+xVG6CHXbpE68vF5U7RJiWm/TwxeO7EfML+LmGKu2h6Wzkj03MAgPukZev45KRHYZSHPgG5nsb9Pqyxw/+Ps/va3p+4JgxlYhUMJSkZSWaKvGMgrMP6L9s2R5AgGPueaISvTW15J3pvgufFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsL2kPqb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsL2kPqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715127899; x=1746663899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JHraJgFDi8n5simWn5u27iBV6ClauUVARB5Qwck4JfM=;
  b=YsL2kPqbokEl9SStLiO3FhE+P6wTPnXQglKdoVEqXxYn4RURk8r28rau
   BnmDvPkqplNl3i6d2FqdnMRvoTr4StVqD6s9wkCRgiutF+zaUKFG85yLI
   9AWE+Hb0Gvk/5xxhNpzgE+ktXAPked3CGE1klP31CdeQgMOWoys8lthzj
   ImqwQq6YtKFvobWWl1ItIJei/j5MsLEso71LbkAxEtGyci8ezNR+L/167
   hapQ2YiHWKjpjYN1xJeNB03L3lb2tomrG1URAZtFco6YH+bkD6MdRbHRZ
   uhmKOlw/kfUEHmZKmXLTOxW7yPtJt0k/FU0OakijswAeDVAFF+kWBMBEJ
   g==;
X-CSE-ConnectionGUID: faeN1GxJQJe/U9ybqTt8Ew==
X-CSE-MsgGUID: /E+5a8IsSQWPO7cpZ1KuKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36340064"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="36340064"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 17:24:58 -0700
X-CSE-ConnectionGUID: yONUkNosTVWYKdfnIR5dlQ==
X-CSE-MsgGUID: WCNO9QXZSQ6mC5OUYPBy2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="28678196"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2024 17:24:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4V78-0002mK-0P;
	Wed, 08 May 2024 00:24:54 +0000
Date: Wed, 8 May 2024 08:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 2552/11707] kernel/bpf/verifier.c:20086:85:
 error: 'pcpu_hot' undeclared
Message-ID: <202405080801.QqazYmz6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   93a39e4766083050ca0ecd6a3548093a3b9eb60c
commit: 1ae6921009e5d72787e07ccc04754514ccf6bc99 [2552/11707] bpf: inline bpf_get_smp_processor_id() helper
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240508/202405080801.QqazYmz6-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080801.QqazYmz6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080801.QqazYmz6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpf_verifier.h:9,
                    from kernel/bpf/verifier.c:13:
   kernel/bpf/verifier.c: In function 'do_misc_fixups':
>> kernel/bpf/verifier.c:20086:85: error: 'pcpu_hot' undeclared (first use in this function)
   20086 |                         insn_buf[0] = BPF_MOV32_IMM(BPF_REG_0, (u32)(unsigned long)&pcpu_hot.cpu_number);
         |                                                                                     ^~~~~~~~
   include/linux/filter.h:216:26: note: in definition of macro 'BPF_MOV32_IMM'
     216 |                 .imm   = IMM })
         |                          ^~~
   kernel/bpf/verifier.c:20086:85: note: each undeclared identifier is reported only once for each function it appears in
   20086 |                         insn_buf[0] = BPF_MOV32_IMM(BPF_REG_0, (u32)(unsigned long)&pcpu_hot.cpu_number);
         |                                                                                     ^~~~~~~~
   include/linux/filter.h:216:26: note: in definition of macro 'BPF_MOV32_IMM'
     216 |                 .imm   = IMM })
         |                          ^~~


vim +/pcpu_hot +20086 kernel/bpf/verifier.c

 19589	
 19590	/* Do various post-verification rewrites in a single program pass.
 19591	 * These rewrites simplify JIT and interpreter implementations.
 19592	 */
 19593	static int do_misc_fixups(struct bpf_verifier_env *env)
 19594	{
 19595		struct bpf_prog *prog = env->prog;
 19596		enum bpf_attach_type eatype = prog->expected_attach_type;
 19597		enum bpf_prog_type prog_type = resolve_prog_type(prog);
 19598		struct bpf_insn *insn = prog->insnsi;
 19599		const struct bpf_func_proto *fn;
 19600		const int insn_cnt = prog->len;
 19601		const struct bpf_map_ops *ops;
 19602		struct bpf_insn_aux_data *aux;
 19603		struct bpf_insn insn_buf[16];
 19604		struct bpf_prog *new_prog;
 19605		struct bpf_map *map_ptr;
 19606		int i, ret, cnt, delta = 0, cur_subprog = 0;
 19607		struct bpf_subprog_info *subprogs = env->subprog_info;
 19608		u16 stack_depth = subprogs[cur_subprog].stack_depth;
 19609		u16 stack_depth_extra = 0;
 19610	
 19611		if (env->seen_exception && !env->exception_callback_subprog) {
 19612			struct bpf_insn patch[] = {
 19613				env->prog->insnsi[insn_cnt - 1],
 19614				BPF_MOV64_REG(BPF_REG_0, BPF_REG_1),
 19615				BPF_EXIT_INSN(),
 19616			};
 19617	
 19618			ret = add_hidden_subprog(env, patch, ARRAY_SIZE(patch));
 19619			if (ret < 0)
 19620				return ret;
 19621			prog = env->prog;
 19622			insn = prog->insnsi;
 19623	
 19624			env->exception_callback_subprog = env->subprog_cnt - 1;
 19625			/* Don't update insn_cnt, as add_hidden_subprog always appends insns */
 19626			mark_subprog_exc_cb(env, env->exception_callback_subprog);
 19627		}
 19628	
 19629		for (i = 0; i < insn_cnt;) {
 19630			if (insn->code == (BPF_ALU64 | BPF_MOV | BPF_X) && insn->imm) {
 19631				if ((insn->off == BPF_ADDR_SPACE_CAST && insn->imm == 1) ||
 19632				    (((struct bpf_map *)env->prog->aux->arena)->map_flags & BPF_F_NO_USER_CONV)) {
 19633					/* convert to 32-bit mov that clears upper 32-bit */
 19634					insn->code = BPF_ALU | BPF_MOV | BPF_X;
 19635					/* clear off and imm, so it's a normal 'wX = wY' from JIT pov */
 19636					insn->off = 0;
 19637					insn->imm = 0;
 19638				} /* cast from as(0) to as(1) should be handled by JIT */
 19639				goto next_insn;
 19640			}
 19641	
 19642			if (env->insn_aux_data[i + delta].needs_zext)
 19643				/* Convert BPF_CLASS(insn->code) == BPF_ALU64 to 32-bit ALU */
 19644				insn->code = BPF_ALU | BPF_OP(insn->code) | BPF_SRC(insn->code);
 19645	
 19646			/* Make divide-by-zero exceptions impossible. */
 19647			if (insn->code == (BPF_ALU64 | BPF_MOD | BPF_X) ||
 19648			    insn->code == (BPF_ALU64 | BPF_DIV | BPF_X) ||
 19649			    insn->code == (BPF_ALU | BPF_MOD | BPF_X) ||
 19650			    insn->code == (BPF_ALU | BPF_DIV | BPF_X)) {
 19651				bool is64 = BPF_CLASS(insn->code) == BPF_ALU64;
 19652				bool isdiv = BPF_OP(insn->code) == BPF_DIV;
 19653				struct bpf_insn *patchlet;
 19654				struct bpf_insn chk_and_div[] = {
 19655					/* [R,W]x div 0 -> 0 */
 19656					BPF_RAW_INSN((is64 ? BPF_JMP : BPF_JMP32) |
 19657						     BPF_JNE | BPF_K, insn->src_reg,
 19658						     0, 2, 0),
 19659					BPF_ALU32_REG(BPF_XOR, insn->dst_reg, insn->dst_reg),
 19660					BPF_JMP_IMM(BPF_JA, 0, 0, 1),
 19661					*insn,
 19662				};
 19663				struct bpf_insn chk_and_mod[] = {
 19664					/* [R,W]x mod 0 -> [R,W]x */
 19665					BPF_RAW_INSN((is64 ? BPF_JMP : BPF_JMP32) |
 19666						     BPF_JEQ | BPF_K, insn->src_reg,
 19667						     0, 1 + (is64 ? 0 : 1), 0),
 19668					*insn,
 19669					BPF_JMP_IMM(BPF_JA, 0, 0, 1),
 19670					BPF_MOV32_REG(insn->dst_reg, insn->dst_reg),
 19671				};
 19672	
 19673				patchlet = isdiv ? chk_and_div : chk_and_mod;
 19674				cnt = isdiv ? ARRAY_SIZE(chk_and_div) :
 19675					      ARRAY_SIZE(chk_and_mod) - (is64 ? 2 : 0);
 19676	
 19677				new_prog = bpf_patch_insn_data(env, i + delta, patchlet, cnt);
 19678				if (!new_prog)
 19679					return -ENOMEM;
 19680	
 19681				delta    += cnt - 1;
 19682				env->prog = prog = new_prog;
 19683				insn      = new_prog->insnsi + i + delta;
 19684				goto next_insn;
 19685			}
 19686	
 19687			/* Implement LD_ABS and LD_IND with a rewrite, if supported by the program type. */
 19688			if (BPF_CLASS(insn->code) == BPF_LD &&
 19689			    (BPF_MODE(insn->code) == BPF_ABS ||
 19690			     BPF_MODE(insn->code) == BPF_IND)) {
 19691				cnt = env->ops->gen_ld_abs(insn, insn_buf);
 19692				if (cnt == 0 || cnt >= ARRAY_SIZE(insn_buf)) {
 19693					verbose(env, "bpf verifier is misconfigured\n");
 19694					return -EINVAL;
 19695				}
 19696	
 19697				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19698				if (!new_prog)
 19699					return -ENOMEM;
 19700	
 19701				delta    += cnt - 1;
 19702				env->prog = prog = new_prog;
 19703				insn      = new_prog->insnsi + i + delta;
 19704				goto next_insn;
 19705			}
 19706	
 19707			/* Rewrite pointer arithmetic to mitigate speculation attacks. */
 19708			if (insn->code == (BPF_ALU64 | BPF_ADD | BPF_X) ||
 19709			    insn->code == (BPF_ALU64 | BPF_SUB | BPF_X)) {
 19710				const u8 code_add = BPF_ALU64 | BPF_ADD | BPF_X;
 19711				const u8 code_sub = BPF_ALU64 | BPF_SUB | BPF_X;
 19712				struct bpf_insn *patch = &insn_buf[0];
 19713				bool issrc, isneg, isimm;
 19714				u32 off_reg;
 19715	
 19716				aux = &env->insn_aux_data[i + delta];
 19717				if (!aux->alu_state ||
 19718				    aux->alu_state == BPF_ALU_NON_POINTER)
 19719					goto next_insn;
 19720	
 19721				isneg = aux->alu_state & BPF_ALU_NEG_VALUE;
 19722				issrc = (aux->alu_state & BPF_ALU_SANITIZE) ==
 19723					BPF_ALU_SANITIZE_SRC;
 19724				isimm = aux->alu_state & BPF_ALU_IMMEDIATE;
 19725	
 19726				off_reg = issrc ? insn->src_reg : insn->dst_reg;
 19727				if (isimm) {
 19728					*patch++ = BPF_MOV32_IMM(BPF_REG_AX, aux->alu_limit);
 19729				} else {
 19730					if (isneg)
 19731						*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
 19732					*patch++ = BPF_MOV32_IMM(BPF_REG_AX, aux->alu_limit);
 19733					*patch++ = BPF_ALU64_REG(BPF_SUB, BPF_REG_AX, off_reg);
 19734					*patch++ = BPF_ALU64_REG(BPF_OR, BPF_REG_AX, off_reg);
 19735					*patch++ = BPF_ALU64_IMM(BPF_NEG, BPF_REG_AX, 0);
 19736					*patch++ = BPF_ALU64_IMM(BPF_ARSH, BPF_REG_AX, 63);
 19737					*patch++ = BPF_ALU64_REG(BPF_AND, BPF_REG_AX, off_reg);
 19738				}
 19739				if (!issrc)
 19740					*patch++ = BPF_MOV64_REG(insn->dst_reg, insn->src_reg);
 19741				insn->src_reg = BPF_REG_AX;
 19742				if (isneg)
 19743					insn->code = insn->code == code_add ?
 19744						     code_sub : code_add;
 19745				*patch++ = *insn;
 19746				if (issrc && isneg && !isimm)
 19747					*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
 19748				cnt = patch - insn_buf;
 19749	
 19750				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19751				if (!new_prog)
 19752					return -ENOMEM;
 19753	
 19754				delta    += cnt - 1;
 19755				env->prog = prog = new_prog;
 19756				insn      = new_prog->insnsi + i + delta;
 19757				goto next_insn;
 19758			}
 19759	
 19760			if (is_may_goto_insn(insn)) {
 19761				int stack_off = -stack_depth - 8;
 19762	
 19763				stack_depth_extra = 8;
 19764				insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_AX, BPF_REG_10, stack_off);
 19765				insn_buf[1] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_AX, 0, insn->off + 2);
 19766				insn_buf[2] = BPF_ALU64_IMM(BPF_SUB, BPF_REG_AX, 1);
 19767				insn_buf[3] = BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_AX, stack_off);
 19768				cnt = 4;
 19769	
 19770				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19771				if (!new_prog)
 19772					return -ENOMEM;
 19773	
 19774				delta += cnt - 1;
 19775				env->prog = prog = new_prog;
 19776				insn = new_prog->insnsi + i + delta;
 19777				goto next_insn;
 19778			}
 19779	
 19780			if (insn->code != (BPF_JMP | BPF_CALL))
 19781				goto next_insn;
 19782			if (insn->src_reg == BPF_PSEUDO_CALL)
 19783				goto next_insn;
 19784			if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
 19785				ret = fixup_kfunc_call(env, insn, insn_buf, i + delta, &cnt);
 19786				if (ret)
 19787					return ret;
 19788				if (cnt == 0)
 19789					goto next_insn;
 19790	
 19791				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19792				if (!new_prog)
 19793					return -ENOMEM;
 19794	
 19795				delta	 += cnt - 1;
 19796				env->prog = prog = new_prog;
 19797				insn	  = new_prog->insnsi + i + delta;
 19798				goto next_insn;
 19799			}
 19800	
 19801			if (insn->imm == BPF_FUNC_get_route_realm)
 19802				prog->dst_needed = 1;
 19803			if (insn->imm == BPF_FUNC_get_prandom_u32)
 19804				bpf_user_rnd_init_once();
 19805			if (insn->imm == BPF_FUNC_override_return)
 19806				prog->kprobe_override = 1;
 19807			if (insn->imm == BPF_FUNC_tail_call) {
 19808				/* If we tail call into other programs, we
 19809				 * cannot make any assumptions since they can
 19810				 * be replaced dynamically during runtime in
 19811				 * the program array.
 19812				 */
 19813				prog->cb_access = 1;
 19814				if (!allow_tail_call_in_subprogs(env))
 19815					prog->aux->stack_depth = MAX_BPF_STACK;
 19816				prog->aux->max_pkt_offset = MAX_PACKET_OFF;
 19817	
 19818				/* mark bpf_tail_call as different opcode to avoid
 19819				 * conditional branch in the interpreter for every normal
 19820				 * call and to prevent accidental JITing by JIT compiler
 19821				 * that doesn't support bpf_tail_call yet
 19822				 */
 19823				insn->imm = 0;
 19824				insn->code = BPF_JMP | BPF_TAIL_CALL;
 19825	
 19826				aux = &env->insn_aux_data[i + delta];
 19827				if (env->bpf_capable && !prog->blinding_requested &&
 19828				    prog->jit_requested &&
 19829				    !bpf_map_key_poisoned(aux) &&
 19830				    !bpf_map_ptr_poisoned(aux) &&
 19831				    !bpf_map_ptr_unpriv(aux)) {
 19832					struct bpf_jit_poke_descriptor desc = {
 19833						.reason = BPF_POKE_REASON_TAIL_CALL,
 19834						.tail_call.map = BPF_MAP_PTR(aux->map_ptr_state),
 19835						.tail_call.key = bpf_map_key_immediate(aux),
 19836						.insn_idx = i + delta,
 19837					};
 19838	
 19839					ret = bpf_jit_add_poke_descriptor(prog, &desc);
 19840					if (ret < 0) {
 19841						verbose(env, "adding tail call poke descriptor failed\n");
 19842						return ret;
 19843					}
 19844	
 19845					insn->imm = ret + 1;
 19846					goto next_insn;
 19847				}
 19848	
 19849				if (!bpf_map_ptr_unpriv(aux))
 19850					goto next_insn;
 19851	
 19852				/* instead of changing every JIT dealing with tail_call
 19853				 * emit two extra insns:
 19854				 * if (index >= max_entries) goto out;
 19855				 * index &= array->index_mask;
 19856				 * to avoid out-of-bounds cpu speculation
 19857				 */
 19858				if (bpf_map_ptr_poisoned(aux)) {
 19859					verbose(env, "tail_call abusing map_ptr\n");
 19860					return -EINVAL;
 19861				}
 19862	
 19863				map_ptr = BPF_MAP_PTR(aux->map_ptr_state);
 19864				insn_buf[0] = BPF_JMP_IMM(BPF_JGE, BPF_REG_3,
 19865							  map_ptr->max_entries, 2);
 19866				insn_buf[1] = BPF_ALU32_IMM(BPF_AND, BPF_REG_3,
 19867							    container_of(map_ptr,
 19868									 struct bpf_array,
 19869									 map)->index_mask);
 19870				insn_buf[2] = *insn;
 19871				cnt = 3;
 19872				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19873				if (!new_prog)
 19874					return -ENOMEM;
 19875	
 19876				delta    += cnt - 1;
 19877				env->prog = prog = new_prog;
 19878				insn      = new_prog->insnsi + i + delta;
 19879				goto next_insn;
 19880			}
 19881	
 19882			if (insn->imm == BPF_FUNC_timer_set_callback) {
 19883				/* The verifier will process callback_fn as many times as necessary
 19884				 * with different maps and the register states prepared by
 19885				 * set_timer_callback_state will be accurate.
 19886				 *
 19887				 * The following use case is valid:
 19888				 *   map1 is shared by prog1, prog2, prog3.
 19889				 *   prog1 calls bpf_timer_init for some map1 elements
 19890				 *   prog2 calls bpf_timer_set_callback for some map1 elements.
 19891				 *     Those that were not bpf_timer_init-ed will return -EINVAL.
 19892				 *   prog3 calls bpf_timer_start for some map1 elements.
 19893				 *     Those that were not both bpf_timer_init-ed and
 19894				 *     bpf_timer_set_callback-ed will return -EINVAL.
 19895				 */
 19896				struct bpf_insn ld_addrs[2] = {
 19897					BPF_LD_IMM64(BPF_REG_3, (long)prog->aux),
 19898				};
 19899	
 19900				insn_buf[0] = ld_addrs[0];
 19901				insn_buf[1] = ld_addrs[1];
 19902				insn_buf[2] = *insn;
 19903				cnt = 3;
 19904	
 19905				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19906				if (!new_prog)
 19907					return -ENOMEM;
 19908	
 19909				delta    += cnt - 1;
 19910				env->prog = prog = new_prog;
 19911				insn      = new_prog->insnsi + i + delta;
 19912				goto patch_call_imm;
 19913			}
 19914	
 19915			if (is_storage_get_function(insn->imm)) {
 19916				if (!in_sleepable(env) ||
 19917				    env->insn_aux_data[i + delta].storage_get_func_atomic)
 19918					insn_buf[0] = BPF_MOV64_IMM(BPF_REG_5, (__force __s32)GFP_ATOMIC);
 19919				else
 19920					insn_buf[0] = BPF_MOV64_IMM(BPF_REG_5, (__force __s32)GFP_KERNEL);
 19921				insn_buf[1] = *insn;
 19922				cnt = 2;
 19923	
 19924				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19925				if (!new_prog)
 19926					return -ENOMEM;
 19927	
 19928				delta += cnt - 1;
 19929				env->prog = prog = new_prog;
 19930				insn = new_prog->insnsi + i + delta;
 19931				goto patch_call_imm;
 19932			}
 19933	
 19934			/* bpf_per_cpu_ptr() and bpf_this_cpu_ptr() */
 19935			if (env->insn_aux_data[i + delta].call_with_percpu_alloc_ptr) {
 19936				/* patch with 'r1 = *(u64 *)(r1 + 0)' since for percpu data,
 19937				 * bpf_mem_alloc() returns a ptr to the percpu data ptr.
 19938				 */
 19939				insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_1, BPF_REG_1, 0);
 19940				insn_buf[1] = *insn;
 19941				cnt = 2;
 19942	
 19943				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19944				if (!new_prog)
 19945					return -ENOMEM;
 19946	
 19947				delta += cnt - 1;
 19948				env->prog = prog = new_prog;
 19949				insn = new_prog->insnsi + i + delta;
 19950				goto patch_call_imm;
 19951			}
 19952	
 19953			/* BPF_EMIT_CALL() assumptions in some of the map_gen_lookup
 19954			 * and other inlining handlers are currently limited to 64 bit
 19955			 * only.
 19956			 */
 19957			if (prog->jit_requested && BITS_PER_LONG == 64 &&
 19958			    (insn->imm == BPF_FUNC_map_lookup_elem ||
 19959			     insn->imm == BPF_FUNC_map_update_elem ||
 19960			     insn->imm == BPF_FUNC_map_delete_elem ||
 19961			     insn->imm == BPF_FUNC_map_push_elem   ||
 19962			     insn->imm == BPF_FUNC_map_pop_elem    ||
 19963			     insn->imm == BPF_FUNC_map_peek_elem   ||
 19964			     insn->imm == BPF_FUNC_redirect_map    ||
 19965			     insn->imm == BPF_FUNC_for_each_map_elem ||
 19966			     insn->imm == BPF_FUNC_map_lookup_percpu_elem)) {
 19967				aux = &env->insn_aux_data[i + delta];
 19968				if (bpf_map_ptr_poisoned(aux))
 19969					goto patch_call_imm;
 19970	
 19971				map_ptr = BPF_MAP_PTR(aux->map_ptr_state);
 19972				ops = map_ptr->ops;
 19973				if (insn->imm == BPF_FUNC_map_lookup_elem &&
 19974				    ops->map_gen_lookup) {
 19975					cnt = ops->map_gen_lookup(map_ptr, insn_buf);
 19976					if (cnt == -EOPNOTSUPP)
 19977						goto patch_map_ops_generic;
 19978					if (cnt <= 0 || cnt >= ARRAY_SIZE(insn_buf)) {
 19979						verbose(env, "bpf verifier is misconfigured\n");
 19980						return -EINVAL;
 19981					}
 19982	
 19983					new_prog = bpf_patch_insn_data(env, i + delta,
 19984								       insn_buf, cnt);
 19985					if (!new_prog)
 19986						return -ENOMEM;
 19987	
 19988					delta    += cnt - 1;
 19989					env->prog = prog = new_prog;
 19990					insn      = new_prog->insnsi + i + delta;
 19991					goto next_insn;
 19992				}
 19993	
 19994				BUILD_BUG_ON(!__same_type(ops->map_lookup_elem,
 19995					     (void *(*)(struct bpf_map *map, void *key))NULL));
 19996				BUILD_BUG_ON(!__same_type(ops->map_delete_elem,
 19997					     (long (*)(struct bpf_map *map, void *key))NULL));
 19998				BUILD_BUG_ON(!__same_type(ops->map_update_elem,
 19999					     (long (*)(struct bpf_map *map, void *key, void *value,
 20000						      u64 flags))NULL));
 20001				BUILD_BUG_ON(!__same_type(ops->map_push_elem,
 20002					     (long (*)(struct bpf_map *map, void *value,
 20003						      u64 flags))NULL));
 20004				BUILD_BUG_ON(!__same_type(ops->map_pop_elem,
 20005					     (long (*)(struct bpf_map *map, void *value))NULL));
 20006				BUILD_BUG_ON(!__same_type(ops->map_peek_elem,
 20007					     (long (*)(struct bpf_map *map, void *value))NULL));
 20008				BUILD_BUG_ON(!__same_type(ops->map_redirect,
 20009					     (long (*)(struct bpf_map *map, u64 index, u64 flags))NULL));
 20010				BUILD_BUG_ON(!__same_type(ops->map_for_each_callback,
 20011					     (long (*)(struct bpf_map *map,
 20012						      bpf_callback_t callback_fn,
 20013						      void *callback_ctx,
 20014						      u64 flags))NULL));
 20015				BUILD_BUG_ON(!__same_type(ops->map_lookup_percpu_elem,
 20016					     (void *(*)(struct bpf_map *map, void *key, u32 cpu))NULL));
 20017	
 20018	patch_map_ops_generic:
 20019				switch (insn->imm) {
 20020				case BPF_FUNC_map_lookup_elem:
 20021					insn->imm = BPF_CALL_IMM(ops->map_lookup_elem);
 20022					goto next_insn;
 20023				case BPF_FUNC_map_update_elem:
 20024					insn->imm = BPF_CALL_IMM(ops->map_update_elem);
 20025					goto next_insn;
 20026				case BPF_FUNC_map_delete_elem:
 20027					insn->imm = BPF_CALL_IMM(ops->map_delete_elem);
 20028					goto next_insn;
 20029				case BPF_FUNC_map_push_elem:
 20030					insn->imm = BPF_CALL_IMM(ops->map_push_elem);
 20031					goto next_insn;
 20032				case BPF_FUNC_map_pop_elem:
 20033					insn->imm = BPF_CALL_IMM(ops->map_pop_elem);
 20034					goto next_insn;
 20035				case BPF_FUNC_map_peek_elem:
 20036					insn->imm = BPF_CALL_IMM(ops->map_peek_elem);
 20037					goto next_insn;
 20038				case BPF_FUNC_redirect_map:
 20039					insn->imm = BPF_CALL_IMM(ops->map_redirect);
 20040					goto next_insn;
 20041				case BPF_FUNC_for_each_map_elem:
 20042					insn->imm = BPF_CALL_IMM(ops->map_for_each_callback);
 20043					goto next_insn;
 20044				case BPF_FUNC_map_lookup_percpu_elem:
 20045					insn->imm = BPF_CALL_IMM(ops->map_lookup_percpu_elem);
 20046					goto next_insn;
 20047				}
 20048	
 20049				goto patch_call_imm;
 20050			}
 20051	
 20052			/* Implement bpf_jiffies64 inline. */
 20053			if (prog->jit_requested && BITS_PER_LONG == 64 &&
 20054			    insn->imm == BPF_FUNC_jiffies64) {
 20055				struct bpf_insn ld_jiffies_addr[2] = {
 20056					BPF_LD_IMM64(BPF_REG_0,
 20057						     (unsigned long)&jiffies),
 20058				};
 20059	
 20060				insn_buf[0] = ld_jiffies_addr[0];
 20061				insn_buf[1] = ld_jiffies_addr[1];
 20062				insn_buf[2] = BPF_LDX_MEM(BPF_DW, BPF_REG_0,
 20063							  BPF_REG_0, 0);
 20064				cnt = 3;
 20065	
 20066				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf,
 20067							       cnt);
 20068				if (!new_prog)
 20069					return -ENOMEM;
 20070	
 20071				delta    += cnt - 1;
 20072				env->prog = prog = new_prog;
 20073				insn      = new_prog->insnsi + i + delta;
 20074				goto next_insn;
 20075			}
 20076	
 20077	#ifdef CONFIG_X86_64
 20078			/* Implement bpf_get_smp_processor_id() inline. */
 20079			if (insn->imm == BPF_FUNC_get_smp_processor_id &&
 20080			    prog->jit_requested && bpf_jit_supports_percpu_insn()) {
 20081				/* BPF_FUNC_get_smp_processor_id inlining is an
 20082				 * optimization, so if pcpu_hot.cpu_number is ever
 20083				 * changed in some incompatible and hard to support
 20084				 * way, it's fine to back out this inlining logic
 20085				 */
 20086				insn_buf[0] = BPF_MOV32_IMM(BPF_REG_0, (u32)(unsigned long)&pcpu_hot.cpu_number);
 20087				insn_buf[1] = BPF_MOV64_PERCPU_REG(BPF_REG_0, BPF_REG_0);
 20088				insn_buf[2] = BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_0, 0);
 20089				cnt = 3;
 20090	
 20091				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 20092				if (!new_prog)
 20093					return -ENOMEM;
 20094	
 20095				delta    += cnt - 1;
 20096				env->prog = prog = new_prog;
 20097				insn      = new_prog->insnsi + i + delta;
 20098				goto next_insn;
 20099			}
 20100	#endif
 20101			/* Implement bpf_get_func_arg inline. */
 20102			if (prog_type == BPF_PROG_TYPE_TRACING &&
 20103			    insn->imm == BPF_FUNC_get_func_arg) {
 20104				/* Load nr_args from ctx - 8 */
 20105				insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -8);
 20106				insn_buf[1] = BPF_JMP32_REG(BPF_JGE, BPF_REG_2, BPF_REG_0, 6);
 20107				insn_buf[2] = BPF_ALU64_IMM(BPF_LSH, BPF_REG_2, 3);
 20108				insn_buf[3] = BPF_ALU64_REG(BPF_ADD, BPF_REG_2, BPF_REG_1);
 20109				insn_buf[4] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_2, 0);
 20110				insn_buf[5] = BPF_STX_MEM(BPF_DW, BPF_REG_3, BPF_REG_0, 0);
 20111				insn_buf[6] = BPF_MOV64_IMM(BPF_REG_0, 0);
 20112				insn_buf[7] = BPF_JMP_A(1);
 20113				insn_buf[8] = BPF_MOV64_IMM(BPF_REG_0, -EINVAL);
 20114				cnt = 9;
 20115	
 20116				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 20117				if (!new_prog)
 20118					return -ENOMEM;
 20119	
 20120				delta    += cnt - 1;
 20121				env->prog = prog = new_prog;
 20122				insn      = new_prog->insnsi + i + delta;
 20123				goto next_insn;
 20124			}
 20125	
 20126			/* Implement bpf_get_func_ret inline. */
 20127			if (prog_type == BPF_PROG_TYPE_TRACING &&
 20128			    insn->imm == BPF_FUNC_get_func_ret) {
 20129				if (eatype == BPF_TRACE_FEXIT ||
 20130				    eatype == BPF_MODIFY_RETURN) {
 20131					/* Load nr_args from ctx - 8 */
 20132					insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -8);
 20133					insn_buf[1] = BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, 3);
 20134					insn_buf[2] = BPF_ALU64_REG(BPF_ADD, BPF_REG_0, BPF_REG_1);
 20135					insn_buf[3] = BPF_LDX_MEM(BPF_DW, BPF_REG_3, BPF_REG_0, 0);
 20136					insn_buf[4] = BPF_STX_MEM(BPF_DW, BPF_REG_2, BPF_REG_3, 0);
 20137					insn_buf[5] = BPF_MOV64_IMM(BPF_REG_0, 0);
 20138					cnt = 6;
 20139				} else {
 20140					insn_buf[0] = BPF_MOV64_IMM(BPF_REG_0, -EOPNOTSUPP);
 20141					cnt = 1;
 20142				}
 20143	
 20144				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 20145				if (!new_prog)
 20146					return -ENOMEM;
 20147	
 20148				delta    += cnt - 1;
 20149				env->prog = prog = new_prog;
 20150				insn      = new_prog->insnsi + i + delta;
 20151				goto next_insn;
 20152			}
 20153	
 20154			/* Implement get_func_arg_cnt inline. */
 20155			if (prog_type == BPF_PROG_TYPE_TRACING &&
 20156			    insn->imm == BPF_FUNC_get_func_arg_cnt) {
 20157				/* Load nr_args from ctx - 8 */
 20158				insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -8);
 20159	
 20160				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, 1);
 20161				if (!new_prog)
 20162					return -ENOMEM;
 20163	
 20164				env->prog = prog = new_prog;
 20165				insn      = new_prog->insnsi + i + delta;
 20166				goto next_insn;
 20167			}
 20168	
 20169			/* Implement bpf_get_func_ip inline. */
 20170			if (prog_type == BPF_PROG_TYPE_TRACING &&
 20171			    insn->imm == BPF_FUNC_get_func_ip) {
 20172				/* Load IP address from ctx - 16 */
 20173				insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -16);
 20174	
 20175				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, 1);
 20176				if (!new_prog)
 20177					return -ENOMEM;
 20178	
 20179				env->prog = prog = new_prog;
 20180				insn      = new_prog->insnsi + i + delta;
 20181				goto next_insn;
 20182			}
 20183	
 20184			/* Implement bpf_kptr_xchg inline */
 20185			if (prog->jit_requested && BITS_PER_LONG == 64 &&
 20186			    insn->imm == BPF_FUNC_kptr_xchg &&
 20187			    bpf_jit_supports_ptr_xchg()) {
 20188				insn_buf[0] = BPF_MOV64_REG(BPF_REG_0, BPF_REG_2);
 20189				insn_buf[1] = BPF_ATOMIC_OP(BPF_DW, BPF_XCHG, BPF_REG_1, BPF_REG_0, 0);
 20190				cnt = 2;
 20191	
 20192				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 20193				if (!new_prog)
 20194					return -ENOMEM;
 20195	
 20196				delta    += cnt - 1;
 20197				env->prog = prog = new_prog;
 20198				insn      = new_prog->insnsi + i + delta;
 20199				goto next_insn;
 20200			}
 20201	patch_call_imm:
 20202			fn = env->ops->get_func_proto(insn->imm, env->prog);
 20203			/* all functions that have prototype and verifier allowed
 20204			 * programs to call them, must be real in-kernel functions
 20205			 */
 20206			if (!fn->func) {
 20207				verbose(env,
 20208					"kernel subsystem misconfigured func %s#%d\n",
 20209					func_id_name(insn->imm), insn->imm);
 20210				return -EFAULT;
 20211			}
 20212			insn->imm = fn->func - __bpf_call_base;
 20213	next_insn:
 20214			if (subprogs[cur_subprog + 1].start == i + delta + 1) {
 20215				subprogs[cur_subprog].stack_depth += stack_depth_extra;
 20216				subprogs[cur_subprog].stack_extra = stack_depth_extra;
 20217				cur_subprog++;
 20218				stack_depth = subprogs[cur_subprog].stack_depth;
 20219				stack_depth_extra = 0;
 20220			}
 20221			i++;
 20222			insn++;
 20223		}
 20224	
 20225		env->prog->aux->stack_depth = subprogs[0].stack_depth;
 20226		for (i = 0; i < env->subprog_cnt; i++) {
 20227			int subprog_start = subprogs[i].start;
 20228			int stack_slots = subprogs[i].stack_extra / 8;
 20229	
 20230			if (!stack_slots)
 20231				continue;
 20232			if (stack_slots > 1) {
 20233				verbose(env, "verifier bug: stack_slots supports may_goto only\n");
 20234				return -EFAULT;
 20235			}
 20236	
 20237			/* Add ST insn to subprog prologue to init extra stack */
 20238			insn_buf[0] = BPF_ST_MEM(BPF_DW, BPF_REG_FP,
 20239						 -subprogs[i].stack_depth, BPF_MAX_LOOPS);
 20240			/* Copy first actual insn to preserve it */
 20241			insn_buf[1] = env->prog->insnsi[subprog_start];
 20242	
 20243			new_prog = bpf_patch_insn_data(env, subprog_start, insn_buf, 2);
 20244			if (!new_prog)
 20245				return -ENOMEM;
 20246			env->prog = prog = new_prog;
 20247		}
 20248	
 20249		/* Since poke tab is now finalized, publish aux to tracker. */
 20250		for (i = 0; i < prog->aux->size_poke_tab; i++) {
 20251			map_ptr = prog->aux->poke_tab[i].tail_call.map;
 20252			if (!map_ptr->ops->map_poke_track ||
 20253			    !map_ptr->ops->map_poke_untrack ||
 20254			    !map_ptr->ops->map_poke_run) {
 20255				verbose(env, "bpf verifier is misconfigured\n");
 20256				return -EINVAL;
 20257			}
 20258	
 20259			ret = map_ptr->ops->map_poke_track(map_ptr, prog->aux);
 20260			if (ret < 0) {
 20261				verbose(env, "tracking tail call prog failed\n");
 20262				return ret;
 20263			}
 20264		}
 20265	
 20266		sort_kfunc_descs_by_imm_off(env->prog);
 20267	
 20268		return 0;
 20269	}
 20270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
