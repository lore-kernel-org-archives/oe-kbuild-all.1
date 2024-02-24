Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8015A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708735219; cv=none; b=b/LlaCIfFLxFJSdw7u3tL3n/7hhxmN7SN+j45G2/rEmnlUMxANdG8SV5sLjOxByQN+Np+vzN5KYr9OuTKD1/zigr5RoFDpni6ZguR5JDZz8IH86369sayRDmj7MVwTP7EdDmbrXmpzWWm5/zSWFRhE0TS+LTc0k6WtFEJ5ZKuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708735219; c=relaxed/simple;
	bh=JFkMSzcFtdYBNrHCRscTM8/+CRk0vHpajTavb7oLNmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=frwcnOxU3PGPyO/e7GdLe1avA5IB3kebTGZJHSjEtAFcC3hVWMSk/XNrtYyZSR4IavWLTo2kAgnJcg5TuUTJzi2r+Pm2zxPVEpJ7EDhUeHdp6jNAsmYShbHJDUpXPWkN1A3weIBoXUV101U3CUrQYALbD+I03UBi4SXbEasbEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcGCJ/ls; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcGCJ/ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708735217; x=1740271217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFkMSzcFtdYBNrHCRscTM8/+CRk0vHpajTavb7oLNmc=;
  b=GcGCJ/lsH5yCSQy7ALNsyOCmz3iJSAPI/q4eitFWRIgXTpUsgyGzavlc
   mtqXmbTh3fK6gYOBkRvYtpPV9S3UC62GkcBeqK5HNaqI+XaNifsXfGyhR
   7HHXO1p0zOU3MPcBeo3ujyEFBOHnfVb4lLPn2spq41gRe6KNiCu+S/Su2
   qsKZWm1tP8F+bVbvXqYF6GBqHpHbLGdyCull2cQYhxDbySuyZ1l++oweh
   i6O47JPE+K0dQ+sWaZhVzdN308ptlIPRdDjfOPokPqHXFaxFZRGplHr0V
   GKcB5t1oY2t05/XNaU1FyE7qikBxak0hXjrUDtgMfXfK9EnNOEMwQ5Wb5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3592821"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3592821"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 16:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6547649"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Feb 2024 16:40:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdg5J-00082g-0j;
	Sat, 24 Feb 2024 00:40:09 +0000
Date: Sat, 24 Feb 2024 08:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/bpf/verifier.c:3203:8: warning: expression which evaluates to
 zero treated as a null pointer constant of type 'const char *'
Message-ID: <202402240800.TZ5auOwq-lkp@intel.com>
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
commit: 8c823500fa131d62fdbfb1578a4b6eb73b78be9d bpf: Support readonly/readwrite buffers in verifier
date:   1 year, 6 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240224/202402240800.TZ5auOwq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240800.TZ5auOwq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240800.TZ5auOwq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/verifier.c:3203:8: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
    3203 |                                           false,
         |                                           ^~~~~
   kernel/bpf/verifier.c:3209:8: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
    3209 |                                           false,
         |                                           ^~~~~
   kernel/bpf/verifier.c:9516:16: warning: cast from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9516 |                         insn->imm = BPF_CAST_CALL(func[subprog]->bpf_func) -
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9892:17: warning: cast from 'void *(*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9892 |                                 insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9896:17: warning: cast from 'int (*)(struct bpf_map *, void *, void *, u64)' (aka 'int (*)(struct bpf_map *, void *, void *, unsigned long long)') to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9896 |                                 insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9900:17: warning: cast from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9900 |                                 insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9904:17: warning: cast from 'int (*)(struct bpf_map *, void *, u64)' (aka 'int (*)(struct bpf_map *, void *, unsigned long long)') to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9904 |                                 insn->imm = BPF_CAST_CALL(ops->map_push_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9908:17: warning: cast from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9908 |                                 insn->imm = BPF_CAST_CALL(ops->map_pop_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:9912:17: warning: cast from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    9912 |                                 insn->imm = BPF_CAST_CALL(ops->map_peek_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:349:4: note: expanded from macro 'BPF_CAST_CALL'
     349 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   9 warnings generated.


vim +3203 kernel/bpf/verifier.c

  3033	
  3034	
  3035	/* check whether memory at (regno + off) is accessible for t = (read | write)
  3036	 * if t==write, value_regno is a register which value is stored into memory
  3037	 * if t==read, value_regno is a register which will receive the value from memory
  3038	 * if t==write && value_regno==-1, some unknown value is stored into memory
  3039	 * if t==read && value_regno==-1, don't care what we read from memory
  3040	 */
  3041	static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regno,
  3042				    int off, int bpf_size, enum bpf_access_type t,
  3043				    int value_regno, bool strict_alignment_once)
  3044	{
  3045		struct bpf_reg_state *regs = cur_regs(env);
  3046		struct bpf_reg_state *reg = regs + regno;
  3047		struct bpf_func_state *state;
  3048		int size, err = 0;
  3049	
  3050		size = bpf_size_to_bytes(bpf_size);
  3051		if (size < 0)
  3052			return size;
  3053	
  3054		/* alignment checks will add in reg->off themselves */
  3055		err = check_ptr_alignment(env, reg, off, size, strict_alignment_once);
  3056		if (err)
  3057			return err;
  3058	
  3059		/* for access checks, reg->off is just part of off */
  3060		off += reg->off;
  3061	
  3062		if (reg->type == PTR_TO_MAP_VALUE) {
  3063			if (t == BPF_WRITE && value_regno >= 0 &&
  3064			    is_pointer_value(env, value_regno)) {
  3065				verbose(env, "R%d leaks addr into map\n", value_regno);
  3066				return -EACCES;
  3067			}
  3068			err = check_map_access_type(env, regno, off, size, t);
  3069			if (err)
  3070				return err;
  3071			err = check_map_access(env, regno, off, size, false);
  3072			if (!err && t == BPF_READ && value_regno >= 0) {
  3073				struct bpf_map *map = reg->map_ptr;
  3074	
  3075				/* if map is read-only, track its contents as scalars */
  3076				if (tnum_is_const(reg->var_off) &&
  3077				    bpf_map_is_rdonly(map) &&
  3078				    map->ops->map_direct_value_addr) {
  3079					int map_off = off + reg->var_off.value;
  3080					u64 val = 0;
  3081	
  3082					err = bpf_map_direct_read(map, map_off, size,
  3083								  &val);
  3084					if (err)
  3085						return err;
  3086	
  3087					regs[value_regno].type = SCALAR_VALUE;
  3088					__mark_reg_known(&regs[value_regno], val);
  3089				} else {
  3090					mark_reg_unknown(env, regs, value_regno);
  3091				}
  3092			}
  3093		} else if (reg->type == PTR_TO_CTX) {
  3094			enum bpf_reg_type reg_type = SCALAR_VALUE;
  3095			u32 btf_id = 0;
  3096	
  3097			if (t == BPF_WRITE && value_regno >= 0 &&
  3098			    is_pointer_value(env, value_regno)) {
  3099				verbose(env, "R%d leaks addr into ctx\n", value_regno);
  3100				return -EACCES;
  3101			}
  3102	
  3103			err = check_ctx_reg(env, reg, regno);
  3104			if (err < 0)
  3105				return err;
  3106	
  3107			err = check_ctx_access(env, insn_idx, off, size, t, &reg_type, &btf_id);
  3108			if (err)
  3109				verbose_linfo(env, insn_idx, "; ");
  3110			if (!err && t == BPF_READ && value_regno >= 0) {
  3111				/* ctx access returns either a scalar, or a
  3112				 * PTR_TO_PACKET[_META,_END]. In the latter
  3113				 * case, we know the offset is zero.
  3114				 */
  3115				if (reg_type == SCALAR_VALUE) {
  3116					mark_reg_unknown(env, regs, value_regno);
  3117				} else {
  3118					mark_reg_known_zero(env, regs,
  3119							    value_regno);
  3120					if (reg_type_may_be_null(reg_type))
  3121						regs[value_regno].id = ++env->id_gen;
  3122					/* A load of ctx field could have different
  3123					 * actual load size with the one encoded in the
  3124					 * insn. When the dst is PTR, it is for sure not
  3125					 * a sub-register.
  3126					 */
  3127					regs[value_regno].subreg_def = DEF_NOT_SUBREG;
  3128					if (reg_type == PTR_TO_BTF_ID ||
  3129					    reg_type == PTR_TO_BTF_ID_OR_NULL)
  3130						regs[value_regno].btf_id = btf_id;
  3131				}
  3132				regs[value_regno].type = reg_type;
  3133			}
  3134	
  3135		} else if (reg->type == PTR_TO_STACK) {
  3136			off += reg->var_off.value;
  3137			err = check_stack_access(env, reg, off, size);
  3138			if (err)
  3139				return err;
  3140	
  3141			state = func(env, reg);
  3142			err = update_stack_depth(env, state, off);
  3143			if (err)
  3144				return err;
  3145	
  3146			if (t == BPF_WRITE)
  3147				err = check_stack_write(env, state, off, size,
  3148							value_regno, insn_idx);
  3149			else
  3150				err = check_stack_read(env, state, off, size,
  3151						       value_regno);
  3152		} else if (reg_is_pkt_pointer(reg)) {
  3153			if (t == BPF_WRITE && !may_access_direct_pkt_data(env, NULL, t)) {
  3154				verbose(env, "cannot write into packet\n");
  3155				return -EACCES;
  3156			}
  3157			if (t == BPF_WRITE && value_regno >= 0 &&
  3158			    is_pointer_value(env, value_regno)) {
  3159				verbose(env, "R%d leaks addr into packet\n",
  3160					value_regno);
  3161				return -EACCES;
  3162			}
  3163			err = check_packet_access(env, regno, off, size, false);
  3164			if (!err && t == BPF_READ && value_regno >= 0)
  3165				mark_reg_unknown(env, regs, value_regno);
  3166		} else if (reg->type == PTR_TO_FLOW_KEYS) {
  3167			if (t == BPF_WRITE && value_regno >= 0 &&
  3168			    is_pointer_value(env, value_regno)) {
  3169				verbose(env, "R%d leaks addr into flow keys\n",
  3170					value_regno);
  3171				return -EACCES;
  3172			}
  3173	
  3174			err = check_flow_keys_access(env, off, size);
  3175			if (!err && t == BPF_READ && value_regno >= 0)
  3176				mark_reg_unknown(env, regs, value_regno);
  3177		} else if (type_is_sk_pointer(reg->type)) {
  3178			if (t == BPF_WRITE) {
  3179				verbose(env, "R%d cannot write into %s\n",
  3180					regno, reg_type_str[reg->type]);
  3181				return -EACCES;
  3182			}
  3183			err = check_sock_access(env, insn_idx, regno, off, size, t);
  3184			if (!err && value_regno >= 0)
  3185				mark_reg_unknown(env, regs, value_regno);
  3186		} else if (reg->type == PTR_TO_TP_BUFFER) {
  3187			err = check_tp_buffer_access(env, reg, regno, off, size);
  3188			if (!err && t == BPF_READ && value_regno >= 0)
  3189				mark_reg_unknown(env, regs, value_regno);
  3190		} else if (reg->type == PTR_TO_BTF_ID) {
  3191			err = check_ptr_to_btf_access(env, regs, regno, off, size, t,
  3192						      value_regno);
  3193		} else if (reg->type == CONST_PTR_TO_MAP) {
  3194			err = check_ptr_to_map_access(env, regs, regno, off, size, t,
  3195						      value_regno);
  3196		} else if (reg->type == PTR_TO_RDONLY_BUF) {
  3197			if (t == BPF_WRITE) {
  3198				verbose(env, "R%d cannot write into %s\n",
  3199					regno, reg_type_str[reg->type]);
  3200				return -EACCES;
  3201			}
  3202			err = check_buffer_access(env, reg, regno, off, size, "rdonly",
> 3203						  false,
  3204						  &env->prog->aux->max_rdonly_access);
  3205			if (!err && value_regno >= 0)
  3206				mark_reg_unknown(env, regs, value_regno);
  3207		} else if (reg->type == PTR_TO_RDWR_BUF) {
  3208			err = check_buffer_access(env, reg, regno, off, size, "rdwr",
  3209						  false,
  3210						  &env->prog->aux->max_rdwr_access);
  3211			if (!err && t == BPF_READ && value_regno >= 0)
  3212				mark_reg_unknown(env, regs, value_regno);
  3213		} else {
  3214			verbose(env, "R%d invalid mem access '%s'\n", regno,
  3215				reg_type_str[reg->type]);
  3216			return -EACCES;
  3217		}
  3218	
  3219		if (!err && size < BPF_REG_SIZE && value_regno >= 0 && t == BPF_READ &&
  3220		    regs[value_regno].type == SCALAR_VALUE) {
  3221			/* b/h/w load zero-extends, mark upper bits as known 0 */
  3222			coerce_reg_to_size(&regs[value_regno], size);
  3223		}
  3224		return err;
  3225	}
  3226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
