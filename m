Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00A412B94
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749432338; cv=none; b=R8xw+n7XXlqE7Si0/kPJsC4Zgv9RWC59+pWqHQLe6r+fHqUAI8VyFJNLCuAZ2EVW5/q6tCbwuaG/IL798yB07y49WuSRgl64iFtG2WSDKidex5FMo4QXZ2ROMMYj5zcnN3biiJLvn7XMlBZ7pga/yqmzldk6h2BNSRmUdWo4kHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749432338; c=relaxed/simple;
	bh=D8k2a7guQyu6EgCK9RXzhC1TCYE3nGD2I8iOBVOgtp8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ICTy3SMKYNDCGGAwZGE45TGyqkE8IEezXgwzAMEV6tNWWftbszTdh+ZWLZHWsuuYhNhF0zw0nxR3GEsTi2ZCsqVd3DkGXy6Vz2k99bs0MS/R3SLjfJk44428L236lhQc1LmxPI+46E9v05q5pbc/WPmhUaf5molcFyMGwTXilxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U6iFvozQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U6iFvozQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C79C4CEEE;
	Mon,  9 Jun 2025 01:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749432338;
	bh=D8k2a7guQyu6EgCK9RXzhC1TCYE3nGD2I8iOBVOgtp8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U6iFvozQ6zZUbpSmqxeXDBiemhtm/oKW3FfXR2ZTEBfnrlRpWEXe1V1fyjv5ZJET2
	 yMBcUlB3r3Nb8ctCHMXsOhGhnEGyIJEO6N4zdaXljmDbDhBc+tICxfySvLiI121IYy
	 DWz+bZw8lbmfsqWdOxPQxu8KqGOk5E+MuPKzgGDY=
Date: Sun, 8 Jun 2025 18:25:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Tal Zussman <tz2294@columbia.edu>, <oe-kbuild-all@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 29/32]
 include/linux/compiler_types.h:565:39: error: call to
 '__compiletime_assert___COUNTER__' declared with attribute error:
 BUILD_BUG_ON failed: FIX_KMAP_SLOTS > PTRS_PER_PTE
Message-Id: <20250608182537.7c92701fbb5673bbb7276937@linux-foundation.org>
In-Reply-To: <aEY0JhnfnoFGlbOm@rli9-mobl>
References: <aEY0JhnfnoFGlbOm@rli9-mobl>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Jun 2025 09:08:54 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   8172857ac52869c411762ce86802d127b0bb7546
> commit: 54594582aa30a31c2596575729000f0a60b0a648 [29/32] compiler_types: remove unnecessary indirection in compiletime_assert()
> :::::: branch date: 17 hours ago
> :::::: commit date: 17 hours ago
> config: arc-randconfig-002-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090419.A0G5I2FK-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090419.A0G5I2FK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202506090419.A0G5I2FK-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    arch/arc/mm/highmem.c: In function 'kmap_init':
> >> include/linux/compiler_types.h:565:39: error: call to '__compiletime_assert___COUNTER__' declared with attribute error: BUILD_BUG_ON failed: FIX_KMAP_SLOTS > PTRS_PER_PTE
>      565 |  __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |                                       ^
>    include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
>      549 |    prefix ## suffix();    \
>  

Yes, thanks, this is fragile stuff.  It was a minor cleanup - I'll drop
the patch and shall hide in fear.
