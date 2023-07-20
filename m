Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B018C00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689866410; x=1721402410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fx5J/mI+2er2wwRGTIjvcRw6eIU6D+hNqocrp6x/1xA=;
  b=NM0RCdtwP2MunuKkfUqojvKaBr6b3Wze4q5dA3b96XZrEtro9Vu88dqF
   aMtjn9kQ2mnAjRufCGJhAL1JSJqKBLftcj1OvL1Hq/fsGwR6TQBz2sfbG
   MF2G8i5nxMxlG1dv0Y9YEqMVsDt0kkFO/r+XdZmgaTcm5K5t9NGYUjsjv
   asFQLnxwd8mVLE7KQRuqGd7Q4ajVLTl6P/TiaV5ZocMdUjMooyDK6tkD5
   d8cwpP9OR12nuuxcb4mI6oTuhoZiOfUtNbDKEOapVUh83SdgIqUksj1ln
   nhIW7JIfE+2SSlbb4AmTQ8QgdEHS4kxANWCiTYN3z0opqB/oXx/ygEf/2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347075391"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="347075391"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 08:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="1055207725"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="1055207725"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2023 08:20:08 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMVRo-0006Bb-0w;
	Thu, 20 Jul 2023 15:20:08 +0000
Date: Thu, 20 Jul 2023 23:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 5/18]
 arch/alpha/include/asm/bitops.h:293:27: error: 'addr' undeclared
Message-ID: <202307202340.AqDsKcz0-lkp@intel.com>
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
commit: 3e5f9e0a3df93d0381aed1eea91ff62f4d2ea4a5 [5/18] alpha: Implement clear_bit_unlock_is_negative_byte
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307202340.AqDsKcz0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307202340.AqDsKcz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307202340.AqDsKcz0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   arch/alpha/include/asm/bitops.h: In function 'clear_bit_unlock_is_negative_byte':
>> arch/alpha/include/asm/bitops.h:293:27: error: 'addr' undeclared (first use in this function)
     293 |         int *m = ((int *) addr) + (nr >> 5);
         |                           ^~~~
   arch/alpha/include/asm/bitops.h:293:27: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/addr +293 arch/alpha/include/asm/bitops.h

   288	
   289	static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
   290			volatile unsigned long *p)
   291	{
   292		unsigned long temp, old;
 > 293		int *m = ((int *) addr) + (nr >> 5);
   294	
   295		__asm__ __volatile__(
   296		"1:	ldl_l %0,%4\n"
   297		"	bic %0,%3,%0\n"
   298		"	sll %0,#0,%2\n"
   299		"	stl_c %0,%1\n"
   300		"	beq %0,2f\n"
   301		".subsection 2\n"
   302		"2:	br 1b\n"
   303		".previous"
   304		:"=&r" (temp), "=m" (*m), "=&r" (old)
   305		:"Ir" (1UL << (nr & 31)), "m" (*m));
   306	
   307		return (old & BIT(7)) != 0;
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
