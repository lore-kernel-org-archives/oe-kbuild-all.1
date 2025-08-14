Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89921EEA55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 18:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755195642; cv=none; b=HfNQa6lG1iYbcDO0O8VID4212E+l8AOIHp/W/76nrfFL+5v1ZU8z8I9PIESrREZBhzV36149QpfmuC5GZGbIJrnaEO5W9LzOgiceRI95CQKS+TguQ7VwBtCzv/QFTCTWcucQLpCrRsoNnuOB7xn3aS+A4CCMZgCU/q1+vti6baI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755195642; c=relaxed/simple;
	bh=66bQ/0Aw1YUjT3BpBW4HsvF7Oif+m/jPSXJMWdVP/js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq5h7OHHWGxTKie8fnWZsDPvkNb88jRnvdm0E7D5NA/bLUyZrEt5ug4xrWLT0APGWceLuBwIH/AtcXNG3N4PZtmYdHD6g6g9NtZzDfinyM0yTnQHREhfhYZ9xCNXMIzyiTW4L5R3goJEiykuVs5j3kfGNZwBiI4TwxRRvTtu/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEriLOoM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEriLOoM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353E9C4CEED;
	Thu, 14 Aug 2025 18:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755195642;
	bh=66bQ/0Aw1YUjT3BpBW4HsvF7Oif+m/jPSXJMWdVP/js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEriLOoMJLjwnFTVkCMisUcsHYNMinYVrYbIUrGFkVB+FA9fNFB5+h6JbVjytEOlq
	 aEbcq+/dAHQdcDaF++KpTgdMbTNyTUxGUVGkPpSDAAfzctteohFY3NG7xKLikh+4+5
	 LlAcLRwGZJ9RnoKqgbi/rC5XGp3XGniOBoR6GaKh54TfI5YHO/1LM0xN79Drf4CEvo
	 FPrSSLBzyBISHQAB3maQIbCXws56VS4slq7J4jtZhcRiZhYyL+nuXsZjBeLRCbVlEZ
	 hnI4zGNZHtqeULbaoV6Yr28XYR+PN2YmN8pxA7P18kQzoP8F6XlKDmNIFh1kMhFI1+
	 3E48t/vRPocCA==
Date: Thu, 14 Aug 2025 18:20:41 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Wei Liu <wei.liu@kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: Re: [hyperv:hyperv-next-staging 2/9]
 include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON
 failed: HV_HVCALL_ARG_PAGES == 1
Message-ID: <aJ4o-XJ_rMTG9Vnk@liuwe-devbox-ubuntu-v2.tail21d00.ts.net>
References: <202508140537.LHGYEm9W-lkp@intel.com>
 <SN6PR02MB4157D5DE01EB0A200E2EA088D435A@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157D5DE01EB0A200E2EA088D435A@SN6PR02MB4157.namprd02.prod.outlook.com>

On Thu, Aug 14, 2025 at 06:18:25PM +0000, Michael Kelley wrote:
> From: kernel test robot <lkp@intel.com> Sent: Wednesday, August 13, 2025 2:28 PM
> > 
> > tree: https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next-staging
> > head:   ee8b3b85ffbc4dc06a598a12185537dae67714ab
> > commit: ffe1588178d5bb71c58361cb84cc3f4342f82100 [2/9] x86/hyperv: Use
> > hv_setup_*() to set up hypercall arguments -- part 1
> > config: i386-randconfig-014-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140537.LHGYEm9W-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140537.LHGYEm9W-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202508140537.LHGYEm9W-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from <command-line>:
> >    include/asm-generic/mshyperv.h: In function 'hv_setup_inout_array.constprop':
> > >> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON failed: HV_HVCALL_ARG_PAGES == 1
> >      572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >          |                                             ^
> >    include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
> >      553 |                         prefix ## suffix();                             \
> >          |                         ^~~~~~
> >    include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
> >      572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >          |         ^~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
> >       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> >          |                                     ^~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
> >       50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
> >          |         ^~~~~~~~~~~~~~~~
> >    include/asm-generic/mshyperv.h:239:25: note: in expansion of macro 'BUILD_BUG_ON'
> >      239 |                         BUILD_BUG_ON(HV_HVCALL_ARG_PAGES == 1);
> >          |                         ^~~~~~~~~~~~
> > 
> 
> Wei --
> 
> This error is due to the compiler *not* inlining hv_setup_inout_array() in
> include/asm-generic/mshyperv.h, which makes sense because when the function
> is inline, the clause with BUILD_BUG_ON() gets dropped. The function is tagged
> as "inline", but of course that doesn't guarantee inlining. The problematic config is
> for a 32-bit build, and perhaps the compiler is short on registers and decides not to
> inline. The problem is occurring when building arch/x86/hyperv/irqdomain.c, though
> that's not indicated in the problem report.
> 
> All that said, if I change the "inline" tag to "__always_inline" the problem goes away.
> Is that a fixup you can make to directly to the linux-hyperv tree? Or should I spin
> a new version of the patch?

I can make the change directly. Thanks for looking into this.

Wei

> 
> Michael
