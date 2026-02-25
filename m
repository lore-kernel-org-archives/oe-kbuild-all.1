Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560C13A1A33
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772047423; cv=none; b=YEWjFSbX2cGZED5i2LkPf4Pk3JR9MZiZ6sIU8SpeMFGMul0B+ytpcqOnXtDS0Fn2EPPzkexFYmRT680/xd+QTTiKYXPx1zRSuDtzO8u5Tmdzavt0HxLzx+MaiS9Txcac9Hpx7Hnhhr6Fn5lHn0UKOAwTXsW2WsLEEQ0B6I3PX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772047423; c=relaxed/simple;
	bh=Mc7qBuivBCkI4Dp52+017N+mtrz/DxFbx05Jfov0ciY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qIsaifO50RYSa9NtI/vujVdyyRZ7tvZscTeO8sdIpcp8WtevijTrS+m/1RsvEF4T2kjqJAeHpaWuegUPEIAm3GvacwfhWB6cqAIIJLrJTnxlLPr2P0S3SJBeevaUuKmY0lmpiWCuHP64p4pGix/00EXLRLSMkhVO6MiUgEabPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrNFqNDr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrNFqNDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772047421; x=1803583421;
  h=date:from:to:cc:subject:message-id;
  bh=Mc7qBuivBCkI4Dp52+017N+mtrz/DxFbx05Jfov0ciY=;
  b=TrNFqNDrbuiZuLwbcIkoPBjZXyxQ512sadosAsTRuQ8U4k8Kr8/lMbtL
   lDEjXEqvM7DaMetTlHhFQAIBOrO6odcqvwAKihI6OYAkARPyKcJbfzhYk
   iY/np34Pyqj9ws4lmYRr9ZUlvFzmoJQtr3AF8U+Jc/uPAF7l2IKfAw9Rf
   ICg9Vwg503IvqWVe137CR2uEuqzQVeyHmNwb/fR9MYF5e1fPpDfArcGyt
   JIzwdjmv6MdmqAQbpawUOR9ewj9+SxNUkb5mfAbrs2/Ewa41fsM9viJgz
   hzTU4RD4DOrWXO3uHV2KMAOwnnQAyXDXqQFWMAOz0M2SA2sx31+9Zr5UL
   g==;
X-CSE-ConnectionGUID: Eq5Q4F7FSuOETK3s6rYFqw==
X-CSE-MsgGUID: FYgGK4OPQQSSQZZfT2T6mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72801622"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="72801622"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 11:23:40 -0800
X-CSE-ConnectionGUID: +M9yoWpoTCWKr18Nmu/5ag==
X-CSE-MsgGUID: u2E/H83rTrCW7rAL4V24TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="216468584"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Feb 2026 11:23:39 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvKTw-0000000078b-3OvR;
	Wed, 25 Feb 2026 19:23:36 +0000
Date: Thu, 26 Feb 2026 03:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 8/23]
 kernel/bpf/syscall.c:2967:22: error: implicit declaration of function
 'is_tracing_multi'
Message-ID: <202602260337.ohqebPsZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   2e9ff5967a4f3cb4d96c1fd04944036d9961099d
commit: dbc1a93485c8b7908944dcfaaee011b175341b02 [8/23] bpf: Add multi tracing attach types
config: csky-randconfig-r072-20260226 (https://download.01.org/0day-ci/archive/20260226/202602260337.ohqebPsZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260337.ohqebPsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260337.ohqebPsZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1549:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   kernel/bpf/syscall.c: In function 'bpf_prog_load':
>> kernel/bpf/syscall.c:2967:22: error: implicit declaration of function 'is_tracing_multi' [-Wimplicit-function-declaration]
    2967 |         multi_func = is_tracing_multi(attr->expected_attach_type);
         |                      ^~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:7,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11:
   kernel/bpf/syscall.c: In function 'bpf_tracing_link_release':
   kernel/bpf/syscall.c:3537:49: error: passing argument 1 of 'bpf_trampoline_unlink_prog' from incompatible pointer type [-Wincompatible-pointer-types]
    3537 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
         |                                                 |
         |                                                 struct bpf_tramp_node *
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/bpf/syscall.c:3537:9: note: in expansion of macro 'WARN_ON_ONCE'
    3537 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |         ^~~~~~~~~~~~
   include/linux/bpf.h:1549:69: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/bpf/syscall.c: In function 'bpf_tracing_prog_attach':
   kernel/bpf/syscall.c:3760:40: error: passing argument 1 of 'bpf_trampoline_link_prog' from incompatible pointer type [-Wincompatible-pointer-types]
    3760 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
         |                                        |
         |                                        struct bpf_tramp_node *
   include/linux/bpf.h:1543:67: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~^~~~
--
   In file included from include/linux/bpf-cgroup.h:5,
                    from kernel/bpf/verifier.c:7:
   include/linux/bpf.h:1543:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1543 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1549:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1549 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'bpf_check_attach_target':
>> kernel/bpf/verifier.c:25097:37: error: implicit declaration of function 'is_tracing_multi' [-Wimplicit-function-declaration]
   25097 |                                 if (is_tracing_multi(prog->expected_attach_type) &&
         |                                     ^~~~~~~~~~~~~~~~


vim +/is_tracing_multi +2967 kernel/bpf/syscall.c

  2890	
  2891	static int bpf_prog_load(union bpf_attr *attr, bpfptr_t uattr, u32 uattr_size)
  2892	{
  2893		enum bpf_prog_type type = attr->prog_type;
  2894		struct bpf_prog *prog, *dst_prog = NULL;
  2895		struct btf *attach_btf = NULL;
  2896		struct bpf_token *token = NULL;
  2897		bool bpf_cap;
  2898		int err;
  2899		char license[128];
  2900		bool multi_func;
  2901	
  2902		if (CHECK_ATTR(BPF_PROG_LOAD))
  2903			return -EINVAL;
  2904	
  2905		if (attr->prog_flags & ~(BPF_F_STRICT_ALIGNMENT |
  2906					 BPF_F_ANY_ALIGNMENT |
  2907					 BPF_F_TEST_STATE_FREQ |
  2908					 BPF_F_SLEEPABLE |
  2909					 BPF_F_TEST_RND_HI32 |
  2910					 BPF_F_XDP_HAS_FRAGS |
  2911					 BPF_F_XDP_DEV_BOUND_ONLY |
  2912					 BPF_F_TEST_REG_INVARIANTS |
  2913					 BPF_F_TOKEN_FD))
  2914			return -EINVAL;
  2915	
  2916		bpf_prog_load_fixup_attach_type(attr);
  2917	
  2918		if (attr->prog_flags & BPF_F_TOKEN_FD) {
  2919			token = bpf_token_get_from_fd(attr->prog_token_fd);
  2920			if (IS_ERR(token))
  2921				return PTR_ERR(token);
  2922			/* if current token doesn't grant prog loading permissions,
  2923			 * then we can't use this token, so ignore it and rely on
  2924			 * system-wide capabilities checks
  2925			 */
  2926			if (!bpf_token_allow_cmd(token, BPF_PROG_LOAD) ||
  2927			    !bpf_token_allow_prog_type(token, attr->prog_type,
  2928						       attr->expected_attach_type)) {
  2929				bpf_token_put(token);
  2930				token = NULL;
  2931			}
  2932		}
  2933	
  2934		bpf_cap = bpf_token_capable(token, CAP_BPF);
  2935		err = -EPERM;
  2936	
  2937		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
  2938		    (attr->prog_flags & BPF_F_ANY_ALIGNMENT) &&
  2939		    !bpf_cap)
  2940			goto put_token;
  2941	
  2942		/* Intent here is for unprivileged_bpf_disabled to block BPF program
  2943		 * creation for unprivileged users; other actions depend
  2944		 * on fd availability and access to bpffs, so are dependent on
  2945		 * object creation success. Even with unprivileged BPF disabled,
  2946		 * capability checks are still carried out for these
  2947		 * and other operations.
  2948		 */
  2949		if (sysctl_unprivileged_bpf_disabled && !bpf_cap)
  2950			goto put_token;
  2951	
  2952		if (attr->insn_cnt == 0 ||
  2953		    attr->insn_cnt > (bpf_cap ? BPF_COMPLEXITY_LIMIT_INSNS : BPF_MAXINSNS)) {
  2954			err = -E2BIG;
  2955			goto put_token;
  2956		}
  2957		if (type != BPF_PROG_TYPE_SOCKET_FILTER &&
  2958		    type != BPF_PROG_TYPE_CGROUP_SKB &&
  2959		    !bpf_cap)
  2960			goto put_token;
  2961	
  2962		if (is_net_admin_prog_type(type) && !bpf_token_capable(token, CAP_NET_ADMIN))
  2963			goto put_token;
  2964		if (is_perfmon_prog_type(type) && !bpf_token_capable(token, CAP_PERFMON))
  2965			goto put_token;
  2966	
> 2967		multi_func = is_tracing_multi(attr->expected_attach_type);
  2968	
  2969		/* attach_prog_fd/attach_btf_obj_fd can specify fd of either bpf_prog
  2970		 * or btf, we need to check which one it is
  2971		 */
  2972		if (attr->attach_prog_fd) {
  2973			dst_prog = bpf_prog_get(attr->attach_prog_fd);
  2974			if (IS_ERR(dst_prog)) {
  2975				dst_prog = NULL;
  2976				attach_btf = btf_get_by_fd(attr->attach_btf_obj_fd);
  2977				if (IS_ERR(attach_btf)) {
  2978					err = -EINVAL;
  2979					goto put_token;
  2980				}
  2981				if (!btf_is_kernel(attach_btf)) {
  2982					/* attaching through specifying bpf_prog's BTF
  2983					 * objects directly might be supported eventually
  2984					 */
  2985					btf_put(attach_btf);
  2986					err = -ENOTSUPP;
  2987					goto put_token;
  2988				}
  2989			}
  2990		} else if (attr->attach_btf_id || multi_func) {
  2991			/* fall back to vmlinux BTF, if BTF type ID is specified */
  2992			attach_btf = bpf_get_btf_vmlinux();
  2993			if (IS_ERR(attach_btf)) {
  2994				err = PTR_ERR(attach_btf);
  2995				goto put_token;
  2996			}
  2997			if (!attach_btf) {
  2998				err = -EINVAL;
  2999				goto put_token;
  3000			}
  3001			btf_get(attach_btf);
  3002		}
  3003	
  3004		if (bpf_prog_load_check_attach(type, attr->expected_attach_type,
  3005					       attach_btf, attr->attach_btf_id,
  3006					       dst_prog, multi_func)) {
  3007			if (dst_prog)
  3008				bpf_prog_put(dst_prog);
  3009			if (attach_btf)
  3010				btf_put(attach_btf);
  3011			err = -EINVAL;
  3012			goto put_token;
  3013		}
  3014	
  3015		/* plain bpf_prog allocation */
  3016		prog = bpf_prog_alloc(bpf_prog_size(attr->insn_cnt), GFP_USER);
  3017		if (!prog) {
  3018			if (dst_prog)
  3019				bpf_prog_put(dst_prog);
  3020			if (attach_btf)
  3021				btf_put(attach_btf);
  3022			err = -EINVAL;
  3023			goto put_token;
  3024		}
  3025	
  3026		prog->expected_attach_type = attr->expected_attach_type;
  3027		prog->sleepable = !!(attr->prog_flags & BPF_F_SLEEPABLE);
  3028		prog->aux->attach_btf = attach_btf;
  3029		prog->aux->attach_btf_id = multi_func ? bpf_multi_func_btf_id[0] : attr->attach_btf_id;
  3030		prog->aux->dst_prog = dst_prog;
  3031		prog->aux->dev_bound = !!attr->prog_ifindex;
  3032		prog->aux->xdp_has_frags = attr->prog_flags & BPF_F_XDP_HAS_FRAGS;
  3033	
  3034		/* move token into prog->aux, reuse taken refcnt */
  3035		prog->aux->token = token;
  3036		token = NULL;
  3037	
  3038		prog->aux->user = get_current_user();
  3039		prog->len = attr->insn_cnt;
  3040	
  3041		err = -EFAULT;
  3042		if (copy_from_bpfptr(prog->insns,
  3043				     make_bpfptr(attr->insns, uattr.is_kernel),
  3044				     bpf_prog_insn_size(prog)) != 0)
  3045			goto free_prog;
  3046		/* copy eBPF program license from user space */
  3047		if (strncpy_from_bpfptr(license,
  3048					make_bpfptr(attr->license, uattr.is_kernel),
  3049					sizeof(license) - 1) < 0)
  3050			goto free_prog;
  3051		license[sizeof(license) - 1] = 0;
  3052	
  3053		/* eBPF programs must be GPL compatible to use GPL-ed functions */
  3054		prog->gpl_compatible = license_is_gpl_compatible(license) ? 1 : 0;
  3055	
  3056		if (attr->signature) {
  3057			err = bpf_prog_verify_signature(prog, attr, uattr.is_kernel);
  3058			if (err)
  3059				goto free_prog;
  3060		}
  3061	
  3062		prog->orig_prog = NULL;
  3063		prog->jited = 0;
  3064	
  3065		atomic64_set(&prog->aux->refcnt, 1);
  3066	
  3067		if (bpf_prog_is_dev_bound(prog->aux)) {
  3068			err = bpf_prog_dev_bound_init(prog, attr);
  3069			if (err)
  3070				goto free_prog;
  3071		}
  3072	
  3073		if (type == BPF_PROG_TYPE_EXT && dst_prog &&
  3074		    bpf_prog_is_dev_bound(dst_prog->aux)) {
  3075			err = bpf_prog_dev_bound_inherit(prog, dst_prog);
  3076			if (err)
  3077				goto free_prog;
  3078		}
  3079	
  3080		/*
  3081		 * Bookkeeping for managing the program attachment chain.
  3082		 *
  3083		 * It might be tempting to set attach_tracing_prog flag at the attachment
  3084		 * time, but this will not prevent from loading bunch of tracing prog
  3085		 * first, then attach them one to another.
  3086		 *
  3087		 * The flag attach_tracing_prog is set for the whole program lifecycle, and
  3088		 * doesn't have to be cleared in bpf_tracing_link_release, since tracing
  3089		 * programs cannot change attachment target.
  3090		 */
  3091		if (type == BPF_PROG_TYPE_TRACING && dst_prog &&
  3092		    dst_prog->type == BPF_PROG_TYPE_TRACING) {
  3093			prog->aux->attach_tracing_prog = true;
  3094		}
  3095	
  3096		/* find program type: socket_filter vs tracing_filter */
  3097		err = find_prog_type(type, prog);
  3098		if (err < 0)
  3099			goto free_prog;
  3100	
  3101		prog->aux->load_time = ktime_get_boottime_ns();
  3102		err = bpf_obj_name_cpy(prog->aux->name, attr->prog_name,
  3103				       sizeof(attr->prog_name));
  3104		if (err < 0)
  3105			goto free_prog;
  3106	
  3107		err = security_bpf_prog_load(prog, attr, token, uattr.is_kernel);
  3108		if (err)
  3109			goto free_prog_sec;
  3110	
  3111		/* run eBPF verifier */
  3112		err = bpf_check(&prog, attr, uattr, uattr_size);
  3113		if (err < 0)
  3114			goto free_used_maps;
  3115	
  3116		prog = bpf_prog_select_runtime(prog, &err);
  3117		if (err < 0)
  3118			goto free_used_maps;
  3119	
  3120		err = bpf_prog_mark_insn_arrays_ready(prog);
  3121		if (err < 0)
  3122			goto free_used_maps;
  3123	
  3124		err = bpf_prog_alloc_id(prog);
  3125		if (err)
  3126			goto free_used_maps;
  3127	
  3128		/* Upon success of bpf_prog_alloc_id(), the BPF prog is
  3129		 * effectively publicly exposed. However, retrieving via
  3130		 * bpf_prog_get_fd_by_id() will take another reference,
  3131		 * therefore it cannot be gone underneath us.
  3132		 *
  3133		 * Only for the time /after/ successful bpf_prog_new_fd()
  3134		 * and before returning to userspace, we might just hold
  3135		 * one reference and any parallel close on that fd could
  3136		 * rip everything out. Hence, below notifications must
  3137		 * happen before bpf_prog_new_fd().
  3138		 *
  3139		 * Also, any failure handling from this point onwards must
  3140		 * be using bpf_prog_put() given the program is exposed.
  3141		 */
  3142		bpf_prog_kallsyms_add(prog);
  3143		perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
  3144		bpf_audit_prog(prog, BPF_AUDIT_LOAD);
  3145	
  3146		err = bpf_prog_new_fd(prog);
  3147		if (err < 0)
  3148			bpf_prog_put(prog);
  3149		return err;
  3150	
  3151	free_used_maps:
  3152		/* In case we have subprogs, we need to wait for a grace
  3153		 * period before we can tear down JIT memory since symbols
  3154		 * are already exposed under kallsyms.
  3155		 */
  3156		__bpf_prog_put_noref(prog, prog->aux->real_func_cnt);
  3157		return err;
  3158	
  3159	free_prog_sec:
  3160		security_bpf_prog_free(prog);
  3161	free_prog:
  3162		free_uid(prog->aux->user);
  3163		if (prog->aux->attach_btf)
  3164			btf_put(prog->aux->attach_btf);
  3165		bpf_prog_free(prog);
  3166	put_token:
  3167		bpf_token_put(token);
  3168		return err;
  3169	}
  3170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
