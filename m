Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55921DF96C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738093345; cv=none; b=mbaSipB99BEmPTamFjcV0XkCII78bI+GngpejOFViMprHI/VMHq0AFdqX0T2pouluukG/Mx3rJEmWknOEbKZLqE2rG7SfH+n9WUFA4FsagkCNSYagOCRf/vPFdnCnJ7RQYkfo5mJ+fhSvjpSxGnj5smVXYLED1V0573tRNvaoLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738093345; c=relaxed/simple;
	bh=R029wN9gX6NBUYw5spewMTV38CtE40D8Jl6ywP5kh2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UfjZIhkrG7CRxrXIfHVJmxjW2aVClvYpFECxD6uOxZXHlaWXjFbFssGwKcI6Ah/LIXWY9ZQAOYjqwgKN8n8DqQgATjk/VOt4eXJapgsOFN/ccjH23orXvR9cM40Vwbs/JfscD0UF5plfpp2MlAt7tzfCTaekgKypkTijK/N7BSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeOOrZQC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeOOrZQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738093344; x=1769629344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R029wN9gX6NBUYw5spewMTV38CtE40D8Jl6ywP5kh2Q=;
  b=KeOOrZQC6P26fpRaysgqWhBEK21+AeuJL4y7H2oTKHmwzH1CJVeyPGBs
   C2JSf53TbckBOVBK0gm6wZURJ2JVw35oZNGdczUuDeEIqco4McLXjCTgz
   8L97J2vc2Al3YjjzCKog/tiq/zC6CSysu6uMfaUwEYLWhGLQHCteU909p
   w8A6gYFFIWOue0gsWLBTSpTPlGLAG8/DJj2/ZOZ58NPcF3WEXEx00qudt
   8ac84qJtWRBVC3fANjKrSN37o163+fr6uCkc+m1ze2LtuZHO9YHWWtV6I
   ZEqKdRthkPtOzT9P6gwI5F4hq3QYsEb87EwqEEk2JbHaS1TpuJ52P4TLy
   A==;
X-CSE-ConnectionGUID: JhEIYflHRba35/ROMotZcQ==
X-CSE-MsgGUID: fm8VbVQZRWa6X9hSHmnnxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49181764"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="49181764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 11:42:23 -0800
X-CSE-ConnectionGUID: fdXyCRtrRNi5fILMkb6AEQ==
X-CSE-MsgGUID: juutmF6yTH6qMWhLo0HeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112832124"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2025 11:42:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcrTX-000i8r-0q;
	Tue, 28 Jan 2025 19:42:19 +0000
Date: Wed, 29 Jan 2025 03:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>
Subject: mm/kmsan/hooks.c:269:14: sparse: sparse: cast removes address space
 '__user' of expression
Message-ID: <202501290356.mlGVL2QZ-lkp@intel.com>
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
head:   e2ee2e9b159094527ae7ad78058b1316f62fc5b7
commit: 3a8f6f3b469b4075919a3613e182f9a70df92d46 kmsan: enable on s390
date:   7 months ago
config: s390-randconfig-r132-20250126 (https://download.01.org/0day-ci/archive/20250129/202501290356.mlGVL2QZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250129/202501290356.mlGVL2QZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290356.mlGVL2QZ-lkp@intel.com/

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

b073d7f8aee4eb Alexander Potapenko 2022-09-15  247  
75cf0290271bf6 Alexander Potapenko 2022-09-15  248  void kmsan_copy_to_user(void __user *to, const void *from, size_t to_copy,
75cf0290271bf6 Alexander Potapenko 2022-09-15  249  			size_t left)
75cf0290271bf6 Alexander Potapenko 2022-09-15  250  {
75cf0290271bf6 Alexander Potapenko 2022-09-15  251  	unsigned long ua_flags;
75cf0290271bf6 Alexander Potapenko 2022-09-15  252  
75cf0290271bf6 Alexander Potapenko 2022-09-15  253  	if (!kmsan_enabled || kmsan_in_runtime())
75cf0290271bf6 Alexander Potapenko 2022-09-15  254  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  255  	/*
75cf0290271bf6 Alexander Potapenko 2022-09-15  256  	 * At this point we've copied the memory already. It's hard to check it
75cf0290271bf6 Alexander Potapenko 2022-09-15  257  	 * before copying, as the size of actually copied buffer is unknown.
75cf0290271bf6 Alexander Potapenko 2022-09-15  258  	 */
75cf0290271bf6 Alexander Potapenko 2022-09-15  259  
75cf0290271bf6 Alexander Potapenko 2022-09-15  260  	/* copy_to_user() may copy zero bytes. No need to check. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  261  	if (!to_copy)
75cf0290271bf6 Alexander Potapenko 2022-09-15  262  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  263  	/* Or maybe copy_to_user() failed to copy anything. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  264  	if (to_copy <= left)
75cf0290271bf6 Alexander Potapenko 2022-09-15  265  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  266  
75cf0290271bf6 Alexander Potapenko 2022-09-15  267  	ua_flags = user_access_save();
f926e9326f3a79 Ilya Leoshkevich    2024-06-21  268  	if (!IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) ||
f926e9326f3a79 Ilya Leoshkevich    2024-06-21 @269  	    (u64)to < TASK_SIZE) {
75cf0290271bf6 Alexander Potapenko 2022-09-15  270  		/* This is a user memory access, check it. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  271  		kmsan_internal_check_memory((void *)from, to_copy - left, to,
75cf0290271bf6 Alexander Potapenko 2022-09-15  272  					    REASON_COPY_TO_USER);
75cf0290271bf6 Alexander Potapenko 2022-09-15  273  	} else {
75cf0290271bf6 Alexander Potapenko 2022-09-15  274  		/* Otherwise this is a kernel memory access. This happens when a
75cf0290271bf6 Alexander Potapenko 2022-09-15  275  		 * compat syscall passes an argument allocated on the kernel
75cf0290271bf6 Alexander Potapenko 2022-09-15  276  		 * stack to a real syscall.
75cf0290271bf6 Alexander Potapenko 2022-09-15  277  		 * Don't check anything, just copy the shadow of the copied
75cf0290271bf6 Alexander Potapenko 2022-09-15  278  		 * bytes.
75cf0290271bf6 Alexander Potapenko 2022-09-15  279  		 */
75cf0290271bf6 Alexander Potapenko 2022-09-15  280  		kmsan_internal_memmove_metadata((void *)to, (void *)from,
75cf0290271bf6 Alexander Potapenko 2022-09-15  281  						to_copy - left);
75cf0290271bf6 Alexander Potapenko 2022-09-15  282  	}
75cf0290271bf6 Alexander Potapenko 2022-09-15  283  	user_access_restore(ua_flags);
75cf0290271bf6 Alexander Potapenko 2022-09-15  284  }
75cf0290271bf6 Alexander Potapenko 2022-09-15  285  EXPORT_SYMBOL(kmsan_copy_to_user);
75cf0290271bf6 Alexander Potapenko 2022-09-15  286  

:::::: The code at line 269 was first introduced by commit
:::::: f926e9326f3a79f7e01ac790e2361f44d8ca8320 kmsan: fix kmsan_copy_to_user() on arches with overlapping address spaces

:::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
