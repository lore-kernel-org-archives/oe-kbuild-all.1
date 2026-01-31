Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186FF309EF0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769837510; cv=none; b=tRYcc2YUZgH+KWzpacYF6U4flhOsGrwnYkZeZMomc9L50HF245wd1jWIMnY7RgTuN7GvwNwd4vD4j1/ZS4aHXc/duRtM6iB9OlbQOIK+YpVi8XvVmdrj21vXDaK1X6Vchcyb6x3wafu4vc+VQs2Zak/niD/ZExdl7J6wNHcnGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769837510; c=relaxed/simple;
	bh=FElroQ77D+uobMWQz28lVanyUOy95mZR1jiaNxf3hE8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UfBErvRgJfWemXUhBXqfhSl2RSBqAAJaW/fFBrDz9+eoMdB5oIzqGIheYsNfz6Vwe6aP1zd/NBfoYvHgV0t1sk3GmGQewVTzh4VkFxTNrkN8tKaNrfS/pBUrCiulxcTmFDEZyhKfxcxeAG/Y25nYlistGMTqM7Ul/sCMN0yFyGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EY60DS0J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EY60DS0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769837509; x=1801373509;
  h=date:from:to:cc:subject:message-id;
  bh=FElroQ77D+uobMWQz28lVanyUOy95mZR1jiaNxf3hE8=;
  b=EY60DS0JfXCvlbaZpYDLyU3gvDOnBv7Kp8OoQ0H2VCegpC3669qYXTqK
   q7ijHjJaz9KiH4/RL7U0KvAxHgSw+CS5k+fOD2LLxMqVDbXufYQlSMVcD
   7Wmy0mN5pHHP7jG82BB3Ti1MlnwGcHrRvpALzeK6fAuEncpP86Y8wATBf
   ZMEwnfAkkg9+mGu/5R8RudRhH5Ey+NGvFDEgVDhT50zdu/GYP44Cp6D/u
   td20VYzf1KdTpENzRN/Oi4dYXEgT2m7gdyKTyrH2fdpVIKXbXyAD7yFBZ
   2gZzTdcLjyVFr94RC62dGnA4cXl/pTJDPwOOra+5iRL5iQJ6Rh/5QY3Vv
   g==;
X-CSE-ConnectionGUID: EddfswpRQjmoSzX68W9v1w==
X-CSE-MsgGUID: /Mrhp/5yRVC+N73U/RESTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="58665625"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="58665625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 21:31:48 -0800
X-CSE-ConnectionGUID: HQkRGq6NQO6T9w4eHQb4iw==
X-CSE-MsgGUID: u04gi4rdQWSwxhtOE2xFBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208142978"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jan 2026 21:31:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm3aC-00000000dg3-2Pma;
	Sat, 31 Jan 2026 05:31:44 +0000
Date: Sat, 31 Jan 2026 13:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 6/12]
 kernel/trace/bpf_trace.c:3610:9: error: implicit declaration of function
 'bpf_trampoline_multi_detach'; did you mean 'bpf_tracing_multi_attach'?
Message-ID: <202601311311.FM5G0Ivr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 43cf4edef3aa5c2d42fff08ce0a553010aae6a11 [6/12] bpf: Add support to create tracing multi link
config: i386-buildonly-randconfig-001-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311311.FM5G0Ivr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311311.FM5G0Ivr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311311.FM5G0Ivr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/bpf_trace.c:8:
   include/linux/bpf.h:1550:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1550 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1556:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1556 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c: In function '____bpf_trace_printk':
   kernel/trace/bpf_trace.c:377:9: warning: function '____bpf_trace_printk' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     377 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args);
         |         ^~~
   kernel/trace/bpf_trace.c: In function '____bpf_trace_vprintk':
   kernel/trace/bpf_trace.c:433:9: warning: function '____bpf_trace_vprintk' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     433 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args);
         |         ^~~
   kernel/trace/bpf_trace.c: In function '____bpf_seq_printf':
   kernel/trace/bpf_trace.c:475:9: warning: function '____bpf_seq_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     475 |         seq_bprintf(m, fmt, data.bin_args);
         |         ^~~~~~~~~~~
   kernel/trace/bpf_trace.c: In function 'bpf_tracing_multi_link_release':
>> kernel/trace/bpf_trace.c:3610:9: error: implicit declaration of function 'bpf_trampoline_multi_detach'; did you mean 'bpf_tracing_multi_attach'? [-Wimplicit-function-declaration]
    3610 |         bpf_trampoline_multi_detach(link->prog, tr_link);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         bpf_tracing_multi_attach
   kernel/trace/bpf_trace.c: In function 'bpf_tracing_multi_attach':
>> kernel/trace/bpf_trace.c:3697:15: error: implicit declaration of function 'bpf_trampoline_multi_attach'; did you mean 'bpf_tracing_multi_attach'? [-Wimplicit-function-declaration]
    3697 |         err = bpf_trampoline_multi_attach(prog, ids, link);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               bpf_tracing_multi_attach


vim +3610 kernel/trace/bpf_trace.c

  3604	
  3605	static void bpf_tracing_multi_link_release(struct bpf_link *link)
  3606	{
  3607		struct bpf_tracing_multi_link *tr_link =
  3608			container_of(link, struct bpf_tracing_multi_link, link);
  3609	
> 3610		bpf_trampoline_multi_detach(link->prog, tr_link);
  3611	}
  3612	
  3613	static void bpf_tracing_multi_link_dealloc(struct bpf_link *link)
  3614	{
  3615		struct bpf_tracing_multi_link *tr_link =
  3616			container_of(link, struct bpf_tracing_multi_link, link);
  3617	
  3618		kfree(tr_link);
  3619	}
  3620	
  3621	static void bpf_tracing_multi_link_show_fdinfo(const struct bpf_link *link,
  3622						       struct seq_file *seq)
  3623	{
  3624		struct bpf_tracing_multi_link *tr_link =
  3625			container_of(link, struct bpf_tracing_multi_link, link);
  3626	
  3627		seq_printf(seq, "attach_type:\t%d\n", tr_link->attach_type);
  3628	}
  3629	
  3630	static int bpf_tracing_multi_link_fill_link_info(const struct bpf_link *link,
  3631							 struct bpf_link_info *info)
  3632	{
  3633		struct bpf_tracing_multi_link *tr_link =
  3634			container_of(link, struct bpf_tracing_multi_link, link);
  3635	
  3636		info->tracing.attach_type = tr_link->attach_type;
  3637		return 0;
  3638	}
  3639	
  3640	static const struct bpf_link_ops bpf_tracing_multi_link_lops = {
  3641		.release = bpf_tracing_multi_link_release,
  3642		.dealloc = bpf_tracing_multi_link_dealloc,
  3643		.show_fdinfo = bpf_tracing_multi_link_show_fdinfo,
  3644		.fill_link_info = bpf_tracing_multi_link_fill_link_info,
  3645	};
  3646	
  3647	int bpf_tracing_multi_attach(struct bpf_prog *prog,
  3648				     const union bpf_attr *attr)
  3649	{
  3650		struct bpf_attach_target_info tgt_info = {};
  3651		struct bpf_tracing_multi_link *link = NULL;
  3652		struct bpf_link_primer link_primer;
  3653		u32 i, j, cnt, *ids = NULL;
  3654		u32 __user *uids;
  3655		int err;
  3656	
  3657		if (check_multi_prog_type(prog))
  3658			return -EINVAL;
  3659	
  3660		uids = u64_to_user_ptr(attr->link_create.tracing_multi.btf_ids);
  3661		cnt = attr->link_create.tracing_multi.btf_ids_cnt;
  3662	
  3663		if (!cnt || !uids)
  3664			return -EINVAL;
  3665	
  3666		ids = kvmalloc_array(cnt, sizeof(*ids), GFP_KERNEL);
  3667		if (!ids)
  3668			return -ENOMEM;
  3669	
  3670		if (copy_from_user(ids, uids, cnt * sizeof(*ids))) {
  3671			err = -EFAULT;
  3672			goto error;
  3673		}
  3674	
  3675		link = kzalloc(struct_size(link, nodes, cnt), GFP_KERNEL);
  3676		if (!link) {
  3677			err = -ENOMEM;
  3678			goto error;
  3679		}
  3680	
  3681		bpf_link_init(&link->link, BPF_LINK_TYPE_TRACING_MULTI,
  3682			      &bpf_tracing_multi_link_lops, prog, prog->expected_attach_type);
  3683	
  3684		err = bpf_link_prime(&link->link, &link_primer);
  3685		if (err)
  3686			goto error;
  3687	
  3688		for (i = 0, j = 0; i < cnt; i++) {
  3689			err = bpf_check_attach_target(NULL, prog, NULL, ids[i], &tgt_info);
  3690			if (err)
  3691				continue;
  3692			ids[j++] = ids[i];
  3693		}
  3694	
  3695		link->nodes_cnt = j;
  3696	
> 3697		err = bpf_trampoline_multi_attach(prog, ids, link);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
