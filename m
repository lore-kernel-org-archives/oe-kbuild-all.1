Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A419F18C21
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 12:07:21 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59f55c276c3so41545937b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 05:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695643640; x=1696248440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFBEfegJ3qKvlKJFWO80BnWRWZIHZ0dmFMA8YWuzIyA=;
        b=UXtRh0VEpaP28kUbf1F5IbJT0CALRMw6iLlpG5n1X/cHev5PiDCga9HywhfEmDXaYZ
         Fzs3JdUdScIIAmnRHSN5WMhntdfqdk1tnNVtJC7erTe5opbWxNCRK8UYlEsCpO9YlZBL
         apwQMdo2f/qUNZExIyzToaxj21LwEpzw/j8E1uno2vSmgjQhNBQRV9UsK+L/7U0rnE8v
         fr+AEQCmimZkkJOqED5nSM8WPhvktiDCMfSsKhNqQEtde0tAU7TGMuOMy0BoGjbx2ixJ
         NiNe7y8YPl+2bB5JkYhSVYro4z8cJLj1yJxAGp5N5ro53tqISGe8gZGAW49YfIjYTvc/
         QR9A==
X-Gm-Message-State: AOJu0YzTJWra8sjpbDZrHUoIxn0hXZJ14b7sYbO86RsD3vshH2rjicTB
	xmeUAuB/JthbqhQB9jGt7MVKxmG5FA7+9Q==
X-Google-Smtp-Source: AGHT+IGR70nEavKIk4liml/RNC5tDZyUxi7PmNqndRPqRu6sw/LOyvdbjUab3m7Brj3N3+ZqU/7leA==
X-Received: by 2002:a81:4c02:0:b0:59f:7dbe:5492 with SMTP id z2-20020a814c02000000b0059f7dbe5492mr2900390ywa.9.1695643640264;
        Mon, 25 Sep 2023 05:07:20 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id o189-20020a0dccc6000000b00597f533cc64sm2368108ywd.9.2023.09.25.05.07.20
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 05:07:20 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d815a5eee40so6813319276.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 05:07:20 -0700 (PDT)
X-Received: by 2002:a25:ce53:0:b0:d77:8fd3:36e with SMTP id
 x80-20020a25ce53000000b00d778fd3036emr6855294ybe.20.1695643639909; Mon, 25
 Sep 2023 05:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309222350.hCUFrIQ1-lkp@intel.com>
In-Reply-To: <202309222350.hCUFrIQ1-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2023 14:07:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUn1n47=nV_WMe9Yx1aTzYgsDKoj_AuZUPoAH7gJpCuGw@mail.gmail.com>
Message-ID: <CAMuHMdUn1n47=nV_WMe9Yx1aTzYgsDKoj_AuZUPoAH7gJpCuGw@mail.gmail.com>
Subject: Re: {standard input}:1198: Error: value of ffffff6c too large for
 field of 1 byte at 00000533
To: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear robot,

On Fri, Sep 22, 2023 at 5:23=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
> commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make <li=
nux/export.h> independent of CONFIG_MODULES
> date:   9 weeks ago
> config: m68k-randconfig-r025-20230123 (https://download.01.org/0day-ci/ar=
chive/20230922/202309222350.hCUFrIQ1-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230922/202309222350.hCUFrIQ1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309222350.hCUFrIQ1-lkp=
@intel.com/

Thanks for your report!

> All errors (new ones prefixed by >>):
>
>    {standard input}: Assembler messages:
>    {standard input}:1198: Error: value -148 out of range
> >> {standard input}:1198: Error: value of ffffff6c too large for field of=
 1 byte at 00000533

Do you have more context (e.g. which source file is being compiled)?
Thanks!

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
