Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC25687
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 20:09:25 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d6b1025fc7aso1325098276.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692043764; x=1692648564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uO0+C4HN2/9O1LOoxlHcU7BrBzerRr5rTNB5Xo9cnDU=;
        b=tNsh8mHIPYU77XjN5aNlf+G0Os+hFn9hjYrbJc3+J8jaIWn3nF/Xo60ywUOU/mfO9w
         k0QSzQaNHU9hFGhSQWbyVtJfiuwflM0AO3BZOf0b3YpbMZvSyOVxvCwdJqw08+hAeMds
         i5tG3Tho0cmcy7H1y+oap+Yzm2BGC4D1kuw3IAaCeOp8Kw25pIn6DVUrlEWwyqrv6Nmn
         YjwcDdvPda+/ZDEHLtBH5leShY3gkD37Q+xM4VooOQTEmnZ03mmubQGgYlZp+YwsFs1z
         JhoyNmKTTz5FkGmhIxJk8scr69QX6eV+kz9SwSxYLlwCTFbAT43MGvYwclEUaGo19xGE
         rykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692043764; x=1692648564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uO0+C4HN2/9O1LOoxlHcU7BrBzerRr5rTNB5Xo9cnDU=;
        b=awPXwsEYzpUJKDG6Cjn4ElPm/P0KHn763qHlGywOQQbe1p62hYwVYbUSe63KRt20yQ
         ienGbIuNEwFz6ErYgIyZ8PWNiC5CplBmW6IJII3+mQXZ9R6iuofpOc8kihwq0bOtQhfQ
         ETp6BGwh1XLW8NDvNS14E8QCoBM/BX0qiYL5B8azktPJo2eJesNnHn13OpGGozwczQHd
         iFr1PpsOLSfRILHOqRWrfeq0/yVyxQQUlvvBzlWyD7Pl9vJiugXVlibng5+5fMmBWYNm
         THNP81o4Lz4N/gL9ojbioljFLBF5dkBQNBJ0mbrL0eQN9Q6wii8D+ml1Pza9gcWCA+e7
         4SHg==
X-Gm-Message-State: AOJu0Yw8/vAQpZe3U+AqXyFchO3evqidSeYqeIeuvEOuo1TyrndCqBcG
	fL9SWcWpjNCxus2kgTCGYCtpygdWb2NZmZwzYOEnng==
X-Google-Smtp-Source: AGHT+IG0sGwG2QNGwfi3Cn3oWXJbNP/4YMMWp18c8ZT3hxMREXAmUOSxLoW6XvzB91TNFQ/1mRTbMaVXoXdqYlCIOuk=
X-Received: by 2002:a25:83c4:0:b0:d42:d029:ff99 with SMTP id
 v4-20020a2583c4000000b00d42d029ff99mr11000299ybm.55.1692043763877; Mon, 14
 Aug 2023 13:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308131610.jF4ncWp6-lkp@intel.com> <20230814130623.90cf2bc8c625087ea616dd3c@linux-foundation.org>
In-Reply-To: <20230814130623.90cf2bc8c625087ea616dd3c@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Aug 2023 13:09:13 -0700
Message-ID: <CAJuCfpGfsZtY5_Qi+Gew1z7Z0_Z_cAkrmxt+6cF6Sp-TR3A_kg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:41: error: implicit
 declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'?
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 1:06=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sun, 13 Aug 2023 16:17:21 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
stable
> > head:   5fb2ea3111f4ecc6dc4891ce5b00f0217aae9a04
> > commit: 4aaa60dad4d1c96151dec51098aed866bb6e867d [219/240] mm: allow pe=
r-VMA locks on file-backed VMAs
> > config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230=
813/202308131610.jF4ncWp6-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230813/2023081316=
10.jF4ncWp6-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308131610.jF4ncWp6-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/linux/build_bug.h:5,
> >                     from include/linux/container_of.h:5,
> >                     from include/linux/list.h:5,
> >                     from include/linux/smp.h:12,
> >                     from include/linux/kernel_stat.h:5,
> >                     from mm/memory.c:42:
> >    mm/memory.c: In function 'lock_vma_under_rcu':
> > >> mm/memory.c:5410:41: error: implicit declaration of function 'vma_is=
_tcp'; did you mean 'vma_is_dax'? [-Werror=3Dimplicit-function-declaration]
> >     5410 |         if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
> >          |                                         ^~~~~~~~~~
> >    include/linux/compiler.h:77:45: note: in definition of macro 'unlike=
ly'
> >       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
> >          |                                             ^
> >    cc1: some warnings being treated as errors
> >
>
> This later gets accidentally fixed by Suren's "mm: handle userfaults
> under VMA lock".
>
> If Matthew can suggest a fix for this I can queue it close to "mm:
> allow per-VMA locks on file-backed VMAs" to minimize the size of the
> bisection hole?

I thought Matthew's suggestion here
https://lore.kernel.org/all/ZNerqcNS4EBJA%2F2v@casper.infradead.org/
would fix this. Dos it not?
