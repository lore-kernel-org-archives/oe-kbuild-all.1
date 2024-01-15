Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1B18627
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bskdb/Uo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705342537; x=1736878537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5HtEiJqxM8HUgXCO75ZfpHdH3fqr0CDxBWgUgQQ0v8=;
  b=Bskdb/UoNTyLdz6POWKS3soWWryHfeETfyS+dP19XBBK1bvEYj+EQrTH
   Ms1BB+Jk/z54DMpn6ye3SNYoNt9W4A28psFFQc5huEuYgfZk0EuDwYn0o
   NYNq5ycSxWjEO6dtT3tD1TZ3sTnALV4c7+1VTa6xCqEYeBomJZAZQ1mOb
   uIMiWB4F0/vgXB7/oWGHFSxa1fws3NQQeD54G2jhVoJrpF8fAtKI7g3kn
   A5JE6Yob3XBDwZ10mz2gt7pdzDYc8F1+idpUhzyyeI0SL5idiOYU/W7rw
   RCP0PiO0JlwAXQprOpUN9bVDujmhMlCsnsx90TCAqk7JpWug32VMka4tp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="13167250"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="13167250"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 10:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="907115799"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="907115799"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Jan 2024 10:15:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPRUi-000Ceo-1Q;
	Mon, 15 Jan 2024 18:15:32 +0000
Date: Tue, 16 Jan 2024 02:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 22/23] include/linux/stddef.h:8:14:
 error: invalid initializer
Message-ID: <202401160231.mSAgDn9b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   3d69c575710800c9a4a58e94c157697310e32027
commit: 526a17b65d5160a9ef956fb716172bd307109ff8 [22/23] lib/group_cpus: fix initialization section in group_cpus_evenly()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240116/202401160231.mSAgDn9b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401160231.mSAgDn9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401160231.mSAgDn9b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:251,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from lib/group_cpus.c:6:
   lib/group_cpus.c: In function 'group_cpus_evenly':
>> include/linux/stddef.h:8:14: error: invalid initializer
       8 | #define NULL ((void *)0)
         |              ^
   lib/group_cpus.c:352:59: note: in expansion of macro 'NULL'
     352 |         cpumask_var_t npresmsk __free(free_cpumask_var) = NULL;
         |                                                           ^~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
