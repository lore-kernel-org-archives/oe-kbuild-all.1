Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4671C84D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730664; cv=none; b=IQ4VyCkpJeq10rQxYP0F/QjlqD3c5G2wQTU534oZ+f0as/v1CQsYToo64eEaP2KLOOmjK6CAIk/ZiHl/E6tafhPhtsv3Kx6Cnm/ARM6+7+LZd1o+UMSvU1vH3VAy1EtgUbTs0Vu67Xs+tt70LveIphrsXP0wy3gYc5LDb6kCTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730664; c=relaxed/simple;
	bh=4yirfiArGvOt1mMhemkppBm06qXjTVpsDAm/XITLvrk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fcwk0EhHFyrOxmMbggQBsF0TK59JC9LWG5BHjYblqmmpKmavwXvTHAkF+LgpZd39pbN5A2ESnMzHjbujd5zBqYEsb2nJeBtr9fI5K79vv3ftrN3FSbJrnd3Rvsq/PNAypEnV7XrZclqT3SSVhoNjD+G2jWMKYnnaKFzCTkdeoIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJg3Ik7O; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJg3Ik7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770730662; x=1802266662;
  h=date:from:to:cc:subject:message-id;
  bh=4yirfiArGvOt1mMhemkppBm06qXjTVpsDAm/XITLvrk=;
  b=MJg3Ik7O+OIoNN1ELuBqQssNHUzNed5g59AscctFvfmCyxptqWAziemm
   yg/qKNwhFmH6e/ynp19PeZ9BedJoDZXJvvUz5L1s+gE80KMiYKqJPd7SH
   JNVT55a4n3BIXgZCRFw4MFy5Fbn0abNtWyaD8gvCZIk9zJpNV8Zg4pmTh
   zpfvcTcvrfyG22VHESfpPHkSKiWPdBP+4v0RjxSwQG8bKYiFkzyZ89BFR
   0a5DFrfZ+aLFPTHgddJXO4rKYnyujqKIhghZw5h0RSxZR4bEH6Sw3guV4
   Gj85qXcZHIxDhu/E/PRxYNToSjIZ4pUQc9Fx7HvP4tLyNXYd7Jj2YNT+N
   A==;
X-CSE-ConnectionGUID: RiZFQhWxRleKKsR2uyeHxQ==
X-CSE-MsgGUID: zSOQ38hES/6rXj6o164JOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82495871"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82495871"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 05:37:42 -0800
X-CSE-ConnectionGUID: VNr73OB2SOSZlUSKctIATw==
X-CSE-MsgGUID: bxDYlth5R3C6pySgd/YBlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216258817"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2026 05:37:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpnvu-00000000p2i-32aJ;
	Tue, 10 Feb 2026 13:37:38 +0000
Date: Tue, 10 Feb 2026 21:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 7/12]
 kernel/trace/bpf_trace.c:3604:9: error: implicit declaration of function
 'bpf_trampoline_multi_detach'; did you mean 'bpf_tracing_multi_attach'?
Message-ID: <202602102108.B1Qa0iLN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   95bf1a3ff57efabf9b7c50b8a0d3583a6714f5d8
commit: f9c3bd532d93de85903acf5e9010bd5cf76ec697 [7/12] bpf: Add support to create tracing multi link
config: x86_64-randconfig-101-20260210 (https://download.01.org/0day-ci/archive/20260210/202602102108.B1Qa0iLN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602102108.B1Qa0iLN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602102108.B1Qa0iLN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/bpf_trace.c:8:
   include/linux/bpf.h:1551:51: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1551 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^~~~~~~~~~~~~~
   include/linux/bpf.h:1557:53: warning: 'struct bpf_tramp_link' declared inside parameter list will not be visible outside of this definition or declaration
    1557 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
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
>> kernel/trace/bpf_trace.c:3604:9: error: implicit declaration of function 'bpf_trampoline_multi_detach'; did you mean 'bpf_tracing_multi_attach'? [-Wimplicit-function-declaration]
    3604 |         bpf_trampoline_multi_detach(link->prog, tr_link);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         bpf_tracing_multi_attach
   kernel/trace/bpf_trace.c: In function 'bpf_tracing_multi_attach':
>> kernel/trace/bpf_trace.c:3679:15: error: implicit declaration of function 'bpf_trampoline_multi_attach'; did you mean 'bpf_tracing_multi_attach'? [-Wimplicit-function-declaration]
    3679 |         err = bpf_trampoline_multi_attach(prog, ids, link);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               bpf_tracing_multi_attach


vim +3604 kernel/trace/bpf_trace.c

  3598	
  3599	static void bpf_tracing_multi_link_release(struct bpf_link *link)
  3600	{
  3601		struct bpf_tracing_multi_link *tr_link =
  3602			container_of(link, struct bpf_tracing_multi_link, link);
  3603	
> 3604		bpf_trampoline_multi_detach(link->prog, tr_link);
  3605	}
  3606	
  3607	static void bpf_tracing_multi_link_dealloc(struct bpf_link *link)
  3608	{
  3609		struct bpf_tracing_multi_link *tr_link =
  3610			container_of(link, struct bpf_tracing_multi_link, link);
  3611	
  3612		kfree(tr_link);
  3613	}
  3614	
  3615	static void bpf_tracing_multi_link_show_fdinfo(const struct bpf_link *link,
  3616						       struct seq_file *seq)
  3617	{
  3618		struct bpf_tracing_multi_link *tr_link =
  3619			container_of(link, struct bpf_tracing_multi_link, link);
  3620	
  3621		seq_printf(seq, "attach_type:\t%d\n", tr_link->attach_type);
  3622	}
  3623	
  3624	static int bpf_tracing_multi_link_fill_link_info(const struct bpf_link *link,
  3625							 struct bpf_link_info *info)
  3626	{
  3627		struct bpf_tracing_multi_link *tr_link =
  3628			container_of(link, struct bpf_tracing_multi_link, link);
  3629	
  3630		info->tracing.attach_type = tr_link->attach_type;
  3631		return 0;
  3632	}
  3633	
  3634	static const struct bpf_link_ops bpf_tracing_multi_link_lops = {
  3635		.release = bpf_tracing_multi_link_release,
  3636		.dealloc = bpf_tracing_multi_link_dealloc,
  3637		.show_fdinfo = bpf_tracing_multi_link_show_fdinfo,
  3638		.fill_link_info = bpf_tracing_multi_link_fill_link_info,
  3639	};
  3640	
  3641	int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
  3642	{
  3643		struct bpf_tracing_multi_link *link = NULL;
  3644		struct bpf_link_primer link_primer;
  3645		u32 cnt, *ids = NULL;
  3646		u32 __user *uids;
  3647		int err;
  3648	
  3649		uids = u64_to_user_ptr(attr->link_create.tracing_multi.btf_ids);
  3650		cnt = attr->link_create.tracing_multi.btf_ids_cnt;
  3651	
  3652		if (!cnt || !uids)
  3653			return -EINVAL;
  3654	
  3655		ids = kvmalloc_array(cnt, sizeof(*ids), GFP_KERNEL);
  3656		if (!ids)
  3657			return -ENOMEM;
  3658	
  3659		if (copy_from_user(ids, uids, cnt * sizeof(*ids))) {
  3660			err = -EFAULT;
  3661			goto error;
  3662		}
  3663	
  3664		link = kzalloc(struct_size(link, nodes, cnt), GFP_KERNEL);
  3665		if (!link) {
  3666			err = -ENOMEM;
  3667			goto error;
  3668		}
  3669	
  3670		link->nodes_cnt = cnt;
  3671	
  3672		bpf_link_init(&link->link, BPF_LINK_TYPE_TRACING_MULTI,
  3673			      &bpf_tracing_multi_link_lops, prog, prog->expected_attach_type);
  3674	
  3675		err = bpf_link_prime(&link->link, &link_primer);
  3676		if (err)
  3677			goto error;
  3678	
> 3679		err = bpf_trampoline_multi_attach(prog, ids, link);
  3680		kvfree(ids);
  3681		if (err) {
  3682			bpf_link_cleanup(&link_primer);
  3683			return err;
  3684		}
  3685		return bpf_link_settle(&link_primer);
  3686	
  3687	error:
  3688		kvfree(ids);
  3689		kfree(link);
  3690		return err;
  3691	}
  3692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
