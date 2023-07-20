Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0801E501
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 23:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689896234; x=1721432234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r27SSszt0ViIaq+tx/IuBeEx6QPLiLCnWmSs4ZEpcDg=;
  b=SbRJx2l2/lChSy01re2P5ZbwR+6v8vMEkoGDJWo76+Yr3vrBEFiJlwRU
   rBsTMzfbzf+KvJBRXMtRQGyEzLiuPv+UW1HB21j1GDaloDFLzgQ86dD/z
   bk/WG4T6ijjy8xwMiuK5gEalV8/t9tQNoOJ8Jkq6KPl0/Vbuq8yOTHCtc
   tKhLP5ghWL+EHo1WfLvbx1UHnWLjsQws4g3mGJIyG67tZfuO02NPvwUoY
   creimlNobYR8u3KVu+AI1MqtcuNlr4QnjVTK/MGTckLjgLAA4Ip4J7RWq
   X+vJhXYsOfEPxvUaGDFuv7Hg4eNsGkO04sGAOhEr+6VcezJygbftmLqbx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347192824"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="347192824"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 16:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="898511035"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="898511035"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Jul 2023 16:37:12 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMdCp-0006dB-1p;
	Thu, 20 Jul 2023 23:37:11 +0000
Date: Fri, 21 Jul 2023 07:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 16/19]
 include/linux/page-flags.h:715:16: error: implicit declaration of function
 'change_and_unlock_is_negative_byte'; did you mean
 'clear_bit_unlock_is_negative_byte'?
Message-ID: <202307210736.s0Tct0uf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   98061915c6df5892ff3efa2f04a27857ea36ca51
commit: 483ab04e499ad3c41c25bbc8dec30be0433f4522 [16/19] mm: Add folio_mark_uptodate_unlock()
config: alpha-randconfig-r014-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210736.s0Tct0uf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210736.s0Tct0uf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210736.s0Tct0uf-lkp@intel.com/

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
   make[3]: *** [scripts/Makefile.build:116: arch/alpha/kernel/asm-offsets.s] Error 1 shuffle=1834951555
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=1834951555
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1834951555
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1834951555
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
