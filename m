Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4F3245019
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 21:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765575876; cv=none; b=MKI4UrAdrANCZxieQ9sxfpNV9ptsbc8fZ3C/2mZcnKLfxdPbWuhsHB4YmciooHQJIVZ5YT/Zsd0igyaVVtte0rq99tLFelp4ldzff3o6URXtmuCinNgGER1fvaTmrNMKMo/OarrS1lWxKCEmpe36tmYygG7y6jo9nuoKMq3WjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765575876; c=relaxed/simple;
	bh=o77Bb4D+UJfxb21GaXXqlk2WDdxgO3Q2KJZ7mBxsYGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oudRLlvGMKDHr5+mYYHb+pjJ1tHuSzT1vUI76yHmISRINUXkIjKhMME+rkSbAaPc/PrM7Ua9HX56c8wN4at02hwGhGaZ3UE95b9iv7wHkTHx0dDLds2dxfG9UHnKhz1Th3HJb2RzGEFeEcZc6B8AW7e7n2jXsWpysp+O+oRZ4vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwkEkJMK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwkEkJMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765575874; x=1797111874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o77Bb4D+UJfxb21GaXXqlk2WDdxgO3Q2KJZ7mBxsYGo=;
  b=RwkEkJMKxc5DzxLBq3FQdzqW3Y43Mx70OrV2i1xCcSATePBeY1h7hp1y
   8f6/NExNoImKQ2eMHHaFJJn/gF/VyqiUn0HYIvCWr4MQGAjO3IulIESRr
   +l5GlSQbwOX88+GDth32xRGt4SIoiVAJ6FgNRHeHxDBQ10PJYSLupBKKD
   uNNguQWcBV5+b76Y3kmoXguZzBp0LT+0P6olZGQ7bMXsTIo1G7Tzl2lj5
   RUOIYLF99YLosWtaKfHQ27DTPcFaX2u9j3KJh5VLtn9SxDHygsgRobW4A
   gW337U3QTL281mdJE7akHaFzVOjHBynUJP/su9MWSkzO5Q3/nbkRNqFPa
   Q==;
X-CSE-ConnectionGUID: xxd/RQIVRwSzAF1TbLYt2A==
X-CSE-MsgGUID: inSmuEliReOni5AHycnWgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78955202"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78955202"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:44:33 -0800
X-CSE-ConnectionGUID: swRxaz+cTeS5T6/wblm8fQ==
X-CSE-MsgGUID: KhePXVYGQm6vf0F28n3QsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="228246899"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:44:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUAw9-000000006f1-41k7;
	Fri, 12 Dec 2025 21:44:29 +0000
Date: Sat, 13 Dec 2025 05:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] mm/kmemleak.c:434:4: error:
 implicit declaration of function 'printk_safe_exit'; did you mean
 'printk_nmi_exit'?
Message-ID: <202512130502.2LxTdCek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 38f093f2876aaa0dd46e11d638e8d2a263f38199 [1941/1941] mm: Fix possible deadlock in console_trylock_spinning
config: arm64-randconfig-002-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130502.2LxTdCek-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130502.2LxTdCek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130502.2LxTdCek-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/kmemleak.c: In function 'lookup_object':
   mm/kmemleak.c:430:4: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_nmi_enter'? [-Werror=implicit-function-declaration]
       printk_safe_enter();
       ^~~~~~~~~~~~~~~~~
       printk_nmi_enter
>> mm/kmemleak.c:434:4: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_nmi_exit'? [-Werror=implicit-function-declaration]
       printk_safe_exit();
       ^~~~~~~~~~~~~~~~
       printk_nmi_exit
   cc1: some warnings being treated as errors


vim +434 mm/kmemleak.c

   405	
   406	/*
   407	 * Look-up a memory block metadata (kmemleak_object) in the object search
   408	 * tree based on a pointer value. If alias is 0, only values pointing to the
   409	 * beginning of the memory block are allowed. The kmemleak_lock must be held
   410	 * when calling this function.
   411	 */
   412	static struct kmemleak_object *lookup_object(unsigned long ptr, int alias)
   413	{
   414		struct rb_node *rb = object_tree_root.rb_node;
   415	
   416		while (rb) {
   417			struct kmemleak_object *object =
   418				rb_entry(rb, struct kmemleak_object, rb_node);
   419			if (ptr < object->pointer)
   420				rb = object->rb_node.rb_left;
   421			else if (object->pointer + object->size <= ptr)
   422				rb = object->rb_node.rb_right;
   423			else if (object->pointer == ptr || alias)
   424				return object;
   425			else {
   426				/*
   427				 * Printk deferring due to the kmemleak_lock held.
   428				 * This is done to avoid deadlock.
   429				 */
   430				printk_safe_enter();
   431				kmemleak_warn("Found object by alias at 0x%08lx\n",
   432					      ptr);
   433				dump_object_info(object);
 > 434				printk_safe_exit();
   435	
   436				break;
   437			}
   438		}
   439		return NULL;
   440	}
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
