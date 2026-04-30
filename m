Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51580359A81
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777524285; cv=none; b=F3wstEipeHuA9tyIQKfd8C+AYdsHLBw/mvDaIz6KSNH60JAfNsNNPpl8Y8eG8YYJdnses3xP7aSEIuu4zszldsLRwuLMkIa1pH8qs8NlbuJxtOwDImPawCAhHlr7rs6y0zv3HmmPlwNHBaDxE27I2Wmj3Anr7iruoJqHM3uYtd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777524285; c=relaxed/simple;
	bh=fnXsNsR6fPfmO8vWWz7Szb1pO5dgbt+zOtELIf229YY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WB+qrStRjZkP6SV2yybIgUbodcVAj71qQWERN1CsICIt8kz1VcbI4eHfdNHprvV1BXzgnx7E7owxM+8yV8wbifJZ6SZjP4MYzJH97+32MUYx7f6riQ/H1dY95mT5CrQwtIFHid9irRDqQtIGLTmu8ZppRa5doCoxxn76CoHCti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ud/K2PRR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ud/K2PRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777524285; x=1809060285;
  h=date:from:to:cc:subject:message-id;
  bh=fnXsNsR6fPfmO8vWWz7Szb1pO5dgbt+zOtELIf229YY=;
  b=Ud/K2PRRJkyN8IbIXnK8AfH+BiS9YnsUrTmcZ2g8OSX6B45roPQjA3tt
   f7qN+haHeg7WNA4dkXnl7mbFocDyTWEyT85cB84k/hiBhhsJTQC+rkJPg
   uvKNVy+cMRYRXLgu3buoxb7fh6hZuS/gOXtiJpeS6pGImh/hpmyg1DVmJ
   w3YUSvoLbtQZKTU4FWHa+zEiyPseDDg8C72nSp9Mn8iAkllAhM9VB9hti
   dwU2a+GLU+6etRfVK10/uIgjnyseGa5oH2KBIJAHRBDdQ9AH1DdRsWlzl
   eI63Af2njnTRcA9I0oaIoLVxYj/nCMudxucbOV5z73mPpZLtVVuIWvvt8
   g==;
X-CSE-ConnectionGUID: UF1HaGQPQX6zRYAD26eihA==
X-CSE-MsgGUID: 5jvQjehVQoGWmpPs/K+2ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82071706"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82071706"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 21:44:44 -0700
X-CSE-ConnectionGUID: mo99a87hREKzgnF/sknHlg==
X-CSE-MsgGUID: G0G/6rq2Q0iiw5Itjwpo6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239455435"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2026 21:44:42 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIJGR-00000000Bx8-2oYG;
	Thu, 30 Apr 2026 04:44:39 +0000
Date: Thu, 30 Apr 2026 12:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:rust-bpf 11/14] kernel/bpf/verifier.c:6405:1:
 error: label at end of compound statement
Message-ID: <202604301240.a6KnMHRP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git rust-bpf
head:   1623628cc9588b205a0e913c5e62d267ef0f6d70
commit: a0384236cb3e082d9b29da494e71db6275aef526 [11/14] bpf: Recognize func pointers in vtables
config: arm64-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301240.a6KnMHRP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301240.a6KnMHRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301240.a6KnMHRP-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_mem_access':
>> kernel/bpf/verifier.c:6405:1: error: label at end of compound statement
    done_map_read:
    ^~~~~~~~~~~~~


vim +6405 kernel/bpf/verifier.c

  6312	
  6313	/* check whether memory at (regno + off) is accessible for t = (read | write)
  6314	 * if t==write, value_regno is a register which value is stored into memory
  6315	 * if t==read, value_regno is a register which will receive the value from memory
  6316	 * if t==write && value_regno==-1, some unknown value is stored into memory
  6317	 * if t==read && value_regno==-1, don't care what we read from memory
  6318	 */
  6319	static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regno,
  6320				    int off, int bpf_size, enum bpf_access_type t,
  6321				    int value_regno, bool strict_alignment_once, bool is_ldsx)
  6322	{
  6323		struct bpf_reg_state *regs = cur_regs(env);
  6324		struct bpf_reg_state *reg = regs + regno;
  6325		int size, err = 0;
  6326	
  6327		size = bpf_size_to_bytes(bpf_size);
  6328		if (size < 0)
  6329			return size;
  6330	
  6331		err = check_ptr_alignment(env, reg, off, size, strict_alignment_once);
  6332		if (err)
  6333			return err;
  6334	
  6335		if (reg->type == PTR_TO_MAP_KEY) {
  6336			if (t == BPF_WRITE) {
  6337				verbose(env, "write to change key R%d not allowed\n", regno);
  6338				return -EACCES;
  6339			}
  6340	
  6341			err = check_mem_region_access(env, regno, off, size,
  6342						      reg->map_ptr->key_size, false);
  6343			if (err)
  6344				return err;
  6345			if (value_regno >= 0)
  6346				mark_reg_unknown(env, regs, value_regno);
  6347		} else if (reg->type == PTR_TO_MAP_VALUE) {
  6348			struct btf_field *kptr_field = NULL;
  6349	
  6350			if (t == BPF_WRITE && value_regno >= 0 &&
  6351			    is_pointer_value(env, value_regno)) {
  6352				verbose(env, "R%d leaks addr into map\n", value_regno);
  6353				return -EACCES;
  6354			}
  6355			err = check_map_access_type(env, regno, off, size, t);
  6356			if (err)
  6357				return err;
  6358			err = check_map_access(env, regno, off, size, false, ACCESS_DIRECT);
  6359			if (err)
  6360				return err;
  6361			if (tnum_is_const(reg->var_off))
  6362				kptr_field = btf_record_find(reg->map_ptr->record,
  6363							     off + reg->var_off.value, BPF_KPTR | BPF_UPTR);
  6364			if (kptr_field) {
  6365				err = check_map_kptr_access(env, regno, value_regno, insn_idx, kptr_field);
  6366			} else if (t == BPF_READ && value_regno >= 0) {
  6367				struct bpf_map *map = reg->map_ptr;
  6368	
  6369				/*
  6370				 * If map is read-only, track its contents as scalars,
  6371				 * unless it is an insn array (see the special case below)
  6372				 */
  6373				if (tnum_is_const(reg->var_off) &&
  6374				    bpf_map_is_rdonly(map) &&
  6375				    map->ops->map_direct_value_addr &&
  6376				    map->map_type != BPF_MAP_TYPE_INSN_ARRAY) {
  6377					int map_off = off + reg->var_off.value;
  6378					u64 val = 0;
  6379	
  6380					err = bpf_map_direct_read(map, map_off, size,
  6381								  &val, is_ldsx);
  6382					if (err)
  6383						return err;
  6384	
  6385					/* Check if the constant value is a known
  6386					 * subprog insn address (e.g. a vtable function
  6387					 * pointer in .data.rel.ro). If so, produce
  6388					 * PTR_TO_FUNC so callx can use it.
  6389					 */
  6390					if (size == 8 && val > 0) {
  6391						u32 insn_off = val / sizeof(struct bpf_insn);
  6392						int k;
  6393	
  6394						for (k = 0; k < env->subprog_cnt; k++) {
  6395							if (env->subprog_info[k].start == insn_off) {
  6396								mark_reg_unknown(env, regs, value_regno);
  6397								regs[value_regno].type = PTR_TO_FUNC;
  6398								regs[value_regno].subprogno = k;
  6399								goto done_map_read;
  6400							}
  6401						}
  6402					}
  6403					regs[value_regno].type = SCALAR_VALUE;
  6404					__mark_reg_known(&regs[value_regno], val);
> 6405	done_map_read:
  6406				} else if (map->map_type == BPF_MAP_TYPE_INSN_ARRAY) {
  6407					if (bpf_size != BPF_DW) {
  6408						verbose(env, "Invalid read of %d bytes from insn_array\n",
  6409							     size);
  6410						return -EACCES;
  6411					}
  6412					copy_register_state(&regs[value_regno], reg);
  6413					add_scalar_to_reg(&regs[value_regno], off);
  6414					regs[value_regno].type = PTR_TO_INSN;
  6415				} else {
  6416					mark_reg_unknown(env, regs, value_regno);
  6417				}
  6418			}
  6419		} else if (base_type(reg->type) == PTR_TO_MEM) {
  6420			bool rdonly_mem = type_is_rdonly_mem(reg->type);
  6421			bool rdonly_untrusted = rdonly_mem && (reg->type & PTR_UNTRUSTED);
  6422	
  6423			if (type_may_be_null(reg->type)) {
  6424				verbose(env, "R%d invalid mem access '%s'\n", regno,
  6425					reg_type_str(env, reg->type));
  6426				return -EACCES;
  6427			}
  6428	
  6429			if (t == BPF_WRITE && rdonly_mem) {
  6430				verbose(env, "R%d cannot write into %s\n",
  6431					regno, reg_type_str(env, reg->type));
  6432				return -EACCES;
  6433			}
  6434	
  6435			if (t == BPF_WRITE && value_regno >= 0 &&
  6436			    is_pointer_value(env, value_regno)) {
  6437				verbose(env, "R%d leaks addr into mem\n", value_regno);
  6438				return -EACCES;
  6439			}
  6440	
  6441			/*
  6442			 * Accesses to untrusted PTR_TO_MEM are done through probe
  6443			 * instructions, hence no need to check bounds in that case.
  6444			 */
  6445			if (!rdonly_untrusted)
  6446				err = check_mem_region_access(env, regno, off, size,
  6447							      reg->mem_size, false);
  6448			if (!err && value_regno >= 0 && (t == BPF_READ || rdonly_mem))
  6449				mark_reg_unknown(env, regs, value_regno);
  6450		} else if (reg->type == PTR_TO_CTX) {
  6451			struct bpf_insn_access_aux info = {
  6452				.reg_type = SCALAR_VALUE,
  6453				.is_ldsx = is_ldsx,
  6454				.log = &env->log,
  6455			};
  6456			struct bpf_retval_range range;
  6457	
  6458			if (t == BPF_WRITE && value_regno >= 0 &&
  6459			    is_pointer_value(env, value_regno)) {
  6460				verbose(env, "R%d leaks addr into ctx\n", value_regno);
  6461				return -EACCES;
  6462			}
  6463	
  6464			err = check_ctx_access(env, insn_idx, regno, off, size, t, &info);
  6465			if (!err && t == BPF_READ && value_regno >= 0) {
  6466				/* ctx access returns either a scalar, or a
  6467				 * PTR_TO_PACKET[_META,_END]. In the latter
  6468				 * case, we know the offset is zero.
  6469				 */
  6470				if (info.reg_type == SCALAR_VALUE) {
  6471					if (info.is_retval && get_func_retval_range(env->prog, &range)) {
  6472						err = __mark_reg_s32_range(env, regs, value_regno,
  6473									   range.minval, range.maxval);
  6474						if (err)
  6475							return err;
  6476					} else {
  6477						mark_reg_unknown(env, regs, value_regno);
  6478					}
  6479				} else {
  6480					mark_reg_known_zero(env, regs,
  6481							    value_regno);
  6482					if (type_may_be_null(info.reg_type))
  6483						regs[value_regno].id = ++env->id_gen;
  6484					/* A load of ctx field could have different
  6485					 * actual load size with the one encoded in the
  6486					 * insn. When the dst is PTR, it is for sure not
  6487					 * a sub-register.
  6488					 */
  6489					regs[value_regno].subreg_def = DEF_NOT_SUBREG;
  6490					if (base_type(info.reg_type) == PTR_TO_BTF_ID) {
  6491						regs[value_regno].btf = info.btf;
  6492						regs[value_regno].btf_id = info.btf_id;
  6493						regs[value_regno].ref_obj_id = info.ref_obj_id;
  6494					}
  6495				}
  6496				regs[value_regno].type = info.reg_type;
  6497			}
  6498	
  6499		} else if (reg->type == PTR_TO_STACK) {
  6500			/* Basic bounds checks. */
  6501			err = check_stack_access_within_bounds(env, regno, off, size, t);
  6502			if (err)
  6503				return err;
  6504	
  6505			if (t == BPF_READ)
  6506				err = check_stack_read(env, regno, off, size,
  6507						       value_regno);
  6508			else
  6509				err = check_stack_write(env, regno, off, size,
  6510							value_regno, insn_idx);
  6511		} else if (reg_is_pkt_pointer(reg)) {
  6512			if (t == BPF_WRITE && !may_access_direct_pkt_data(env, NULL, t)) {
  6513				verbose(env, "cannot write into packet\n");
  6514				return -EACCES;
  6515			}
  6516			if (t == BPF_WRITE && value_regno >= 0 &&
  6517			    is_pointer_value(env, value_regno)) {
  6518				verbose(env, "R%d leaks addr into packet\n",
  6519					value_regno);
  6520				return -EACCES;
  6521			}
  6522			err = check_packet_access(env, regno, off, size, false);
  6523			if (!err && t == BPF_READ && value_regno >= 0)
  6524				mark_reg_unknown(env, regs, value_regno);
  6525		} else if (reg->type == PTR_TO_FLOW_KEYS) {
  6526			if (t == BPF_WRITE && value_regno >= 0 &&
  6527			    is_pointer_value(env, value_regno)) {
  6528				verbose(env, "R%d leaks addr into flow keys\n",
  6529					value_regno);
  6530				return -EACCES;
  6531			}
  6532	
  6533			err = check_flow_keys_access(env, off, size);
  6534			if (!err && t == BPF_READ && value_regno >= 0)
  6535				mark_reg_unknown(env, regs, value_regno);
  6536		} else if (type_is_sk_pointer(reg->type)) {
  6537			if (t == BPF_WRITE) {
  6538				verbose(env, "R%d cannot write into %s\n",
  6539					regno, reg_type_str(env, reg->type));
  6540				return -EACCES;
  6541			}
  6542			err = check_sock_access(env, insn_idx, regno, off, size, t);
  6543			if (!err && value_regno >= 0)
  6544				mark_reg_unknown(env, regs, value_regno);
  6545		} else if (reg->type == PTR_TO_TP_BUFFER) {
  6546			err = check_tp_buffer_access(env, reg, regno, off, size);
  6547			if (!err && t == BPF_READ && value_regno >= 0)
  6548				mark_reg_unknown(env, regs, value_regno);
  6549		} else if (base_type(reg->type) == PTR_TO_BTF_ID &&
  6550			   !type_may_be_null(reg->type)) {
  6551			err = check_ptr_to_btf_access(env, regs, regno, off, size, t,
  6552						      value_regno);
  6553		} else if (reg->type == CONST_PTR_TO_MAP) {
  6554			err = check_ptr_to_map_access(env, regs, regno, off, size, t,
  6555						      value_regno);
  6556		} else if (base_type(reg->type) == PTR_TO_BUF &&
  6557			   !type_may_be_null(reg->type)) {
  6558			bool rdonly_mem = type_is_rdonly_mem(reg->type);
  6559			u32 *max_access;
  6560	
  6561			if (rdonly_mem) {
  6562				if (t == BPF_WRITE) {
  6563					verbose(env, "R%d cannot write into %s\n",
  6564						regno, reg_type_str(env, reg->type));
  6565					return -EACCES;
  6566				}
  6567				max_access = &env->prog->aux->max_rdonly_access;
  6568			} else {
  6569				max_access = &env->prog->aux->max_rdwr_access;
  6570			}
  6571	
  6572			err = check_buffer_access(env, reg, regno, off, size, false,
  6573						  max_access);
  6574	
  6575			if (!err && value_regno >= 0 && (rdonly_mem || t == BPF_READ))
  6576				mark_reg_unknown(env, regs, value_regno);
  6577		} else if (reg->type == PTR_TO_ARENA) {
  6578			if (t == BPF_READ && value_regno >= 0)
  6579				mark_reg_unknown(env, regs, value_regno);
  6580		} else {
  6581			verbose(env, "R%d invalid mem access '%s'\n", regno,
  6582				reg_type_str(env, reg->type));
  6583			return -EACCES;
  6584		}
  6585	
  6586		if (!err && size < BPF_REG_SIZE && value_regno >= 0 && t == BPF_READ &&
  6587		    regs[value_regno].type == SCALAR_VALUE) {
  6588			if (!is_ldsx)
  6589				/* b/h/w load zero-extends, mark upper bits as known 0 */
  6590				coerce_reg_to_size(&regs[value_regno], size);
  6591			else
  6592				coerce_reg_to_size_sx(&regs[value_regno], size);
  6593		}
  6594		return err;
  6595	}
  6596	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
