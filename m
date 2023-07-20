Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F84417FEE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689865766; x=1721401766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EnApJvHYNVrDwuiSoELdZTng5aDxASZVouw+d1I+jjA=;
  b=lXHINQnFoDPjdj/hQan4OGN6GZ+iTFEv6/ZBsyJw7yOaNGbqtdipK8JM
   3xWn2VjFTRScvF8kSa3j2ci/LmJSuFZSCa2c9GcmLxk/i0gz4ATXrnN/r
   Uap9GPAL0IHFWl9rJca29PbV+12863l0tYw7yJ2uH+W1ogGJCa3R5Whzc
   26jcc3liuxPXwApfrqlxeaJ2AD6USTYFIjucYLgVCQEIK/8WwRv5hWDI0
   jom8Td2jRaWkV9moP1W0NjfNGnXLnRTLK3AlaRIHjJMa//xB73Apq9DeM
   JyhtHGBRw46FsNRkYuolmEb+aiTsv/YHzygUUCxfx5MzGzwB+ezyZ3mOJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="453143410"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="453143410"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 08:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838162514"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="838162514"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2023 08:09:23 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMVHP-0006B3-0J;
	Thu, 20 Jul 2023 15:09:23 +0000
Date: Thu, 20 Jul 2023 23:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 15/18]
 include/linux/page-flags.h:715:16: error: implicit declaration of function
 'set_and_unlock_is_negative_byte'
Message-ID: <202307202330.DbdLjYRM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   a9edffb2ad9937724acfb480184a46c04a81c23e
commit: f58db80800ede4ae69e671c8a75375ac4548829d [15/18] mm: Add folio_mark_uptodate_unlock()
config: m68k-randconfig-r016-20230720 (https://download.01.org/0day-ci/archive/20230720/202307202330.DbdLjYRM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307202330.DbdLjYRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307202330.DbdLjYRM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:23,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from arch/m68k/kernel/asm-offsets.c:16:
   include/linux/page-flags.h: In function 'folio_clear_has_waiters':
   include/linux/page-flags.h:702:16: error: implicit declaration of function 'clear_bit_unlock_is_negative_byte' [-Werror=implicit-function-declaration]
     702 |         return clear_bit_unlock_is_negative_byte(flag, folio_flags(folio, 0));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h: In function 'folio_set_unlock':
>> include/linux/page-flags.h:715:16: error: implicit declaration of function 'set_and_unlock_is_negative_byte' [-Werror=implicit-function-declaration]
     715 |         return set_and_unlock_is_negative_byte(flag, PG_locked,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/m68k/kernel/asm-offsets.s] Error 1 shuffle=1299054972
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=1299054972
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1299054972
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1299054972
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
