Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0CF56B81
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765879987; cv=none; b=sddQVcya0mhegOumeOc3MfyzP1gpzf0fHXq9Tco94Fm1YqTzjTAo522JTVtfZW+YWokLRSRFUp4i4hy608wzMPyF8CPza6lwQu1NXjHE9Ozd5GezMvqI2+OGcVhjiNTLIR9gTENh8jRspfqxBF86wObx0IaL4/p3vvaiQJpzyPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765879987; c=relaxed/simple;
	bh=YLAj/r2FEDKQLmYCBxCODquRps9KIGCQUgaQHAAdQys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HACnWbSI7VE15bMGTb2842Qwu0TdeZYkFznrnLZoLomsIqXlhF8vEdcVTtpnH+Ju3pnF/A4hkHAE+PU0hcDEbi5gnCgi+CGqcKr/eckABYc/bcnNEtQCRDU90syVyJWmRQ6xCTEEAigmqRvxbwVt9lVbUQp7ds+sy2WB2qWSwj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HfECBlDC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HfECBlDC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so31254255e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765879984; x=1766484784; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJzjGjsbvSF4rzkdIfKfsW7zFxLeDwbsXmmlktvfWtc=;
        b=HfECBlDC9NLcCiIHQCjoqXwvPJefRtfaalM4+TZpGOLKgUOftGLy0l5+snUuL8OooA
         G3lgOnk46gLPr6js9iZJFjMmyltZPbJJA7WdNL5L1Tegt5NSkHG9EcoXE7VKg8F1sGIC
         PjawSSBIbBWzuZQBS4lpS7IO5U3kVc1G7wS9+1MmCCwEaMQixv2VLjoBKW8gs4GePXnQ
         oJJ/dEj7L8yWESl9RXK4rWRVwvakkq9s4w+He5OfLaRzkfRR9AcAKGUlbhByxijVsCVr
         +OOe7hKtolT5CLts46ygdCVfR47xvplMTUYffN5GLbXirNZanS3XdCDpajSk5MP1fUq0
         SDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765879984; x=1766484784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJzjGjsbvSF4rzkdIfKfsW7zFxLeDwbsXmmlktvfWtc=;
        b=wmoxO1lqT9h8I3bB8PGJjbcfFRASBp2wyWIvZnsjJyhYhhTUWtTUxHJihFo2ndaUNm
         3TEUBVg1+INnCa5CRTm0vR5hGuUeHbv4urZRaIdbqH5KAvgMUcLqPhb0/LEHfA9E706k
         mdF4ggCo1Sp6QnCwRoBgsR/nMremPHzd9QBiGffK9gZvRK4GyXz6Yg92dBJVpdDDazGM
         QFmnFbA5rFpR/mJ/FBC8d3Yv2+Q7bavk5NJO0yfkm0hH1CjnOa128LHZ6HpKXHefwPsU
         XxNaKdKKRGDvL2qEvWvrCcYsciR70BGJYKm1UI4vseXkCFpLWDgKjVmtbv5SXeQ9FdYy
         LQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCXBo+M/T+t/pgHWzB09S5hGSKCxWmYeYst1GYyo7zP4wOjlSE5ZqPBJELoRogvE5gwaAiDsiv3U7GRdUwGE@lists.linux.dev
X-Gm-Message-State: AOJu0YxeA2GWvr7RN8+mEn+DV8f48Qp7Jk/I2F4GxLAb4fi1i5az4w4u
	r9Mpb7o1BOkWUZbmGB4Ink1Mq85z06Ro3Djr5UoR3phpbYzU+nxPEuKH/qtohATkZKM=
X-Gm-Gg: AY/fxX7V061ztLvw1BNwcw4Nu7f1p0duGUFnE1nINDl7obwaEiQFxKZ9ETPN6ZVISrk
	WtmWRvUjzfuHoiTifwIuQb+Q7b90hW5OtO8ZdzE7aOTawlzjRg97GNlS35yt5bo64C52B8fDtHh
	5NdvQMc6+4a+bIhSVHa0VJ70IjH0y96s1Glj/wcRkyBTlkZxqrZvw0PBgjeptia9b8FuJWo3gJf
	BXWmnZ9DEvN8NpmtF22AhJ65jb7v7nC9XXZ+x+3bRGI7WHXYq/Xe9RnlQUDOkxf13dR/8m7/Zza
	JaEg5i96+8mpO9gKnn2kz5itVXqmegkNbkMmXdD/iE9GkJe/0oML+q9wxFvgovQXe8pVMGqSZ0q
	eH4dBtgwD8RUl21uxxKznLMeOXMxAyUwIo0kT+gfISMGKd2y/LBjmrxMz3z2BKuzpp++7UrIcld
	QqXUafwQ05PuKIWA==
X-Google-Smtp-Source: AGHT+IHT98Uk/FnvpzqT+v55I0LtEgak7CyvE/0SRVkDp20MTWGrAR3AknHG2PZnf6r8+xJCDqQ2jg==
X-Received: by 2002:a05:600c:800f:b0:471:1765:839c with SMTP id 5b1f17b1804b1-47a8f9068c3mr114272215e9.20.1765879983993;
        Tue, 16 Dec 2025 02:13:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd8eb1f26sm8597415e9.0.2025.12.16.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 02:13:03 -0800 (PST)
Date: Tue, 16 Dec 2025 11:13:01 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <aUEwre1bkwrj-i4i@pathway.suse.cz>
References: <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com>
 <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com>
 <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
 <aTSj8uKD6G0cLq2T@smile.fi.intel.com>
 <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
 <aTbTDSIHPdW8kUbR@smile.fi.intel.com>
 <aTbbRhNkwCjaryFo@pathway>
 <CAJ-ks9nwDCxrqyUx8vnEjy2s4c4uBPZsQFuOsbyXxzO7k1JeFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nwDCxrqyUx8vnEjy2s4c4uBPZsQFuOsbyXxzO7k1JeFg@mail.gmail.com>

On Mon 2025-12-08 16:07:28, Tamir Duberstein wrote:
> On Mon, Dec 8, 2025 at 9:06 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Mon 2025-12-08 15:30:53, Andy Shevchenko wrote:
> > > On Sun, Dec 07, 2025 at 08:32:53PM -0500, Tamir Duberstein wrote:
> > > > On Sat, Dec 6, 2025 at 4:45 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein wrote:
> > > > > > On Sat, Dec 6, 2025 at 2:43 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrote:
> > > > > > > > On Sat, Dec 6, 2025 at 12:49 PM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > > > > > > > > > On Sat, Dec 6, 2025 at 11:11 AM Andy Shevchenko
> > > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:
> > >
> > > ...
> > >
> > > > > > > > > > > > -static void
> > > > > > > > > > > > +static void __printf(2, 3)
> > > > > > > > > > >
> > > > > > > > > > > 3?!
> > > > > > > > > > >
> > > > > > > > > > > I think it should be (2, 0). Yes, the both users call it with "%p..." in format
> > > > > > > > > > > string, but the second parameter tells compiler to check the variadic
> > > > > > > > > > > arguments, which are absent here. Changing 'const void *p' to '...' will align
> > > > > > > > > > > it with the given __printf() attribute, but I don't know if this what we want.
> > > > > > > > > >
> > > > > > > > > > The second parameter is the first-to-check, it is not specific to
> > > > > > > > > > variadic arguments. Using 0 means that no arguments are checkable, so
> > > > > > > > > > the compiler only validates the format string itself and won’t
> > > > > > > > > > diagnose mismatches with `p`. This works whether or not we later
> > > > > > > > > > change `const void *p` to `...`.
> > > > > > > > >
> > > > > > > > > Yes, but this is fragile. As I explained it works only because we supply
> > > > > > > > > the format string stuck to "%p", anything else will require reconsidering
> > > > > > > > > the function prototypes. So, strictly speaking this should be (2, 0) if
> > > > > > > > > we leave const void *p as is.
> > > > > > > > >
> > > > > > > > I believe this is not correct. As I said, 0 means "do not check
> > > > > > > > arguments" so only the format string will be checked. See the existing
> > > > > > > > uses of this annotation in this file:
> > > > > > > >
> > > > > > > > static void __printf(7, 0)
> > > > > > > > do_test(struct kunit *kunittest, const char *file, const int line, int
> > > > > > > > bufsize, const char *expect,
> > > > > > > > int elen, const char *fmt, va_list ap)
> > > > > > > >
> > > > > > > > and
> > > > > > > >
> > > > > > > > static void __printf(6, 7)
> > > > > > > > __test(struct kunit *kunittest, const char *file, const int line,
> > > > > > > > const char *expect, int elen,
> > > > > > > > const char *fmt, ...)
> > > > >
> > > > Since it doesn't make much sense to make this function variadic, I
> > > > think the best we can do is a macro wrapper that combines this
> > > > function with `no_printk`. Something like
> > > >
> > > > #define test_hashed(kunittest, fmt, p) \
> > > > do { \
> > > > if (0) \
> > > > no_printk(fmt, p); \
> > > > __test_hashed(kunittest, fmt, p);\
> > > > } while (0)
> > >
> >
> > IMHO, this is is not worth it. test_hashed(kunittest, fmt, p) calls
> > test(buf, fmt, p). It goes down to __test() which does the format
> > check:
> >
> > static void __printf(6, 7)
> > __test(struct kunit *kunittest, const char *file, const int line, const char *expect, int elen,
> >         const char *fmt, ...)
> >
> >
> > > > That would give us better diagnostics, but is more complex (and more
> > > > lines of code than just repeating this function's body twice, which
> > > > would also give good diagnostics). I think the best thing to do is just
> > > > to ignore the report that prompted me to look into this. Please let me
> > > > know if you disagree.
> > >
> > > I think we may not ignore the report as it breaks builds in some cases.
> > > As I said
> > >
> > > - __printf(2, 0) for now
> > >
> > > - and perhaps a comment on top to explain the clang approach that may cope
> > > with fixed-argument functions for -Wformat (you can even put a link to that
> > > LLVM discussion about the feature).
> >
> > I personally prefer this way. We just need to calm down the warning.
> > The proper check is done by the nested test()...
> 
> The nested `__test()` call cannot do the proper check because it cannot
> see the format string. Right?

IMHO, it does see the format string. It is defined the following way:

static void __printf(6, 7)
__test(struct kunit *kunittest, const char *file, const int line, const char *expect, int elen,
	const char *fmt, ...)

#define test(expect, fmt, ...)					\
	__test(kunittest, __FILE__, __LINE__, expect, strlen(expect), fmt, ##__VA_ARGS__)

static void
test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
{
	char buf[PLAIN_BUF_SIZE];

	plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);

	test(buf, fmt, p);
}


Now, let's get for example:

	test_hashed(kunittest, "%p", PTR_INVALID);

it calls:

	test(buf, "%p", PTR_INVALID);

which is exapnded to:

	__test(kunittest, file, line, buf, strlen(buf), "%p", PTR_INVALID)

so, it gets the same printf arguments as the original test_hashed,
namely:

	%p, PTR_INVALID

Or do I miss anything, please?

You might argue that it works by chance and that it might change in the
future. But I have hard times to imagine it. test_hashed() is just
a wrapper around "test()". The only purpose is to fill "buf" with
the expected outcome.

If any refactoring is needed in the future. The __printf() macros
would need some refactoring as well.

Best Regards,
Petr
