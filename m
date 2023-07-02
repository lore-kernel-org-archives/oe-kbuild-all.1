Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324B92101
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688308184; x=1719844184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IMmIPOZj3t78w2Z2JwHjFW5ppyIxa4baEOYhW0ZFO08=;
  b=gXfO25KPrh6C6wH0gD4EDXB3oya2JCxHunbQ6r4mFxB+9ifNWfb5UZvz
   TjIbGFklwZE5OvHHQsoeUOMW/jh4MIY6+BP04OQoUsgCcLhHOwjjIFzlf
   I3wvg2xjYWJtA49uc/FcPAMkMXHjqT1VTYVR/zKFsEp4eDaLozZAYlD6b
   vHe37vcOj7Q7J7/14yNS7nAxpZao/uUu/bzuE+8ukXCGhy3JQX7opoxvj
   e2wdRHaXeuRPUqzowHjquAL1+ZmeiPMMwGSnt1MvFNbaDLMIrpwAspFcI
   jVZZolj6C/mIWmyZ8fcYmO/gngSq0rWrovf4ZCaET1/FrSazfqEG324tr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426386232"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="426386232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 07:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="721518860"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="721518860"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jul 2023 07:29:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFy56-000Ghr-1n;
	Sun, 02 Jul 2023 14:29:40 +0000
Date: Sun, 2 Jul 2023 22:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yhs@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 02/13] bpf: Add verifier support for
 sign-extension load insns
Message-ID: <202307022221.ZvtBGOCA-lkp@intel.com>
References: <20230629063726.1649316-1-yhs@fb.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629063726.1649316-1-yhs@fb.com>

Hi Yonghong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Support-new-sign-extension-load-insns/20230629-144251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230629063726.1649316-1-yhs%40fb.com
patch subject: [RFC PATCH bpf-next 02/13] bpf: Add verifier support for sign-extension load insns
config: x86_64-randconfig-x061-20230702 (https://download.01.org/0day-ci/archive/20230702/202307022221.ZvtBGOCA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307022221.ZvtBGOCA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307022221.ZvtBGOCA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/verifier.c:18560:38: sparse: sparse: subtraction of functions? Share your drugs
>> kernel/bpf/verifier.c:6322:86: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ff)
>> kernel/bpf/verifier.c:6323:86: sparse: sparse: cast truncates bits from constant value (80000000 becomes 0)
>> kernel/bpf/verifier.c:6325:87: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ffff)
   kernel/bpf/verifier.c:6326:87: sparse: sparse: cast truncates bits from constant value (80000000 becomes 0)
   kernel/bpf/verifier.c: note: in included file (through include/linux/bpf.h, include/linux/bpf-cgroup.h):
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
   include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar

vim +6322 kernel/bpf/verifier.c

  6241	
  6242	/* check whether memory at (regno + off) is accessible for t = (read | write)
  6243	 * if t==write, value_regno is a register which value is stored into memory
  6244	 * if t==read, value_regno is a register which will receive the value from memory
  6245	 * if t==write && value_regno==-1, some unknown value is stored into memory
  6246	 * if t==read && value_regno==-1, don't care what we read from memory
  6247	 */
  6248	static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regno,
  6249				    int off, int bpf_size, enum bpf_access_type t,
  6250				    int value_regno, bool strict_alignment_once, bool sign_ext_ld)
  6251	{
  6252		struct bpf_reg_state *regs = cur_regs(env);
  6253		struct bpf_reg_state *reg = regs + regno;
  6254		struct bpf_func_state *state;
  6255		int size, err = 0;
  6256	
  6257		size = bpf_size_to_bytes(bpf_size);
  6258		if (size < 0)
  6259			return size;
  6260	
  6261		/* alignment checks will add in reg->off themselves */
  6262		err = check_ptr_alignment(env, reg, off, size, strict_alignment_once);
  6263		if (err)
  6264			return err;
  6265	
  6266		/* for access checks, reg->off is just part of off */
  6267		off += reg->off;
  6268	
  6269		if (reg->type == PTR_TO_MAP_KEY) {
  6270			if (t == BPF_WRITE) {
  6271				verbose(env, "write to change key R%d not allowed\n", regno);
  6272				return -EACCES;
  6273			}
  6274	
  6275			err = check_mem_region_access(env, regno, off, size,
  6276						      reg->map_ptr->key_size, false);
  6277			if (err)
  6278				return err;
  6279			if (value_regno >= 0)
  6280				mark_reg_unknown(env, regs, value_regno);
  6281		} else if (reg->type == PTR_TO_MAP_VALUE) {
  6282			struct btf_field *kptr_field = NULL;
  6283	
  6284			if (t == BPF_WRITE && value_regno >= 0 &&
  6285			    is_pointer_value(env, value_regno)) {
  6286				verbose(env, "R%d leaks addr into map\n", value_regno);
  6287				return -EACCES;
  6288			}
  6289			err = check_map_access_type(env, regno, off, size, t);
  6290			if (err)
  6291				return err;
  6292			err = check_map_access(env, regno, off, size, false, ACCESS_DIRECT);
  6293			if (err)
  6294				return err;
  6295			if (tnum_is_const(reg->var_off))
  6296				kptr_field = btf_record_find(reg->map_ptr->record,
  6297							     off + reg->var_off.value, BPF_KPTR);
  6298			if (kptr_field) {
  6299				err = check_map_kptr_access(env, regno, value_regno, insn_idx, kptr_field);
  6300			} else if (t == BPF_READ && value_regno >= 0) {
  6301				struct bpf_map *map = reg->map_ptr;
  6302	
  6303				/* if map is read-only, track its contents as scalars */
  6304				if (tnum_is_const(reg->var_off) &&
  6305				    bpf_map_is_rdonly(map) &&
  6306				    map->ops->map_direct_value_addr) {
  6307					int map_off = off + reg->var_off.value;
  6308					u64 val = 0;
  6309	
  6310					err = bpf_map_direct_read(map, map_off, size,
  6311								  &val);
  6312					if (err)
  6313						return err;
  6314	
  6315					regs[value_regno].type = SCALAR_VALUE;
  6316					__mark_reg_known(&regs[value_regno], val);
  6317				} else {
  6318					mark_reg_unknown(env, regs, value_regno);
  6319	
  6320					if (sign_ext_ld) {
  6321						if (size == 1) {
> 6322							regs[value_regno].smax_value = (char)INT_MAX;
> 6323							regs[value_regno].smin_value = (char)INT_MIN;
  6324						} else if (size == 2) {
> 6325							regs[value_regno].smax_value = (short)INT_MAX;
  6326							regs[value_regno].smin_value = (short)INT_MIN;
  6327						} else if (size == 4) {
  6328							regs[value_regno].smax_value = INT_MAX;
  6329							regs[value_regno].smin_value = INT_MIN;
  6330						}
  6331					}
  6332				}
  6333			}
  6334		} else if (base_type(reg->type) == PTR_TO_MEM) {
  6335			bool rdonly_mem = type_is_rdonly_mem(reg->type);
  6336	
  6337			if (type_may_be_null(reg->type)) {
  6338				verbose(env, "R%d invalid mem access '%s'\n", regno,
  6339					reg_type_str(env, reg->type));
  6340				return -EACCES;
  6341			}
  6342	
  6343			if (t == BPF_WRITE && rdonly_mem) {
  6344				verbose(env, "R%d cannot write into %s\n",
  6345					regno, reg_type_str(env, reg->type));
  6346				return -EACCES;
  6347			}
  6348	
  6349			if (t == BPF_WRITE && value_regno >= 0 &&
  6350			    is_pointer_value(env, value_regno)) {
  6351				verbose(env, "R%d leaks addr into mem\n", value_regno);
  6352				return -EACCES;
  6353			}
  6354	
  6355			err = check_mem_region_access(env, regno, off, size,
  6356						      reg->mem_size, false);
  6357			if (!err && value_regno >= 0 && (t == BPF_READ || rdonly_mem))
  6358				mark_reg_unknown(env, regs, value_regno);
  6359		} else if (reg->type == PTR_TO_CTX) {
  6360			enum bpf_reg_type reg_type = SCALAR_VALUE;
  6361			struct btf *btf = NULL;
  6362			u32 btf_id = 0;
  6363	
  6364			if (t == BPF_WRITE && value_regno >= 0 &&
  6365			    is_pointer_value(env, value_regno)) {
  6366				verbose(env, "R%d leaks addr into ctx\n", value_regno);
  6367				return -EACCES;
  6368			}
  6369	
  6370			err = check_ptr_off_reg(env, reg, regno);
  6371			if (err < 0)
  6372				return err;
  6373	
  6374			err = check_ctx_access(env, insn_idx, off, size, t, &reg_type, &btf,
  6375					       &btf_id);
  6376			if (err)
  6377				verbose_linfo(env, insn_idx, "; ");
  6378			if (!err && t == BPF_READ && value_regno >= 0) {
  6379				/* ctx access returns either a scalar, or a
  6380				 * PTR_TO_PACKET[_META,_END]. In the latter
  6381				 * case, we know the offset is zero.
  6382				 */
  6383				if (reg_type == SCALAR_VALUE) {
  6384					mark_reg_unknown(env, regs, value_regno);
  6385				} else {
  6386					mark_reg_known_zero(env, regs,
  6387							    value_regno);
  6388					if (type_may_be_null(reg_type))
  6389						regs[value_regno].id = ++env->id_gen;
  6390					/* A load of ctx field could have different
  6391					 * actual load size with the one encoded in the
  6392					 * insn. When the dst is PTR, it is for sure not
  6393					 * a sub-register.
  6394					 */
  6395					regs[value_regno].subreg_def = DEF_NOT_SUBREG;
  6396					if (base_type(reg_type) == PTR_TO_BTF_ID) {
  6397						regs[value_regno].btf = btf;
  6398						regs[value_regno].btf_id = btf_id;
  6399					}
  6400				}
  6401				regs[value_regno].type = reg_type;
  6402			}
  6403	
  6404		} else if (reg->type == PTR_TO_STACK) {
  6405			/* Basic bounds checks. */
  6406			err = check_stack_access_within_bounds(env, regno, off, size, ACCESS_DIRECT, t);
  6407			if (err)
  6408				return err;
  6409	
  6410			state = func(env, reg);
  6411			err = update_stack_depth(env, state, off);
  6412			if (err)
  6413				return err;
  6414	
  6415			if (t == BPF_READ)
  6416				err = check_stack_read(env, regno, off, size,
  6417						       value_regno);
  6418			else
  6419				err = check_stack_write(env, regno, off, size,
  6420							value_regno, insn_idx);
  6421		} else if (reg_is_pkt_pointer(reg)) {
  6422			if (t == BPF_WRITE && !may_access_direct_pkt_data(env, NULL, t)) {
  6423				verbose(env, "cannot write into packet\n");
  6424				return -EACCES;
  6425			}
  6426			if (t == BPF_WRITE && value_regno >= 0 &&
  6427			    is_pointer_value(env, value_regno)) {
  6428				verbose(env, "R%d leaks addr into packet\n",
  6429					value_regno);
  6430				return -EACCES;
  6431			}
  6432			err = check_packet_access(env, regno, off, size, false);
  6433			if (!err && t == BPF_READ && value_regno >= 0)
  6434				mark_reg_unknown(env, regs, value_regno);
  6435		} else if (reg->type == PTR_TO_FLOW_KEYS) {
  6436			if (t == BPF_WRITE && value_regno >= 0 &&
  6437			    is_pointer_value(env, value_regno)) {
  6438				verbose(env, "R%d leaks addr into flow keys\n",
  6439					value_regno);
  6440				return -EACCES;
  6441			}
  6442	
  6443			err = check_flow_keys_access(env, off, size);
  6444			if (!err && t == BPF_READ && value_regno >= 0)
  6445				mark_reg_unknown(env, regs, value_regno);
  6446		} else if (type_is_sk_pointer(reg->type)) {
  6447			if (t == BPF_WRITE) {
  6448				verbose(env, "R%d cannot write into %s\n",
  6449					regno, reg_type_str(env, reg->type));
  6450				return -EACCES;
  6451			}
  6452			err = check_sock_access(env, insn_idx, regno, off, size, t);
  6453			if (!err && value_regno >= 0)
  6454				mark_reg_unknown(env, regs, value_regno);
  6455		} else if (reg->type == PTR_TO_TP_BUFFER) {
  6456			err = check_tp_buffer_access(env, reg, regno, off, size);
  6457			if (!err && t == BPF_READ && value_regno >= 0)
  6458				mark_reg_unknown(env, regs, value_regno);
  6459		} else if (base_type(reg->type) == PTR_TO_BTF_ID &&
  6460			   !type_may_be_null(reg->type)) {
  6461			err = check_ptr_to_btf_access(env, regs, regno, off, size, t,
  6462						      value_regno);
  6463		} else if (reg->type == CONST_PTR_TO_MAP) {
  6464			err = check_ptr_to_map_access(env, regs, regno, off, size, t,
  6465						      value_regno);
  6466		} else if (base_type(reg->type) == PTR_TO_BUF) {
  6467			bool rdonly_mem = type_is_rdonly_mem(reg->type);
  6468			u32 *max_access;
  6469	
  6470			if (rdonly_mem) {
  6471				if (t == BPF_WRITE) {
  6472					verbose(env, "R%d cannot write into %s\n",
  6473						regno, reg_type_str(env, reg->type));
  6474					return -EACCES;
  6475				}
  6476				max_access = &env->prog->aux->max_rdonly_access;
  6477			} else {
  6478				max_access = &env->prog->aux->max_rdwr_access;
  6479			}
  6480	
  6481			err = check_buffer_access(env, reg, regno, off, size, false,
  6482						  max_access);
  6483	
  6484			if (!err && value_regno >= 0 && (rdonly_mem || t == BPF_READ))
  6485				mark_reg_unknown(env, regs, value_regno);
  6486		} else {
  6487			verbose(env, "R%d invalid mem access '%s'\n", regno,
  6488				reg_type_str(env, reg->type));
  6489			return -EACCES;
  6490		}
  6491	
  6492		if (!err && size < BPF_REG_SIZE && value_regno >= 0 && t == BPF_READ &&
  6493		    regs[value_regno].type == SCALAR_VALUE && !sign_ext_ld) {
  6494			/* b/h/w load zero-extends, mark upper bits as known 0 */
  6495			coerce_reg_to_size(&regs[value_regno], size);
  6496		}
  6497		return err;
  6498	}
  6499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
