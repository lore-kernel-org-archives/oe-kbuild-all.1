Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06AC210EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d857c8a1d50so743872276.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 03:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697105478; x=1697710278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayB48oEye0wkJNGcHILedrEPe86Z+o0FK5cblcxwBu4=;
        b=ekdmBwcljf7PpxM9hqaFX67faquc3ts+z0D0NC1GEPTkgfBfHndVfxzHAzSVfRVrtR
         KrvjPMR+4qHjOB0lMiEqnXEbkzF8cSRg9mvc+JKC/gRf7+5jZUc4YrQ2WZtrd0Od2ZAK
         1IcIbrO/nIm/mRij3Q6MVO6ekgVjVmpyf5gyQqQ1Cuhk03gW4jvawJ69x0FPPXzgal4u
         qOFAkVz7z6+SJLBXGpIS51dGN9UOlUMkXQQqHImFY+SZRHQDCZV9jcZb5+ytYIvfMRq4
         zDdMF1w6/3zOtjCq1l+nf8hjTOf6nTijp8gPlzgTo4feGMx8Ycdw504CJFgkqE8i8k9O
         qvBg==
X-Gm-Message-State: AOJu0YydBViSR3uvSWcMkx05C5IQypGyG5HUATiafCZLeeRYWDT++UPD
	m+IwsXwig6bMRECpbJjOoBF9NmcqpZZ8yA==
X-Google-Smtp-Source: AGHT+IEr0d6HPYhCBPqyhsXqon8tBkXtMOg5H/kcM+D7Xh+IRmGNCef3WluzUMkJdvEP031suxojpw==
X-Received: by 2002:a25:fc1c:0:b0:d9a:4eb8:c2c5 with SMTP id v28-20020a25fc1c000000b00d9a4eb8c2c5mr556974ybd.36.1697105478589;
        Thu, 12 Oct 2023 03:11:18 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 142-20020a250b94000000b00d818ced8939sm36292ybl.1.2023.10.12.03.11.18
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 03:11:18 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d77ad095f13so739330276.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 03:11:18 -0700 (PDT)
X-Received: by 2002:a25:d345:0:b0:d9a:5d69:54b with SMTP id
 e66-20020a25d345000000b00d9a5d69054bmr7743541ybf.25.1697105477970; Thu, 12
 Oct 2023 03:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <707e5e6dd0db9a663cf443564d1f8ee1c10a0086.1697018818.git.geert+renesas@glider.be>
 <202310121404.FMC1T6FF-lkp@intel.com>
In-Reply-To: <202310121404.FMC1T6FF-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 12:11:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWszZnozVi7cj7SH4R0Cv1SD7KrLOwze2xwKULtOGzQCA@mail.gmail.com>
Message-ID: <CAMuHMdWszZnozVi7cj7SH4R0Cv1SD7KrLOwze2xwKULtOGzQCA@mail.gmail.com>
Subject: Re: [PATCH] sunrpc: Use no_printk() in dfprintk*() dummies
To: kernel test robot <lkp@intel.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, 
	Neil Brown <neilb@suse.de>, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Tom Talpey <tom@talpey.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, 
	Anna Schumaker <anna@kernel.org>, oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 9:09=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on trondmy-nfs/linux-next]
> [also build test ERROR on linus/master v6.6-rc5 next-20231011]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven=
/sunrpc-Use-no_printk-in-dfprintk-dummies/20231011-181013
> base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
> patch link:    https://lore.kernel.org/r/707e5e6dd0db9a663cf443564d1f8ee1=
c10a0086.1697018818.git.geert%2Brenesas%40glider.be
> patch subject: [PATCH] sunrpc: Use no_printk() in dfprintk*() dummies
> config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231012=
/202310121404.FMC1T6FF-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231012/202310121404.FMC1T6FF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310121404.FMC1T6FF-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from include/asm-generic/bug.h:22,
>                     from arch/alpha/include/asm/bug.h:23,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:13,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/alpha/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/slab.h:16,
>                     from fs/lockd/svclock.c:25:
>    fs/lockd/svclock.c: In function 'nlmsvc_lookup_block':
> >> fs/lockd/svclock.c:164:33: error: implicit declaration of function 'nl=
mdbg_cookie2a' [-Werror=3Dimplicit-function-declaration]
>      164 |                                 nlmdbg_cookie2a(&block->b_call=
->a_args.cookie));
>          |                                 ^~~~~~~~~~~~~~~
>    include/linux/printk.h:427:33: note: in definition of macro 'printk_in=
dex_wrap'
>      427 |                 _p_func(_fmt, ##__VA_ARGS__);                 =
          \
>          |                                 ^~~~~~~~~~~
>    include/linux/printk.h:129:17: note: in expansion of macro 'printk'
>      129 |                 printk(fmt, ##__VA_ARGS__);             \
>          |                 ^~~~~~
>    include/linux/sunrpc/debug.h:70:41: note: in expansion of macro 'no_pr=
intk'
>       70 | # define dfprintk(fac, fmt, ...)        no_printk(fmt, ##__VA_=
ARGS__)
>          |                                         ^~~~~~~~~
>    include/linux/sunrpc/debug.h:25:9: note: in expansion of macro 'dfprin=
tk'
>       25 |         dfprintk(FACILITY, fmt, ##__VA_ARGS__)
>          |         ^~~~~~~~
>    fs/lockd/svclock.c:160:17: note: in expansion of macro 'dprintk'
>      160 |                 dprintk("lockd: check f=3D%p pd=3D%d %Ld-%Ld t=
y=3D%d cookie=3D%s\n",
>          |                 ^~~~~~~
> >> fs/lockd/svclock.c:160:25: warning: format '%s' expects argument of ty=
pe 'char *', but argument 7 has type 'int' [-Wformat=3D]

Thanks already fixed in v2.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
