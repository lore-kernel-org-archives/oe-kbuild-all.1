Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F343B8D7E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 01:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765157611; cv=none; b=nYqjR5QBWzpBVdT7RBfHgPkLio+Wh/oJCJfpuaj7RExPN8yMRU06bIymcGSeptkNPm4Moz5g7bSiOW62pke4iYhooAF8Kf+ncK88ib4fcqmnq9AkzYO9CQiweOAiRmsswydtnyEE7LiRwx2to1q7gJfW4RyCMQo/lVZtTsegIfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765157611; c=relaxed/simple;
	bh=LL4z08YLXZtzvSGQTE8BTZl9UhV4yfUbwujNwa2x8tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrcMtJJ/fUtfxgkKOvVgp752wMY8zo9YMDgxZ72i4hTzfRWWqKpdKmx4MH0hPqjZMPP9gSgr2Oz2t6KftO6rUSUZGZjGJdXnncCyWNoUA/3jd9gqaYVV158EsZfseSftM259GslVhQ5apw2MZ17IJNKHcJ9f6XRheUFgVIV1IJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzVccxGG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzVccxGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE44C4AF09
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 01:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765157611;
	bh=LL4z08YLXZtzvSGQTE8BTZl9UhV4yfUbwujNwa2x8tg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CzVccxGG0bPsvpRfX+HfZWtsMq/krHuv861DaIQGcVfMRq/cU6ZbDDTZkxJsqQXP1
	 6tVgQ+Sze2wc6mtr0lbQx6dNvnqnTvbv34OrVYPXldYLQfW/lTbfIKAIbGhvxYt+kb
	 4zEDJqzworouQf/X0qvCf0J4CKxDwp5Du6Fg3lXBfPk8BzPw1hv7+MKmKsVhEwPuOf
	 PcZAUlLFcZjv5UPcCD7f0v7+kpHNSSQuerAi1Tcqcc1IOfXRKMsMnWRQNHg+6EPnbk
	 VSATrfz1WrJPK9OJ0iRz2geruBinSSqhMrRo5RnAc3iDD4BupdzPSyLVOQWbKXJZ4M
	 k9mQo2UIxbofA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37a2dced861so41382801fa.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 07 Dec 2025 17:33:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXR3iiN6+ovhsfIaBwZY5IKLTgWFTn2Tcl0Ks8Nj7jAaqdfRmx+dyL0mPeXn+0sqWGgLYfwCGdqw5U9zjVa@lists.linux.dev
X-Gm-Message-State: AOJu0YzyDNCoH8tAuB4tMpm+rh5XyUTx42CyvsvNRnD7jSq1uehz3Dss
	tnMAjVuFurW48r0ch1l/zmsf1znK18/H1Vyq22AstI+hgVf4gsW8y+r1xv/k9RjQ023we1WZoMm
	PlOeViQjpMPXiXOhRIKIfHdy+x/5gJgI=
X-Google-Smtp-Source: AGHT+IFPaSxc7j3cKP2AYWrDPrgchWJnd4YVqME68sG6iQRK9K1EMLA8HhrfSd506H3WJx0+AzBFyqZDbBbLO19yhJ8=
X-Received: by 2002:a05:651c:b11:b0:378:e3a7:5dfa with SMTP id
 38308e7fff4ca-37ed83cd4f3mr15023021fa.20.1765157610010; Sun, 07 Dec 2025
 17:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
 <aTRVusbSqh5ZBY-o@smile.fi.intel.com> <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com> <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com> <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
 <aTSj8uKD6G0cLq2T@smile.fi.intel.com>
In-Reply-To: <aTSj8uKD6G0cLq2T@smile.fi.intel.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 7 Dec 2025 20:32:53 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
X-Gm-Features: AQt7F2pag3pHQPDD2frZmD1vgqqi1wieLcnzK2gsOwHHqzINml2bEwCsuvQ7S40
Message-ID: <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
Subject: Re: [PATCH] printf: add __printf attribute
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 4:45=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein wrote:
> > On Sat, Dec 6, 2025 at 2:43=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrote:
> > > > On Sat, Dec 6, 2025 at 12:49=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > > > > > On Sat, Dec 6, 2025 at 11:11=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wr=
ote:
>
> ...
>
> > > > > > > > -static void
> > > > > > > > +static void __printf(2, 3)
> > > > > > >
> > > > > > > 3?!
> > > > > > >
> > > > > > > I think it should be (2, 0). Yes, the both users call it with=
 "%p..." in format
> > > > > > > string, but the second parameter tells compiler to check the =
variadic
> > > > > > > arguments, which are absent here. Changing 'const void *p' to=
 '...' will align
> > > > > > > it with the given __printf() attribute, but I don't know if t=
his what we want.
> > > > > >
> > > > > > The second parameter is the first-to-check, it is not specific =
to
> > > > > > variadic arguments. Using 0 means that no arguments are checkab=
le, so
> > > > > > the compiler only validates the format string itself and won=E2=
=80=99t
> > > > > > diagnose mismatches with `p`. This works whether or not we late=
r
> > > > > > change `const void *p` to `...`.
> > > > >
> > > > > Yes, but this is fragile. As I explained it works only because we=
 supply
> > > > > the format string stuck to "%p", anything else will require recon=
sidering
> > > > > the function prototypes. So, strictly speaking this should be (2,=
 0) if
> > > > > we leave const void *p as is.
> > > > >
> > > > I believe this is not correct. As I said, 0 means "do not check
> > > > arguments" so only the format string will be checked. See the exist=
ing
> > > > uses of this annotation in this file:
> > > >
> > > > static void __printf(7, 0)
> > > > do_test(struct kunit *kunittest, const char *file, const int line, =
int
> > > > bufsize, const char *expect,
> > > > int elen, const char *fmt, va_list ap)
> > > >
> > > > and
> > > >
> > > > static void __printf(6, 7)
> > > > __test(struct kunit *kunittest, const char *file, const int line,
> > > > const char *expect, int elen,
> > > > const char *fmt, ...)
> > > >
> > > > as you can see, 0 is used only when the arguments are not in the
> > > > function prototype at all. When variadic arguments are present, N+1=
 is
> > > > used.
> > >
> > > Yes to all what you said. And how does it object what I said? In the =
case
> > > you are trying to add __print(2, 3) the 3rd one is *not* a variadic a=
rgument.
> > > If you make it to be variadic, I will agree with __print(2, 3). Befor=
e that
> > > it doesn't look right to me even if it works.
> >
> > I addressed this in my first reply; the second parameter to `__print`
> > is *not* specific to variadic functions. It can just as well be used
> > for functions with a fixed number of arguments.
>
> $ make all compile_commands.json scripts_gdb ARCH=3Dum O=3D.kunit --jobs=
=3D48
> ERROR:root:../lib/tests/printf_kunit.c:272:1: error: =E2=80=98format=E2=
=80=99 attribute argument 3 value =E2=80=983=E2=80=99 does not refer to a v=
ariable argument list
>   272 | {
>       | ^
>
> How did you compile it?
>
> The GCC documentation
> https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Common-Function-Attributes.=
html#index-format-function-attribute
> doesn't clearly say if the fixed-argument functions are eligible for the
> __attribute__((format)). The parameter is called first-to-check, which
> might imply that there is a second.
>
> Additionally interesting discussion to read:
> https://reviews.llvm.org/D112579
>
> Seems it's feature of clang?
>
> 3147 As an extension to GCC's behavior, Clang accepts the ``format`` attr=
ibute on
> 3148 non-variadic functions. Clang checks non-variadic format functions f=
or the same
> 3149 classes of issues that can be found on variadic functions, as contro=
lled by the
> 3150 same warning flags, except that the types of formatted arguments is =
forced by
> 3151 the function signature. For example:
>
> Seems to me for now it has to be __printf(2, 0) or you need to put some s=
pecial
> pragma:s or so around the function to make it work for clang differently.

Ah, thanks for digging that up - and as confirmed by LKP you are right
of course.

Since it doesn't make much sense to make this function variadic, I
think the best we can do is a macro wrapper that combines this
function with `no_printk`. Something like

#define test_hashed(kunittest, fmt, p) \
do { \
if (0) \
no_printk(fmt, p); \
__test_hashed(kunittest, fmt, p);\
} while (0)

That would give us better diagnostics, but is more complex (and more
lines of code than just repeating this function's body twice, which
would also give good diagnostics). I think the best thing to do is just
to ignore the report that prompted me to look into this. Please let me
know if you disagree.

My best,
Tamir
