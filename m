Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D01A3112B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555926; cv=none; b=llpyNubucglfhgVlnkKZv8gAz6bYUGbrRBrnFwsIqnngVT6TxYDiZ1Zaa47qM5eGWU1/B+yA3wyC8g3GKLv0wrMXoHLzzpbgS95BRpdAP5dsuyDYpdWOFVJY19kaXlgYZSDmTTe5M008ronH/Vb22XrdKUar/e4+eRzIGGmWXpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555926; c=relaxed/simple;
	bh=ZdFXc8gSvisnmGw5+nADR9O8j0u4f9hcomPajV+ma8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdlAXBzp4VSxblpze5gHs4EouZ1k2wIys2oDhhydccZiS5m5GVPr/jmp8/1xs/KbFuC7yQJY6LXp8QeiNS5HxfHZTS6432nX5fckfx2kS3u3PY41kjVbGOk83HDNGER4uIleMg0XILCXCc4VBZ/m6+OVuW7PMjRiMDjTUWq/a70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XaeK9a59; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XaeK9a59"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432da746749so853028f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 01:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768555922; x=1769160722; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WbidHmVUKVZZtajdeoRk2JPxwzQ38apdVGqLw2XUjQU=;
        b=XaeK9a59whdaXov+g7824EzlGNQoo5tp+kvCLT6dcl4yiMcH6Z98tw7nGpWFqoc2bK
         luYQQB+1H6GAqV8YAyEbuPOpax5XiqoLMQ9wOdsRlQ15EQzDrzgiWGIGbPv6x2R4XL6P
         lO8TSuL9t9rc4lDKRW74KnUV3afvojXGukGuETLSOkhb5nuBftjy9fJIpoevzCBeRc89
         lPoxr67M1dl2N1nDra4+YU4AH5UoPn2LbQQHrt8GcYVxSWNhHgQWy1suWU7t/IIlcFzi
         OW8AYjYZcgJbDQ+CxS47bWDOICDUYJ+X7C65hshHOmN30GY4++Y00KzPBM0pn5JXAJmR
         Ve1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555922; x=1769160722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbidHmVUKVZZtajdeoRk2JPxwzQ38apdVGqLw2XUjQU=;
        b=GiYFDX8xg7E560XhIIikOfntuBnxSBVDCGx4E2EnTtwzHoHC+CeU3rOGdssdYncp8b
         8IyM4nS8FjSi6XT1tyEHmewi2+2vidrTWfU9wqZllpafhKfJjvBTPjp5gb/x8aj0l9DO
         8jJN0PoCE5NbhFAD0Klgk5g49ltzzSJmr7IoqUa2z2V4I5EFRhOD20Tr7sngHo8BrSSy
         TO04TuAx9Ffz/E9FhX5ObMqb3xezEozkuFt1I7cAf1rhMk1GrgPDoIl/4/d/i0gqRHFl
         krrmVrHEicYZ3niQCnoPsgOY5McMD7R3pRINxGHF3I6hFfnKO0+9ALbViXcJytbzggQT
         82XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/7mTwpAJcr5yl3E68z4RNfCfENfq4O/TxMHNiWePpOX8Va8JJxg1EbhGR4o5f1wr/OREWjwedjQFoxkTQ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnnl0MhmC4c3GU9a7yasaW561HDRtiOVrN4Clt9Sn9RHsLEfGS
	HGPioxgtM9YLV9wj7hW1SgRzr9wtUnecUFY3D8ah7DMehINdTcgCJcgju15ahuwgOYQ=
X-Gm-Gg: AY/fxX6/2+e6oYaYb/W/QFrCKJ6KSxpYRz4AmnuxOwMZSz6xFdISSpkwyDZ+p2gzmKw
	2Y9rAxeTiooEgEpANiNkWyp0sITNdVShuLfOeKRwYDzLAaU+18iDsMf8lT5hjkNLr8PKU7C6J2H
	O65E5UIpytt5WE8VK2EJvlO/u8yXxhJ/kSFwujXu3NoWpfv5rOolNahjaGo4ohavJBnFdlIQRYr
	ZjsSreMiHlHMKTn5RkyXwIOSLb9Hii55QbkE3RTIBwPn1EHpQCIGE75zdZ8qCBA6zNTaFLlZWNq
	nwsWJ6fOEZymfVH6J3x1m4tR3V01tC9L6VskVEdLtIVz9WnADKEaxhYXvDTecenMb5vKj864F8U
	zHaDyOKIWYR5xrLxWcgymqGKxZAY0BU3dYaQhUMFOa43FJ21wD/pdJDvk235L1yw0Vq5u3GHNNy
	yaP66nnJqZ/KX+EQ==
X-Received: by 2002:a05:6000:2910:b0:42f:b0ab:7b48 with SMTP id ffacd0b85a97d-43569979c52mr2495306f8f.1.1768555922343;
        Fri, 16 Jan 2026 01:32:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm4043723f8f.27.2026.01.16.01.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:32:01 -0800 (PST)
Date: Fri, 16 Jan 2026 10:31:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <aWoFjigXmIfo5vBJ@pathway.suse.cz>
References: <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com>
 <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
 <aTSj8uKD6G0cLq2T@smile.fi.intel.com>
 <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
 <aTbTDSIHPdW8kUbR@smile.fi.intel.com>
 <aTbbRhNkwCjaryFo@pathway>
 <CAJ-ks9nwDCxrqyUx8vnEjy2s4c4uBPZsQFuOsbyXxzO7k1JeFg@mail.gmail.com>
 <aUEwre1bkwrj-i4i@pathway.suse.cz>
 <CAJ-ks9nxvdWRp_Am0b6SoxXnrqDmm5kA=4ypXVZofLaLvqkjxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nxvdWRp_Am0b6SoxXnrqDmm5kA=4ypXVZofLaLvqkjxg@mail.gmail.com>

On Thu 2026-01-15 09:53:37, Tamir Duberstein wrote:
> On Tue, Dec 16, 2025 at 5:13 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Mon 2025-12-08 16:07:28, Tamir Duberstein wrote:
> > > On Mon, Dec 8, 2025 at 9:06 AM Petr Mladek <pmladek@suse.com> wrote:
> > > >
> > > > On Mon 2025-12-08 15:30:53, Andy Shevchenko wrote:
> > > > > On Sun, Dec 07, 2025 at 08:32:53PM -0500, Tamir Duberstein wrote:
> > > > > > On Sat, Dec 6, 2025 at 4:45 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein wrote:
> > > > > > > > On Sat, Dec 6, 2025 at 2:43 PM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrote:
> > > > > > > > > > On Sat, Dec 6, 2025 at 12:49 PM Andy Shevchenko
> > > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > > > > > > > > > > > On Sat, Dec 6, 2025 at 11:11 AM Andy Shevchenko
> > > > > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > > > > > > > > > -static void
> > > > > > > > > > > > > > +static void __printf(2, 3)
> > > > > > > > > > > > >
> > > > > > > > > > > > > 3?!
> > > > > > > > > > > > >
> > > > > > > > > > > > > I think it should be (2, 0). Yes, the both users call it with "%p..." in format
> > > > > > > > > > > > > string, but the second parameter tells compiler to check the variadic
> > > > > > > > > > > > > arguments, which are absent here. Changing 'const void *p' to '...' will align
> > > > > > > > > > > > > it with the given __printf() attribute, but I don't know if this what we want.
> > > > > > > > > > > >
> > > > > > > > > > > > The second parameter is the first-to-check, it is not specific to
> > > > > > > > > > > > variadic arguments. Using 0 means that no arguments are checkable, so
> > > > > > > > > > > > the compiler only validates the format string itself and won’t
> > > > > > > > > > > > diagnose mismatches with `p`. This works whether or not we later
> > > > > > > > > > > > change `const void *p` to `...`.
> > > > > > > > > > >
> > > > > > > > > > > Yes, but this is fragile. As I explained it works only because we supply
> > > > > > > > > > > the format string stuck to "%p", anything else will require reconsidering
> > > > > > > > > > > the function prototypes. So, strictly speaking this should be (2, 0) if
> > > > > > > > > > > we leave const void *p as is.
> > > > > > > > > > >
> > > > > > > > > > I believe this is not correct. As I said, 0 means "do not check
> > > > > > > > > > arguments" so only the format string will be checked. See the existing
> > > > > > > > > > uses of this annotation in this file:
> > > > > > > > > >
> > > > > > > > > > static void __printf(7, 0)
> > > > > > > > > > do_test(struct kunit *kunittest, const char *file, const int line, int
> > > > > > > > > > bufsize, const char *expect,
> > > > > > > > > > int elen, const char *fmt, va_list ap)
> > > > > > > > > >
> > > > > > > > > > and
> > > > > > > > > >
> > > > > > > > > > static void __printf(6, 7)
> > > > > > > > > > __test(struct kunit *kunittest, const char *file, const int line,
> > > > > > > > > > const char *expect, int elen,
> > > > > > > > > > const char *fmt, ...)
> > > > > > >
> > > > > > Since it doesn't make much sense to make this function variadic, I
> > > > > > think the best we can do is a macro wrapper that combines this
> > > > > > function with `no_printk`. Something like
> > > > > >
> > > > > > #define test_hashed(kunittest, fmt, p) \
> > > > > > do { \
> > > > > > if (0) \
> > > > > > no_printk(fmt, p); \
> > > > > > __test_hashed(kunittest, fmt, p);\
> > > > > > } while (0)
> > > > >
> > > >
> > > > IMHO, this is is not worth it. test_hashed(kunittest, fmt, p) calls
> > > > test(buf, fmt, p). It goes down to __test() which does the format
> > > > check:
> > > >
> > > > static void __printf(6, 7)
> > > > __test(struct kunit *kunittest, const char *file, const int line, const char *expect, int elen,
> > > >         const char *fmt, ...)
> > > >
> > > >
> > > > > > That would give us better diagnostics, but is more complex (and more
> > > > > > lines of code than just repeating this function's body twice, which
> > > > > > would also give good diagnostics). I think the best thing to do is just
> > > > > > to ignore the report that prompted me to look into this. Please let me
> > > > > > know if you disagree.
> > > > >
> > > > > I think we may not ignore the report as it breaks builds in some cases.
> > > > > As I said
> > > > >
> > > > > - __printf(2, 0) for now
> > > > >
> > > > > - and perhaps a comment on top to explain the clang approach that may cope
> > > > > with fixed-argument functions for -Wformat (you can even put a link to that
> > > > > LLVM discussion about the feature).
> > > >
> > > > I personally prefer this way. We just need to calm down the warning.
> > > > The proper check is done by the nested test()...
> > >
> > > The nested `__test()` call cannot do the proper check because it cannot
> > > see the format string. Right?
> >
> > IMHO, it does see the format string. It is defined the following way:
> >
> > static void __printf(6, 7)
> > __test(struct kunit *kunittest, const char *file, const int line, const char *expect, int elen,
> >         const char *fmt, ...)
> >
> > #define test(expect, fmt, ...)                                  \
> >         __test(kunittest, __FILE__, __LINE__, expect, strlen(expect), fmt, ##__VA_ARGS__)
> >
> > static void
> > test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
> > {
> >         char buf[PLAIN_BUF_SIZE];
> >
> >         plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
> >
> >         test(buf, fmt, p);
> > }
> >
> >
> > Now, let's get for example:
> >
> >         test_hashed(kunittest, "%p", PTR_INVALID);
> >
> > it calls:
> >
> >         test(buf, "%p", PTR_INVALID);
> >
> > which is exapnded to:
> >
> >         __test(kunittest, file, line, buf, strlen(buf), "%p", PTR_INVALID)
> >
> > so, it gets the same printf arguments as the original test_hashed,
> > namely:
> >
> >         %p, PTR_INVALID
> >
> > Or do I miss anything, please?
> 
> the problem is that test_hashed is a function, not a macro, so it is
> not correct to say that
> 
> test_hashed(kunittest, "%p", PTR_INVALID)
> 
> is expanded to
> 
> __test(kunittest, file, line, buf, strlen(buf), "%p", PTR_INVALID)
> 
> thus the compiler cannot perform any meaningful checking of the
> test_hashed call.
> 
> We could make test_hashed a macro, though.

I am sorry but I still think that it is not worth it.
The proposed changes add more complexity or weird stuff for a little gain.

> > You might argue that it works by chance and that it might change in the
> > future. But I have hard times to imagine it. test_hashed() is just
> > a wrapper around "test()". The only purpose is to fill "buf" with
> > the expected outcome.
> >
> > If any refactoring is needed in the future. The __printf() macros
> > would need some refactoring as well.

IMHO, the above is still valid.

> Apologies for taking a month to reply here.

No problem at all.

Best Regards,
Petr
