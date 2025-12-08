Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8FB2EC569
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765200660; cv=none; b=aQfXZ98rcja07wTITAAjtd4KVadSPd7MZGLqS2FJB4ZD/tkE+RvANbSqg1IvHgqDknXmGoHkYiPF+ilMMuxlgz315kI8zuPKD9YPquZKBisHn3/ZRJKx3WMFqFajzRexOQavqrthzfp8C3PUuOHiQ23Rh/SbnHNwDiOeUMQJCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765200660; c=relaxed/simple;
	bh=J0uZFzOXTkJvd4CbBnFN3v1tbPHzbByiOLiUH+t2wSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJaQVS/gB7pDBzouHRNvA99U/TNtBGOG1GinOnD6c/YpPoCWk/Icb3RqIrtaL/t83eH3oxzoIxoSk18x2paCX42kjzTVL6IURaxI1rloSz8j+21paO/CEXOUCFPSYz84E7kqoKaMReZ8uJML5qGurcUX9hOXjgiXmxixB1C74z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERERpXQR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERERpXQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765200659; x=1796736659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=J0uZFzOXTkJvd4CbBnFN3v1tbPHzbByiOLiUH+t2wSo=;
  b=ERERpXQRbWB4Ffcen173uj2PgJtJteG8rwh8VHbH88S++sGd3w01m5Ba
   lg/R13hC+k5+tNYLl8jufFDrUO4/4MPW5AByVDSli3U7rfH0PUzJFn3oT
   habGFs3n1LJLF52Fy42ynu4WwsIZVEBtlUDFCaZVlTxE3E1W89gevw42e
   gBLiEx+Dl8SSgXIplrmTjubGApgv7sp0i+JiXxItQqAGxygdJNjiDE01G
   JdD4OA75lKpQ66aNWR+xh6GAdjv4z3e3VeE9V5DrXeo6iexXe7PbYbibn
   jRC8JhjtTi93mt+uR4yIPwRPU7jbqUdgyt3vjahK5VC4eaHlrBuykRZbC
   g==;
X-CSE-ConnectionGUID: M6nHrsPlTf6PCtYdaTGMlQ==
X-CSE-MsgGUID: n2mHJG4LSWqAJV8gjlqitQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84546923"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="84546923"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 05:30:58 -0800
X-CSE-ConnectionGUID: OElFpYpVQHyzRlev00A/qQ==
X-CSE-MsgGUID: gYnSdvheQb+VQiccpviqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="196206476"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 05:30:55 -0800
Date: Mon, 8 Dec 2025 15:30:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <aTbTDSIHPdW8kUbR@smile.fi.intel.com>
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
 <aTRVusbSqh5ZBY-o@smile.fi.intel.com>
 <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com>
 <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com>
 <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
 <aTSj8uKD6G0cLq2T@smile.fi.intel.com>
 <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9mrqxGLhjbFQyWaRqxUFu4+JaUbLn4E=TCfW1eqmDrQPw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Dec 07, 2025 at 08:32:53PM -0500, Tamir Duberstein wrote:
> On Sat, Dec 6, 2025 at 4:45 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein wrote:
> > > On Sat, Dec 6, 2025 at 2:43 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrote:
> > > > > On Sat, Dec 6, 2025 at 12:49 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > > > > > > On Sat, Dec 6, 2025 at 11:11 AM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:

...

> > > > > > > > > -static void
> > > > > > > > > +static void __printf(2, 3)
> > > > > > > >
> > > > > > > > 3?!
> > > > > > > >
> > > > > > > > I think it should be (2, 0). Yes, the both users call it with "%p..." in format
> > > > > > > > string, but the second parameter tells compiler to check the variadic
> > > > > > > > arguments, which are absent here. Changing 'const void *p' to '...' will align
> > > > > > > > it with the given __printf() attribute, but I don't know if this what we want.
> > > > > > >
> > > > > > > The second parameter is the first-to-check, it is not specific to
> > > > > > > variadic arguments. Using 0 means that no arguments are checkable, so
> > > > > > > the compiler only validates the format string itself and won’t
> > > > > > > diagnose mismatches with `p`. This works whether or not we later
> > > > > > > change `const void *p` to `...`.
> > > > > >
> > > > > > Yes, but this is fragile. As I explained it works only because we supply
> > > > > > the format string stuck to "%p", anything else will require reconsidering
> > > > > > the function prototypes. So, strictly speaking this should be (2, 0) if
> > > > > > we leave const void *p as is.
> > > > > >
> > > > > I believe this is not correct. As I said, 0 means "do not check
> > > > > arguments" so only the format string will be checked. See the existing
> > > > > uses of this annotation in this file:
> > > > >
> > > > > static void __printf(7, 0)
> > > > > do_test(struct kunit *kunittest, const char *file, const int line, int
> > > > > bufsize, const char *expect,
> > > > > int elen, const char *fmt, va_list ap)
> > > > >
> > > > > and
> > > > >
> > > > > static void __printf(6, 7)
> > > > > __test(struct kunit *kunittest, const char *file, const int line,
> > > > > const char *expect, int elen,
> > > > > const char *fmt, ...)
> > > > >
> > > > > as you can see, 0 is used only when the arguments are not in the
> > > > > function prototype at all. When variadic arguments are present, N+1 is
> > > > > used.
> > > >
> > > > Yes to all what you said. And how does it object what I said? In the case
> > > > you are trying to add __print(2, 3) the 3rd one is *not* a variadic argument.
> > > > If you make it to be variadic, I will agree with __print(2, 3). Before that
> > > > it doesn't look right to me even if it works.
> > >
> > > I addressed this in my first reply; the second parameter to `__print`
> > > is *not* specific to variadic functions. It can just as well be used
> > > for functions with a fixed number of arguments.
> >
> > $ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
> > ERROR:root:../lib/tests/printf_kunit.c:272:1: error: ‘format’ attribute argument 3 value ‘3’ does not refer to a variable argument list
> >   272 | {
> >       | ^
> >
> > How did you compile it?
> >
> > The GCC documentation
> > https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Common-Function-Attributes.html#index-format-function-attribute
> > doesn't clearly say if the fixed-argument functions are eligible for the
> > __attribute__((format)). The parameter is called first-to-check, which
> > might imply that there is a second.
> >
> > Additionally interesting discussion to read:
> > https://reviews.llvm.org/D112579
> >
> > Seems it's feature of clang?
> >
> > 3147 As an extension to GCC's behavior, Clang accepts the ``format`` attribute on
> > 3148 non-variadic functions. Clang checks non-variadic format functions for the same
> > 3149 classes of issues that can be found on variadic functions, as controlled by the
> > 3150 same warning flags, except that the types of formatted arguments is forced by
> > 3151 the function signature. For example:
> >
> > Seems to me for now it has to be __printf(2, 0) or you need to put some special
> > pragma:s or so around the function to make it work for clang differently.
> 
> Ah, thanks for digging that up - and as confirmed by LKP you are right
> of course.
> 
> Since it doesn't make much sense to make this function variadic, I
> think the best we can do is a macro wrapper that combines this
> function with `no_printk`. Something like
> 
> #define test_hashed(kunittest, fmt, p) \
> do { \
> if (0) \
> no_printk(fmt, p); \
> __test_hashed(kunittest, fmt, p);\
> } while (0)

I am not sure about a macro approach.

> That would give us better diagnostics, but is more complex (and more
> lines of code than just repeating this function's body twice, which
> would also give good diagnostics). I think the best thing to do is just
> to ignore the report that prompted me to look into this. Please let me
> know if you disagree.

I think we may not ignore the report as it breaks builds in some cases.
As I said

- __printf(2, 0) for now

- and perhaps a comment on top to explain the clang approach that may cope
with fixed-argument functions for -Wformat (you can even put a link to that
LLVM discussion about the feature).

-- 
With Best Regards,
Andy Shevchenko


