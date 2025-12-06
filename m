Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3427815D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 19:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765050230; cv=none; b=eNeFxYxziHwL6vzMX4/UAQlxvz0ta0sxRlMlPYqw58ThOzFjGQINNYjHSnp2oBcW7P2vaJnw7r8zAj3L4W+l12iWHzwJWH0RAHmflYdAXdtFfK8x8hXA/X/ddrMpzND7yZCk0q+KFBZRM0vMiSgi39oeFjNNwLJctI3rgGsg+bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765050230; c=relaxed/simple;
	bh=BdAOAbp7/brNsnOjvFf/D66I6kqyC7ziHOpb+Uj/VQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz0z67qYARtLZW2DLfNyRDTcfn0lkLop8FtJIlOTzAJLV7nXGMbJoV5akMyTX/vQcEeTNVJgI/ylytsUb4Q52H6WQI5uUzOpPu2MnHIvuqOeNp4CLEZ3HdLh0Qvwn8GSnyugCF1ME8j5zvGJI6+ea5BPb4cIHGOqTGgvmGhvSLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKbgO6i1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKbgO6i1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765050229; x=1796586229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BdAOAbp7/brNsnOjvFf/D66I6kqyC7ziHOpb+Uj/VQo=;
  b=IKbgO6i1Q8+puQl4UxDsqITw8AgOd9gQ+NM3WZcdtBPsSEQxgoxUJpRo
   rXRQ/aSiy3ITp/VXGEOpkOXpD0AZxnkmkKMU1TfdZHfEodboGm9CGvCa0
   33Y6TvgrsJXUBFxaomrCJ5+HKMiyNVIbmyd+WnS9h0ZZx+QSM6vzQWgM1
   dKTjB9rOkJlpKZlumewgC4zlCmVn/p5kQMByDoKFQiJYVoh+RwbJC8gfj
   edpW0E9/caL8hhaI0agyuYCHkrMM1s792k86+WiorazN+SQdzVwTdgsdU
   UkPZjVcvpnRLI0NqugnLo10/Dwy0mNXVqPF0n/6dtwU/QvNTRvbUaq8Lw
   w==;
X-CSE-ConnectionGUID: zxNHIyTTS5+ZjjJgnP0u3Q==
X-CSE-MsgGUID: j20oo/J5SieRZ53/wXnlsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="70905964"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="70905964"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 11:43:48 -0800
X-CSE-ConnectionGUID: RHUA5BaMS0etBSGzCU5Y+w==
X-CSE-MsgGUID: JQJ+v4mMQZOzxQYzsjP7Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="200709522"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 11:43:46 -0800
Date: Sat, 6 Dec 2025 21:43:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <aTSHb6rHLQqopTNU@smile.fi.intel.com>
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
 <aTRVusbSqh5ZBY-o@smile.fi.intel.com>
 <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com>
 <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrote:
> On Sat, Dec 6, 2025 at 12:49 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > > On Sat, Dec 6, 2025 at 11:11 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:

...

> > > > > -static void
> > > > > +static void __printf(2, 3)
> > > >
> > > > 3?!
> > > >
> > > > I think it should be (2, 0). Yes, the both users call it with "%p..." in format
> > > > string, but the second parameter tells compiler to check the variadic
> > > > arguments, which are absent here. Changing 'const void *p' to '...' will align
> > > > it with the given __printf() attribute, but I don't know if this what we want.
> > >
> > > The second parameter is the first-to-check, it is not specific to
> > > variadic arguments. Using 0 means that no arguments are checkable, so
> > > the compiler only validates the format string itself and won’t
> > > diagnose mismatches with `p`. This works whether or not we later
> > > change `const void *p` to `...`.
> >
> > Yes, but this is fragile. As I explained it works only because we supply
> > the format string stuck to "%p", anything else will require reconsidering
> > the function prototypes. So, strictly speaking this should be (2, 0) if
> > we leave const void *p as is.
> >
> I believe this is not correct. As I said, 0 means "do not check
> arguments" so only the format string will be checked. See the existing
> uses of this annotation in this file:
> 
> static void __printf(7, 0)
> do_test(struct kunit *kunittest, const char *file, const int line, int
> bufsize, const char *expect,
> int elen, const char *fmt, va_list ap)
> 
> and
> 
> static void __printf(6, 7)
> __test(struct kunit *kunittest, const char *file, const int line,
> const char *expect, int elen,
> const char *fmt, ...)
> 
> as you can see, 0 is used only when the arguments are not in the
> function prototype at all. When variadic arguments are present, N+1 is
> used.

Yes to all what you said. And how does it object what I said? In the case
you are trying to add __print(2, 3) the 3rd one is *not* a variadic argument.
If you make it to be variadic, I will agree with __print(2, 3). Before that
it doesn't look right to me even if it works.

-- 
With Best Regards,
Andy Shevchenko


