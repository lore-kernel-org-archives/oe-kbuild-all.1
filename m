Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3155D168A9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 19:46:13 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1bb7a1c2fe5so4538479fac.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 08 Aug 2023 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691523972; x=1692128772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KuQiWPsMzezA39YuUytzgBke/H6T7Lw4RPBi8dLsgA=;
        b=56/3BFdV+0rwUpOMoe531qh++L8MmFT1ipNBnSW8Xe8QNIXT7OVFGKaOg0Hr214itN
         ZMPJDVGf3yKENuno6lyzVe7IPKuYb82/Sr8hvy46/dIHfm4iZ4LxLVaaxoY9+3ixb5PP
         ukeucFJPAKftlQCmLUw30G2LdKS6KlKzDhMHAqE4B1dIRvGWKpFhBLP7cXgllYtl3Do9
         1/0IciTaTcMjaf3LcvAbmhMx/+h3XM0sgCQmZyKjh8uZSlf4ww3T4ETDdhsnFZPiTtyj
         KmGSNABwCu92WU12R68IIYRE29esfPQuN0PaCdpwm8rNH/XfvCOxOZEBxLkdOXISvFCI
         kdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691523972; x=1692128772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KuQiWPsMzezA39YuUytzgBke/H6T7Lw4RPBi8dLsgA=;
        b=KaF0IVTtvSOCVLSfayGpuX0IjbbjujJc8ZcSjHnw6Ei+iaTJdtMVWDBTCTAytzWTBz
         zBI4u+hNod1lZUMqRPjhLSNEJ0IffiV1pLxwhSNN/PTr4d3G97pVEYiwJfVQqBoE7MWZ
         Wi1PUWutothWXu7tZvRK2PIyDjz4Ikx9nHx2M8MXj+4fOHCNGANeR/nt7cPGfSwGVEEr
         R3V0/B4+5IMudd75pMCeblWKeSc6YGbhlO6d+z7Fkdf75OfZZ+l75VWPaJ+SxYWL6xRS
         kbRUgH4mCQsmfqrV8uGBNOeifelP0IocPEBIXShA9V8VEgqdoOU8+n28nGNc9mkY7KsO
         njWA==
X-Gm-Message-State: AOJu0YwS5CJpcNo3iXJBpsiGbSJwci8w0ShIWaUpoOxZ9jUOdHM1XA0g
	R475f03n7GupmPPBkzC+Tbbi62SgQ6/EQBIChTCADw==
X-Google-Smtp-Source: AGHT+IEvWYAo0QTg3GG3URcdRygFfW2mZOSxH7bMv/QiDMQKFQEFeTj6BymrA13gIhuMptvBR0owPOqjpwaiVZIOhqw=
X-Received: by 2002:a05:6870:b604:b0:1b3:977b:8201 with SMTP id
 cm4-20020a056870b60400b001b3977b8201mr756728oab.7.1691523971998; Tue, 08 Aug
 2023 12:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308090204.9yZffBWo-lkp@intel.com>
In-Reply-To: <202308090204.9yZffBWo-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Aug 2023 12:46:00 -0700
Message-ID: <CAKwvOd=c94gknBq7TUsQEyC095+1iRW540=xD3zRkf3+Q4vn5Q@mail.gmail.com>
Subject: Re: error: A dwo section may not contain relocations
To: kernel test robot <lkp@intel.com>, Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 12:02=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   02aee814d37c563e24b73bcd0f9cb608fbd403d4
> commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBU=
G_INFO selectable from a choice
> date:   1 year, 5 months ago
> config: riscv-randconfig-r001-20230808 (https://download.01.org/0day-ci/a=
rchive/20230809/202308090204.9yZffBWo-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git =
f28c006a5895fc0e329fe15fead81e37457cb1d1)

FWIW, I wasn't able to reproduce with the provided config and
clang-17.  Perhaps this is a bug for older clang releases (the bot
tested with clang-14).

> reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090204=
.9yZffBWo-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308090204.9yZffBWo-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
> >> error: A dwo section may not contain relocations
>    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
>    20 errors generated.
>    make[2]: *** [scripts/Makefile.build:288: arch/riscv/kernel/vdso/vgett=
imeofday.o] Error 1 shuffle=3D3686795728
>    make[2]: Target 'include/generated/vdso-offsets.h' not remade because =
of errors.
>    make[1]: *** [arch/riscv/Makefile:120: vdso_prepare] Error 2 shuffle=
=3D3686795728
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:219: __sub-make] Error 2 shuffle=3D3686795728
>    make: Target 'prepare' not remade because of errors.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Thanks,
~Nick Desaulniers
