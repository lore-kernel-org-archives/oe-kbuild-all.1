Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261BE6F06B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615995; cv=none; b=IiSJr2iC7Hiy6eo0NwQKmQ2E6367qTX5HLXZBVC1ysq57LqLXpyQWsULc5ENYop/R786JyEGNKBBwqZn0yiP6yN5lcw4/HAHekPqO708QFVtPxsO0OrIe3UMeQFIlILMuO19J7jETvPrqw3TeuAOtIWGDppaUKBYj/tP8Ha7AWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615995; c=relaxed/simple;
	bh=jc++Ay5QkUnNJNlO5pVbUeRmINNdJJ4nAwEPl5fijas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHY3rcyXJEhOYS7fjjcYf9g8SQyJhF/e4nJOlbEw3zsUWaoKb1YDNXRYpyZmtPBe4hR83X8OquRSpqYPVlWQqmrW29OfBhV7GxhrT6fcp6cmrhHj2ed46VhlT58kv0VohOt1hKGtdU9aRB/XMqsVT5kh0x5A3AIkpmeXmCQznkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B39ZT2qu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B39ZT2qu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760615994; x=1792151994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jc++Ay5QkUnNJNlO5pVbUeRmINNdJJ4nAwEPl5fijas=;
  b=B39ZT2qufTMD77K5JQpIWubi9n250wEJ9ngM7L/eAEGh7F//IpEcRgGd
   NrcQtuwLJgsMW2AmYq/gINgxmD0r5fm3BZE4hhbH+6TconigMSpbQzM2Q
   2Dt3uu7AgwVq7CxRYw1gaPMt1VA2cleRBJ163kSZX1xq8ueS3mT61JnyM
   D5MRuDyURO1jBL0qugyNiWWdwd3eXRL0PX2dgfAJ24s4neQIwKGGcIhaR
   yQNSsjJmoqZdsozPn6mgOzQ7ghYAyPj6kKLpOoRUsrzj4oYs2TrpeDBAt
   bycKNstkepnx7Ng9Bpj41WJoK5VaVG69TLcRZmWM+XLDq2kiR+kaMmaZ6
   A==;
X-CSE-ConnectionGUID: IiTPHL+wQMa8E/LoAa6HXQ==
X-CSE-MsgGUID: I4wwh4iWSE63SkVpWGRzlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66454639"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66454639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 04:59:53 -0700
X-CSE-ConnectionGUID: Nifi0qCoS6Gyq5dGgeNkPg==
X-CSE-MsgGUID: 967kF0n0SL6zOkyvWwxYcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="186838931"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2025 04:59:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Mdl-0004m3-0k;
	Thu, 16 Oct 2025 11:59:37 +0000
Date: Thu, 16 Oct 2025 19:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tao Chen <chen.dylane@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v2 2/2] bpf: Pass external callchain entry
 to get_perf_callchain
Message-ID: <202510161955.CqDInkdX-lkp@intel.com>
References: <20251014100128.2721104-3-chen.dylane@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014100128.2721104-3-chen.dylane@linux.dev>

Hi Tao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Tao-Chen/perf-Use-extern-perf_callchain_entry-for-get_perf_callchain/20251014-181245
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251014100128.2721104-3-chen.dylane%40linux.dev
patch subject: [RFC PATCH bpf-next v2 2/2] bpf: Pass external callchain entry to get_perf_callchain
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251016/202510161955.CqDInkdX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161955.CqDInkdX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161955.CqDInkdX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/stackmap.c:6:
   kernel/bpf/stackmap.c: In function 'bpf_get_stackid':
>> include/linux/filter.h:618:9: warning: the frame size of 1036 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     618 |         }                                                                      \
         |         ^
   include/linux/filter.h:626:33: note: in expansion of macro 'BPF_CALL_x'
     626 | #define BPF_CALL_3(name, ...)   BPF_CALL_x(3, __NOATTR, name, __VA_ARGS__)
         |                                 ^~~~~~~~~~
   kernel/bpf/stackmap.c:305:1: note: in expansion of macro 'BPF_CALL_3'
     305 | BPF_CALL_3(bpf_get_stackid, struct pt_regs *, regs, struct bpf_map *, map,
         | ^~~~~~~~~~
   kernel/bpf/stackmap.c: In function '__bpf_get_stack':
>> kernel/bpf/stackmap.c:497:1: warning: the frame size of 1080 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     497 | }
         | ^


vim +497 kernel/bpf/stackmap.c

d5a3b1f691865b Alexei Starovoitov 2016-02-17  304  
7b04d6d60fcfb5 Song Liu           2020-07-23 @305  BPF_CALL_3(bpf_get_stackid, struct pt_regs *, regs, struct bpf_map *, map,
7b04d6d60fcfb5 Song Liu           2020-07-23  306  	   u64, flags)
7b04d6d60fcfb5 Song Liu           2020-07-23  307  {
7b04d6d60fcfb5 Song Liu           2020-07-23  308  	u32 max_depth = map->value_size / stack_map_data_size(map);
ee2a098851bfbe Namhyung Kim       2022-03-14  309  	u32 skip = flags & BPF_F_SKIP_FIELD_MASK;
7b04d6d60fcfb5 Song Liu           2020-07-23  310  	bool user = flags & BPF_F_USER_STACK;
7b04d6d60fcfb5 Song Liu           2020-07-23  311  	struct perf_callchain_entry *trace;
7b04d6d60fcfb5 Song Liu           2020-07-23  312  	bool kernel = !user;
8d90c803bbb115 Tao Chen           2025-10-14  313  	struct bpf_perf_callchain_entry entry = { 0 };
7b04d6d60fcfb5 Song Liu           2020-07-23  314  
7b04d6d60fcfb5 Song Liu           2020-07-23  315  	if (unlikely(flags & ~(BPF_F_SKIP_FIELD_MASK | BPF_F_USER_STACK |
7b04d6d60fcfb5 Song Liu           2020-07-23  316  			       BPF_F_FAST_STACK_CMP | BPF_F_REUSE_STACKID)))
7b04d6d60fcfb5 Song Liu           2020-07-23  317  		return -EINVAL;
7b04d6d60fcfb5 Song Liu           2020-07-23  318  
ee2a098851bfbe Namhyung Kim       2022-03-14  319  	max_depth += skip;
ee2a098851bfbe Namhyung Kim       2022-03-14  320  	if (max_depth > sysctl_perf_event_max_stack)
ee2a098851bfbe Namhyung Kim       2022-03-14  321  		max_depth = sysctl_perf_event_max_stack;
ee2a098851bfbe Namhyung Kim       2022-03-14  322  
8d90c803bbb115 Tao Chen           2025-10-14  323  	trace = get_perf_callchain(regs, (struct perf_callchain_entry *)&entry,
8d90c803bbb115 Tao Chen           2025-10-14  324  				   kernel, user, max_depth, false, false);
7b04d6d60fcfb5 Song Liu           2020-07-23  325  
7b04d6d60fcfb5 Song Liu           2020-07-23  326  	return __bpf_get_stackid(map, trace, flags);
7b04d6d60fcfb5 Song Liu           2020-07-23  327  }
7b04d6d60fcfb5 Song Liu           2020-07-23  328  
d5a3b1f691865b Alexei Starovoitov 2016-02-17  329  const struct bpf_func_proto bpf_get_stackid_proto = {
d5a3b1f691865b Alexei Starovoitov 2016-02-17  330  	.func		= bpf_get_stackid,
d5a3b1f691865b Alexei Starovoitov 2016-02-17  331  	.gpl_only	= true,
d5a3b1f691865b Alexei Starovoitov 2016-02-17  332  	.ret_type	= RET_INTEGER,
d5a3b1f691865b Alexei Starovoitov 2016-02-17  333  	.arg1_type	= ARG_PTR_TO_CTX,
d5a3b1f691865b Alexei Starovoitov 2016-02-17  334  	.arg2_type	= ARG_CONST_MAP_PTR,
d5a3b1f691865b Alexei Starovoitov 2016-02-17  335  	.arg3_type	= ARG_ANYTHING,
d5a3b1f691865b Alexei Starovoitov 2016-02-17  336  };
d5a3b1f691865b Alexei Starovoitov 2016-02-17  337  
7b04d6d60fcfb5 Song Liu           2020-07-23  338  static __u64 count_kernel_ip(struct perf_callchain_entry *trace)
7b04d6d60fcfb5 Song Liu           2020-07-23  339  {
7b04d6d60fcfb5 Song Liu           2020-07-23  340  	__u64 nr_kernel = 0;
7b04d6d60fcfb5 Song Liu           2020-07-23  341  
7b04d6d60fcfb5 Song Liu           2020-07-23  342  	while (nr_kernel < trace->nr) {
7b04d6d60fcfb5 Song Liu           2020-07-23  343  		if (trace->ip[nr_kernel] == PERF_CONTEXT_USER)
7b04d6d60fcfb5 Song Liu           2020-07-23  344  			break;
7b04d6d60fcfb5 Song Liu           2020-07-23  345  		nr_kernel++;
7b04d6d60fcfb5 Song Liu           2020-07-23  346  	}
7b04d6d60fcfb5 Song Liu           2020-07-23  347  	return nr_kernel;
7b04d6d60fcfb5 Song Liu           2020-07-23  348  }
7b04d6d60fcfb5 Song Liu           2020-07-23  349  
7b04d6d60fcfb5 Song Liu           2020-07-23  350  BPF_CALL_3(bpf_get_stackid_pe, struct bpf_perf_event_data_kern *, ctx,
7b04d6d60fcfb5 Song Liu           2020-07-23  351  	   struct bpf_map *, map, u64, flags)
7b04d6d60fcfb5 Song Liu           2020-07-23  352  {
7b04d6d60fcfb5 Song Liu           2020-07-23  353  	struct perf_event *event = ctx->event;
7b04d6d60fcfb5 Song Liu           2020-07-23  354  	struct perf_callchain_entry *trace;
7b04d6d60fcfb5 Song Liu           2020-07-23  355  	bool kernel, user;
7b04d6d60fcfb5 Song Liu           2020-07-23  356  	__u64 nr_kernel;
7b04d6d60fcfb5 Song Liu           2020-07-23  357  	int ret;
7b04d6d60fcfb5 Song Liu           2020-07-23  358  
7b04d6d60fcfb5 Song Liu           2020-07-23  359  	/* perf_sample_data doesn't have callchain, use bpf_get_stackid */
16817ad7e8b317 Namhyung Kim       2022-09-08  360  	if (!(event->attr.sample_type & PERF_SAMPLE_CALLCHAIN))
7b04d6d60fcfb5 Song Liu           2020-07-23  361  		return bpf_get_stackid((unsigned long)(ctx->regs),
7b04d6d60fcfb5 Song Liu           2020-07-23  362  				       (unsigned long) map, flags, 0, 0);
7b04d6d60fcfb5 Song Liu           2020-07-23  363  
7b04d6d60fcfb5 Song Liu           2020-07-23  364  	if (unlikely(flags & ~(BPF_F_SKIP_FIELD_MASK | BPF_F_USER_STACK |
7b04d6d60fcfb5 Song Liu           2020-07-23  365  			       BPF_F_FAST_STACK_CMP | BPF_F_REUSE_STACKID)))
7b04d6d60fcfb5 Song Liu           2020-07-23  366  		return -EINVAL;
7b04d6d60fcfb5 Song Liu           2020-07-23  367  
7b04d6d60fcfb5 Song Liu           2020-07-23  368  	user = flags & BPF_F_USER_STACK;
7b04d6d60fcfb5 Song Liu           2020-07-23  369  	kernel = !user;
7b04d6d60fcfb5 Song Liu           2020-07-23  370  
7b04d6d60fcfb5 Song Liu           2020-07-23  371  	trace = ctx->data->callchain;
7b04d6d60fcfb5 Song Liu           2020-07-23  372  	if (unlikely(!trace))
7b04d6d60fcfb5 Song Liu           2020-07-23  373  		return -EFAULT;
7b04d6d60fcfb5 Song Liu           2020-07-23  374  
7b04d6d60fcfb5 Song Liu           2020-07-23  375  	nr_kernel = count_kernel_ip(trace);
7b04d6d60fcfb5 Song Liu           2020-07-23  376  
7b04d6d60fcfb5 Song Liu           2020-07-23  377  	if (kernel) {
7b04d6d60fcfb5 Song Liu           2020-07-23  378  		__u64 nr = trace->nr;
7b04d6d60fcfb5 Song Liu           2020-07-23  379  
7b04d6d60fcfb5 Song Liu           2020-07-23  380  		trace->nr = nr_kernel;
7b04d6d60fcfb5 Song Liu           2020-07-23  381  		ret = __bpf_get_stackid(map, trace, flags);
7b04d6d60fcfb5 Song Liu           2020-07-23  382  
7b04d6d60fcfb5 Song Liu           2020-07-23  383  		/* restore nr */
7b04d6d60fcfb5 Song Liu           2020-07-23  384  		trace->nr = nr;
7b04d6d60fcfb5 Song Liu           2020-07-23  385  	} else { /* user */
7b04d6d60fcfb5 Song Liu           2020-07-23  386  		u64 skip = flags & BPF_F_SKIP_FIELD_MASK;
7b04d6d60fcfb5 Song Liu           2020-07-23  387  
7b04d6d60fcfb5 Song Liu           2020-07-23  388  		skip += nr_kernel;
7b04d6d60fcfb5 Song Liu           2020-07-23  389  		if (skip > BPF_F_SKIP_FIELD_MASK)
7b04d6d60fcfb5 Song Liu           2020-07-23  390  			return -EFAULT;
7b04d6d60fcfb5 Song Liu           2020-07-23  391  
7b04d6d60fcfb5 Song Liu           2020-07-23  392  		flags = (flags & ~BPF_F_SKIP_FIELD_MASK) | skip;
7b04d6d60fcfb5 Song Liu           2020-07-23  393  		ret = __bpf_get_stackid(map, trace, flags);
7b04d6d60fcfb5 Song Liu           2020-07-23  394  	}
7b04d6d60fcfb5 Song Liu           2020-07-23  395  	return ret;
7b04d6d60fcfb5 Song Liu           2020-07-23  396  }
7b04d6d60fcfb5 Song Liu           2020-07-23  397  
7b04d6d60fcfb5 Song Liu           2020-07-23  398  const struct bpf_func_proto bpf_get_stackid_proto_pe = {
7b04d6d60fcfb5 Song Liu           2020-07-23  399  	.func		= bpf_get_stackid_pe,
7b04d6d60fcfb5 Song Liu           2020-07-23  400  	.gpl_only	= false,
7b04d6d60fcfb5 Song Liu           2020-07-23  401  	.ret_type	= RET_INTEGER,
7b04d6d60fcfb5 Song Liu           2020-07-23  402  	.arg1_type	= ARG_PTR_TO_CTX,
7b04d6d60fcfb5 Song Liu           2020-07-23  403  	.arg2_type	= ARG_CONST_MAP_PTR,
7b04d6d60fcfb5 Song Liu           2020-07-23  404  	.arg3_type	= ARG_ANYTHING,
7b04d6d60fcfb5 Song Liu           2020-07-23  405  };
7b04d6d60fcfb5 Song Liu           2020-07-23  406  
fa28dcb82a38f8 Song Liu           2020-06-29  407  static long __bpf_get_stack(struct pt_regs *regs, struct task_struct *task,
7b04d6d60fcfb5 Song Liu           2020-07-23  408  			    struct perf_callchain_entry *trace_in,
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  409  			    void *buf, u32 size, u64 flags, bool may_fault)
c195651e565ae7 Yonghong Song      2018-04-28  410  {
ee2a098851bfbe Namhyung Kim       2022-03-14  411  	u32 trace_nr, copy_len, elem_size, num_elem, max_depth;
c195651e565ae7 Yonghong Song      2018-04-28  412  	bool user_build_id = flags & BPF_F_USER_BUILD_ID;
b8e3a87a627b57 Jordan Rome        2023-11-08  413  	bool crosstask = task && task != current;
c195651e565ae7 Yonghong Song      2018-04-28  414  	u32 skip = flags & BPF_F_SKIP_FIELD_MASK;
c195651e565ae7 Yonghong Song      2018-04-28  415  	bool user = flags & BPF_F_USER_STACK;
c195651e565ae7 Yonghong Song      2018-04-28  416  	struct perf_callchain_entry *trace;
8d90c803bbb115 Tao Chen           2025-10-14  417  	struct bpf_perf_callchain_entry entry = { 0 };
c195651e565ae7 Yonghong Song      2018-04-28  418  	bool kernel = !user;
c195651e565ae7 Yonghong Song      2018-04-28  419  	int err = -EINVAL;
c195651e565ae7 Yonghong Song      2018-04-28  420  	u64 *ips;
c195651e565ae7 Yonghong Song      2018-04-28  421  
c195651e565ae7 Yonghong Song      2018-04-28  422  	if (unlikely(flags & ~(BPF_F_SKIP_FIELD_MASK | BPF_F_USER_STACK |
c195651e565ae7 Yonghong Song      2018-04-28  423  			       BPF_F_USER_BUILD_ID)))
c195651e565ae7 Yonghong Song      2018-04-28  424  		goto clear;
c195651e565ae7 Yonghong Song      2018-04-28  425  	if (kernel && user_build_id)
c195651e565ae7 Yonghong Song      2018-04-28  426  		goto clear;
c195651e565ae7 Yonghong Song      2018-04-28  427  
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  428  	elem_size = user_build_id ? sizeof(struct bpf_stack_build_id) : sizeof(u64);
c195651e565ae7 Yonghong Song      2018-04-28  429  	if (unlikely(size % elem_size))
c195651e565ae7 Yonghong Song      2018-04-28  430  		goto clear;
c195651e565ae7 Yonghong Song      2018-04-28  431  
fa28dcb82a38f8 Song Liu           2020-06-29  432  	/* cannot get valid user stack for task without user_mode regs */
fa28dcb82a38f8 Song Liu           2020-06-29  433  	if (task && user && !user_mode(regs))
fa28dcb82a38f8 Song Liu           2020-06-29  434  		goto err_fault;
fa28dcb82a38f8 Song Liu           2020-06-29  435  
b8e3a87a627b57 Jordan Rome        2023-11-08  436  	/* get_perf_callchain does not support crosstask user stack walking
b8e3a87a627b57 Jordan Rome        2023-11-08  437  	 * but returns an empty stack instead of NULL.
b8e3a87a627b57 Jordan Rome        2023-11-08  438  	 */
b8e3a87a627b57 Jordan Rome        2023-11-08  439  	if (crosstask && user) {
b8e3a87a627b57 Jordan Rome        2023-11-08  440  		err = -EOPNOTSUPP;
b8e3a87a627b57 Jordan Rome        2023-11-08  441  		goto clear;
b8e3a87a627b57 Jordan Rome        2023-11-08  442  	}
b8e3a87a627b57 Jordan Rome        2023-11-08  443  
c195651e565ae7 Yonghong Song      2018-04-28  444  	num_elem = size / elem_size;
ee2a098851bfbe Namhyung Kim       2022-03-14  445  	max_depth = num_elem + skip;
ee2a098851bfbe Namhyung Kim       2022-03-14  446  	if (sysctl_perf_event_max_stack < max_depth)
ee2a098851bfbe Namhyung Kim       2022-03-14  447  		max_depth = sysctl_perf_event_max_stack;
fa28dcb82a38f8 Song Liu           2020-06-29  448  
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  449  	if (may_fault)
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  450  		rcu_read_lock(); /* need RCU for perf's callchain below */
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  451  
7b04d6d60fcfb5 Song Liu           2020-07-23  452  	if (trace_in)
7b04d6d60fcfb5 Song Liu           2020-07-23  453  		trace = trace_in;
7b04d6d60fcfb5 Song Liu           2020-07-23  454  	else if (kernel && task)
ee2a098851bfbe Namhyung Kim       2022-03-14  455  		trace = get_callchain_entry_for_task(task, max_depth);
fa28dcb82a38f8 Song Liu           2020-06-29  456  	else
8d90c803bbb115 Tao Chen           2025-10-14  457  		trace = get_perf_callchain(regs, (struct perf_callchain_entry *)&entry,
8d90c803bbb115 Tao Chen           2025-10-14  458  					   kernel, user, max_depth, crosstask, false);
c195651e565ae7 Yonghong Song      2018-04-28  459  
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  460  	if (unlikely(!trace) || trace->nr < skip) {
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  461  		if (may_fault)
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  462  			rcu_read_unlock();
c195651e565ae7 Yonghong Song      2018-04-28  463  		goto err_fault;
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  464  	}
c195651e565ae7 Yonghong Song      2018-04-28  465  
ee2a098851bfbe Namhyung Kim       2022-03-14  466  	trace_nr = trace->nr - skip;
c195651e565ae7 Yonghong Song      2018-04-28  467  	trace_nr = (trace_nr <= num_elem) ? trace_nr : num_elem;
c195651e565ae7 Yonghong Song      2018-04-28  468  	copy_len = trace_nr * elem_size;
ee2a098851bfbe Namhyung Kim       2022-03-14  469  
ee2a098851bfbe Namhyung Kim       2022-03-14  470  	ips = trace->ip + skip;
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  471  	if (user_build_id) {
4f4c4fc0153fb1 Andrii Nakryiko    2024-08-29  472  		struct bpf_stack_build_id *id_offs = buf;
4f4c4fc0153fb1 Andrii Nakryiko    2024-08-29  473  		u32 i;
4f4c4fc0153fb1 Andrii Nakryiko    2024-08-29  474  
4f4c4fc0153fb1 Andrii Nakryiko    2024-08-29  475  		for (i = 0; i < trace_nr; i++)
4f4c4fc0153fb1 Andrii Nakryiko    2024-08-29  476  			id_offs[i].ip = ips[i];
4f4c4fc0153fb1 Andrii Nakryiko    2024-08-29  477  	} else {
c195651e565ae7 Yonghong Song      2018-04-28  478  		memcpy(buf, ips, copy_len);
4f4c4fc0153fb1 Andrii Nakryiko    2024-08-29  479  	}
c195651e565ae7 Yonghong Song      2018-04-28  480  
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  481  	/* trace/ips should not be dereferenced after this point */
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  482  	if (may_fault)
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  483  		rcu_read_unlock();
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  484  
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  485  	if (user_build_id)
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  486  		stack_map_get_build_id_offset(buf, trace_nr, user, may_fault);
d4dd9775ec2424 Andrii Nakryiko    2024-08-29  487  
c195651e565ae7 Yonghong Song      2018-04-28  488  	if (size > copy_len)
c195651e565ae7 Yonghong Song      2018-04-28  489  		memset(buf + copy_len, 0, size - copy_len);
c195651e565ae7 Yonghong Song      2018-04-28  490  	return copy_len;
c195651e565ae7 Yonghong Song      2018-04-28  491  
c195651e565ae7 Yonghong Song      2018-04-28  492  err_fault:
c195651e565ae7 Yonghong Song      2018-04-28  493  	err = -EFAULT;
c195651e565ae7 Yonghong Song      2018-04-28  494  clear:
c195651e565ae7 Yonghong Song      2018-04-28  495  	memset(buf, 0, size);
c195651e565ae7 Yonghong Song      2018-04-28  496  	return err;
c195651e565ae7 Yonghong Song      2018-04-28 @497  }
c195651e565ae7 Yonghong Song      2018-04-28  498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
