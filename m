Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F81A4F3C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 19:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765051106; cv=none; b=XhqWJSvkn2KWx89a7xImmunCjm5QgqE1vjlIlyTA+RmPpsHjl6GB+18zjim0nFUGTjDY/mhGefsmjdzTpKWkYWnEu+g/e1TxFjsfIiSXrPwjCE2Nl30x2urukAU3m1SdSOaNJANtJf/V6Um+Wx0EKLPB8HXQGhM7RoHIFDziJ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765051106; c=relaxed/simple;
	bh=3kNCcGd7MzWbI9ZI4kAc2h6ZyRZ4Kwh4/wUNLUHdnc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkgYh2nQzxmHMBXVhXggrsAwP3QH3Tukt7IYp3491N6A/N8j44hRtFYumuQQbBryETCVisdsWpnTd20zQmY/kSMguFYHrFY0k4Q370OxLgjJupRXfcIf1G3P9tO1Q/ZbCkoad6e/DRJScHTVdD2jMpPw3Gl3l1ksIkYVKU7lHc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXe0IJ+M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXe0IJ+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438B6C19421
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765051106;
	bh=3kNCcGd7MzWbI9ZI4kAc2h6ZyRZ4Kwh4/wUNLUHdnc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kXe0IJ+MJkCA9ou4gVYmAZF6H0+Jdbz9cAxNGpxURYV3e/Op6UyeeYcrDu4c2ZBTP
	 uQTt+fwoxiCbC44hgg57uFJqzDQe8+2q3an445UbIfPVEP02pSw2ZryEMCm/ts52Dj
	 XAOKPAAPB615cP5UF0Hsfjl8I3rAfumsWRmuCLa8V7T+kA624dWgPb0u9U6bJ6om3A
	 WXSd+uO0+XIkwoBM0/T078GU42dguoPBVOrKRfvCsO1tdgmHZYG0obCEQMXkj1WOJg
	 UbFEqZf+0P2ulLiYHHwq4Agq8I6OZZWpoeQQaUFicl/XabsgL0KVQOmj/zhVfJShiF
	 yQeM3oDUBLSNw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b95f87d4eso25987311fa.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Dec 2025 11:58:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8sEZPSAo2B96hlRUSj4+/HuGklJWcAJkLL9mfPji/qnmFnQGY8gHjsD+pzjEkxG+Ul34PvOy/Mkwr9znH@lists.linux.dev
X-Gm-Message-State: AOJu0YwbaX7KHCwuQ577ywCROiB68gJf2+IPdAjMSB04Krbe3Vsko3Cg
	YTi2dgrmGuySwZN4hOhvqOQcETbp718R/rU/EhbcHHHheywuODQXYqn/9cB9EAQFFSOGLP0X1Vo
	sHHpXYzyaVQG+EJrC42OjPgaIlADhJH8=
X-Google-Smtp-Source: AGHT+IEin7bVCV8oJvap8Q9t/hdgNdt3AQNsjPg1a3kRIJ+uDjUhb15sOdq9PKn2Aq3L9HnMjf4PKWGQ9rX+zmoaNbU=
X-Received: by 2002:a05:651c:f1c:b0:37a:5990:2ba8 with SMTP id
 38308e7fff4ca-37ed2064c0dmr7979171fa.23.1765051104967; Sat, 06 Dec 2025
 11:58:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
 <aTRVusbSqh5ZBY-o@smile.fi.intel.com> <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com> <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com>
In-Reply-To: <aTSHb6rHLQqopTNU@smile.fi.intel.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 6 Dec 2025 14:57:48 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
X-Gm-Features: AQt7F2qQxJicHouTG6gKzVR0roaAZ9FLYm5WH3eWu_8iQdGb6EaYMDwWPPwZVI4
Message-ID: <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
Subject: Re: [PATCH] printf: add __printf attribute
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 2:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrote:
> > On Sat, Dec 6, 2025 at 12:49=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > > > On Sat, Dec 6, 2025 at 11:11=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:
>
> ...
>
> > > > > > -static void
> > > > > > +static void __printf(2, 3)
> > > > >
> > > > > 3?!
> > > > >
> > > > > I think it should be (2, 0). Yes, the both users call it with "%p=
..." in format
> > > > > string, but the second parameter tells compiler to check the vari=
adic
> > > > > arguments, which are absent here. Changing 'const void *p' to '..=
.' will align
> > > > > it with the given __printf() attribute, but I don't know if this =
what we want.
> > > >
> > > > The second parameter is the first-to-check, it is not specific to
> > > > variadic arguments. Using 0 means that no arguments are checkable, =
so
> > > > the compiler only validates the format string itself and won=E2=80=
=99t
> > > > diagnose mismatches with `p`. This works whether or not we later
> > > > change `const void *p` to `...`.
> > >
> > > Yes, but this is fragile. As I explained it works only because we sup=
ply
> > > the format string stuck to "%p", anything else will require reconside=
ring
> > > the function prototypes. So, strictly speaking this should be (2, 0) =
if
> > > we leave const void *p as is.
> > >
> > I believe this is not correct. As I said, 0 means "do not check
> > arguments" so only the format string will be checked. See the existing
> > uses of this annotation in this file:
> >
> > static void __printf(7, 0)
> > do_test(struct kunit *kunittest, const char *file, const int line, int
> > bufsize, const char *expect,
> > int elen, const char *fmt, va_list ap)
> >
> > and
> >
> > static void __printf(6, 7)
> > __test(struct kunit *kunittest, const char *file, const int line,
> > const char *expect, int elen,
> > const char *fmt, ...)
> >
> > as you can see, 0 is used only when the arguments are not in the
> > function prototype at all. When variadic arguments are present, N+1 is
> > used.
>
> Yes to all what you said. And how does it object what I said? In the case
> you are trying to add __print(2, 3) the 3rd one is *not* a variadic argum=
ent.
> If you make it to be variadic, I will agree with __print(2, 3). Before th=
at
> it doesn't look right to me even if it works.

I addressed this in my first reply; the second parameter to `__print`
is *not* specific to variadic functions. It can just as well be used
for functions with a fixed number of arguments.
