Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3F3033F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774720189; cv=none; b=fqYBahlXoSZuB8VW+OdHPrOluq8au6tbX9mO536ix1sAESoKTfl8hfePEy4UxXV1zocoLcPYHPxbFmG0EKxt96QnmeDSuvPrzH0pyeATB8mxZPQpFL3EBZr2t/mxUNGSYubzG9k/fKZ+pi/rb/1MG2+MJ4jtaz5HG/gbv25h55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774720189; c=relaxed/simple;
	bh=3H8iN4PMhFHnXwLwBVUmHZ1FOYQbfdQkg5jvRCYS8KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQHV4XbRkIF8Q/n6GeYfXXaHwoCRRMuasbKKKbXIXTtZgpte0GwxDLdY9iBdAqfz+vz/ksk7d+s7IBM5x/gUUCiyu9KZiUrvhrhgR/nephwvO59uR6ZMgqiQmz0AHDnXmy4nB6FNPjtkJuKBkx8Rjax9O/+YbiCNOLMnxDfbQuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B51j761V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B51j761V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774720187; x=1806256187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3H8iN4PMhFHnXwLwBVUmHZ1FOYQbfdQkg5jvRCYS8KY=;
  b=B51j761VtNkpWftQOXUmwhXHtEBL3gz7ImfIp7DGUFiN9Y8hYK6l0EAg
   KggEW+gPIvxRxTmaA5hr+y2c903NWib8nZpbTCKKK2Or7JT6Bqq2ltiao
   Y1GmAhXoYO4COR5Uw3lgyd2YP8YVzFmi3bxLEES3hqd7BcbRPzXMd9Q5v
   75KCMFistMbKqJR33svbFtoegoJdWY9uRv+1VPiFN/FPsxs78PBpcGdyF
   Zn7okD2Nlt38/EB3U2+52TCuRW1aHaiN+YpXoTP+ENnM3RG7bUr8lxCjv
   Rz54Ztz+qfjeO2iIseTKHIvIIqV7M79VAH+OHk3c14jcUqBHov8n22UvT
   A==;
X-CSE-ConnectionGUID: Cex/UjUxR8ib6GhvnF4ClA==
X-CSE-MsgGUID: F+2C49FTQTaGMMGabXPdOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="78365835"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="78365835"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 10:49:46 -0700
X-CSE-ConnectionGUID: 7/iXfkTPRju4Nwy8UJyaNA==
X-CSE-MsgGUID: BrdVDdIyQkKEBhvLPfUFqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="227224415"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 10:49:45 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Xn4-00000000BdZ-44ON;
	Sat, 28 Mar 2026 17:49:42 +0000
Date: Sun, 29 Mar 2026 01:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] btf: split core BTF parsing out of BPF subsystem into
 kernel/btf/
Message-ID: <202603290107.PMM2AhwK-lkp@intel.com>
References: <20260325011853.657295-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325011853.657295-1-sashal@kernel.org>

Hi Sasha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master akpm-mm/mm-nonmm-unstable linus/master v7.0-rc5]
[cannot apply to bpf-next/net next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/btf-split-core-BTF-parsing-out-of-BPF-subsystem-into-kernel-btf/20260327-005818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260325011853.657295-1-sashal%40kernel.org
patch subject: [RFC] btf: split core BTF parsing out of BPF subsystem into kernel/btf/
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260329/202603290107.PMM2AhwK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290107.PMM2AhwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290107.PMM2AhwK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'map_kptr_match_type':
>> kernel/bpf/verifier.c:6070:34: warning: '%s' directive argument is null [-Wformat-overflow=]
    6070 |         verbose(env, "expected=%s%s", reg_type_str(env, PTR_TO_BTF_ID), targ_name);
         |                                  ^~
   kernel/bpf/verifier.c:6072:37: warning: '%s' directive argument is null [-Wformat-overflow=]
    6072 |                 verbose(env, " or %s%s\n", reg_type_str(env, PTR_TO_BTF_ID | PTR_UNTRUSTED),
         |                                     ^~
   kernel/bpf/verifier.c: In function 'check_reg_type':
   kernel/bpf/verifier.c:9610:62: warning: '%s' directive argument is null [-Wformat-overflow=]
    9610 |                                 verbose(env, "R%d is of type %s but %s is expected\n",
         |                                                              ^~
   kernel/bpf/verifier.c: In function 'check_ptr_to_map_access':
   kernel/bpf/verifier.c:7617:46: warning: '%s' directive argument is null [-Wformat-overflow=]
    7617 |                 verbose(env, "only read from %s is supported\n", tname);
         |                                              ^~
   kernel/bpf/verifier.c:7611:38: warning: '%s' directive argument is null [-Wformat-overflow=]
    7611 |                 verbose(env, "R%d is %s invalid negative access: off=%d\n",
         |                                      ^~
   kernel/bpf/verifier.c:7605:34: warning: '%s' directive argument is null [-Wformat-overflow=]
    7605 |                         "'struct %s' access is allowed only to CAP_PERFMON and CAP_SYS_ADMIN\n",
         |                                  ^~
   kernel/bpf/verifier.c: In function 'check_ptr_to_btf_access':
   kernel/bpf/verifier.c:7439:55: warning: '%s' directive argument is null [-Wformat-overflow=]
    7439 |                         "Cannot access kernel 'struct %s' from non-GPL compatible program\n",
         |                                                       ^~
   kernel/bpf/verifier.c:7472:37: warning: '%s' directive argument is null [-Wformat-overflow=]
    7472 |                         "R%d is ptr_%s access percpu memory: off=%d\n",
         |                                     ^~
   kernel/bpf/verifier.c:7465:37: warning: '%s' directive argument is null [-Wformat-overflow=]
    7465 |                         "R%d is ptr_%s access user memory: off=%d\n",
         |                                     ^~
   kernel/bpf/verifier.c:7458:37: warning: '%s' directive argument is null [-Wformat-overflow=]
    7458 |                         "R%d is ptr_%s invalid negative access: off=%d\n",
         |                                     ^~
   kernel/bpf/verifier.c:7449:37: warning: '%s' directive argument is null [-Wformat-overflow=]
    7449 |                         "R%d is ptr_%s invalid variable offset: off=%d, var_off=%s\n",
         |                                     ^~
   kernel/bpf/verifier.c:7433:34: warning: '%s' directive argument is null [-Wformat-overflow=]
    7433 |                         "'struct %s' access is allowed only to CAP_PERFMON and CAP_SYS_ADMIN\n",
         |                                  ^~
   kernel/bpf/verifier.c: In function 'check_helper_call.isra':
   kernel/bpf/verifier.c:12067:83: warning: '%s' directive argument is null [-Wformat-overflow=]
   12067 |                                 verbose(env, "unable to resolve the size of type '%s': %ld\n",
         |                                                                                   ^~
--
   kernel/bpf/log.c: In function 'print_reg_state':
>> kernel/bpf/log.c:702:30: warning: '%s' directive argument is null [-Wformat-overflow=]
     702 |                 verbose(env, "%s", btf_type_name(reg->btf, reg->btf_id));
         |                              ^~~~
   kernel/bpf/log.c:14:64: note: in definition of macro 'verbose'
      14 | #define verbose(env, fmt, args...) bpf_verifier_log_write(env, fmt, ##args)
         |                                                                ^~~
   kernel/bpf/log.c:702:31: note: format string is defined here
     702 |                 verbose(env, "%s", btf_type_name(reg->btf, reg->btf_id));
         |                               ^~
--
   In file included from kernel/bpf/btf_relocate.c:2:
   kernel/bpf/../../tools/lib/bpf/btf_relocate.c: In function 'btf_relocate_rewrite_strs':
   kernel/bpf/../../tools/lib/bpf/btf_relocate.c:20:49: error: implicit declaration of function 'btf_str_by_offset'; did you mean 'btf__str_by_offset'? [-Wimplicit-function-declaration]
      20 | #define btf__str_by_offset                      btf_str_by_offset
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in expansion of macro 'btf__str_by_offset'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/bpf/../../tools/lib/bpf/btf_relocate.c:431:33: note: in expansion of macro 'pr_warn'
     431 |                                 pr_warn("string '%s' [offset %u] is not mapped to base BTF\n",
         |                                 ^~~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from kernel/bpf/../../tools/lib/bpf/btf_relocate.c:9:
>> include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:564:16: note: in expansion of macro 'KERN_WARNING'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   kernel/bpf/../../tools/lib/bpf/btf_relocate.c:431:33: note: in expansion of macro 'pr_warn'
     431 |                                 pr_warn("string '%s' [offset %u] is not mapped to base BTF\n",
         |                                 ^~~~~~~


vim +6070 kernel/bpf/verifier.c

e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  6002  
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6003  static int map_kptr_match_type(struct bpf_verifier_env *env,
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  6004  			       struct btf_field *kptr_field,
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6005  			       struct bpf_reg_state *reg, u32 regno)
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6006  {
b32a5dae44cc73 Dave Marchevsky         2023-03-09  6007  	const char *targ_name = btf_type_name(kptr_field->kptr.btf, kptr_field->kptr.btf_id);
ab6c637ad0276e Yonghong Song           2023-08-21  6008  	int perm_flags;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6009  	const char *reg_name = "";
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6010  
ab6c637ad0276e Yonghong Song           2023-08-21  6011  	if (btf_is_kernel(reg->btf)) {
ab6c637ad0276e Yonghong Song           2023-08-21  6012  		perm_flags = PTR_MAYBE_NULL | PTR_TRUSTED | MEM_RCU;
ab6c637ad0276e Yonghong Song           2023-08-21  6013  
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  6014  		/* Only unreferenced case accepts untrusted pointers */
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  6015  		if (kptr_field->type == BPF_KPTR_UNREF)
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  6016  			perm_flags |= PTR_UNTRUSTED;
ab6c637ad0276e Yonghong Song           2023-08-21  6017  	} else {
ab6c637ad0276e Yonghong Song           2023-08-21  6018  		perm_flags = PTR_MAYBE_NULL | MEM_ALLOC;
36d8bdf75a9319 Yonghong Song           2023-08-27  6019  		if (kptr_field->type == BPF_KPTR_PERCPU)
36d8bdf75a9319 Yonghong Song           2023-08-27  6020  			perm_flags |= MEM_PERCPU;
ab6c637ad0276e Yonghong Song           2023-08-21  6021  	}
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  6022  
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  6023  	if (base_type(reg->type) != PTR_TO_BTF_ID || (type_flag(reg->type) & ~perm_flags))
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6024  		goto bad_type;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6025  
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6026  	/* We need to verify reg->type and reg->btf, before accessing reg->btf */
b32a5dae44cc73 Dave Marchevsky         2023-03-09  6027  	reg_name = btf_type_name(reg->btf, reg->btf_id);
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6028  
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  6029  	/* For ref_ptr case, release function check should ensure we get one
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  6030  	 * referenced PTR_TO_BTF_ID, and that its fixed offset is 0. For the
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  6031  	 * normal store of unreferenced kptr, we must ensure var_off is zero.
022ac075088366 Eduard Zingerman        2026-02-12  6032  	 * Since ref_ptr cannot be accessed directly by BPF insns, check for
022ac075088366 Eduard Zingerman        2026-02-12  6033  	 * reg->ref_obj_id is not needed here.
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  6034  	 */
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6035  	if (__check_ptr_off_reg(env, reg, regno, true))
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6036  		return -EACCES;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6037  
ab6c637ad0276e Yonghong Song           2023-08-21  6038  	/* A full type match is needed, as BTF can be vmlinux, module or prog BTF, and
022ac075088366 Eduard Zingerman        2026-02-12  6039  	 * we also need to take into account the reg->var_off.
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6040  	 *
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6041  	 * We want to support cases like:
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6042  	 *
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6043  	 * struct foo {
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6044  	 *         struct bar br;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6045  	 *         struct baz bz;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6046  	 * };
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6047  	 *
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6048  	 * struct foo *v;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6049  	 * v = func();	      // PTR_TO_BTF_ID
022ac075088366 Eduard Zingerman        2026-02-12  6050  	 * val->foo = v;      // reg->var_off is zero, btf and btf_id match type
022ac075088366 Eduard Zingerman        2026-02-12  6051  	 * val->bar = &v->br; // reg->var_off is still zero, but we need to retry with
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6052  	 *                    // first member type of struct after comparison fails
022ac075088366 Eduard Zingerman        2026-02-12  6053  	 * val->baz = &v->bz; // reg->var_off is non-zero, so struct needs to be walked
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6054  	 *                    // to match type
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6055  	 *
022ac075088366 Eduard Zingerman        2026-02-12  6056  	 * In the kptr_ref case, check_func_arg_reg_off already ensures reg->var_off
2ab3b3808eb17f Kumar Kartikeya Dwivedi 2022-04-25  6057  	 * is zero. We must also ensure that btf_struct_ids_match does not walk
2ab3b3808eb17f Kumar Kartikeya Dwivedi 2022-04-25  6058  	 * the struct to match type against first member of struct, i.e. reject
2ab3b3808eb17f Kumar Kartikeya Dwivedi 2022-04-25  6059  	 * second case from above. Hence, when type is BPF_KPTR_REF, we set
2ab3b3808eb17f Kumar Kartikeya Dwivedi 2022-04-25  6060  	 * strict mode to true for type match.
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6061  	 */
022ac075088366 Eduard Zingerman        2026-02-12  6062  	if (!btf_struct_ids_match(&env->log, reg->btf, reg->btf_id, reg->var_off.value,
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  6063  				  kptr_field->kptr.btf, kptr_field->kptr.btf_id,
36d8bdf75a9319 Yonghong Song           2023-08-27  6064  				  kptr_field->type != BPF_KPTR_UNREF))
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6065  		goto bad_type;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6066  	return 0;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6067  bad_type:
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6068  	verbose(env, "invalid kptr access, R%d type=%s%s ", regno,
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6069  		reg_type_str(env, reg->type), reg_name);
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25 @6070  	verbose(env, "expected=%s%s", reg_type_str(env, PTR_TO_BTF_ID), targ_name);
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  6071  	if (kptr_field->type == BPF_KPTR_UNREF)
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  6072  		verbose(env, " or %s%s\n", reg_type_str(env, PTR_TO_BTF_ID | PTR_UNTRUSTED),
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  6073  			targ_name);
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  6074  	else
6efe152d4061a8 Kumar Kartikeya Dwivedi 2022-04-25  6075  		verbose(env, "\n");
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6076  	return -EINVAL;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6077  }
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  6078  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
