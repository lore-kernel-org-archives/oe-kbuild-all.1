Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DADB38FAA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 04:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709611717; cv=none; b=VF4+jytZ3GApBhyON2sFp1XE4A8PfcbJCyKV+RkHQsMSTFbDlDpmHaJ6D9GvcWdZ50DUPLXclVBMz6ujt7h9/OFPEr7p5BGJm9wnHX1SwbjB4amHPLHFPOwSiArLcgvPeEcP1SkUAIUpg+rEVbYAswcHNCpwWATqhgcRFypnYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709611717; c=relaxed/simple;
	bh=RQ3R1bk0tlzLQeNXQ997mnTgQPpVwH/uGuf2E+TKYxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z27f0XgZ1FGWZpBuS9g+8Dt5Dgj15mZdZFol/OJ3XDLDkFD4cHE+t1S32bnFyd/yCSRXZQB+Tg6tAqCSTEXBQPF6U3kgRv9imCUDv9M/sF40s2X1OINTMrZOBQW7t+Orro+GFw/tMq9pyPgTpbjnhB+TP75BzAFSk4TdQq+HDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alWE9udq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alWE9udq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709611715; x=1741147715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQ3R1bk0tlzLQeNXQ997mnTgQPpVwH/uGuf2E+TKYxk=;
  b=alWE9udqfmQuyLKHKW9/lIiEx7pGEcCIl4/CFbEFriLzH04PTrBipnl/
   KM6Hx9dMGx2PRk3QY3NWbepW1voR8yvZw4VVmcOKFJJTNF86ppjzjiIz5
   n+1DANyoNSspAIA0pAsJIClqEymM+c0JjNakFtkR0e/n64glzgT3OA5Au
   UQcjW9VPtheOonZknXtdMztIePQwpZotg/VdYrXWV5t3CJ0VnhFsU5ZD9
   CgHH/pZsVwCoUaQ07Y+Nr9itjttFmdvF9Y/aLMMQleUkaVoqrVdvAHwha
   G4HIiXvXDtvIrYKUmk/9Dls8ttXnYcvf3isU9+t/yJAJfB/n95Of+AwnV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4262838"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4262838"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 20:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9811525"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2024 20:08:31 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhM6O-00031J-2c;
	Tue, 05 Mar 2024 04:08:28 +0000
Date: Tue, 5 Mar 2024 12:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/bpf/verifier.c:9401:25: error: implicit declaration of
 function 'bpf_jit_blinding_enabled'
Message-ID: <202403051153.r2ha9ls3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 94de0a213a5b16943245e7d352f4d351e2ff1cca bpf: Constant map key tracking for prog array pokes
date:   1 year, 6 months ago
config: x86_64-randconfig-001-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051153.r2ha9ls3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051153.r2ha9ls3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051153.r2ha9ls3-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/verifier.c:9286:16: warning: cast from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9286 |                         insn->imm = BPF_CAST_CALL(func[subprog]->bpf_func) -
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/verifier.c:9401:25: error: implicit declaration of function 'bpf_jit_blinding_enabled' [-Werror,-Wimplicit-function-declaration]
    9401 |         bool expect_blinding = bpf_jit_blinding_enabled(prog);
         |                                ^
   kernel/bpf/verifier.c:9401:25: note: did you mean 'bpf_jit_kallsyms_enabled'?
   include/linux/filter.h:1093:20: note: 'bpf_jit_kallsyms_enabled' declared here
    1093 | static inline bool bpf_jit_kallsyms_enabled(void)
         |                    ^
   kernel/bpf/verifier.c:9661:17: warning: cast from 'void *(*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9661 |                                 insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9665:17: warning: cast from 'int (*)(struct bpf_map *, void *, void *, u64)' (aka 'int (*)(struct bpf_map *, void *, void *, unsigned long long)') to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9665 |                                 insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9669:17: warning: cast from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9669 |                                 insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9673:17: warning: cast from 'int (*)(struct bpf_map *, void *, u64)' (aka 'int (*)(struct bpf_map *, void *, unsigned long long)') to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9673 |                                 insn->imm = BPF_CAST_CALL(ops->map_push_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9677:17: warning: cast from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9677 |                                 insn->imm = BPF_CAST_CALL(ops->map_pop_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9681:17: warning: cast from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9681 |                                 insn->imm = BPF_CAST_CALL(ops->map_peek_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:10062:7: error: use of undeclared identifier 'BPF_TRACE_RAW_TP'
    10062 |         case BPF_TRACE_RAW_TP:
          |              ^
   kernel/bpf/verifier.c:10095:7: error: use of undeclared identifier 'BPF_TRACE_FENTRY'; did you mean 'BPF_TRAMP_FENTRY'?
    10095 |         case BPF_TRACE_FENTRY:
          |              ^~~~~~~~~~~~~~~~
          |              BPF_TRAMP_FENTRY
   include/linux/bpf.h:458:2: note: 'BPF_TRAMP_FENTRY' declared here
     458 |         BPF_TRAMP_FENTRY,
         |         ^
   kernel/bpf/verifier.c:10096:7: error: use of undeclared identifier 'BPF_TRACE_FEXIT'; did you mean 'BPF_TRAMP_FEXIT'?
    10096 |         case BPF_TRACE_FEXIT:
          |              ^~~~~~~~~~~~~~~
          |              BPF_TRAMP_FEXIT
   include/linux/bpf.h:459:2: note: 'BPF_TRAMP_FEXIT' declared here
     459 |         BPF_TRAMP_FEXIT,
         |         ^
   7 warnings and 4 errors generated.


vim +/bpf_jit_blinding_enabled +9401 kernel/bpf/verifier.c

  9392	
  9393	/* fixup insn->imm field of bpf_call instructions
  9394	 * and inline eligible helpers as explicit sequence of BPF instructions
  9395	 *
  9396	 * this function is called after eBPF program passed verification
  9397	 */
  9398	static int fixup_bpf_calls(struct bpf_verifier_env *env)
  9399	{
  9400		struct bpf_prog *prog = env->prog;
> 9401		bool expect_blinding = bpf_jit_blinding_enabled(prog);
  9402		struct bpf_insn *insn = prog->insnsi;
  9403		const struct bpf_func_proto *fn;
  9404		const int insn_cnt = prog->len;
  9405		const struct bpf_map_ops *ops;
  9406		struct bpf_insn_aux_data *aux;
  9407		struct bpf_insn insn_buf[16];
  9408		struct bpf_prog *new_prog;
  9409		struct bpf_map *map_ptr;
  9410		int i, ret, cnt, delta = 0;
  9411	
  9412		for (i = 0; i < insn_cnt; i++, insn++) {
  9413			if (insn->code == (BPF_ALU64 | BPF_MOD | BPF_X) ||
  9414			    insn->code == (BPF_ALU64 | BPF_DIV | BPF_X) ||
  9415			    insn->code == (BPF_ALU | BPF_MOD | BPF_X) ||
  9416			    insn->code == (BPF_ALU | BPF_DIV | BPF_X)) {
  9417				bool is64 = BPF_CLASS(insn->code) == BPF_ALU64;
  9418				bool isdiv = BPF_OP(insn->code) == BPF_DIV;
  9419				struct bpf_insn *patchlet;
  9420				struct bpf_insn chk_and_div[] = {
  9421					/* [R,W]x div 0 -> 0 */
  9422					BPF_RAW_INSN((is64 ? BPF_JMP : BPF_JMP32) |
  9423						     BPF_JNE | BPF_K, insn->src_reg,
  9424						     0, 2, 0),
  9425					BPF_ALU32_REG(BPF_XOR, insn->dst_reg, insn->dst_reg),
  9426					BPF_JMP_IMM(BPF_JA, 0, 0, 1),
  9427					*insn,
  9428				};
  9429				struct bpf_insn chk_and_mod[] = {
  9430					/* [R,W]x mod 0 -> [R,W]x */
  9431					BPF_RAW_INSN((is64 ? BPF_JMP : BPF_JMP32) |
  9432						     BPF_JEQ | BPF_K, insn->src_reg,
  9433						     0, 1 + (is64 ? 0 : 1), 0),
  9434					*insn,
  9435					BPF_JMP_IMM(BPF_JA, 0, 0, 1),
  9436					BPF_MOV32_REG(insn->dst_reg, insn->dst_reg),
  9437				};
  9438	
  9439				patchlet = isdiv ? chk_and_div : chk_and_mod;
  9440				cnt = isdiv ? ARRAY_SIZE(chk_and_div) :
  9441					      ARRAY_SIZE(chk_and_mod) - (is64 ? 2 : 0);
  9442	
  9443				new_prog = bpf_patch_insn_data(env, i + delta, patchlet, cnt);
  9444				if (!new_prog)
  9445					return -ENOMEM;
  9446	
  9447				delta    += cnt - 1;
  9448				env->prog = prog = new_prog;
  9449				insn      = new_prog->insnsi + i + delta;
  9450				continue;
  9451			}
  9452	
  9453			if (BPF_CLASS(insn->code) == BPF_LD &&
  9454			    (BPF_MODE(insn->code) == BPF_ABS ||
  9455			     BPF_MODE(insn->code) == BPF_IND)) {
  9456				cnt = env->ops->gen_ld_abs(insn, insn_buf);
  9457				if (cnt == 0 || cnt >= ARRAY_SIZE(insn_buf)) {
  9458					verbose(env, "bpf verifier is misconfigured\n");
  9459					return -EINVAL;
  9460				}
  9461	
  9462				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
  9463				if (!new_prog)
  9464					return -ENOMEM;
  9465	
  9466				delta    += cnt - 1;
  9467				env->prog = prog = new_prog;
  9468				insn      = new_prog->insnsi + i + delta;
  9469				continue;
  9470			}
  9471	
  9472			if (insn->code == (BPF_ALU64 | BPF_ADD | BPF_X) ||
  9473			    insn->code == (BPF_ALU64 | BPF_SUB | BPF_X)) {
  9474				const u8 code_add = BPF_ALU64 | BPF_ADD | BPF_X;
  9475				const u8 code_sub = BPF_ALU64 | BPF_SUB | BPF_X;
  9476				struct bpf_insn insn_buf[16];
  9477				struct bpf_insn *patch = &insn_buf[0];
  9478				bool issrc, isneg, isimm;
  9479				u32 off_reg;
  9480	
  9481				aux = &env->insn_aux_data[i + delta];
  9482				if (!aux->alu_state ||
  9483				    aux->alu_state == BPF_ALU_NON_POINTER)
  9484					continue;
  9485	
  9486				isneg = aux->alu_state & BPF_ALU_NEG_VALUE;
  9487				issrc = (aux->alu_state & BPF_ALU_SANITIZE) ==
  9488					BPF_ALU_SANITIZE_SRC;
  9489				isimm = aux->alu_state & BPF_ALU_IMMEDIATE;
  9490	
  9491				off_reg = issrc ? insn->src_reg : insn->dst_reg;
  9492				if (isimm) {
  9493					*patch++ = BPF_MOV32_IMM(BPF_REG_AX, aux->alu_limit);
  9494				} else {
  9495					if (isneg)
  9496						*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
  9497					*patch++ = BPF_MOV32_IMM(BPF_REG_AX, aux->alu_limit);
  9498					*patch++ = BPF_ALU64_REG(BPF_SUB, BPF_REG_AX, off_reg);
  9499					*patch++ = BPF_ALU64_REG(BPF_OR, BPF_REG_AX, off_reg);
  9500					*patch++ = BPF_ALU64_IMM(BPF_NEG, BPF_REG_AX, 0);
  9501					*patch++ = BPF_ALU64_IMM(BPF_ARSH, BPF_REG_AX, 63);
  9502					*patch++ = BPF_ALU64_REG(BPF_AND, BPF_REG_AX, off_reg);
  9503				}
  9504				if (!issrc)
  9505					*patch++ = BPF_MOV64_REG(insn->dst_reg, insn->src_reg);
  9506				insn->src_reg = BPF_REG_AX;
  9507				if (isneg)
  9508					insn->code = insn->code == code_add ?
  9509						     code_sub : code_add;
  9510				*patch++ = *insn;
  9511				if (issrc && isneg && !isimm)
  9512					*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
  9513				cnt = patch - insn_buf;
  9514	
  9515				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
  9516				if (!new_prog)
  9517					return -ENOMEM;
  9518	
  9519				delta    += cnt - 1;
  9520				env->prog = prog = new_prog;
  9521				insn      = new_prog->insnsi + i + delta;
  9522				continue;
  9523			}
  9524	
  9525			if (insn->code != (BPF_JMP | BPF_CALL))
  9526				continue;
  9527			if (insn->src_reg == BPF_PSEUDO_CALL)
  9528				continue;
  9529	
  9530			if (insn->imm == BPF_FUNC_get_route_realm)
  9531				prog->dst_needed = 1;
  9532			if (insn->imm == BPF_FUNC_get_prandom_u32)
  9533				bpf_user_rnd_init_once();
  9534			if (insn->imm == BPF_FUNC_override_return)
  9535				prog->kprobe_override = 1;
  9536			if (insn->imm == BPF_FUNC_tail_call) {
  9537				/* If we tail call into other programs, we
  9538				 * cannot make any assumptions since they can
  9539				 * be replaced dynamically during runtime in
  9540				 * the program array.
  9541				 */
  9542				prog->cb_access = 1;
  9543				env->prog->aux->stack_depth = MAX_BPF_STACK;
  9544				env->prog->aux->max_pkt_offset = MAX_PACKET_OFF;
  9545	
  9546				/* mark bpf_tail_call as different opcode to avoid
  9547				 * conditional branch in the interpeter for every normal
  9548				 * call and to prevent accidental JITing by JIT compiler
  9549				 * that doesn't support bpf_tail_call yet
  9550				 */
  9551				insn->imm = 0;
  9552				insn->code = BPF_JMP | BPF_TAIL_CALL;
  9553	
  9554				aux = &env->insn_aux_data[i + delta];
  9555				if (prog->jit_requested && !expect_blinding &&
  9556				    !bpf_map_key_poisoned(aux) &&
  9557				    !bpf_map_ptr_poisoned(aux) &&
  9558				    !bpf_map_ptr_unpriv(aux)) {
  9559					struct bpf_jit_poke_descriptor desc = {
  9560						.reason = BPF_POKE_REASON_TAIL_CALL,
  9561						.tail_call.map = BPF_MAP_PTR(aux->map_ptr_state),
  9562						.tail_call.key = bpf_map_key_immediate(aux),
  9563					};
  9564	
  9565					ret = bpf_jit_add_poke_descriptor(prog, &desc);
  9566					if (ret < 0) {
  9567						verbose(env, "adding tail call poke descriptor failed\n");
  9568						return ret;
  9569					}
  9570	
  9571					insn->imm = ret + 1;
  9572					continue;
  9573				}
  9574	
  9575				if (!bpf_map_ptr_unpriv(aux))
  9576					continue;
  9577	
  9578				/* instead of changing every JIT dealing with tail_call
  9579				 * emit two extra insns:
  9580				 * if (index >= max_entries) goto out;
  9581				 * index &= array->index_mask;
  9582				 * to avoid out-of-bounds cpu speculation
  9583				 */
  9584				if (bpf_map_ptr_poisoned(aux)) {
  9585					verbose(env, "tail_call abusing map_ptr\n");
  9586					return -EINVAL;
  9587				}
  9588	
  9589				map_ptr = BPF_MAP_PTR(aux->map_ptr_state);
  9590				insn_buf[0] = BPF_JMP_IMM(BPF_JGE, BPF_REG_3,
  9591							  map_ptr->max_entries, 2);
  9592				insn_buf[1] = BPF_ALU32_IMM(BPF_AND, BPF_REG_3,
  9593							    container_of(map_ptr,
  9594									 struct bpf_array,
  9595									 map)->index_mask);
  9596				insn_buf[2] = *insn;
  9597				cnt = 3;
  9598				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
  9599				if (!new_prog)
  9600					return -ENOMEM;
  9601	
  9602				delta    += cnt - 1;
  9603				env->prog = prog = new_prog;
  9604				insn      = new_prog->insnsi + i + delta;
  9605				continue;
  9606			}
  9607	
  9608			/* BPF_EMIT_CALL() assumptions in some of the map_gen_lookup
  9609			 * and other inlining handlers are currently limited to 64 bit
  9610			 * only.
  9611			 */
  9612			if (prog->jit_requested && BITS_PER_LONG == 64 &&
  9613			    (insn->imm == BPF_FUNC_map_lookup_elem ||
  9614			     insn->imm == BPF_FUNC_map_update_elem ||
  9615			     insn->imm == BPF_FUNC_map_delete_elem ||
  9616			     insn->imm == BPF_FUNC_map_push_elem   ||
  9617			     insn->imm == BPF_FUNC_map_pop_elem    ||
  9618			     insn->imm == BPF_FUNC_map_peek_elem)) {
  9619				aux = &env->insn_aux_data[i + delta];
  9620				if (bpf_map_ptr_poisoned(aux))
  9621					goto patch_call_imm;
  9622	
  9623				map_ptr = BPF_MAP_PTR(aux->map_ptr_state);
  9624				ops = map_ptr->ops;
  9625				if (insn->imm == BPF_FUNC_map_lookup_elem &&
  9626				    ops->map_gen_lookup) {
  9627					cnt = ops->map_gen_lookup(map_ptr, insn_buf);
  9628					if (cnt == 0 || cnt >= ARRAY_SIZE(insn_buf)) {
  9629						verbose(env, "bpf verifier is misconfigured\n");
  9630						return -EINVAL;
  9631					}
  9632	
  9633					new_prog = bpf_patch_insn_data(env, i + delta,
  9634								       insn_buf, cnt);
  9635					if (!new_prog)
  9636						return -ENOMEM;
  9637	
  9638					delta    += cnt - 1;
  9639					env->prog = prog = new_prog;
  9640					insn      = new_prog->insnsi + i + delta;
  9641					continue;
  9642				}
  9643	
  9644				BUILD_BUG_ON(!__same_type(ops->map_lookup_elem,
  9645					     (void *(*)(struct bpf_map *map, void *key))NULL));
  9646				BUILD_BUG_ON(!__same_type(ops->map_delete_elem,
  9647					     (int (*)(struct bpf_map *map, void *key))NULL));
  9648				BUILD_BUG_ON(!__same_type(ops->map_update_elem,
  9649					     (int (*)(struct bpf_map *map, void *key, void *value,
  9650						      u64 flags))NULL));
  9651				BUILD_BUG_ON(!__same_type(ops->map_push_elem,
  9652					     (int (*)(struct bpf_map *map, void *value,
  9653						      u64 flags))NULL));
  9654				BUILD_BUG_ON(!__same_type(ops->map_pop_elem,
  9655					     (int (*)(struct bpf_map *map, void *value))NULL));
  9656				BUILD_BUG_ON(!__same_type(ops->map_peek_elem,
  9657					     (int (*)(struct bpf_map *map, void *value))NULL));
  9658	
  9659				switch (insn->imm) {
  9660				case BPF_FUNC_map_lookup_elem:
  9661					insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
  9662						    __bpf_call_base;
  9663					continue;
  9664				case BPF_FUNC_map_update_elem:
  9665					insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
  9666						    __bpf_call_base;
  9667					continue;
  9668				case BPF_FUNC_map_delete_elem:
  9669					insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
  9670						    __bpf_call_base;
  9671					continue;
  9672				case BPF_FUNC_map_push_elem:
  9673					insn->imm = BPF_CAST_CALL(ops->map_push_elem) -
  9674						    __bpf_call_base;
  9675					continue;
  9676				case BPF_FUNC_map_pop_elem:
  9677					insn->imm = BPF_CAST_CALL(ops->map_pop_elem) -
  9678						    __bpf_call_base;
  9679					continue;
  9680				case BPF_FUNC_map_peek_elem:
  9681					insn->imm = BPF_CAST_CALL(ops->map_peek_elem) -
  9682						    __bpf_call_base;
  9683					continue;
  9684				}
  9685	
  9686				goto patch_call_imm;
  9687			}
  9688	
  9689			if (prog->jit_requested && BITS_PER_LONG == 64 &&
  9690			    insn->imm == BPF_FUNC_jiffies64) {
  9691				struct bpf_insn ld_jiffies_addr[2] = {
  9692					BPF_LD_IMM64(BPF_REG_0,
  9693						     (unsigned long)&jiffies),
  9694				};
  9695	
  9696				insn_buf[0] = ld_jiffies_addr[0];
  9697				insn_buf[1] = ld_jiffies_addr[1];
  9698				insn_buf[2] = BPF_LDX_MEM(BPF_DW, BPF_REG_0,
  9699							  BPF_REG_0, 0);
  9700				cnt = 3;
  9701	
  9702				new_prog = bpf_patch_insn_data(env, i + delta, insn_buf,
  9703							       cnt);
  9704				if (!new_prog)
  9705					return -ENOMEM;
  9706	
  9707				delta    += cnt - 1;
  9708				env->prog = prog = new_prog;
  9709				insn      = new_prog->insnsi + i + delta;
  9710				continue;
  9711			}
  9712	
  9713	patch_call_imm:
  9714			fn = env->ops->get_func_proto(insn->imm, env->prog);
  9715			/* all functions that have prototype and verifier allowed
  9716			 * programs to call them, must be real in-kernel functions
  9717			 */
  9718			if (!fn->func) {
  9719				verbose(env,
  9720					"kernel subsystem misconfigured func %s#%d\n",
  9721					func_id_name(insn->imm), insn->imm);
  9722				return -EFAULT;
  9723			}
  9724			insn->imm = fn->func - __bpf_call_base;
  9725		}
  9726	
  9727		/* Since poke tab is now finalized, publish aux to tracker. */
  9728		for (i = 0; i < prog->aux->size_poke_tab; i++) {
  9729			map_ptr = prog->aux->poke_tab[i].tail_call.map;
  9730			if (!map_ptr->ops->map_poke_track ||
  9731			    !map_ptr->ops->map_poke_untrack ||
  9732			    !map_ptr->ops->map_poke_run) {
  9733				verbose(env, "bpf verifier is misconfigured\n");
  9734				return -EINVAL;
  9735			}
  9736	
  9737			ret = map_ptr->ops->map_poke_track(map_ptr, prog->aux);
  9738			if (ret < 0) {
  9739				verbose(env, "tracking tail call prog failed\n");
  9740				return ret;
  9741			}
  9742		}
  9743	
  9744		return 0;
  9745	}
  9746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
