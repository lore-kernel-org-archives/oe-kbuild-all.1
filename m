Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A817C3DCD84
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 22:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859983; cv=none; b=TtFl812++NsgKtGrNO+7lis4xzdmoYE7bYB5WCOx5ljD+l8WGkBekhFSjPXVejJOUgOlIF1O8fUBhuckKYocDaHPULCN2YOvNHiFPBNVGPHtze8LeLXt2QdqNKBjHetVAq+/kSKVswtVrbUxL9djyTvtmY/haKBCWK9MVkT69Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859983; c=relaxed/simple;
	bh=QN3RMGdznaewkoIBvrO30O57qetFFpONlisknfBL4Do=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iHFY/T7qORQ14A0dsdVLOQahs/dkZqzumESXrRuoHfEyqR3UlUTDaWheAA0tcuXoDI+Y8WMC8jsl1qs3wtNJU+FEE+yDtOa+0jW61iIKG7MzM7dcMQ9Q9i1Ds3rwMITzdOuXRhXIJJVHwMnh8mBGiGEO6rbTIa4C/SDNY0qAKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETghJLhd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETghJLhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775859981; x=1807395981;
  h=date:from:to:cc:subject:message-id;
  bh=QN3RMGdznaewkoIBvrO30O57qetFFpONlisknfBL4Do=;
  b=ETghJLhdPX1dji/D8lUI5H18DTP3+j5+0ISB7xctrm7Scr5kMWwtRHLm
   u3245+890SOAQel3S2ksxv6mTMxBEgAInseUhO4rogKh0AB4I/5o5spD0
   eUhinZjuhRcbPyKEK/R3qTg3OubJzcDRhVi49WahkxRw4+bD6Rhm/UjxK
   K8rQhLE+iK5VBsvs4LxtbbWjgR5MJiJEK5vF3mr97wzmU5ZxrvbtHiVEv
   hFbO0lAczVyyE/fmqDyE8cVRXr6QxTtIFNdIqCl/rNDbrffwaK+49f29D
   DeAZci4Y/abjkn8d0Pz22MH+liWZTDxkJs22gRdTIFu6gynfCT5fk4Hl0
   w==;
X-CSE-ConnectionGUID: NYuXKIp+Tgqr7+vnrdFSWA==
X-CSE-MsgGUID: zZh3XZoDQGa/P8NkmFE0Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75927801"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="75927801"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:26:19 -0700
X-CSE-ConnectionGUID: 09NXBcccTKiCr94swGGE/Q==
X-CSE-MsgGUID: keMZDOg0Rb2IoGPbMrhmRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252578552"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 15:26:18 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBKIq-000000000Ir-1fUq;
	Fri, 10 Apr 2026 22:26:16 +0000
Date: Sat, 11 Apr 2026 06:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 38/38]
 arch/xtensa/include/asm/timex.h:58:10: fatal error: asm-generic/timex.h: No
 such file or directory
Message-ID: <202604110620.c1KfXQPk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: c8e6e3529d3137cb0aba79b565eb04ab8f346829 [38/38] treewide: Remove asm/timex.h includes from generic code
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260411/202604110620.c1KfXQPk-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110620.c1KfXQPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110620.c1KfXQPk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/delay.h:15,
                    from include/linux/delay.h:18,
                    from init/main.c:26:
>> arch/xtensa/include/asm/timex.h:58:10: fatal error: asm-generic/timex.h: No such file or directory
      58 | #include <asm-generic/timex.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +58 arch/xtensa/include/asm/timex.h

9a8fd5589902153 include/asm-xtensa/timex.h      Chris Zankel       2005-06-23  57  
e10e2f58030c5c2 arch/xtensa/include/asm/timex.h Jason A. Donenfeld 2022-04-08 @58  #include <asm-generic/timex.h>
e10e2f58030c5c2 arch/xtensa/include/asm/timex.h Jason A. Donenfeld 2022-04-08  59  

:::::: The code at line 58 was first introduced by commit
:::::: e10e2f58030c5c211d49042a8c2a1b93d40b2ffb xtensa: use fallback for random_get_entropy() instead of zero

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
