Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075621;
	b=QJJOCi5Toz2jZNTcPgsH/cOHcbcgMdBv7Ck8BvMChmQptFawtEjDWq10dyyawZMBc+nS
	 60ZvXBfdaK/NbCve7oFaLDXeTvxXRS/u+j2M618luKnUVWedHPZNOWYSF/7PdMjVI0mbh
	 1tRI12GY61g9p+AOfsECO101o2lzMsFIyR2mRP4Rsf31euZVa1tMGcnJUSVHQkeO50c9K
	 nDhGEu5TO49Y3ImYtcztHyPChU1vPXMH7xiW5GJG4b/fPGGnT9KlIENUxen3PzhbY8OH5
	 ujJHhSmJUdGTd2DpHGmDi+UfxmNWsr8hxeGDPbfvM0aAT3X5/6/cpsZvz+3ykBQjP4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075621;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=StE3VVHJsYp6wnm+9HT5oHZ7qCvJxag9tpiXe/owFvI=;
	b=Lvy+3rLPCCUK7Sd7HXSlQPMz2Z+fo+8JFInsSA9YygQd/GwBwLK8v7iEE1mwReVHLoqX
	 I6+VXmQF19yYrKaHm0kAN90lX8GoJRvz+TwBH0W1n2kzRit1K3AQ7iXKwdxc8V7n4vE4U
	 fINHCuYtzpshf4mhycgT0Ihg2AcVuOu+8iKlDKFyPWcj1WPDf3dX1PCWaYDa6deH4/Hh5
	 PSib/c4gGhWJDc+JFqziAHRVqppzk2tVbeqykMuCCFD5Y4ByaZkcfuW/k5t2HKU4DbSCS
	 i/MiAQSu08pDiWW8iW1Yl8vElQdWaYTu7j8NeQyL4tvh209hKCexMwWOSB7ypYrw2aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cvP6D6+N;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A62606A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 08:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A62606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cvP6D6+N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795075621; x=1826611621;
  h=date:from:to:cc:subject:message-id;
  bh=FWeFrG7k6ZuI8I/z0EeXyE2J6XLl657zc1VrlZWfe7c=;
  b=cvP6D6+NsbhKtky08wGqRqxDCZ3vA9dnzf5TvmB5OvzRNa4wBEJ3xI6t
   PjHl8mvxwwj/vIHMfK7vrSjB3F/IzOQN8miH9BlYP38qTQU+YMJSIv2wQ
   XzPGjCZEyI5mXu76j3V3Qpw2764FgyQnhGj8M8cLzMSJ7jrlMd0dsoF5G
   Cf/+n/ZPTnvoad78KBnZZdCvlLO2oh/vJlESMK36DmxfF2/L7XzqZRnDh
   f5Oax1nvGrVSzHQ2u8WYZjNYVEk36IT01rXlkMRQexFtWX0KBwJAon5De
   lvYn8SPYdKfu95GyNGcCb3p7vc1vzvcePa6XFAek2Ulqnso4z2FJUhM2P
   A==;
X-CSE-ConnectionGUID: YRh0tqSrTyOZ4YDj8u0Khw==
X-CSE-MsgGUID: F5CDR5fCTkOSPSaP0PjiqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3835116"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3835116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 00:07:00 -0800
X-CSE-ConnectionGUID: mAweswseQkOXU/L6fP465w==
X-CSE-MsgGUID: KNCKkjR8Tqq1lBSbI9GgOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10362403"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 19 Nov 2026 00:06:59 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTxAW-000000003ix-451R;
	Thu, 19 Nov 2026 08:06:56 +0000
Date: Thu, 19 Nov 2026 09:06:33 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexander Mikhalitsyn <alex@amutable.com>
Subject: [linux-next:master 6831/9180]
 arch/sh/kernel/crash_dump.c:26:43: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Message-ID: <20261119085855.FAscxfBS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Christian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8017d29067fd1310a65c3494ce1a1b492adbac6
commit: e69501a923a5f2c6995a57a1f2ef9c723b66a78c [6831/9180] crash_dump: use copy_oldmem_to_iter() everywhere
config: sh-randconfig-r2304-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119085855.FAscxfBS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119085855.FAscxfBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119085855.FAscxfBS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/sh/kernel/crash_dump.c:26:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *src @@     got void [noderef] __iomem * @@
   arch/sh/kernel/crash_dump.c:26:43: sparse:     expected void const *src
   arch/sh/kernel/crash_dump.c:26:43: sparse:     got void [noderef] __iomem *

vim +26 arch/sh/kernel/crash_dump.c

    13	
    14	ssize_t copy_oldmem_page(struct iov_iter *iter, unsigned long pfn,
    15				 size_t csize, unsigned long offset)
    16	{
    17		void  __iomem *vaddr;
    18	
    19		if (!csize)
    20			return 0;
    21	
    22		vaddr = ioremap(pfn << PAGE_SHIFT, PAGE_SIZE);
    23		if (!vaddr)
    24			return -ENOMEM;
    25	
  > 26		csize = copy_oldmem_to_iter(vaddr + offset, csize, iter);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
