Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA451847
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693379947; x=1724915947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TBeR4t7lTVB9IB+SQ8SrgC5rhrPX2uTGSt2QZmsSZ/o=;
  b=S0CFPBuVcX2Qf9G2jCfQdavmLKx+JO0lE2wHGn9WLVwvhh5HhuYS7e7n
   N4hxafYNHUD/48qFSeqGXIKuWQwnygAFQxPlhjSOlNyboEeRQ96DfLkTG
   IrMgkS1GWKbIckOggYZStLRnVSL/ggOMnlgQ5UZLY2NeNRmOceHpptCHK
   Kt2FhgTZNDu5PbuNtPn5iSCQBDyNwFO7b7JCNGShnVMUyIpRG78y8B+zz
   ty6ZIdiDWSIOhZr4WNta0UrqmMjwqJzgPFb5GHPtMqCkikwxtZbfF7eUH
   YrujiMHUbH1KA4f9O+rEKUWWIOtVUvtaS2agoeuzM5LEXZYg4gMi1Essj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406567957"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="406567957"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 00:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="715795998"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="715795998"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2023 00:19:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbFTj-0009YV-0x;
	Wed, 30 Aug 2023 07:19:03 +0000
Date: Wed, 30 Aug 2023 15:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [linux-next:master 10401/13390]
 include/linux/fortify-string.h:65:29: warning: '__builtin_strcpy' source
 argument is the same as destination
Message-ID: <202308301542.li3KHkJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   56585460cc2ec44fc5d66924f0a116f57080f0dc
commit: 26030cb984dd65e0cb2d0c2489d94941cf8897b4 [10401/13390] extrawarn: move -Wrestrict into W=1 warnings
config: um-randconfig-r034-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301542.li3KHkJl-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301542.li3KHkJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301542.li3KHkJl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/kallsyms.h:10,
                    from kernel/kallsyms.c:15:
   kernel/kallsyms.c: In function '__sprint_symbol.isra.0':
>> include/linux/fortify-string.h:65:29: warning: '__builtin_strcpy' source argument is the same as destination [-Wrestrict]
      65 | #define __underlying_strcpy __builtin_strcpy
         |                             ^
   include/linux/fortify-string.h:794:10: note: in expansion of macro '__underlying_strcpy'
     794 |   return __underlying_strcpy(p, q);
         |          ^~~~~~~~~~~~~~~~~~~


vim +/__builtin_strcpy +65 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  61  
78a498c3a227f2 Alexander Potapenko 2022-10-24  62  #define __underlying_memchr	__builtin_memchr
78a498c3a227f2 Alexander Potapenko 2022-10-24  63  #define __underlying_memcmp	__builtin_memcmp
a28a6e860c6cf2 Francis Laniel      2021-02-25  64  #define __underlying_strcat	__builtin_strcat
a28a6e860c6cf2 Francis Laniel      2021-02-25 @65  #define __underlying_strcpy	__builtin_strcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  66  #define __underlying_strlen	__builtin_strlen
a28a6e860c6cf2 Francis Laniel      2021-02-25  67  #define __underlying_strncat	__builtin_strncat
a28a6e860c6cf2 Francis Laniel      2021-02-25  68  #define __underlying_strncpy	__builtin_strncpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  69  #endif
a28a6e860c6cf2 Francis Laniel      2021-02-25  70  

:::::: The code at line 65 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
