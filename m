Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472917723
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689863899; x=1721399899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lzdrG6IEeTc1yGRvQ7qREuw1H3zf4H/bQAagRyVx3lw=;
  b=SfrF7l+4ewpqgcLxvYe7ijk/mvSVaYfzEbBsf9Zk3UbConTcc6CguUM4
   lBnKSJsrRMVFu1APJhkIM7q2Pcn7abiu6LYHhUoCvYP0KuSM5B5AVoRyc
   9/KvS6BAHNHvQ4qZo9CfSzNid9CCQ9rXa0+XHSAsctF2hSk/t6S9G6fiI
   vM0uSDXnS2CWczvJlJVoBMOHH+8VJ8L7pHR5g9woUpYansuGquZEqzJnv
   io4qvvdNgLRa4x4FAl8Qp47tmGGanbUE0e/A3Hje6G9fazUyYIx46K0tK
   y0jedRnM5Mv1ZM0KnOHulm4K4OUdddWh1bmVJWwllskytvwZEiH//2eLx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364215840"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="364215840"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 07:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="971058199"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="971058199"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2023 07:38:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMUnI-0006A3-2f;
	Thu, 20 Jul 2023 14:38:16 +0000
Date: Thu, 20 Jul 2023 22:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 7/18]
 include/linux/page-flags.h:702:16: error: implicit declaration of function
 'clear_bit_unlock_is_negative_byte'
Message-ID: <202307202256.iACXxQEq-lkp@intel.com>
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
commit: 1ee6682b65828ff5924fb6216d8985e022958205 [7/18] mm: Add folio_clear_has_waiters()
config: m68k-randconfig-r016-20230720 (https://download.01.org/0day-ci/archive/20230720/202307202256.iACXxQEq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307202256.iACXxQEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307202256.iACXxQEq-lkp@intel.com/

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
>> include/linux/page-flags.h:702:16: error: implicit declaration of function 'clear_bit_unlock_is_negative_byte' [-Werror=implicit-function-declaration]
     702 |         return clear_bit_unlock_is_negative_byte(flag, folio_flags(folio, 0));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/m68k/kernel/asm-offsets.s] Error 1 shuffle=1299054972
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=1299054972
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1299054972
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1299054972
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
