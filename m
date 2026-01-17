Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C45272E6A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 05:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768627532; cv=pass; b=DRodJJc3RR68shx2/4NTsjI7J8dkHp4WKyf4MGxO778SdIQ5Bf1dSXD/930MMuANgz6n74mEjzjmAZjFlou3DgvT7ZI8nB/f3Z1kJwPU9p9ZvsM92s2qs4ttF6ZrtZIoxL18mwvSGklAbKr/oH2MPLTogGrOkSac5qyihGoABk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768627532; c=relaxed/simple;
	bh=CZrcCirLycefoe4111ej2P5X3JWWdThJ4Lrv/DkUMtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iu1JuHTBDg/Qe2DPxketpytiBXWa5AUx5F2h8/HwSPl3H/IMfmPbzubVrsF9TMudG+62KBWHankgt1MbXQd01BGivTChmFJP5uWzfjXP6cKlYndZFfzbcYDEJ9f+A/r9q1Ua0XeWG+72Lh5+w8JOMgpq5zn71c/EYigRx/7izCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j6Sng7Pi; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j6Sng7Pi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0d06cfa93so22535ad.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 21:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768627530; cv=none;
        d=google.com; s=arc-20240605;
        b=SGWXA8zNlet2hX95xXUY8ce/y86l/1GL+P7y0wMrQlUrZXuwr2LdIYk+sDYUch5fnQ
         omj+0uWTOTpc/msnWbJARsm7PbV5qAq01pWRhl2BErx2uSKN8OmslftstxFUKiTaRb4b
         QNiMt6eUPenYwaw6K8dKJuB31PJY8acvtBAT74+uLGmV9dJlexhGz5u7DPvyYQ2AKrNG
         wcMQLK8aozVThQnQdK6I3ao5sFnQBFtl9z0hzcrM/lPTiM0Tfknnf9IfYVL4hBpc2YUp
         2yselhcQv9y7Zi+I5kOxKBQqdggdykocztPyGWcXAwuOKmWf2pps5HWaZBBje9GOxGP8
         TlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/fORF0SuEsYNu493Q/GuuLZlBKx1hUG12V1JDh57+A=;
        fh=uosD3uty3eiTfKbGtAts8o/9Agbo8wXln5U0CZ1yMrE=;
        b=EYjVO1x3yeXZ8+dsyhGNizALSx2uhCWWNOB60MLJ94qy1xb0+0Tr4UNt/W76twSYYR
         Ve0ctNeU95eXnxcw4MC6Apym56gKqQDZvMm2QUchgPKJX6YIa/NRs4o0/VbynGKuxWdq
         up1fkKEWQZlHeXo6JXcT1SFGtde+kVBEZi8Y2lkTPf37aUPuujRv/47gJIBNzSBauEGc
         Hqfu3w9rxDL1xdREn/xWoYRhTnzJSCMwdRc+ik3H1Xke1OUQnYW0QWlpOxksHusn6b8Q
         Ip5FIZWE6ruklwHGcSN4Vr+dkI4SSv5fahwWE9UF0fk6QZU+rfv24YpSRcONQvo/3bPv
         BI4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627530; x=1769232330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/fORF0SuEsYNu493Q/GuuLZlBKx1hUG12V1JDh57+A=;
        b=j6Sng7PirVoWzPQtztiefwrIV6YE7jcdjtm/y/CZbFudhHx83NYTyAwCSLF2WwNN9q
         wUXbFhSfjrZSFoVf+ctOwKmUzZiWbs7CvQyYCJTDL8JyMCjjrli38c925jKdHYs2ueTl
         glCfZrQr82FoAAEaN0YYAaXkelsZO/Cs+L0sCWeLdy1kU5juU/zWvx76Lgd3iPSmJjF5
         TU0OINozoB7XtivTugfcS5m0iUPVwcUbJPNxt30eoxo1PLOB6rE2Yevx6YypBpgnGlMk
         LCkjjJ6mz3bz/sc01jdqgiGpd3rkjitaH0MAm25HB4kX8pT8vGYPke/Wh/+jReNuy0qG
         bZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627530; x=1769232330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/fORF0SuEsYNu493Q/GuuLZlBKx1hUG12V1JDh57+A=;
        b=w7kQYEiwrr32brbUpyqDoLGq4eRy/Dt3MQi1Xm1o3CZ1mRFDhIaRwLb2XDvZRZaFVK
         OFxpZKgYwVdcHFyx98ipdGbnn+Q9p6Zw1AuSJkdgwn/vZTxmi/5H2oe8Lle64TqpcZWP
         QdDJWDDEK9E5ApZe3GfuGDNDAJm2JG4zKqGqmv1xW9kpGxE4xjRY4eAEthvvF97MzIQ5
         /g9A+lvNprn29aPpV6/E4RUuAxHoZwwo7Y23ZP+I/yxmpdbOJyvr2g/o2F25BdshmGGi
         55ntdCJd3VCllhNS06yqwQiTYpMOhrZwvqMO329ROabfV+swnwyFbc4fl9R3WrWbDZkj
         pabQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXBLXaLhDA6ILUF883BAy4aI7gfSo5txb8z27p9elM4t7zRncU50yG2M4MxQtpiFDfgZzx8ZZAzL7SuzWc@lists.linux.dev
X-Gm-Message-State: AOJu0YwAqijbGG25jUbtZOFxNZ6W8hzvE6C3FCaWbwbWbTJ1Ry4PQF+5
	KmpuGc0PnbqrMteHvcLKvwAUi1aQvGLVRgysSAZ/7NupVAwdBUslpfD4Se/a/0fird2BbwA6QII
	Cdlk2x1dkD9nu9s/kxgkdwKvqJbhv1RTGxu5b/TgZ
X-Gm-Gg: AY/fxX4EiPP9PiBC7UZKEk9xPhtoPvv3XlpNxGEb5ku9ttDLuzXRkiCQxoupK9dbbPv
	ciQ7TDFeMMV1p8tOsrA3JxQsUPMyAEls+M3Db6eR5KLTYVpgmrVuvqk4VcHkIgBJoxKkcQfhlf+
	HXS/W5am39FG+8UnrbKvKLXMtWcrgrlS+MwYWCMM0iTFiBD9iZthriQdEX69wpWKu4UonmBCllk
	ZKT5diYgjsIrghQecz9VK11ckFbX4KtJ/zY+lbpoXM77ZlczotJwk6qGN3ky+yBt06G4eVf
X-Received: by 2002:a17:902:f68f:b0:291:6858:ee60 with SMTP id
 d9443c01a7336-2a728625c1fmr1522885ad.4.1768627530115; Fri, 16 Jan 2026
 21:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601150001.sKSN644a-lkp@intel.com> <87v7h23cb0.ffs@tglx>
 <20260115211120.GD831050@noisy.programming.kicks-ass.net> <87ms2e32gw.ffs@tglx>
 <87jyxh3ike.ffs@tglx> <87ecnp2zh3.ffs@tglx>
In-Reply-To: <87ecnp2zh3.ffs@tglx>
From: Ian Rogers <irogers@google.com>
Date: Fri, 16 Jan 2026 21:25:19 -0800
X-Gm-Features: AZwV_QhEVYl23HHeAVdTKHizMscT0-PEjMEvGuOECAt3jKQ4Wf6AkWw_qkg8or0
Message-ID: <CAP-5=fUDQ6NTLWVfA2B+3022D6fZjvAksKH5EJ9Agnd1Qzvobw@mail.gmail.com>
Subject: Re: [PATCH] compiler: Use __typeof_unqual__() for __unqual_scalar_typeof()
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, sparse@chrisli.org, 
	linux-sparse@vger.kernel.org, Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 10:18=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> =
wrote:
>
> From: Peter Zijlstra <peterz@infradead.org>
>
> The recent changes to get_unaligned() resulted in a new sparse warning:
>
>    net/rds/ib_cm.c:96:35: sparse: sparse: incorrect type in argument 1 (d=
ifferent modifiers) @@     expected void * @@     got restricted __be64 con=
st * @@
>    net/rds/ib_cm.c:96:35: sparse:     expected void *
>    net/rds/ib_cm.c:96:35: sparse:     got restricted __be64 const *
>
> The updated get_unaligned_t() uses __unqual_scalar_typeof() to get an
> unqualified type. This works correctly for the compilers, but fails for
> sparse when the data type is __be64 (or any other __beNN variant).
>
> On sparse runs (C=3D[12]) __beNN types are annotated with
> __attribute__((bitwise)).
>
> That annotation allows sparse to detect incompatible operations on __beNN
> variables, but it also prevents sparse from evaluating the _Generic() in
> __unqual_scalar_typeof() and map __beNN to a unqualified scalar type, so =
it
> ends up with the default, i.e. the original qualified type of a 'const
> __beNN' pointer. That then ends up as the first pointer argument to
> builtin_memcpy(), which obviously causes the above sparse warnings.
>
> The sparse git tree supports typeof_unqual() now, which allows to use it
> instead of the _Generic() based __unqual_scalar_typeof(). With that spars=
e
> correctly evaluates the unqualified type and keeps the __beNN logic intac=
t.

Wow, that's painful. Congratulations on finding the root case.

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> The downside is that this requires a top of tree sparse build and an old
> sparse version will emit a metric ton of incomprehensible error messages
> before it dies with a segfault.
>
> Therefore implement a sanity check which validates that the checker is
> available and capable of handling typeof_unqual(). Emit a warning if not =
so
> the user can take informed action.
>
> [ tglx: Move the evaluation of USE_TYPEOF_UNQUAL to compiler_types.h so i=
t is
>         set before use and implement the sanity checker ]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601150001.sKSN644a-lkp@i=
ntel.com/
> ---
>  Makefile                       |    8 ++++++++
>  include/linux/compiler.h       |   10 ----------
>  include/linux/compiler_types.h |   11 +++++++++++
>  scripts/checker-valid.sh       |   19 +++++++++++++++++++
>  4 files changed, 38 insertions(+), 10 deletions(-)
>
> --- a/Makefile
> +++ b/Makefile
> @@ -1178,6 +1178,14 @@ ifdef CONFIG_CC_IS_CLANG
>  KBUILD_USERLDFLAGS +=3D --ld-path=3D$(LD)
>  endif
>
> +# Validate the checker is available and functional
> +ifneq ($(KBUILD_CHECKSRC), 0)
> +  ifneq ($(shell $(srctree)/scripts/checker-valid.sh $(CHECK)), 1)
> +    $(warning C=3D$(KBUILD_CHECKSRC) specified, but $(CHECK) is not avai=
lable or not up to date)
> +    KBUILD_CHECKSRC =3D 0
> +  endif
> +endif
> +
>  # make the checker run with the right architecture
>  CHECKFLAGS +=3D --arch=3D$(ARCH)
>
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -231,16 +231,6 @@ void ftrace_likely_update(struct ftrace_
>                                 "must be non-C-string (not NUL-terminated=
)")
>
>  /*
> - * Use __typeof_unqual__() when available.
> - *
> - * XXX: Remove test for __CHECKER__ once
> - * sparse learns about __typeof_unqual__().
> - */
> -#if CC_HAS_TYPEOF_UNQUAL && !defined(__CHECKER__)
> -# define USE_TYPEOF_UNQUAL 1
> -#endif
> -
> -/*
>   * Define TYPEOF_UNQUAL() to use __typeof_unqual__() as typeof
>   * operator when available, to return an unqualified type of the exp.
>   */
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -562,6 +562,13 @@ struct ftrace_likely_data {
>  #define asm_inline asm
>  #endif
>
> +/*
> + * Use __typeof_unqual__() when available.
> + */
> +#if CC_HAS_TYPEOF_UNQUAL || defined(__CHECKER__)
> +# define USE_TYPEOF_UNQUAL 1
> +#endif
> +
>  /* Are two types/vars the same type (ignoring qualifiers)? */
>  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
>
> @@ -569,6 +576,7 @@ struct ftrace_likely_data {
>   * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leavi=
ng
>   *                            non-scalar types unchanged.
>   */
> +#ifndef USE_TYPEOF_UNQUAL
>  /*
>   * Prefer C11 _Generic for better compile-times and simpler code. Note: =
'char'
>   * is not type-compatible with 'signed char', and we define a separate c=
ase.
> @@ -586,6 +594,9 @@ struct ftrace_likely_data {
>                          __scalar_type_to_expr_cases(long),             \
>                          __scalar_type_to_expr_cases(long long),        \
>                          default: (x)))
> +#else
> +#define __unqual_scalar_typeof(x) __typeof_unqual__(x)
> +#endif
>
>  /* Is this type a native word size -- useful for atomic operations */
>  #define __native_word(t) \
> --- /dev/null
> +++ b/scripts/checker-valid.sh
> @@ -0,0 +1,19 @@
> +#!/bin/sh -eu
> +# SPDX-License-Identifier: GPL-2.0
> +
> +[ ! -x "$(command -v "$1")" ] && exit 1
> +
> +tmp_file=3D$(mktemp)
> +trap "rm -f $tmp_file" EXIT
> +
> +cat << EOF >$tmp_file
> +static inline int u(const int *q)
> +{
> +       __typeof_unqual__(*q) v =3D *q;
> +       return v;
> +}
> +EOF
> +
> +# sparse happily exits with 0 on error so validate
> +# there is none on stderr. Use awk as grep is a pain with sh -e
> +$1 $tmp_file 2>&1 | awk -v c=3D1 '/error/{c=3D0}END{print c}'
