Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2842B165
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689798530; x=1721334530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WpqeDQ8H/ZIQOa1Wi4Ukjnyta5D8OdAybglCPfPqOg=;
  b=G6VcYJgLIVJVMtuyw39gZoVmjHlXzDNFF6ogeyyd5ln7vYk5cgDxhyes
   c5LmY/QJmt2xNgdAOKWzeXLruRbxKmR8POsb1pXQjBG23GFcSUGfJt9cw
   0DbZY3RQHBtYwrXgscy6Oy8CK0o/22NHieM4t6wMWdSam7vh7SvvbDGYU
   OeyVUZdQ7hY3Rmm8PnfFVD3xpiTXqJrww/dGjy7TDE45BQPj88irOBl3l
   jIxGJZB7qtLLgVRWdP2zx60ZlltMBXIgImQ1fR7JfrhZVYzorzRZCpUEo
   PzXcQSYUBwPK+R3hdrCbNjjUqHV8mXAvuqLWzHPSR98z9UqwCwBIYHT7r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346154623"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="346154623"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 13:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="718124258"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="718124258"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Jul 2023 13:28:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMDmx-0005Rv-1g;
	Wed, 19 Jul 2023 20:28:47 +0000
Date: Thu, 20 Jul 2023 04:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 3/14]
 include/linux/page-flags.h:702:16: error: implicit declaration of function
 'clear_bit_unlock_is_negative_byte'
Message-ID: <202307200433.8JNqo63S-lkp@intel.com>
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
commit: b0a09d554792a2b160c743df5e732e103d5e3f5c [3/14] mm: Add folio_clear_has_waiters()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200433.8JNqo63S-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200433.8JNqo63S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200433.8JNqo63S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/page-flags.h: In function 'folio_clear_has_waiters':
>> include/linux/page-flags.h:702:16: error: implicit declaration of function 'clear_bit_unlock_is_negative_byte' [-Werror=implicit-function-declaration]
     702 |         return clear_bit_unlock_is_negative_byte(flag, folio_flags(folio, 0));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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


vim +/clear_bit_unlock_is_negative_byte +702 include/linux/page-flags.h

   692	
   693	/**
   694	 * folio_clear_has_waiters - Clear a flag that can be waited upon
   695	 * @folio: The folio.
   696	 * @flag: The flag to clear
   697	 *
   698	 */
   699	static inline
   700	bool folio_clear_has_waiters(struct folio *folio, unsigned int flag)
   701	{
 > 702		return clear_bit_unlock_is_negative_byte(flag, folio_flags(folio, 0));
   703	}
   704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
