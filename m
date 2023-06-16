Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA891B914
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 19:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686942293; x=1718478293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8P19tpljWV1BsOEBzLAiEOlUXsxz+dr3KYg1rf1PYy8=;
  b=i+2CS5rlTfHJiB4kBL2JQkY25bUK27+UID1QkiIGrlJ8WjktWO8j9HDz
   +UedtMdqqFLvc5lTexEd12/iBgsMcBydvyukWCaQW1dAycXr8oo/duo2M
   L6p7vzLAZmqGPqy52l2zWWV9WhwY5HqnM6I5f1CzWaysolZ5g+FuY2QeM
   2DbSLwyBBKOEmO1V4Mk55GtmhuIEQNq0IJqrahOu1kgRWWtJln+Amd53T
   SeLyef8XTNWC7xN5r3uNeRXlPZOnU/r/doeJqORGf81AG9tOiau6y/Qy0
   bC+e42PF6Xu8OhrthlV4Kf58YK8TM0e3FeDX5ygzRNKkjcYIzaiJQ2GB5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="425228754"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="425228754"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="825844109"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="825844109"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2023 12:04:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAEkc-0001jM-1I;
	Fri, 16 Jun 2023 19:04:50 +0000
Date: Sat, 17 Jun 2023 03:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 11/20]
 include/linux/build_bug.h:16:51: error: negative width in bit-field
 '<anonymous>'
Message-ID: <202306170243.Mgv5Hgua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   669cf696035fa888754f34d948b9488c2206dd7d
commit: b802dfaa54bfd76a004a5d213a83f3f6caf5d926 [11/20] sysctl: Add size argument to init_header
config: i386-randconfig-i016-20230616 (https://download.01.org/0day-ci/archive/20230617/202306170243.Mgv5Hgua-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170243.Mgv5Hgua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170243.Mgv5Hgua-lkp@intel.com/

Note: the joelgranados/jag/sysctl-testing-for-0day HEAD 669cf696035fa888754f34d948b9488c2206dd7d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/sysctl.h:26,
                    from fs/proc/proc_sysctl.c:6:
   fs/proc/proc_sysctl.c: In function '__register_sysctl_table':
   include/linux/kernel.h:56:38: warning: division 'sizeof (struct ctl_table *) / sizeof (struct ctl_table)' does not compute the number of array elements [-Wsizeof-pointer-div]
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                      ^
   fs/proc/proc_sysctl.c:1378:53: note: in expansion of macro 'ARRAY_SIZE'
    1378 |         init_header(header, root, set, node, table, ARRAY_SIZE(table));
         |                                                     ^~~~~~~~~~
   fs/proc/proc_sysctl.c:1360:45: note: first 'sizeof' operand was declared here
    1360 |         const char *path, struct ctl_table *table)
         |                           ~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/init.h:5,
                    from fs/proc/proc_sysctl.c:5:
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:232:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     232 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1378:53: note: in expansion of macro 'ARRAY_SIZE'
    1378 |         init_header(header, root, set, node, table, ARRAY_SIZE(table));
         |                                                     ^~~~~~~~~~


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

:::::: The code at line 16 was first introduced by commit
:::::: 8788994376d84d627450fd0d67deb6a66ddf07d7 linux/build_bug.h: change type to int

:::::: TO: Rikard Falkeborn <rikard.falkeborn@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
