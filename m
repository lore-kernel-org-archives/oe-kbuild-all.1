Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCE61A23A4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779560204; cv=none; b=upLUKlX5GcL5pXVz9LiaAAAzj78WjNqfvQjm4wRnY1Hk3fXZ8zKjYUMNUYfxYqS9ltgDu2nqHVTyx5HQfq1zpQTUUJ2H4j+Q6qV6eanQbaJAqDKzdYRLaodoW8mgYsb9Qd+kF2Z+pN+1S1PsDGt65TlDu4Aeephr63kk5WcDrXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779560204; c=relaxed/simple;
	bh=BLuq+w+FC24N6yargjHbf8j9qurzUZYVnYfA+1jHdd8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pF4JupmpHzTbY7M/QTMuZK2VwsTSShzEY4i1I6pb0aR3+U3FJULq0QDfWgiXCMjslVRWfuQYfbTcDXgRZd9qfvdEvt73IV4hk/DHcnRQbPDSzQf2a7zIi8CD70bUTyy0cTJNOLcgXxMT07uz1Qr1hXr/zP6QcHWqsUowk0CJARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDHIELZh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDHIELZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779560203; x=1811096203;
  h=date:from:to:cc:subject:message-id;
  bh=BLuq+w+FC24N6yargjHbf8j9qurzUZYVnYfA+1jHdd8=;
  b=eDHIELZh7PRCFrMognW8pRaFr+B1IO0ErK+ewwXfqpE8Iw8zOo+RKHm0
   3tzNWQJTrilImxulkbtP2JZLYr1uhOVQJ11AdLIIi/tfnJl5G9QCPMwmm
   fGTVTGVzPDD8YEM1Oi3ImcWK0qIc8rG3T+nuFDSzNM+gEgEv+cL19HTIw
   eEQkV2dcmFzO50L+cfcTgi4fJalJklCVVwcKMVfYxkqIZcLKMfDhlyTR7
   UL+rGpUSBz7U9BNuGFYrNinvqdSzLcpJfA1ibrTvjRt6mmn5JgJvPnI2K
   DII6FrnKfwq2O7ektNqVKFatuaaDLn3x/72Jc8zMNVTnSgVD6DQemiPtV
   g==;
X-CSE-ConnectionGUID: vntK2XV2ReKeI+X64eGQTg==
X-CSE-MsgGUID: kbtZG4ylTcO3BbOfRHo+hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="83030789"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="83030789"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 11:16:42 -0700
X-CSE-ConnectionGUID: ylpU927CRUOAOf7jRNqhMA==
X-CSE-MsgGUID: GNfHlrSxSUqW7lzZhtYRFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="243013889"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2026 11:16:40 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQqtp-000000000Fd-3nH0;
	Sat, 23 May 2026 18:16:37 +0000
Date: Sun, 24 May 2026 02:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: sound/pci/mixart/mixart_core.c:39:19: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202605240216.sJYhxkvw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eed108edc1170404bbef9e7d0189d18a3cc354f5
commit: c7dd395d7b53a66de8503507fe7ef21b8fab3e57 mips: dts: Add PCIe to EcoNet EN751221
date:   7 weeks ago
config: mips-randconfig-r133-20260523 (https://download.01.org/0day-ci/archive/20260524/202605240216.sJYhxkvw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240216.sJYhxkvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c7dd395d7b53 ("mips: dts: Add PCIe to EcoNet EN751221")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240216.sJYhxkvw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/mixart/mixart_core.c:39:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:39:19: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:39:19: sparse:     got unsigned int *
>> sound/pci/mixart/mixart_core.c:39:19: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:40:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:40:19: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:40:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:40:19: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:50:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:50:22: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:50:22: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:50:22: sparse: sparse: cast to restricted __be32
>> sound/pci/mixart/mixart_core.c:56:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:56:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:56:9: sparse:     got restricted __be32 [usertype]
>> sound/pci/mixart/mixart_core.c:56:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:56:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:56:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:74:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:74:32: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:74:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:74:32: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:75:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:75:32: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:75:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:75:32: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:76:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:76:32: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:76:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:76:32: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:77:32: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:77:32: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:101:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:101:19: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:101:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:101:19: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:109:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:109:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:109:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:109:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:109:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:109:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:116:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:116:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:116:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:116:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:116:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:116:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:141:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:141:19: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:141:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:141:19: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:142:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:142:19: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:142:19: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:142:19: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:153:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:153:29: sparse:     expected void const volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:153:29: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:153:29: sparse: sparse: cast to restricted __be32
   sound/pci/mixart/mixart_core.c:161:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:161:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:161:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:161:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:161:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:161:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:166:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:166:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:166:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:166:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:166:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:167:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:167:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:167:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:167:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:167:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:167:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:168:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:168:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:168:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:168:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:168:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:168:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:169:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:169:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:169:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:169:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:169:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:169:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:170:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:170:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:170:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:170:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:170:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:170:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:171:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:171:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:171:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:171:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:171:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:171:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:172:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:172:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:172:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:172:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:172:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:172:9: sparse:     got unsigned int *
   sound/pci/mixart/mixart_core.c:173:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   sound/pci/mixart/mixart_core.c:173:9: sparse:     expected unsigned int [usertype] val
   sound/pci/mixart/mixart_core.c:173:9: sparse:     got restricted __be32 [usertype]
   sound/pci/mixart/mixart_core.c:173:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   sound/pci/mixart/mixart_core.c:173:9: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/mixart/mixart_core.c:173:9: sparse:     got unsigned int *

vim +39 sound/pci/mixart/mixart_core.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  32  
^1da177e4c3f41 Linus Torvalds 2005-04-16  33  
67b48b880062ba Takashi Iwai   2005-11-17  34  static int retrieve_msg_frame(struct mixart_mgr *mgr, u32 *msg_frame)
^1da177e4c3f41 Linus Torvalds 2005-04-16  35  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  36  	/* read the message frame fifo */
^1da177e4c3f41 Linus Torvalds 2005-04-16  37  	u32 headptr, tailptr;
^1da177e4c3f41 Linus Torvalds 2005-04-16  38  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @39  	tailptr = readl_be(MIXART_MEM(mgr, MSG_OUTBOUND_POST_TAIL));
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  	headptr = readl_be(MIXART_MEM(mgr, MSG_OUTBOUND_POST_HEAD));
^1da177e4c3f41 Linus Torvalds 2005-04-16  41  
^1da177e4c3f41 Linus Torvalds 2005-04-16  42  	if (tailptr == headptr)
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  		return 0; /* no message posted */
^1da177e4c3f41 Linus Torvalds 2005-04-16  44  
da3cec35dd3c31 Takashi Iwai   2008-08-08  45  	if (tailptr < MSG_OUTBOUND_POST_STACK)
da3cec35dd3c31 Takashi Iwai   2008-08-08  46  		return 0; /* error */
da3cec35dd3c31 Takashi Iwai   2008-08-08  47  	if (tailptr >= MSG_OUTBOUND_POST_STACK + MSG_BOUND_STACK_SIZE)
da3cec35dd3c31 Takashi Iwai   2008-08-08  48  		return 0; /* error */
^1da177e4c3f41 Linus Torvalds 2005-04-16  49  
^1da177e4c3f41 Linus Torvalds 2005-04-16  50  	*msg_frame = readl_be(MIXART_MEM(mgr, tailptr));
^1da177e4c3f41 Linus Torvalds 2005-04-16  51  
^1da177e4c3f41 Linus Torvalds 2005-04-16  52  	/* increment the tail index */
^1da177e4c3f41 Linus Torvalds 2005-04-16  53  	tailptr += 4;
^1da177e4c3f41 Linus Torvalds 2005-04-16  54  	if( tailptr >= (MSG_OUTBOUND_POST_STACK+MSG_BOUND_STACK_SIZE) )
^1da177e4c3f41 Linus Torvalds 2005-04-16  55  		tailptr = MSG_OUTBOUND_POST_STACK;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @56  	writel_be(tailptr, MIXART_MEM(mgr, MSG_OUTBOUND_POST_TAIL));
^1da177e4c3f41 Linus Torvalds 2005-04-16  57  
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  	return 1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  59  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  60  

:::::: The code at line 39 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
