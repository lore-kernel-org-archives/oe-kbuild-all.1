Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A123B17DFF1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727629825; cv=none; b=V6OSJK4KE7yhnExPWvXQSDaL69yvmGUX2tQmyeH7DQaZS37isX0tkqF4QDx0k6CXIKIdd/DkxkiXrcg2e4iRNJwD0wL3XeX0yCy//UaCn3C6WlmSx9XWvpzwpIiR9Su9L5FmP03hhxx6kJsRGtmXuWnYAOHWN06KgWGy3TrpVs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727629825; c=relaxed/simple;
	bh=RupHcF2YMDtc5B0PvtdrFVxi7O2rIkLjnzwiVQ+8+is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPd651u7kZOBADL3HZwh9izL0pCaIbUsYQvEpwRhaonQoyrLkfLB1jIKBh+LNQ6w2G8ZhkVXUAk6ZpNnH/WYZQ/Bj4t56HaVuHdjTHSSOwvHvzdJvDCOONX5k6cky18D0QaTn+apKsOuRCBLgb//gdAYdu4tZbdXkn1eLNcXuSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ns8O4Q0L; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns8O4Q0L"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cd8972738so1371788f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727629822; x=1728234622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPGuySNzaGQqh50PPbKO6DCxB7qiiEF+rpBWLfkBod0=;
        b=Ns8O4Q0LEEl+iC2RxpECP7cp6iNOeuVrMAadP8EfbJw1vha9c1hxxCvQjMgtnrb0K9
         /oy+8/zORrUQyZvL481WUhTHF5Ru3XeKO3Rlml0eIa4Tq+GQsb/fGI/8Vpau456F6UYM
         myTKnrFcrd5JJt5jpUoa3IaE+FQow9yPftEdyZnQjHZWHcHIxN5xOhp38V+09dll7kWp
         c2YYSwaxKofhjsif2Ef291HRsuyPSsdMX5H+0u0TqalJcnXpYN0T/dAwzys4c9BteT9P
         6fZbVTgiHCw9eVsO23Xp5aH9pset+NloX6XqnG5lPy3mRhnGCH5FtP9AYvl7pYNG7krs
         5LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727629822; x=1728234622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPGuySNzaGQqh50PPbKO6DCxB7qiiEF+rpBWLfkBod0=;
        b=qCtbXWYs7SF6JZsipwrnL+zKiO1HfB6mJMwq6+QwBC1JNpMX6LnX/V4NQVFRLoo6ex
         0FR/wn4eXD/Z2yy2kaA7xYuzDTtF5u04XuQNtkuaHb5WX2FhCLiHCJQ+n/JBJyBS0Tdc
         38a4yqPFdJrWQwe1ucBWYwlGH7FUhMG/Qfy7LvLRMZO7rjd2160zkvh1pZOWRm5ZxqTV
         ePZGBQlYGbp+O6hWvzqDHrY3XONsGHRrk5SMM3fZQafH83W2mXrZFcS578gmp10/Yb1Q
         Mv9FEVL8jhFvpEOu4iX6BJ0dxhB7PE0tK0rWqBNfp6aBWRNqsMXvHZo5O2EkRQGCpR2d
         zDIA==
X-Forwarded-Encrypted: i=1; AJvYcCV9DzY2h/AEp9Q+r46ALFioPSGvqSU+rKBZzXyGFwoQMh7e2EJBVyM9mjRLtUSyHBcAQAIAO8AVGO2cs4HG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy60XoC7YZvhQdZGrycXmnMYVuF0t59ZGJuJ/2fCspu7cIdVUzg
	PgNv/B90/otHpv6RIVI57s+GCSfgk+4foRI1GtsDCIQ/q3fisOIRtxUwFhgeJh5GiOH377G9fMM
	n8gTuWKtfpIaikyYr88zfy4N/Guk=
X-Google-Smtp-Source: AGHT+IE71jalNcYCe9JkRHNkl+Yu72w6VOsAwtk1UKTuiSzkxtFzH0GmxCfEPUgvq5E6fy8k7JUsmPqLwFXNB4//0Uc=
X-Received: by 2002:adf:fd52:0:b0:37c:d0f9:58c with SMTP id
 ffacd0b85a97d-37cd5af2de1mr5588923f8f.35.1727629821884; Sun, 29 Sep 2024
 10:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409261116.risxWG3M-lkp@intel.com> <20240926072755.2007-1-eric.yan@oppo.com>
In-Reply-To: <20240926072755.2007-1-eric.yan@oppo.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 29 Sep 2024 10:10:10 -0700
Message-ID: <CAADnVQJ5xCsBg057gKOQOYA1+9pD-X86bjYJVrTbpRNstvW=DQ@mail.gmail.com>
Subject: Re: [PATCH v2] Add BPF Kernel Function bpf_ptrace_vprintk
To: Eric Yan <eric.yan@oppo.com>
Cc: kbuild test robot <lkp@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Hao Luo <haoluo@google.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Stanislav Fomichev <sdf@fomichev.me>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:28=E2=80=AFAM Eric Yan <eric.yan@oppo.com> wrote=
:
>
> add a kfunc 'bpf_ptrace_vprintk' printing bpf msg with trace_marker
> format requirement so that these msgs can be retrieved by android
> perfetto by default and well represented in perfetto UI.
>
> [testing prog]
> const volatile bool ptrace_enabled =3D true;
> extern int bpf_ptrace_vprintk(char *fmt, u32 fmt_size, const void *args, =
u32 args__sz) __ksym;
>
> ({                                    \
>     if (!ptrace_enabled) { \
>         bpf_printk(fmt, __VA_ARGS__);     \
>     } else {                              \
>         char __fmt[] =3D fmt;               \
>         _Pragma("GCC diagnostic push")    \
>         _Pragma("GCC diagnostic ignored \"-Wint-conversion\"")  \
>         u64 __params[] =3D { __VA_ARGS__ }; \
>         _Pragma("GCC diagnostic pop")     \
>         bpf_ptrace_vprintk(__fmt, sizeof(__fmt), __params, sizeof(__param=
s)); \
>     }                                  \
> })
>
> SEC("perf_event")
> int do_sample(struct bpf_perf_event_data *ctx)
> {
>         u64 ip =3D PT_REGS_IP(&ctx->regs);
>         u64 id =3D bpf_get_current_pid_tgid();
>         s32 pid =3D id >> 32;
>         s32 tid =3D id;
>         debug_printk("N|%d|BPRF-%d|BPRF:%llx", pid, tid, ip);
>         return 0;
> }
>
> [output]:
>        app-3151    [000] d.h1.  6059.904239: tracing_mark_write: N|2491|B=
PRF-3151|BPRF:58750d0eec
>
> Signed-off-by: Eric Yan <eric.yan@oppo.com>
> ---
>  kernel/bpf/helpers.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index 1a43d06eab28..1e37dae74ca6 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2521,6 +2521,39 @@ __bpf_kfunc struct task_struct *bpf_task_from_pid(=
s32 pid)
>         return p;
>  }
>
> +static noinline void tracing_mark_write(char *buf)
> +{
> +       trace_printk(buf);
> +}
> +
> +/* same as bpf_trace_vprintk, only with a trace_marker format requiremen=
t
> + * @fmt: Format string, e.g. <B|E|C|N>|<%d:pid>|<%s:TAG>...
> + */
> +__bpf_kfunc int bpf_ptrace_vprintk(char *fmt, u32 fmt_size, const void *=
args, u32 args__sz)
> +{
> +       struct bpf_bprintf_data data =3D {
> +               .get_bin_args   =3D true,
> +               .get_buf        =3D true,
> +       };
> +       int ret, num_args;
> +
> +       if (args__sz & 7 || args__sz > MAX_BPRINTF_VARARGS * 8 || (args__=
sz && !args))
> +               return -EINVAL;
> +       num_args =3D args__sz / 8;
> +
> +       ret =3D bpf_bprintf_prepare(fmt, fmt_size, args, num_args, &data)=
;
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args=
);
> +
> +       tracing_mark_write(data.buf);
> +
> +       bpf_bprintf_cleanup(&data);
> +
> +       return ret;
> +}
> +
>  /**
>   * bpf_dynptr_slice() - Obtain a read-only pointer to the dynptr data.
>   * @p: The dynptr whose data slice to retrieve
> @@ -3090,6 +3123,7 @@ BTF_ID_FLAGS(func, bpf_iter_bits_new, KF_ITER_NEW)
>  BTF_ID_FLAGS(func, bpf_iter_bits_next, KF_ITER_NEXT | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_iter_bits_destroy, KF_ITER_DESTROY)
>  BTF_ID_FLAGS(func, bpf_copy_from_user_str, KF_SLEEPABLE)
> +BTF_ID_FLAGS(func, bpf_ptrace_vprintk)
>  BTF_KFUNCS_END(common_btf_ids)

Why new kfunc?
Use bpf_snprintf() and follow with bpf_trace_printk() ?
