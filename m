Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF50DDDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720689373; cv=none; b=L/K8Rah2TBIQieWBbYa72CBKzbTZBdw5WF/FibTu5nhvnJakuA1NQdiZ/CexeCGIpmatVlp+dWfe4ytVHC5JGM8sHeWOWPZIns7VlZA6gtvClNvCb5jIXX4/I47uwPdtZG/NRnH7ZqPy5RA2AlFySvckh40OwIP0enxktU1iJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720689373; c=relaxed/simple;
	bh=4+4+oc08e6IHFzjrD8TG6zTS0SH7vjJewVErFly4PFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8kuDwldM9DeMmWZB2kJKyoBwksXhosZfx01gqVaAJttZO0/oe2/FplwWRPoDhLee/d54yKA323/SvD2MXtRkJFCueUXxhlNdxvkZkPHrnCBecfGDka32xVhGGCqJTLgh4eeDbTeofnB4KR7+a4nEzYlwEZ9igG4UHdJsjJ3xaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJ0OQg4d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJ0OQg4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720689371; x=1752225371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+4+oc08e6IHFzjrD8TG6zTS0SH7vjJewVErFly4PFU=;
  b=GJ0OQg4d7wa4plx83pvvYjpR+UK56dtmTpJRwNr4FPlId3iZQhhYhdUk
   4uameFxzU6UHLnnBeLF4SJUL+AwT/dolI2U6rPEMunr23wixTtJsZwGw/
   6WpR989QISm0GQ8kzJTPsphc3hCgt9X7/mLoCkSzYRt0+Lvr7f/XmVqF1
   nKoN4MQSVUv/jJ2t4fVQ6/nGT+/RQHFBFY+HSgh9HFjnRMt+FPQMxDWcL
   DpXGKx4FMpsszfdPerdPkbivN/JZsfuT3UBgdz4qHkfNa7D+ChsgQMY94
   lEpWY/XKiujxXwV8HGaF/l/4SfKGeMXbHbJnqQg3yiGj3vH0J4Ak8cTFC
   A==;
X-CSE-ConnectionGUID: 8nrFyEdeR8amP90qXzaGaA==
X-CSE-MsgGUID: ymuM+uC0SwSEPMF9WqAQcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17756934"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17756934"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 02:12:18 -0700
X-CSE-ConnectionGUID: ayM7yyyKT06mxVN8y2jQvQ==
X-CSE-MsgGUID: X+riCctBT9u5rIhD2mNGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="48566628"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2024 02:12:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRpqY-000Z3Z-2B;
	Thu, 11 Jul 2024 09:12:14 +0000
Date: Thu, 11 Jul 2024 17:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>
Subject: [linux-next:master 12376/12643]
 arch/arm64/include/asm/pgtable.h:1142:54: error: implicit declaration of
 function 'pud_user'; did you mean 'put_user'?
Message-ID: <202407111706.tTA6kPdD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: f082d7f14cf1edb181ac3ffcab9c81d08c6b8592 [12376/12643] mm: remove pud_user() from asm-generic/pgtable-nopmd.h
config: arm64-buildonly-randconfig-r003-20220808 (https://download.01.org/0day-ci/archive/20240711/202407111706.tTA6kPdD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111706.tTA6kPdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111706.tTA6kPdD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm64/include/asm/hardirq.h:17,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/arm64/kernel/asm-offsets.c:12:
   arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>> arch/arm64/include/asm/pgtable.h:1142:54: error: implicit declaration of function 'pud_user'; did you mean 'put_user'? [-Werror=implicit-function-declaration]
    1142 |         return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
         |                                                      ^~~~~~~~
         |                                                      put_user
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1142 arch/arm64/include/asm/pgtable.h

ed928a3402d8a2 Tong Tiangen 2022-05-17  1139  
ed928a3402d8a2 Tong Tiangen 2022-05-17  1140  static inline bool pud_user_accessible_page(pud_t pud)
ed928a3402d8a2 Tong Tiangen 2022-05-17  1141  {
f0f5863a0fb0fb Ryan Roberts 2024-05-03 @1142  	return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
ed928a3402d8a2 Tong Tiangen 2022-05-17  1143  }
ed928a3402d8a2 Tong Tiangen 2022-05-17  1144  #endif
ed928a3402d8a2 Tong Tiangen 2022-05-17  1145  

:::::: The code at line 1142 was first introduced by commit
:::::: f0f5863a0fb0fb48a5881c3f6acca1958899dd76 arm64/mm: Remove PTE_PROT_NONE bit

:::::: TO: Ryan Roberts <ryan.roberts@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
