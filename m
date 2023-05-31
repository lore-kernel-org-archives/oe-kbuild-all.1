Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A42AD5F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 08:05:20 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-3f83114e0c6so23707901cf.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 01:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685520318; x=1688112318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxrLCY7viWKO0bQukw/w0leEI6ByM9jS8ud+syXrPAA=;
        b=CGj8Wd7gGK75Wpa9d2zfJi0AKefCJ3pZivGwTnoRdx9JWAQTChZ4J6NWlRgeIUqJKG
         g2Cq2xaxg2NUztlfcySCR1tyqEiQKs15nizfNnwSL/jcw9qrnkOR0TyVxxskhHiwZmrV
         smSOGyQ6IXsGH1ClJR7E3Du0mHADV8NmYE3GgupSuo1Ul2GaftNARfkK5lol6oZD79NW
         hGjq8BKzVBI/TmhE9XfYn8OhMP6snj3WvwZ72PbubeyXk/yP4HQoujsZJ6ewQtTFYFIW
         xHMxYbhtPxowOuXnSba0olSY5ffBR9ibFruaQaQZdKx4nVNwhmhDIL5c8tGyLDo9FhuS
         03eA==
X-Gm-Message-State: AC+VfDyc1FoYvS/x+fX5UWL4y0gzeuL7Ms32iJ+Te3QJHSXufw5hsS+t
	k6f/kM38oGDOsm2Dq+lUoUwHZs4lGcERSg==
X-Google-Smtp-Source: ACHHUZ5sUy3Kz5Xnv8noq8cMGQp6F7gnl92olKf+YEsXN7wNQ0HQh0BxfH/RkKF1c8TOPoUAbxENgA==
X-Received: by 2002:a05:622a:210:b0:3e4:e2ce:526f with SMTP id b16-20020a05622a021000b003e4e2ce526fmr5380104qtx.39.1685520318491;
        Wed, 31 May 2023 01:05:18 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id o76-20020a25734f000000b00b9e73d0dba5sm4098109ybc.47.2023.05.31.01.05.16
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 01:05:17 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-561c1436c75so78665197b3.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 01:05:16 -0700 (PDT)
X-Received: by 2002:a0d:ccd3:0:b0:561:e89d:e263 with SMTP id
 o202-20020a0dccd3000000b00561e89de263mr4627466ywd.52.1685520316792; Wed, 31
 May 2023 01:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230530164004.986750-1-azeemshaikh38@gmail.com>
 <202305311135.zGMT1gYR-lkp@intel.com> <09A0C6FA-669F-4B73-9620-43AEA17E5D0C@kernel.org>
 <103925562.158061.1685514200368.JavaMail.zimbra@nod.at>
In-Reply-To: <103925562.158061.1685514200368.JavaMail.zimbra@nod.at>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 May 2023 10:05:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU70uRxnMNb8KCJe8M3BRPPxowRXtj+POcrh+KLkfQyAA@mail.gmail.com>
Message-ID: <CAMuHMdU70uRxnMNb8KCJe8M3BRPPxowRXtj+POcrh+KLkfQyAA@mail.gmail.com>
Subject: Re: [PATCH] uml: Replace all non-returning strlcpy with strscpy
To: Richard Weinberger <richard@nod.at>
Cc: Kees Cook <kees@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>, 
	kernel test robot <lkp@intel.com>, Maxim Krasnyansky <maxk@qti.qualcomm.com>, 
	oe-kbuild-all <oe-kbuild-all@lists.linux.dev>, linux-hardening@vger.kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-um <linux-um@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 8:23=E2=80=AFAM Richard Weinberger <richard@nod.at>=
 wrote:
> ----- Urspr=C3=BCngliche Mail -----
> >>>> arch/um/os-Linux/drivers/tuntap_user.c:149:17: error: implicit decla=
ration of
> >>>> function 'strscpy'; did you mean 'strncpy'?
> >>>> [-Werror=3Dimplicit-function-declaration]
> >>     149 |                 strscpy(ifr.ifr_name, pri->dev_name,
> >>     sizeof(ifr.ifr_name));
> >>         |                 ^~~~~~~
> >>         |                 strncpy
> >>   cc1: some warnings being treated as errors
> >
> > Ah, yeah, this is another "not actually in the kernel" cases. Let's ign=
ore this
> > strlcpy for now.
>
> Well, actually it's another case of "not even compile tested". :-(

"But the AI said it was correct?!?" ;-)

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
