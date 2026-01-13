Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8118F34DCE3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323546; cv=none; b=rP4FkO29zt0ZZpWaByHp253ARQc1xIf4Vl/xJJrtIhS0jHZTeIcgUEOC7JjLlghMPFGpgTgvBrcCoQFNKBWJeRszGRr1cKmvtrwOwtnoVRf4W86BqYkdrEk+cOrOaQx0/WX/Nq9f442PM+MnFi8WhyDuqAx73WP4VrruHsPmLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323546; c=relaxed/simple;
	bh=dGFiPiX9oyqIbldoXASC+trXvPT6WEpWtDuTsmBJmK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaTPmVKhK94co4VFU7CAmUNxtLcfKt/9HMsk6I4JFU9kCWGFYId5DZhrhSgSnlC+ezhK3BRJNBlQHKFBhNOST+Pn204+QiknUnMDY0gG/4we03bLlzGB/JnXbdeQ+Gv1bMBsRkKPbMi5Xe2y86EvpHQUM0YAifSczAfKW6wYgBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+4IhIQj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+4IhIQj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c565b888dso6561073a91.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 08:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768323545; x=1768928345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFc7ba3Q+6rwdsqcpbP0+Kowu7y/5i77jGWTDXGB1zs=;
        b=d+4IhIQjEsz/sd9rzZ/ievXanT0po9CCMgzDEH6cwd55uw7ZTGBNRSYl07DGA/GUS3
         GA1uLspTffzAW0DLP2Ptck8q27LA19wPtjFxrJ6l4z9Mwye2BKzU+BxO0WyhWLnCQcLe
         Ye/VfM2chvwxBy8054ljyL5CPqBGMZ/evmMD9p6BuUyLDM3U5DaiJLQ4Jhy38oJaOkub
         Wpha65AsuH5kX5hjKI7FgNNti8YPiLainZm0pEPdJ5rdfXUeQCmJhjEYVl8TNIESMpg6
         /K5gPMBlEgwlSvI8d+MqD5yUnrwWMRMb+NdgBxgrfgRWD31pQCUpqy1htSwXiPp++1JY
         1aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323545; x=1768928345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PFc7ba3Q+6rwdsqcpbP0+Kowu7y/5i77jGWTDXGB1zs=;
        b=Lw+ZpU2LfHEQ9O9J1qBpJg3zPSfWIm0iu0OkTz5ykDW8teh8x7sKcukex5TnNMtNZH
         6bpHZPUeNxbU7KLQiogzwbpxi32mipPjR8BvO7VD1GtAWcSHSpV0/GVXbyaRXAfPZFzU
         TuiTy5jM+wZx47eFtrQi09tuLh4p4fx0f6d7hD4r9+ZKiD/msQ08Oy7zvsFBTkxM6GTM
         twUBL2AmO2sajRUZYDn3SZ894kga52wQyvKD62saasuOVufdnnFey1lWP9XDYW+e2gKt
         3heL4Tr6BhUAMdOA5jhIYa5DPRNJnH9SR9lLnGNMQJdEG/RFgFEBtRlVlBwJJByAzRNh
         +0dA==
X-Forwarded-Encrypted: i=1; AJvYcCXEli6hjHphDgQbA1SNY+Kv93dGdLiwfPF2/R22wrnxZCno24z+ae8MfG7OkdsFmUUkAGU0hz56/weC2GhE@lists.linux.dev
X-Gm-Message-State: AOJu0YznyBqS7Qcb+uvfigH/zmETXHENsCOFm0gdguKSYkVdlgk2RjNs
	ha7p8NdHcGjITp5wbrFeppd7i3RpRl/E0Tx1x4nPT7GThK6UlNRQUqO4mIdgBkdincPazw8Lwlf
	SPrh+tgYOApU/U83JWYHBM1UEP8UGzMI=
X-Gm-Gg: AY/fxX75zhthtG1SXRBoSd1GwCNUyO+yK5h0r7luK0VSqDhZrZBWsPvN6owLLKqpib/
	GVgFbW7gt0prxhQGoD5Xwt4X8sMsWlR2ALm4/hAO7xQflz0YtrZhuETgamM6+6MbOaeo8xXwJla
	DC2vS+Mqce4dl8TEYiUIwPimr3gb0+CgLhgYNoiNyF5CD4AGMWF6G+bX2kGr2JGd3wMu0xq4ANS
	CvmpSYZNyuz7jVrJMlKHjP8zoF0dtd4Os5u7kdX/DrBcT6WGbOc+bRQWTazvGS/D+kxRy0K/2wm
	ruIozm0zpyE=
X-Google-Smtp-Source: AGHT+IFPew82EwGZa361uBMLyM+mlCe5BXn/vPDOD1axYiZaYSYQ7bu2rg4mPqaIK5vpj+A8TfE2zjB3Qc7Xn6K806k=
X-Received: by 2002:a17:90b:1f8e:b0:341:8ac7:24d3 with SMTP id
 98e67ed59e1d1-34f68c7ff8emr19297950a91.34.1768323544830; Tue, 13 Jan 2026
 08:59:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601131740.6C3BdBaB-lkp@intel.com>
In-Reply-To: <202601131740.6C3BdBaB-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 13 Jan 2026 08:58:52 -0800
X-Gm-Features: AZwV_QjVLMlxOgnBM_7gyFF17Rh_T7vccR7D_JHPK4ZLbf87SAXnRZZCnsN6PFE
Message-ID: <CAEf4BzbSNo2MR9i-=_5tk3PV_QofSZM7_+0Ek7rqP3VjVt9e4Q@mail.gmail.com>
Subject: Re: kernel/trace/bpf_trace.c:3619:52: sparse: sparse: cast removes
 address space '__user' of expression
To: kernel test robot <lkp@intel.com>
Cc: Mykyta Yatsenko <yatsenko@meta.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 1:17=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> commit: a498ee7576de24b4b0916ce56cf2686e261a29f7 bpf: Implement dynptr co=
py kfuncs
> date:   8 months ago
> config: i386-randconfig-063-20260113 (https://download.01.org/0day-ci/arc=
hive/20260113/202601131740.6C3BdBaB-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260113/202601131740.6C3BdBaB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601131740.6C3BdBaB-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    kernel/trace/bpf_trace.c:835:41: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __user *[=
addressable] [assigned] [usertype] sival_ptr @@     got void * @@
>    kernel/trace/bpf_trace.c:835:41: sparse:     expected void [noderef] _=
_user *[addressable] [assigned] [usertype] sival_ptr
>    kernel/trace/bpf_trace.c:835:41: sparse:     got void *
> >> kernel/trace/bpf_trace.c:3619:52: sparse: sparse: cast removes address=
 space '__user' of expression
>    kernel/trace/bpf_trace.c:3633:56: sparse: sparse: cast removes address=
 space '__user' of expression
>    kernel/trace/bpf_trace.c:3647:52: sparse: sparse: cast removes address=
 space '__user' of expression
>    kernel/trace/bpf_trace.c:3654:56: sparse: sparse: cast removes address=
 space '__user' of expression
>    kernel/trace/bpf_trace.c:3662:52: sparse: sparse: cast removes address=
 space '__user' of expression
>    kernel/trace/bpf_trace.c:3670:56: sparse: sparse: cast removes address=
 space '__user' of expression

this is intentional, but what if we cast void __user * to long and
then to void *, would that go away? Mykyta, do you mind trying?

>    kernel/trace/bpf_trace.c: note: in included file (through include/linu=
x/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
>    include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in =
'uprobe_prog_run' - unexpected unlock
>
> vim +/__user +3619 kernel/trace/bpf_trace.c
>
>   3615
>   3616  __bpf_kfunc int bpf_probe_read_user_dynptr(struct bpf_dynptr *dpt=
r, u32 off,
>   3617                                             u32 size, const void _=
_user *unsafe_ptr__ign)
>   3618  {
> > 3619          return __bpf_dynptr_copy(dptr, off, size, (const void *)u=
nsafe_ptr__ign,
>   3620                                   copy_user_data_nofault, NULL);
>   3621  }
>   3622
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
