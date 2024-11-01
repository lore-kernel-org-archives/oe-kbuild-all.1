Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20B31474B9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 04:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730437035; cv=none; b=A7qy9rS/A8qiOvt/CXhzhm2rTZMHIcu0FCvr0GVecCmKb0QIWCtvcazu1+GX6G7EOr+4g5kXVxW/bWCqWaK4dSJPFSUckuzrMAwtoTPOZZ6nGv67m8c37t28194RQrgqLTWzo+BsCcy/TZVpXJinTyGe/LKKBW36e5MAu/hp/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730437035; c=relaxed/simple;
	bh=0Cai3H5eK7XtVf04/cs9wHer1MXsZhHNYaewLEXDdGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jqBUts1M2WKoaRPFm7QcbS05lLWqKEyjUZwBZdUnJq13lyh055vvSgKyF6zok2CxflgkjlnvtfCPv8Z+P+JOOexZ+bJbL+oixg0UK234TLi6foLUgHBs6SX8pOTvRiLReAZHt5IAJLeDrxfzwOHZ2fsppSfNWbB3IVY2Haj3Bkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cN87wfl8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cN87wfl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730437033; x=1761973033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Cai3H5eK7XtVf04/cs9wHer1MXsZhHNYaewLEXDdGU=;
  b=cN87wfl8eMz4zS9yg5VdZREc7MWvodl6Bkn40FsXig6fpIpeWSoEzQsr
   yJQ4mtPOWg9WlvGKudtsTA5ofHjvRiLJQXB9vJt68PW/lG7unkQBsY5kg
   7f2H8NENzOg3dLW2kU7Db0+Gk5KVNdsHZtrCRmoMNzp0l7iYLd5d3vtyr
   r8eedopS2de5w7z7eRGlIFrHhd3utugMAtqcxqlySdRgnjsBnp7zBPYfJ
   QonrACY2LWfgJktjCl41UHgpJFEFubd9Tm8bOCIwRlG5NuNdb4qC0mMQL
   vWRqr7itOzeDRfwOxECNrxejSreUVXLSC7nS9dxtT66xon9UGuWQoWxEq
   A==;
X-CSE-ConnectionGUID: 8/yo1A59QsGENu3fad/8UQ==
X-CSE-MsgGUID: T8OXxN7gRvayv20C5ES2uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17835763"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="17835763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:57:09 -0700
X-CSE-ConnectionGUID: O3GSXUjeSxCZ88b8f9oerw==
X-CSE-MsgGUID: TlunNVQoQeSeA/6LG2IZ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82964577"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2024 21:57:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6jib-000h9L-2C;
	Fri, 01 Nov 2024 04:57:05 +0000
Date: Fri, 1 Nov 2024 12:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>
Subject: mm/kmsan/hooks.c:269:14: sparse: sparse: cast removes address space
 '__user' of expression
Message-ID: <202411011212.6RM81BEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ilya,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c52d4da1c742cd01a797a4d0a2d3c5a60dc9bfe
commit: 3a8f6f3b469b4075919a3613e182f9a70df92d46 kmsan: enable on s390
date:   4 months ago
config: s390-randconfig-r112-20241030 (https://download.01.org/0day-ci/archive/20241101/202411011212.6RM81BEd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce: (https://download.01.org/0day-ci/archive/20241101/202411011212.6RM81BEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011212.6RM81BEd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kmsan/hooks.c:269:14: sparse: sparse: cast removes address space '__user' of expression
   mm/kmsan/hooks.c:271:75: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void const *user_addr @@     got void [noderef] __user *to @@
   mm/kmsan/hooks.c:271:75: sparse:     expected void const *user_addr
   mm/kmsan/hooks.c:271:75: sparse:     got void [noderef] __user *to
   mm/kmsan/hooks.c:280:50: sparse: sparse: cast removes address space '__user' of expression
   mm/kmsan/hooks.c:306:59: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:319:79: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:325:79: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:421:78: sparse: sparse: Using plain integer as NULL pointer

vim +/__user +269 mm/kmsan/hooks.c

b073d7f8aee4ebf Alexander Potapenko 2022-09-15  247  
75cf0290271bf6d Alexander Potapenko 2022-09-15  248  void kmsan_copy_to_user(void __user *to, const void *from, size_t to_copy,
75cf0290271bf6d Alexander Potapenko 2022-09-15  249  			size_t left)
75cf0290271bf6d Alexander Potapenko 2022-09-15  250  {
75cf0290271bf6d Alexander Potapenko 2022-09-15  251  	unsigned long ua_flags;
75cf0290271bf6d Alexander Potapenko 2022-09-15  252  
75cf0290271bf6d Alexander Potapenko 2022-09-15  253  	if (!kmsan_enabled || kmsan_in_runtime())
75cf0290271bf6d Alexander Potapenko 2022-09-15  254  		return;
75cf0290271bf6d Alexander Potapenko 2022-09-15  255  	/*
75cf0290271bf6d Alexander Potapenko 2022-09-15  256  	 * At this point we've copied the memory already. It's hard to check it
75cf0290271bf6d Alexander Potapenko 2022-09-15  257  	 * before copying, as the size of actually copied buffer is unknown.
75cf0290271bf6d Alexander Potapenko 2022-09-15  258  	 */
75cf0290271bf6d Alexander Potapenko 2022-09-15  259  
75cf0290271bf6d Alexander Potapenko 2022-09-15  260  	/* copy_to_user() may copy zero bytes. No need to check. */
75cf0290271bf6d Alexander Potapenko 2022-09-15  261  	if (!to_copy)
75cf0290271bf6d Alexander Potapenko 2022-09-15  262  		return;
75cf0290271bf6d Alexander Potapenko 2022-09-15  263  	/* Or maybe copy_to_user() failed to copy anything. */
75cf0290271bf6d Alexander Potapenko 2022-09-15  264  	if (to_copy <= left)
75cf0290271bf6d Alexander Potapenko 2022-09-15  265  		return;
75cf0290271bf6d Alexander Potapenko 2022-09-15  266  
75cf0290271bf6d Alexander Potapenko 2022-09-15  267  	ua_flags = user_access_save();
f926e9326f3a79f Ilya Leoshkevich    2024-06-21  268  	if (!IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) ||
f926e9326f3a79f Ilya Leoshkevich    2024-06-21 @269  	    (u64)to < TASK_SIZE) {
75cf0290271bf6d Alexander Potapenko 2022-09-15  270  		/* This is a user memory access, check it. */
75cf0290271bf6d Alexander Potapenko 2022-09-15  271  		kmsan_internal_check_memory((void *)from, to_copy - left, to,
75cf0290271bf6d Alexander Potapenko 2022-09-15  272  					    REASON_COPY_TO_USER);
75cf0290271bf6d Alexander Potapenko 2022-09-15  273  	} else {
75cf0290271bf6d Alexander Potapenko 2022-09-15  274  		/* Otherwise this is a kernel memory access. This happens when a
75cf0290271bf6d Alexander Potapenko 2022-09-15  275  		 * compat syscall passes an argument allocated on the kernel
75cf0290271bf6d Alexander Potapenko 2022-09-15  276  		 * stack to a real syscall.
75cf0290271bf6d Alexander Potapenko 2022-09-15  277  		 * Don't check anything, just copy the shadow of the copied
75cf0290271bf6d Alexander Potapenko 2022-09-15  278  		 * bytes.
75cf0290271bf6d Alexander Potapenko 2022-09-15  279  		 */
75cf0290271bf6d Alexander Potapenko 2022-09-15  280  		kmsan_internal_memmove_metadata((void *)to, (void *)from,
75cf0290271bf6d Alexander Potapenko 2022-09-15  281  						to_copy - left);
75cf0290271bf6d Alexander Potapenko 2022-09-15  282  	}
75cf0290271bf6d Alexander Potapenko 2022-09-15  283  	user_access_restore(ua_flags);
75cf0290271bf6d Alexander Potapenko 2022-09-15  284  }
75cf0290271bf6d Alexander Potapenko 2022-09-15  285  EXPORT_SYMBOL(kmsan_copy_to_user);
75cf0290271bf6d Alexander Potapenko 2022-09-15  286  

:::::: The code at line 269 was first introduced by commit
:::::: f926e9326f3a79f7e01ac790e2361f44d8ca8320 kmsan: fix kmsan_copy_to_user() on arches with overlapping address spaces

:::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
