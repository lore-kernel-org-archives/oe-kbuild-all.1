Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA67E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnuQmjXr"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-da41acaea52so6750197276.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 01:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700042260; x=1700647060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxy7nTYceeIMGjEVGQxX/YT9AqCUKCeE9lgm8uccCT4=;
        b=QnuQmjXrOnjDvJRfKfxrjOGSCq3uOg7URsCmWI5DKagUU23mP4pQZV6TSU9p2+OSKY
         4r+/dF1kvk3ggRHCvOeSnfwwRNLWer0ocdsaxOK2N+hRju48oH3cayh2B0dje23prh4f
         CXa5ckW/nFeYsZPR5xdVwppvk/SLTY0s82TXQidkubtOB4Z0nMypIg78UJFahLVVfT99
         243TkH4ta0Kw9kwr/eOxILo5cg9iIE8DVKH3DxvuS3k+bcjNwr1jQzTglWzkqwkLeCxx
         uws/pjmu0nk3FvQQJsTgsbR8ALuNOxpgAW9LtBuTzxrasglHden+ZbHJNFHbvaNoCVRm
         moPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700042260; x=1700647060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxy7nTYceeIMGjEVGQxX/YT9AqCUKCeE9lgm8uccCT4=;
        b=vkZQVvWTBk735LTZnxKxFP2BoDkigXIKrPv3+ZmD4JbZIhtsvfxRCMuJjzm9lgxaGh
         Y4MTI1fKwzCxrwvPlAF+EOQoNCUpaIM6LGJVlKuUg1o4qPvtbGbcPjPHVo+/BJw2VRaS
         VzXDYQoBJzppclvK8+ZlHiinCnw+H4EyDCuZarII2GyaVYOD8Ug80fEt9wG9t8gWfCf6
         98rGGh3VKuELZm+chSwlUwbZy3BALED4H1b84ib0LSQ4U1FzmsczMZbm86NERCYNH7Z+
         N4BGtVCovX+TQHT5rSQIxvChaGSt1Zto2kKW94gA8tcw9m2HdqyQGswXP9PVa0WVESd3
         Xh+Q==
X-Gm-Message-State: AOJu0YxItrEpI2327TE9U6H0EN9vkvKJ14iFVkqtlAuqf9sxjctNr51L
	d1HLN6mTMd/rDS86ZICRdQ2M5vFkNOf446B9dbq93w==
X-Google-Smtp-Source: AGHT+IE8l72Zgp6nDJmZC+s4rfzTpiWGu51MgRFVg3gT9ebkkrIspH3XlMc+cp/SAkSZhKB7hoQkq9kBvgdARepxof0=
X-Received: by 2002:a25:b199:0:b0:d9b:417:139c with SMTP id
 h25-20020a25b199000000b00d9b0417139cmr11369274ybj.60.1700042259999; Wed, 15
 Nov 2023 01:57:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311071303.JJMAOjy4-lkp@intel.com> <CACRpkdb4d9pfstqDTZoBSqOSS4d4vLOUCnS6AKcMjLZ8TTQ2Wg@mail.gmail.com>
 <20231115093742.GA32655@ediswmail.ad.cirrus.com>
In-Reply-To: <20231115093742.GA32655@ediswmail.ad.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Nov 2023 10:57:29 +0100
Message-ID: <CACRpkdYHJcx8gDsa5P2eLBh6iaVQzZY+-4eMJPKtnQTq3uR6oQ@mail.gmail.com>
Subject: Re: drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting
 "LOCHNAGAR1_" and "(" does not give a valid preprocessing token
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 10:37=E2=80=AFAM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Tue, Nov 14, 2023 at 02:40:38PM +0100, Linus Walleij wrote:
> > On Tue, Nov 7, 2023 at 6:19=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> >
> > > >> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting "=
LOCHNAGAR1_" and "(" does not give a valid preprocessing token
> > >       52 |         .name =3D NAME, .type =3D LN_PTYPE_GPIO, .reg =3D =
LOCHNAGAR##REV##_##REG, \
> > >          |                                                     ^~~~~~=
~~~
> > >    drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansio=
n of macro 'LN_PIN_GPIO'
> > >       67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
> > >          |         ^~~~~~~~~~~
> >
> > I looked a bit at this, can this be due to the fact that the macros use=
 defines
> > from include/dt-bindings/...* and that MIPS does not use these includes
> > somehow, such as not using the same dtc compiler?
> >
> > Rob, do you know the story of how MIPS interoperates with <dt-bindings/=
*>?
> >
>
> Is that what is going on here? I though this was the long standing
> problem that MIPS has some global define for RST so the macro that
> string pastes that in, no longer pastes in the letters RST but some
> value instead.

That sounds plausible :D

> It has somewhat been on my radar to fix at some point, but I have
> in general been a little unsure how to proceed. RST feels like
> a mega over generic macro name to be exporting, so in some ways
> feels like fixing that would be nice. On the other side, renaming
> the register on the Lochnagar side would be very easy, although it
> would mean the register naming no longer matches all the hardware
> documentation which would be kinda lame.

If MIPS breaks things like this because of weird defines I would say
it is actually fair to just quirk it in Kconfig with a comment:

  # MIPS occupy very generic defines
  depends on !MIPS

Yours,
Linus Walleij
