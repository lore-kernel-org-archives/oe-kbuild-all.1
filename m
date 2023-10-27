Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2BFC2FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcF6gNXr"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so2705404a12.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698392829; x=1698997629; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3s+HmKQBO5YfN5uxNe8jCr2D05b202XxgDdt3GiR2tw=;
        b=JcF6gNXrWwjB4sap5hVt9D5GF8jMEgxXGKKWvI5zuQyrMwG4VS8JaffMvzGZdVCGqY
         pQL13+MlqGwFAMlaeSlq3RWyxh/yxxJT8HPwWooxU0OTdRZ8+6v4MDfqW1Z2kPUV1a46
         F6mh26l+GuvYYGx4p2JUYlDyNhN4141KYM7ofY5TQ8AwIwhwRnDd35klr+OsE9EFGrfk
         OPyvs9QEB1snKPHmwV2jofuLV7JfGDNsGjHiXg8mQW9JdIquYAWU45EFsrkHCkmXidje
         gVVmZnKLFH1yHk9VlA1z3oSViQH5clk4FKis972Nu/D7GK8Fva0OE5OuaiWqTtNULjE1
         R76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698392829; x=1698997629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3s+HmKQBO5YfN5uxNe8jCr2D05b202XxgDdt3GiR2tw=;
        b=l8eqqj/qL2iEI8wwAZz82TyguUkml+30+yQLfhA/t70KVaLgeAn8IKGZKcxvthGQKU
         nLDpfTNa/kU+wvWnPWB8Og2TolITl62ziTTKanMlp4gmUS5MDsxEAWLxUCuCpWtx0kC2
         uPiiQJI8dJMT5Ulamjj6u8E9naYrjHiDUsR8Kpo5QOzjO+r1F9eiNQHLn7bNIhoK6sdm
         79jwM6Yd+TKaL7Ua+99x9GrmFHNCFqg6fiEP5gcNdeYZxIbkRzPXHZ65nFRKiaHCenYt
         zP4P+Riuih5YUIIsaEFbkmsKgvOVlp3TYpcSKTgupPGFZ3LnI/FSGfeYykdBD0HDha2g
         cqpw==
X-Gm-Message-State: AOJu0YyDU8cC0y+/cDhbo/AY2QTLlwgbLrBEVyEI7A+kQtrIkpw6rXVC
	8AelW/etlPv9XbS3D5rFBj6T0DR1N/FCbexqKyo=
X-Google-Smtp-Source: AGHT+IF2EbroTERLNWDfIZy8UmyVaispBEdtqSni14/t1Q/S3VfJpxBhkKhxbpzhHHNeGhqRLGuOfwp2PBOarTDAPYQ=
X-Received: by 2002:aa7:c982:0:b0:53d:a727:3846 with SMTP id
 c2-20020aa7c982000000b0053da7273846mr1650215edt.20.1698392829471; Fri, 27 Oct
 2023 00:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310270909.QBAOkiZP-lkp@intel.com>
In-Reply-To: <202310270909.QBAOkiZP-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 27 Oct 2023 09:46:58 +0200
Message-ID: <CAFULd4YbDKr-R5GOS44q+e=1qJNJXgBbvJ_gy1hA8G1VxzgVrA@mail.gmail.com>
Subject: Re: [tip:x86/percpu 21/22] arch/x86/include/asm/processor.h:522:24:
 sparse: sparse: dereference of noderef expression
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>, Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 4:01=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/p=
ercpu
> head:   0548eb067ed664b93043e033295ca71e3e706245
> commit: ed2f752e0e0a21d941ca0ee539ef3d4cd576bc5e [21/22] x86/percpu: Intr=
oduce const-qualified const_pcpu_hot to micro-optimize code generation
> config: x86_64-randconfig-122-20231027 (https://download.01.org/0day-ci/a=
rchive/20231027/202310270909.QBAOkiZP-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231027/202310270909.QBAOkiZP-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310270909.QBAOkiZP-lkp=
@intel.com/

Already fixed in [1].

[1] https://lore.kernel.org/lkml/20231024142830.3226-1-ubizjak@gmail.com/

Thanks,
Uros.

>
> sparse warnings: (new ones prefixed by >>)
>    kernel/entry/common.c: note: in included file (through include/linux/s=
ched.h, include/linux/context_tracking.h):
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    kernel/entry/common.c: note: in included file (through arch/x86/includ=
e/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/threa=
d_info.h, ...):
> >> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference o=
f noderef expression
>    kernel/entry/common.c: note: in included file (through include/linux/s=
ched.h, include/linux/context_tracking.h):
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    kernel/entry/common.c: note: in included file (through arch/x86/includ=
e/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/threa=
d_info.h, ...):
> >> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference o=
f noderef expression
>    kernel/entry/common.c: note: in included file (through include/linux/s=
ched.h, include/linux/context_tracking.h):
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    kernel/entry/common.c: note: in included file (through arch/x86/includ=
e/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/threa=
d_info.h, ...):
> >> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference o=
f noderef expression
>    kernel/entry/common.c: note: in included file (through include/linux/s=
ched.h, include/linux/context_tracking.h):
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    kernel/entry/common.c: note: in included file (through arch/x86/includ=
e/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/threa=
d_info.h, ...):
> >> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference o=
f noderef expression
>    kernel/entry/common.c: note: in included file (through include/linux/s=
ched.h, include/linux/context_tracking.h):
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    kernel/entry/common.c: note: in included file (through arch/x86/includ=
e/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/threa=
d_info.h, ...):
> >> arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference o=
f noderef expression
>    kernel/entry/common.c: note: in included file (through include/linux/s=
ched.h, include/linux/context_tracking.h):
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>    arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of n=
oderef expression
>
> vim +522 arch/x86/include/asm/processor.h
>
>    513
>    514  static __always_inline unsigned long current_top_of_stack(void)
>    515  {
>    516          /*
>    517           *  We can't read directly from tss.sp0: sp0 on x86_32 is=
 special in
>    518           *  and around vm86 mode and sp0 on x86_64 is special bec=
ause of the
>    519           *  entry trampoline.
>    520           */
>    521          if (IS_ENABLED(CONFIG_USE_X86_SEG_SUPPORT))
>  > 522                  return pcpu_hot.top_of_stack;
>    523
>    524          return this_cpu_read_stable(pcpu_hot.top_of_stack);
>    525  }
>    526
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
