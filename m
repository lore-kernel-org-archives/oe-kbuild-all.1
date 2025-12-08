Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F5621423C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765228087; cv=none; b=OQIks4P/INltmjTnUvj8H2xRdqwn/Q/zrpRaohxq9aBJ94qOQ42BY/u2BZWF9YXSD+QGC9bDZqwwuxXQBQva6g9zVA7H1LkSlBtw5EOR7QMhzYY0i4iJ313NqY3nHY5D8STPi7rX3aDBEfu+rs6GTZhGi/qRejfTbjqnPThtsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765228087; c=relaxed/simple;
	bh=qzQ8PBq+RWBv47TtEy2djTsKvl4i3qeFBFFX61ECc/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmBb4IDAm07o1EgT6TRztiC5XR8gyjZ8TtSkkMz8EHijOV32uWb8aG5J8QVOzc3a4SnU0mqZQdtkuyqHq93fdrB8yudJmtuDoQ9pfOFILAwCC6JUnL3bcvU67EdYVBRt4fS16ingHtcVNZ0WXDNzc7DDZm/Foxp/Y8oM6Ag47/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxrb5j5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxrb5j5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AD3C19422
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 21:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765228087;
	bh=qzQ8PBq+RWBv47TtEy2djTsKvl4i3qeFBFFX61ECc/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jxrb5j5xSVfpK8G7iH73MXDLswAcKjS0YKZvPA8AF8dHH69BkJo4meMvB07M2k+4X
	 gRWvOB5vmLWT+zHZdOZzi4UpZQ2RqN/rlhSeO/a2ACsUcnUCROAdaDIfMnYrmO5Et3
	 DLiV4HACiiuw50s2rDld6TJ9r2iK/QajAA8jyoSmhKydM/qVdtWK8g+BHYSzZSZ+QS
	 iP3iEjlEdnS3cYZieRfC1GA8IzSfKdEfFjCUudChXGuarIP4spR/w7G6W2ynoZRUS9
	 uTcus7fMR5mVFDnxpAQEGFrRBlO7eGF8XOrM9G2JM7zUTQUrL7jhsmLFg5NfVim41E
	 dc9iJ61MLxN6A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b96cbd875so36127801fa.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Dec 2025 13:08:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNvY4MjNaBUqh8fxFY+VeOkrLkD41HwP2VaVBK2cfSN8Sz4KVVpYmJ3xI3U7i79qV1XKjgQ0Sx9M3NyXel@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2p2fzRqlzVl/8mCzvyrrkKarm3qJlIEo8TP98oSKaGU4zaJR0
	C4NU5kLcQf/zijnxZz0QF4UHjr6WZffB2NrjLFd1E5eIPnYs91YnEl/hCGUinfj71B6XaeWxz8O
	kxn1pj2gpsEwY3PINOvSND8EDK4tKjPM=
X-Google-Smtp-Source: AGHT+IFlCWde3F8uQpefxZiDidDTOwOkjy2C49V4g91Bizawn0cX/P2jPr6aP/MKNzgk66izyTZwBhqH3LijgyxpxNI=
X-Received: by 2002:a05:651c:31cd:b0:37b:bafc:25e2 with SMTP id
 38308e7fff4ca-37ed839f864mr21468481fa.20.1765228085707; Mon, 08 Dec 2025
 13:08:05 -0800 (PST)
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
 <aTSj8uKD6G0cLq2T@smile.fi.intel.com> <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
 <aTbTDSIHPdW8kUbR@smile.fi.intel.com> <aTbbRhNkwCjaryFo@pathway>
In-Reply-To: <aTbbRhNkwCjaryFo@pathway>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 8 Dec 2025 16:07:28 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nwDCxrqyUx8vnEjy2s4c4uBPZsQFuOsbyXxzO7k1JeFg@mail.gmail.com>
X-Gm-Features: AQt7F2pzjWHDR810aUqEBbMVbN3A1ATz0Y71Xa_rbTI86oe94aKeZqYNyyFCuP0
Message-ID: <CAJ-ks9nwDCxrqyUx8vnEjy2s4c4uBPZsQFuOsbyXxzO7k1JeFg@mail.gmail.com>
Subject: Re: [PATCH] printf: add __printf attribute
To: Petr Mladek <pmladek@suse.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 9:06=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> On Mon 2025-12-08 15:30:53, Andy Shevchenko wrote:
> > On Sun, Dec 07, 2025 at 08:32:53PM -0500, Tamir Duberstein wrote:
> > > On Sat, Dec 6, 2025 at 4:45=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein wrote:
> > > > > On Sat, Dec 6, 2025 at 2:43=E2=80=AFPM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrot=
e:
> > > > > > > On Sat, Dec 6, 2025 at 12:49=E2=80=AFPM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein =
wrote:
> > > > > > > > > On Sat, Dec 6, 2025 at 11:11=E2=80=AFAM Andy Shevchenko
> > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberst=
ein wrote:
> >
> > ...
> >
> > > > > > > > > > > -static void
> > > > > > > > > > > +static void __printf(2, 3)
> > > > > > > > > >
> > > > > > > > > > 3?!
> > > > > > > > > >
> > > > > > > > > > I think it should be (2, 0). Yes, the both users call i=
t with "%p..." in format
> > > > > > > > > > string, but the second parameter tells compiler to chec=
k the variadic
> > > > > > > > > > arguments, which are absent here. Changing 'const void =
*p' to '...' will align
> > > > > > > > > > it with the given __printf() attribute, but I don't kno=
w if this what we want.
> > > > > > > > >
> > > > > > > > > The second parameter is the first-to-check, it is not spe=
cific to
> > > > > > > > > variadic arguments. Using 0 means that no arguments are c=
heckable, so
> > > > > > > > > the compiler only validates the format string itself and =
won=E2=80=99t
> > > > > > > > > diagnose mismatches with `p`. This works whether or not w=
e later
> > > > > > > > > change `const void *p` to `...`.
> > > > > > > >
> > > > > > > > Yes, but this is fragile. As I explained it works only beca=
use we supply
> > > > > > > > the format string stuck to "%p", anything else will require=
 reconsidering
> > > > > > > > the function prototypes. So, strictly speaking this should =
be (2, 0) if
> > > > > > > > we leave const void *p as is.
> > > > > > > >
> > > > > > > I believe this is not correct. As I said, 0 means "do not che=
ck
> > > > > > > arguments" so only the format string will be checked. See the=
 existing
> > > > > > > uses of this annotation in this file:
> > > > > > >
> > > > > > > static void __printf(7, 0)
> > > > > > > do_test(struct kunit *kunittest, const char *file, const int =
line, int
> > > > > > > bufsize, const char *expect,
> > > > > > > int elen, const char *fmt, va_list ap)
> > > > > > >
> > > > > > > and
> > > > > > >
> > > > > > > static void __printf(6, 7)
> > > > > > > __test(struct kunit *kunittest, const char *file, const int l=
ine,
> > > > > > > const char *expect, int elen,
> > > > > > > const char *fmt, ...)
> > > > > > >
> > > > > > > as you can see, 0 is used only when the arguments are not in =
the
> > > > > > > function prototype at all. When variadic arguments are presen=
t, N+1 is
> > > > > > > used.
> > > > > >
> > > > > > Yes to all what you said. And how does it object what I said? I=
n the case
> > > > > > you are trying to add __print(2, 3) the 3rd one is *not* a vari=
adic argument.
> > > > > > If you make it to be variadic, I will agree with __print(2, 3).=
 Before that
> > > > > > it doesn't look right to me even if it works.
> > > > >
> > > > > I addressed this in my first reply; the second parameter to `__pr=
int`
> > > > > is *not* specific to variadic functions. It can just as well be u=
sed
> > > > > for functions with a fixed number of arguments.
> > > >
> > > > $ make all compile_commands.json scripts_gdb ARCH=3Dum O=3D.kunit -=
-jobs=3D48
> > > > ERROR:root:../lib/tests/printf_kunit.c:272:1: error: =E2=80=98forma=
t=E2=80=99 attribute argument 3 value =E2=80=983=E2=80=99 does not refer to=
 a variable argument list
> > > >   272 | {
> > > >       | ^
> > > >
> > > > How did you compile it?
> > > >
> > > > The GCC documentation
> > > > https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Common-Function-Attri=
butes.html#index-format-function-attribute
> > > > doesn't clearly say if the fixed-argument functions are eligible fo=
r the
> > > > __attribute__((format)). The parameter is called first-to-check, wh=
ich
> > > > might imply that there is a second.
> > > >
> > > > Additionally interesting discussion to read:
> > > > https://reviews.llvm.org/D112579
> > > >
> > > > Seems it's feature of clang?
> > > >
> > > > 3147 As an extension to GCC's behavior, Clang accepts the ``format`=
` attribute on
> > > > 3148 non-variadic functions. Clang checks non-variadic format funct=
ions for the same
> > > > 3149 classes of issues that can be found on variadic functions, as =
controlled by the
> > > > 3150 same warning flags, except that the types of formatted argumen=
ts is forced by
> > > > 3151 the function signature. For example:
> > > >
> > > > Seems to me for now it has to be __printf(2, 0) or you need to put =
some special
> > > > pragma:s or so around the function to make it work for clang differ=
ently.
> > >
> > > Ah, thanks for digging that up - and as confirmed by LKP you are righ=
t
> > > of course.
> > >
> > > Since it doesn't make much sense to make this function variadic, I
> > > think the best we can do is a macro wrapper that combines this
> > > function with `no_printk`. Something like
> > >
> > > #define test_hashed(kunittest, fmt, p) \
> > > do { \
> > > if (0) \
> > > no_printk(fmt, p); \
> > > __test_hashed(kunittest, fmt, p);\
> > > } while (0)
> >
>
> IMHO, this is is not worth it. test_hashed(kunittest, fmt, p) calls
> test(buf, fmt, p). It goes down to __test() which does the format
> check:
>
> static void __printf(6, 7)
> __test(struct kunit *kunittest, const char *file, const int line, const c=
har *expect, int elen,
>         const char *fmt, ...)
>
>
> > > That would give us better diagnostics, but is more complex (and more
> > > lines of code than just repeating this function's body twice, which
> > > would also give good diagnostics). I think the best thing to do is ju=
st
> > > to ignore the report that prompted me to look into this. Please let m=
e
> > > know if you disagree.
> >
> > I think we may not ignore the report as it breaks builds in some cases.
> > As I said
> >
> > - __printf(2, 0) for now
> >
> > - and perhaps a comment on top to explain the clang approach that may c=
ope
> > with fixed-argument functions for -Wformat (you can even put a link to =
that
> > LLVM discussion about the feature).
>
> I personally prefer this way. We just need to calm down the warning.
> The proper check is done by the nested test()...

The nested `__test()` call cannot do the proper check because it cannot
see the format string. Right?
