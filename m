Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CECCEAD6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZ+o4EBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701022630; x=1732558630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ke2U1SsoTK2ah2q8nxSFcWuivPP36EMChIblZzoDwSA=;
  b=gZ+o4EBTfSGNi1W58GThoIr2W4F+z3ICn0siD1llXSBNuZG03oNadcP5
   X/ZPInz3uuTWL5LGjRHQH2ToSJ1V9O9dQQ4AkdBhgYAmjTw8cdX/qgybp
   RLo0lPtEtRlsWhssOw9twzRnS+pkDfbgA0zO0KWSE0SHRBRv+Z8LKI9Q/
   kSfa5Mp6HgIVGbDqoqUTEsEJpz6Yl28ukS+Pp6Rp7TS1rUl9W1cgiumj7
   /l5j59pFB/NrayyzTRTCvM27wwvHqLmSJ29rS1dhFJt7NxXdUPPgKwgjn
   /NBZyIvqVFum9nK/JnAIehh1ExU2UUa8hP9HWj/7RBRZtUQsHv8usslCr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391460407"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="391460407"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 10:17:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="16093317"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2023 10:17:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Jgn-0005P8-2V;
	Sun, 26 Nov 2023 18:17:05 +0000
Date: Mon, 27 Nov 2023 02:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [linux-next:master 2562/2998]
 arch/csky/kernel/vdso/vgettimeofday.c:8:5: sparse: sparse: function
 '__vdso_clock_gettime' with external linkage has definition
Message-ID: <202311270050.DXxU8Pzu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c9660f6515396aba78d1168d2e17951d653ebf2
commit: 42874e4eb35bdfc54f8514685e50434098ba4f6c [2562/2998] arch: vdso: consolidate gettime prototypes
config: csky-randconfig-r131-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270050.DXxU8Pzu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270050.DXxU8Pzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270050.DXxU8Pzu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/csky/kernel/vdso/vgettimeofday.c:8:5: sparse: sparse: function '__vdso_clock_gettime' with external linkage has definition

vim +/__vdso_clock_gettime +8 arch/csky/kernel/vdso/vgettimeofday.c

0d3b051adbb72e Guo Ren 2021-01-17   6  
c8171a86b27401 Guo Ren 2023-08-10   7  extern
0d3b051adbb72e Guo Ren 2021-01-17  @8  int __vdso_clock_gettime(clockid_t clock,
0d3b051adbb72e Guo Ren 2021-01-17   9  			 struct old_timespec32 *ts)
0d3b051adbb72e Guo Ren 2021-01-17  10  {
0d3b051adbb72e Guo Ren 2021-01-17  11  	return __cvdso_clock_gettime32(clock, ts);
0d3b051adbb72e Guo Ren 2021-01-17  12  }
0d3b051adbb72e Guo Ren 2021-01-17  13  

:::::: The code at line 8 was first introduced by commit
:::::: 0d3b051adbb72ed81956447d0d1e54d5943ee6f5 csky: Add VDSO with GENERIC_GETTIMEOFDAY, GENERIC_TIME_VSYSCALL, HAVE_GENERIC_VDSO

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Guo Ren <guoren@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
