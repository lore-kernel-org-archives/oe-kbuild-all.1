Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A5B13ADC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 16:01:50 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-63ce8bea776so33469506d6.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 08 Aug 2023 09:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691510510; x=1692115310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SVrz+NVnSrV/fLNgs83Potq7jZtIyWv2wx5nvF6Lpk=;
        b=wsIgw4ttZUc2vvn2tUt++rZEm50ULJebTCU/roVp/5gOMExAdK5YJUbFsyMFKAUtj/
         sr7CZ18c5XSrJK4tPJJbP6Kb20ZUlQj/Cc9jH+WdEWSp0tlUSPulflq3S3Zfd2Cp6gZv
         BRryW682w6jq2nH7wDUUO+5FPFTKvwSOXupphetV0nv90l4FpNzkOwz3cCp6vyhv1V+u
         t4wcmyk/N6PwdmGIAEOIWHTOf3T6hAfh+bDOgVs7IdgDFIKpGV1rfn7gcGpFUKCCyuEL
         I3fM8Kg75g229/2XxbmG5oQKnX/KZ2rJrHsG7nE34vt5cj4kTkXW+5cIyQ5Fqx8lH8ha
         ++rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510510; x=1692115310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SVrz+NVnSrV/fLNgs83Potq7jZtIyWv2wx5nvF6Lpk=;
        b=RjLfLWTxcdRJUrKpuP6oZQogMKohFsBnB49bmgHNCf54aHXf6Sd8r4pZaNyfAt7MuW
         Jq97+cPAsD+CABuUx/Jq3z83RqNL0jeQA+cCCzCCv4E79iD95/k9AW0PvFvPtijhdyNL
         bQBv8bmcHuk4DeKof8S9XWYCuzZreP6dPXRroIsfxKA8W84fYx6wKSaPrjWwYGXXOma0
         JJVc6pvnKwltOYZUmKpjeCOFFuCM3gLT17SpU6Iahj0Er1itF3SXJB7Uf6K2l9908dBg
         5SYr1sOYovPZnaoWq9TcUv+tOl/0ETDbN2LsAiSaro3RiOpxMRAHwyFE5Tb8+51Kltgt
         Eu9w==
X-Gm-Message-State: AOJu0YwXqJm2ZVWo78VSuRiAKeBoUzbofy8sx3r3eqXRDrM7q2qmg9Xa
	blEmsl9UjmKOlGJ/C0jTdBthnSs2mm36faAPuM8VQ2IfyCGq6uLs28cigg==
X-Google-Smtp-Source: AGHT+IEWL1NjJ+f3UbcEnHpd+p9HtzfqD1pbPZcbHwcCifQ34YXnu5z/ZhJnwwwJtLOgDxMScUlGimbd5BfqxWBRgII=
X-Received: by 2002:a0c:edca:0:b0:631:f9ad:1d43 with SMTP id
 i10-20020a0cedca000000b00631f9ad1d43mr9972971qvr.14.1691510509757; Tue, 08
 Aug 2023 09:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807-missing_proto-v2-1-3ae2e188bb0c@google.com> <202308081508.EI3CRzQo-lkp@intel.com>
In-Reply-To: <202308081508.EI3CRzQo-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Aug 2023 09:01:38 -0700
Message-ID: <CAKwvOdnDEaZt-mD2PvMDmCY1WyaqtrH+oM3M5JgZaiOOWA_0YQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.extrawarn: enable -Wmissing-variable-declarations
 for W=1
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	kernel test robot <lkp@intel.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 1:03=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Nick,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 52a93d39b17dc7eb98b6aa3edb93943248e03b2f]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Desaulniers/M=
akefile-extrawarn-enable-Wmissing-variable-declarations-for-W-1/20230808-00=
5859
> base:   52a93d39b17dc7eb98b6aa3edb93943248e03b2f
> patch link:    https://lore.kernel.org/r/20230807-missing_proto-v2-1-3ae2=
e188bb0c%40google.com
> patch subject: [PATCH v2] Makefile.extrawarn: enable -Wmissing-variable-d=
eclarations for W=3D1
> config: arm64-randconfig-r013-20230807 (https://download.01.org/0day-ci/a=
rchive/20230808/202308081508.EI3CRzQo-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081508=
.EI3CRzQo-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308081508.EI3CRzQo-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from lib/test_bitops.c:9:
>    In file included from include/linux/module.h:13:
>    In file included from include/linux/stat.h:19:
>    In file included from include/linux/time.h:60:
>    In file included from include/linux/time32.h:13:
>    In file included from include/linux/timex.h:67:
>    In file included from arch/arm64/include/asm/timex.h:8:
>    In file included from arch/arm64/include/asm/arch_timer.h:18:
>    In file included from include/linux/smp.h:110:
>    In file included from include/linux/preempt.h:79:
>    In file included from arch/arm64/include/asm/preempt.h:6:
>    In file included from include/linux/thread_info.h:60:
>    In file included from arch/arm64/include/asm/thread_info.h:18:
> >> arch/arm64/include/asm/stack_pointer.h:8:24: error: no previous extern=
 declaration for non-static variable 'current_stack_pointer' [-Werror,-Wmis=
sing-variable-declarations]
>        8 | register unsigned long current_stack_pointer asm ("sp");
>          |                        ^
>    arch/arm64/include/asm/stack_pointer.h:8:10: note: declare 'static' if=
 the variable is not intended to be used outside of this translation unit
>        8 | register unsigned long current_stack_pointer asm ("sp");
>          |          ^

I actually don't think that either compiler should warn for variables
with register storage.  I spoke briefly with some GCC folks on IRC and
the initial assesment was agreed.  I've filed
- https://github.com/llvm/llvm-project/issues/64509
- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D110947

Also, I've received 3 emails from zero day; this is expected as the
tree is not W=3D1 clean (actually, I think Arnd has been a lot of
cleanup around these groups of warnings, so I take that back).  What's
more curious to me is that none are GCC builds. I wonder if 0day bot
team is only testing W=3D1 with clang and not GCC?  That would seem like
perhaps the bar is higher for LLVM?

Masahiro, Nathan,
What are your thoughts on how to proceed here? Do we need the tree to
be free of warnings before it can be added to W=3D1? Hopefully not; I
would think that's the criteria for promoting a warning from being
hidden behind W=3D1 to being on by default in the top level Makefile.
What are your thoughts?

>    1 error generated.
>
>
> vim +/current_stack_pointer +8 arch/arm64/include/asm/stack_pointer.h
>
> a9ea0017ebe888 Mark Rutland 2016-11-03  4
> a9ea0017ebe888 Mark Rutland 2016-11-03  5  /*
> a9ea0017ebe888 Mark Rutland 2016-11-03  6   * how to get the current stac=
k pointer from C
> a9ea0017ebe888 Mark Rutland 2016-11-03  7   */
> a9ea0017ebe888 Mark Rutland 2016-11-03 @8  register unsigned long current=
_stack_pointer asm ("sp");
> a9ea0017ebe888 Mark Rutland 2016-11-03  9
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Thanks,
~Nick Desaulniers
