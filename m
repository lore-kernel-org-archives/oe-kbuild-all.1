Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FFD3148DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770818151; cv=none; b=hDfKAUPeqHKvEBmyCraBljzQA8WLZtTJLyf7qqfReHRFhIwvGRW9CkwhXJg7rgQDTPrH149osMISvBFb3WyEcW9GEXqah4ZSNrzVZq+ZUWTd8LagfrBA+5fLP0D5SsjUWStYkn0G4Gf8ULoplRvIXUqNMi0Gb7H1VvYwe7+5+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770818151; c=relaxed/simple;
	bh=R0sfjDYMihBcbvJtkov4KXbRpZXSlReqo92Xp4J3gbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALeFdAofylIh0B31Epefbe0js4gz7M5OIa3LoD2/rQQAeKjq52upWEfXZ1ZHHlnTTu0olbwp1N5T5YYfwot/MvCOSvRMHR/DLA2suCLQ9LFqKvpIcLqsuXYUBSmSxbDA2c7bIN7wppkWGSLjBODdYZvVMQrrjHRRZYqAS69eDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtBf/eqz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtBf/eqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770818150; x=1802354150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R0sfjDYMihBcbvJtkov4KXbRpZXSlReqo92Xp4J3gbU=;
  b=FtBf/eqzVEZB7p8S4XZ2KIhlZxvvTQAEwa39y3VdCklcdbaziosRcN6R
   wO8DvwEHl3j54aIBjzUaRvmxS0j5ywKsqVbIgefTPmRrKG0GQqK9PLdJu
   nGfaoG4QEDvDaczAtHW99f6R+puSVBcYaCDHSsPM6EiUpI+xgi/qkPXrU
   O07dEQVim4Sos6h624zmoPolP3FNH9lfnHhUU1nzL1nzPM24Lf/tyrOXC
   E6VdtfsR26T1adtsp2i4l4ZjSDKbze7y9S227jhE/yLx9Ql4qK2FvwXT9
   aoeSp5/JiVXAt5g6DeqieJx/WdDrsBVUQ1RXYMrnpUQafpc8nqCmtoaz2
   Q==;
X-CSE-ConnectionGUID: Yu5h8bABTcWaPyhsXtHZ7Q==
X-CSE-MsgGUID: BD+CoVbQQ56oJpBoHd33qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71863076"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71863076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 05:55:49 -0800
X-CSE-ConnectionGUID: LTArMbSdR3uZu/x8t3ofvg==
X-CSE-MsgGUID: bAIxkeeKTbKnQuOEa13Bow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216760621"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.220])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 05:55:47 -0800
Date: Wed, 11 Feb 2026 15:55:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>
Cc: Tamir Duberstein <tamird@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Petr Mladek <pmladek@suse.com>
Subject: Re: [linux-next:master 9199/12313]
 include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
Message-ID: <aYyKYa36G-X-ScN2@smile.fi.intel.com>
References: <202602110708.x7AYvCN7-lkp@intel.com>
 <aYxi3KG0gHBBbqox@smile.fi.intel.com>
 <aYxomlXamlNiNa8G@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYxomlXamlNiNa8G@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

+Helge, do you have any insights on this?

The original mail is here:
https://lore.kernel.org/r/202602110708.x7AYvCN7-lkp@intel.com

On Wed, Feb 11, 2026 at 01:31:41PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 11, 2026 at 01:07:12PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 11, 2026 at 07:15:01AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   fd9678829d6dd0c10fde080b536abf4b1121c346
> > > commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 [9199/12313] printf: convert test_hashed into macro
> > > config: parisc-randconfig-r122-20260211 (https://download.01.org/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/config)
> > > compiler: hppa-linux-gcc (GCC) 8.5.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202602110708.x7AYvCN7-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > 
> > Very interesting case. My theory is that this is a compiler bug or
> > a rare corner case. When test_hashed was converted to a macro it
> > affects the scope of PTR in errptr(). And compiler most likely
> > mistakenly drops it's value to 0.
> > 
> > OTOH, I do not believe that it's a problem of IS_ERR_VALUE() implementation
> > since that it is so low level C standard integer promotion rules and should
> > be covered very well by compiler tests, etc.
> > 
> > However, it might be possible (but very unlikely) that the 32-bit
> > value is considered smaller than (unsigned long)-MAX_ERRNO. If
> > this a case, why only now? The change was introduces in 2019 to
> > have this BUILD_BUG_ON()?
> > 
> > TL;DR: Changing a compiler version might help, I think?
> 
> So, PTR was used in two places in errptr():
> 
>         BUILD_BUG_ON(IS_ERR(PTR));
>         test_hashed(kunittest, "%pe", PTR);
> 
> The compiler has seen that PTR is always used (it was static inline).
> When it was converted to a macro, the stage that does some pass now
> probably thinks that PTR may be eliminated even if it has non-0 value!
> 
> But again, my knowledge in all this is close to 0, especially for PA-RISC.
> I'm purely speculating here based on my experience, intuition, and current
> code base of the Linux kernel.

-- 
With Best Regards,
Andy Shevchenko


