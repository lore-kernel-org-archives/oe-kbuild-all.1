Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E212CA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 20:33:34 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d645b95c7b8so4068860276.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692045213; x=1692650013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/cHprVnOUaSLZ6PqwX0GQNKZan2pG4obHLEL1zSHsc=;
        b=vXTg06/sK6snqNwVpqPzTbXo5LL6fJkWWsDD8qGZlKu8xwpSKEf4XH9yEu+4diAXDw
         TFA4bV26v41e+KOPR+qKYvoENiiLZx4FA0Z0cxWhyU+R9M2gyIou84SiPFozEIfJJoX8
         gm7J+/jZpsJifADxanjD8P3pGA76xjYpfvk2EnL42Ub61b2ZI1BzghxjWZiwReLtIXwW
         eKLxHZFToi6YefbM+HqkrjlPqv/zFLkppIUG+MDJqPIfXZ3kKQjkmlqOPBQz3G/YBdIy
         Hk+yQJeuVWVg0cDp6jvhx0cPhb2AIV3VqONu3cCKMZVxW+dHudsIVNZPNLodv6qh6MRv
         uEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692045213; x=1692650013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/cHprVnOUaSLZ6PqwX0GQNKZan2pG4obHLEL1zSHsc=;
        b=lsH7yxo06ob/0SZ6Ftn+5MsNz7aupj4qNE3O8mel3VYjWrTEPOWUyDXhm135Mpzmqf
         IQkRs2+Hj8tsL+WdxuLaXkS6+X+ysrTdWJAJyvb4IsrkFh5toa0LRmFshKCOMWaRpeo6
         R5YxdS4pKAU6VVsq9zN8xU+0JaQYpSdkkUAsMMYxta1ebd1u2Fwy9Sa3FDd62gbBwUHG
         72ZnlqkcI+DnmPZ0TLWzO/NEbTOE62GfxPfKp5tqhiijMCNO/WyV1HhiKb1edY+9q482
         7kMh8YxEeJ74bGz6EM8hT4PPgclAeKyXjPJwrUvvdqcn/Ne8/ZFr+Z+tM0qPfy/BtUwa
         VeJw==
X-Gm-Message-State: AOJu0YwYJbWJjPU4hCKQjBuHSr05tCFzADn0hPpfLYVvq3ljpdwTGcj3
	mw9b1UElfyZoBfcaBfWfjbpCwo0Vifx1Kp6r8HrEJA==
X-Google-Smtp-Source: AGHT+IGp+RkLGrqC3sCLgL+w9U5LXVbUbhEIZU8d0+wz8Cu3wWK14wFCIYAEQPc8S+6apT4JGA6t+4O4Kqw79oPnIUo=
X-Received: by 2002:a5b:951:0:b0:d4c:82ff:7bde with SMTP id
 x17-20020a5b0951000000b00d4c82ff7bdemr10478936ybq.63.1692045213096; Mon, 14
 Aug 2023 13:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308131610.jF4ncWp6-lkp@intel.com> <20230814130623.90cf2bc8c625087ea616dd3c@linux-foundation.org>
 <CAJuCfpGfsZtY5_Qi+Gew1z7Z0_Z_cAkrmxt+6cF6Sp-TR3A_kg@mail.gmail.com>
In-Reply-To: <CAJuCfpGfsZtY5_Qi+Gew1z7Z0_Z_cAkrmxt+6cF6Sp-TR3A_kg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Aug 2023 13:33:19 -0700
Message-ID: <CAJuCfpHF_gJYT6A6PC5YpoVefdF2rSEKNaSc2mH3Vqp51r3hjQ@mail.gmail.com>
Subject: Re: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:41: error: implicit
 declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'?
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 1:09=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Aug 14, 2023 at 1:06=E2=80=AFPM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> >
> > On Sun, 13 Aug 2023 16:17:21 +0800 kernel test robot <lkp@intel.com> wr=
ote:
> >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git m=
m-stable
> > > head:   5fb2ea3111f4ecc6dc4891ce5b00f0217aae9a04
> > > commit: 4aaa60dad4d1c96151dec51098aed866bb6e867d [219/240] mm: allow =
per-VMA locks on file-backed VMAs
> > > config: x86_64-defconfig (https://download.01.org/0day-ci/archive/202=
30813/202308131610.jF4ncWp6-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230813/20230813=
1610.jF4ncWp6-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308131610.jF4ncWp6=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from include/linux/build_bug.h:5,
> > >                     from include/linux/container_of.h:5,
> > >                     from include/linux/list.h:5,
> > >                     from include/linux/smp.h:12,
> > >                     from include/linux/kernel_stat.h:5,
> > >                     from mm/memory.c:42:
> > >    mm/memory.c: In function 'lock_vma_under_rcu':
> > > >> mm/memory.c:5410:41: error: implicit declaration of function 'vma_=
is_tcp'; did you mean 'vma_is_dax'? [-Werror=3Dimplicit-function-declaratio=
n]
> > >     5410 |         if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
> > >          |                                         ^~~~~~~~~~
> > >    include/linux/compiler.h:77:45: note: in definition of macro 'unli=
kely'
> > >       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
> > >          |                                             ^
> > >    cc1: some warnings being treated as errors
> > >
> >
> > This later gets accidentally fixed by Suren's "mm: handle userfaults
> > under VMA lock".

Andrew, is "mm: handle userfaults under VMA lock" merged into
mm-stable? I could not find it and in fact the whole "Per-VMA lock
support for swap and userfaults" patchset
(https://lore.kernel.org/all/CAJuCfpHSFikZ=3Dh34yS980BmUP5M=3D+j6rB4_b-q7MC=
c10Xs24+w@mail.gmail.com/)
seems to be missing in mm-stable. That's problematic because Matthew's
"Handle most file-backed faults under the VMA lock" patchset
(https://lore.kernel.org/all/20230724185410.1124082-1-willy@infradead.org/)
requires at least one patch from my patchset to work correctly, this
one: https://lore.kernel.org/all/20230630211957.1341547-4-surenb@google.com=
/.

An additional note,
https://lore.kernel.org/all/20230812002033.1002367-1-willy@infradead.org/
is fixing a known issue in "Handle most file-backed faults under the
VMA lock" patchset and it's missing from mm-stable too. As Matthew
mentioned in that patch, ideally it should be placed before "mm:
handle faults that merely update the accessed bit under the VMA lock"

Thanks,
Suren.

> >
> > If Matthew can suggest a fix for this I can queue it close to "mm:
> > allow per-VMA locks on file-backed VMAs" to minimize the size of the
> > bisection hole?
>
> I thought Matthew's suggestion here
> https://lore.kernel.org/all/ZNerqcNS4EBJA%2F2v@casper.infradead.org/
> would fix this. Dos it not?
