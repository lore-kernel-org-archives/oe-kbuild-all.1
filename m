Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD538551D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737688; cv=none; b=mMa1vuRqRfFPjChIaRtmOuBesrMbo+5+ZfcV6XA7Iuef4Lez/1NMaqD2ddDfH0Nj8BOkLb/rW0EqJWQ6QSvvicRpHWxupmnxOdKXuGytwq1LnwOsoCbwT5uBgM+V7o4+14I9TPRbukYcuMUzj0kjnn8CksU/TSRD4mDaM0kvqsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737688; c=relaxed/simple;
	bh=Ds2OqjuzJzTMdBSLukmWMDIzWN7dG5RQTg8P8PtArts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KCHQcNpGFNRiT/jUBPjbwfYPbYKoBYgBjPsfix2cmJKfo0xFGnt4nqFLxD+pfuoVlPecXWcCus18+zxG/jiGdryZpJVjFKq7B/CDjMB7NsGZ8jHXxYsOuoHOBTfABnRxCcPKUmL/x7cn2h8U8IUjx+nPIXpV5AI0wne3R+EBttg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjHWHYQ3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjHWHYQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770737687; x=1802273687;
  h=date:from:to:cc:subject:message-id;
  bh=Ds2OqjuzJzTMdBSLukmWMDIzWN7dG5RQTg8P8PtArts=;
  b=WjHWHYQ3lBcUCKE/o7lW+yzjwpdNsik4tm1+tZDu+bEJrE2Lnt1Mjj0+
   80ih+cWM34sEvJ07BvzIucjpk1BiKJ3elzlSkw6pOnBRAUU58qGvee7E2
   DbRw7Jj/4YdI9iZe6yjKfKig4YZmHcfAeiP1tHbOCKGa4pUCIVEzGbKst
   3tnrexF/rLkK3vThkiyakHP8Ag9ocZ35ZLbj7E0HFEpb1zwixefOZEgs9
   2fvq7I1U12a3PdhnCozFSUrSafdbuT9TJFbTh1gvNSyv25SMWqw27gC29
   X8cWK5ofmrnePYAcSgfd2c7WXuAxSeBVcena6DcGCptxCgdYw3V9SmCoK
   g==;
X-CSE-ConnectionGUID: TcsljL2JTuKGux6i8kxvAA==
X-CSE-MsgGUID: me9tdLtWQ6KuTaV7aijb5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70882746"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70882746"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 07:34:46 -0800
X-CSE-ConnectionGUID: mSaj/s0OT3iSMxurY7ww2g==
X-CSE-MsgGUID: TPoglMCSQ5iTd7CgGiM9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211052492"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Feb 2026 07:34:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpplC-00000000p8S-1OHe;
	Tue, 10 Feb 2026 15:34:42 +0000
Date: Tue, 10 Feb 2026 23:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 5/12]
 kernel/bpf/verifier.c:25313:20: error: implicit declaration of function
 'is_tracing_multi'
Message-ID: <202602102315.rM40Nf7t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   95bf1a3ff57efabf9b7c50b8a0d3583a6714f5d8
commit: 78ade758b40de069008f7e78273f116e712d3c19 [5/12] bpf: Add multi tracing attach types
config: sh-randconfig-001-20260210 (https://download.01.org/0day-ci/archive/20260210/202602102315.rM40Nf7t-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102315.rM40Nf7t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102315.rM40Nf7t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpf-cgroup.h:5,
                    from kernel/bpf/verifier.c:7:
   include/linux/bpf.h:1545:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1545 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1551:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1551 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   In file included from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8:
   kernel/bpf/verifier.c: In function 'check_attach_btf_id':
>> kernel/bpf/verifier.c:25313:20: error: implicit declaration of function 'is_tracing_multi' [-Wimplicit-function-declaration]
   25313 |         } else if (is_tracing_multi(prog->expected_attach_type))
         |                    ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/bpf/verifier.c:25313:16: note: in expansion of macro 'if'
   25313 |         } else if (is_tracing_multi(prog->expected_attach_type))
         |                ^~
--
   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1545:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1545 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1551:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1551 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   kernel/bpf/syscall.c: In function 'bpf_prog_load':
>> kernel/bpf/syscall.c:2966:22: error: implicit declaration of function 'is_tracing_multi' [-Wimplicit-function-declaration]
    2966 |         multi_func = is_tracing_multi(attr->expected_attach_type);
         |                      ^~~~~~~~~~~~~~~~
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11:
   kernel/bpf/syscall.c: In function 'bpf_tracing_link_release':
   kernel/bpf/syscall.c:3536:49: error: passing argument 1 of 'bpf_trampoline_unlink_prog' from incompatible pointer type [-Wincompatible-pointer-types]
    3536 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
         |                                                 |
         |                                                 struct bpf_tramp_node *
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1551:69: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    1551 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/bpf/syscall.c: In function 'bpf_tracing_prog_attach':
   kernel/bpf/syscall.c:3770:40: error: passing argument 1 of 'bpf_trampoline_link_prog' from incompatible pointer type [-Wincompatible-pointer-types]
    3770 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
         |                                        |
         |                                        struct bpf_tramp_node *
   include/linux/bpf.h:1545:67: note: expected 'struct bpf_tramp_link *' but argument is of type 'struct bpf_tramp_node *'
    1545 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/is_tracing_multi +25313 kernel/bpf/verifier.c

 25253	
 25254	static int check_attach_btf_id(struct bpf_verifier_env *env)
 25255	{
 25256		struct bpf_prog *prog = env->prog;
 25257		struct bpf_prog *tgt_prog = prog->aux->dst_prog;
 25258		struct bpf_attach_target_info tgt_info = {};
 25259		u32 btf_id = prog->aux->attach_btf_id;
 25260		struct bpf_trampoline *tr;
 25261		int ret;
 25262		u64 key;
 25263	
 25264		if (prog->type == BPF_PROG_TYPE_SYSCALL) {
 25265			if (prog->sleepable)
 25266				/* attach_btf_id checked to be zero already */
 25267				return 0;
 25268			verbose(env, "Syscall programs can only be sleepable\n");
 25269			return -EINVAL;
 25270		}
 25271	
 25272		if (prog->sleepable && !can_be_sleepable(prog)) {
 25273			verbose(env, "Only fentry/fexit/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable\n");
 25274			return -EINVAL;
 25275		}
 25276	
 25277		if (prog->type == BPF_PROG_TYPE_STRUCT_OPS)
 25278			return check_struct_ops_btf_id(env);
 25279	
 25280		if (prog->type != BPF_PROG_TYPE_TRACING &&
 25281		    prog->type != BPF_PROG_TYPE_LSM &&
 25282		    prog->type != BPF_PROG_TYPE_EXT)
 25283			return 0;
 25284	
 25285		ret = bpf_check_attach_target(&env->log, prog, tgt_prog, btf_id, &tgt_info);
 25286		if (ret)
 25287			return ret;
 25288	
 25289		if (tgt_prog && prog->type == BPF_PROG_TYPE_EXT) {
 25290			/* to make freplace equivalent to their targets, they need to
 25291			 * inherit env->ops and expected_attach_type for the rest of the
 25292			 * verification
 25293			 */
 25294			env->ops = bpf_verifier_ops[tgt_prog->type];
 25295			prog->expected_attach_type = tgt_prog->expected_attach_type;
 25296		}
 25297	
 25298		/* store info about the attachment target that will be used later */
 25299		prog->aux->attach_func_proto = tgt_info.tgt_type;
 25300		prog->aux->attach_func_name = tgt_info.tgt_name;
 25301		prog->aux->mod = tgt_info.tgt_mod;
 25302	
 25303		if (tgt_prog) {
 25304			prog->aux->saved_dst_prog_type = tgt_prog->type;
 25305			prog->aux->saved_dst_attach_type = tgt_prog->expected_attach_type;
 25306		}
 25307	
 25308		if (prog->expected_attach_type == BPF_TRACE_RAW_TP) {
 25309			prog->aux->attach_btf_trace = true;
 25310			return 0;
 25311		} else if (prog->expected_attach_type == BPF_TRACE_ITER) {
 25312			return bpf_iter_prog_supported(prog);
 25313		} else if (is_tracing_multi(prog->expected_attach_type))
 25314			return prog->type == BPF_PROG_TYPE_TRACING ? 0 : -EINVAL;
 25315	
 25316		if (prog->type == BPF_PROG_TYPE_LSM) {
 25317			ret = bpf_lsm_verify_prog(&env->log, prog);
 25318			if (ret < 0)
 25319				return ret;
 25320		} else if (prog->type == BPF_PROG_TYPE_TRACING &&
 25321			   btf_id_set_contains(&btf_id_deny, btf_id)) {
 25322			verbose(env, "Attaching tracing programs to function '%s' is rejected.\n",
 25323				tgt_info.tgt_name);
 25324			return -EINVAL;
 25325		} else if ((prog->expected_attach_type == BPF_TRACE_FEXIT ||
 25326			   prog->expected_attach_type == BPF_TRACE_FSESSION ||
 25327			   prog->expected_attach_type == BPF_MODIFY_RETURN) &&
 25328			   btf_id_set_contains(&noreturn_deny, btf_id)) {
 25329			verbose(env, "Attaching fexit/fsession/fmod_ret to __noreturn function '%s' is rejected.\n",
 25330				tgt_info.tgt_name);
 25331			return -EINVAL;
 25332		}
 25333	
 25334		key = bpf_trampoline_compute_key(tgt_prog, prog->aux->attach_btf, btf_id);
 25335		tr = bpf_trampoline_get(key, &tgt_info);
 25336		if (!tr)
 25337			return -ENOMEM;
 25338	
 25339		if (tgt_prog && tgt_prog->aux->tail_call_reachable)
 25340			tr->flags = BPF_TRAMP_F_TAIL_CALL_CTX;
 25341	
 25342		prog->aux->dst_trampoline = tr;
 25343		return 0;
 25344	}
 25345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
