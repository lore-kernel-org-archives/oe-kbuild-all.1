Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E463181D1C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719168088; cv=none; b=ECe2fx2a1c0w6txCFQZF+9X91TvE55mELqQyqAlntMhhBtKuFpxZIFVhFvqSkz42lyEgB4DjPwqFSXKLQKaP107vcy0nwUjfUS5BH7ckOHQezvvCy5Rr1hSqqaCU5eUeFforS3udIwtRre3sy6XCQHrhDK026xVIAtfxwit4SAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719168088; c=relaxed/simple;
	bh=gUWxyYGOHpmIygMr2aU1CEMePlDuA1tDMXGdGRh5aCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wi6j101tm50JCBp2wlJBhuNvgKJ0f38gOOewggz/XoHaMbir6EsSE5LxY2xOYuft1BmPWjS0fd0NOl9Ecx36DGe6p/dGOG9o5H5VpcDqv5jrl7drdjmntHPxbUVajrS4QSxAAF6AzbdWV5V5IE+Yzzuh6t331CWKlQbvdqjQzCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d29HykIw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d29HykIw"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so40887281fa.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719168084; x=1719772884; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUWxyYGOHpmIygMr2aU1CEMePlDuA1tDMXGdGRh5aCg=;
        b=d29HykIwOiybw/EYRBaYemb09ad23uY0DJKblBPlj/3Ypm/wHOQYPtjI+NKZCS7k9b
         vE6Nm6Pfvn2+0vJCDvISkBFoVSswW22izBXDahn0PZnZ2+8hEe0WxnQaXlJd3/7oUHe7
         oPn3N8EtxlNth2WfzlsSZDhZoEJnbEABhpwO0Az+zTWmG2rmwISnofF9kBJQ0J+3RPOb
         8+bqa6X0y6A8bN1hVoWQ40rkHHckBZA/FHWoRlk1ItUKCFHHGmKSYafHn+n5/92qjOza
         sHoInULbXzG/F3geTIXAtGh8gJDuQo5HDlh0Tnhz+TLFgyLsQS8X/3rs3pnYvdiEmjNE
         7EzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719168084; x=1719772884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUWxyYGOHpmIygMr2aU1CEMePlDuA1tDMXGdGRh5aCg=;
        b=WWghcDjsDw4pLJt4yHZC4E+SLLT5DAe6b7Hzy6DfXQ4xlp73tJRCmsu4rxYc2MdXkP
         jgqqXVCq86x8eFJ0CTlvxvearWB6QbRkE4k2dl1sKYuJw4CmWB5LujnpxQhCPw7q4EOF
         tG6coYuoMkhMYrO/yjaGJJlt5TH+znTmtmnhk/gwg4VoF7qM/DeEs9Dud4k/vN8++8zU
         ehBf4HiTHQzooncT7ugpSJPqKYqc37F87aMqc8KrqWbHbthCspfhQ7Ir4uglEJJyv3c1
         0w53paygLQw8S2zjrHNi78QqSs+Q1wNyvnXo6Doqj0S9/E6R2BSmDbvNbV3DXytGExZM
         xQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCVqn02P/oEzHdmfeW0Y6kr/hWRehC//cGoIm2Dch2LfNM0pZABIjpYfoaQSbEocQBh7gLnjE5bekDnw2qFqrP6ZnTz5SvKzNtznLV5zDw==
X-Gm-Message-State: AOJu0YwaLLHE+WvWuazdPJ0bBDDKOI1LLMLUR8b+pIp0OPoeNSVhPef7
	5FJOeLL4Pee8/IaAXiFfUts3Dr1NuKi+1XBocnmgpwJWayxL6m1SjGreUFB4LneD8owZJVHEDxe
	gIVxU8k4G0YvmT+0/sOmkF6PXYfE=
X-Google-Smtp-Source: AGHT+IFjAUSORTSqIPw6GTNqjQYPK6sB+UFv5SCQkYWex0V/BK4KHV0KQnPBQYHTy4B8o2EYgEAKXynzZtyzBg0F4Dc=
X-Received: by 2002:a2e:9996:0:b0:2ec:58e8:d7a2 with SMTP id
 38308e7fff4ca-2ec5b337346mr16708821fa.16.1719168084185; Sun, 23 Jun 2024
 11:41:24 -0700 (PDT)
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
 <CAFULd4b43=pTnAMKusJmGCeF1Bk-f6AyeOR8wGM8EieqhuH5WQ@mail.gmail.com> <CAHk-=wgHa_5u71j=Zx4DceTfjaeL2w1RCPPXbpEEL-xCw-J8ew@mail.gmail.com>
In-Reply-To: <CAHk-=wgHa_5u71j=Zx4DceTfjaeL2w1RCPPXbpEEL-xCw-J8ew@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 23 Jun 2024 20:41:18 +0200
Message-ID: <CAFULd4bxS0y1b7XZ1_J3yHF84Ghzoi1OWoZGfrLWvNaygVCWTQ@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 8:25=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:

> Ah, good. This is something I'm a bit sensitive about, just because
> there's been so many arguments over it over the years, so now I go
> into "preemptive nuclear mode" when the regression issue comes up.
>
> Sorry.

Also sorry from my side if my disagreement was understood as a
criticism of the kernel development process. I'm totally OK with it
(but ignored patches indeed cause a bit of frustration...).

> > I'm OK with the revert, but it won't fix the underlying problem.
> > Please see the definition of __arch_cmpxchg64_emu - it forces the
> > address to %esi registers in the same way as __arch_try_cmpxchg64_emu.
> > Effectively, the compiler allocates 5 input registers just for the
> > instruction.
>
> Oh, I entirely agree that this is a "random compiler implementation"
> issue, and then the code around it makes all the difference.
>
> > > Now, from having looked a bit at this, I can point you to the
> > > differences introduced by having to have the emulation fallback.
> >
> > Yes, I know this - I also (runtime!) tested the emulation, but with GCC=
 only.
>
> Yeah, crossed emails, I started out just doing the "let's see what the
> config difference is", and only after that realized that I had looked
> at the wrong code for cmpxchg (ie I had looked at the simpler native
> case).
>
> > This can be achieved by implementing atomic64_{and,or,xor} as an
> > outline function.
>
> Yes, but then a lot of the whole point of commit 95ece48165c1 goes
> away, doesn't it?

True, because this commit pushed one of the compilers over the edge.

> Or were you suggesting the out-of-line code only for the emulation
> case? That would work.

I am suggesting simply following the approach of
arch_atomic64_{add,sub}{_return} in atomic64_32.h. These functions are
used extensively in the kernel, and if they didn't cause any problems,
then we can rightfully expect that the new ones also won't. This
approach will relax the register pressure, so we won't expect magic
from the compiler.

I can provide a patch series with the revert and a fix in a couple of
days (I'll be away from the keyboard for a short time).

Uros.
