Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBE4146D55
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730546316; cv=none; b=JGqVVF+5vGFvrQuUN9zjdBY5iqN6hSUNL+6pr605bbdPSbVnE5iku0AJqDVSrlyAkEJHtd1werKesnxQDDavNHqEW9JWkE0NpVIq/ddAv9QvHjFQjBQigWsttJ5mGU0NnOERVFGoGuUKUQmcDkiSv1Uk6UX63SZXJdCcQaiqsBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730546316; c=relaxed/simple;
	bh=17rd3wem0q19+RB3hvbd2/iJ4fyQS1DOuV12Mgwp7Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cnhyzq1JrflJ7hdVTdU2q47iu61fo/qCUt2RZALKT6pwySEnagyQpKa9p0+GvupbWPs4HNQxbwaGbfFEUA3N5nGOuQNtJ2hWtJUxpRXa7rou+bb6Tj26VpJevTRv/JnlyDqOxrZZ/N6jB4rRqkPRRV9LkZRUeksG+UHX9oc4Qr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTS95GD8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTS95GD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730546315; x=1762082315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=17rd3wem0q19+RB3hvbd2/iJ4fyQS1DOuV12Mgwp7Rc=;
  b=kTS95GD8X0Ouve1tGywn+Sqcb6mfo4TiQlyMcK/3wopiL22HzgLLAqwK
   asylLH4OJaCwn9HwxmCjjZVgsJYDxFRfA/1LyxyiWs891962CTcBxEfU8
   GN7zH85W6yTT5yO4I0bmw+yLLbngc+juTq2v7UbwNVL2rXaPsm/vA//WQ
   TpLnUDSLDIVaAPbWCNjope/ke5QmP1E37G4vDN5VlrV2Ei1jcWFVvv5kA
   ulEjCadbOKm71JIOTUSDbZRJajt6fpEh+pLJbRGVHSkZ6820w4UwIcBVk
   5am02cgSnPIQfHR5Y8uadEDs3Fv64Jetf22QNSUXiDEM0rkVCVpckH5eA
   w==;
X-CSE-ConnectionGUID: wEfvr7ORQFyzlwZGCtQhAg==
X-CSE-MsgGUID: ZOgPoIyBQQuoU9UIjjfXjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55692221"
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="55692221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 04:18:33 -0700
X-CSE-ConnectionGUID: p8mZYHdiRki4kb0Bc/VHbg==
X-CSE-MsgGUID: b5IiUq4ZRfGEdU2dXSNDrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="82869886"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2024 04:18:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7C9G-000iph-1F;
	Sat, 02 Nov 2024 11:18:30 +0000
Date: Sat, 2 Nov 2024 19:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 trace/for-next 3/3] bpf: ensure RCU Tasks Trace GP for
 sleepable raw tracepoint BPF links
Message-ID: <202411021909.1X7zkKD6-lkp@intel.com>
References: <20241101181754.782341-3-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101181754.782341-3-andrii@kernel.org>

Hi Andrii,

kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-decouple-BPF-link-attach-hook-and-BPF-program-sleepable-semantics/20241102-022026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20241101181754.782341-3-andrii%40kernel.org
patch subject: [PATCH v2 trace/for-next 3/3] bpf: ensure RCU Tasks Trace GP for sleepable raw tracepoint BPF links
config: arm-imx_v6_v7_defconfig (https://download.01.org/0day-ci/archive/20241102/202411021909.1X7zkKD6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021909.1X7zkKD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021909.1X7zkKD6-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_raw_tp_link_attach':
>> kernel/bpf/syscall.c:3866:33: error: implicit declaration of function 'tracepoint_is_faultable' [-Werror=implicit-function-declaration]
    3866 |                                 tracepoint_is_faultable(btp->tp));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/tracepoint_is_faultable +3866 kernel/bpf/syscall.c

  3818	
  3819	static int bpf_raw_tp_link_attach(struct bpf_prog *prog,
  3820					  const char __user *user_tp_name, u64 cookie)
  3821	{
  3822		struct bpf_link_primer link_primer;
  3823		struct bpf_raw_tp_link *link;
  3824		struct bpf_raw_event_map *btp;
  3825		const char *tp_name;
  3826		char buf[128];
  3827		int err;
  3828	
  3829		switch (prog->type) {
  3830		case BPF_PROG_TYPE_TRACING:
  3831		case BPF_PROG_TYPE_EXT:
  3832		case BPF_PROG_TYPE_LSM:
  3833			if (user_tp_name)
  3834				/* The attach point for this category of programs
  3835				 * should be specified via btf_id during program load.
  3836				 */
  3837				return -EINVAL;
  3838			if (prog->type == BPF_PROG_TYPE_TRACING &&
  3839			    prog->expected_attach_type == BPF_TRACE_RAW_TP) {
  3840				tp_name = prog->aux->attach_func_name;
  3841				break;
  3842			}
  3843			return bpf_tracing_prog_attach(prog, 0, 0, 0);
  3844		case BPF_PROG_TYPE_RAW_TRACEPOINT:
  3845		case BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE:
  3846			if (strncpy_from_user(buf, user_tp_name, sizeof(buf) - 1) < 0)
  3847				return -EFAULT;
  3848			buf[sizeof(buf) - 1] = 0;
  3849			tp_name = buf;
  3850			break;
  3851		default:
  3852			return -EINVAL;
  3853		}
  3854	
  3855		btp = bpf_get_raw_tracepoint(tp_name);
  3856		if (!btp)
  3857			return -ENOENT;
  3858	
  3859		link = kzalloc(sizeof(*link), GFP_USER);
  3860		if (!link) {
  3861			err = -ENOMEM;
  3862			goto out_put_btp;
  3863		}
  3864		bpf_link_init_sleepable(&link->link, BPF_LINK_TYPE_RAW_TRACEPOINT,
  3865					&bpf_raw_tp_link_lops, prog,
> 3866					tracepoint_is_faultable(btp->tp));
  3867		link->btp = btp;
  3868		link->cookie = cookie;
  3869	
  3870		err = bpf_link_prime(&link->link, &link_primer);
  3871		if (err) {
  3872			kfree(link);
  3873			goto out_put_btp;
  3874		}
  3875	
  3876		err = bpf_probe_register(link->btp, link);
  3877		if (err) {
  3878			bpf_link_cleanup(&link_primer);
  3879			goto out_put_btp;
  3880		}
  3881	
  3882		return bpf_link_settle(&link_primer);
  3883	
  3884	out_put_btp:
  3885		bpf_put_raw_tracepoint(btp);
  3886		return err;
  3887	}
  3888	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
