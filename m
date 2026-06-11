Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06435AC05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 05:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154271; cv=none; b=Vxow0WQ90UAJ9rYuxc3B2HojszRueCfUoUnblR8fh7WD6mcgwIdQfJpN9+tXDXTKhkVfz8WypQEu0pbf6d+MORwIpY6PSwa3yNoEzWUrvwaYIQ0kGQasj/+WlvpTlnhEF22f72gj3qPDilIuRjMdtdDsnaNcaBb9vP8WV91shqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154271; c=relaxed/simple;
	bh=XNbTzhneFAb1ECoQfSIgtvkYhlUT+xP4Ak7vMop+D4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kg4G/h3sopPyCT270OHH3PlETQbCLx7m5iDTmu74k5sZtvhotr4BNuOU4qaQHESqZJvP0n8v2Uug0Jr+h8xiBiPIsLoNeJ5EBaSkRqNDuBdeqKrC9tG8XpSqxwE+Yj1/JkC6x7nsnMvBgVSZ0eR9zuITjEvhR7eAMkBWwuk0LWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoGqy/gv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoGqy/gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781154262; x=1812690262;
  h=date:from:to:cc:subject:message-id;
  bh=XNbTzhneFAb1ECoQfSIgtvkYhlUT+xP4Ak7vMop+D4g=;
  b=eoGqy/gvW7Bow3wqrbO2QsJ1nZToamzWfvNYVjmJcdzbpdv8zjnImorH
   7gAlDb0cvcGJD3wgCLcLioTbUgy3cCMiMav1zhW1a6/IRfPLoBXFNtC/l
   /kM5fmq8tfxucfD/Fh2WCjKdAc3CgJAXHXg9lEo6fapG6OMwNvlot4jMp
   uVTBld0zaOtiqdWx1KU24IN+9uZnPaJYkkrouxzF7ljsevcZepqj0Dbfr
   vaHIEXJrsp2thNSeTqTM9QZwaE6t+VkQQtt0E8tibdzgp4RsNiBhg8QbB
   M/7fA6hAB5lR0UL6PeOKubs55qQ/pZzqLNoGtUZlHZlPwOwpo3iLWBs1G
   g==;
X-CSE-ConnectionGUID: mIZ1AFDRSZiodlvJXJkxrg==
X-CSE-MsgGUID: B9MuxH3KRB2dFemkYbxuFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82068854"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82068854"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 22:04:20 -0700
X-CSE-ConnectionGUID: YaHNU5G6SqmQDyV3cfZG7w==
X-CSE-MsgGUID: Wo5UlfcSTyucfh4kA97XPA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2026 22:04:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXXaS-00000000MNY-0eOt;
	Thu, 11 Jun 2026 05:04:16 +0000
Date: Thu, 11 Jun 2026 13:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v1 14/17]
 kernel/bpf/verifier.c:10596 check_helper_call() warn: inconsistent indenting
Message-ID: <202606111215.28IaQjCN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v1
head:   bd319f349f948035a4c5b93b96b109695d7eb130
commit: 3f2f30a8d1be735b41abe168cf42dd090954b3a6 [14/17] bpf: Report Policy helper and kfunc errors
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260611/202606111215.28IaQjCN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111215.28IaQjCN-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:10596 check_helper_call() warn: inconsistent indenting

vim +10596 kernel/bpf/verifier.c

 10567	
 10568	static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 10569				     int *insn_idx_p)
 10570	{
 10571		enum bpf_prog_type prog_type = resolve_prog_type(env->prog);
 10572		bool returns_cpu_specific_alloc_ptr = false;
 10573		const struct bpf_func_proto *fn = NULL;
 10574		enum bpf_return_type ret_type;
 10575		enum bpf_type_flag ret_flag;
 10576		struct bpf_reg_state *regs;
 10577		struct bpf_call_arg_meta meta;
 10578		char operation[96];
 10579		int insn_idx = *insn_idx_p;
 10580		bool changes_data;
 10581		int i, err, func_id;
 10582	
 10583		/* find function prototype */
 10584		func_id = insn->imm;
 10585		err = bpf_get_helper_proto(env, insn->imm, &fn);
 10586		if (err == -ERANGE) {
 10587			verbose(env, "invalid func %s#%d\n", func_id_name(func_id), func_id);
 10588			return -EINVAL;
 10589		}
 10590	
 10591		if (err) {
 10592			verbose(env, "program of this type cannot use helper %s#%d\n",
 10593				func_id_name(func_id), func_id);
 10594			scnprintf(operation, sizeof(operation), "helper %s#%d",
 10595				  func_id_name(func_id), func_id);
 10596				bpf_diag_report_policy(env, insn_idx, operation,
 10597						       "this program type does not allow the helper",
 10598						       "Use a helper allowed for this program type, or move the logic to a compatible program type.");
 10599			return err;
 10600		}
 10601	
 10602		/* eBPF programs must be GPL compatible to use GPL-ed functions */
 10603		if (!env->prog->gpl_compatible && fn->gpl_only) {
 10604			verbose(env, "cannot call GPL-restricted function from non-GPL compatible program\n");
 10605			scnprintf(operation, sizeof(operation), "helper %s#%d",
 10606				  func_id_name(func_id), func_id);
 10607				bpf_diag_report_policy(env, insn_idx, operation,
 10608						       "this helper is restricted to GPL-compatible programs",
 10609						       "Use a GPL-compatible license, or replace the helper with one that is available to non-GPL programs.");
 10610			return -EINVAL;
 10611		}
 10612	
 10613		if (fn->allowed && !fn->allowed(env->prog)) {
 10614			verbose(env, "helper call is not allowed in probe\n");
 10615			scnprintf(operation, sizeof(operation), "helper %s#%d",
 10616				  func_id_name(func_id), func_id);
 10617			bpf_diag_report_policy(env, insn_idx, operation,
 10618					       "the helper-specific policy callback rejected this program",
 10619					       "Use the helper only from an allowed attach point or program configuration.");
 10620			return -EINVAL;
 10621		}
 10622	
 10623		/* With LD_ABS/IND some JITs save/restore skb from r1. */
 10624		changes_data = bpf_helper_changes_pkt_data(func_id);
 10625		if (changes_data && fn->arg1_type != ARG_PTR_TO_CTX) {
 10626			verifier_bug(env, "func %s#%d: r1 != ctx", func_id_name(func_id), func_id);
 10627			return -EFAULT;
 10628		}
 10629	
 10630		memset(&meta, 0, sizeof(meta));
 10631		meta.pkt_access = fn->pkt_access;
 10632	
 10633		err = check_func_proto(fn, &meta);
 10634		if (err) {
 10635			verifier_bug(env, "incorrect func proto %s#%d", func_id_name(func_id), func_id);
 10636			return err;
 10637		}
 10638	
 10639		if (fn->might_sleep && !in_sleepable_context(env)) {
 10640			verbose(env, "sleepable helper %s#%d in %s\n", func_id_name(func_id), func_id,
 10641				non_sleepable_context_description(env));
 10642			scnprintf(operation, sizeof(operation), "sleepable helper %s#%d",
 10643				  func_id_name(func_id), func_id);
 10644			bpf_diag_report_execution_context(env, insn_idx, operation,
 10645							  non_sleepable_context_kind(env),
 10646							  non_sleepable_context_diag_description(env),
 10647							  "Move the helper call outside the critical section, or use a non-sleepable helper.");
 10648			return -EINVAL;
 10649		}
 10650	
 10651		/* Track non-sleepable context for helpers. */
 10652		if (!in_sleepable_context(env))
 10653			env->insn_aux_data[insn_idx].non_sleepable = true;
 10654	
 10655		meta.func_id = func_id;
 10656		/* check args */
 10657		for (i = 0; i < MAX_BPF_FUNC_REG_ARGS; i++) {
 10658			err = check_func_arg(env, i, &meta, fn, insn_idx);
 10659			if (err)
 10660				return err;
 10661		}
 10662	
 10663		err = record_func_map(env, &meta, func_id, insn_idx);
 10664		if (err)
 10665			return err;
 10666	
 10667		err = record_func_key(env, &meta, func_id, insn_idx);
 10668		if (err)
 10669			return err;
 10670	
 10671		regs = cur_regs(env);
 10672	
 10673		/* Mark slots with STACK_MISC in case of raw mode, stack offset
 10674		 * is inferred from register state.
 10675		 */
 10676		for (i = 0; i < meta.access_size; i++) {
 10677			err = check_mem_access(env, insn_idx, regs + meta.regno, argno_from_reg(meta.regno), i, BPF_B,
 10678					       BPF_WRITE, -1, false, false);
 10679			if (err)
 10680				return err;
 10681		}
 10682	
 10683		if (meta.release_regno) {
 10684			struct bpf_reg_state *reg = &regs[meta.release_regno];
 10685			bool convert_rcu = (func_id == BPF_FUNC_kptr_xchg) && in_rcu_cs(env) &&
 10686					   (reg->type & MEM_ALLOC) && (reg->type & MEM_PERCPU);
 10687	
 10688			err = release_reg(env, reg, convert_rcu, !!meta.dynptr.id);
 10689			if (err)
 10690				return err;
 10691		}
 10692	
 10693		switch (func_id) {
 10694		case BPF_FUNC_tail_call:
 10695			err = check_resource_leak(env, false, true, "tail_call");
 10696			if (err)
 10697				return err;
 10698			break;
 10699		case BPF_FUNC_get_local_storage:
 10700			/* check that flags argument in get_local_storage(map, flags) is 0,
 10701			 * this is required because get_local_storage() can't return an error.
 10702			 */
 10703			if (!bpf_register_is_null(&regs[BPF_REG_2])) {
 10704				verbose(env, "get_local_storage() doesn't support non-zero flags\n");
 10705				return -EINVAL;
 10706			}
 10707			break;
 10708		case BPF_FUNC_for_each_map_elem:
 10709			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 10710						 set_map_elem_callback_state);
 10711			break;
 10712		case BPF_FUNC_timer_set_callback:
 10713			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 10714						 set_timer_callback_state);
 10715			break;
 10716		case BPF_FUNC_find_vma:
 10717			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 10718						 set_find_vma_callback_state);
 10719			break;
 10720		case BPF_FUNC_snprintf:
 10721			err = check_bpf_snprintf_call(env, regs);
 10722			break;
 10723		case BPF_FUNC_loop:
 10724			update_loop_inline_state(env, meta.subprogno);
 10725			/* Verifier relies on R1 value to determine if bpf_loop() iteration
 10726			 * is finished, thus mark it precise.
 10727			 */
 10728			err = mark_chain_precision(env, BPF_REG_1);
 10729			if (err)
 10730				return err;
 10731			if (cur_func(env)->callback_depth < reg_umax(&regs[BPF_REG_1])) {
 10732				err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 10733							 set_loop_callback_state);
 10734			} else {
 10735				cur_func(env)->callback_depth = 0;
 10736				if (env->log.level & BPF_LOG_LEVEL2)
 10737					verbose(env, "frame%d bpf_loop iteration limit reached\n",
 10738						env->cur_state->curframe);
 10739			}
 10740			break;
 10741		case BPF_FUNC_dynptr_from_mem:
 10742			if (regs[BPF_REG_1].type != PTR_TO_MAP_VALUE) {
 10743				verbose(env, "Unsupported reg type %s for bpf_dynptr_from_mem data\n",
 10744					reg_type_str(env, regs[BPF_REG_1].type));
 10745				return -EACCES;
 10746			}
 10747			break;
 10748		case BPF_FUNC_set_retval:
 10749			if (prog_type == BPF_PROG_TYPE_LSM &&
 10750			    env->prog->expected_attach_type == BPF_LSM_CGROUP) {
 10751				if (!env->prog->aux->attach_func_proto->type) {
 10752					/* Make sure programs that attach to void
 10753					 * hooks don't try to modify return value.
 10754					 */
 10755					verbose(env, "BPF_LSM_CGROUP that attach to void LSM hooks can't modify return value!\n");
 10756					return -EINVAL;
 10757				}
 10758			}
 10759			break;
 10760		case BPF_FUNC_dynptr_write:
 10761		{
 10762			enum bpf_dynptr_type dynptr_type = meta.dynptr.type;
 10763	
 10764			if (dynptr_type == BPF_DYNPTR_TYPE_INVALID)
 10765				return -EFAULT;
 10766	
 10767			if (dynptr_type == BPF_DYNPTR_TYPE_SKB ||
 10768			    dynptr_type == BPF_DYNPTR_TYPE_SKB_META)
 10769				/* this will trigger clear_all_pkt_pointers(), which will
 10770				 * invalidate all dynptr slices associated with the skb
 10771				 */
 10772				changes_data = true;
 10773	
 10774			break;
 10775		}
 10776		case BPF_FUNC_per_cpu_ptr:
 10777		case BPF_FUNC_this_cpu_ptr:
 10778		{
 10779			struct bpf_reg_state *reg = &regs[BPF_REG_1];
 10780			const struct btf_type *type;
 10781	
 10782			if (reg->type & MEM_RCU) {
 10783				type = btf_type_by_id(reg->btf, reg->btf_id);
 10784				if (!type || !btf_type_is_struct(type)) {
 10785					verbose(env, "Helper has invalid btf/btf_id in R1\n");
 10786					return -EFAULT;
 10787				}
 10788				returns_cpu_specific_alloc_ptr = true;
 10789				env->insn_aux_data[insn_idx].call_with_percpu_alloc_ptr = true;
 10790			}
 10791			break;
 10792		}
 10793		case BPF_FUNC_user_ringbuf_drain:
 10794			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 10795						 set_user_ringbuf_callback_state);
 10796			break;
 10797		}
 10798	
 10799		if (err)
 10800			return err;
 10801	
 10802		/* reset caller saved regs */
 10803		for (i = 0; i < CALLER_SAVED_REGS; i++) {
 10804			bpf_mark_reg_not_init(env, &regs[caller_saved[i]]);
 10805			check_reg_arg(env, caller_saved[i], DST_OP_NO_MARK);
 10806		}
 10807		invalidate_outgoing_stack_args(env, cur_func(env));
 10808	
 10809		/* helper call returns 64-bit value. */
 10810		regs[BPF_REG_0].subreg_def = DEF_NOT_SUBREG;
 10811	
 10812		/* update return register (already marked as written above) */
 10813		ret_type = fn->ret_type;
 10814		ret_flag = type_flag(ret_type);
 10815	
 10816		switch (base_type(ret_type)) {
 10817		case RET_INTEGER:
 10818			/* sets type to SCALAR_VALUE */
 10819			mark_reg_unknown(env, regs, BPF_REG_0);
 10820			break;
 10821		case RET_VOID:
 10822			regs[BPF_REG_0].type = NOT_INIT;
 10823			break;
 10824		case RET_PTR_TO_MAP_VALUE:
 10825			/* There is no offset yet applied, variable or fixed */
 10826			mark_reg_known_zero(env, regs, BPF_REG_0);
 10827			/* remember map_ptr, so that check_map_access()
 10828			 * can check 'value_size' boundary of memory access
 10829			 * to map element returned from bpf_map_lookup_elem()
 10830			 */
 10831			if (meta.map.ptr == NULL) {
 10832				verifier_bug(env, "unexpected null map_ptr");
 10833				return -EFAULT;
 10834			}
 10835	
 10836			if (func_id == BPF_FUNC_map_lookup_elem &&
 10837			    can_elide_value_nullness(meta.map.ptr->map_type) &&
 10838			    meta.const_map_key >= 0 &&
 10839			    meta.const_map_key < meta.map.ptr->max_entries)
 10840				ret_flag &= ~PTR_MAYBE_NULL;
 10841	
 10842			regs[BPF_REG_0].map_ptr = meta.map.ptr;
 10843			regs[BPF_REG_0].map_uid = meta.map.uid;
 10844			regs[BPF_REG_0].type = PTR_TO_MAP_VALUE | ret_flag;
 10845			if (!type_may_be_null(ret_flag) &&
 10846			    btf_record_has_field(meta.map.ptr->record, BPF_SPIN_LOCK | BPF_RES_SPIN_LOCK)) {
 10847				regs[BPF_REG_0].id = ++env->id_gen;
 10848			}
 10849			break;
 10850		case RET_PTR_TO_SOCKET:
 10851			mark_reg_known_zero(env, regs, BPF_REG_0);
 10852			regs[BPF_REG_0].type = PTR_TO_SOCKET | ret_flag;
 10853			break;
 10854		case RET_PTR_TO_SOCK_COMMON:
 10855			mark_reg_known_zero(env, regs, BPF_REG_0);
 10856			regs[BPF_REG_0].type = PTR_TO_SOCK_COMMON | ret_flag;
 10857			break;
 10858		case RET_PTR_TO_TCP_SOCK:
 10859			mark_reg_known_zero(env, regs, BPF_REG_0);
 10860			regs[BPF_REG_0].type = PTR_TO_TCP_SOCK | ret_flag;
 10861			break;
 10862		case RET_PTR_TO_MEM:
 10863			mark_reg_known_zero(env, regs, BPF_REG_0);
 10864			regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
 10865			regs[BPF_REG_0].mem_size = meta.mem_size;
 10866			break;
 10867		case RET_PTR_TO_MEM_OR_BTF_ID:
 10868		{
 10869			const struct btf_type *t;
 10870	
 10871			mark_reg_known_zero(env, regs, BPF_REG_0);
 10872			t = btf_type_skip_modifiers(meta.ret_btf, meta.ret_btf_id, NULL);
 10873			if (!btf_type_is_struct(t)) {
 10874				u32 tsize;
 10875				const struct btf_type *ret;
 10876				const char *tname;
 10877	
 10878				/* resolve the type size of ksym. */
 10879				ret = btf_resolve_size(meta.ret_btf, t, &tsize);
 10880				if (IS_ERR(ret)) {
 10881					tname = btf_name_by_offset(meta.ret_btf, t->name_off);
 10882					verbose(env, "unable to resolve the size of type '%s': %ld\n",
 10883						tname, PTR_ERR(ret));
 10884					return -EINVAL;
 10885				}
 10886				regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
 10887				regs[BPF_REG_0].mem_size = tsize;
 10888			} else {
 10889				if (returns_cpu_specific_alloc_ptr) {
 10890					regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC | MEM_RCU;
 10891				} else {
 10892					/* MEM_RDONLY may be carried from ret_flag, but it
 10893					 * doesn't apply on PTR_TO_BTF_ID. Fold it, otherwise
 10894					 * it will confuse the check of PTR_TO_BTF_ID in
 10895					 * check_mem_access().
 10896					 */
 10897					ret_flag &= ~MEM_RDONLY;
 10898					regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
 10899				}
 10900	
 10901				regs[BPF_REG_0].btf = meta.ret_btf;
 10902				regs[BPF_REG_0].btf_id = meta.ret_btf_id;
 10903			}
 10904			break;
 10905		}
 10906		case RET_PTR_TO_BTF_ID:
 10907		{
 10908			struct btf *ret_btf;
 10909			int ret_btf_id;
 10910	
 10911			mark_reg_known_zero(env, regs, BPF_REG_0);
 10912			regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
 10913			if (func_id == BPF_FUNC_kptr_xchg) {
 10914				ret_btf = meta.kptr_field->kptr.btf;
 10915				ret_btf_id = meta.kptr_field->kptr.btf_id;
 10916				if (!btf_is_kernel(ret_btf)) {
 10917					regs[BPF_REG_0].type |= MEM_ALLOC;
 10918					if (meta.kptr_field->type == BPF_KPTR_PERCPU)
 10919						regs[BPF_REG_0].type |= MEM_PERCPU;
 10920				}
 10921			} else {
 10922				if (fn->ret_btf_id == BPF_PTR_POISON) {
 10923					verifier_bug(env, "func %s has non-overwritten BPF_PTR_POISON return type",
 10924						     func_id_name(func_id));
 10925					return -EFAULT;
 10926				}
 10927				ret_btf = btf_vmlinux;
 10928				ret_btf_id = *fn->ret_btf_id;
 10929			}
 10930			if (ret_btf_id == 0) {
 10931				verbose(env, "invalid return type %u of func %s#%d\n",
 10932					base_type(ret_type), func_id_name(func_id),
 10933					func_id);
 10934				return -EINVAL;
 10935			}
 10936			regs[BPF_REG_0].btf = ret_btf;
 10937			regs[BPF_REG_0].btf_id = ret_btf_id;
 10938			break;
 10939		}
 10940		default:
 10941			verbose(env, "unknown return type %u of func %s#%d\n",
 10942				base_type(ret_type), func_id_name(func_id), func_id);
 10943			return -EINVAL;
 10944		}
 10945	
 10946		if (type_may_be_null(regs[BPF_REG_0].type))
 10947			regs[BPF_REG_0].id = ++env->id_gen;
 10948	
 10949		if (is_ptr_cast_function(func_id) &&
 10950		    find_reference_state(env->cur_state, meta.ref_obj.id)) {
 10951			struct bpf_verifier_state *branch;
 10952			struct bpf_reg_state *r0;
 10953	
 10954			err = validate_ref_obj(env, &meta.ref_obj);
 10955			if (err)
 10956				return err;
 10957	
 10958			/*
 10959			 * In order for a release of any of the original or cast pointers
 10960			 * to invalidate all other pointers, reuse the same reference id for
 10961			 * the cast result.
 10962			 * This reference id can't be used for nullness propagation,
 10963			 * as cast might return NULL for a non-NULL input.
 10964			 * Hence, explore the NULL case as a separate branch.
 10965			 */
 10966			branch = push_stack(env, env->insn_idx + 1, env->insn_idx, false);
 10967			if (IS_ERR(branch))
 10968				return PTR_ERR(branch);
 10969	
 10970			r0 = &branch->frame[branch->curframe]->regs[BPF_REG_0];
 10971			__mark_reg_known_zero(r0);
 10972			r0->type = SCALAR_VALUE;
 10973	
 10974			regs[BPF_REG_0].type &= ~PTR_MAYBE_NULL;
 10975			regs[BPF_REG_0].id = meta.ref_obj.id;
 10976		} else if (is_acquire_function(func_id, meta.map.ptr)) {
 10977			int id = acquire_reference(env, insn_idx, 0);
 10978	
 10979			if (id < 0)
 10980				return id;
 10981	
 10982			regs[BPF_REG_0].id = id;
 10983		}
 10984	
 10985		if (func_id == BPF_FUNC_dynptr_data)
 10986			regs[BPF_REG_0].parent_id = meta.dynptr.id;
 10987	
 10988		err = do_refine_retval_range(env, regs, fn->ret_type, func_id, &meta);
 10989		if (err)
 10990			return err;
 10991	
 10992		err = check_map_func_compatibility(env, meta.map.ptr, func_id);
 10993		if (err)
 10994			return err;
 10995	
 10996		if ((func_id == BPF_FUNC_get_stack ||
 10997		     func_id == BPF_FUNC_get_task_stack) &&
 10998		    !env->prog->has_callchain_buf) {
 10999			const char *err_str;
 11000	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
