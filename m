Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C801CAA99
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739362; cv=none; b=O+k3AL9XsG/ECV3Ym2RffjE0dtTvfQvBXtAe0RB4BWLKrgrDbhdtvQA5Yn460Gff6s5Rk7w5z7ZCu1tgpKVxkDcF/ZVIoskBNWEdkZM6DvSBS3sfdjyXW1i2VMnWuDe7omv2bB6DUb8mGRvNYLYl2MNbL2tsxf4dSU1V58opFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739362; c=relaxed/simple;
	bh=oIOAGKLqUtg92m7y6X7wnXQFeb0aKxPyR17yh112avo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uvn6oawZlxB/BRlqSk5TU3TQCfpr0/EXa9c1W8InSkeZRnEdyUjEoXSuKyztTHHaw5jca1lgnnFtiF2ixiJzVM0i+FAIvOZrsSGmzbmzuPuJ+Kp5/F1MsAZvpizSIksssjtVrAR7N3t3qMgN1TJHbz4kMjd8K81tgybsWZg/Xyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQKEegr+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQKEegr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740739361; x=1772275361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oIOAGKLqUtg92m7y6X7wnXQFeb0aKxPyR17yh112avo=;
  b=NQKEegr+ViCQk5TFG8iCswsoHGS/uTS7fT+Q6LCbcgQTKj4F8BnNsgoK
   x8GxYJdJg0VqJreCUbBWlOGhkqowuVKjl9KwFoGdfQKQ09z7J9F+0xih6
   BjH+POGGXPiLEbwnLEa8bzAPPX7Tosd1rzzRYO51uETDVKI2IsFdH7Nzg
   5JyypAST+Q5ilhLzNudt3cLHrjNUF3b513b4OC8Ei44ydLeXqoKpOUQ7I
   dGj2DA3SpZNP4ZqQYlSQrThF9+66pDu+lAkuAo9QgPsQ0iqFlMjPdPgpl
   cxwlSA/jxHACTsRNMpWrukF7YPjBIEcWN9RmA3wEc6KUTsQzvnOp348xb
   g==;
X-CSE-ConnectionGUID: qoHBdvEnQSqlFBkJcdTCMA==
X-CSE-MsgGUID: dImt+eTlTAeWMwimE/tELQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41691825"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="41691825"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 02:42:40 -0800
X-CSE-ConnectionGUID: qAXVZlDMSxucYaaW/ly6SA==
X-CSE-MsgGUID: VPnHlEY1QryzDujeGowrUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117805977"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2025 02:42:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnxpE-000ElM-28;
	Fri, 28 Feb 2025 10:42:36 +0000
Date: Fri, 28 Feb 2025 18:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6954/7423] arch/alpha/include/asm/io.h:636:18:
 warning: no previous prototype for 'ioread64'
Message-ID: <202502281857.8PTGBzRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 07928da414b8c0166c9ad4d33b5470d6f7c1dd47 [6954/7423] asm-generic/io.h: rework split ioread64/iowrite64 helpers
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20250228/202502281857.8PTGBzRm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281857.8PTGBzRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281857.8PTGBzRm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/alpha/kernel/io.c:10:
>> arch/alpha/include/asm/io.h:636:18: warning: no previous prototype for 'ioread64' [-Wmissing-prototypes]
     636 | #define ioread64 ioread64
         |                  ^~~~~~~~
   arch/alpha/kernel/io.c:44:5: note: in expansion of macro 'ioread64'
      44 | u64 ioread64(const void __iomem *addr)
         |     ^~~~~~~~
>> arch/alpha/include/asm/io.h:637:19: warning: no previous prototype for 'iowrite64' [-Wmissing-prototypes]
     637 | #define iowrite64 iowrite64
         |                   ^~~~~~~~~
   arch/alpha/kernel/io.c:71:6: note: in expansion of macro 'iowrite64'
      71 | void iowrite64(u64 b, void __iomem *addr)
         |      ^~~~~~~~~


vim +/ioread64 +636 arch/alpha/include/asm/io.h

^1da177e4c3f41 include/asm-alpha/io.h      Linus Torvalds 2005-04-16  631  
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  632  /*
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  633   * These get provided from <asm-generic/iomap.h> since alpha does not
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  634   * select GENERIC_IOMAP.
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  635   */
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06 @636  #define ioread64 ioread64
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06 @637  #define iowrite64 iowrite64
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  638  #define ioread8_rep ioread8_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  639  #define ioread16_rep ioread16_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  640  #define ioread32_rep ioread32_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  641  #define iowrite8_rep iowrite8_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  642  #define iowrite16_rep iowrite16_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  643  #define iowrite32_rep iowrite32_rep
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  644  #define pci_iounmap pci_iounmap
7e772dad991399 arch/alpha/include/asm/io.h Linus Walleij  2022-09-06  645  

:::::: The code at line 636 was first introduced by commit
:::::: 7e772dad9913992d0351df760dbe72cc32d479f2 alpha: Use generic <asm-generic/io.h>

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
