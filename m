Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545EC2C11C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 07:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844359; cv=none; b=e9ODWZROYTrskiZUD9sMkSs2BeNSiDCuycBseSy94yH/uS34ZSTy8KvrAGdQBjuZNOodLuAwsRDo8Y6v4C7stU/GWqXQlLBZXF7sOgwJasjJCKo235OgnTwXvTUFOgev/wVB0exhSsYenWNeBbITv7JPPTBZKN0KvZDgAkUU0KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844359; c=relaxed/simple;
	bh=TYJvJV1pqGBbAGH8g8IN2Qc79Chmn4P1nxozDTU+CQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EWvUVXHAR72dNObGl34/VnuJmz6t2u7LCspKnorULmVnDi0HPhYVHKYo8Pl9LHRqBHCFx750orWG0mpEuPvaYTX8Tz9IcFgqtzG0xWBGFHiLmykAIuB0xhenFyk2SRXz1jcP+3lArBjbmp8PCC621EsCUx735Kxr9Zt2Zmiknzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfOIWTx0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfOIWTx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769844357; x=1801380357;
  h=date:from:to:cc:subject:message-id;
  bh=TYJvJV1pqGBbAGH8g8IN2Qc79Chmn4P1nxozDTU+CQo=;
  b=cfOIWTx0lE1mwopPu7iDn1cd0INyDDsgXjclsf7y0TXrcK/VfctvR2BO
   inaDZ3ThBjorv8aJ8X4qaqVhirW1KlzyjAX2T4xI5bYikY45gzsT39ECD
   HknSdcZMbwYI5WzMTUxqBJ/3ScTpY5fEjPKlbQrjIeHdz0Unj/S9fJy4Z
   ToZJa7wnwEfUb1UsXNYPVUmtNbHUfXESjL42eP3vCpfjebIggeMvak0qQ
   eesnwqYQ/1Q+LrbW88Jqa6yjCVE4rqAQMJ/wLG3sy9MVW8BX9Tziece3k
   ycm/u0VGvpWtump4+YsSimd+UWGNIRVVdHHD9zGUkQ4w/qM1C432ig9Qr
   A==;
X-CSE-ConnectionGUID: qLc+MLgGTVKV7sz7sTxegA==
X-CSE-MsgGUID: P20ZH3QLRAKXBrk+A34tiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71141006"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="71141006"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 23:25:55 -0800
X-CSE-ConnectionGUID: 9J5YipH2Sn6ZoZlE6zezWQ==
X-CSE-MsgGUID: hS+Db/zaQ9KUaoxXrKVhwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213124118"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2026 23:25:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm5Mc-00000000dli-3pzI;
	Sat, 31 Jan 2026 07:25:50 +0000
Date: Sat, 31 Jan 2026 15:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 4/12]
 kernel/bpf/syscall.c:2959:15: error: implicit declaration of function
 'is_tracing_multi'; did you mean 'ptr_ring_full'?
Message-ID: <202601311536.p4QWlZ1w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: b3f268537d0fe295d4c6d51f203d0928f9493a5f [4/12] bpf: Add multi tracing attach types
config: arc-randconfig-r072-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311536.p4QWlZ1w-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311536.p4QWlZ1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311536.p4QWlZ1w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1544:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
                                                      ^~~~~~~~~~~~~~
   include/linux/bpf.h:1550:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
                                                        ^~~~~~~~~~~~~~
   kernel/bpf/syscall.c: In function 'bpf_prog_load':
>> kernel/bpf/syscall.c:2959:15: error: implicit declaration of function 'is_tracing_multi'; did you mean 'ptr_ring_full'? [-Werror=implicit-function-declaration]
     multi_func = is_tracing_multi(attr->expected_attach_type);
                  ^~~~~~~~~~~~~~~~
                  ptr_ring_full
   In file included from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from kernel/bpf/syscall.c:5:
   kernel/bpf/syscall.c: In function 'bpf_tracing_link_release':
   kernel/bpf/syscall.c:3520:42: error: passing argument 1 of 'bpf_trampoline_unlink_prog' from incompatible pointer type [-Werror=incompatible-pointer-types]
     WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
                                             ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   kernel/bpf/syscall.c:3520:2: note: in expansion of macro 'WARN_ON_ONCE'
     WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
     ^~~~~~~~~~~~
   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1550:69: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
                                                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/bpf/syscall.c: In function 'bpf_tracing_prog_attach':
   kernel/bpf/syscall.c:3756:33: error: passing argument 1 of 'bpf_trampoline_link_prog' from incompatible pointer type [-Werror=incompatible-pointer-types]
     err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
                                    ^~~~~~~~~~~~~~~~
   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1544:67: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bpf-cgroup.h:5,
                    from kernel/bpf/verifier.c:7:
   include/linux/bpf.h:1544:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
                                                      ^~~~~~~~~~~~~~
   include/linux/bpf.h:1550:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
                                                        ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'check_attach_btf_id':
>> kernel/bpf/verifier.c:25118:13: error: implicit declaration of function 'is_tracing_multi'; did you mean 'is_tracing_prog_type'? [-Werror=implicit-function-declaration]
     } else if (is_tracing_multi(prog->expected_attach_type))
                ^~~~~~~~~~~~~~~~
                is_tracing_prog_type
   cc1: some warnings being treated as errors


vim +2959 kernel/bpf/syscall.c

  2882	
  2883	static int bpf_prog_load(union bpf_attr *attr, bpfptr_t uattr, u32 uattr_size)
  2884	{
  2885		enum bpf_prog_type type = attr->prog_type;
  2886		struct bpf_prog *prog, *dst_prog = NULL;
  2887		struct btf *attach_btf = NULL;
  2888		struct bpf_token *token = NULL;
  2889		bool bpf_cap;
  2890		int err;
  2891		char license[128];
  2892		bool multi_func;
  2893	
  2894		if (CHECK_ATTR(BPF_PROG_LOAD))
  2895			return -EINVAL;
  2896	
  2897		if (attr->prog_flags & ~(BPF_F_STRICT_ALIGNMENT |
  2898					 BPF_F_ANY_ALIGNMENT |
  2899					 BPF_F_TEST_STATE_FREQ |
  2900					 BPF_F_SLEEPABLE |
  2901					 BPF_F_TEST_RND_HI32 |
  2902					 BPF_F_XDP_HAS_FRAGS |
  2903					 BPF_F_XDP_DEV_BOUND_ONLY |
  2904					 BPF_F_TEST_REG_INVARIANTS |
  2905					 BPF_F_TOKEN_FD))
  2906			return -EINVAL;
  2907	
  2908		bpf_prog_load_fixup_attach_type(attr);
  2909	
  2910		if (attr->prog_flags & BPF_F_TOKEN_FD) {
  2911			token = bpf_token_get_from_fd(attr->prog_token_fd);
  2912			if (IS_ERR(token))
  2913				return PTR_ERR(token);
  2914			/* if current token doesn't grant prog loading permissions,
  2915			 * then we can't use this token, so ignore it and rely on
  2916			 * system-wide capabilities checks
  2917			 */
  2918			if (!bpf_token_allow_cmd(token, BPF_PROG_LOAD) ||
  2919			    !bpf_token_allow_prog_type(token, attr->prog_type,
  2920						       attr->expected_attach_type)) {
  2921				bpf_token_put(token);
  2922				token = NULL;
  2923			}
  2924		}
  2925	
  2926		bpf_cap = bpf_token_capable(token, CAP_BPF);
  2927		err = -EPERM;
  2928	
  2929		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
  2930		    (attr->prog_flags & BPF_F_ANY_ALIGNMENT) &&
  2931		    !bpf_cap)
  2932			goto put_token;
  2933	
  2934		/* Intent here is for unprivileged_bpf_disabled to block BPF program
  2935		 * creation for unprivileged users; other actions depend
  2936		 * on fd availability and access to bpffs, so are dependent on
  2937		 * object creation success. Even with unprivileged BPF disabled,
  2938		 * capability checks are still carried out for these
  2939		 * and other operations.
  2940		 */
  2941		if (sysctl_unprivileged_bpf_disabled && !bpf_cap)
  2942			goto put_token;
  2943	
  2944		if (attr->insn_cnt == 0 ||
  2945		    attr->insn_cnt > (bpf_cap ? BPF_COMPLEXITY_LIMIT_INSNS : BPF_MAXINSNS)) {
  2946			err = -E2BIG;
  2947			goto put_token;
  2948		}
  2949		if (type != BPF_PROG_TYPE_SOCKET_FILTER &&
  2950		    type != BPF_PROG_TYPE_CGROUP_SKB &&
  2951		    !bpf_cap)
  2952			goto put_token;
  2953	
  2954		if (is_net_admin_prog_type(type) && !bpf_token_capable(token, CAP_NET_ADMIN))
  2955			goto put_token;
  2956		if (is_perfmon_prog_type(type) && !bpf_token_capable(token, CAP_PERFMON))
  2957			goto put_token;
  2958	
> 2959		multi_func = is_tracing_multi(attr->expected_attach_type);
  2960	
  2961		/* attach_prog_fd/attach_btf_obj_fd can specify fd of either bpf_prog
  2962		 * or btf, we need to check which one it is
  2963		 */
  2964		if (attr->attach_prog_fd) {
  2965			dst_prog = bpf_prog_get(attr->attach_prog_fd);
  2966			if (IS_ERR(dst_prog)) {
  2967				dst_prog = NULL;
  2968				attach_btf = btf_get_by_fd(attr->attach_btf_obj_fd);
  2969				if (IS_ERR(attach_btf)) {
  2970					err = -EINVAL;
  2971					goto put_token;
  2972				}
  2973				if (!btf_is_kernel(attach_btf)) {
  2974					/* attaching through specifying bpf_prog's BTF
  2975					 * objects directly might be supported eventually
  2976					 */
  2977					btf_put(attach_btf);
  2978					err = -ENOTSUPP;
  2979					goto put_token;
  2980				}
  2981			}
  2982		} else if (attr->attach_btf_id || multi_func) {
  2983			/* fall back to vmlinux BTF, if BTF type ID is specified */
  2984			attach_btf = bpf_get_btf_vmlinux();
  2985			if (IS_ERR(attach_btf)) {
  2986				err = PTR_ERR(attach_btf);
  2987				goto put_token;
  2988			}
  2989			if (!attach_btf) {
  2990				err = -EINVAL;
  2991				goto put_token;
  2992			}
  2993			btf_get(attach_btf);
  2994		}
  2995	
  2996		if (bpf_prog_load_check_attach(type, attr->expected_attach_type,
  2997					       attach_btf, attr->attach_btf_id,
  2998					       dst_prog, multi_func)) {
  2999			if (dst_prog)
  3000				bpf_prog_put(dst_prog);
  3001			if (attach_btf)
  3002				btf_put(attach_btf);
  3003			err = -EINVAL;
  3004			goto put_token;
  3005		}
  3006	
  3007		/* plain bpf_prog allocation */
  3008		prog = bpf_prog_alloc(bpf_prog_size(attr->insn_cnt), GFP_USER);
  3009		if (!prog) {
  3010			if (dst_prog)
  3011				bpf_prog_put(dst_prog);
  3012			if (attach_btf)
  3013				btf_put(attach_btf);
  3014			err = -EINVAL;
  3015			goto put_token;
  3016		}
  3017	
  3018		prog->expected_attach_type = attr->expected_attach_type;
  3019		prog->sleepable = !!(attr->prog_flags & BPF_F_SLEEPABLE);
  3020		prog->aux->attach_btf = attach_btf;
  3021		prog->aux->attach_btf_id = multi_func ? bpf_multi_func_btf_id[0] : attr->attach_btf_id;
  3022		prog->aux->dst_prog = dst_prog;
  3023		prog->aux->dev_bound = !!attr->prog_ifindex;
  3024		prog->aux->xdp_has_frags = attr->prog_flags & BPF_F_XDP_HAS_FRAGS;
  3025	
  3026		/* move token into prog->aux, reuse taken refcnt */
  3027		prog->aux->token = token;
  3028		token = NULL;
  3029	
  3030		prog->aux->user = get_current_user();
  3031		prog->len = attr->insn_cnt;
  3032	
  3033		err = -EFAULT;
  3034		if (copy_from_bpfptr(prog->insns,
  3035				     make_bpfptr(attr->insns, uattr.is_kernel),
  3036				     bpf_prog_insn_size(prog)) != 0)
  3037			goto free_prog;
  3038		/* copy eBPF program license from user space */
  3039		if (strncpy_from_bpfptr(license,
  3040					make_bpfptr(attr->license, uattr.is_kernel),
  3041					sizeof(license) - 1) < 0)
  3042			goto free_prog;
  3043		license[sizeof(license) - 1] = 0;
  3044	
  3045		/* eBPF programs must be GPL compatible to use GPL-ed functions */
  3046		prog->gpl_compatible = license_is_gpl_compatible(license) ? 1 : 0;
  3047	
  3048		if (attr->signature) {
  3049			err = bpf_prog_verify_signature(prog, attr, uattr.is_kernel);
  3050			if (err)
  3051				goto free_prog;
  3052		}
  3053	
  3054		prog->orig_prog = NULL;
  3055		prog->jited = 0;
  3056	
  3057		atomic64_set(&prog->aux->refcnt, 1);
  3058	
  3059		if (bpf_prog_is_dev_bound(prog->aux)) {
  3060			err = bpf_prog_dev_bound_init(prog, attr);
  3061			if (err)
  3062				goto free_prog;
  3063		}
  3064	
  3065		if (type == BPF_PROG_TYPE_EXT && dst_prog &&
  3066		    bpf_prog_is_dev_bound(dst_prog->aux)) {
  3067			err = bpf_prog_dev_bound_inherit(prog, dst_prog);
  3068			if (err)
  3069				goto free_prog;
  3070		}
  3071	
  3072		/*
  3073		 * Bookkeeping for managing the program attachment chain.
  3074		 *
  3075		 * It might be tempting to set attach_tracing_prog flag at the attachment
  3076		 * time, but this will not prevent from loading bunch of tracing prog
  3077		 * first, then attach them one to another.
  3078		 *
  3079		 * The flag attach_tracing_prog is set for the whole program lifecycle, and
  3080		 * doesn't have to be cleared in bpf_tracing_link_release, since tracing
  3081		 * programs cannot change attachment target.
  3082		 */
  3083		if (type == BPF_PROG_TYPE_TRACING && dst_prog &&
  3084		    dst_prog->type == BPF_PROG_TYPE_TRACING) {
  3085			prog->aux->attach_tracing_prog = true;
  3086		}
  3087	
  3088		/* find program type: socket_filter vs tracing_filter */
  3089		err = find_prog_type(type, prog);
  3090		if (err < 0)
  3091			goto free_prog;
  3092	
  3093		prog->aux->load_time = ktime_get_boottime_ns();
  3094		err = bpf_obj_name_cpy(prog->aux->name, attr->prog_name,
  3095				       sizeof(attr->prog_name));
  3096		if (err < 0)
  3097			goto free_prog;
  3098	
  3099		err = security_bpf_prog_load(prog, attr, token, uattr.is_kernel);
  3100		if (err)
  3101			goto free_prog_sec;
  3102	
  3103		/* run eBPF verifier */
  3104		err = bpf_check(&prog, attr, uattr, uattr_size);
  3105		if (err < 0)
  3106			goto free_used_maps;
  3107	
  3108		prog = bpf_prog_select_runtime(prog, &err);
  3109		if (err < 0)
  3110			goto free_used_maps;
  3111	
  3112		err = bpf_prog_mark_insn_arrays_ready(prog);
  3113		if (err < 0)
  3114			goto free_used_maps;
  3115	
  3116		err = bpf_prog_alloc_id(prog);
  3117		if (err)
  3118			goto free_used_maps;
  3119	
  3120		/* Upon success of bpf_prog_alloc_id(), the BPF prog is
  3121		 * effectively publicly exposed. However, retrieving via
  3122		 * bpf_prog_get_fd_by_id() will take another reference,
  3123		 * therefore it cannot be gone underneath us.
  3124		 *
  3125		 * Only for the time /after/ successful bpf_prog_new_fd()
  3126		 * and before returning to userspace, we might just hold
  3127		 * one reference and any parallel close on that fd could
  3128		 * rip everything out. Hence, below notifications must
  3129		 * happen before bpf_prog_new_fd().
  3130		 *
  3131		 * Also, any failure handling from this point onwards must
  3132		 * be using bpf_prog_put() given the program is exposed.
  3133		 */
  3134		bpf_prog_kallsyms_add(prog);
  3135		perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
  3136		bpf_audit_prog(prog, BPF_AUDIT_LOAD);
  3137	
  3138		err = bpf_prog_new_fd(prog);
  3139		if (err < 0)
  3140			bpf_prog_put(prog);
  3141		return err;
  3142	
  3143	free_used_maps:
  3144		/* In case we have subprogs, we need to wait for a grace
  3145		 * period before we can tear down JIT memory since symbols
  3146		 * are already exposed under kallsyms.
  3147		 */
  3148		__bpf_prog_put_noref(prog, prog->aux->real_func_cnt);
  3149		return err;
  3150	
  3151	free_prog_sec:
  3152		security_bpf_prog_free(prog);
  3153	free_prog:
  3154		free_uid(prog->aux->user);
  3155		if (prog->aux->attach_btf)
  3156			btf_put(prog->aux->attach_btf);
  3157		bpf_prog_free(prog);
  3158	put_token:
  3159		bpf_token_put(token);
  3160		return err;
  3161	}
  3162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
