Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AC5CA5A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765057530; cv=none; b=ZeQEUCwE7JR8YBxCFQL/WONq56uGClhCHaz3vOll2zyIDOso89faozeIHY/DwPl9ru5/7nPdxxxDULIupAK2yUNZqlceLmrKEp5dWcDvIOlO0NSSNsmu52off0e35E+t/l8cmHlY+Wjzge1PyxFTotG1VqYyjsldXo0zczxYfSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765057530; c=relaxed/simple;
	bh=IJO6xW4loma1S9PqEicLXARAkaWxAdKCVcex+jjPIos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHo5a1IhK1Wl0HAP7s+oEiNCvUGTt6AG96/ekcjxcvcEcyIOEA7dZoaWoC2uDW6S7ifBXCPp/h8mx2ZqlTpbQ3AUqx02t2itoNOK/DCtBFAribvcaHT8fYF6PPnCLJ1zw5W9S3cKSLL8jIC8pI+AQbneh+Jot6BlVU2NJpCuang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgtctCnH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgtctCnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765057528; x=1796593528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IJO6xW4loma1S9PqEicLXARAkaWxAdKCVcex+jjPIos=;
  b=EgtctCnHjbrjvdp9EddrRhD7ilXV0MsYam2ofA600zQcxgmVGT2PSrpx
   zUnE3y7N2se97rwEMaahanJN0NvREJfsBlDxamVl9QfGyNF5vXXiIbGtE
   YrOBVI2KR6HdrtP/sCNdhliKdVXRKdVtw2V6EHOO5+D7v+fvuk7kMUF5Y
   LvN4zW9nMp0MlASZfUicblKUB6vHLIg+fgAau/8KbrYUTU+nfpRwJfioo
   XJxBcuFTEWnyKkEx3wTtMNV/7ffU3fdzzhCXRIYqalwl4CVa2uM1Nu6bX
   F9HP5Au+VyWcqi4/saZnLX8JoB3A57k37gbmEhO2XIVtr21QcsTpWzrg7
   A==;
X-CSE-ConnectionGUID: j8RhNc7oTOmgW33A5nsKEw==
X-CSE-MsgGUID: WgkkyZ4rRE6HL4jZ9K/DeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="77375218"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="77375218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 13:45:27 -0800
X-CSE-ConnectionGUID: MSljQUC7T/GNhorsOFsjZQ==
X-CSE-MsgGUID: JKH+OYojTiqpekg7sORaJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="200512750"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 13:45:25 -0800
Date: Sat, 6 Dec 2025 23:45:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <aTSj8uKD6G0cLq2T@smile.fi.intel.com>
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
 <aTRVusbSqh5ZBY-o@smile.fi.intel.com>
 <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
 <aTRss_EHjqH21NEV@smile.fi.intel.com>
 <CAJ-ks9nCsWij6FxF8T51CNsHn4Wg0wNd5mXQyJqc6Y6XJXnLDw@mail.gmail.com>
 <aTSHb6rHLQqopTNU@smile.fi.intel.com>
 <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nYVuB6bn=xodzy5rWYtrwOgjev_53xRrzvMGdk55Y0Vw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Dec 06, 2025 at 02:57:48PM -0500, Tamir Duberstein wrote:
> On Sat, Dec 6, 2025 at 2:43 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Dec 06, 2025 at 12:52:53PM -0500, Tamir Duberstein wrote:
> > > On Sat, Dec 6, 2025 at 12:49 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> > > > > On Sat, Dec 6, 2025 at 11:11 AM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:

...

> > > > > > > -static void
> > > > > > > +static void __printf(2, 3)
> > > > > >
> > > > > > 3?!
> > > > > >
> > > > > > I think it should be (2, 0). Yes, the both users call it with "%p..." in format
> > > > > > string, but the second parameter tells compiler to check the variadic
> > > > > > arguments, which are absent here. Changing 'const void *p' to '...' will align
> > > > > > it with the given __printf() attribute, but I don't know if this what we want.
> > > > >
> > > > > The second parameter is the first-to-check, it is not specific to
> > > > > variadic arguments. Using 0 means that no arguments are checkable, so
> > > > > the compiler only validates the format string itself and won’t
> > > > > diagnose mismatches with `p`. This works whether or not we later
> > > > > change `const void *p` to `...`.
> > > >
> > > > Yes, but this is fragile. As I explained it works only because we supply
> > > > the format string stuck to "%p", anything else will require reconsidering
> > > > the function prototypes. So, strictly speaking this should be (2, 0) if
> > > > we leave const void *p as is.
> > > >
> > > I believe this is not correct. As I said, 0 means "do not check
> > > arguments" so only the format string will be checked. See the existing
> > > uses of this annotation in this file:
> > >
> > > static void __printf(7, 0)
> > > do_test(struct kunit *kunittest, const char *file, const int line, int
> > > bufsize, const char *expect,
> > > int elen, const char *fmt, va_list ap)
> > >
> > > and
> > >
> > > static void __printf(6, 7)
> > > __test(struct kunit *kunittest, const char *file, const int line,
> > > const char *expect, int elen,
> > > const char *fmt, ...)
> > >
> > > as you can see, 0 is used only when the arguments are not in the
> > > function prototype at all. When variadic arguments are present, N+1 is
> > > used.
> >
> > Yes to all what you said. And how does it object what I said? In the case
> > you are trying to add __print(2, 3) the 3rd one is *not* a variadic argument.
> > If you make it to be variadic, I will agree with __print(2, 3). Before that
> > it doesn't look right to me even if it works.
> 
> I addressed this in my first reply; the second parameter to `__print`
> is *not* specific to variadic functions. It can just as well be used
> for functions with a fixed number of arguments.

$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:../lib/tests/printf_kunit.c:272:1: error: ‘format’ attribute argument 3 value ‘3’ does not refer to a variable argument list
  272 | {
      | ^

How did you compile it?

The GCC documentation
https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Common-Function-Attributes.html#index-format-function-attribute
doesn't clearly say if the fixed-argument functions are eligible for the
__attribute__((format)). The parameter is called first-to-check, which
might imply that there is a second.

Additionally interesting discussion to read:
https://reviews.llvm.org/D112579

Seems it's feature of clang?

3147 As an extension to GCC's behavior, Clang accepts the ``format`` attribute on
3148 non-variadic functions. Clang checks non-variadic format functions for the same
3149 classes of issues that can be found on variadic functions, as controlled by the
3150 same warning flags, except that the types of formatted arguments is forced by
3151 the function signature. For example:

Seems to me for now it has to be __printf(2, 0) or you need to put some special
pragma:s or so around the function to make it work for clang differently.

-- 
With Best Regards,
Andy Shevchenko


