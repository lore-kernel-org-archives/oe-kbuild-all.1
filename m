Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562003559DD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488856; cv=none; b=sLJyReRvY+ge21nQVUe1KM7AOWii6RI/o6CP5yoQlTeB1OvZ7vWhmJVQnkan4RpuQzT6/B6om/CW3Q8Y9KcQIpY/wxOqTGGM0kurbSJ3SEH29oXpJ8+iot3xZ+Cv4MqNnbP7/aS/dJT1tiiLnZRjPoBk17Wt/HteKb3auAssNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488856; c=relaxed/simple;
	bh=4LnHrUv85Lc6LbBsXJbtJP8iA00XVklN5h9tmo9QtjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/LzIGVi3yONSA6c92Moc8YBjY5VQ+jUi3Ta9+IaG/XEp3dTylRUP9x6Ugj6H0+/TtYlPSzSo/AkKv97XwRcPWtzKY+i2K2egcQ8Ty3gNwxdEG9+zTE40/XGjBXF65MDzTysOk9rtBY6llE6h9+VDn/JwZ1ypDkc1ibFLPBV6pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxCfQYpM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxCfQYpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18453C16AAE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488856;
	bh=4LnHrUv85Lc6LbBsXJbtJP8iA00XVklN5h9tmo9QtjM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TxCfQYpMj7N2wP0R2l0Qjj/jUiMxt2lfVWiRP4Tj4gsj4jbcG0MCAyTCDhsse3p16
	 DZAhxU4kQdB2eCvE4EIPYc0B/Xj/Fj46cOM8rDqIdjQR/Sx9MQNW32L5+gvPJq2J4k
	 p99fVdkVErZBcmfK64QHZL/1Y/DznB8zq4LCFvODwIwhP12GC5hoE3LkS7emwSaqlm
	 nO5bhVFQP8c/u/8PA/CBfvq/CiljxiKVApQUMSzdGZt1YaHZ9hdRCLuomVPRN153vU
	 5TUZn9Lrcz++MLJAr3H6jl8cBrD3L54C/W4jIjK3Xa0s1tzzwsgTWsR4MIed5OpTw7
	 dKBIcwo+SN03g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so1040194e87.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 06:54:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFiJGb2/UfmPB6L+lM0tqWsYStfLisPJ8ZecfqyT4O2mknJbT0l1oRZkeuVcZAxxbJkIzXUU3oXp5Wotl6@lists.linux.dev
X-Gm-Message-State: AOJu0YxhDpeGl8lp4440KVNC3wiORa7MkH8cXRVBWAnytazqZA3iwWv6
	eZACr4GbglD16ujviZEDiG3wBb0C8TktxNQ+r6dPAjSStHeMLk7864QKXVwP59YCCEGTFfDSUAe
	AhjU0kcVZNci58o/0ug11QYdMneRbAuE=
X-Received: by 2002:a05:6512:3e23:b0:594:2b58:ab83 with SMTP id
 2adb3069b0e04-59ba0f84fc1mr1894110e87.40.1768488854732; Thu, 15 Jan 2026
 06:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com> <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com> <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
 <aTSj8uKD6G0cLq2T@smile.fi.intel.com> <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
 <aTbTDSIHPdW8kUbR@smile.fi.intel.com> <aTbbRhNkwCjaryFo@pathway>
 <CAJ-ks9nwDCxrqyUx8vnEjy2s4c4uBPZsQFuOsbyXxzO7k1JeFg@mail.gmail.com> <aUEwre1bkwrj-i4i@pathway.suse.cz>
In-Reply-To: <aUEwre1bkwrj-i4i@pathway.suse.cz>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 15 Jan 2026 09:53:37 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nxvdWRp_Am0b6SoxXnrqDmm5kA=4ypXVZofLaLvqkjxg@mail.gmail.com>
X-Gm-Features: AZwV_Qj9226-Mwqri7iqgNaqjWHLwsdJh8WZCeuCGhZbE9QToIcp0nFEepwXH4o
Message-ID: <CAJ-ks9nxvdWRp_Am0b6SoxXnrqDmm5kA=4ypXVZofLaLvqkjxg@mail.gmail.com>
Subject: Re: [PATCH] printf: add __printf attribute
To: Petr Mladek <pmladek@suse.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 5:13=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Mon 2025-12-08 16:07:28, Tamir Duberstein wrote:
> > On Mon, Dec 8, 2025 at 9:06=E2=80=AFAM Petr Mladek <pmladek@suse.com> w=
rote:
> > >
> > > On Mon 2025-12-08 15:30:53, Andy Shevchenko wrote:
> > > > On Sun, Dec 07, 2025 at 08:32:53PM -0500, Tamir Duberstein wrote:
> > > > > On Sat, Dec 6, 2025 at 4:45=E2=80=AFPM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein wrot=
e:
> > > > > > > On Sat, Dec 6, 2025 at 2:43=E2=80=AFPM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein =
wrote:
> > > > > > > > > On Sat, Dec 6, 2025 at 12:49=E2=80=AFPM Andy Shevchenko
> > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberst=
ein wrote:
> > > > > > > > > > > On Sat, Dec 6, 2025 at 11:11=E2=80=AFAM Andy Shevchen=
ko
> > > > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Dub=
erstein wrote:
> > > >
> > > > ...
> > > >
> > > > > > > > > > > > > -static void
> > > > > > > > > > > > > +static void __printf(2, 3)
> > > > > > > > > > > >
> > > > > > > > > > > > 3?!
> > > > > > > > > > > >
> > > > > > > > > > > > I think it should be (2, 0). Yes, the both users ca=
ll it with "%p..." in format
> > > > > > > > > > > > string, but the second parameter tells compiler to =
check the variadic
> > > > > > > > > > > > arguments, which are absent here. Changing 'const v=
oid *p' to '...' will align
> > > > > > > > > > > > it with the given __printf() attribute, but I don't=
 know if this what we want.
> > > > > > > > > > >
> > > > > > > > > > > The second parameter is the first-to-check, it is not=
 specific to
> > > > > > > > > > > variadic arguments. Using 0 means that no arguments a=
re checkable, so
> > > > > > > > > > > the compiler only validates the format string itself =
and won=E2=80=99t
> > > > > > > > > > > diagnose mismatches with `p`. This works whether or n=
ot we later
> > > > > > > > > > > change `const void *p` to `...`.
> > > > > > > > > >
> > > > > > > > > > Yes, but this is fragile. As I explained it works only =
because we supply
> > > > > > > > > > the format string stuck to "%p", anything else will req=
uire reconsidering
> > > > > > > > > > the function prototypes. So, strictly speaking this sho=
uld be (2, 0) if
> > > > > > > > > > we leave const void *p as is.
> > > > > > > > > >
> > > > > > > > > I believe this is not correct. As I said, 0 means "do not=
 check
> > > > > > > > > arguments" so only the format string will be checked. See=
 the existing
> > > > > > > > > uses of this annotation in this file:
> > > > > > > > >
> > > > > > > > > static void __printf(7, 0)
> > > > > > > > > do_test(struct kunit *kunittest, const char *file, const =
int line, int
> > > > > > > > > bufsize, const char *expect,
> > > > > > > > > int elen, const char *fmt, va_list ap)
> > > > > > > > >
> > > > > > > > > and
> > > > > > > > >
> > > > > > > > > static void __printf(6, 7)
> > > > > > > > > __test(struct kunit *kunittest, const char *file, const i=
nt line,
> > > > > > > > > const char *expect, int elen,
> > > > > > > > > const char *fmt, ...)
> > > > > >
> > > > > Since it doesn't make much sense to make this function variadic, =
I
> > > > > think the best we can do is a macro wrapper that combines this
> > > > > function with `no_printk`. Something like
> > > > >
> > > > > #define test_hashed(kunittest, fmt, p) \
> > > > > do { \
> > > > > if (0) \
> > > > > no_printk(fmt, p); \
> > > > > __test_hashed(kunittest, fmt, p);\
> > > > > } while (0)
> > > >
> > >
> > > IMHO, this is is not worth it. test_hashed(kunittest, fmt, p) calls
> > > test(buf, fmt, p). It goes down to __test() which does the format
> > > check:
> > >
> > > static void __printf(6, 7)
> > > __test(struct kunit *kunittest, const char *file, const int line, con=
st char *expect, int elen,
> > >         const char *fmt, ...)
> > >
> > >
> > > > > That would give us better diagnostics, but is more complex (and m=
ore
> > > > > lines of code than just repeating this function's body twice, whi=
ch
> > > > > would also give good diagnostics). I think the best thing to do i=
s just
> > > > > to ignore the report that prompted me to look into this. Please l=
et me
> > > > > know if you disagree.
> > > >
> > > > I think we may not ignore the report as it breaks builds in some ca=
ses.
> > > > As I said
> > > >
> > > > - __printf(2, 0) for now
> > > >
> > > > - and perhaps a comment on top to explain the clang approach that m=
ay cope
> > > > with fixed-argument functions for -Wformat (you can even put a link=
 to that
> > > > LLVM discussion about the feature).
> > >
> > > I personally prefer this way. We just need to calm down the warning.
> > > The proper check is done by the nested test()...
> >
> > The nested `__test()` call cannot do the proper check because it cannot
> > see the format string. Right?
>
> IMHO, it does see the format string. It is defined the following way:
>
> static void __printf(6, 7)
> __test(struct kunit *kunittest, const char *file, const int line, const c=
har *expect, int elen,
>         const char *fmt, ...)
>
> #define test(expect, fmt, ...)                                  \
>         __test(kunittest, __FILE__, __LINE__, expect, strlen(expect), fmt=
, ##__VA_ARGS__)
>
> static void
> test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
> {
>         char buf[PLAIN_BUF_SIZE];
>
>         plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
>
>         test(buf, fmt, p);
> }
>
>
> Now, let's get for example:
>
>         test_hashed(kunittest, "%p", PTR_INVALID);
>
> it calls:
>
>         test(buf, "%p", PTR_INVALID);
>
> which is exapnded to:
>
>         __test(kunittest, file, line, buf, strlen(buf), "%p", PTR_INVALID=
)
>
> so, it gets the same printf arguments as the original test_hashed,
> namely:
>
>         %p, PTR_INVALID
>
> Or do I miss anything, please?

the problem is that test_hashed is a function, not a macro, so it is
not correct to say that

test_hashed(kunittest, "%p", PTR_INVALID)

is expanded to

__test(kunittest, file, line, buf, strlen(buf), "%p", PTR_INVALID)

thus the compiler cannot perform any meaningful checking of the
test_hashed call.

We could make test_hashed a macro, though.

> You might argue that it works by chance and that it might change in the
> future. But I have hard times to imagine it. test_hashed() is just
> a wrapper around "test()". The only purpose is to fill "buf" with
> the expected outcome.
>
> If any refactoring is needed in the future. The __printf() macros
> would need some refactoring as well.
>
> Best Regards,
> Petr

Apologies for taking a month to reply here.
