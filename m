Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88711CAF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706436687; cv=none; b=ly0i5JpMmCku/S+M5YFV7eCWqVDB7zEt/h89g9BkY6ZX30JXDRoOJVuLqkF4dooxBmGMjxwybb9xiA8h4V0VfOROhVdx1Gcs21saM1kADWsfjKDYVA522dnxn96Tl7jIaGClqPQIU0WoDh2v8vibeLOqkYMpQYB0T2NLdvZMGTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706436687; c=relaxed/simple;
	bh=eeqPEPbOxUmgV6JmOmAonbE2/Ng48nAXpB83v0nahOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYjpSPF9aCPr2qT0bGpUe5NYcalaNuyxmalrxyNh7glUx2aP/xOv1nKD6Z9GvGHQOyDz8gFxd4VbXD3V7oqwCsxF2KO9Cc+GaKG8BX00HroIXj/qcUCn1nvZtNAtaAvQjp/AfCPBXZEJx9/g00jlVTj6FREGbr365RgW1UZfbXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArowNlFX; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArowNlFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706436685; x=1737972685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eeqPEPbOxUmgV6JmOmAonbE2/Ng48nAXpB83v0nahOA=;
  b=ArowNlFXqbp4gAfcKC6L9uCB7JJ/bZWA+W9yxTj92/8prZKi/wgo+Xf3
   Y1/ZjIP52UNOBI5F8KVe+Mdk2a0P0RhXvSIGGEQyc8TKokLFJKItivj/c
   yHBsWoEIQAX6gLAGkmySTEIif1CQZQ6UNpXH6yDqEwrgl3253Wkfdpttb
   aluTmf9VUj/R1W3kTnlLLF4U7CMB+nhDVCRLHPiEriO0QPFIVVWx9isfU
   hU/j8+wLy5ERhw9qMRDP6r0N9egwiRpjXdwHiDUm/ke1GgbuuzvCOmsXG
   xUlBK9AWV4IRjqMmk1aVtn6hK808K3MSWQRDn1gz8/sLrIm6NhkLvFbnm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="467027306"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="467027306"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 02:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21809626"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2024 02:11:22 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU28H-0003JW-1a;
	Sun, 28 Jan 2024 10:11:21 +0000
Date: Sun, 28 Jan 2024 18:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 6/10] kernel/bpf/verifier.c:18779: undefined
 reference to `bpf_arena_get_user_vm_start'
Message-ID: <202401281829.ul405zqt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   7ec22ac2adbc15f8ea20c1189b2dd95558ae3bcf
commit: f46bfe6061c3fb76aabd27fb9dec3deb98d0fc75 [6/10] bpf: Recognize cast_kern/user instructions in the verifier.
config: i386-randconfig-012-20240128 (https://download.01.org/0day-ci/archive/20240128/202401281829.ul405zqt-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281829.ul405zqt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281829.ul405zqt-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/syscall.o:(.rodata+0x624): undefined reference to `arena_map_ops'
   ld: kernel/bpf/verifier.o: in function `convert_ctx_accesses':
>> kernel/bpf/verifier.c:18779: undefined reference to `bpf_arena_get_user_vm_start'


vim +18779 kernel/bpf/verifier.c

 18685	
 18686	/* convert load instructions that access fields of a context type into a
 18687	 * sequence of instructions that access fields of the underlying structure:
 18688	 *     struct __sk_buff    -> struct sk_buff
 18689	 *     struct bpf_sock_ops -> struct sock
 18690	 */
 18691	static int convert_ctx_accesses(struct bpf_verifier_env *env)
 18692	{
 18693		const struct bpf_verifier_ops *ops = env->ops;
 18694		int i, cnt, size, ctx_field_size, delta = 0;
 18695		const int insn_cnt = env->prog->len;
 18696		struct bpf_insn insn_buf[16], *insn;
 18697		u32 target_size, size_default, off;
 18698		struct bpf_prog *new_prog;
 18699		enum bpf_access_type type;
 18700		bool is_narrower_load;
 18701	
 18702		if (ops->gen_prologue || env->seen_direct_write) {
 18703			if (!ops->gen_prologue) {
 18704				verbose(env, "bpf verifier is misconfigured\n");
 18705				return -EINVAL;
 18706			}
 18707			cnt = ops->gen_prologue(insn_buf, env->seen_direct_write,
 18708						env->prog);
 18709			if (cnt >= ARRAY_SIZE(insn_buf)) {
 18710				verbose(env, "bpf verifier is misconfigured\n");
 18711				return -EINVAL;
 18712			} else if (cnt) {
 18713				new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
 18714				if (!new_prog)
 18715					return -ENOMEM;
 18716	
 18717				env->prog = new_prog;
 18718				delta += cnt - 1;
 18719			}
 18720		}
 18721	
 18722		if (bpf_prog_is_offloaded(env->prog->aux))
 18723			return 0;
 18724	
 18725		insn = env->prog->insnsi + delta;
 18726	
 18727		for (i = 0; i < insn_cnt; i++, insn++) {
 18728			bpf_convert_ctx_access_t convert_ctx_access;
 18729			u8 mode;
 18730	
 18731			if (insn->code == (BPF_LDX | BPF_MEM | BPF_B) ||
 18732			    insn->code == (BPF_LDX | BPF_MEM | BPF_H) ||
 18733			    insn->code == (BPF_LDX | BPF_MEM | BPF_W) ||
 18734			    insn->code == (BPF_LDX | BPF_MEM | BPF_DW) ||
 18735			    insn->code == (BPF_LDX | BPF_MEMSX | BPF_B) ||
 18736			    insn->code == (BPF_LDX | BPF_MEMSX | BPF_H) ||
 18737			    insn->code == (BPF_LDX | BPF_MEMSX | BPF_W)) {
 18738				type = BPF_READ;
 18739			} else if (insn->code == (BPF_STX | BPF_MEM | BPF_B) ||
 18740				   insn->code == (BPF_STX | BPF_MEM | BPF_H) ||
 18741				   insn->code == (BPF_STX | BPF_MEM | BPF_W) ||
 18742				   insn->code == (BPF_STX | BPF_MEM | BPF_DW) ||
 18743				   insn->code == (BPF_ST | BPF_MEM | BPF_B) ||
 18744				   insn->code == (BPF_ST | BPF_MEM | BPF_H) ||
 18745				   insn->code == (BPF_ST | BPF_MEM | BPF_W) ||
 18746				   insn->code == (BPF_ST | BPF_MEM | BPF_DW)) {
 18747				type = BPF_WRITE;
 18748			} else if (insn->code == (BPF_ALU64 | BPF_MOV | BPF_X) && insn->imm) {
 18749				if (insn->off == BPF_ARENA_CAST_KERN) {
 18750					/* convert to 32-bit mov that clears upper 32-bit */
 18751					insn->code = BPF_ALU | BPF_MOV | BPF_X;
 18752					/* clear off, so it's a normal 'wX = wY' from JIT pov */
 18753					insn->off = 0;
 18754				} /* else insn->off == BPF_ARENA_CAST_USER should be handled by JIT */
 18755				continue;
 18756			} else {
 18757				continue;
 18758			}
 18759	
 18760			if (type == BPF_WRITE &&
 18761			    env->insn_aux_data[i + delta].sanitize_stack_spill) {
 18762				struct bpf_insn patch[] = {
 18763					*insn,
 18764					BPF_ST_NOSPEC(),
 18765				};
 18766	
 18767				cnt = ARRAY_SIZE(patch);
 18768				new_prog = bpf_patch_insn_data(env, i + delta, patch, cnt);
 18769				if (!new_prog)
 18770					return -ENOMEM;
 18771	
 18772				delta    += cnt - 1;
 18773				env->prog = new_prog;
 18774				insn      = new_prog->insnsi + i + delta;
 18775				continue;
 18776			}
 18777	
 18778			if (env->insn_aux_data[i + delta].ptr_type == PTR_TO_ARENA) {
 18779				u64 user_vm_start = bpf_arena_get_user_vm_start(env->prog->aux->arena);
 18780	
 18781				if (1) {
 18782					insn->code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32 | BPF_SIZE(insn->code);
 18783					env->prog->aux->num_exentries ++;
 18784					continue;
 18785				}
 18786	
 18787				struct bpf_insn patch[] = {
 18788					BPF_MOV32_REG(insn->dst_reg, insn->dst_reg),
 18789					*insn,
 18790					((struct bpf_insn) {
 18791					 .code    = BPF_ST | BPF_W | BPF_PROBE_MEM32,
 18792					 .dst_reg = insn->dst_reg,
 18793					 .src_reg = 0,
 18794					 .off     = 4,
 18795					 .imm     = user_vm_start >> 32,
 18796					 })
 18797				};
 18798				if (BPF_SIZE(insn->code) == BPF_DW) {
 18799					/* hack: assume 8-byte load/store are for uptr-s */
 18800					patch[1].code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32 | BPF_W;
 18801				} else {
 18802					patch[1].code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32 | BPF_SIZE(insn->code);
 18803				}
 18804	
 18805				if (type == BPF_WRITE) {
 18806					cnt = 3;
 18807				} else {
 18808					cnt = 2;
 18809					patch[0].src_reg = patch[0].dst_reg = insn->src_reg;
 18810				}
 18811	
 18812				new_prog = bpf_patch_insn_data(env, i + delta, patch, cnt);
 18813				if (!new_prog)
 18814					return -ENOMEM;
 18815	
 18816				delta    += cnt - 1;
 18817				env->prog = new_prog;
 18818				insn      = new_prog->insnsi + i + delta;
 18819	
 18820				/* ldx mem32 is one extable insn while stx mem32 needs two */
 18821				env->prog->aux->num_exentries += cnt - 1;
 18822				continue;
 18823			}
 18824	
 18825			switch ((int)env->insn_aux_data[i + delta].ptr_type) {
 18826			case PTR_TO_CTX:
 18827				if (!ops->convert_ctx_access)
 18828					continue;
 18829				convert_ctx_access = ops->convert_ctx_access;
 18830				break;
 18831			case PTR_TO_SOCKET:
 18832			case PTR_TO_SOCK_COMMON:
 18833				convert_ctx_access = bpf_sock_convert_ctx_access;
 18834				break;
 18835			case PTR_TO_TCP_SOCK:
 18836				convert_ctx_access = bpf_tcp_sock_convert_ctx_access;
 18837				break;
 18838			case PTR_TO_XDP_SOCK:
 18839				convert_ctx_access = bpf_xdp_sock_convert_ctx_access;
 18840				break;
 18841			case PTR_TO_BTF_ID:
 18842			case PTR_TO_BTF_ID | PTR_UNTRUSTED:
 18843			/* PTR_TO_BTF_ID | MEM_ALLOC always has a valid lifetime, unlike
 18844			 * PTR_TO_BTF_ID, and an active ref_obj_id, but the same cannot
 18845			 * be said once it is marked PTR_UNTRUSTED, hence we must handle
 18846			 * any faults for loads into such types. BPF_WRITE is disallowed
 18847			 * for this case.
 18848			 */
 18849			case PTR_TO_BTF_ID | MEM_ALLOC | PTR_UNTRUSTED:
 18850				if (type == BPF_READ) {
 18851					if (BPF_MODE(insn->code) == BPF_MEM)
 18852						insn->code = BPF_LDX | BPF_PROBE_MEM |
 18853							     BPF_SIZE((insn)->code);
 18854					else
 18855						insn->code = BPF_LDX | BPF_PROBE_MEMSX |
 18856							     BPF_SIZE((insn)->code);
 18857					env->prog->aux->num_exentries++;
 18858				}
 18859				continue;
 18860			default:
 18861				continue;
 18862			}
 18863	
 18864			ctx_field_size = env->insn_aux_data[i + delta].ctx_field_size;
 18865			size = BPF_LDST_BYTES(insn);
 18866			mode = BPF_MODE(insn->code);
 18867	
 18868			/* If the read access is a narrower load of the field,
 18869			 * convert to a 4/8-byte load, to minimum program type specific
 18870			 * convert_ctx_access changes. If conversion is successful,
 18871			 * we will apply proper mask to the result.
 18872			 */
 18873			is_narrower_load = size < ctx_field_size;
 18874			size_default = bpf_ctx_off_adjust_machine(ctx_field_size);
 18875			off = insn->off;
 18876			if (is_narrower_load) {
 18877				u8 size_code;
 18878	
 18879				if (type == BPF_WRITE) {
 18880					verbose(env, "bpf verifier narrow ctx access misconfigured\n");
 18881					return -EINVAL;
 18882				}
 18883	
 18884				size_code = BPF_H;
 18885				if (ctx_field_size == 4)
 18886					size_code = BPF_W;
 18887				else if (ctx_field_size == 8)
 18888					size_code = BPF_DW;
 18889	
 18890				insn->off = off & ~(size_default - 1);
 18891				insn->code = BPF_LDX | BPF_MEM | size_code;
 18892			}
 18893	
 18894			target_size = 0;
 18895			cnt = convert_ctx_access(type, insn, insn_buf, env->prog,
 18896						 &target_size);
 18897			if (cnt == 0 || cnt >= ARRAY_SIZE(insn_buf) ||
 18898			    (ctx_field_size && !target_size)) {
 18899				verbose(env, "bpf verifier is misconfigured\n");
 18900				return -EINVAL;
 18901			}
 18902	
 18903			if (is_narrower_load && size < target_size) {
 18904				u8 shift = bpf_ctx_narrow_access_offset(
 18905					off, size, size_default) * 8;
 18906				if (shift && cnt + 1 >= ARRAY_SIZE(insn_buf)) {
 18907					verbose(env, "bpf verifier narrow ctx load misconfigured\n");
 18908					return -EINVAL;
 18909				}
 18910				if (ctx_field_size <= 4) {
 18911					if (shift)
 18912						insn_buf[cnt++] = BPF_ALU32_IMM(BPF_RSH,
 18913										insn->dst_reg,
 18914										shift);
 18915					insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
 18916									(1 << size * 8) - 1);
 18917				} else {
 18918					if (shift)
 18919						insn_buf[cnt++] = BPF_ALU64_IMM(BPF_RSH,
 18920										insn->dst_reg,
 18921										shift);
 18922					insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
 18923									(1ULL << size * 8) - 1);
 18924				}
 18925			}
 18926			if (mode == BPF_MEMSX)
 18927				insn_buf[cnt++] = BPF_RAW_INSN(BPF_ALU64 | BPF_MOV | BPF_X,
 18928							       insn->dst_reg, insn->dst_reg,
 18929							       size * 8, 0);
 18930	
 18931			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 18932			if (!new_prog)
 18933				return -ENOMEM;
 18934	
 18935			delta += cnt - 1;
 18936	
 18937			/* keep walking new program and skip insns we just inserted */
 18938			env->prog = new_prog;
 18939			insn      = new_prog->insnsi + i + delta;
 18940		}
 18941	
 18942		return 0;
 18943	}
 18944	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
