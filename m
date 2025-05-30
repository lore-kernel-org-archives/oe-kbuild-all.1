Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A3D156F3C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611988; cv=none; b=ABe38MwvPturXhoT6oxxxTFDomDEfQE3yy/PF83vacEZczrfxkZuJoBMhQ8+bM+05gxc5g2C3zxnFNogvyPfhPe59I3K7RJLskEd6yOqqFakaLARA0Np5616KJ3Uar1QRLH91QBu7YlOH/yII434/RQ9gU2PoaTTkaixkAKYfqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611988; c=relaxed/simple;
	bh=xNGyWtjm8Q9hnyQmRofbh1TXuEumlzZ9M4VGH5XPnZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYNmbAgcnlYB7y+rIfrPBwUOAhun3lE7i/eCgx5Zz5AAqC+x2BLLcev6mRNoKN8IyAIzSExY8Hv7MVP359WTo40Vi5dyGaRWtQb1sxVvbtZbm4mqwFNxX8+0b8V5twpvd7eqQsAEC2PIHiF1ggjupltRl0s4CHWWsL4CW6YCA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDawere6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDawere6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748611987; x=1780147987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xNGyWtjm8Q9hnyQmRofbh1TXuEumlzZ9M4VGH5XPnZY=;
  b=FDawere6n684tfpKsfThUwMjH+vEitG/1YqA6RyM+lYNEs0Eox5dDTzz
   34TCwQ6kUepih0W1CVNzXBtY5dEY4fk3Corq5clSgdyIOG7X6ZRJsu2AE
   DtGmf/nYMQCBXvfqajcL3L+LLA7tU7jdqhqZ+lVT012l8ofYQ/fKnRy5v
   8ekBm2Ud6EFPy7Xgr02jqq8pDd0XhBqfcxX6OJIF6GSXkUzcCzyp3ueK5
   fL79/1E7VaksWh1kLtnc6noZzUozVNS6JLf7nCOc0NG/qVJrC4ghiUt1W
   sIY49EvA7FHdHcZNS+YNVx9+n6KTntRGGvaUAmWJQ/5l0dqlcPsPCZogT
   g==;
X-CSE-ConnectionGUID: HUDzjSiURxWSzJssc4nDhw==
X-CSE-MsgGUID: 7PXRcNgoRayXOebhNqkfhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68129791"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="68129791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:33:06 -0700
X-CSE-ConnectionGUID: CT6BtKkVTW+dfnqrVY3MTA==
X-CSE-MsgGUID: SmNdTIASRfuXQdARVVnMhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="148742239"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2025 06:33:05 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKzr5-0000ts-1g;
	Fri, 30 May 2025 13:33:03 +0000
Date: Fri, 30 May 2025 21:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-05 1/1]
 lib/test_kasan_module.c:25:6: warning: variable 'unused' set but not used
Message-ID: <202505302133.lYndybYp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-05
head:   b97c62c4e7d1e80fb6a2cb0cb381f03bbcd26a4e
commit: 916518ead7a5c918acbd0bdb48e8e5dd10e62bd8 [1/1] FROMGIT: kasan: rename CONFIG_TEST_KASAN_MODULE
config: x86_64-buildonly-randconfig-2003-20250503 (https://download.01.org/0day-ci/archive/20250530/202505302133.lYndybYp-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505302133.lYndybYp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505302133.lYndybYp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_kasan_module.c:25:6: warning: variable 'unused' set but not used [-Wunused-but-set-variable]
      25 |         int unused;
         |             ^
   1 warning generated.


vim +/unused +25 lib/test_kasan_module.c

73228c7ecc5e40c Patricia Alfonso 2020-10-13  19  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  20  static noinline void __init copy_user_test(void)
73228c7ecc5e40c Patricia Alfonso 2020-10-13  21  {
73228c7ecc5e40c Patricia Alfonso 2020-10-13  22  	char *kmem;
73228c7ecc5e40c Patricia Alfonso 2020-10-13  23  	char __user *usermem;
73228c7ecc5e40c Patricia Alfonso 2020-10-13  24  	size_t size = 10;
73228c7ecc5e40c Patricia Alfonso 2020-10-13 @25  	int unused;
73228c7ecc5e40c Patricia Alfonso 2020-10-13  26  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  27  	kmem = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  28  	if (!kmem)
73228c7ecc5e40c Patricia Alfonso 2020-10-13  29  		return;
73228c7ecc5e40c Patricia Alfonso 2020-10-13  30  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  31  	usermem = (char __user *)vm_mmap(NULL, 0, PAGE_SIZE,
73228c7ecc5e40c Patricia Alfonso 2020-10-13  32  			    PROT_READ | PROT_WRITE | PROT_EXEC,
73228c7ecc5e40c Patricia Alfonso 2020-10-13  33  			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  34  	if (IS_ERR(usermem)) {
73228c7ecc5e40c Patricia Alfonso 2020-10-13  35  		pr_err("Failed to allocate user memory\n");
73228c7ecc5e40c Patricia Alfonso 2020-10-13  36  		kfree(kmem);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  37  		return;
73228c7ecc5e40c Patricia Alfonso 2020-10-13  38  	}
73228c7ecc5e40c Patricia Alfonso 2020-10-13  39  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  40  	pr_info("out-of-bounds in copy_from_user()\n");
73228c7ecc5e40c Patricia Alfonso 2020-10-13  41  	unused = copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  42  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  43  	pr_info("out-of-bounds in copy_to_user()\n");
73228c7ecc5e40c Patricia Alfonso 2020-10-13  44  	unused = copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  45  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  46  	pr_info("out-of-bounds in __copy_from_user()\n");
73228c7ecc5e40c Patricia Alfonso 2020-10-13  47  	unused = __copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  48  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  49  	pr_info("out-of-bounds in __copy_to_user()\n");
73228c7ecc5e40c Patricia Alfonso 2020-10-13  50  	unused = __copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  51  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  52  	pr_info("out-of-bounds in __copy_from_user_inatomic()\n");
73228c7ecc5e40c Patricia Alfonso 2020-10-13  53  	unused = __copy_from_user_inatomic(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  54  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  55  	pr_info("out-of-bounds in __copy_to_user_inatomic()\n");
73228c7ecc5e40c Patricia Alfonso 2020-10-13  56  	unused = __copy_to_user_inatomic(usermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  57  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  58  	pr_info("out-of-bounds in strncpy_from_user()\n");
73228c7ecc5e40c Patricia Alfonso 2020-10-13  59  	unused = strncpy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  60  
73228c7ecc5e40c Patricia Alfonso 2020-10-13  61  	vm_munmap((unsigned long)usermem, PAGE_SIZE);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  62  	kfree(kmem);
73228c7ecc5e40c Patricia Alfonso 2020-10-13  63  }
73228c7ecc5e40c Patricia Alfonso 2020-10-13  64  

:::::: The code at line 25 was first introduced by commit
:::::: 73228c7ecc5e40c0851c4703c5ec6ed38123e989 KASAN: port KASAN Tests to KUnit

:::::: TO: Patricia Alfonso <trishalfonso@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
