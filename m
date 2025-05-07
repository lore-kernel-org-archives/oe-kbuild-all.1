Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4CD2135B8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601044; cv=none; b=JU/oX9kKPeGhP4GNa41KzSacq/Y70hdeaGNJ7dM4tiHilTqHOAhu5CuJEXl+sAHIb3AVv97EhoB5PNuzHujNOKeDfkOtuUbku0IoUHGYvumWGiCuKmTBs62Sa/SWca/rgyk+K9RJ/+8VMQYC86SWv2rLEu5MxYNfuP4pZqlOcD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601044; c=relaxed/simple;
	bh=3+Ds7HBnge3aue4fFtDSBOtppWC8lAmrPNR4lg30I+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GGnidbcKJg+4/hav4KDNm8JmIqywBEXckxdW0HWg2fNlpmaM2oyDoDGdlBlD8hrhHui4fB7ja4t3FEk9i114h1z9ycduPGXd5lDT8LohIpQrdljjLwfmyqpdOxQF38MUJy8nibYDfz/NXD4I/3Xkz3b4y+VM5qzNjtzD+kBmeyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvLADplj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvLADplj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746601042; x=1778137042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+Ds7HBnge3aue4fFtDSBOtppWC8lAmrPNR4lg30I+U=;
  b=bvLADpljJ4gV0bWGoFRHvvUO/HSBFjJDL+g/f3RiAXzHhzZwUTJneK7k
   dwvCHXQrgMpXkKB+8u+8G5PKUCZxe/+Qs3hzH6J2y+4+2g+IFW/vo17kz
   rjw/WEPEwyzwfy9soBT7P7Yja82+JCSrbAYONWJmmhk7/eh6TgczE/17P
   MGBK88VCpCI9yp5Ox8Vg2q4teegXo5PLXuUjTxVwwp1jdECwNHFWwRJ8G
   yx5HjmV3YKYegMmHtYwrCBuQjRCcpWD+bTun0RkXAnG/XqGSQuqW+lHuB
   cLtzo2RR2hybu+RvauFdZ5HgNvTGz+wVoRb3O8hvg5MccP4yJAQP7C/b6
   A==;
X-CSE-ConnectionGUID: q/bCFzixRVacA5xnDoss5Q==
X-CSE-MsgGUID: 0nAoBMwdRSmNUiGlZR5QRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48429602"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48429602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:57:19 -0700
X-CSE-ConnectionGUID: E70uehGHRd6fAmQ6JM95Sw==
X-CSE-MsgGUID: SB9tJpSpRCaFETQvuY/7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="139916699"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2025 23:57:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYiR-0007F1-0T;
	Wed, 07 May 2025 06:57:15 +0000
Date: Wed, 7 May 2025 14:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3500/8679] arch/um/include/asm/fpu/api.h:16:16:
 error: 'true' undeclared
Message-ID: <202505071402.9JZkiyga-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 34f170a590710737f9611231cd77b37ea41f707a [3500/8679] crypto: simd - Include asm/simd.h in internal/simd.h
config: um-randconfig-r122-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071402.9JZkiyga-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071402.9JZkiyga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071402.9JZkiyga-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/simd.h:5,
                    from include/crypto/internal/simd.h:9,
                    from lib/crypto/simd.c:8:
   arch/um/include/asm/fpu/api.h:14:15: error: unknown type name 'bool'
      14 | static inline bool irq_fpu_usable(void)
         |               ^~~~
   arch/um/include/asm/fpu/api.h: In function 'irq_fpu_usable':
>> arch/um/include/asm/fpu/api.h:16:16: error: 'true' undeclared (first use in this function)
      16 |         return true;
         |                ^~~~
   arch/um/include/asm/fpu/api.h:1:1: note: 'true' is defined in header '<stdbool.h>'; did you forget to '#include <stdbool.h>'?
     +++ |+#include <stdbool.h>
       1 | /* SPDX-License-Identifier: GPL-2.0-or-later */
   arch/um/include/asm/fpu/api.h:16:16: note: each undeclared identifier is reported only once for each function it appears in
      16 |         return true;
         |                ^~~~


vim +/true +16 arch/um/include/asm/fpu/api.h

c0ecca6604b80e4 Anton Ivanov 2021-03-12  13  
c0ecca6604b80e4 Anton Ivanov 2021-03-12  14  static inline bool irq_fpu_usable(void)
c0ecca6604b80e4 Anton Ivanov 2021-03-12  15  {
c0ecca6604b80e4 Anton Ivanov 2021-03-12 @16  	return true;
c0ecca6604b80e4 Anton Ivanov 2021-03-12  17  }
c0ecca6604b80e4 Anton Ivanov 2021-03-12  18  

:::::: The code at line 16 was first introduced by commit
:::::: c0ecca6604b80e438b032578634c6e133c7028f6 um: enable the use of optimized xor routines in UML

:::::: TO: Anton Ivanov <anton.ivanov@cambridgegreys.com>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
