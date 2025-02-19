Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A44E15B971
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739957955; cv=none; b=TfOnn7FdF33ngZ4jUPLjuO49qILSAZlUh/qZ94k3hUWxgwxUwOtW4oe16hnJSMF6zQyKUEiJkeRE+ySUnyikDEk6nzv6Xc2fiSPM8fwzUf3qBfabQx0CpuSpJYbHDMDx9uQiObbQZ8nmsmlpyOEEGeRs05Mjs4fy/VeO3ay9JMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739957955; c=relaxed/simple;
	bh=7n3byoWOLZH4hHSvStFaAA7s//pAF2NCwrHj26g0pJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPvKi3yP9qUrzlIOz08PRSSqYu7xReYJjG+UFgmGJ/1P8LGAPUFY2U+LkWMx3fX2pegVZlLqFbhkPasDmEvGENqCFSV2XfI9AkjqdQiFl9sQN9elZN8ZY9slHQoEQRfsF0pBjAR1iLfFWOPkGjxc0njhmy0VRldV1v7H+QrRTbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=p14vvZnr; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="p14vvZnr"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so452541a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 01:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739957951; x=1740562751; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rO3mWpZ6atvQwdZjp+cx5fZvxrczwBMKiuKHh0d6V0=;
        b=p14vvZnrr8vPYA56dOEiKqByDrCGm7JfzmdhPiRp4AT8YKcWCVHFTFdXhD8ITnpnE/
         hv9oyukC1haYtCZHoX/iE/cAfRm14fDyoW41kTsrrHrLo4s1bzR/ZOWZh1h/3O2l+uUn
         0dMnmELZETJISyyJlWBds2sLsguXBM+kFWrKNGZA6i0fp1KQbID4VhGKSm/L3vko9zUF
         v/+U+zaTWDQqf5qm/Epo+JUxcZiD2Dm9xAakmayr7feOje73HaqMNI/V+O4tJHTm6I3B
         FO0S/uQHSWuMvhEUCHnAxo1vKcvLMyxOoMGxqOefQO5RzTyaXxB87MHmTiVKdQMmGo99
         rEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739957951; x=1740562751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rO3mWpZ6atvQwdZjp+cx5fZvxrczwBMKiuKHh0d6V0=;
        b=jbiT/oxbP8WGd9lgfwBfvOKTrdR55EZqv3aJ2FDaYEcjACFj6eLN9WbfZFpjPRgAoS
         /uRB4EPP7QW69RjeGvfnFJe2DsGjwb7mJWfILKztkh/zm+h1RPMy5XYOHDthEbys0lnw
         hhDqPiJ32CTIkvDkqfs+iYGNfw8bRfTNeBSiFDirVupI2v1WuGhd4+zXYo2lS4GNLfp7
         wh9gOlCySQbtDFpLCc2awPrVP7Xye43HmrRnkb1RvgXDiL19+zzsb7sJWbokHhYviXqb
         niD032rjdQ6SNTbe+wdQLJUUxGPHp3EUeZ+w5d3PG+8x7k5JahJyWeLbi6iKGae1qO38
         NWtw==
X-Forwarded-Encrypted: i=1; AJvYcCUaNlYJP+RA6Un025IRMGCc/9ND3ng3pYRh5jrjMWnSneX2qYHnbz81DRhVhCZWGg2/ApdcUlfI2i3Bdjyg@lists.linux.dev
X-Gm-Message-State: AOJu0Yypy9B5KJLuHxZJiyPgSFDtfDQNlQCLAvL0vDG3BfK/HmA+W6ci
	CLdjXirMabZMnNY4mSf4ER5l8zsYgqmRQ0/Mvi+8qWt8cJYSImHZG7RQ24RTma2Oj8JDkVDzhG3
	+f3UT1Rce5op2r4IkTlFdFs5D6TY8MrMfaVB1gw==
X-Gm-Gg: ASbGnctEc187tqmocaG/JHJQWt23eEGyWmKSfPpFH8F+EhDGSaM8ZRQyKrw29xymIR0
	qWuPkwknfYdww8NoVv631ympDZGAKPpT/eHwefx24XQ95l544fF4up5kKuWKjEqn+E17caboHin
	Yht6/dZqUg0C2/FI/dvUkIhDCTm10/ww==
X-Google-Smtp-Source: AGHT+IHsJPkqy2ZH0eBqOQBYv49B7MAogQUabnz25aTMM/icVm5CtPBAaDqCW0tcocx+So9EXZlbUQQd6JSX8vcsU7c=
X-Received: by 2002:a05:6402:1f4c:b0:5de:a6a8:5ebc with SMTP id
 4fb4d7f45d1cf-5e03601ed02mr17546166a12.3.1739957951353; Wed, 19 Feb 2025
 01:39:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502191201.7fARkW7m-lkp@intel.com>
In-Reply-To: <202502191201.7fARkW7m-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 19 Feb 2025 10:38:59 +0100
X-Gm-Features: AWEUYZkeyMz8uEHsOheH7MhhqDFksT--rRliut76KZwhuc1R84gECWqgTf1ewt0
Message-ID: <CAHVXubgqm=E2qm_EKtYX4m8WHmt8Fjj0CZqh3Qxio0x_0G5EjA@mail.gmail.com>
Subject: Re: [linux-next:master 3383/4377] include/linux/atomic/atomic-arch-fallback.h:4152:16:
 sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d
 becomes c001d00d)
To: kernel test robot <lkp@intel.com>
Cc: Andreas Schwab <schwab@suse.de>, oe-kbuild-all@lists.linux.dev, 
	Palmer Dabbelt <palmer@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 5:52=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
> commit: 1898300abf3508bca152e65b36cce5bf93d7e63e [3383/4377] riscv/atomic=
: Do proper sign extension also for unsigned in arch_cmpxchg
> config: riscv-randconfig-r111-20250219 (https://download.01.org/0day-ci/a=
rchive/20250219/202502191201.7fARkW7m-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce: (https://download.01.org/0day-ci/archive/20250219/202502191201=
.7fARkW7m-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502191201.7fARkW7m-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    lib/atomic64_test.c: note: in included file (through include/linux/ato=
mic.h):
> >> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: c=
ast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
>    include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: c=
ast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
>    include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: c=
ast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
>    include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: c=
ast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
> >> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: c=
ast truncates bits from constant value (faceabadf00df001 becomes f00df001)
>    include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: c=
ast truncates bits from constant value (faceabadf00df001 becomes f00df001)
>    include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: c=
ast truncates bits from constant value (faceabadf00df001 becomes f00df001)
>    include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: c=
ast truncates bits from constant value (faceabadf00df001 becomes f00df001)
>
> vim +4152 include/linux/atomic/atomic-arch-fallback.h
>
> 37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra=
 2020-01-24  4126
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4127  /**
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4128   * raw_atomic64_cmpxchg() - atomic compare and exchange =
with full ordering
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4129   * @v: pointer to atomic64_t
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4130   * @old: s64 value to compare with
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4131   * @new: s64 value to assign
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4132   *
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4133   * If (@v =3D=3D @old), atomically updates @v to @new wi=
th full ordering.
> 6dfee110c6cc7a include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2024-02-09  4134   * Otherwise, @v is not modified and relaxed ordering is=
 provided.
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4135   *
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4136   * Safe to use in noinstr code; prefer atomic64_cmpxchg(=
) elsewhere.
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4137   *
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4138   * Return: The original value of @v.
> ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4139   */
> 37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra=
 2020-01-24  4140  static __always_inline s64
> 9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4141  raw_atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
> 37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra=
 2020-01-24  4142  {
> 1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4143  #if defined(arch_atomic64_cmpxchg)
> 1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4144      return arch_atomic64_cmpxchg(v, old, new);
> 1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4145  #elif defined(arch_atomic64_cmpxchg_relaxed)
> 37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra=
 2020-01-24  4146      s64 ret;
> 37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra=
 2020-01-24  4147      __atomic_pre_full_fence();
> 9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4148      ret =3D arch_atomic64_cmpxchg_relaxed(v, old, new);
> 37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra=
 2020-01-24  4149      __atomic_post_full_fence();
> 37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra=
 2020-01-24  4150      return ret;
> 9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4151  #else
> 9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05 @4152      return raw_cmpxchg(&v->counter, old, new);
> d12157efc8e083 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4153  #endif
> 1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4154  }
> d12157efc8e083 include/linux/atomic/atomic-arch-fallback.h Mark Rutland  =
 2023-06-05  4155
>
> :::::: The code at line 4152 was first introduced by commit
> :::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: =
restructure fallback ifdeffery
>
> :::::: TO: Mark Rutland <mark.rutland@arm.com>
> :::::: CC: Peter Zijlstra <peterz@infradead.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I don't get it, everything here is 64-bit and commit "riscv/atomic: Do
proper sign extension also for unsigned in arch_cmpxchg" introduced a
cast *only* for 32-bit values.  Could that be a false-positive?

Thanks,

Alex
