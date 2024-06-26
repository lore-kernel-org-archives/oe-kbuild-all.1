Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8203C153801
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394405; cv=none; b=Q3pcITqSLdot40AtV2eXzTErHZyvc6tVHCwBZC9ZP/nPqX/Buv8C0c36OY2y54auWCdd2r4pWIi29YPzPEE+r7vNAayciP04l36MxSsfGw0ntZOjdF0AAJlGC0AhhWWaHt/5gpEW98CHo+Yjp6dyOogaDB45YAxiRpmDeV7zJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394405; c=relaxed/simple;
	bh=BLr+UZM1tjC7FJ2r2FmEjZapNn4NPffHqyznS7e3aIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSUWZ6voGTPZK53dYY+D4O2pfG0TBzTFdCTeLqQi6F/7PUcZjt7THbgBTXJsqbWVdKKE0eyi0PUaYwThVWG5CUZqFftyWWjFbrG7isLXeRsSMES4Y4FsBRGjQ4xGtfhhRwi3ENXpJ2OShCbV/KhaLxAgnhJghktdjBzhRTk++XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYy3crlh; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYy3crlh"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso96809741fa.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719394402; x=1719999202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9V49/0pew242ZgNtxXQHjpBzNVHDt7hGxiTQwTXbALU=;
        b=HYy3crlhIF/b7u7+MxnMtwUdPvPZiTB5w2EaMDpbj+Zho2acGfrDz20NOg2ERpRcng
         aj9W6cgKxqkyk7mhxjn8jDSdjAY7W4WNLQOTXaoKWU9vmWdAZKRiGW1jxHvDMTV2JJDq
         x+imvVDr2hD85Os5xgWUlog498fAswJKjgRkS9e1cLhREzs0tk3ij7oM1u4is+aGqWhq
         ya2PbyzJbdMi7TTVj7SMAD5UNXZdvyAo9QvIGqlWHl+Ioih5fhYeKGMLt7jTN82aPqiM
         A9AmqkbdSFqi/Oymx/GSf/yLDwPjx+kncbVzC6kTwD8IGYwZl40e0f+1KAWVFPbwWP0X
         kujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719394402; x=1719999202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9V49/0pew242ZgNtxXQHjpBzNVHDt7hGxiTQwTXbALU=;
        b=acwFww2gygQSSUsZkUf3IfDgIlSYIqzPlKoTouP0Zs4e9NQPRrvVHj5qAI6RWjgVOw
         7AMmOPSdi+H7caHDl31gbULByyHPi4Ev/99C3Bf8AJvUtFTRy1Xt+Lb6WhqMCd7gYw5I
         D8KACg0Z+0SsgIQk7fNV+rN9iaeBhVhNRrKdon5HX8oxKlNEHbiRAFHCTWYDA64ytL8C
         480Ad+GADeD1WREsOJDcZBHSVsawxAUx1qd0ViszZ8kVuzF17tIq2PtfLzMq1Nq7Tb1t
         +zRmjk5L00JTAUCGgD7NGMcUQs8POFvaoftMXd9Whn9axVgzT/VLDVlllIanXwkt87TR
         ISzA==
X-Forwarded-Encrypted: i=1; AJvYcCVS/5KYznBROzWRBSbfMTgWFvFsfLATzQCag7fUqIrOZxVbOqv85pWQpxNHAJsrrGnqwIiQky/B958T/9l2GAaDtyTB2Wpf83x1Ycu0tQ==
X-Gm-Message-State: AOJu0YwedblntTuoqaZ7RGNV6ktQF4D5uSIYsAMwnFJq24yqz7UR/C3F
	Vmdv/IOBY7lQbbqxyEHEk1W4Q7UZXguppor/6gAtrThpUxikPjLD9Zj3DNIuzhkAWp8YArwEZ0k
	4e1I8uJLlI1wVdQMw+HhlGmFj2KvJF4E0mCU=
X-Google-Smtp-Source: AGHT+IEcVRLtuoU/fhayFG07fR0EbbCVk+f99Sk3JFVCJ1Z0wTWy6WXp57DQFwoTZC1sLStYobjeoAjMj4l3m3f/P1Q=
X-Received: by 2002:a2e:6a12:0:b0:2ed:5af6:e846 with SMTP id
 38308e7fff4ca-2ed5af6ea7dmr9443931fa.50.1719394401391; Wed, 26 Jun 2024
 02:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
 <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com>
 <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
 <CAHk-=whPqqZVSeJiQsMvsAxtAmtR9iAuB4gg_1sUK2D-uBPpLw@mail.gmail.com>
 <CAFULd4YAeF7=q7DYUh016kabxS8b32qRbFqDBJQrvLq6RjwEVg@mail.gmail.com>
 <CAHk-=wiHo2YeA=TOUf8vxFLOc0+BoH8USaiT25fnX2ynXbrZkg@mail.gmail.com>
 <CAHk-=wgdCs0883dpvZpyna76q9eVcTMvvUVAaBuJMPyrgOhNig@mail.gmail.com>
 <CAFULd4ZW23_RNye6YGbsT0Uo-vOQBM_tBbSJRhh=0HZzXuC_8Q@mail.gmail.com>
 <CAHk-=wiWEgSo2Tb_bih7mnS27zAPL+RGg_7yX4qK1f710-j-Ng@mail.gmail.com> <20240626092841.GC31592@noisy.programming.kicks-ass.net>
In-Reply-To: <20240626092841.GC31592@noisy.programming.kicks-ass.net>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 26 Jun 2024 11:33:09 +0200
Message-ID: <CAFULd4ZUBaK+FNSKfiJzzZNFQM1bWorZGmaY=fb-sFN2uPK4MA@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 11:28=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Tue, Jun 25, 2024 at 11:31:05AM -0700, Linus Torvalds wrote:
>
> > The thing is, when cmpxchg doesn't fail, then oldp should already be "o=
ld", no?
>
> Correct.
>
> > I mean, by the very definition, atomic_try_cmpxchg() can *not* be
> > successful if the new value didn't match the old one.
> >
> > I mean, just look at the very doc you point to - the "definition" is
> >
> >   bool atomic_try_cmpxchg(atomic_t *ptr, int *oldp, int new)
> >   {
> >     int ret, old =3D *oldp;
> >     ret =3D atomic_cmpxchg(ptr, old, new);
> >     if (ret !=3D old)
> >       *oldp =3D ret;
> >     return ret =3D=3D old;
> >   }
> >
> > iow, it only returns success of "ret =3D=3D old", and "old" by definiti=
on
> > is "the contents of oldp".
> >
> > (Here "oldp" is a local variable, not something that can be changing).
> >
> > So I *think* the whole
> >
> >     if (ret !=3D old)
> >       *oldp =3D ret;
> >
> > is actually counter-productive, and could/should be just that simpler
> > unconditional *oldp =3D ret,
>
> IIRC the reason I added that conditional is because at the time the GCC
> compiler I tried it on generated slightly better code like this.

Please see the thread at [1].

[1] https://lore.kernel.org/lkml/CACT4Y+bG+a0w6j6v1AmBE7fqqMSPyPEm4QimCzCou=
icmHT8FqA@mail.gmail.com/

Uros.

>
> ISTR it emitting some superfluous assignments with the unconditional
> store variant. Typically what seemed to happen is that since the
> cmpxchg() user would have a loop termination on ret =3D=3D old, it was ab=
le
> to recognise it only needed that assignment in the failure case. Without
> the condition on it would also do that assignment in the success case.
>
> But yeah, otherwise it doesn't matter.
