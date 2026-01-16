Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230973939BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580822; cv=none; b=K9IWfamy/nrOC4xUrDrDGYMk5cFdBWIWK9WUK7XHTlvY2GBUFZIlaaaAKOrNQ2LncuDCBOZqXi2AQ9pGdjH7VZWlaf0Avmvv1mAHQHoi5gKMadikJ0sZ1ZuMhOdYtn53xTnp3RdDbn58mI3JXQ/xj8DzYYhKEwvteVn4NliRPeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580822; c=relaxed/simple;
	bh=dvHRITCmaTRkAZdnwAC+ehjOVNx5+MmdzwXHudNXKi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cB11wgcOtm7MLsrZMksJpfTmsk0livuCWjeRWXTQFi/ZvGtWhJnJczRVDFE/HMcg8uEVwZzb7fcSjGhwd9lJqOEkyK9bEdVYXIfC6anRZwupTX5Ton3vdMh6hEo86SGbiUuLKXCspLJT1wUeVhqMmBN/dEgSmWcCpMVIg43+yQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h684v8T7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h684v8T7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5BAC19425
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768580821;
	bh=dvHRITCmaTRkAZdnwAC+ehjOVNx5+MmdzwXHudNXKi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h684v8T7Jjyte1SzoTWfhWzxCzaTd/mW2S2o9mqwLdzAWFvtwDNqXOG3uD/RBrLDw
	 C2sogNB98jraP5997mXBcjYAe+yBkM2SDTJr4+XPEaPLJ2JVteiiUOp15Wl6k9+N4C
	 CAfoWXE2+51Zuj4DzTITNNDdOI1t8O696aObFpcwi9KtLNWjpBOsqiddTrX8ooYQfh
	 BcgESqqD8b9YitHyO/AMuBseIelbd0mblPwo1hfHBDUhTJVRfaRLX3P7xXUvA0xfwU
	 OJgefKU4oVbmdfXKe4Br5KnHYjKu1YvhIVailatXJYE1kD8F7NF3e/dGJIGLEVW8jK
	 c9NQOjii6exPg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-382fe06aa94so18232221fa.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 08:27:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvNJkQUIJ2GzsKkYipjmDaTxgbSh3ahX3+ZIRi8WuQ4vs3yKq3203LkVPZXN4o3p+FBO9xnmQeiuJoaHjZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq0PctgaqoofVbckyriOzrFPc3IjdXhUYU/a0R/CUm/7zdkWB0
	csS6KfjjAf78ozE14MCT887lVGIZlhKHiJGv8NesqLrpcUKXGppxLtGRAfWPdGgtQDu6awPCWi5
	cDdNSDOt9OD+JEzuXYSXBVCeYVTZFZ2k=
X-Received: by 2002:a05:651c:19a3:b0:383:1454:926b with SMTP id
 38308e7fff4ca-383866cfb44mr9806811fa.10.1768580820282; Fri, 16 Jan 2026
 08:27:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com> <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
 <aTSj8uKD6G0cLq2T@smile.fi.intel.com> <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
 <aTbTDSIHPdW8kUbR@smile.fi.intel.com> <aTbbRhNkwCjaryFo@pathway>
 <CAJ-ks9nwDCxrqyUx8vnEjy2s4c4uBPZsQFuOsbyXxzO7k1JeFg@mail.gmail.com>
 <aUEwre1bkwrj-i4i@pathway.suse.cz> <CAJ-ks9nxvdWRp_Am0b6SoxXnrqDmm5kA=4ypXVZofLaLvqkjxg@mail.gmail.com>
 <aWoFjigXmIfo5vBJ@pathway.suse.cz>
In-Reply-To: <aWoFjigXmIfo5vBJ@pathway.suse.cz>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 16 Jan 2026 11:26:22 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9ntXroeNjUft9DNbhtU3NMnDxX-UDoV+O6818c0o1+ujw@mail.gmail.com>
X-Gm-Features: AZwV_Qj3imW36tyHNUUF-r2sHO4Of83QxdgrT_0regrYcDSRWL00nicUKQ-d-as
Message-ID: <CAJ-ks9ntXroeNjUft9DNbhtU3NMnDxX-UDoV+O6818c0o1+ujw@mail.gmail.com>
Subject: Re: [PATCH] printf: add __printf attribute
To: Petr Mladek <pmladek@suse.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 4:32=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Thu 2026-01-15 09:53:37, Tamir Duberstein wrote:
> > On Tue, Dec 16, 2025 at 5:13=E2=80=AFAM Petr Mladek <pmladek@suse.com> =
wrote:
> > >
> > > On Mon 2025-12-08 16:07:28, Tamir Duberstein wrote:
> > > > On Mon, Dec 8, 2025 at 9:06=E2=80=AFAM Petr Mladek <pmladek@suse.co=
m> wrote:
> > > > >
> > > > > On Mon 2025-12-08 15:30:53, Andy Shevchenko wrote:
> > > > > > On Sun, Dec 07, 2025 at 08:32:53PM -0500, Tamir Duberstein wrot=
e:
> > > > > > > On Sat, Dec 6, 2025 at 4:45=E2=80=AFPM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein =
wrote:
> > > > > > > > > On Sat, Dec 6, 2025 at 2:43=E2=80=AFPM Andy Shevchenko
> > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberst=
ein wrote:
> > > > > > > > > > > On Sat, Dec 6, 2025 at 12:49=E2=80=AFPM Andy Shevchen=
ko
> > > > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Dub=
erstein wrote:
> > > > > > > > > > > > > On Sat, Dec 6, 2025 at 11:11=E2=80=AFAM Andy Shev=
chenko
> > > > > > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir=
 Duberstein wrote:
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > > > > > > > > > > -static void
> > > > > > > > > > > > > > > +static void __printf(2, 3)
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > 3?!
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I think it should be (2, 0). Yes, the both user=
s call it with "%p..." in format
> > > > > > > > > > > > > > string, but the second parameter tells compiler=
 to check the variadic
> > > > > > > > > > > > > > arguments, which are absent here. Changing 'con=
st void *p' to '...' will align
> > > > > > > > > > > > > > it with the given __printf() attribute, but I d=
on't know if this what we want.
> > > > > > > > > > > > >
> > > > > > > > > > > > > The second parameter is the first-to-check, it is=
 not specific to
> > > > > > > > > > > > > variadic arguments. Using 0 means that no argumen=
ts are checkable, so
> > > > > > > > > > > > > the compiler only validates the format string its=
elf and won=E2=80=99t
> > > > > > > > > > > > > diagnose mismatches with `p`. This works whether =
or not we later
> > > > > > > > > > > > > change `const void *p` to `...`.
> > > > > > > > > > > >
> > > > > > > > > > > > Yes, but this is fragile. As I explained it works o=
nly because we supply
> > > > > > > > > > > > the format string stuck to "%p", anything else will=
 require reconsidering
> > > > > > > > > > > > the function prototypes. So, strictly speaking this=
 should be (2, 0) if
> > > > > > > > > > > > we leave const void *p as is.
> > > > > > > > > > > >
> > > > > > > > > > > I believe this is not correct. As I said, 0 means "do=
 not check
> > > > > > > > > > > arguments" so only the format string will be checked.=
 See the existing
> > > > > > > > > > > uses of this annotation in this file:
> > > > > > > > > > >
> > > > > > > > > > > static void __printf(7, 0)
> > > > > > > > > > > do_test(struct kunit *kunittest, const char *file, co=
nst int line, int
> > > > > > > > > > > bufsize, const char *expect,
> > > > > > > > > > > int elen, const char *fmt, va_list ap)
> > > > > > > > > > >
> > > > > > > > > > > and
> > > > > > > > > > >
> > > > > > > > > > > static void __printf(6, 7)
> > > > > > > > > > > __test(struct kunit *kunittest, const char *file, con=
st int line,
> > > > > > > > > > > const char *expect, int elen,
> > > > > > > > > > > const char *fmt, ...)
> > > > > > > >
> > > > > > > Since it doesn't make much sense to make this function variad=
ic, I
> > > > > > > think the best we can do is a macro wrapper that combines thi=
s
> > > > > > > function with `no_printk`. Something like
> > > > > > >
> > > > > > > #define test_hashed(kunittest, fmt, p) \
> > > > > > > do { \
> > > > > > > if (0) \
> > > > > > > no_printk(fmt, p); \
> > > > > > > __test_hashed(kunittest, fmt, p);\
> > > > > > > } while (0)
> > > > > >
> > > > >
> > > > > IMHO, this is is not worth it. test_hashed(kunittest, fmt, p) cal=
ls
> > > > > test(buf, fmt, p). It goes down to __test() which does the format
> > > > > check:
> > > > >
> > > > > static void __printf(6, 7)
> > > > > __test(struct kunit *kunittest, const char *file, const int line,=
 const char *expect, int elen,
> > > > >         const char *fmt, ...)
> > > > >
> > > > >
> > > > > > > That would give us better diagnostics, but is more complex (a=
nd more
> > > > > > > lines of code than just repeating this function's body twice,=
 which
> > > > > > > would also give good diagnostics). I think the best thing to =
do is just
> > > > > > > to ignore the report that prompted me to look into this. Plea=
se let me
> > > > > > > know if you disagree.
> > > > > >
> > > > > > I think we may not ignore the report as it breaks builds in som=
e cases.
> > > > > > As I said
> > > > > >
> > > > > > - __printf(2, 0) for now
> > > > > >
> > > > > > - and perhaps a comment on top to explain the clang approach th=
at may cope
> > > > > > with fixed-argument functions for -Wformat (you can even put a =
link to that
> > > > > > LLVM discussion about the feature).
> > > > >
> > > > > I personally prefer this way. We just need to calm down the warni=
ng.
> > > > > The proper check is done by the nested test()...
> > > >
> > > > The nested `__test()` call cannot do the proper check because it ca=
nnot
> > > > see the format string. Right?
> > >
> > > IMHO, it does see the format string. It is defined the following way:
> > >
> > > static void __printf(6, 7)
> > > __test(struct kunit *kunittest, const char *file, const int line, con=
st char *expect, int elen,
> > >         const char *fmt, ...)
> > >
> > > #define test(expect, fmt, ...)                                  \
> > >         __test(kunittest, __FILE__, __LINE__, expect, strlen(expect),=
 fmt, ##__VA_ARGS__)
> > >
> > > static void
> > > test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
> > > {
> > >         char buf[PLAIN_BUF_SIZE];
> > >
> > >         plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
> > >
> > >         test(buf, fmt, p);
> > > }
> > >
> > >
> > > Now, let's get for example:
> > >
> > >         test_hashed(kunittest, "%p", PTR_INVALID);
> > >
> > > it calls:
> > >
> > >         test(buf, "%p", PTR_INVALID);
> > >
> > > which is exapnded to:
> > >
> > >         __test(kunittest, file, line, buf, strlen(buf), "%p", PTR_INV=
ALID)
> > >
> > > so, it gets the same printf arguments as the original test_hashed,
> > > namely:
> > >
> > >         %p, PTR_INVALID
> > >
> > > Or do I miss anything, please?
> >
> > the problem is that test_hashed is a function, not a macro, so it is
> > not correct to say that
> >
> > test_hashed(kunittest, "%p", PTR_INVALID)
> >
> > is expanded to
> >
> > __test(kunittest, file, line, buf, strlen(buf), "%p", PTR_INVALID)
> >
> > thus the compiler cannot perform any meaningful checking of the
> > test_hashed call.
> >
> > We could make test_hashed a macro, though.
>
> I am sorry but I still think that it is not worth it.
> The proposed changes add more complexity or weird stuff for a little gain=
.
>
> > > You might argue that it works by chance and that it might change in t=
he
> > > future. But I have hard times to imagine it. test_hashed() is just
> > > a wrapper around "test()". The only purpose is to fill "buf" with
> > > the expected outcome.
> > >
> > > If any refactoring is needed in the future. The __printf() macros
> > > would need some refactoring as well.
>
> IMHO, the above is still valid.

I don't follow this reasoning. Having said that, you're the ultimate
decider on whether this is worth addressing.

I will send v2 with the macro solution so we have it on the list, you
can then decide whether to take it.

The next version will come from my @kernel.org address.

Cheers.
Tamir
