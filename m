Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E8C19CCFD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243762; cv=none; b=mA/YdDkr/Wl8yEJuWxWY+ZkaS8RPZ5zCUnOjbJiAzAuUmA5e2bb3TKLhwXjFHOwUXq+8geXnKpGD438dGL07e1CG1WcQKnttmZSFmdtk9ZKYpZXqUNlUZqkPNcShUGMfjLXLyZIlqgIeXpmFqSXpux0270COnNFRev5q4kDVFUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243762; c=relaxed/simple;
	bh=4b2NR7ZU6RhCVAQiz4eoi6ItIYSKwVG9ISrse0aWNEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY/r4g5k1VyJ8R3i6HmSlVquCcd+5bPkZasRaEOxLdS3vX0fhXZkIioOswTmRV8QKndnjwzSR1sZYO33gJpjehq4KDee2OjtNL1uozYPmAuowv5C4Qcl8OkPJIhoelRq7yxGapTe4R/QmHAiopLPq16a4GDPCMqRGssAdmznK8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIfUAWpB; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIfUAWpB"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so73487881fa.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 08:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719243759; x=1719848559; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4b2NR7ZU6RhCVAQiz4eoi6ItIYSKwVG9ISrse0aWNEo=;
        b=MIfUAWpBM4Vf3mXhGuZP/NQD7oneGKnBYjwxLJ39arR0bYPbEqS9nfMhD95Su49dec
         EddafI6tS1N1o+fzWU92Q8ia/FDwzyYSxQxGaORQuiiNUscRnCFGn1Btmi18CDT4Vw22
         VJmjNdNCpdOlMQM4oeoagmO2SCItLPzgGsrQ25Ac6tmKX8a5wlt9d+aFsUvxyTIsC1Pg
         Z1voTAB33L48GhxTinz0+6ZPL960c1gkNeXKPQBtpqixU9mxJK+a7q3tlJLEKU8+61v6
         Je89BLpHubZ3oOzrida3eCdXIiJWE0xMlZoxarln3ueC1IB3NTa1EqNptE0QrqZUYltE
         ZP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243759; x=1719848559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4b2NR7ZU6RhCVAQiz4eoi6ItIYSKwVG9ISrse0aWNEo=;
        b=B4x28r8A7Fj72ScDKIenr781K7JMJbVPHBO1YcXzj9EPqHvBJC5NoOkICttU0KNEyo
         hyDa3//I6PL0Qjs2FbpzqQ1Izeuiv9VBq5dAUkD+TT0IJwSJvUI235g4nL+WyozKtoCc
         l7Hbxf4UXyUY40p7FbwsGZQTkK9gMD//G4s5Mt0tA9vL/qovJiwBX7WNYrEj5hT3YeLT
         EMAzOhPltWU75bFh/Mm47ogq3EXepDaTQsFNiy8kSWAq+kM9svE7XyVOFKiFhFSw7VBf
         OrE/1pp+2EzP5BCm5V3fIgLStur4djCQqhgBapqWJ1oPqhi4zqdFfCsmXrXRJydTz/oQ
         lwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAFEAqW0cJISNQiJkhcZmlbv3Awucn6t4qKhtPDEfH/T0j0iZnwwPzPm9Xe6KfWmVYsjgLJvMZYjIAHuuvHnFPTE1tGLM8V95BnPwdLQ==
X-Gm-Message-State: AOJu0YwR+02fM+yBVp06gx04b+ahjd/iiZ5QHfw0GB+z2JeKJvQpnWo6
	6vpoIp0SWvGUlQ9K0LjUFNG3CIcQgA9UEdnsqGtYXY12ABbqTRnmDmiVKO541kI7r1dsNp7EOWH
	n5waM86pJfinPd8eCy3M+0ATWmU4=
X-Google-Smtp-Source: AGHT+IFBxn4USRqyPo0lzjb2M7Hs+SA4MriqfTierRf32hr1TE1t4qrkidUoMFdnifNpyyPHVkyMzoMzywo22FjadXE=
X-Received: by 2002:a2e:9917:0:b0:2ec:4bb7:d7f6 with SMTP id
 38308e7fff4ca-2ec5b2c4daemr36931881fa.7.1719243758350; Mon, 24 Jun 2024
 08:42:38 -0700 (PDT)
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
 <CAHk-=wiHo2YeA=TOUf8vxFLOc0+BoH8USaiT25fnX2ynXbrZkg@mail.gmail.com> <CAHk-=wgdCs0883dpvZpyna76q9eVcTMvvUVAaBuJMPyrgOhNig@mail.gmail.com>
In-Reply-To: <CAHk-=wgdCs0883dpvZpyna76q9eVcTMvvUVAaBuJMPyrgOhNig@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 24 Jun 2024 17:42:32 +0200
Message-ID: <CAFULd4ZW23_RNye6YGbsT0Uo-vOQBM_tBbSJRhh=0HZzXuC_8Q@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 4:18=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 24 Jun 2024 at 09:59, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Mon, 24 Jun 2024 at 03:36, Uros Bizjak <ubizjak@gmail.com> wrote:
> > >
> > > A real fix, not only a workaround, is to rewrite asm arguments to
> > > something like (untested, but "should work"TM):
> >
> > Sadly, I already tried that, and it didn't help.
>
> Bah. I _had_ tried that, but I had tried it on __arch_cmpxchg64_emu(),
> not on the "try" version.
>
> And no, it hadn't helped.
>
> But doing it *right*, and also doing __arch_try_cmpxchg64_emu() *does*
> actually help.
>
> Well, at least the attached patch compiles with the bad config and clang.
>
> I'm not certain it does the right thing, because I did more than just
> the %esi games to try to simplify it.
>
> It's *ENTIRELY* possible that I screwed up. Just in this thread, I
> have looked at the wrong inline asm at least twice now, so I'm not
> feeling super-competent right now.
>
> I'm sending the patch out in the hope that another set of eyes will
> make it actually better.

+ _lock "cmpxchg8b 0(%[ptr])", X86_FEATURE_CX8) \

This can be just:

+ _lock "cmpxchg8b %a[ptr]", X86_FEATURE_CX8) \

- if (unlikely(!ret)) \
- *(_oldp) =3D o.full; \
+ *(_oldp) =3D o; \

This one should really update only when cmpxchg fails. The relation
between cmpxchg and try_cmpxchg is documented in
Documentation/atomic_t.txt, section CMPXCHG vs TRY_CMPXCHG.

Does the compilation still crash with the condition?

Uros.
