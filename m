Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB691DDD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 22:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689891247; x=1721427247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UctAw5I69+oQ888+Xng/If8mi5lNKHwejzRavZd7ReQ=;
  b=H4fP/cOSpJWwRcJ5Uwtuu9VCGQ7gmOqNpnIZupDuTmD8pyBkXTTrW5QN
   beR61tM9K2Ji1DCtJOchC1cBJQCZNXz7/7E4HKJtzyEj2Dvuj44GctozX
   4zBmSMUkyby708njjXsNQhbUf0FIUQA21HzJ8ULZWnUkmp0BSKf8EguGL
   kwpUmhw9gTwfk6YeGGvxc24Df0cs8/tdCeLgzyXbvOi5pvY7EZ2WEaGmG
   Xaom+tBg6YR+pSBtBHR3dfY6Tzd5NuHkGUj8w0gb2MJ59/xceCYPHPpNi
   QOGLT+jfBQwM2x4sjblcDHL/Th3hVCTxkTnQ179y9kXbiViypVoQA9427
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="453254388"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="453254388"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 15:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754201976"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="754201976"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Jul 2023 15:14:05 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMbuO-0006ZL-0u;
	Thu, 20 Jul 2023 22:14:04 +0000
Date: Fri, 21 Jul 2023 06:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 16/19]
 include/linux/page-flags.h:715:16: error: implicit declaration of function
 'change_and_unlock_is_negative_byte'; did you mean
 'clear_bit_unlock_is_negative_byte'?
Message-ID: <202307210644.stGdOYq9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   d6ef97f72f7a2d79a24800e83fde132fd704ed05
commit: 93cbe503f078744fb5bfa0a119bb25a58efdf4f9 [16/19] mm: Add folio_mark_uptodate_unlock()
config: alpha-randconfig-r023-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210644.stGdOYq9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210644.stGdOYq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210644.stGdOYq9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/page-flags.h: In function 'folio_set_unlock':
>> include/linux/page-flags.h:715:16: error: implicit declaration of function 'change_and_unlock_is_negative_byte'; did you mean 'clear_bit_unlock_is_negative_byte'? [-Werror=implicit-function-declaration]
     715 |         return change_and_unlock_is_negative_byte(flag, PG_locked,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                clear_bit_unlock_is_negative_byte
   arch/alpha/kernel/asm-offsets.c: At top level:
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/alpha/kernel/asm-offsets.s] Error 1 shuffle=1202875689
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=1202875689
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1202875689
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1202875689
   make: Target 'prepare' not remade because of errors.


vim +715 include/linux/page-flags.h

   704	
   705	/**
   706	 * folio_set_unlock - Set a flag and unlock a folio
   707	 * @folio: The folio.
   708	 * @flag: The flag to clear
   709	 *
   710	 * Return: Whether there are tasks waiting on the folio.
   711	 */
   712	static inline
   713	bool folio_set_unlock(struct folio *folio, unsigned int flag)
   714	{
 > 715		return change_and_unlock_is_negative_byte(flag, PG_locked,
   716				folio_flags(folio, 0));
   717	}
   718	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
