Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6202E5B2E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765449599; cv=none; b=aHgvbMF3oW+ruQ7mdc5LEUrRMWWlWYrNaVBwteZ9u/WZuL/BGIad0el48eja4DDv/IZqMLyKAJGJRZs035ZgrlMggrq0ULxOQFyQPUxPiAF495GtLPnGzjkePDm3ZZTt5PJuX1qHGXvmUd29yWgZ6XQ/w77GO9ljkAXAuhR0+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765449599; c=relaxed/simple;
	bh=MmzEO6l4+a10sTdS9pcIIWLGyP7Rqo0jXVnOYfz/JPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGZiKlvqw11LGTUm3c6NBrROwjYNzUoRQ+5UOmqvcjfdrnOclBUH9a3YlJ65LSC6UCJvVXbMxZxTnc4v/Nm+maR/G/okd6W9oKwnGP/3WItDWSTvk6kynv2wzGASEYnRloQwkIeKAg4YCkz1R84pf44vfyLiQoWUW2ofQw/FpiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeOCx3Wt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeOCx3Wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765449598; x=1796985598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmzEO6l4+a10sTdS9pcIIWLGyP7Rqo0jXVnOYfz/JPY=;
  b=EeOCx3Wt4CwczuTy1JkQSiRjj67JQod6a9biaTm2ENedc5jgHEhR9pOi
   fv7LEpBCzP5zXjqMNTSUIjp4rOmKPMO+g9tUNIOeDAvZqTouGv40gMwDb
   J2Q14YDZlmKvhB7BRKaEf5y7SbJ7zJxdgtyQMzttT5UBBm1mGGHkM+EY2
   Y40uY2u2B/PsstdlfdANgB9oxNJFJpHzKgkJzv6pnp5bJLaoduCyZjpSj
   OQAVH5+mMyOW1IJEkfCkoHdjWxQvUWzU09JGi5goK5fzIEl4f5RCgEwTu
   y87RokIraCvO+cBF80JwNKD/qr594RYupb+zSL+cSnqgt12JHKTXXJG4g
   A==;
X-CSE-ConnectionGUID: oU541YdiQ5CqVnGxroZj0Q==
X-CSE-MsgGUID: QO0b5IfWQPmugTXJ7K7BPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67503346"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67503346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 02:39:57 -0800
X-CSE-ConnectionGUID: jd2ZePkNQXiKIyTJmwraPQ==
X-CSE-MsgGUID: DDadyHjYQ2uWk7Q36KFysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197251643"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 02:39:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTe5R-000000004Xv-3Xsl;
	Thu, 11 Dec 2025 10:39:53 +0000
Date: Thu, 11 Dec 2025 18:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: fs/pstore/ram_core.c:278:34: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512111827.Jg7ME39E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   7 months ago
config: um-randconfig-r121-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111827.Jg7ME39E-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111827.Jg7ME39E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111827.Jg7ME39E-lkp@intel.com/

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
