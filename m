Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5259E3B1BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 07:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719214582; cv=none; b=PPZ9LhCJy6thGdFWgJczHjgXWxdZUvzVl6GagqtFzrevZVbzMxprl/9DMeJ9Bg6nxiNGym3Yx0oieyVxAt7lLzFfc4PK8jga7cKsuR8uxsNNVcLTMqbnFXeifpp47qeDCrNeUdEK2TGjPGm4At5g8ZLOKR/U0TNVsEyDs6JpC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719214582; c=relaxed/simple;
	bh=dHsJIKi9ltWh5KwIraHj+1vuh/acJSsWcHwISUsG3+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxgtE8Xievmh9hoC5kCIraetpOl7m0TJHjNl4j452joHPfVnXXHQSM3R6gzKEdV53SyWRfVROk43RZm2BVitHM9NkoGI4eR2C2E+apelog5z8fL8rh7DOCbyXov8bQQR6LguQ4mCrrDcQn+DUpkybuEmoWCllHXxDb1U7Ge8OWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baBba0w1; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baBba0w1"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec58040f39so14620011fa.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 00:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719214579; x=1719819379; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+BXhTT8wJwtF1XUw6xsdMcrYOPNMj2Yz6sCSEx+NqU=;
        b=baBba0w1mAXpt2WqosXRLpWmCKjYTMltE0udz393P/Ldi1enX53BYfzO09JcLGTR67
         OGxt1l8MqIKw8v2yy/1oF6ysGoc7LrGhcK3jaL1kDl0o94qxhxfuRq0r+dj+znlHmp3T
         XN197vV/FE0tNxnMYoTc/DreqIjJYJYr4T5E0CscgftWMFo3yd7w1K4lKU/dlIIGNMAa
         wdl042nB36W7BEE+0pPgnEzC21/bMzaInsZw4PobEcd0vMVtC8hYJ/7qOXkq9Avt7Eb2
         KlDdfr290UbJ3axDdLC9gssLG9aOSJ9I2Xwe3wAwzqIPMpMkQYOTx177whwkI2rfKNus
         3aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719214579; x=1719819379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+BXhTT8wJwtF1XUw6xsdMcrYOPNMj2Yz6sCSEx+NqU=;
        b=vBQGuEINuhNtcEcyU9sICJEKarxM8rBDkhDrP0kDRV1eqPHTY5TMiCpBEqbSTgzdm7
         tAcM00e30MxyockwdG6A5bo12i5L7WfLnE6ltqnCME+bulN1REg1KTlRgV11Fbu5/oc8
         CMBDEj16FtDiAVcreZIstMbxVCx9+Jiexa3BWSr3AlVN+FsuuC7Uq7GgwUKSY86EMnzm
         2oMgeDaTfcpVt4CWFpgyu9d+fAViADT39XGcoUM/ruOb4d9XJ6JRerVixfxQQavfLhYU
         EfdD1WRrja84p9g/zoh+V22bCLJ6Wne+nYv+GGk3zqWOX6/OZf7eOM/EzaoiS9PNbzwe
         OLbw==
X-Forwarded-Encrypted: i=1; AJvYcCVfHvtOIkPcDZo4ZwAj7m8srJFHu+PI2xTEbu4buyroBb3nC9QC0P3kesxfIqAZg5XhGEu8bO/MEQ+Z65W/XnP/sRmgWPl3C/KPTxloEw==
X-Gm-Message-State: AOJu0YzK1ifEVTCH50p1LUC7UYrCGBKQNUFASqhJv5u6cYZZmvRTgU2U
	xdVy3LBhxnOEouqQmNVaYsNfOMgHnfCDWyR5eMlotAQKcIJj4oLNnsVqg3lx0lRMJcUijovrWXG
	6iZmr9w3cRObOkZ7PdqB1Un9v9UQ=
X-Google-Smtp-Source: AGHT+IGXZ2dKLPFOeHXuatNNmFtCBKoMKvpZwLsfp6Uh4dJHvhw8Cb++fMZqdAq6WqTx8LCmklFshiJp19joklFOf7k=
X-Received: by 2002:a05:651c:1036:b0:2ec:1042:fb04 with SMTP id
 38308e7fff4ca-2ec594d00bbmr24643951fa.35.1719214579180; Mon, 24 Jun 2024
 00:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
 <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com>
 <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com> <CAHk-=whPqqZVSeJiQsMvsAxtAmtR9iAuB4gg_1sUK2D-uBPpLw@mail.gmail.com>
In-Reply-To: <CAHk-=whPqqZVSeJiQsMvsAxtAmtR9iAuB4gg_1sUK2D-uBPpLw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 24 Jun 2024 09:36:13 +0200
Message-ID: <CAFULd4YAeF7=q7DYUh016kabxS8b32qRbFqDBJQrvLq6RjwEVg@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 8:07=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 23 Jun 2024 at 13:48, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Now, from having looked a bit at this, I can point you to the
> > differences introduced by having to have the emulation fallback.
>
> Ahh.
>
> Itr does all the same things *and* it has
>
>     "S" (_ptr)
>
> as an added register pressure, because if we take the "call
> cmpxchg8b_emu", we need the address in a fixed place.
>
> I don't see any immediately obvious workaround.

A real fix, not only a workaround, is to rewrite asm arguments to
something like (untested, but "should work"TM):

#define __arch_cmpxchg64_emu(_ptr, _old, _new, _lock_loc, _lock) \
({ \
union __u64_halves o =3D { .full =3D (_old), }, \
  n =3D { .full =3D (_new), }; \
\
asm volatile(ALTERNATIVE(_lock_loc \
"call cmpxchg8b_emu", \
_lock "cmpxchg8b %a[ptr]", X86_FEATURE_CX8) \
    : "+a" (o.low), "+d" (o.high) \
    : [ptr] "S" (_ptr), \
      "b" (n.low), "c" (n.high) \
    : "memory"); \
\
o.full; \
})

(and in a similar way for __arch_try_cmpxchg64_emu).

We already have a memory clobber in the asm template, so to solve the
register pressure issue, just reuse the pointer in %esi to also form
the memory address of cmpxchg8b. GCC is smart enough to do this by
itself, but the current asm template indeed doesn't force "other"
compilers to do so.

Uros.
