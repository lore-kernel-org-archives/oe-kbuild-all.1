Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3330E21638D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Apr 2026 19:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331520; cv=none; b=swl7mL5iSpVDHyTDiqw+hpTN9qo2J+RhZrzAKdFi+ZVg2tZmPKkV5c5KQwojEebgfFR71/T8PUUebBLpILNLQXVRjPAKOtdsD1J6ky1GJtxHLGoNcX4dA3npEl8cojUXoT8vZjoxliSQMLbmxM4v/FZkYA4Y+lqQgXOZUnxYjJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331520; c=relaxed/simple;
	bh=e+PGwU1KiuneE/adqggQOrVH62G3tV3TkTnMc0+pz2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7+bBAIZ+Ut5uCrhp3gzs3L7dRrCA3LNYpFDfWNZX7XlR0jcm4CL9MG4NBSmEkVgaDsl8gto6SzD1ZI+eoQg5LEe05WT775GRTpfH5qAzI7M9mXsWy+hb+mlzO1MDHCNm7HhkZqeTcayt7F2mftH8Z2EbPZ2c0WLwRdbjW9Crr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZIOK+jo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZIOK+jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775331518; x=1806867518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=e+PGwU1KiuneE/adqggQOrVH62G3tV3TkTnMc0+pz2o=;
  b=OZIOK+joOtz/zybmcvVLy0RIKQtabvn1YQMnZnHbFkA8yCt9SSObVZTu
   ZlihuUK0mrfC94+B5AEtEuPxVQVZzfHwcl8eR2ZGD0ZPlQV/sLUOr2dES
   Q5WcOz4W5wX+f5TBjPQyG8ULGUH1gBYzlyHJij8LHlWiwBlt0EtcsI3MO
   bzSHh1Bf886ZJsqX3I1UltXdZDRNtGrMua0UlfJaphpuM/h0MKC2BRbsb
   dRyM5Wh+KbxJe0xtBYVtyNo3lSKzbIpDKHBFLbMqSH0+krSO1Ae5uNKEz
   8F3dOFwCV2olhT6QrnrWxVTPlz/EGExLWfzgktiXXMyA+hzUSRfLfeJfg
   g==;
X-CSE-ConnectionGUID: e2mggOL1TQ+QTDccNrUBxQ==
X-CSE-MsgGUID: J7WCfzTzQJeT3MyFx9Vxcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="86972888"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="86972888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:38:38 -0700
X-CSE-ConnectionGUID: kaUaiQUrRM6O1EYoovzw6A==
X-CSE-MsgGUID: NnLXj5JkQdi7emTPaMmnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="223186662"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:38:35 -0700
Date: Sat, 4 Apr 2026 22:38:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>
Subject: Re: include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
Message-ID: <adFouCDpj72fdUcK@ashevche-desk.local>
References: <202604030636.NqjaJvYp-lkp@intel.com>
 <CAJ-ks9m+ZtqbiM5qo0+htjkuyiVu9xfTmGNzBqaa--rGfPpT7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9m+ZtqbiM5qo0+htjkuyiVu9xfTmGNzBqaa--rGfPpT7A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Apr 04, 2026 at 12:04:02PM -0400, Tamir Duberstein wrote:
> On Fri, Apr 3, 2026 at 4:45 AM kernel test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
> > commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 printf: convert test_hashed into macro
> > date:   9 weeks ago

...

> I used an LLM to investigate this, including bisecting GCC. Here's
> what we found:

Have you talked to Max Filippov who is arch maintainer in kernel?

...

> > So I see two possible mitigations:
> >
> > 1. Work around this in the test by avoiding IS_ERR() in that
> >    BUILD_BUG_ON(), e.g. use the raw MAX_ERRNO range check instead:
> >
> >    BUILD_BUG_ON((unsigned long)PTR >= (unsigned long)-MAX_ERRNO);
> >
> >    That keeps the same build-time check but avoids routing a constant
> >    expression through unlikely() under branch profiling, so GCC 8.5 no
> >    longer trips over it.

I believe it's close to "not an option" as it's a non-scalable change.
If in the future IS_ERR() becomes something else (but still covers
the same check) this will be in unsync and might trigger in a wrong
circumstances (while I don't believe it will happen IRL).

> > 2. Stop running xtensa randconfig with GCC versions older than the
> >    ipa-split fix above, i.e. use GCC >= 12.1 for xtensa in LKP.

This is also close to that "not an option" as we have Linux kernel wide
minimum GCC requirement.

Yes, theoretically any of the above is possible, but I dunno from where
the pushback may come.

> > I had a quick look at lkp-tests, but I don't see an xtensa-specific
> > compiler selection policy there; make.cross appears to consume an
> > already-chosen COMPILER value. So if the preferred mitigation is
> > toolchain-side, that policy likely lives in the 0day/LKP scheduler or
> > job-generation layer outside lkp-tests.
> >
> > One caveat on the reporting side: if other architectures are already
> > using newer GCC, or if 0day suppresses duplicate reports after the first
> > failing instance, that would explain why this only showed up as an
> > xtensa GCC 8.5 report even though the underlying compiler bug is not
> > xtensa-specific in principle.
> 
> Human again.
> 
> Petr, Andy: Would you like me to send a patch with the workaround?
> 
> LKP folks: Is GCC 8.5 only used for xtensa, or are old compiler
> versions also exercised by other architectures, and was this just the
> first one to hit this condition? If the former, is it possible to bump
> xtensa to GCC 12.1 or later?

-- 
With Best Regards,
Andy Shevchenko


