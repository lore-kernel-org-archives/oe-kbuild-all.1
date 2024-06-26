Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E101515820F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719388487; cv=none; b=NM/1nVnxRqmSBEKpUemrBulS8pyaXrOjpPcu0Co+g24MFLzMXzZuKI7hS7HWVYJIY3jKs5I779GmykooSlDlNRZWJgXtYxJiK5KpzoIC4jUn+WZ+Y0+rd9kRT0v4xEcfqYCncR1vii3Xqq+D00GsgYNDIU2a6BMza63/6H5fT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719388487; c=relaxed/simple;
	bh=3lM7Krd3eubuTSd3weFykcxesluFoVIhP2qOjhiNjTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDcb/ZuKo+z0lfDCc5Pse2Q8JlNCtjHDwUbofaUzLrZFtvxRC8RHjprta8V7d0bd2Uilv9tK+UeVvHaE1oKbN13Phhb5DQsXgi0A/nONc4T7FuldXtFvjLfxUnAlvtUzqLgDdcFAeR33FUb3PG8r1frtiJxAD+0h0upxmGuxU1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9Sm/UmI; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9Sm/UmI"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso66250771fa.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719388484; x=1719993284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9l4PBSU230KyF+70o0NVWXuUQoiQQyfQa7UJiR8ZC4=;
        b=P9Sm/UmIVgO861eS7g1aUg6XH2nxEUpcQpJ3zmy1KSnZ55hjcArRI3oMrb/C1XoHgX
         UDE7jWdFZ6gbOH7CbZFwOKVJpGl41GjqxNWvN1jJqFEUqBhe80tdtWe65UUr54J8uLLG
         1wLWn0rXEMObD1ve0c1KuGECH1lLUlc6SZZD5ZE/uWRKeKu9kjd/8s22EkGobEtHyEQk
         zdo2oiXZugQd4gQUCOqb93l4jF7cp/Av9BAv6aLQ8/3dHFzLmtpIWON1quFKuRG5czmb
         5xenouLAwPPvsnV9u20f0dqPTeM4hnOQg135IwJutZ6IE9laLW5qaV5b1aUMcv/DEEPk
         IPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388484; x=1719993284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9l4PBSU230KyF+70o0NVWXuUQoiQQyfQa7UJiR8ZC4=;
        b=N0HAV/iFJRFzFKOUbR1VUlp142NuGqujjFOPzV2ebhnrBWnrKwWEKe87OVOZVoCIpy
         KXiQnH355tOhKM4sJfv9nPULP7dhnVaC+U+nTG1YhcrKhuRbY52LpcU/nht4drHAQnfN
         /bN6iqcURMdux2BgoS47dhupEe5UTCrDh9jEwsKiYCHatmswbhqaRXD7FWZb+JJb76Q/
         VecUw383UwlXHOXpuis5t5s9/ZgWfLb841ylxaTeo3j0XZwHg/elpmKv+mG6cQZUJT0X
         9XQFdqVem7595nDebpTi6hTsoBo/ol5R5gdGwMQ6obPYuhKghDkl9BFDWrqpQ1NhHmnJ
         qo4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2FugKloQt5A118EsgAaDaBuduH5GOH8Pm//4ku36lIUzueF3/vTgQVkGh8EVswdWtigr8FPQMpkMcTpkzQdH5gWzh1oWdsu2zohev2A==
X-Gm-Message-State: AOJu0YyxLk4lWjD9+yBbB/Lk9HxOoOq8HjPQzwduuMc7MZ5ka0XvdJSH
	Veyny0KcLpV5AMQirLxEMPXozeixVAQogYHIH66BUYCj3+ftQ5yoUb8ghB3E8S3ngnkEYyR1gfF
	ygs4tc8mdilko2+jq9El1sHhZjkU=
X-Google-Smtp-Source: AGHT+IEdM7BL7IYNDJYZSWFp4SHg4gOScBa35KINGjDg3kZVWZCHM2JlMQa+zfdTbKK0IvAx79DqhoCjSlT8PLVH1aI=
X-Received: by 2002:a2e:86cb:0:b0:2ec:4de9:7332 with SMTP id
 38308e7fff4ca-2ec593c296bmr56063661fa.2.1719388483724; Wed, 26 Jun 2024
 00:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
 <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com>
 <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
 <CAHk-=whPqqZVSeJiQsMvsAxtAmtR9iAuB4gg_1sUK2D-uBPpLw@mail.gmail.com>
 <CAFULd4YAeF7=q7DYUh016kabxS8b32qRbFqDBJQrvLq6RjwEVg@mail.gmail.com>
 <CAHk-=wiHo2YeA=TOUf8vxFLOc0+BoH8USaiT25fnX2ynXbrZkg@mail.gmail.com>
 <CAHk-=wgdCs0883dpvZpyna76q9eVcTMvvUVAaBuJMPyrgOhNig@mail.gmail.com>
 <CAFULd4ZW23_RNye6YGbsT0Uo-vOQBM_tBbSJRhh=0HZzXuC_8Q@mail.gmail.com> <CAHk-=wiWEgSo2Tb_bih7mnS27zAPL+RGg_7yX4qK1f710-j-Ng@mail.gmail.com>
In-Reply-To: <CAHk-=wiWEgSo2Tb_bih7mnS27zAPL+RGg_7yX4qK1f710-j-Ng@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 26 Jun 2024 09:54:32 +0200
Message-ID: <CAFULd4YyamnC5D9SAo0w4EhbawJeS1K2ZqPt9CPUL4+S5uAOZA@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 8:31=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> [ Sorry for not being hugely responsive the last few days - I was on
> the road for a family get-together on the east coast, so I spent time
> on airplanes and hotels and I don't particularly enjoy working with a
> laptop ]
>
> On Mon, 24 Jun 2024 at 08:42, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > >
> > > I'm sending the patch out in the hope that another set of eyes will
> > > make it actually better.
> >
> > + _lock "cmpxchg8b 0(%[ptr])", X86_FEATURE_CX8) \
> >
> > This can be just:
> >
> > + _lock "cmpxchg8b %a[ptr]", X86_FEATURE_CX8) \
>
> Thanks, yup, will fix.
>
> > - if (unlikely(!ret)) \
> > - *(_oldp) =3D o.full; \
> > + *(_oldp) =3D o; \
> >
> > This one should really update only when cmpxchg fails.
>
> The thing is, when cmpxchg doesn't fail, then oldp should already be "old=
", no?

Also replying here with the reply to your proposed patch, to document
a subtle issue with try_cmpxchg:

You probably want to look at 44fe84459faf1 ("locking/atomic: Fix
atomic_try_cmpxchg() semantics") [1] and the long LKML discussion at
[2].

--quote--
This code is broken with the current implementation, the problem is
with unconditional update of *__po.

In case of success it writes the same value back into *__po, but in
case of cmpxchg success we might have lose ownership of some memory
locations and potentially over what __po has pointed to. The same
holds for the re-read of *__po.
--/quote--

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=
=3D44fe84459faf1a7781595b7c64cd36daf2f2827d
[2] https://lore.kernel.org/lkml/CACT4Y+bG+a0w6j6v1AmBE7fqqMSPyPEm4QimCzCou=
icmHT8FqA@mail.gmail.com/

Uros.

>
> I mean, by the very definition, atomic_try_cmpxchg() can *not* be
> successful if the new value didn't match the old one.
>
> I mean, just look at the very doc you point to - the "definition" is
>
>   bool atomic_try_cmpxchg(atomic_t *ptr, int *oldp, int new)
>   {
>     int ret, old =3D *oldp;
>     ret =3D atomic_cmpxchg(ptr, old, new);
>     if (ret !=3D old)
>       *oldp =3D ret;
>     return ret =3D=3D old;
>   }
>
> iow, it only returns success of "ret =3D=3D old", and "old" by definition
> is "the contents of oldp".
>
> (Here "oldp" is a local variable, not something that can be changing).
>
> So I *think* the whole
>
>     if (ret !=3D old)
>       *oldp =3D ret;
>
> is actually counter-productive, and could/should be just that simpler
> unconditional *oldp =3D ret, because you have two cases:
>
>  - ret =3D=3D old: the assignment doesn't change anything and is a no-op
>
>  - ret !=3D- old: the assignment needs to be done
>
> but doing it *unconditionally* means that now as fat as the compiler
> is concerned, the original *oldp value is unconditionally dead, which
> sounds to me like it should be good for register allocation (the
> context here being that it _looks_ like a pointer access, but it's
> really meant to be a "in-out argument in a register").
>
> Now, in practice, I suspect that everybody checks the return value and
> "old" is never used afterwards in the success case, so in that sense
> this doesn't matter and it's all dead regardless.
>
> But it seems to be a complication in the docs and the implementation.
>
> Of course, I may be missing something completely obvious, and/or you
> have some subtle code generation reason why you prefer the conditional
> there. Feel free to explain,
>
>              Linus
