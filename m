Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546E2EBDD3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765202764; cv=none; b=WHWlaaLYepjAsQSYrToJN9Ne455Uey42vguMfmJJ0fqpmvYCCVUDVBd8iZ23ws2geOGByke1cTWLKp88gG+V3uO7DdCjLyQKeYCQknEK1qvoBHhwXxUIFamjbX+7K8QIbAiLhcXyTkb43xq0bJjd7PIPHvNBc+2Dc3i/KbMpGWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765202764; c=relaxed/simple;
	bh=bByfbjULz/zxbHHvm948oQ+ExFQCFOJnCSYwNPAS3cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoQ8BKcmD2euqqdiZEL7ihg2M6wmx0k32Q4R7dkTVWkD6rpOSsv+72tIRFhlOaHUCbNh7jK8xhihxUjscaABsGTS9YDiytVzsD+OB5VH32BiGrZqiH7rD4Xnyg+bpozYaZyoQ0F4hJTQAcmcTrBKSKV7BBPJPCngQvcyns9fRe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aU+5wPxk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aU+5wPxk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso38993155e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Dec 2025 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765202761; x=1765807561; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lokJ5w9UpzFBCGvjBK85H8pdYoiofKonARrn41p3ekY=;
        b=aU+5wPxkYYIcQGHZYUH7N71X5z2KHH7v6JrVRud5oWCVl9ndX7rswPEonWb/4puDLc
         POKc5oqSGUGEKT0Qfovjhr6cN00HPfzALA03MTZIXYVk7tC93v2iYtaH4wBlmXIjcuKG
         ujzmcduTMAV6U/n6zYXdkk51FRwMPH13TkLhAt8+5W97iDYDv9p5uGEwWcoEKMP5+JyZ
         E6JxtuW+RiZPUKbE9TPzPDa9Zu5TA5VCQgpKQvaIpZKStrTCPRMeuMuEL1Z/PKhjPl2W
         +wwBy+CDGVH/wpVe1Ko2l492PIr5Z5O4V8HM98I1gCaI/nwoM52L+NLLxpKfUD9IRQF/
         SPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765202761; x=1765807561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lokJ5w9UpzFBCGvjBK85H8pdYoiofKonARrn41p3ekY=;
        b=hJHCN7K00Dm9GIui9OxsGQfopJhB4i3r/GhPgXgZ2ybgu/xCCJk6N33fJdf15g4MNR
         sx3GLfS41rHMVClqX/ntfn8yVX27FWHIzQrKiTY39iotDoNuZlS43EfEOkaF4BR0Nzcc
         QaR2voI+6FfVjQYBzDX3Y8xHgjnvLuDE0zjKhG/twzEWByQSpPh+v6mlBro2S7SRyIt0
         IUxIDA/yvPxUjkadzZnBI18VbrisxqSkdlXZK2No4a37BC6X/Ca8xx+omv6J/ZYZEkcs
         fZugV1GDqYsTdZuJnoLqYn2zgCw14zswSMzwf52ZESPnpwA0ZbG5f26k3PVOZPXNmsoh
         KENw==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZXwl6xOXlCjdIAw7hQ3oCvaJVDu25yOhsu4OiUXCcPnh8vQb4JPRbLFawCc5dU16NRZNq4HQdzSQsp93@lists.linux.dev
X-Gm-Message-State: AOJu0YzOY1CnfirbymIXWaMAIgH+tEKqjLYWKrT2+q3TqJCyNT8AQevF
	4oqspp7S6uae8ZGn1Plr/ofIVMqicQAlFwRaPMD48lCrgvh/Hq5+PTzSd0CbtXHCR/c=
X-Gm-Gg: ASbGnctOLtnPJUCGG+pWpbHhVatOs1Nlgz040p1vsFwEKOXbB4ssyAe1Qo4V4iqkHnq
	WWUrlSxjOc0GYCS6X5vvhWIc3a1NQaQOTO7JhQZXTY5SSQ0Y75uaMpMdZxKKWLhPJlblfHkvD4E
	TBwquTXAOJbhURrJCr+lcQUPh2ktajBq1WlbAL+J4KIT8NTOqKJZqQxzJI/5aftYdhl5v4RS9EF
	jax0GcTtCRaC71XHqm4Mm75aP0A2VDH6IRqBRaAlpD/llED/b7dqenE7XDPc7jtkJjY5PFr0560
	VHsmgyjjQOIl3kZmc/C4v42+iK/mCIVGGMCviQxr4+41GaFebIQKVZ0sLDftC0SqfE1xvrPxS5/
	5i0ViRsTNkPqdZtN4ZZm4Sk4jy3kPQ50LN5AGqz9B30zBf90YBDopq69Iz3W5lIcKAuLcsdcIuT
	Ft5MQ=
X-Google-Smtp-Source: AGHT+IGpWK24I+g8Kd1qcoFtXW40X8wdFPrqUHAgvSkTO2MNv1i7OerNjuozHWpFdcgLeqcnbAPSfA==
X-Received: by 2002:a05:600c:4f12:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-47939e38971mr76585165e9.27.1765202760594;
        Mon, 08 Dec 2025 06:06:00 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311e7142sm245738595e9.11.2025.12.08.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:06:00 -0800 (PST)
Date: Mon, 8 Dec 2025 15:05:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <aTbbRhNkwCjaryFo@pathway>
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
 <aTRVusbSqh5ZBY-o@smile.fi.intel.com>
 <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com>
 <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com>
 <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
 <aTSj8uKD6G0cLq2T@smile.fi.intel.com>
 <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
 <aTbTDSIHPdW8kUbR@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTbTDSIHPdW8kUbR@smile.fi.intel.com>

On Mon 2025-12-08 15:30:53, Andy Shevchenko wrote:
> On Sun, Dec 07, 2025 at 08:32:53PM -0500, Tamir Duberstein wrote:
> > On Sat, Dec 6, 2025 at 4:45 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein wrote:
> > > > On Sat, Dec 6, 2025 at 2:43 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrote:
> > > > > > On Sat, Dec 6, 2025 at 12:49 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > > > > > > > On Sat, Dec 6, 2025 at 11:11 AM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:
> 
> ...
> 
> > > > > > > > > > -static void
> > > > > > > > > > +static void __printf(2, 3)
> > > > > > > > >
> > > > > > > > > 3?!
> > > > > > > > >
> > > > > > > > > I think it should be (2, 0). Yes, the both users call it with "%p..." in format
> > > > > > > > > string, but the second parameter tells compiler to check the variadic
> > > > > > > > > arguments, which are absent here. Changing 'const void *p' to '...' will align
> > > > > > > > > it with the given __printf() attribute, but I don't know if this what we want.
> > > > > > > >
> > > > > > > > The second parameter is the first-to-check, it is not specific to
> > > > > > > > variadic arguments. Using 0 means that no arguments are checkable, so
> > > > > > > > the compiler only validates the format string itself and won’t
> > > > > > > > diagnose mismatches with `p`. This works whether or not we later
> > > > > > > > change `const void *p` to `...`.
> > > > > > >
> > > > > > > Yes, but this is fragile. As I explained it works only because we supply
> > > > > > > the format string stuck to "%p", anything else will require reconsidering
> > > > > > > the function prototypes. So, strictly speaking this should be (2, 0) if
> > > > > > > we leave const void *p as is.
> > > > > > >
> > > > > > I believe this is not correct. As I said, 0 means "do not check
> > > > > > arguments" so only the format string will be checked. See the existing
> > > > > > uses of this annotation in this file:
> > > > > >
> > > > > > static void __printf(7, 0)
> > > > > > do_test(struct kunit *kunittest, const char *file, const int line, int
> > > > > > bufsize, const char *expect,
> > > > > > int elen, const char *fmt, va_list ap)
> > > > > >
> > > > > > and
> > > > > >
> > > > > > static void __printf(6, 7)
> > > > > > __test(struct kunit *kunittest, const char *file, const int line,
> > > > > > const char *expect, int elen,
> > > > > > const char *fmt, ...)
> > > > > >
> > > > > > as you can see, 0 is used only when the arguments are not in the
> > > > > > function prototype at all. When variadic arguments are present, N+1 is
> > > > > > used.
> > > > >
> > > > > Yes to all what you said. And how does it object what I said? In the case
> > > > > you are trying to add __print(2, 3) the 3rd one is *not* a variadic argument.
> > > > > If you make it to be variadic, I will agree with __print(2, 3). Before that
> > > > > it doesn't look right to me even if it works.
> > > >
> > > > I addressed this in my first reply; the second parameter to `__print`
> > > > is *not* specific to variadic functions. It can just as well be used
> > > > for functions with a fixed number of arguments.
> > >
> > > $ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
> > > ERROR:root:../lib/tests/printf_kunit.c:272:1: error: ‘format’ attribute argument 3 value ‘3’ does not refer to a variable argument list
> > >   272 | {
> > >       | ^
> > >
> > > How did you compile it?
> > >
> > > The GCC documentation
> > > https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Common-Function-Attributes.html#index-format-function-attribute
> > > doesn't clearly say if the fixed-argument functions are eligible for the
> > > __attribute__((format)). The parameter is called first-to-check, which
> > > might imply that there is a second.
> > >
> > > Additionally interesting discussion to read:
> > > https://reviews.llvm.org/D112579
> > >
> > > Seems it's feature of clang?
> > >
> > > 3147 As an extension to GCC's behavior, Clang accepts the ``format`` attribute on
> > > 3148 non-variadic functions. Clang checks non-variadic format functions for the same
> > > 3149 classes of issues that can be found on variadic functions, as controlled by the
> > > 3150 same warning flags, except that the types of formatted arguments is forced by
> > > 3151 the function signature. For example:
> > >
> > > Seems to me for now it has to be __printf(2, 0) or you need to put some special
> > > pragma:s or so around the function to make it work for clang differently.
> > 
> > Ah, thanks for digging that up - and as confirmed by LKP you are right
> > of course.
> > 
> > Since it doesn't make much sense to make this function variadic, I
> > think the best we can do is a macro wrapper that combines this
> > function with `no_printk`. Something like
> > 
> > #define test_hashed(kunittest, fmt, p) \
> > do { \
> > if (0) \
> > no_printk(fmt, p); \
> > __test_hashed(kunittest, fmt, p);\
> > } while (0)
> 

IMHO, this is is not worth it. test_hashed(kunittest, fmt, p) calls
test(buf, fmt, p). It goes down to __test() which does the format
check:

static void __printf(6, 7)
__test(struct kunit *kunittest, const char *file, const int line, const char *expect, int elen,
	const char *fmt, ...)


> > That would give us better diagnostics, but is more complex (and more
> > lines of code than just repeating this function's body twice, which
> > would also give good diagnostics). I think the best thing to do is just
> > to ignore the report that prompted me to look into this. Please let me
> > know if you disagree.
> 
> I think we may not ignore the report as it breaks builds in some cases.
> As I said
> 
> - __printf(2, 0) for now
> 
> - and perhaps a comment on top to explain the clang approach that may cope
> with fixed-argument functions for -Wformat (you can even put a link to that
> LLVM discussion about the feature).

I personally prefer this way. We just need to calm down the warning.
The proper check is done by the nested test()...

Best Regards,
Petr
