Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDF926CE2D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142944; cv=none; b=XDV5+5Mm2DEH3C7EnqgkjxO6UlM3wJ/kmMemApjXsJqbIT1nFE0sHhM9Ns5nXW7RGOy2tkLHlATzHGZaDr0eVqeRDGWDZC+AQTWC0OXpeExaevual0GThE/Msuom8CsK72q7eR9ueDv9WjXTCr1B3CyYzXQ5/VH6+++1uHn2SQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142944; c=relaxed/simple;
	bh=aNC+CGSHyLycsqY1hJ4orJc7a7K/+OWAym3MpGXAdOk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kmx7QS7jdmesv1CP7zbTIOLnD+/PrxXI8d3NcRABH4T9QefBaISxXWXnrA0fat378T37m4ZQjQ5TyzSqJE7JxOWrliG7UNE8RB8evSmfm6bvB3YdRdtUmqdP1DXRSCPYfb0QRJWL9OBp9kGKHkOYr9kd4aAnx0thBfX06E1Lp+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsnZ/hVr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsnZ/hVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781142941; x=1812678941;
  h=date:from:to:cc:subject:message-id;
  bh=aNC+CGSHyLycsqY1hJ4orJc7a7K/+OWAym3MpGXAdOk=;
  b=SsnZ/hVrehpsJ2LlZVXCPPfKzaB2isuTxFI0R+o+oCvlewWJPfzIP6mZ
   F7mQgq19zBK9vaIl8DqP6cc/BaOwJ3cD/phS9ZNukMSW0IUNDkCk1GKHJ
   0ZT0sefBgSsN5nuluI8aooo8Iu3kjzZgRwo2ZWBqOCu6AdTnN6JDQIUe7
   R3Vsaz8zE5TIdkeo1sUM87mSZZL5lB0VQXBTyu+cNprKpKHSGzMWDgbe3
   /Rcf7S5NamdNh/lXo2zVEtiU2PWx9N4zXj57LWXaS8xu0FFtIlAqCH/hK
   kkJMuxLbsE5brWaq3erZf3l8P0Zn/iBaw+3tIK8oIhHaZF3z4TaTxPJ1+
   g==;
X-CSE-ConnectionGUID: Z6g17YpzQA20EV01LuSsGA==
X-CSE-MsgGUID: gHIwFLKMTJCj2MoO/cOYpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="80964342"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="80964342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:55:36 -0700
X-CSE-ConnectionGUID: xFXHq/8TTzeOFd2p2QW5Bg==
X-CSE-MsgGUID: tskf6AMnTc6nnsO5AA0x2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251255388"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2026 18:55:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXUdn-00000000M9E-24TU;
	Thu, 11 Jun 2026 01:55:31 +0000
Date: Thu, 11 Jun 2026 09:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v1 11/17]
 kernel/bpf/verifier.c:8539 check_func_arg() warn: inconsistent indenting
Message-ID: <202606110958.bbj4VtU6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v1
head:   bd319f349f948035a4c5b93b96b109695d7eb130
commit: 091742f087145044c61adf274356e80f73fa3ef0 [11/17] bpf: Report Call Type Safety argument errors
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260611/202606110958.bbj4VtU6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110958.bbj4VtU6-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:8539 check_func_arg() warn: inconsistent indenting
kernel/bpf/verifier.c:11747 process_irq_flag() warn: inconsistent indenting

vim +8539 kernel/bpf/verifier.c

  8472	
  8473	static int check_func_arg(struct bpf_verifier_env *env, u32 arg,
  8474				  struct bpf_call_arg_meta *meta,
  8475				  const struct bpf_func_proto *fn,
  8476				  int insn_idx)
  8477	{
  8478		u32 regno = BPF_REG_1 + arg;
  8479		struct bpf_reg_state *reg = reg_state(env, regno);
  8480		enum bpf_arg_type arg_type = fn->arg_type[arg];
  8481		argno_t argno = argno_from_arg(arg + 1);
  8482		enum bpf_reg_type type = reg->type;
  8483		u32 *arg_btf_id = NULL;
  8484		u32 key_size;
  8485		int err = 0;
  8486	
  8487		if (arg_type == ARG_DONTCARE)
  8488			return 0;
  8489	
  8490		err = check_reg_arg(env, regno, SRC_OP);
  8491		if (err)
  8492			return err;
  8493	
  8494		if (arg_type == ARG_ANYTHING) {
  8495			if (is_pointer_value(env, regno)) {
  8496				verbose(env, "R%d leaks addr into helper function\n",
  8497					regno);
  8498				return -EACCES;
  8499			}
  8500			return 0;
  8501		}
  8502	
  8503		if (type_is_pkt_pointer(type) &&
  8504		    !may_access_direct_pkt_data(env, meta, BPF_READ)) {
  8505			verbose(env, "helper access to the packet is not allowed\n");
  8506			return -EACCES;
  8507		}
  8508	
  8509		if (base_type(arg_type) == ARG_PTR_TO_MAP_VALUE) {
  8510			err = resolve_map_arg_type(env, meta, &arg_type);
  8511			if (err)
  8512				return err;
  8513		}
  8514	
  8515		if (bpf_register_is_null(reg) && type_may_be_null(arg_type))
  8516			/* A NULL register has a SCALAR_VALUE type, so skip
  8517			 * type checking.
  8518			 */
  8519			goto skip_type_check;
  8520	
  8521		/* arg_btf_id and arg_size are in a union. */
  8522		if (base_type(arg_type) == ARG_PTR_TO_BTF_ID ||
  8523		    base_type(arg_type) == ARG_PTR_TO_SPIN_LOCK)
  8524			arg_btf_id = fn->arg_btf_id[arg];
  8525	
  8526		err = check_reg_type(env, reg, argno_from_reg(regno), arg_type, arg_btf_id, meta);
  8527		if (err)
  8528			return err;
  8529	
  8530		err = check_func_arg_reg_off(env, reg, argno_from_reg(regno), arg_type);
  8531		if (err)
  8532			return err;
  8533	
  8534	skip_type_check:
  8535		if (arg_type_is_release(arg_type) && !arg_type_is_dynptr(arg_type) &&
  8536		    !reg_is_referenced(env, reg) && !bpf_register_is_null(reg)) {
  8537			verbose(env, "release helper %s expects referenced PTR_TO_BTF_ID passed to %s\n",
  8538				func_id_name(meta->func_id), reg_arg_name(env, argno));
> 8539				bpf_diag_report_call_type(env, insn_idx, regno,
  8540							  func_id_name(meta->func_id),
  8541							  reg_arg_name(env, argno),
  8542							  "release helpers require a value that owns a live resource returned by a matching acquire helper",
  8543							  "Pass the resource-owning pointer returned by the matching acquire helper, and avoid calling the release helper after ownership has "
  8544							  "already been transferred or released.");
  8545			return -EINVAL;
  8546		}
  8547	
  8548		if (reg_is_referenced(env, reg))
  8549			update_ref_obj(&meta->ref_obj, reg);
  8550	
  8551		switch (base_type(arg_type)) {
  8552		case ARG_CONST_MAP_PTR:
  8553			/* bpf_map_xxx(map_ptr) call: remember that map_ptr */
  8554			if (meta->map.ptr) {
  8555				/* Use map_uid (which is unique id of inner map) to reject:
  8556				 * inner_map1 = bpf_map_lookup_elem(outer_map, key1)
  8557				 * inner_map2 = bpf_map_lookup_elem(outer_map, key2)
  8558				 * if (inner_map1 && inner_map2) {
  8559				 *     timer = bpf_map_lookup_elem(inner_map1);
  8560				 *     if (timer)
  8561				 *         // mismatch would have been allowed
  8562				 *         bpf_timer_init(timer, inner_map2);
  8563				 * }
  8564				 *
  8565				 * Comparing map_ptr is enough to distinguish normal and outer maps.
  8566				 */
  8567				if (meta->map.ptr != reg->map_ptr ||
  8568				    meta->map.uid != reg->map_uid) {
  8569					verbose(env,
  8570						"timer pointer in R1 map_uid=%d doesn't match map pointer in R2 map_uid=%d\n",
  8571						meta->map.uid, reg->map_uid);
  8572					return -EINVAL;
  8573				}
  8574			}
  8575			meta->map.ptr = reg->map_ptr;
  8576			meta->map.uid = reg->map_uid;
  8577			break;
  8578		case ARG_PTR_TO_MAP_KEY:
  8579			/* bpf_map_xxx(..., map_ptr, ..., key) call:
  8580			 * check that [key, key + map->key_size) are within
  8581			 * stack limits and initialized
  8582			 */
  8583			if (!meta->map.ptr) {
  8584				/* in function declaration map_ptr must come before
  8585				 * map_key, so that it's verified and known before
  8586				 * we have to check map_key here. Otherwise it means
  8587				 * that kernel subsystem misconfigured verifier
  8588				 */
  8589				verifier_bug(env, "invalid map_ptr to access map->key");
  8590				return -EFAULT;
  8591			}
  8592			key_size = meta->map.ptr->key_size;
  8593			err = check_helper_mem_access(env, reg, argno_from_reg(regno), key_size, BPF_READ, false, NULL);
  8594			if (err)
  8595				return err;
  8596			if (can_elide_value_nullness(meta->map.ptr->map_type)) {
  8597				err = get_constant_map_key(env, reg, key_size, &meta->const_map_key);
  8598				if (err < 0) {
  8599					meta->const_map_key = -1;
  8600					if (err == -EOPNOTSUPP)
  8601						err = 0;
  8602					else
  8603						return err;
  8604				}
  8605			}
  8606			break;
  8607		case ARG_PTR_TO_MAP_VALUE:
  8608			if (type_may_be_null(arg_type) && bpf_register_is_null(reg))
  8609				return 0;
  8610	
  8611			/* bpf_map_xxx(..., map_ptr, ..., value) call:
  8612			 * check [value, value + map->value_size) validity
  8613			 */
  8614			if (!meta->map.ptr) {
  8615				/* kernel subsystem misconfigured verifier */
  8616				verifier_bug(env, "invalid map_ptr to access map->value");
  8617				return -EFAULT;
  8618			}
  8619			meta->raw_mode = arg_type & MEM_UNINIT;
  8620			err = check_helper_mem_access(env, reg, argno_from_reg(regno), meta->map.ptr->value_size,
  8621						      arg_type & MEM_WRITE ? BPF_WRITE : BPF_READ,
  8622						      false, meta);
  8623			break;
  8624		case ARG_PTR_TO_PERCPU_BTF_ID:
  8625			if (!reg->btf_id) {
  8626				verbose(env, "Helper has invalid btf_id in R%d\n", regno);
  8627				return -EACCES;
  8628			}
  8629			meta->ret_btf = reg->btf;
  8630			meta->ret_btf_id = reg->btf_id;
  8631			break;
  8632		case ARG_PTR_TO_SPIN_LOCK:
  8633			if (in_rbtree_lock_required_cb(env)) {
  8634				verbose(env, "can't spin_{lock,unlock} in rbtree cb\n");
  8635				return -EACCES;
  8636			}
  8637			if (meta->func_id == BPF_FUNC_spin_lock) {
  8638				err = process_spin_lock(env, reg, argno_from_reg(regno), PROCESS_SPIN_LOCK);
  8639				if (err)
  8640					return err;
  8641			} else if (meta->func_id == BPF_FUNC_spin_unlock) {
  8642				err = process_spin_lock(env, reg, argno_from_reg(regno), 0);
  8643				if (err)
  8644					return err;
  8645			} else {
  8646				verifier_bug(env, "spin lock arg on unexpected helper");
  8647				return -EFAULT;
  8648			}
  8649			break;
  8650		case ARG_PTR_TO_TIMER:
  8651			err = process_timer_helper(env, reg, argno_from_reg(regno), meta);
  8652			if (err)
  8653				return err;
  8654			break;
  8655		case ARG_PTR_TO_FUNC:
  8656			meta->subprogno = reg->subprogno;
  8657			break;
  8658		case ARG_PTR_TO_MEM:
  8659			/* The access to this pointer is only checked when we hit the
  8660			 * next is_mem_size argument below.
  8661			 */
  8662			meta->raw_mode = arg_type & MEM_UNINIT;
  8663			if (arg_type & MEM_FIXED_SIZE) {
  8664				err = check_helper_mem_access(env, reg, argno_from_reg(regno), fn->arg_size[arg],
  8665							      arg_type & MEM_WRITE ? BPF_WRITE : BPF_READ,
  8666							      false, meta);
  8667				if (err)
  8668					return err;
  8669				if (arg_type & MEM_ALIGNED)
  8670					err = check_ptr_alignment(env, reg, 0, fn->arg_size[arg], true);
  8671			}
  8672			break;
  8673		case ARG_CONST_SIZE:
  8674			err = check_mem_size_reg(env, reg_state(env, regno - 1), reg, argno_from_reg(regno - 1),
  8675						 argno_from_reg(regno),
  8676						 fn->arg_type[arg - 1] & MEM_WRITE ?
  8677						 BPF_WRITE : BPF_READ,
  8678						 false, meta);
  8679			break;
  8680		case ARG_CONST_SIZE_OR_ZERO:
  8681			err = check_mem_size_reg(env, reg_state(env, regno - 1), reg, argno_from_reg(regno - 1),
  8682						 argno_from_reg(regno),
  8683						 fn->arg_type[arg - 1] & MEM_WRITE ?
  8684						 BPF_WRITE : BPF_READ,
  8685						 true, meta);
  8686			break;
  8687		case ARG_PTR_TO_DYNPTR:
  8688			err = process_dynptr_func(env, reg, argno_from_reg(regno), insn_idx, arg_type, &meta->ref_obj,
  8689						  &meta->dynptr);
  8690			if (err)
  8691				return err;
  8692			break;
  8693		case ARG_CONST_ALLOC_SIZE_OR_ZERO:
  8694			if (!tnum_is_const(reg->var_off)) {
  8695				verbose(env, "R%d is not a known constant'\n",
  8696					regno);
  8697				return -EACCES;
  8698			}
  8699			meta->mem_size = reg->var_off.value;
  8700			err = mark_chain_precision(env, regno);
  8701			if (err)
  8702				return err;
  8703			break;
  8704		case ARG_PTR_TO_CONST_STR:
  8705		{
  8706			err = check_arg_const_str(env, reg, argno_from_reg(regno));
  8707			if (err)
  8708				return err;
  8709			break;
  8710		}
  8711		case ARG_KPTR_XCHG_DEST:
  8712			err = process_kptr_func(env, regno, meta);
  8713			if (err)
  8714				return err;
  8715			break;
  8716		}
  8717	
  8718		return err;
  8719	}
  8720	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
