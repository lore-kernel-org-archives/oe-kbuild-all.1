Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF3132127
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719340286; cv=none; b=A5SyKsV7vThoi7qoYzpG2zFK4dCDFnbariTR5bp0ILzo9c4YMXfuf/4OELR+LiKN6aoGXcnd2IcbEP6jMQY/MUxs8G2dj/zTwOfxfhzKL1FvzHnE4Ri8JNWnQyTMB/fVv+e3HTrfFJ3b+VovzP4x6KAwDJ1DMDfCYP5naoDXnIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719340286; c=relaxed/simple;
	bh=01n+iA2XY/JcHtXGIz7V72LJ4/6ZPTLG8Jbz/Pa3XM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jH9FoCtBobMhR6SOf0dmMnnctSwlCkF/lbfdIgfQbA8qxOrk9yNQes1QvHD+flbXl8dr8L7KoSg7onVrCY3kSPgzclz0tQEayuXS4NxBC0uNOofpVJDLwbtxPrNYH2MGXVnnR3WQy9KKKp5tlLk7lLwlTw0Wpad+muw+E2hG7n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cPJqYzjg; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cPJqYzjg"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebe785b234so64972531fa.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719340282; x=1719945082; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i9EZeqDS86Jj/CFHQ+IhN1q/yBvceksX0X7aiOh86ro=;
        b=cPJqYzjgNkdTd6sx7DRWMw4CD7x67Rhu8nFdVB7R870Tn6h7RJj5xcoU0igHJXNcbZ
         TLw3AfnD1A/h+TjAlsJFJKIJDFU1MUU9eG570HwB/6QaVJ0j7Tw5sOKMWvrSi1Kn0TXQ
         Smo+AjM4eAo6sxApe0c/JrE1fNmrsi0bM3jiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340282; x=1719945082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9EZeqDS86Jj/CFHQ+IhN1q/yBvceksX0X7aiOh86ro=;
        b=XNXEVC+elDgu+khJm1tJhZrhN69+tWEwHPZPcjJwkxZmpXGZtT0KyfEVYKOwwRixRV
         DcRHKTTBC58m+yXtNghAU/MxLPR5+UblYrUGOC/tU0YCRecsljCvdOuBmKh4mdnJqZ0/
         4ZTa/tD7XrOrFeRUc21bW1N42cqka7OH/8GosMYCOxT52bSebiQQZf3BdD+9BNxUqeEs
         CTgkpw1U3AAT3+iVKh2YIvwc/wD5V/DsCRtj01cjUwBws5ByoGQ9xutOR1LNXumEJSbn
         bZCkatOu9bhmp4aeh6fwsMDzyxi6AFvGYwEwgKvsje+lWHLBTPnT6T2cyzuztMHlxEKV
         0pgg==
X-Forwarded-Encrypted: i=1; AJvYcCUP/ooeaH10/FjgwVerHfKFFWSdLkmkovOvfbVrck4OSkRrYLG8NaSr0UphCh3mqVRdjZQ2ElpvyOg3s3lJ+Xj3Gd4vUCErEwiEmRFB0w==
X-Gm-Message-State: AOJu0Yw7ErsprKIleOlw0MZM2fLsPPgUgJxg9jVG73jcTD5clv1Rt5qi
	2G6Gt+hmSM6zPUbCaYfu1fjRuqDPLnhva5QLhN1IjAPJ+vy7hbxQcKwgej2YcVNT4EKSPCWoMYG
	67q8nJg==
X-Google-Smtp-Source: AGHT+IGFaYVMK8LveNcFP2uxk/A9CKQY82jb4KqZq751SjQkgEfJWTzUKnTKdNQSGPhrs3yi6N85Og==
X-Received: by 2002:a2e:3a13:0:b0:2ec:53a9:2037 with SMTP id 38308e7fff4ca-2ec5936fb73mr74765831fa.37.1719340282217;
        Tue, 25 Jun 2024 11:31:22 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3042ef50sm6222674a12.44.2024.06.25.11.31.21
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 11:31:21 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a724958f118so382658266b.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 11:31:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtG63fHlXZE0DF2JmEGmaspvwiQlI/IIEe37sOBQ/YOSys9/8Z7MrFXt4itePAd9JpOtmVOcB+P8nDnb2oRzDb4MfhpR+pwlpEj213bg==
X-Received: by 2002:a17:907:cb20:b0:a6f:489a:3a28 with SMTP id
 a640c23a62f3a-a7242cdb40amr569907066b.61.1719340281233; Tue, 25 Jun 2024
 11:31:21 -0700 (PDT)
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
 <CAHk-=wgdCs0883dpvZpyna76q9eVcTMvvUVAaBuJMPyrgOhNig@mail.gmail.com> <CAFULd4ZW23_RNye6YGbsT0Uo-vOQBM_tBbSJRhh=0HZzXuC_8Q@mail.gmail.com>
In-Reply-To: <CAFULd4ZW23_RNye6YGbsT0Uo-vOQBM_tBbSJRhh=0HZzXuC_8Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Jun 2024 11:31:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiWEgSo2Tb_bih7mnS27zAPL+RGg_7yX4qK1f710-j-Ng@mail.gmail.com>
Message-ID: <CAHk-=wiWEgSo2Tb_bih7mnS27zAPL+RGg_7yX4qK1f710-j-Ng@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

[ Sorry for not being hugely responsive the last few days - I was on
the road for a family get-together on the east coast, so I spent time
on airplanes and hotels and I don't particularly enjoy working with a
laptop ]

On Mon, 24 Jun 2024 at 08:42, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> >
> > I'm sending the patch out in the hope that another set of eyes will
> > make it actually better.
>
> + _lock "cmpxchg8b 0(%[ptr])", X86_FEATURE_CX8) \
>
> This can be just:
>
> + _lock "cmpxchg8b %a[ptr]", X86_FEATURE_CX8) \

Thanks, yup, will fix.

> - if (unlikely(!ret)) \
> - *(_oldp) = o.full; \
> + *(_oldp) = o; \
>
> This one should really update only when cmpxchg fails.

The thing is, when cmpxchg doesn't fail, then oldp should already be "old", no?

I mean, by the very definition, atomic_try_cmpxchg() can *not* be
successful if the new value didn't match the old one.

I mean, just look at the very doc you point to - the "definition" is

  bool atomic_try_cmpxchg(atomic_t *ptr, int *oldp, int new)
  {
    int ret, old = *oldp;
    ret = atomic_cmpxchg(ptr, old, new);
    if (ret != old)
      *oldp = ret;
    return ret == old;
  }

iow, it only returns success of "ret == old", and "old" by definition
is "the contents of oldp".

(Here "oldp" is a local variable, not something that can be changing).

So I *think* the whole

    if (ret != old)
      *oldp = ret;

is actually counter-productive, and could/should be just that simpler
unconditional *oldp = ret, because you have two cases:

 - ret == old: the assignment doesn't change anything and is a no-op

 - ret !=- old: the assignment needs to be done

but doing it *unconditionally* means that now as fat as the compiler
is concerned, the original *oldp value is unconditionally dead, which
sounds to me like it should be good for register allocation (the
context here being that it _looks_ like a pointer access, but it's
really meant to be a "in-out argument in a register").

Now, in practice, I suspect that everybody checks the return value and
"old" is never used afterwards in the success case, so in that sense
this doesn't matter and it's all dead regardless.

But it seems to be a complication in the docs and the implementation.

Of course, I may be missing something completely obvious, and/or you
have some subtle code generation reason why you prefer the conditional
there. Feel free to explain,

             Linus
