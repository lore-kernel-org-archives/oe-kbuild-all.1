Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E002505B2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 02:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779677633; cv=none; b=f4XXPlXqyfZsz5cKZssNBkxt5wtBbeezQFlgVMedZlMupHv8zov87S1BaZJeq2iAbc2mLjqF3Y1uFo8COAPTtdQug8udWQTt0XOvC5H7CIPq0oC57GwJ6FkHH0jpRg6qzE+KVekdXH1u7kZE50kbmXUazW/EXfGbHCE5KiGAvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779677633; c=relaxed/simple;
	bh=cE8NB55ntNunIFTMoPA+9heZSX1P0pG8GtkIECmG6Uc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OcQRceUFRGjb/oWmkWPZxsdCV/QGjfRhFY+WkhVHm7LZZr5ulKkAECcX4gT92+4cDflgMeCUil5RQNZlvZqNoUdqe96I7OA7VzHGq6k/lFfoZkQGEeYQ1wSn85hrP0Qo6kTo0LVJbBBQlNZDarOy+/c6li8s9Ka5ljpL6jf+M+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D80L2vPh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D80L2vPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779677632; x=1811213632;
  h=date:from:to:cc:subject:message-id;
  bh=cE8NB55ntNunIFTMoPA+9heZSX1P0pG8GtkIECmG6Uc=;
  b=D80L2vPhylmXGDLWVJHDaBO9x29+a9DzBq+cCHcKK0Vy7IGqQVk2DaAx
   dd/vN73GRlJ7DjK+ng3EYQbXo8jQZAmMmuepQb4IdZZHbFtW/pIW7+/1r
   17f8NJfnieaLg7n0O8ZsRs9QZL9lDBQkDcqvrL/afbPrA1FRwqAewQEk7
   zGUaxP97AbbhXGvbSC3DQofZZi9A1TywC5rfzLdkGuKfNN8mGQXZBM5+X
   YoS3rXGugrq2Yq+KXCo6gxaPxRwyBhlizpFIkHtFOZ3AJ0IP+OHHvpWV1
   oLIngNZzrI7iDjAeiNHkvN6++QQg5Pi6DXXCoZ6s2FInfmZt75mqh2yI4
   Q==;
X-CSE-ConnectionGUID: I6rhFLs0QsCqhIgmThhucQ==
X-CSE-MsgGUID: W/LqwP6kQdaJSglkhuLEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80353522"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80353522"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 19:53:51 -0700
X-CSE-ConnectionGUID: +nBBoSaMQ8+joiv4eU9t5w==
X-CSE-MsgGUID: mX2QH8VlQzuXQ2hinJMIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="240638016"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 May 2026 19:53:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRLRq-000000000tT-15uM;
	Mon, 25 May 2026 02:53:46 +0000
Date: Mon, 25 May 2026 10:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>
Subject: fs/pstore/ram_core.c:278:34: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202605251003.InuuGWYe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   1 year, 1 month ago
config: um-randconfig-r123-20260525 (https://download.01.org/0day-ci/archive/20260525/202605251003.InuuGWYe-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605251003.InuuGWYe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a0e2cb6a9063 ("um: Add VFIO-based virtual PCI driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251003.InuuGWYe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/pstore/ram_core.c:278:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char * @@
   fs/pstore/ram_core.c:278:34: sparse:     expected void volatile [noderef] __iomem *addr
   fs/pstore/ram_core.c:278:34: sparse:     got unsigned char *
>> fs/pstore/ram_core.c:311:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char * @@
   fs/pstore/ram_core.c:311:50: sparse:     expected void const volatile [noderef] __iomem *addr
   fs/pstore/ram_core.c:311:50: sparse:     got unsigned char *
   fs/pstore/ram_core.c:312:65: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char * @@
   fs/pstore/ram_core.c:312:65: sparse:     expected void const volatile [noderef] __iomem *addr
   fs/pstore/ram_core.c:312:65: sparse:     got unsigned char *
   fs/pstore/ram_core.c:470:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   fs/pstore/ram_core.c:470:20: sparse:     expected void *va
   fs/pstore/ram_core.c:470:20: sparse:     got void [noderef] __iomem *
   fs/pstore/ram_core.c:472:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   fs/pstore/ram_core.c:472:20: sparse:     expected void *va
   fs/pstore/ram_core.c:472:20: sparse:     got void [noderef] __iomem *
   fs/pstore/ram_core.c:566:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *vaddr @@
   fs/pstore/ram_core.c:566:36: sparse:     expected void volatile [noderef] __iomem *addr
   fs/pstore/ram_core.c:566:36: sparse:     got void *vaddr
   fs/pstore/ram_core.c:69:17: sparse: sparse: context imbalance in 'buffer_start_add' - unexpected unlock
   fs/pstore/ram_core.c:95:17: sparse: sparse: context imbalance in 'buffer_size_add' - unexpected unlock

vim +278 fs/pstore/ram_core.c

9cc05ad97c5728 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  273  
a15d0b365e9bbf drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  274  static void notrace persistent_ram_update(struct persistent_ram_zone *prz,
808d0387eb7df3 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  275  	const void *s, unsigned int start, unsigned int count)
9cc05ad97c5728 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  276  {
9cc05ad97c5728 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  277  	struct persistent_ram_buffer *buffer = prz->buffer;
7e75678d23167c fs/pstore/ram_core.c                     Furquan Shaikh    2016-02-15 @278  	memcpy_toio(buffer->data + start, s, count);
808d0387eb7df3 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  279  	persistent_ram_update_ecc(prz, start, count);
9cc05ad97c5728 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  280  }
9cc05ad97c5728 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  281  
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  282  static int notrace persistent_ram_update_user(struct persistent_ram_zone *prz,
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  283  	const void __user *s, unsigned int start, unsigned int count)
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  284  {
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  285  	struct persistent_ram_buffer *buffer = prz->buffer;
ff847781049c37 fs/pstore/ram_core.c                     Al Viro           2020-02-18  286  	int ret = unlikely(copy_from_user(buffer->data + start, s, count)) ?
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  287  		-EFAULT : 0;
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  288  	persistent_ram_update_ecc(prz, start, count);
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  289  	return ret;
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  290  }
5bf6d1b92715f2 fs/pstore/ram_core.c                     Mark Salyzyn      2016-09-01  291  
201e4aca5aa179 fs/pstore/ram_core.c                     Anton Vorontsov   2012-05-26  292  void persistent_ram_save_old(struct persistent_ram_zone *prz)
9cc05ad97c5728 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  293  {
9cc05ad97c5728 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  294  	struct persistent_ram_buffer *buffer = prz->buffer;
808d0387eb7df3 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  295  	size_t size = buffer_size(prz);
808d0387eb7df3 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  296  	size_t start = buffer_start(prz);
9cc05ad97c5728 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  297  
201e4aca5aa179 fs/pstore/ram_core.c                     Anton Vorontsov   2012-05-26  298  	if (!size)
201e4aca5aa179 fs/pstore/ram_core.c                     Anton Vorontsov   2012-05-26  299  		return;
c672528aec4a1c drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  300  
201e4aca5aa179 fs/pstore/ram_core.c                     Anton Vorontsov   2012-05-26  301  	if (!prz->old_log) {
201e4aca5aa179 fs/pstore/ram_core.c                     Anton Vorontsov   2012-05-26  302  		persistent_ram_ecc_old(prz);
104fd0b5e94815 fs/pstore/ram_core.c                     Yuxiao Zhang      2023-06-27  303  		prz->old_log = kvzalloc(size, GFP_KERNEL);
201e4aca5aa179 fs/pstore/ram_core.c                     Anton Vorontsov   2012-05-26  304  	}
201e4aca5aa179 fs/pstore/ram_core.c                     Anton Vorontsov   2012-05-26  305  	if (!prz->old_log) {
ef74885353e0ee fs/pstore/ram_core.c                     Fabian Frederick  2014-06-06  306  		pr_err("failed to allocate buffer\n");
c672528aec4a1c drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  307  		return;
c672528aec4a1c drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  308  	}
c672528aec4a1c drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  309  
808d0387eb7df3 drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  310  	prz->old_log_size = size;
d771fdf94180de fs/pstore/ram_core.c                     Andrew Bresticker 2016-02-15 @311  	memcpy_fromio(prz->old_log, &buffer->data[start], size - start);
d771fdf94180de fs/pstore/ram_core.c                     Andrew Bresticker 2016-02-15  312  	memcpy_fromio(prz->old_log + size - start, &buffer->data[0], start);
c672528aec4a1c drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  313  }
c672528aec4a1c drivers/staging/android/persistent_ram.c Colin Cross       2012-03-07  314  

:::::: The code at line 278 was first introduced by commit
:::::: 7e75678d23167c2527e655658a8ef36a36c8b4d9 pstore/ram: Use memcpy_toio instead of memcpy

:::::: TO: Furquan Shaikh <furquan@google.com>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
