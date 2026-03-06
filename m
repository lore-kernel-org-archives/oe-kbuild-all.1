Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CD13EBF2C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 21:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831159; cv=none; b=PZOmncfDNb2eX1n3GGx1GO5RGfxrDqT+afyAzjx+UzWz/UCMCcqEdvkk4KpQUMUzj+vsif2zDrAPazY/BgEG1iDmImydzAE+0QGOu0yNbnSOdA/ca9padIPG0IN7zhdVT5kEpauILKk+tevfkM/KSz1yNWM5yqcCkX+aR8Av0Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831159; c=relaxed/simple;
	bh=OAAYdNnSi/M1FlnQ8ip7Mx3oDdPPutp3929ph6x9o4E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qumBcIU6rAn/im4D3r1T1GUbcwHu2UltVA4iFZa/kBs5HycZIREbvGzEkCzN/Fb6S8U+AN83Z/7eg2KFc+nkIZHXiltQ8fZBFDcagGGOyQkCZNfpo+un2NrVJAF16yNqHTnYFb3JBBuPeWdErxTLtCWxWANZVVL4veZNXTFX0OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9+yNxMB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9+yNxMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772831157; x=1804367157;
  h=date:from:to:cc:subject:message-id;
  bh=OAAYdNnSi/M1FlnQ8ip7Mx3oDdPPutp3929ph6x9o4E=;
  b=S9+yNxMBmXtHYM8FE9lAfIzyVY0diz6DIAIHIVMjzfDUctWO8coARTqC
   fc7CafzhckJScgcJ+5z2Z69xMG7ZmagZhOSDPVIbLTz9KxjPXNDnz68ZG
   o+aly3AWYzbEQK3CjRJ0v8apSWxyGRrDIWCamZiWN3x130W7znB3eNZtu
   9dyom0TQCIs3TVw2q34jryIIkMT8z6aKCEDAMqMiN9jpWkOXFWJ/KzUuy
   B/z01HYOpF1tPtVpwU6ILB+3CxRMXmGOfwhM19NcJ7fis6czOxRH9Vg/u
   wC5OYxTr05ZuKhIi1BrBvFbrb9Yg9InVKrs8nza6+ksF+rAi+1rSC3iGR
   w==;
X-CSE-ConnectionGUID: WvwKqiQFQ5SahMSiXkx2Sg==
X-CSE-MsgGUID: QN4wWoGmQ864vgAlS7WuHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74059333"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="74059333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 13:05:57 -0800
X-CSE-ConnectionGUID: Bw0Os6dsSNShYpTMPWLhLA==
X-CSE-MsgGUID: qgn9koOeRJGEGxlGkZXRFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="224080558"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 13:05:55 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vycMp-000000001Nh-1687;
	Fri, 06 Mar 2026 21:05:51 +0000
Date: Sat, 07 Mar 2026 05:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 11/26]
 kernel/trace/bpf_trace.c:3607:22: error: implicit declaration of function
 'bpf_trampoline_multi_detach'; did you mean 'bpf_tracing_multi_attach'?
Message-ID: <202603070415.1NNNfOgV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   c803155263f86db2a723f3009d3dbe9f647db78f
commit: d4c517168c9d15363f087e145e6580c9279cb98a [11/26] bpf: Add support for tracing multi link
config: x86_64-randconfig-004-20260307 (https://download.01.org/0day-ci/archive/20260307/202603070415.1NNNfOgV-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070415.1NNNfOgV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070415.1NNNfOgV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from kernel/trace/bpf_trace.c:5:
   kernel/trace/bpf_trace.c: In function 'bpf_tracing_multi_link_release':
>> kernel/trace/bpf_trace.c:3607:22: error: implicit declaration of function 'bpf_trampoline_multi_detach'; did you mean 'bpf_tracing_multi_attach'? [-Werror=implicit-function-declaration]
    3607 |         WARN_ON_ONCE(bpf_trampoline_multi_detach(link->prog, tr_link));
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/trace/bpf_trace.c: In function 'bpf_tracing_multi_attach':
>> kernel/trace/bpf_trace.c:3663:15: error: implicit declaration of function 'bpf_trampoline_multi_attach'; did you mean 'bpf_tracing_multi_attach'? [-Werror=implicit-function-declaration]
    3663 |         err = bpf_trampoline_multi_attach(prog, ids, link);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               bpf_tracing_multi_attach
   cc1: some warnings being treated as errors


vim +3607 kernel/trace/bpf_trace.c

  3598	
  3599	#if defined(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS) && \
  3600	    defined(CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS)
  3601	
  3602	static void bpf_tracing_multi_link_release(struct bpf_link *link)
  3603	{
  3604		struct bpf_tracing_multi_link *tr_link =
  3605			container_of(link, struct bpf_tracing_multi_link, link);
  3606	
> 3607		WARN_ON_ONCE(bpf_trampoline_multi_detach(link->prog, tr_link));
  3608	}
  3609	
  3610	static void bpf_tracing_multi_link_dealloc(struct bpf_link *link)
  3611	{
  3612		struct bpf_tracing_multi_link *tr_link =
  3613			container_of(link, struct bpf_tracing_multi_link, link);
  3614	
  3615		kvfree(tr_link);
  3616	}
  3617	
  3618	static const struct bpf_link_ops bpf_tracing_multi_link_lops = {
  3619		.release = bpf_tracing_multi_link_release,
  3620		.dealloc_deferred = bpf_tracing_multi_link_dealloc,
  3621	};
  3622	
  3623	int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
  3624	{
  3625		struct bpf_tracing_multi_link *link = NULL;
  3626		struct bpf_link_primer link_primer;
  3627		u32 cnt, *ids = NULL;
  3628		u32 __user *uids;
  3629		int err;
  3630	
  3631		uids = u64_to_user_ptr(attr->link_create.tracing_multi.ids);
  3632		cnt = attr->link_create.tracing_multi.cnt;
  3633	
  3634		if (!cnt || !uids)
  3635			return -EINVAL;
  3636		if (cnt > MAX_TRACING_MULTI_CNT)
  3637			return -E2BIG;
  3638	
  3639		ids = kvmalloc_array(cnt, sizeof(*ids), GFP_KERNEL);
  3640		if (!ids)
  3641			return -ENOMEM;
  3642	
  3643		if (copy_from_user(ids, uids, cnt * sizeof(*ids))) {
  3644			err = -EFAULT;
  3645			goto error;
  3646		}
  3647	
  3648		link = kvzalloc(struct_size(link, nodes, cnt), GFP_KERNEL);
  3649		if (!link) {
  3650			err = -ENOMEM;
  3651			goto error;
  3652		}
  3653	
  3654		bpf_link_init(&link->link, BPF_LINK_TYPE_TRACING_MULTI,
  3655			      &bpf_tracing_multi_link_lops, prog, prog->expected_attach_type);
  3656	
  3657		err = bpf_link_prime(&link->link, &link_primer);
  3658		if (err)
  3659			goto error;
  3660	
  3661		link->nodes_cnt = cnt;
  3662	
> 3663		err = bpf_trampoline_multi_attach(prog, ids, link);
  3664		kvfree(ids);
  3665		if (err) {
  3666			bpf_link_cleanup(&link_primer);
  3667			return err;
  3668		}
  3669		return bpf_link_settle(&link_primer);
  3670	
  3671	error:
  3672		kvfree(ids);
  3673		kvfree(link);
  3674		return err;
  3675	}
  3676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
