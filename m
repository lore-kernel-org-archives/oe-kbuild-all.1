Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2723932D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668213; cv=none; b=qsom+Mv7yP0QVuVThQxPrzm4OJEMrh3H147hXGL7tlSkBBjCjLS4RFTGMz+xXEJobj9um8nhEB4Dx9Y6VuAc9YRnxeGhKihM1M2OH7zRbQ4aVOBnFeyrUBADk+wNieCANg/xjUQzlHN865eu7Y0o89z+Yzr6DwfcdACfi/2YTps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668213; c=relaxed/simple;
	bh=r7VOXrb+MC9C3wXK/vHt6NTi4VZSu4e1OKqUyO5uQc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLUz8qeBlZDZY2jIttT4JREWqBUhj+Ki94QXxRamLOaCoN4lgKrzVVWWyT30ZO3frRo86C5MY6voXJ4SjhoRNsU9YqPr2yYFVFWJ6VMUW7YKnSeUAOpnuvrELAX8BnAWHW91NYcdi1QEhGwTkx+GzWwFNJTrLwsm0wOSUIZvvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8ztfnLE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8ztfnLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778668212; x=1810204212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r7VOXrb+MC9C3wXK/vHt6NTi4VZSu4e1OKqUyO5uQc0=;
  b=F8ztfnLE3ioBE8wWsuJCDun0xgyW21pxYF0alyeODO2R71ViJrRrslg7
   CCIdC24aKfZjnkRhiR5DtWWrvdiRQOqJHAhGQqt1DBZoSxMvjpyRlBQjM
   1bBDxQUP1jmlXHB9KCiZIUIirRCj8aAnFD7ilK16OODHqwA3B7+MinzJb
   LBbvr751HnDaKYYQXIhEtQBE+Iyy9JdTt7b1Yjo87udOX15EqTIEJ8s4T
   Mh1XVW83pGxwOW0MBrOTq2hqoYS6XiWe2TB0WePWC+//uBdWlqJ3mvZyw
   pvNBhyNO2GWrB3qHzGBcQPSfNnMP3pFjTo1EKuCqDy4jmlUqqRqhIIVLu
   A==;
X-CSE-ConnectionGUID: txKsHLUUQNmnpv91YHrUGw==
X-CSE-MsgGUID: 9Ff8McgBSm6uzxhhrx4Azw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="102258217"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="102258217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:30:11 -0700
X-CSE-ConnectionGUID: nbqaXS0WTLScSDpK8bMLWQ==
X-CSE-MsgGUID: 2iH+YVimQAKXHgyast7s5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="235373179"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:30:10 -0700
Date: Wed, 13 May 2026 13:30:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Dmitry Antipov <dmantipov@yandex.ru>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 14086/14440] lib/cmdline.c:188: undefined
 reference to `__efistub___lshrdi3'
Message-ID: <agRSr3EqFmPkBZ1e@ashevche-desk.local>
References: <202605041353.nsZSMiIC-lkp@intel.com>
 <20260512205908.7817ac71eb93427b17518ca7@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512205908.7817ac71eb93427b17518ca7@linux-foundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 12, 2026 at 08:59:08PM -0700, Andrew Morton wrote:
> On Mon, 04 May 2026 13:22:00 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   b9303e6bff706758c167af686b5315ad00233bf8
> > commit: 7f448f913d6f048e448df40a877be6f5afb5249d [14086/14440] lib: fix memparse() to handle overflow
> > config: riscv-randconfig-001-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041353.nsZSMiIC-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041353.nsZSMiIC-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605041353.nsZSMiIC-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    riscv32-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `memparse':
> > >> lib/cmdline.c:188: undefined reference to `__efistub___lshrdi3'
> 
> Still there.  
> 
> Thanks.  I've forgotten what's happening here, and I'm probably not the
> only one!  I'll remove the "lib and lib/cmdline enhancements, v9"
> series from mm.git - Dmitry, please let's start again?

Yes, please. The consensus (almost?) was to get a v10 that incorporates /
combines the two:
- the v7 for risc-v fixes (available in ML)
- the v9 rebased on top of the above

-- 
With Best Regards,
Andy Shevchenko


