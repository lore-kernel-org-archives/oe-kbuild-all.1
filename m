Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A493580604
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 14:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345996; cv=none; b=R/alfBx34ynD0PdAeH+HXwcR5c1sIEXM2/7mnRSu4QwkSKEgzsSxgp76MBFumT7YXggI1sEKYtdTynb4e7PDDOJTZsdZv+3iZRYGk8hY7EPDUTqxTyOIT5nCIjVsjia+m1LC0RNXzHtChEbtiUFkNSvWSBVuwRLQ8SQ0/TN6voM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345996; c=relaxed/simple;
	bh=ez3+HrLfVutu5Mm5304q+PpzenkT3+5qXxkhnae7xTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bG/ZqLV/UeltU0T3grEGhCyOFZeWDskJawBK96vbQCmp9c/UokOzcM2zdtPniE8LOleLG+Rx4QsmbuFQeioHAt/FHhC1ERsP/vSm7SooxZpZ50m2jDsQ0HRJb4UeqbO6S8i47SzTmtMVwQuNZEcHSz+smaK4xgthCTsEocdV09A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5160f80e652so4590507e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Jan 2025 06:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345991; x=1736950791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLqxPrKY1TOV+euKVeE/94FdmePkGlHZLqqcrwE2XJg=;
        b=l4hYrV4Z80wcSjf40sTUiap9HZ5Y/VSqaZxQEJ1eRk8AYPSel8AkA0cgHgUv/PBBdd
         buM8IbCRwQf/I5hHK8M9ObxTPFr97+FyHNbmpFOq5QvTdZwQdZvvxTsbGyGl6zEO/Ue+
         NUjA/FhfzTVqnES7h8uaroGhKarFx+6APqG9CYCA9sF846PHpNxL05GEVC1hM4NCtaTT
         22BmqyeRKZPN4PR62aDLYVmdmULTmmw64L3BqmwLV7/JKC8gjHsESpZsUdNer38qzpXq
         1zoZ2JXBMHVQi5ztoOF6HtOTghQdldX8HvxvRXTU7eav+Mq7FX3xN0jso+RzFx9IWcxi
         GXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd7PhffGqDnuytVa6P+xxC01WZv0hkVApmutG+2MjTDwQ0ddxaS3LimmK9wyP9Cs11C50deMfyKiT8JDMJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwUxO6VERIjgr9kqg3cSUwhItQXVs2YLvN4JLv49RmkazkXzVT0
	uIuKmZ4fsBl8/vQIs+jtl9TQOh1/A9i9ikNc9OsRoqaP00wHpScxS9G8uSlg
X-Gm-Gg: ASbGncsAuBPt3TDMc4SJV8rprIhjJhzziu9e3WeBBmhp9bm2XY2M0nV28YOIY7MHznW
	NknYQJ8wXsthj+VcpbW39CayIi9KtlUyKLxSQ09TL8iTplGe5QUoWA0MRA24nP+UeKqDhobzinc
	RhEujMvnNqKUNsbkO44PScRlNeJn6RmzWhbMLOfH40toG3nQheCzEWWiF5twMZx17x15pmRgCzJ
	5C9BX6AQEem3h2kYlyJLNLJAk3a1yusgX3w9hT7lcc/dTPE2efT7LES/H0Gc7W9w53bPLPonJN0
	eSOi2rQaax0lp4VPegE=
X-Google-Smtp-Source: AGHT+IEAdqAB/uPL+cZE8Q9ZGcdukT39/QDjb9tcF0LYBQkosdh+VxEHyMW8eRB/dvmBxopVJBKqgw==
X-Received: by 2002:a05:6122:2008:b0:517:83d1:d448 with SMTP id 71dfb90a1353d-51c6c2b9570mr1741798e0c.0.1736345991365;
        Wed, 08 Jan 2025 06:19:51 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68b7d5d7sm4946699e0c.7.2025.01.08.06.19.50
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:19:50 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so5298358137.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Jan 2025 06:19:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1lcaFgppwS9jvB1Xb5L/kjvcE21pw/ZXSMU3bgjX24fKTGMLA4mZF73wNes0Nb/S48/LE+Kgpy271wlCj@lists.linux.dev
X-Received: by 2002:a05:6102:548d:b0:4b2:73f7:5adf with SMTP id
 ada2fe7eead31-4b3d0f947f5mr1699824137.9.1736345990519; Wed, 08 Jan 2025
 06:19:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501030516.uZrwnuQQ-lkp@intel.com> <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
 <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com>
In-Reply-To: <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 15:19:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLQ2z=U1YJ18GsnJcej2mwGg02GVtKQLQKr0yNtA-7Hg@mail.gmail.com>
X-Gm-Features: AbW1kvaeBuWDdo2Mkx6lDOn6aHMKd182W90s65hQ52N3Jihquiz5sh0YRuRezHU
Message-ID: <CAMuHMdVLQ2z=U1YJ18GsnJcej2mwGg02GVtKQLQKr0yNtA-7Hg@mail.gmail.com>
Subject: Re: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Greg Ungerer <gerg@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, Jan 5, 2025 at 10:51=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, 3 Jan 2025 at 01:22, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> > Perhaps this is an issue with sparse?
>
> No, this is just m68k doing disgusting things that happen to work with
> gcc, because gcc considers casts to be lvalues (which in turn is comes
> from some horrid C++ thing, since in C++ casting is a whole magical
> extra complexity).
>
> IOW, this m68k pattern is horrendous, and sparse quite reasonably
> complains about it:
>
>   #define umul_ppmm(w1, w0, u, v) \
>     __asm__ ("mulu%.l %3,%1:%0"                                          =
 \
>              : "=3Dd" ((USItype)(w0)),                                   =
   \
>                "=3Dd" ((USItype)(w1))                                    =
   \
>              : "%0" ((USItype)(u)),                                      =
 \
>                "dmi" ((USItype)(v)))
>
> notice how it has two register outputs (the "=3Dd"), and the destination
> of said output is not a proper lvalue, but a cast expression.
>
> I think you could just remove the cast. Afaik the w0/w1 arguments come fr=
om
>
> #define __umulsidi3(u, v) \
>   ({DIunion __w;                                                        \
>     umul_ppmm (__w.s.high, __w.s.low, u, v);                            \
>     __w.ll; })
>
> and __w.s.high and __w.s.low are from struct DIstruct, which uses
> "SItype". So all the cast does is to change the signedness of the
> variable, but that has no *meaning* when you assign to it and the
> sizes match.
>
> Alternatively, you could just use the right types explicitly and write
> the umul_ppmm() macro something like
>
> #define umul_ppmm(w1, w0, u, v) do {            \
>         USItype __w0, __w1;                     \
>         __asm__ ("mulu%.l %3,%1:%0"             \
>                 : "=3Dd" (__w0)                   \
>                   "=3Dd" (__w1)                   \
>                 : "%0" ((USItype)(u)),          \
>                   "dmi" ((USItype)(v)));        \
>         w0 =3D __w0; w1 =3D __w1; } while (0)
>
> NOTE! UNTESTED! Treat the above as a "something like this, perhaps".

Thank you, using intermediate variables instead of casts for the output
operands gets rid of the lvalue-related sparse warnings.
That leaves us with the "not addressable" sparse error.  Apparently
that goes away by dropping the cast on the last input operand,
so I will introduce intermediate variables for all input operands, too.

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
