Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A31BB20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689800437; x=1721336437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LjdBKEHBHnI4f7ZpMy68nKFRNUZYORYXWYhnPSKT0Us=;
  b=ZbjRBfVSk4C5hO6kNzok9XYhbKLg3DrQuCstI4il2VwsYGc1YsJ5aXur
   bIh5U6TN4Gyq+rj2TbXIbQ5kCwc3Wp4PPD9Sk1SeQrP85RlMK3AiRPR7Y
   +2PNRajtdishLzow6D4YLWjP6iKfaI60lXPvnQTzdGIgBA06tUZZoHgAq
   +aS0/fp+nbiRAuBakoTjtI/JOxgi42r7vIu5XL288X+6RHDHXpRAxjX5W
   kPAkAZ7NV9l3QkGJAj+8rkv3binx/7PHgIb8/X4h6A3Dtp+lkRNNmifr7
   BumXgSppL3exm4fLU2RbaQpaua5h2DyzK5czeuuw3AyUJmrnexR+RA/LO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430336113"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="430336113"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 14:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="701390280"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="701390280"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2023 14:00:14 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMEHJ-0005TS-0c;
	Wed, 19 Jul 2023 21:00:09 +0000
Date: Thu, 20 Jul 2023 04:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 11/14]
 include/linux/page-flags.h:715:16: error: implicit declaration of function
 'set_and_unlock_is_negative_byte'
Message-ID: <202307200403.Aee4A6Jm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   006eb1a68e63a55bcc2cba90f713909316f4eaf1
commit: 77f8229485ad53db4f98977e8a53addaeae25753 [11/14] mm: Add folio_mark_uptodate_unlock()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200403.Aee4A6Jm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200403.Aee4A6Jm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200403.Aee4A6Jm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/page-flags.h: In function 'folio_clear_has_waiters':
   include/linux/page-flags.h:702:16: error: implicit declaration of function 'clear_bit_unlock_is_negative_byte' [-Werror=implicit-function-declaration]
     702 |         return clear_bit_unlock_is_negative_byte(flag, folio_flags(folio, 0));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h: In function 'folio_set_unlock':
>> include/linux/page-flags.h:715:16: error: implicit declaration of function 'set_and_unlock_is_negative_byte' [-Werror=implicit-function-declaration]
     715 |         return set_and_unlock_is_negative_byte(flag, PG_locked,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/alpha/kernel/asm-offsets.c: At top level:
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/set_and_unlock_is_negative_byte +715 include/linux/page-flags.h

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
 > 715		return set_and_unlock_is_negative_byte(flag, PG_locked,
   716				folio_flags(folio, 0));
   717	}
   718	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
