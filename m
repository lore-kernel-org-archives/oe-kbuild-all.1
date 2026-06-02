Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61448397352
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 20:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433972; cv=none; b=qsEF4IqDxe68G/v0Ti/eeitiJPvScl4i4atymdvek4ecfe52Ml98eflu/YSg3NekMRcmanuewyu2/X9IuODKYuRmKT3keDHH8ZO8EkopDYN86/c3tc9lm2CG9qF7FWbQCq/LD+nbNyoMJTgOLsafzDuzOJTFPNtyEbOYSOY6BfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433972; c=relaxed/simple;
	bh=S1yQ667AZmZEDn8LyMpuVO8qfM5C/mnYY8cOvgjGXO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dwNXId9hTkSCAOgNFllj1V1DQIiaVLKFtUs/F1TzZchoJBSereYfG4DophT1YNZBrv4xqmtUoUbrvROcK8lN0oMhZ/1UPz58Wyaar67DEPAe7BHhwDblZ7XblnPdAmyN0hqBoOk7LrswXEixOIAKBbdkiI4ZmEOy4raNn/5SKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOJ0vzV1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOJ0vzV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780433969; x=1811969969;
  h=date:from:to:cc:subject:message-id;
  bh=S1yQ667AZmZEDn8LyMpuVO8qfM5C/mnYY8cOvgjGXO0=;
  b=bOJ0vzV1MdoO3r2NMCc+Wqi8FbNBFJ/qjgwjyh7EQhBj8EioZL6mJv15
   Xiq/lndFuqIeKROhHzDhOw93VT12OxqEcBwwTJxKta8dLJDxMUSLxfBAK
   qNrFmSbPpxwSpHBCMOfhk7y5J+aYDswcCKz6fnM0rjTwFGxyZVYSFYjuw
   iotPS+IyAi3K9i9gxM9Qo6h0h0axmhILAPUQvV2XxpSRuTHUQPcSnWJ/p
   AhRLsnq0TcDlrWT9/uvYmRZ75YKh7a46ptqz/VXd1Z4DrJSmyhU3qa+82
   qPfslXr429zBcgO3cIn+iKFuaLRxDLPJWitefviJrhdUWRi4J2paMr+5+
   w==;
X-CSE-ConnectionGUID: umLgcbK8Tk6/BWb0w7fGXQ==
X-CSE-MsgGUID: W1xFHVAQQluE8hxP06O4Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83814524"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="83814524"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 13:59:28 -0700
X-CSE-ConnectionGUID: 9idgL2EIREmmBL8dmV4xEw==
X-CSE-MsgGUID: 5w0WkcuJRyGF67TGOuZzgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237662526"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2026 13:59:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUWCq-00000000CVk-3S34;
	Tue, 02 Jun 2026 20:59:24 +0000
Date: Wed, 03 Jun 2026 04:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 20/45] kernel/bpf/verifier.c:12923:27:
 warning: variable 'stack' set but not used
Message-ID: <202606030451.h3w717Mc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   b93c55b4932dd7e32dca8cf34a3443cc87a02906
commit: 308c7a0ae8859b34d9d90a3dff953b2d14242145 [20/45] bpf: Refactor object relationship tracking and fix dynptr UAF bug
config: sparc-randconfig-r072-20260603 (https://download.01.org/0day-ci/archive/20260603/202606030451.h3w717Mc-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030451.h3w717Mc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030451.h3w717Mc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_kfunc_call':
>> kernel/bpf/verifier.c:12923:27: warning: variable 'stack' set but not used [-Wunused-but-set-variable]
      struct bpf_stack_state *stack;
                              ^~~~~

smatch warnings:
kernel/bpf/verifier.c:13118 check_kfunc_call() warn: unsigned 'id' is never less than zero.
kernel/bpf/verifier.c:13118 check_kfunc_call() warn: error code type promoted to positive: 'id'

vim +/stack +12923 kernel/bpf/verifier.c

 12799	
 12800	static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 12801				    int *insn_idx_p)
 12802	{
 12803		bool sleepable, rcu_lock, rcu_unlock, preempt_disable, preempt_enable;
 12804		struct bpf_reg_state *regs = cur_regs(env);
 12805		const char *func_name, *ptr_type_name;
 12806		const struct btf_type *t, *ptr_type;
 12807		struct bpf_kfunc_call_arg_meta meta;
 12808		struct bpf_insn_aux_data *insn_aux;
 12809		int err, insn_idx = *insn_idx_p;
 12810		u32 i, nargs, ptr_type_id, id;
 12811		const struct btf_param *args;
 12812		struct btf *desc_btf;
 12813	
 12814		/* skip for now, but return error when we find this in fixup_kfunc_call */
 12815		if (!insn->imm)
 12816			return 0;
 12817	
 12818		err = bpf_fetch_kfunc_arg_meta(env, insn->imm, insn->off, &meta);
 12819		if (err == -EACCES && meta.func_name)
 12820			verbose(env, "calling kernel function %s is not allowed\n", meta.func_name);
 12821		if (err)
 12822			return err;
 12823		desc_btf = meta.btf;
 12824		func_name = meta.func_name;
 12825		insn_aux = &env->insn_aux_data[insn_idx];
 12826	
 12827		insn_aux->is_iter_next = bpf_is_iter_next_kfunc(&meta);
 12828	
 12829		if (!insn->off &&
 12830		    (insn->imm == special_kfunc_list[KF_bpf_res_spin_lock] ||
 12831		     insn->imm == special_kfunc_list[KF_bpf_res_spin_lock_irqsave])) {
 12832			struct bpf_verifier_state *branch;
 12833			struct bpf_reg_state *regs;
 12834	
 12835			branch = push_stack(env, env->insn_idx + 1, env->insn_idx, false);
 12836			if (IS_ERR(branch)) {
 12837				verbose(env, "failed to push state for failed lock acquisition\n");
 12838				return PTR_ERR(branch);
 12839			}
 12840	
 12841			regs = branch->frame[branch->curframe]->regs;
 12842	
 12843			/* Clear r0-r5 registers in forked state */
 12844			for (i = 0; i < CALLER_SAVED_REGS; i++)
 12845				bpf_mark_reg_not_init(env, &regs[caller_saved[i]]);
 12846	
 12847			mark_reg_unknown(env, regs, BPF_REG_0);
 12848			err = __mark_reg_s32_range(env, regs, BPF_REG_0, -MAX_ERRNO, -1);
 12849			if (err) {
 12850				verbose(env, "failed to mark s32 range for retval in forked state for lock\n");
 12851				return err;
 12852			}
 12853			__mark_btf_func_reg_size(env, regs, BPF_REG_0, sizeof(u32));
 12854		} else if (!insn->off && insn->imm == special_kfunc_list[KF___bpf_trap]) {
 12855			verbose(env, "unexpected __bpf_trap() due to uninitialized variable?\n");
 12856			return -EFAULT;
 12857		}
 12858	
 12859		if (is_kfunc_destructive(&meta) && !capable(CAP_SYS_BOOT)) {
 12860			verbose(env, "destructive kfunc calls require CAP_SYS_BOOT capability\n");
 12861			return -EACCES;
 12862		}
 12863	
 12864		sleepable = bpf_is_kfunc_sleepable(&meta);
 12865		if (sleepable && !in_sleepable(env)) {
 12866			verbose(env, "program must be sleepable to call sleepable kfunc %s\n", func_name);
 12867			return -EACCES;
 12868		}
 12869	
 12870		/* Track non-sleepable context for kfuncs, same as for helpers. */
 12871		if (!in_sleepable_context(env))
 12872			insn_aux->non_sleepable = true;
 12873	
 12874		/* Check the arguments */
 12875		err = check_kfunc_args(env, &meta, insn_idx);
 12876		if (err < 0)
 12877			return err;
 12878	
 12879		if (is_bpf_rbtree_add_kfunc(meta.func_id)) {
 12880			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 12881						 set_rbtree_add_callback_state);
 12882			if (err) {
 12883				verbose(env, "kfunc %s#%d failed callback verification\n",
 12884					func_name, meta.func_id);
 12885				return err;
 12886			}
 12887		}
 12888	
 12889		if (meta.func_id == special_kfunc_list[KF_bpf_session_cookie]) {
 12890			meta.r0_size = sizeof(u64);
 12891			meta.r0_rdonly = false;
 12892		}
 12893	
 12894		if (is_bpf_wq_set_callback_kfunc(meta.func_id)) {
 12895			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 12896						 set_timer_callback_state);
 12897			if (err) {
 12898				verbose(env, "kfunc %s#%d failed callback verification\n",
 12899					func_name, meta.func_id);
 12900				return err;
 12901			}
 12902		}
 12903	
 12904		if (is_task_work_add_kfunc(meta.func_id)) {
 12905			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 12906						 set_task_work_schedule_callback_state);
 12907			if (err) {
 12908				verbose(env, "kfunc %s#%d failed callback verification\n",
 12909					func_name, meta.func_id);
 12910				return err;
 12911			}
 12912		}
 12913	
 12914		rcu_lock = is_kfunc_bpf_rcu_read_lock(&meta);
 12915		rcu_unlock = is_kfunc_bpf_rcu_read_unlock(&meta);
 12916	
 12917		preempt_disable = is_kfunc_bpf_preempt_disable(&meta);
 12918		preempt_enable = is_kfunc_bpf_preempt_enable(&meta);
 12919	
 12920		if (rcu_lock) {
 12921			env->cur_state->active_rcu_locks++;
 12922		} else if (rcu_unlock) {
 12923			struct bpf_stack_state *stack;
 12924			struct bpf_func_state *state;
 12925			struct bpf_reg_state *reg;
 12926			u32 clear_mask = (1 << STACK_SPILL) | (1 << STACK_ITER);
 12927	
 12928			if (env->cur_state->active_rcu_locks == 0) {
 12929				verbose(env, "unmatched rcu read unlock (kernel function %s)\n", func_name);
 12930				return -EINVAL;
 12931			}
 12932			if (--env->cur_state->active_rcu_locks == 0) {
 12933				bpf_for_each_reg_in_vstate_mask(env->cur_state, state, reg, stack, clear_mask, ({
 12934					if (reg->type & MEM_RCU) {
 12935						reg->type &= ~(MEM_RCU | PTR_MAYBE_NULL);
 12936						reg->type |= PTR_UNTRUSTED;
 12937					}
 12938				}));
 12939			}
 12940		} else if (preempt_disable) {
 12941			env->cur_state->active_preempt_locks++;
 12942		} else if (preempt_enable) {
 12943			if (env->cur_state->active_preempt_locks == 0) {
 12944				verbose(env, "unmatched attempt to enable preemption (kernel function %s)\n", func_name);
 12945				return -EINVAL;
 12946			}
 12947			env->cur_state->active_preempt_locks--;
 12948		}
 12949	
 12950		if (sleepable && !in_sleepable_context(env)) {
 12951			verbose(env, "kernel func %s is sleepable within %s\n",
 12952				func_name, non_sleepable_context_description(env));
 12953			return -EACCES;
 12954		}
 12955	
 12956		if (in_rbtree_lock_required_cb(env) && (rcu_lock || rcu_unlock)) {
 12957			verbose(env, "Calling bpf_rcu_read_{lock,unlock} in unnecessary rbtree callback\n");
 12958			return -EACCES;
 12959		}
 12960	
 12961		if (is_kfunc_rcu_protected(&meta) && !in_rcu_cs(env)) {
 12962			verbose(env, "kernel func %s requires RCU critical section protection\n", func_name);
 12963			return -EACCES;
 12964		}
 12965	
 12966		/* In case of release function, we get register number of refcounted
 12967		 * PTR_TO_BTF_ID in bpf_kfunc_arg_meta, do the release now.
 12968		 */
 12969		if (meta.release_regno) {
 12970			struct bpf_reg_state *reg = &regs[meta.release_regno];
 12971	
 12972			if (meta.dynptr.id) {
 12973				err = unmark_stack_slots_dynptr(env, reg);
 12974			} else {
 12975				err = release_reference(env, reg->id);
 12976			}
 12977			if (err)
 12978				return err;
 12979		}
 12980	
 12981		if (is_bpf_list_push_kfunc(meta.func_id) || is_bpf_rbtree_add_kfunc(meta.func_id)) {
 12982			id = regs[BPF_REG_2].id;
 12983			insn_aux->insert_off = regs[BPF_REG_2].var_off.value;
 12984			insn_aux->kptr_struct_meta = btf_find_struct_meta(meta.arg_btf, meta.arg_btf_id);
 12985			ref_convert_owning_non_owning(env, id);
 12986		}
 12987	
 12988		if (meta.func_id == special_kfunc_list[KF_bpf_throw]) {
 12989			if (!bpf_jit_supports_exceptions()) {
 12990				verbose(env, "JIT does not support calling kfunc %s#%d\n",
 12991					func_name, meta.func_id);
 12992				return -ENOTSUPP;
 12993			}
 12994			env->seen_exception = true;
 12995	
 12996			/* In the case of the default callback, the cookie value passed
 12997			 * to bpf_throw becomes the return value of the program.
 12998			 */
 12999			if (!env->exception_callback_subprog) {
 13000				err = check_return_code(env, BPF_REG_1, "R1");
 13001				if (err < 0)
 13002					return err;
 13003			}
 13004		}
 13005	
 13006		for (i = 0; i < CALLER_SAVED_REGS; i++) {
 13007			u32 regno = caller_saved[i];
 13008	
 13009			bpf_mark_reg_not_init(env, &regs[regno]);
 13010			regs[regno].subreg_def = DEF_NOT_SUBREG;
 13011		}
 13012		invalidate_outgoing_stack_args(env, cur_func(env));
 13013	
 13014		/* Check return type */
 13015		t = btf_type_skip_modifiers(desc_btf, meta.func_proto->type, NULL);
 13016	
 13017		if (is_kfunc_acquire(&meta) && !btf_type_is_struct_ptr(meta.btf, t)) {
 13018			if (meta.btf != btf_vmlinux ||
 13019			    (!is_bpf_obj_new_kfunc(meta.func_id) &&
 13020			     !is_bpf_percpu_obj_new_kfunc(meta.func_id) &&
 13021			     !is_bpf_refcount_acquire_kfunc(meta.func_id))) {
 13022				verbose(env, "acquire kernel function does not return PTR_TO_BTF_ID\n");
 13023				return -EINVAL;
 13024			}
 13025		}
 13026	
 13027		if (btf_type_is_scalar(t)) {
 13028			mark_reg_unknown(env, regs, BPF_REG_0);
 13029			if (meta.btf == btf_vmlinux && (meta.func_id == special_kfunc_list[KF_bpf_res_spin_lock] ||
 13030			    meta.func_id == special_kfunc_list[KF_bpf_res_spin_lock_irqsave]))
 13031				__mark_reg_const_zero(env, &regs[BPF_REG_0]);
 13032			mark_btf_func_reg_size(env, BPF_REG_0, t->size);
 13033		} else if (btf_type_is_ptr(t)) {
 13034			ptr_type = btf_type_skip_modifiers(desc_btf, t->type, &ptr_type_id);
 13035			err = check_special_kfunc(env, &meta, regs, insn_aux, ptr_type, desc_btf);
 13036			if (err) {
 13037				if (err < 0)
 13038					return err;
 13039			} else if (btf_type_is_void(ptr_type)) {
 13040				/* kfunc returning 'void *' is equivalent to returning scalar */
 13041				mark_reg_unknown(env, regs, BPF_REG_0);
 13042			} else if (!__btf_type_is_struct(ptr_type)) {
 13043				if (!meta.r0_size) {
 13044					__u32 sz;
 13045	
 13046					if (!IS_ERR(btf_resolve_size(desc_btf, ptr_type, &sz))) {
 13047						meta.r0_size = sz;
 13048						meta.r0_rdonly = true;
 13049					}
 13050				}
 13051				if (!meta.r0_size) {
 13052					ptr_type_name = btf_name_by_offset(desc_btf,
 13053									   ptr_type->name_off);
 13054					verbose(env,
 13055						"kernel function %s returns pointer type %s %s is not supported\n",
 13056						func_name,
 13057						btf_type_str(ptr_type),
 13058						ptr_type_name);
 13059					return -EINVAL;
 13060				}
 13061	
 13062				mark_reg_known_zero(env, regs, BPF_REG_0);
 13063				regs[BPF_REG_0].type = PTR_TO_MEM;
 13064				regs[BPF_REG_0].mem_size = meta.r0_size;
 13065	
 13066				if (meta.r0_rdonly)
 13067					regs[BPF_REG_0].type |= MEM_RDONLY;
 13068	
 13069				/* Ensures we don't access the memory after a release_reference() */
 13070				if (meta.id)
 13071					regs[BPF_REG_0].parent_id = meta.id;
 13072	
 13073				if (is_kfunc_rcu_protected(&meta))
 13074					regs[BPF_REG_0].type |= MEM_RCU;
 13075			} else {
 13076				enum bpf_reg_type type = PTR_TO_BTF_ID;
 13077	
 13078				if (meta.func_id == special_kfunc_list[KF_bpf_get_kmem_cache])
 13079					type |= PTR_UNTRUSTED;
 13080				else if (is_kfunc_rcu_protected(&meta) ||
 13081					 (bpf_is_iter_next_kfunc(&meta) &&
 13082					  (get_iter_from_state(env->cur_state, &meta)
 13083						   ->type & MEM_RCU))) {
 13084					/*
 13085					 * If the iterator's constructor (the _new
 13086					 * function e.g., bpf_iter_task_new) has been
 13087					 * annotated with BPF kfunc flag
 13088					 * KF_RCU_PROTECTED and was called within a RCU
 13089					 * read-side critical section, also propagate
 13090					 * the MEM_RCU flag to the pointer returned from
 13091					 * the iterator's next function (e.g.,
 13092					 * bpf_iter_task_next).
 13093					 */
 13094					type |= MEM_RCU;
 13095				} else {
 13096					/*
 13097					 * Any PTR_TO_BTF_ID that is returned from a BPF
 13098					 * kfunc should by default be treated as
 13099					 * implicitly trusted.
 13100					 */
 13101					type |= PTR_TRUSTED;
 13102				}
 13103	
 13104				mark_reg_known_zero(env, regs, BPF_REG_0);
 13105				regs[BPF_REG_0].btf = desc_btf;
 13106				regs[BPF_REG_0].type = type;
 13107				regs[BPF_REG_0].btf_id = ptr_type_id;
 13108			}
 13109	
 13110			if (is_kfunc_ret_null(&meta)) {
 13111				regs[BPF_REG_0].type |= PTR_MAYBE_NULL;
 13112				/* For mark_ptr_or_null_reg, see 93c230e3f5bd6 */
 13113				regs[BPF_REG_0].id = ++env->id_gen;
 13114			}
 13115			mark_btf_func_reg_size(env, BPF_REG_0, sizeof(void *));
 13116			if (is_kfunc_acquire(&meta)) {
 13117				id = acquire_reference(env, insn_idx, 0);
 13118				if (id < 0)
 13119					return id;
 13120				regs[BPF_REG_0].id = id;
 13121			} else if (is_rbtree_node_type(ptr_type) || is_list_node_type(ptr_type)) {
 13122				ref_set_non_owning(env, &regs[BPF_REG_0]);
 13123			}
 13124	
 13125			if (reg_may_point_to_spin_lock(&regs[BPF_REG_0]) && !regs[BPF_REG_0].id)
 13126				regs[BPF_REG_0].id = ++env->id_gen;
 13127		} else if (btf_type_is_void(t)) {
 13128			if (meta.btf == btf_vmlinux) {
 13129				if (is_bpf_obj_drop_kfunc(meta.func_id) ||
 13130				    is_bpf_percpu_obj_drop_kfunc(meta.func_id)) {
 13131					insn_aux->kptr_struct_meta =
 13132						btf_find_struct_meta(meta.arg_btf,
 13133								     meta.arg_btf_id);
 13134				}
 13135			}
 13136		}
 13137	
 13138		if (bpf_is_kfunc_pkt_changing(&meta))
 13139			clear_all_pkt_pointers(env);
 13140	
 13141		nargs = btf_type_vlen(meta.func_proto);
 13142		if (nargs > MAX_BPF_FUNC_REG_ARGS) {
 13143			struct bpf_func_state *caller = cur_func(env);
 13144			struct bpf_subprog_info *caller_info = &env->subprog_info[caller->subprogno];
 13145			u16 out_stack_arg_cnt = nargs - MAX_BPF_FUNC_REG_ARGS;
 13146			u16 stack_arg_cnt = bpf_in_stack_arg_cnt(caller_info) + out_stack_arg_cnt;
 13147	
 13148			if (stack_arg_cnt > caller_info->stack_arg_cnt)
 13149				caller_info->stack_arg_cnt = stack_arg_cnt;
 13150		}
 13151	
 13152		args = (const struct btf_param *)(meta.func_proto + 1);
 13153		for (i = 0; i < min_t(int, nargs, MAX_BPF_FUNC_REG_ARGS); i++) {
 13154			u32 regno = i + 1;
 13155	
 13156			t = btf_type_skip_modifiers(desc_btf, args[i].type, NULL);
 13157			if (btf_type_is_ptr(t))
 13158				mark_btf_func_reg_size(env, regno, sizeof(void *));
 13159			else
 13160				/* scalar. ensured by check_kfunc_args() */
 13161				mark_btf_func_reg_size(env, regno, t->size);
 13162		}
 13163	
 13164		if (bpf_is_iter_next_kfunc(&meta)) {
 13165			err = process_iter_next_call(env, insn_idx, &meta);
 13166			if (err)
 13167				return err;
 13168		}
 13169	
 13170		if (meta.func_id == special_kfunc_list[KF_bpf_session_cookie])
 13171			env->prog->call_session_cookie = true;
 13172	
 13173		if (bpf_is_throw_kfunc(insn))
 13174			return process_bpf_exit_full(env, NULL, true);
 13175	
 13176		return 0;
 13177	}
 13178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
