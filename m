Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B8F27CCEE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074220; cv=none; b=WkpDq1Gy4B+1GPgcMTtPZZ4kVqFcMGP49g4uAN+v2zoRifLybt49E67uNK2l6rIlgmzWlH5qZoGuL3l2DU0ahbAG3q2Ts6iwT6XaQHLuxv79IoIvscsJ5LHCGbohjV8Rfo2TAFmiCiac90pdwT2/xqYH4vWRKjSrko4n3dOf+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074220; c=relaxed/simple;
	bh=Xx2iacOwQ7foigWGkPLT07YqY2OPMfczyW8HGK3+TOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjCW0oNPi+8dXJRKt1XYzB4Yz2PxacHATjYCs9O/1fgGARF5BL0+IKzKzTixcxR8yhfxL5WGpotnQ3TamgmoOP3gdk1AlrhakI4tUOBP17KHcmDiKI1VSbR3sL6PnGAuHkfbEs8gQ+S8XuVC3PrWvFim6vZpg5kvSKbmF96qDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SPuOQvAb; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SPuOQvAb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f4ox3+IfajuSWuo0dm+GeY2RanlSEuedySU7XstSWeo=; b=SPuOQvAbf+NMaTDA97J47o06eN
	pWGzX0ha0D0FQGpXl5bN6o7d0sL7zIPW6XLVpDmO2bxYxXI7ZxhN3VL8R5U3cWY1J+R+LaFXKmRvH
	wdX3hfko/biibiXH9AOFOJYEJHj45XlEkMuLWiYNVq+BQWi2N++21egidIaCZrdMxxgUnWVPwk5aF
	v3ZYcrrFnVPp66Vz/3BHmjBi6ErlyenShuY6HbJBDnUWkiSFcdQZA3REV2C0zHMkVLILZqFw/lDYG
	TYED2ZlRDRG/bNfPu8DHvacArS1hEKZ8gyU4jnqpp1zUi/IcosDLlDweODnmR5TFSuxbMgtwfYtQt
	1wZMK2KQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir15-0000000034h-2jNE;
	Thu, 22 Jan 2026 09:30:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 22EFB300754; Thu, 22 Jan 2026 10:30:15 +0100 (CET)
Date: Thu, 22 Jan 2026 10:30:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 28/31] kernel/rseq.c:779:24: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <20260122093015.GR166857@noisy.programming.kicks-ass.net>
References: <202601221057.fyl6X39T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601221057.fyl6X39T-lkp@intel.com>

On Thu, Jan 22, 2026 at 10:17:25AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> head:   81b74125144d2db6f40a345b875f085addbcd230
> commit: a21cfe63bfa6e2ce8db20196438f85d97f00cd93 [28/31] rseq: Move slice_ext_nsec to debugfs
> config: x86_64-randconfig-r113-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221057.fyl6X39T-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221057.fyl6X39T-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601221057.fyl6X39T-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> kernel/rseq.c:779:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *s @@     got char const [noderef] __user *ubuf @@
>    kernel/rseq.c:779:24: sparse:     expected char const *s
>    kernel/rseq.c:779:24: sparse:     got char const [noderef] __user *ubuf
> 
> vim +779 kernel/rseq.c
> 
>    773	
>    774	static ssize_t rseq_slice_ext_write(struct file *file, const char __user *ubuf,
>    775					    size_t count, loff_t *ppos)
>    776	{
>    777		unsigned int nsecs;
>    778	
>  > 779		if (kstrtouint(ubuf, count, &nsecs))

That very much wanted a _from_user on, I wonder where that went :/

>    780			return -EINVAL;
>    781	
>    782		if (nsecs < rseq_slice_ext_nsecs_min)
>    783			return -ERANGE;
>    784	
>    785		if (nsecs > rseq_slice_ext_nsecs_max)
>    786			return -ERANGE;
>    787	
>    788		rseq_slice_ext_nsecs = nsecs;
>    789	
>    790		return count;
>    791	}
>    792	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
