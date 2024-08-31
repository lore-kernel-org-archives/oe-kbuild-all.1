Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939BC193
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725094856; cv=none; b=fPZtnPIdPzNlB41+j3chUjHh1asF7e3ws4pWX6RdWkyFrSfhkM6ngSE0hoDi1JlSnkUM6brhekiqsq3i/H9zGW5vi2KUkHm61wsT5NgXPjURYCL3uHo+M1ptGDADcFgo/OPAG4bKpyflnjxByGiTbp7Fe4HlDlH09N28k44kLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725094856; c=relaxed/simple;
	bh=YdwftBO6lIWSeapyTt9HPaNWHzLfLkG1L8oOkDXX06M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SwBFXUB4vKIQ7U+0T6ITSyVgeXiliNpiqZiz3hfeEpuZEoE7jcYSbmhG9zWNodTXNfngsSpQIxiS1DNzvTcmgd9CeGSR+4B1wlWTaEH7rCZYhT+cEh46RS++9c7c7/wMnSruHdpW1mGhm8oHzOecJUepnQFhcYHM3+A84PytQPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=he4JA7fW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="he4JA7fW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725094854; x=1756630854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YdwftBO6lIWSeapyTt9HPaNWHzLfLkG1L8oOkDXX06M=;
  b=he4JA7fWc9pTTxJZEIG3itVCjY4Znp23BlvLDXszbfFzguAK6YqSLJhj
   3UZNVZir4UfEdeY//SZ39hIBZK0KT109BJY7rTRDg5iP/0stM4aubzR9F
   mfZji6shI3jkNsOrrSIxbCScla57WYYCXQ9VQ/0bcMe8v3Nf1gOTXdSbb
   5PPmHHwguQh8wvxtC1CKK4ql689fEdkz/OfWxlQDwsZBv9XSP+c4EHZbA
   GkeDftlnmo4M46AnoZMa9HdUfMnWPhA3vIAgZexyIXwKvTtrLZIUt6CFj
   rF4b8C2yTqTG70JgEXlYWDJbWtEQO5h6SAAJ2I2F97oTKv3BFLEcyoTtg
   g==;
X-CSE-ConnectionGUID: Dv4nU9aHQ6GfnC5NLjeFHQ==
X-CSE-MsgGUID: M7oiqnJHTO6spW6zQcMrUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23906583"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23906583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 02:00:54 -0700
X-CSE-ConnectionGUID: Cm3ywYnIQSO1iTak4ikSyQ==
X-CSE-MsgGUID: vYgz+Kj/SEaFNePuBQmTUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="68790903"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2024 02:00:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skJyU-0002Uy-2g;
	Sat, 31 Aug 2024 09:00:50 +0000
Date: Sat, 31 Aug 2024 17:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 6/17] kernel/bpf/verifier.c:19785
 convert_ctx_accesses() warn: inconsistent indenting
Message-ID: <202408311622.4GzlzN33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   2ad6d23f465a4f851e3bcf6d74c315ce7b2c205b
commit: 169c31761c8d7f606f3ee628829c27998626c4f0 [6/17] bpf: Add gen_epilogue to bpf_verifier_ops
config: parisc-randconfig-r071-20240831 (https://download.01.org/0day-ci/archive/20240831/202408311622.4GzlzN33-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311622.4GzlzN33-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:19785 convert_ctx_accesses() warn: inconsistent indenting

vim +19785 kernel/bpf/verifier.c

 19672	
 19673	/* convert load instructions that access fields of a context type into a
 19674	 * sequence of instructions that access fields of the underlying structure:
 19675	 *     struct __sk_buff    -> struct sk_buff
 19676	 *     struct bpf_sock_ops -> struct sock
 19677	 */
 19678	static int convert_ctx_accesses(struct bpf_verifier_env *env)
 19679	{
 19680		struct bpf_subprog_info *subprogs = env->subprog_info;
 19681		const struct bpf_verifier_ops *ops = env->ops;
 19682		int i, cnt, size, ctx_field_size, delta = 0, epilogue_cnt = 0;
 19683		const int insn_cnt = env->prog->len;
 19684		struct bpf_insn *epilogue_buf = env->epilogue_buf;
 19685		struct bpf_insn *insn_buf = env->insn_buf;
 19686		struct bpf_insn *insn;
 19687		u32 target_size, size_default, off;
 19688		struct bpf_prog *new_prog;
 19689		enum bpf_access_type type;
 19690		bool is_narrower_load;
 19691		int epilogue_idx = 0;
 19692	
 19693		if (ops->gen_epilogue) {
 19694			epilogue_cnt = ops->gen_epilogue(epilogue_buf, env->prog,
 19695							 -(subprogs[0].stack_depth + 8));
 19696			if (epilogue_cnt >= INSN_BUF_SIZE) {
 19697				verbose(env, "bpf verifier is misconfigured\n");
 19698				return -EINVAL;
 19699			} else if (epilogue_cnt) {
 19700				/* Save the ARG_PTR_TO_CTX for the epilogue to use */
 19701				cnt = 0;
 19702				subprogs[0].stack_depth += 8;
 19703				insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_FP, BPF_REG_1,
 19704							      -subprogs[0].stack_depth);
 19705				insn_buf[cnt++] = env->prog->insnsi[0];
 19706				new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
 19707				if (!new_prog)
 19708					return -ENOMEM;
 19709				env->prog = new_prog;
 19710				delta += cnt - 1;
 19711			}
 19712		}
 19713	
 19714		if (ops->gen_prologue || env->seen_direct_write) {
 19715			if (!ops->gen_prologue) {
 19716				verbose(env, "bpf verifier is misconfigured\n");
 19717				return -EINVAL;
 19718			}
 19719			cnt = ops->gen_prologue(insn_buf, env->seen_direct_write,
 19720						env->prog);
 19721			if (cnt >= INSN_BUF_SIZE) {
 19722				verbose(env, "bpf verifier is misconfigured\n");
 19723				return -EINVAL;
 19724			} else if (cnt) {
 19725				new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
 19726				if (!new_prog)
 19727					return -ENOMEM;
 19728	
 19729				env->prog = new_prog;
 19730				delta += cnt - 1;
 19731			}
 19732		}
 19733	
 19734		if (delta)
 19735			WARN_ON(adjust_jmp_off(env->prog, 0, delta));
 19736	
 19737		if (bpf_prog_is_offloaded(env->prog->aux))
 19738			return 0;
 19739	
 19740		insn = env->prog->insnsi + delta;
 19741	
 19742		for (i = 0; i < insn_cnt; i++, insn++) {
 19743			bpf_convert_ctx_access_t convert_ctx_access;
 19744			u8 mode;
 19745	
 19746			if (insn->code == (BPF_LDX | BPF_MEM | BPF_B) ||
 19747			    insn->code == (BPF_LDX | BPF_MEM | BPF_H) ||
 19748			    insn->code == (BPF_LDX | BPF_MEM | BPF_W) ||
 19749			    insn->code == (BPF_LDX | BPF_MEM | BPF_DW) ||
 19750			    insn->code == (BPF_LDX | BPF_MEMSX | BPF_B) ||
 19751			    insn->code == (BPF_LDX | BPF_MEMSX | BPF_H) ||
 19752			    insn->code == (BPF_LDX | BPF_MEMSX | BPF_W)) {
 19753				type = BPF_READ;
 19754			} else if (insn->code == (BPF_STX | BPF_MEM | BPF_B) ||
 19755				   insn->code == (BPF_STX | BPF_MEM | BPF_H) ||
 19756				   insn->code == (BPF_STX | BPF_MEM | BPF_W) ||
 19757				   insn->code == (BPF_STX | BPF_MEM | BPF_DW) ||
 19758				   insn->code == (BPF_ST | BPF_MEM | BPF_B) ||
 19759				   insn->code == (BPF_ST | BPF_MEM | BPF_H) ||
 19760				   insn->code == (BPF_ST | BPF_MEM | BPF_W) ||
 19761				   insn->code == (BPF_ST | BPF_MEM | BPF_DW)) {
 19762				type = BPF_WRITE;
 19763			} else if ((insn->code == (BPF_STX | BPF_ATOMIC | BPF_W) ||
 19764				    insn->code == (BPF_STX | BPF_ATOMIC | BPF_DW)) &&
 19765				   env->insn_aux_data[i + delta].ptr_type == PTR_TO_ARENA) {
 19766				insn->code = BPF_STX | BPF_PROBE_ATOMIC | BPF_SIZE(insn->code);
 19767				env->prog->aux->num_exentries++;
 19768				continue;
 19769			} else if (insn->code == (BPF_JMP | BPF_EXIT) &&
 19770				   epilogue_cnt &&
 19771				   i + delta < subprogs[1].start) {
 19772				/* Generate epilogue for the main prog */
 19773				if (epilogue_idx) {
 19774					/* jump back to the earlier generated epilogue */
 19775					insn_buf[0] = BPF_JMP32_A(epilogue_idx - i - delta - 1);
 19776					cnt = 1;
 19777				} else {
 19778					memcpy(insn_buf, epilogue_buf,
 19779					       epilogue_cnt * sizeof(*epilogue_buf));
 19780					cnt = epilogue_cnt;
 19781					/* epilogue_idx cannot be 0. It must have at
 19782					 * least one ctx ptr saving insn before the
 19783					 * epilogue.
 19784					 */
 19785					 epilogue_idx = i + delta;
 19786				}
 19787				goto patch_insn_buf;
 19788			} else {
 19789				continue;
 19790			}
 19791	
 19792			if (type == BPF_WRITE &&
 19793			    env->insn_aux_data[i + delta].sanitize_stack_spill) {
 19794				struct bpf_insn patch[] = {
 19795					*insn,
 19796					BPF_ST_NOSPEC(),
 19797				};
 19798	
 19799				cnt = ARRAY_SIZE(patch);
 19800				new_prog = bpf_patch_insn_data(env, i + delta, patch, cnt);
 19801				if (!new_prog)
 19802					return -ENOMEM;
 19803	
 19804				delta    += cnt - 1;
 19805				env->prog = new_prog;
 19806				insn      = new_prog->insnsi + i + delta;
 19807				continue;
 19808			}
 19809	
 19810			switch ((int)env->insn_aux_data[i + delta].ptr_type) {
 19811			case PTR_TO_CTX:
 19812				if (!ops->convert_ctx_access)
 19813					continue;
 19814				convert_ctx_access = ops->convert_ctx_access;
 19815				break;
 19816			case PTR_TO_SOCKET:
 19817			case PTR_TO_SOCK_COMMON:
 19818				convert_ctx_access = bpf_sock_convert_ctx_access;
 19819				break;
 19820			case PTR_TO_TCP_SOCK:
 19821				convert_ctx_access = bpf_tcp_sock_convert_ctx_access;
 19822				break;
 19823			case PTR_TO_XDP_SOCK:
 19824				convert_ctx_access = bpf_xdp_sock_convert_ctx_access;
 19825				break;
 19826			case PTR_TO_BTF_ID:
 19827			case PTR_TO_BTF_ID | PTR_UNTRUSTED:
 19828			/* PTR_TO_BTF_ID | MEM_ALLOC always has a valid lifetime, unlike
 19829			 * PTR_TO_BTF_ID, and an active ref_obj_id, but the same cannot
 19830			 * be said once it is marked PTR_UNTRUSTED, hence we must handle
 19831			 * any faults for loads into such types. BPF_WRITE is disallowed
 19832			 * for this case.
 19833			 */
 19834			case PTR_TO_BTF_ID | MEM_ALLOC | PTR_UNTRUSTED:
 19835				if (type == BPF_READ) {
 19836					if (BPF_MODE(insn->code) == BPF_MEM)
 19837						insn->code = BPF_LDX | BPF_PROBE_MEM |
 19838							     BPF_SIZE((insn)->code);
 19839					else
 19840						insn->code = BPF_LDX | BPF_PROBE_MEMSX |
 19841							     BPF_SIZE((insn)->code);
 19842					env->prog->aux->num_exentries++;
 19843				}
 19844				continue;
 19845			case PTR_TO_ARENA:
 19846				if (BPF_MODE(insn->code) == BPF_MEMSX) {
 19847					verbose(env, "sign extending loads from arena are not supported yet\n");
 19848					return -EOPNOTSUPP;
 19849				}
 19850				insn->code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32 | BPF_SIZE(insn->code);
 19851				env->prog->aux->num_exentries++;
 19852				continue;
 19853			default:
 19854				continue;
 19855			}
 19856	
 19857			ctx_field_size = env->insn_aux_data[i + delta].ctx_field_size;
 19858			size = BPF_LDST_BYTES(insn);
 19859			mode = BPF_MODE(insn->code);
 19860	
 19861			/* If the read access is a narrower load of the field,
 19862			 * convert to a 4/8-byte load, to minimum program type specific
 19863			 * convert_ctx_access changes. If conversion is successful,
 19864			 * we will apply proper mask to the result.
 19865			 */
 19866			is_narrower_load = size < ctx_field_size;
 19867			size_default = bpf_ctx_off_adjust_machine(ctx_field_size);
 19868			off = insn->off;
 19869			if (is_narrower_load) {
 19870				u8 size_code;
 19871	
 19872				if (type == BPF_WRITE) {
 19873					verbose(env, "bpf verifier narrow ctx access misconfigured\n");
 19874					return -EINVAL;
 19875				}
 19876	
 19877				size_code = BPF_H;
 19878				if (ctx_field_size == 4)
 19879					size_code = BPF_W;
 19880				else if (ctx_field_size == 8)
 19881					size_code = BPF_DW;
 19882	
 19883				insn->off = off & ~(size_default - 1);
 19884				insn->code = BPF_LDX | BPF_MEM | size_code;
 19885			}
 19886	
 19887			target_size = 0;
 19888			cnt = convert_ctx_access(type, insn, insn_buf, env->prog,
 19889						 &target_size);
 19890			if (cnt == 0 || cnt >= INSN_BUF_SIZE ||
 19891			    (ctx_field_size && !target_size)) {
 19892				verbose(env, "bpf verifier is misconfigured\n");
 19893				return -EINVAL;
 19894			}
 19895	
 19896			if (is_narrower_load && size < target_size) {
 19897				u8 shift = bpf_ctx_narrow_access_offset(
 19898					off, size, size_default) * 8;
 19899				if (shift && cnt + 1 >= INSN_BUF_SIZE) {
 19900					verbose(env, "bpf verifier narrow ctx load misconfigured\n");
 19901					return -EINVAL;
 19902				}
 19903				if (ctx_field_size <= 4) {
 19904					if (shift)
 19905						insn_buf[cnt++] = BPF_ALU32_IMM(BPF_RSH,
 19906										insn->dst_reg,
 19907										shift);
 19908					insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
 19909									(1 << size * 8) - 1);
 19910				} else {
 19911					if (shift)
 19912						insn_buf[cnt++] = BPF_ALU64_IMM(BPF_RSH,
 19913										insn->dst_reg,
 19914										shift);
 19915					insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
 19916									(1ULL << size * 8) - 1);
 19917				}
 19918			}
 19919			if (mode == BPF_MEMSX)
 19920				insn_buf[cnt++] = BPF_RAW_INSN(BPF_ALU64 | BPF_MOV | BPF_X,
 19921							       insn->dst_reg, insn->dst_reg,
 19922							       size * 8, 0);
 19923	
 19924	patch_insn_buf:
 19925			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
 19926			if (!new_prog)
 19927				return -ENOMEM;
 19928	
 19929			delta += cnt - 1;
 19930	
 19931			/* keep walking new program and skip insns we just inserted */
 19932			env->prog = new_prog;
 19933			insn      = new_prog->insnsi + i + delta;
 19934		}
 19935	
 19936		return 0;
 19937	}
 19938	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
