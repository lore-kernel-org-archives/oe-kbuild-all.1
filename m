Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B53A39FD9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765043386; cv=none; b=tjLobRttmoIYjkZU96LG7BJOJ0jmt4d3PMel4j7/9W+87SdIHhMjH+7/bG55ugCAyrf/T/5cmMtMSruBuKM1MdinHowDFknSAeocTRZDobgpxI6BsQStr0QTOUr/vr9UoPKaLe4JNxwotqwrgGfSXtQV3Oaom9yahpaX7OpjNno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765043386; c=relaxed/simple;
	bh=dgTI/idSJSEc3r1vA/NrIgFxRTUhi1JGsa3dldULzEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7zvhz216vq5h495mMtYmBA6tala4gYrf5V9XswoB3cW/hvVD8slBWXfqrA4TUGdy9x3jSQ1cJd00SCZ1mFrNWDHSOULF+eH90jt4A28yIGy4bFuySX2EYV5A4tvtIWdshEBKpfYfOyL+xLgZ6HKY/rEs3IEAFFawXegxlvDtxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTG2GYQo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTG2GYQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765043385; x=1796579385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dgTI/idSJSEc3r1vA/NrIgFxRTUhi1JGsa3dldULzEQ=;
  b=DTG2GYQoBiKgVnQgkInYVwk3bUYiE2nRIMkL4cs5wUQVPA9AN7BKG72B
   PmNpE6Uc3hhzVbIpH/a5uE/RNcnVPOpVs254VtkLVzjAGx5BTpyE7bPE8
   nEOXvDaO+d0lgCXXwwAXLKh3ft3jssgaqTJAS5LsfPKnlbbmp6cuzY9Mu
   hHwC5gZTxfLPI7QZPjGnkShwYXgCO1G1EehfSf6P71mU2J19R+d57EGoy
   RbtJkCWbD5Q9a5s28msincJo7qLcYUFkrrYYgpG0J/0Lp1sJxJ2bhzH67
   hWBFG6dRe2nx7aLFjO0DYNyK+vuA+uAUQlRcnwMEp+rCH573ohBNc/Zjo
   A==;
X-CSE-ConnectionGUID: TFZR5TDzSL+HtPZmUG/1pQ==
X-CSE-MsgGUID: zLu6sjmzRWSuaDGwUu/DdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="77370142"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="77370142"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 09:49:44 -0800
X-CSE-ConnectionGUID: CDTEPAUoT2WXbmfsoukXFg==
X-CSE-MsgGUID: CghW+TyFRNmHnRPT9mFR4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="226573595"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 09:49:42 -0800
Date: Sat, 6 Dec 2025 19:49:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <aTRss_EHjqH21NEV@smile.fi.intel.com>
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
 <aTRVusbSqh5ZBY-o@smile.fi.intel.com>
 <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nkyicpbX4jv+Ry4iDVLUGTHr_mHQx0EMN-jt3iDbrw0g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Dec 06, 2025 at 12:13:34PM -0500, Tamir Duberstein wrote:
> On Sat, Dec 6, 2025 at 11:11 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Dec 06, 2025 at 08:19:09AM -0500, Tamir Duberstein wrote:

...

> > > -static void
> > > +static void __printf(2, 3)
> >
> > 3?!
> >
> > I think it should be (2, 0). Yes, the both users call it with "%p..." in format
> > string, but the second parameter tells compiler to check the variadic
> > arguments, which are absent here. Changing 'const void *p' to '...' will align
> > it with the given __printf() attribute, but I don't know if this what we want.
> 
> The second parameter is the first-to-check, it is not specific to
> variadic arguments. Using 0 means that no arguments are checkable, so
> the compiler only validates the format string itself and won’t
> diagnose mismatches with `p`. This works whether or not we later
> change `const void *p` to `...`.

Yes, but this is fragile. As I explained it works only because we supply
the format string stuck to "%p", anything else will require reconsidering
the function prototypes. So, strictly speaking this should be (2, 0) if
we leave const void *p as is.

-- 
With Best Regards,
Andy Shevchenko


