Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D626B2CD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 18:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287200; cv=none; b=VGc5me7qUuNrbVMZl669sFkoPkHKZU+7wNFoFZrnldi2TLnVt3JoStLFzFOgnIxiRt8QAVh+3GFlw/DWlbiDVg7TYyHvGH9d0C0p6sUmNMLXhVN+Tbd3Vvg3D/C+gK2EXrzfncBJP3ar+l9cBGEohGFDo+Il97mIydOpfrWaZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287200; c=relaxed/simple;
	bh=6QIHkmTreOVNykBmgnzXn+CIVdwxD661ByatNm+nmyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwFQorNzqp7G2iRZiy1V58AvGJPwSd4mBuhzhvV5Ttc8DTy84ZAOruvJYlY1PN5XkA8IcwqKQENkpKMP/GdS/PgjglM5cwCmrNoXb9p/k9mqB2raa1rGNbeiwRe71/rjWUl+mhHwO2sJYQdSC3O20zz+c9WEulg2KtSM3LrpHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+YcJR6a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+YcJR6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741287197; x=1772823197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6QIHkmTreOVNykBmgnzXn+CIVdwxD661ByatNm+nmyA=;
  b=R+YcJR6aVybvruqUYWWjFIo0cGGaD0Rf7sosjqlGQxJRBEyIcP37kw6W
   oN2+Q4BGgN3BfxD5m6UyLZSxBexx6Y3E91yqom+9KjUcSqGQl02XtRIE3
   VUcHbmUR60wMgdZ0E4KASI7IyTxRVe2GmmD4kvsqc6NEXc5Gks04sAixG
   uL/RRjaVkA3pce/v2eS7NJzebiqzaVHGi8W8rlGQ/RFKJ+bUD7SOs/SPg
   GO+w7Y7WVoJzYBPgFxe0ZwJemHsqoUNzl5NUiOoLjcMVr9/83MzuUoXBq
   QQ3y/fh0kLN515w7tnVJx0TQaARTvMTIH97JDFnnoh6iq32YtEqthhJoZ
   w==;
X-CSE-ConnectionGUID: QqIgPKBoSAecoCx2qVZLng==
X-CSE-MsgGUID: eizK9yVURA+RmD3ddIeXFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42231949"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42231949"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 10:53:17 -0800
X-CSE-ConnectionGUID: 8PvPHGUCQrKOcaULlSNOzw==
X-CSE-MsgGUID: PmSNRxU5TCOVh+1pFY44pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119614947"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 10:53:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqGLJ-000NUM-2k;
	Thu, 06 Mar 2025 18:53:13 +0000
Date: Fri, 7 Mar 2025 02:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: arthur@arthurfabre.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 18/20] trait: registration API
Message-ID: <202503070216.F5kZEn0w-lkp@intel.com>
References: <20250305-afabre-traits-010-rfc2-v1-18-d0ecfb869797@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-afabre-traits-010-rfc2-v1-18-d0ecfb869797@cloudflare.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 42ba8a49d085e0c2ad50fb9a8ec954c9762b6e01]

url:    https://github.com/intel-lab-lkp/linux/commits/arthur-arthurfabre-com/trait-limited-KV-store-for-packet-metadata/20250305-224338
base:   42ba8a49d085e0c2ad50fb9a8ec954c9762b6e01
patch link:    https://lore.kernel.org/r/20250305-afabre-traits-010-rfc2-v1-18-d0ecfb869797%40cloudflare.com
patch subject: [PATCH RFC bpf-next 18/20] trait: registration API
config: arm64-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070216.F5kZEn0w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070216.F5kZEn0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070216.F5kZEn0w-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: kernel/bpf/verifier.o: in function `check_kfunc_call':
>> kernel/bpf/verifier.c:13489:(.text+0x38024): undefined reference to `netns_bpf_mutex'
   aarch64-linux-ld: kernel/bpf/verifier.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `netns_bpf_mutex' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> kernel/bpf/verifier.c:13489:(.text+0x38024): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: kernel/bpf/verifier.c:13489:(.text+0x38028): undefined reference to `netns_bpf_mutex'


vim +13489 kernel/bpf/verifier.c

 13292	
 13293	static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 13294				    int *insn_idx_p)
 13295	{
 13296		bool sleepable, rcu_lock, rcu_unlock, preempt_disable, preempt_enable;
 13297		u32 i, nargs, ptr_type_id, release_ref_obj_id;
 13298		struct bpf_reg_state *regs = cur_regs(env), *reg;
 13299		const char *func_name, *ptr_type_name;
 13300		const struct btf_type *t, *ptr_type;
 13301		struct bpf_kfunc_call_arg_meta meta;
 13302		struct bpf_insn_aux_data *insn_aux;
 13303		int err, insn_idx = *insn_idx_p;
 13304		const struct btf_param *args;
 13305		const struct btf_type *ret_t;
 13306		struct btf *desc_btf;
 13307		struct net *net;
 13308		bool trait_used;
 13309	
 13310		/* skip for now, but return error when we find this in fixup_kfunc_call */
 13311		if (!insn->imm)
 13312			return 0;
 13313	
 13314		err = fetch_kfunc_meta(env, insn, &meta, &func_name);
 13315		if (err == -EACCES && func_name)
 13316			verbose(env, "calling kernel function %s is not allowed\n", func_name);
 13317		if (err)
 13318			return err;
 13319		desc_btf = meta.btf;
 13320		insn_aux = &env->insn_aux_data[insn_idx];
 13321	
 13322		insn_aux->is_iter_next = is_iter_next_kfunc(&meta);
 13323	
 13324		if (is_kfunc_destructive(&meta) && !capable(CAP_SYS_BOOT)) {
 13325			verbose(env, "destructive kfunc calls require CAP_SYS_BOOT capability\n");
 13326			return -EACCES;
 13327		}
 13328	
 13329		sleepable = is_kfunc_sleepable(&meta);
 13330		if (sleepable && !in_sleepable(env)) {
 13331			verbose(env, "program must be sleepable to call sleepable kfunc %s\n", func_name);
 13332			return -EACCES;
 13333		}
 13334	
 13335		/* Check the arguments */
 13336		err = check_kfunc_args(env, &meta, insn_idx);
 13337		if (err < 0)
 13338			return err;
 13339	
 13340		if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 13341			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 13342						 set_rbtree_add_callback_state);
 13343			if (err) {
 13344				verbose(env, "kfunc %s#%d failed callback verification\n",
 13345					func_name, meta.func_id);
 13346				return err;
 13347			}
 13348		}
 13349	
 13350		if (meta.func_id == special_kfunc_list[KF_bpf_session_cookie]) {
 13351			meta.r0_size = sizeof(u64);
 13352			meta.r0_rdonly = false;
 13353		}
 13354	
 13355		if (is_bpf_wq_set_callback_impl_kfunc(meta.func_id)) {
 13356			err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 13357						 set_timer_callback_state);
 13358			if (err) {
 13359				verbose(env, "kfunc %s#%d failed callback verification\n",
 13360					func_name, meta.func_id);
 13361				return err;
 13362			}
 13363		}
 13364	
 13365		rcu_lock = is_kfunc_bpf_rcu_read_lock(&meta);
 13366		rcu_unlock = is_kfunc_bpf_rcu_read_unlock(&meta);
 13367	
 13368		preempt_disable = is_kfunc_bpf_preempt_disable(&meta);
 13369		preempt_enable = is_kfunc_bpf_preempt_enable(&meta);
 13370	
 13371		if (env->cur_state->active_rcu_lock) {
 13372			struct bpf_func_state *state;
 13373			struct bpf_reg_state *reg;
 13374			u32 clear_mask = (1 << STACK_SPILL) | (1 << STACK_ITER);
 13375	
 13376			if (in_rbtree_lock_required_cb(env) && (rcu_lock || rcu_unlock)) {
 13377				verbose(env, "Calling bpf_rcu_read_{lock,unlock} in unnecessary rbtree callback\n");
 13378				return -EACCES;
 13379			}
 13380	
 13381			if (rcu_lock) {
 13382				verbose(env, "nested rcu read lock (kernel function %s)\n", func_name);
 13383				return -EINVAL;
 13384			} else if (rcu_unlock) {
 13385				bpf_for_each_reg_in_vstate_mask(env->cur_state, state, reg, clear_mask, ({
 13386					if (reg->type & MEM_RCU) {
 13387						reg->type &= ~(MEM_RCU | PTR_MAYBE_NULL);
 13388						reg->type |= PTR_UNTRUSTED;
 13389					}
 13390				}));
 13391				env->cur_state->active_rcu_lock = false;
 13392			} else if (sleepable) {
 13393				verbose(env, "kernel func %s is sleepable within rcu_read_lock region\n", func_name);
 13394				return -EACCES;
 13395			}
 13396		} else if (rcu_lock) {
 13397			env->cur_state->active_rcu_lock = true;
 13398		} else if (rcu_unlock) {
 13399			verbose(env, "unmatched rcu read unlock (kernel function %s)\n", func_name);
 13400			return -EINVAL;
 13401		}
 13402	
 13403		if (env->cur_state->active_preempt_locks) {
 13404			if (preempt_disable) {
 13405				env->cur_state->active_preempt_locks++;
 13406			} else if (preempt_enable) {
 13407				env->cur_state->active_preempt_locks--;
 13408			} else if (sleepable) {
 13409				verbose(env, "kernel func %s is sleepable within non-preemptible region\n", func_name);
 13410				return -EACCES;
 13411			}
 13412		} else if (preempt_disable) {
 13413			env->cur_state->active_preempt_locks++;
 13414		} else if (preempt_enable) {
 13415			verbose(env, "unmatched attempt to enable preemption (kernel function %s)\n", func_name);
 13416			return -EINVAL;
 13417		}
 13418	
 13419		if (env->cur_state->active_irq_id && sleepable) {
 13420			verbose(env, "kernel func %s is sleepable within IRQ-disabled region\n", func_name);
 13421			return -EACCES;
 13422		}
 13423	
 13424		/* In case of release function, we get register number of refcounted
 13425		 * PTR_TO_BTF_ID in bpf_kfunc_arg_meta, do the release now.
 13426		 */
 13427		if (meta.release_regno) {
 13428			err = release_reference(env, regs[meta.release_regno].ref_obj_id);
 13429			if (err) {
 13430				verbose(env, "kfunc %s#%d reference has not been acquired before\n",
 13431					func_name, meta.func_id);
 13432				return err;
 13433			}
 13434		}
 13435	
 13436		if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
 13437		    meta.func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
 13438		    meta.func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 13439			release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
 13440			insn_aux->insert_off = regs[BPF_REG_2].off;
 13441			insn_aux->kptr_struct_meta = btf_find_struct_meta(meta.arg_btf, meta.arg_btf_id);
 13442			err = ref_convert_owning_non_owning(env, release_ref_obj_id);
 13443			if (err) {
 13444				verbose(env, "kfunc %s#%d conversion of owning ref to non-owning failed\n",
 13445					func_name, meta.func_id);
 13446				return err;
 13447			}
 13448	
 13449			err = release_reference(env, release_ref_obj_id);
 13450			if (err) {
 13451				verbose(env, "kfunc %s#%d reference has not been acquired before\n",
 13452					func_name, meta.func_id);
 13453				return err;
 13454			}
 13455		}
 13456	
 13457		if (meta.func_id == special_kfunc_list[KF_bpf_throw]) {
 13458			if (!bpf_jit_supports_exceptions()) {
 13459				verbose(env, "JIT does not support calling kfunc %s#%d\n",
 13460					func_name, meta.func_id);
 13461				return -ENOTSUPP;
 13462			}
 13463			env->seen_exception = true;
 13464	
 13465			/* In the case of the default callback, the cookie value passed
 13466			 * to bpf_throw becomes the return value of the program.
 13467			 */
 13468			if (!env->exception_callback_subprog) {
 13469				err = check_return_code(env, BPF_REG_1, "R1");
 13470				if (err < 0)
 13471					return err;
 13472			}
 13473		}
 13474	
 13475		if (meta.func_id == special_kfunc_list[KF_bpf_xdp_trait_set] ||
 13476		    meta.func_id == special_kfunc_list[KF_bpf_skb_trait_set]) {
 13477			reg = &cur_regs(env)[BPF_REG_2];
 13478			if (reg->type != SCALAR_VALUE || !tnum_is_const(reg->var_off)) {
 13479				verbose(env, "trait_set() key is not a known constant\n");
 13480				return -EINVAL;
 13481			}
 13482	
 13483			if (reg->var_off.value > 63) {
 13484				verbose(env, "trait_set() key %llu invalid\n", reg->var_off.value);
 13485				return -EINVAL;
 13486			}
 13487	
 13488			net = current->nsproxy->net_ns;
 13489			mutex_lock(&netns_bpf_mutex);
 13490			trait_used = net->traits.traits[reg->var_off.value].used;
 13491			mutex_unlock(&netns_bpf_mutex);
 13492	
 13493			/* Checking in the verifier is good for runtime performance, but what happens if
 13494			 * a trait is unregistered?
 13495			 * Should we track which traits are used by BPF programs and prevent it?
 13496			 */
 13497			if (!trait_used) {
 13498				verbose(env, "trait_set() key %llu is not registered\n", reg->var_off.value);
 13499				return -EINVAL;
 13500			}
 13501		}
 13502	
 13503		for (i = 0; i < CALLER_SAVED_REGS; i++)
 13504			mark_reg_not_init(env, regs, caller_saved[i]);
 13505	
 13506		/* Check return type */
 13507		t = btf_type_skip_modifiers(desc_btf, meta.func_proto->type, NULL);
 13508	
 13509		if (is_kfunc_acquire(&meta) && !btf_type_is_struct_ptr(meta.btf, t)) {
 13510			/* Only exception is bpf_obj_new_impl */
 13511			if (meta.btf != btf_vmlinux ||
 13512			    (meta.func_id != special_kfunc_list[KF_bpf_obj_new_impl] &&
 13513			     meta.func_id != special_kfunc_list[KF_bpf_percpu_obj_new_impl] &&
 13514			     meta.func_id != special_kfunc_list[KF_bpf_refcount_acquire_impl])) {
 13515				verbose(env, "acquire kernel function does not return PTR_TO_BTF_ID\n");
 13516				return -EINVAL;
 13517			}
 13518		}
 13519	
 13520		if (btf_type_is_scalar(t)) {
 13521			mark_reg_unknown(env, regs, BPF_REG_0);
 13522			mark_btf_func_reg_size(env, BPF_REG_0, t->size);
 13523		} else if (btf_type_is_ptr(t)) {
 13524			ptr_type = btf_type_skip_modifiers(desc_btf, t->type, &ptr_type_id);
 13525	
 13526			if (meta.btf == btf_vmlinux && btf_id_set_contains(&special_kfunc_set, meta.func_id)) {
 13527				if (meta.func_id == special_kfunc_list[KF_bpf_obj_new_impl] ||
 13528				    meta.func_id == special_kfunc_list[KF_bpf_percpu_obj_new_impl]) {
 13529					struct btf_struct_meta *struct_meta;
 13530					struct btf *ret_btf;
 13531					u32 ret_btf_id;
 13532	
 13533					if (meta.func_id == special_kfunc_list[KF_bpf_obj_new_impl] && !bpf_global_ma_set)
 13534						return -ENOMEM;
 13535	
 13536					if (((u64)(u32)meta.arg_constant.value) != meta.arg_constant.value) {
 13537						verbose(env, "local type ID argument must be in range [0, U32_MAX]\n");
 13538						return -EINVAL;
 13539					}
 13540	
 13541					ret_btf = env->prog->aux->btf;
 13542					ret_btf_id = meta.arg_constant.value;
 13543	
 13544					/* This may be NULL due to user not supplying a BTF */
 13545					if (!ret_btf) {
 13546						verbose(env, "bpf_obj_new/bpf_percpu_obj_new requires prog BTF\n");
 13547						return -EINVAL;
 13548					}
 13549	
 13550					ret_t = btf_type_by_id(ret_btf, ret_btf_id);
 13551					if (!ret_t || !__btf_type_is_struct(ret_t)) {
 13552						verbose(env, "bpf_obj_new/bpf_percpu_obj_new type ID argument must be of a struct\n");
 13553						return -EINVAL;
 13554					}
 13555	
 13556					if (meta.func_id == special_kfunc_list[KF_bpf_percpu_obj_new_impl]) {
 13557						if (ret_t->size > BPF_GLOBAL_PERCPU_MA_MAX_SIZE) {
 13558							verbose(env, "bpf_percpu_obj_new type size (%d) is greater than %d\n",
 13559								ret_t->size, BPF_GLOBAL_PERCPU_MA_MAX_SIZE);
 13560							return -EINVAL;
 13561						}
 13562	
 13563						if (!bpf_global_percpu_ma_set) {
 13564							mutex_lock(&bpf_percpu_ma_lock);
 13565							if (!bpf_global_percpu_ma_set) {
 13566								/* Charge memory allocated with bpf_global_percpu_ma to
 13567								 * root memcg. The obj_cgroup for root memcg is NULL.
 13568								 */
 13569								err = bpf_mem_alloc_percpu_init(&bpf_global_percpu_ma, NULL);
 13570								if (!err)
 13571									bpf_global_percpu_ma_set = true;
 13572							}
 13573							mutex_unlock(&bpf_percpu_ma_lock);
 13574							if (err)
 13575								return err;
 13576						}
 13577	
 13578						mutex_lock(&bpf_percpu_ma_lock);
 13579						err = bpf_mem_alloc_percpu_unit_init(&bpf_global_percpu_ma, ret_t->size);
 13580						mutex_unlock(&bpf_percpu_ma_lock);
 13581						if (err)
 13582							return err;
 13583					}
 13584	
 13585					struct_meta = btf_find_struct_meta(ret_btf, ret_btf_id);
 13586					if (meta.func_id == special_kfunc_list[KF_bpf_percpu_obj_new_impl]) {
 13587						if (!__btf_type_is_scalar_struct(env, ret_btf, ret_t, 0)) {
 13588							verbose(env, "bpf_percpu_obj_new type ID argument must be of a struct of scalars\n");
 13589							return -EINVAL;
 13590						}
 13591	
 13592						if (struct_meta) {
 13593							verbose(env, "bpf_percpu_obj_new type ID argument must not contain special fields\n");
 13594							return -EINVAL;
 13595						}
 13596					}
 13597	
 13598					mark_reg_known_zero(env, regs, BPF_REG_0);
 13599					regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
 13600					regs[BPF_REG_0].btf = ret_btf;
 13601					regs[BPF_REG_0].btf_id = ret_btf_id;
 13602					if (meta.func_id == special_kfunc_list[KF_bpf_percpu_obj_new_impl])
 13603						regs[BPF_REG_0].type |= MEM_PERCPU;
 13604	
 13605					insn_aux->obj_new_size = ret_t->size;
 13606					insn_aux->kptr_struct_meta = struct_meta;
 13607				} else if (meta.func_id == special_kfunc_list[KF_bpf_refcount_acquire_impl]) {
 13608					mark_reg_known_zero(env, regs, BPF_REG_0);
 13609					regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
 13610					regs[BPF_REG_0].btf = meta.arg_btf;
 13611					regs[BPF_REG_0].btf_id = meta.arg_btf_id;
 13612	
 13613					insn_aux->kptr_struct_meta =
 13614						btf_find_struct_meta(meta.arg_btf,
 13615								     meta.arg_btf_id);
 13616				} else if (meta.func_id == special_kfunc_list[KF_bpf_list_pop_front] ||
 13617					   meta.func_id == special_kfunc_list[KF_bpf_list_pop_back]) {
 13618					struct btf_field *field = meta.arg_list_head.field;
 13619	
 13620					mark_reg_graph_node(regs, BPF_REG_0, &field->graph_root);
 13621				} else if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
 13622					   meta.func_id == special_kfunc_list[KF_bpf_rbtree_first]) {
 13623					struct btf_field *field = meta.arg_rbtree_root.field;
 13624	
 13625					mark_reg_graph_node(regs, BPF_REG_0, &field->graph_root);
 13626				} else if (meta.func_id == special_kfunc_list[KF_bpf_cast_to_kern_ctx]) {
 13627					mark_reg_known_zero(env, regs, BPF_REG_0);
 13628					regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_TRUSTED;
 13629					regs[BPF_REG_0].btf = desc_btf;
 13630					regs[BPF_REG_0].btf_id = meta.ret_btf_id;
 13631				} else if (meta.func_id == special_kfunc_list[KF_bpf_rdonly_cast]) {
 13632					ret_t = btf_type_by_id(desc_btf, meta.arg_constant.value);
 13633					if (!ret_t || !btf_type_is_struct(ret_t)) {
 13634						verbose(env,
 13635							"kfunc bpf_rdonly_cast type ID argument must be of a struct\n");
 13636						return -EINVAL;
 13637					}
 13638	
 13639					mark_reg_known_zero(env, regs, BPF_REG_0);
 13640					regs[BPF_REG_0].type = PTR_TO_BTF_ID | PTR_UNTRUSTED;
 13641					regs[BPF_REG_0].btf = desc_btf;
 13642					regs[BPF_REG_0].btf_id = meta.arg_constant.value;
 13643				} else if (meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice] ||
 13644					   meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice_rdwr]) {
 13645					enum bpf_type_flag type_flag = get_dynptr_type_flag(meta.initialized_dynptr.type);
 13646	
 13647					mark_reg_known_zero(env, regs, BPF_REG_0);
 13648	
 13649					if (!meta.arg_constant.found) {
 13650						verbose(env, "verifier internal error: bpf_dynptr_slice(_rdwr) no constant size\n");
 13651						return -EFAULT;
 13652					}
 13653	
 13654					regs[BPF_REG_0].mem_size = meta.arg_constant.value;
 13655	
 13656					/* PTR_MAYBE_NULL will be added when is_kfunc_ret_null is checked */
 13657					regs[BPF_REG_0].type = PTR_TO_MEM | type_flag;
 13658	
 13659					if (meta.func_id == special_kfunc_list[KF_bpf_dynptr_slice]) {
 13660						regs[BPF_REG_0].type |= MEM_RDONLY;
 13661					} else {
 13662						/* this will set env->seen_direct_write to true */
 13663						if (!may_access_direct_pkt_data(env, NULL, BPF_WRITE)) {
 13664							verbose(env, "the prog does not allow writes to packet data\n");
 13665							return -EINVAL;
 13666						}
 13667					}
 13668	
 13669					if (!meta.initialized_dynptr.id) {
 13670						verbose(env, "verifier internal error: no dynptr id\n");
 13671						return -EFAULT;
 13672					}
 13673					regs[BPF_REG_0].dynptr_id = meta.initialized_dynptr.id;
 13674	
 13675					/* we don't need to set BPF_REG_0's ref obj id
 13676					 * because packet slices are not refcounted (see
 13677					 * dynptr_type_refcounted)
 13678					 */
 13679				} else {
 13680					verbose(env, "kernel function %s unhandled dynamic return type\n",
 13681						meta.func_name);
 13682					return -EFAULT;
 13683				}
 13684			} else if (btf_type_is_void(ptr_type)) {
 13685				/* kfunc returning 'void *' is equivalent to returning scalar */
 13686				mark_reg_unknown(env, regs, BPF_REG_0);
 13687			} else if (!__btf_type_is_struct(ptr_type)) {
 13688				if (!meta.r0_size) {
 13689					__u32 sz;
 13690	
 13691					if (!IS_ERR(btf_resolve_size(desc_btf, ptr_type, &sz))) {
 13692						meta.r0_size = sz;
 13693						meta.r0_rdonly = true;
 13694					}
 13695				}
 13696				if (!meta.r0_size) {
 13697					ptr_type_name = btf_name_by_offset(desc_btf,
 13698									   ptr_type->name_off);
 13699					verbose(env,
 13700						"kernel function %s returns pointer type %s %s is not supported\n",
 13701						func_name,
 13702						btf_type_str(ptr_type),
 13703						ptr_type_name);
 13704					return -EINVAL;
 13705				}
 13706	
 13707				mark_reg_known_zero(env, regs, BPF_REG_0);
 13708				regs[BPF_REG_0].type = PTR_TO_MEM;
 13709				regs[BPF_REG_0].mem_size = meta.r0_size;
 13710	
 13711				if (meta.r0_rdonly)
 13712					regs[BPF_REG_0].type |= MEM_RDONLY;
 13713	
 13714				/* Ensures we don't access the memory after a release_reference() */
 13715				if (meta.ref_obj_id)
 13716					regs[BPF_REG_0].ref_obj_id = meta.ref_obj_id;
 13717			} else {
 13718				mark_reg_known_zero(env, regs, BPF_REG_0);
 13719				regs[BPF_REG_0].btf = desc_btf;
 13720				regs[BPF_REG_0].type = PTR_TO_BTF_ID;
 13721				regs[BPF_REG_0].btf_id = ptr_type_id;
 13722	
 13723				if (meta.func_id == special_kfunc_list[KF_bpf_get_kmem_cache])
 13724					regs[BPF_REG_0].type |= PTR_UNTRUSTED;
 13725	
 13726				if (is_iter_next_kfunc(&meta)) {
 13727					struct bpf_reg_state *cur_iter;
 13728	
 13729					cur_iter = get_iter_from_state(env->cur_state, &meta);
 13730	
 13731					if (cur_iter->type & MEM_RCU) /* KF_RCU_PROTECTED */
 13732						regs[BPF_REG_0].type |= MEM_RCU;
 13733					else
 13734						regs[BPF_REG_0].type |= PTR_TRUSTED;
 13735				}
 13736			}
 13737	
 13738			if (is_kfunc_ret_null(&meta)) {
 13739				regs[BPF_REG_0].type |= PTR_MAYBE_NULL;
 13740				/* For mark_ptr_or_null_reg, see 93c230e3f5bd6 */
 13741				regs[BPF_REG_0].id = ++env->id_gen;
 13742			}
 13743			mark_btf_func_reg_size(env, BPF_REG_0, sizeof(void *));
 13744			if (is_kfunc_acquire(&meta)) {
 13745				int id = acquire_reference(env, insn_idx);
 13746	
 13747				if (id < 0)
 13748					return id;
 13749				if (is_kfunc_ret_null(&meta))
 13750					regs[BPF_REG_0].id = id;
 13751				regs[BPF_REG_0].ref_obj_id = id;
 13752			} else if (meta.func_id == special_kfunc_list[KF_bpf_rbtree_first]) {
 13753				ref_set_non_owning(env, &regs[BPF_REG_0]);
 13754			}
 13755	
 13756			if (reg_may_point_to_spin_lock(&regs[BPF_REG_0]) && !regs[BPF_REG_0].id)
 13757				regs[BPF_REG_0].id = ++env->id_gen;
 13758		} else if (btf_type_is_void(t)) {
 13759			if (meta.btf == btf_vmlinux && btf_id_set_contains(&special_kfunc_set, meta.func_id)) {
 13760				if (meta.func_id == special_kfunc_list[KF_bpf_obj_drop_impl] ||
 13761				    meta.func_id == special_kfunc_list[KF_bpf_percpu_obj_drop_impl]) {
 13762					insn_aux->kptr_struct_meta =
 13763						btf_find_struct_meta(meta.arg_btf,
 13764								     meta.arg_btf_id);
 13765				}
 13766			}
 13767		}
 13768	
 13769		nargs = btf_type_vlen(meta.func_proto);
 13770		args = (const struct btf_param *)(meta.func_proto + 1);
 13771		for (i = 0; i < nargs; i++) {
 13772			u32 regno = i + 1;
 13773	
 13774			t = btf_type_skip_modifiers(desc_btf, args[i].type, NULL);
 13775			if (btf_type_is_ptr(t))
 13776				mark_btf_func_reg_size(env, regno, sizeof(void *));
 13777			else
 13778				/* scalar. ensured by btf_check_kfunc_arg_match() */
 13779				mark_btf_func_reg_size(env, regno, t->size);
 13780		}
 13781	
 13782		if (is_iter_next_kfunc(&meta)) {
 13783			err = process_iter_next_call(env, insn_idx, &meta);
 13784			if (err)
 13785				return err;
 13786		}
 13787	
 13788		return 0;
 13789	}
 13790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
