Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ADD295DBD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765043611; cv=none; b=KInIgsd8k5WSjcaBN4S+doN+H6H7MIL2I7Cv1qYSNmt0Cl8/ythzLblNHY0Q17c/rpcMUy9B6szq5hRKwu1Ddx9pgMhYjkd4AItY1mJDD3Xn48J77nm43GEl+EIiVDuBT4rdcrAml6x1B55S+4Sn36erfeoObiKKMe6duqKumOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765043611; c=relaxed/simple;
	bh=gwyl/wq8tR3vEw9+R8H8XkG6rp+qE/J1pPTYdjfW2JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By05QcmvboS2yaZxwrHTWi1WV6DWMHkfXd9Uu79e8YWRH2Y5DRI1IgU/WJSFeMEl00lgSseneXsM2evazfq8GEY/APmFX4D53H/g6Schgct1JCurEs8bqFuB/TcD5oRNnIrBaRnXUXK+/c3qmj4RufMTlZdGmt2OFw3CzXv2R+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXEG+p0d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXEG+p0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328F0C4AF0B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 17:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765043611;
	bh=gwyl/wq8tR3vEw9+R8H8XkG6rp+qE/J1pPTYdjfW2JI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FXEG+p0dKFz7SL0JoljOXEdzV503OTREx8l3U6PQgv2qzVuO5ya/mcUWB08Jkuigk
	 +T8P94Wy7zTtQSS1ae55t+vjXM+f/Qy4FOjdHCVblcplb0DGltloVRILPH5JIrFkZF
	 kLwVVzgi0oIyRE4DTv3m0t7F0lMbWUkOYDUv7eL+f5SMO//Rg/e2NPHEKCP+uKxZim
	 YTHFuORx73PMXATTSMpla2OABgrMw3Jkvm9OmNiwmkX+yDdliI+dbGwj/WS7KViND7
	 jHaXNG+upu1xamoOspRSLYmK7mPVbkfyqYPus0RFbqlJgzphLft/vDxs7WvqlFNHNl
	 hHi8+YKWAG/NQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso27889631fa.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Dec 2025 09:53:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWljR17LCZa7Az38PI6l/7bTX2VX8bweO1SOxRxweyh6Q+F1Wo3gJDcV2+4z0LNfgMEhWE/RIm/1nWx5/hV@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk+mwzz8Z3tx9Hp5PLfMbbUG6O4XaWKdsMCG9OWW4l9cQuNbrS
	YyphwdxGkde6l/wmHGk5MV9kRchZrF71pt4adiASmCJxmL80r7Hc6XC4B9kljS6JbEWqo6nT3eD
	X3LQF3k8bWYHp8L/nn9nhFnpz69LNYJY=
X-Google-Smtp-Source: AGHT+IFVdB1eQj7Oew3KEgTfiIu9BQtApmqHlrxqFkij+ig2+9mX+ccXPhTuSqB5BL5f0ud/tM32Xcy+GPMa5ePyt9w=
X-Received: by 2002:a2e:8a96:0:b0:378:ec26:bac with SMTP id
 38308e7fff4ca-37ed1fd5b7emr8205261fa.15.1765043609843; Sat, 06 Dec 2025
 09:53:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
 <aTRVusbSqh5ZBY-o@smile.fi.intel.com> <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com>
In-Reply-To: <aTRss_EHjqH21NEV@smile.fi.intel.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 6 Dec 2025 12:52:53 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
X-Gm-Features: AQt7F2qh6HS0NC9hBwRz-YDhlK0uBo7r-jHhzvwQkkwREY1tvIjqWGjjXQgCgRI
Message-ID: <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
Subject: Re: [PATCH] printf: add __printf attribute
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 12:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > On Sat, Dec 6, 2025 at 11:11=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:
>
> ...
>
> > > > -static void
> > > > +static void __printf(2, 3)
> > >
> > > 3?!
> > >
> > > I think it should be (2, 0). Yes, the both users call it with "%p..."=
 in format
> > > string, but the second parameter tells compiler to check the variadic
> > > arguments, which are absent here. Changing 'const void *p' to '...' w=
ill align
> > > it with the given __printf() attribute, but I don't know if this what=
 we want.
> >
> > The second parameter is the first-to-check, it is not specific to
> > variadic arguments. Using 0 means that no arguments are checkable, so
> > the compiler only validates the format string itself and won=E2=80=99t
> > diagnose mismatches with `p`. This works whether or not we later
> > change `const void *p` to `...`.
>
> Yes, but this is fragile. As I explained it works only because we supply
> the format string stuck to "%p", anything else will require reconsidering
> the function prototypes. So, strictly speaking this should be (2, 0) if
> we leave const void *p as is.
>
> --
> With Best Regards,
> Andy Shevchenko

I believe this is not correct. As I said, 0 means "do not check
arguments" so only the format string will be checked. See the existing
uses of this annotation in this file:

static void __printf(7, 0)
do_test(struct kunit *kunittest, const char *file, const int line, int
bufsize, const char *expect,
int elen, const char *fmt, va_list ap)

and

static void __printf(6, 7)
__test(struct kunit *kunittest, const char *file, const int line,
const char *expect, int elen,
const char *fmt, ...)

as you can see, 0 is used only when the arguments are not in the
function prototype at all. When variadic arguments are present, N+1 is
used.

Cheers.
Tamir
