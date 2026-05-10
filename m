Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCFD21CFE0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778408040; cv=none; b=CBepyGvp34RaZPvNi4UCyXkGN6UI4BDvdiVJRKD9VmaVoAn/zjEERR1pv4du63fJpbiZDqGK59PSZSrBYUardqkSybzKnGc24rk904wFpC52w3gB8QLTrcyNClYfE61scyGlrKXE49Yb56DziP/UNfGmPRWPENhQfNflAVOhVT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778408040; c=relaxed/simple;
	bh=piCklurj+akVtcMessxuIeNUW8Rb9Fh8PUv+o4/wtqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTf7QZyI/LfjuNuVRt3YP9gVUbnLlLWl27ZTYWu2+ShpH47+ryPgAq6D9jfLkbDrEJqRBYypexnukWETKuP1vAo7kYe7n1uhodg25ZZgy0m7A5hYMtdzMlYPELmIUcYfe4aVXZdVd109q/4HnQ62Cdt8zyWBWvSga2QpjoomPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ60CvmV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ60CvmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778408038; x=1809944038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=piCklurj+akVtcMessxuIeNUW8Rb9Fh8PUv+o4/wtqo=;
  b=dJ60CvmVectbbw2F3YL47SpBGEuerzJjutGP+dmAFh9Vy4+k2/rDnDHj
   MaTQVdj6jHfOfYvwIQ03q/BAIeLpP1ho/U/KZSXmyl7zvQJhzSoTUoAwE
   rYOYyu4BXtD8NQsnYX5X0lNgTiZ4Pr7nYMGBhNI/p8DsgspS9eaOJfsv6
   peETKesYYSWwwciqx7b49cYgYgn95NLmmprT1QBUWvJUdLJnlqvUYduP8
   1EiqNpacdMxwOvF7GXnobJRdAGfbOP30qk9zp62x4TPRgh/cODtLQOcKY
   5iViPd6dZLYR3RVn8npQN1vSpEUQiXfEHi3ZWu7l2Eq5KkgbfXFgAMD+p
   g==;
X-CSE-ConnectionGUID: p10H+tTdSlO2N5a+0GMxmg==
X-CSE-MsgGUID: r+O8NVqSS0K/iPLfpwLEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90425652"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="90425652"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 03:13:58 -0700
X-CSE-ConnectionGUID: 6VagtG2eRoC6N+gyO5sXvw==
X-CSE-MsgGUID: gB8mEGxjTReekloEPs5JyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="232718285"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.171])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 03:13:56 -0700
Date: Sun, 10 May 2026 13:13:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: drivers/misc/mei/mei_lb.c:284:32: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <agBaYu8eN_wnRmL7@ashevche-desk.local>
References: <202605091533.79Zcv3CX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605091533.79Zcv3CX-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, May 09, 2026 at 03:59:00PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   70390501d1944d4e5b8f7352be180fceb3a44132
> commit: 773a43b8627f54dca56d08949497014b4ee8878a mei: lb: add late binding version 2
> date:   5 weeks ago
> config: mips-randconfig-r134-20260508 (https://download.01.org/0day-ci/archive/20260509/202605091533.79Zcv3CX-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091533.79Zcv3CX-lkp@intel.com/reproduce)

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 773a43b8627f ("mei: lb: add late binding version 2")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605091533.79Zcv3CX-lkp@intel.com/

> sparse warnings: (new ones prefixed by >>)
> >> drivers/misc/mei/mei_lb.c:284:32: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/misc/mei/mei_lb.c:330:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] command_id @@     got int @@
>    drivers/misc/mei/mei_lb.c:330:40: sparse:     expected restricted __le32 [usertype] command_id
>    drivers/misc/mei/mei_lb.c:330:40: sparse:     got int

Alexander, in case you are going to address this, address them all at once. You
can run sparse locally to get all this.

	make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...

is my regular `make` command for building Linux kernel with `sparse` checks.

-- 
With Best Regards,
Andy Shevchenko


