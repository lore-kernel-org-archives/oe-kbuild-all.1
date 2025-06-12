Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A1C2F432A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730391; cv=none; b=JysZw68e3JqIfZ8Bs9b249QXwAQUHrOBts2PUScDSYUB8+9sb/NWnl+bBR7P1ldGJ67DlP9nX/hJI8jNzQWq0Pk/HLXhV/TcALDCO0Le/C7iFXxOWLmyEk32oZYVwdDP3qtWCnLV0K/NaWWTnv0cegb0PTO1GOPSjleA6cD/NUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730391; c=relaxed/simple;
	bh=Goq3cNVmhR/MmFsLuyxJXUeXoB2HoN64j1uq5vEFM/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RKitYx6pMOoWwyVvEecg++R9388TR5KC/rjsHOjzIzeeyA4IVNkjifElEwmSR7lD/PKUPE+8/z1H+pJzT42JoBMECoDpxO8FVLTKViEXBxw2a98minOU8ChuWRc57+XmbwGkiA64QoBcXe+UFuRzMHNGtlZtnOnJ/ho3fum7IYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gO2qm6YT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gO2qm6YT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749730390; x=1781266390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Goq3cNVmhR/MmFsLuyxJXUeXoB2HoN64j1uq5vEFM/g=;
  b=gO2qm6YTgqCIUP1vtd639665iSbJS4dUfM4k2RtiiYX1cU8CkJKI3BL8
   0JjWLi2+Dk90ds1rsZAl6QY+OmpOAQGBp7ZevkC63RRenJti4W4AfjCoX
   feqc50DzUPyFwl4ynUfwtS8NonVf//YBS0Ik5XjAiANx77ikPGlYD9vs2
   R6SzvgVfq3jGAlRsRYQZ9YkjUH5gPxbEMVd76ptIM/rjECpsgQK0JTb5S
   Dpv4TQ51r9/LOJtvq7sJbujyL7UBRNiBZugx826AyRV8HnC6yJ60yZwgZ
   pHqbL25JqIt0YP7yXvBAF0lD8Y0B1ugEVYzIBA5RpYP+XtyFh7JUDgO0Y
   g==;
X-CSE-ConnectionGUID: bRUAzjLtTXSABdghrf4J0g==
X-CSE-MsgGUID: bhI4dSk/QrC1BmJNynVq3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="77308519"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="77308519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:13:09 -0700
X-CSE-ConnectionGUID: GqDyUO7KRjCxuvp9jFdK2Q==
X-CSE-MsgGUID: 3x8q3PQARD22o/j8MrCBVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="148059108"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2025 05:13:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPgnp-000BVa-0X;
	Thu, 12 Jun 2025 12:13:05 +0000
Date: Thu, 12 Jun 2025 20:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 2024/2199] io_uring/register.c:286:43: sparse:
 sparse: dereference of noderef expression
Message-ID: <202506122000.OFjeoUSA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0bb71d301869446810a0b13d3da290bd455d7c78
commit: 89f607e88c9f885187a0144d0b540fb257b912ea [2024/2199] io_uring: consistently use rcu semantics with sqpoll thread
config: arm64-randconfig-r113-20250612 (https://download.01.org/0day-ci/archive/20250612/202506122000.OFjeoUSA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506122000.OFjeoUSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506122000.OFjeoUSA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/register.c: note: in included file:
   include/linux/io_uring_types.h:199:37: sparse: sparse: array of flexible structures
>> io_uring/register.c:286:43: sparse: sparse: dereference of noderef expression

vim +286 io_uring/register.c

c43203154d8ac5 Jens Axboe   2023-12-19  256  
c43203154d8ac5 Jens Axboe   2023-12-19  257  static __cold int io_register_iowq_max_workers(struct io_ring_ctx *ctx,
c43203154d8ac5 Jens Axboe   2023-12-19  258  					       void __user *arg)
c43203154d8ac5 Jens Axboe   2023-12-19  259  	__must_hold(&ctx->uring_lock)
c43203154d8ac5 Jens Axboe   2023-12-19  260  {
c43203154d8ac5 Jens Axboe   2023-12-19  261  	struct io_tctx_node *node;
c43203154d8ac5 Jens Axboe   2023-12-19  262  	struct io_uring_task *tctx = NULL;
c43203154d8ac5 Jens Axboe   2023-12-19  263  	struct io_sq_data *sqd = NULL;
c43203154d8ac5 Jens Axboe   2023-12-19  264  	__u32 new_count[2];
c43203154d8ac5 Jens Axboe   2023-12-19  265  	int i, ret;
c43203154d8ac5 Jens Axboe   2023-12-19  266  
c43203154d8ac5 Jens Axboe   2023-12-19  267  	if (copy_from_user(new_count, arg, sizeof(new_count)))
c43203154d8ac5 Jens Axboe   2023-12-19  268  		return -EFAULT;
c43203154d8ac5 Jens Axboe   2023-12-19  269  	for (i = 0; i < ARRAY_SIZE(new_count); i++)
c43203154d8ac5 Jens Axboe   2023-12-19  270  		if (new_count[i] > INT_MAX)
c43203154d8ac5 Jens Axboe   2023-12-19  271  			return -EINVAL;
c43203154d8ac5 Jens Axboe   2023-12-19  272  
c43203154d8ac5 Jens Axboe   2023-12-19  273  	if (ctx->flags & IORING_SETUP_SQPOLL) {
c43203154d8ac5 Jens Axboe   2023-12-19  274  		sqd = ctx->sq_data;
c43203154d8ac5 Jens Axboe   2023-12-19  275  		if (sqd) {
c43203154d8ac5 Jens Axboe   2023-12-19  276  			/*
c43203154d8ac5 Jens Axboe   2023-12-19  277  			 * Observe the correct sqd->lock -> ctx->uring_lock
c43203154d8ac5 Jens Axboe   2023-12-19  278  			 * ordering. Fine to drop uring_lock here, we hold
c43203154d8ac5 Jens Axboe   2023-12-19  279  			 * a ref to the ctx.
c43203154d8ac5 Jens Axboe   2023-12-19  280  			 */
c43203154d8ac5 Jens Axboe   2023-12-19  281  			refcount_inc(&sqd->refs);
c43203154d8ac5 Jens Axboe   2023-12-19  282  			mutex_unlock(&ctx->uring_lock);
c43203154d8ac5 Jens Axboe   2023-12-19  283  			mutex_lock(&sqd->lock);
c43203154d8ac5 Jens Axboe   2023-12-19  284  			mutex_lock(&ctx->uring_lock);
c43203154d8ac5 Jens Axboe   2023-12-19  285  			if (sqd->thread)
c43203154d8ac5 Jens Axboe   2023-12-19 @286  				tctx = sqd->thread->io_uring;
c43203154d8ac5 Jens Axboe   2023-12-19  287  		}
c43203154d8ac5 Jens Axboe   2023-12-19  288  	} else {
c43203154d8ac5 Jens Axboe   2023-12-19  289  		tctx = current->io_uring;
c43203154d8ac5 Jens Axboe   2023-12-19  290  	}
c43203154d8ac5 Jens Axboe   2023-12-19  291  
c43203154d8ac5 Jens Axboe   2023-12-19  292  	BUILD_BUG_ON(sizeof(new_count) != sizeof(ctx->iowq_limits));
c43203154d8ac5 Jens Axboe   2023-12-19  293  
c43203154d8ac5 Jens Axboe   2023-12-19  294  	for (i = 0; i < ARRAY_SIZE(new_count); i++)
c43203154d8ac5 Jens Axboe   2023-12-19  295  		if (new_count[i])
c43203154d8ac5 Jens Axboe   2023-12-19  296  			ctx->iowq_limits[i] = new_count[i];
c43203154d8ac5 Jens Axboe   2023-12-19  297  	ctx->iowq_limits_set = true;
c43203154d8ac5 Jens Axboe   2023-12-19  298  
c43203154d8ac5 Jens Axboe   2023-12-19  299  	if (tctx && tctx->io_wq) {
c43203154d8ac5 Jens Axboe   2023-12-19  300  		ret = io_wq_max_workers(tctx->io_wq, new_count);
c43203154d8ac5 Jens Axboe   2023-12-19  301  		if (ret)
c43203154d8ac5 Jens Axboe   2023-12-19  302  			goto err;
c43203154d8ac5 Jens Axboe   2023-12-19  303  	} else {
c43203154d8ac5 Jens Axboe   2023-12-19  304  		memset(new_count, 0, sizeof(new_count));
c43203154d8ac5 Jens Axboe   2023-12-19  305  	}
c43203154d8ac5 Jens Axboe   2023-12-19  306  
c43203154d8ac5 Jens Axboe   2023-12-19  307  	if (sqd) {
73254a297c2dd0 Hagar Hemdan 2024-06-04  308  		mutex_unlock(&ctx->uring_lock);
c43203154d8ac5 Jens Axboe   2023-12-19  309  		mutex_unlock(&sqd->lock);
c43203154d8ac5 Jens Axboe   2023-12-19  310  		io_put_sq_data(sqd);
73254a297c2dd0 Hagar Hemdan 2024-06-04  311  		mutex_lock(&ctx->uring_lock);
c43203154d8ac5 Jens Axboe   2023-12-19  312  	}
c43203154d8ac5 Jens Axboe   2023-12-19  313  
c43203154d8ac5 Jens Axboe   2023-12-19  314  	if (copy_to_user(arg, new_count, sizeof(new_count)))
c43203154d8ac5 Jens Axboe   2023-12-19  315  		return -EFAULT;
c43203154d8ac5 Jens Axboe   2023-12-19  316  
c43203154d8ac5 Jens Axboe   2023-12-19  317  	/* that's it for SQPOLL, only the SQPOLL task creates requests */
c43203154d8ac5 Jens Axboe   2023-12-19  318  	if (sqd)
c43203154d8ac5 Jens Axboe   2023-12-19  319  		return 0;
c43203154d8ac5 Jens Axboe   2023-12-19  320  
c43203154d8ac5 Jens Axboe   2023-12-19  321  	/* now propagate the restriction to all registered users */
c43203154d8ac5 Jens Axboe   2023-12-19  322  	list_for_each_entry(node, &ctx->tctx_list, ctx_node) {
1da2f311ba53a1 Jens Axboe   2024-03-29  323  		tctx = node->task->io_uring;
c43203154d8ac5 Jens Axboe   2023-12-19  324  		if (WARN_ON_ONCE(!tctx->io_wq))
c43203154d8ac5 Jens Axboe   2023-12-19  325  			continue;
c43203154d8ac5 Jens Axboe   2023-12-19  326  
c43203154d8ac5 Jens Axboe   2023-12-19  327  		for (i = 0; i < ARRAY_SIZE(new_count); i++)
c43203154d8ac5 Jens Axboe   2023-12-19  328  			new_count[i] = ctx->iowq_limits[i];
c43203154d8ac5 Jens Axboe   2023-12-19  329  		/* ignore errors, it always returns zero anyway */
c43203154d8ac5 Jens Axboe   2023-12-19  330  		(void)io_wq_max_workers(tctx->io_wq, new_count);
c43203154d8ac5 Jens Axboe   2023-12-19  331  	}
c43203154d8ac5 Jens Axboe   2023-12-19  332  	return 0;
c43203154d8ac5 Jens Axboe   2023-12-19  333  err:
c43203154d8ac5 Jens Axboe   2023-12-19  334  	if (sqd) {
73254a297c2dd0 Hagar Hemdan 2024-06-04  335  		mutex_unlock(&ctx->uring_lock);
c43203154d8ac5 Jens Axboe   2023-12-19  336  		mutex_unlock(&sqd->lock);
c43203154d8ac5 Jens Axboe   2023-12-19  337  		io_put_sq_data(sqd);
73254a297c2dd0 Hagar Hemdan 2024-06-04  338  		mutex_lock(&ctx->uring_lock);
c43203154d8ac5 Jens Axboe   2023-12-19  339  	}
c43203154d8ac5 Jens Axboe   2023-12-19  340  	return ret;
c43203154d8ac5 Jens Axboe   2023-12-19  341  }
c43203154d8ac5 Jens Axboe   2023-12-19  342  

:::::: The code at line 286 was first introduced by commit
:::::: c43203154d8ac579537aa0c7802b77d463b1f53a io_uring/register: move io_uring_register(2) related code to register.c

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
