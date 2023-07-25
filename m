Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B125931
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 19:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690311914; x=1721847914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HtX9owHiP3S1xCOUVQd5D8vbiY9IUi4q9G2cJlKBcnM=;
  b=JyRrByk1do3OeWCZMShHJJTC6HVN4MHQdXdXPvCMBD1tj7FEtRT6fCoS
   TimMoxTnWZEsabzgYAw5ejIvaG+VDxrUutmgRJpMWshBBVbgjP+ZdVU07
   H+SBR2JePSBzKGrd/AMSdvwvadLBqWWUJoNQ6sOeolF6np8FuVVCzINnn
   jPxFVlXq5AwEUabaI5ZlFWBKAZISg9a7zCInYj/zciasZviqepekwatnr
   RNkyWU1Q1MoN/hBcvm/TuNnoNNolFvDM3wOBmTQ+sAcDq4Dyo1KIr1Esh
   hrYH/zpDpf8bdIgDk25diO4LXSMzpdZk59x3RkzegMCpn1XP9NbUrDcF7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398741593"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="398741593"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 12:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816360595"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="816360595"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2023 12:05:12 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qONLL-0000GG-1v;
	Tue, 25 Jul 2023 19:05:11 +0000
Date: Wed, 26 Jul 2023 03:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Subject: include/linux/kcsan-checks.h:220:28: warning: 'args32' may be used
 uninitialized
Message-ID: <202307260230.9fX7alLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josef,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0b5547c51827e053cc754db47d3ec3e6c2c451d2
commit: 1ec49744ba83f0429c5c706708610f7821a7b6f4 btrfs: turn on -Wmaybe-uninitialized
date:   5 months ago
config: s390-randconfig-m041-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260230.9fX7alLc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260230.9fX7alLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260230.9fX7alLc-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/rwonce.h:27,
                    from ./arch/s390/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/kernel.h:20,
                    from fs/btrfs/ioctl.c:6:
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_wait_sync':
   include/linux/kcsan-checks.h:220:28: warning: 'transid' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3134:13: note: 'transid' declared here
    3134 |         u64 transid;
         |             ^~~~~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl_space_info':
   include/linux/kcsan-checks.h:220:28: warning: 'space_args' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:2973:39: note: 'space_args' declared here
    2973 |         struct btrfs_ioctl_space_args space_args;
         |                                       ^~~~~~~~~~
   include/linux/kcsan-checks.h: In function 'btrfs_ioctl':
>> include/linux/kcsan-checks.h:220:28: warning: 'args32' may be used uninitialized [-Wmaybe-uninitialized]
     220 | #define kcsan_check_access __kcsan_check_access
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
      37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
         |      ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4320:49: note: 'args32' declared here
    4320 |                 struct btrfs_ioctl_send_args_32 args32;
         |                                                 ^~~~~~


vim +/args32 +220 include/linux/kcsan-checks.h

dfd402a4c4baae Marco Elver 2019-11-14  214  
19acd03d95dad1 Marco Elver 2020-04-24  215  #ifdef __SANITIZE_THREAD__
dfd402a4c4baae Marco Elver 2019-11-14  216  /*
19acd03d95dad1 Marco Elver 2020-04-24  217   * Only calls into the runtime when the particular compilation unit has KCSAN
19acd03d95dad1 Marco Elver 2020-04-24  218   * instrumentation enabled. May be used in header files.
dfd402a4c4baae Marco Elver 2019-11-14  219   */
dfd402a4c4baae Marco Elver 2019-11-14 @220  #define kcsan_check_access __kcsan_check_access
19acd03d95dad1 Marco Elver 2020-04-24  221  

:::::: The code at line 220 was first introduced by commit
:::::: dfd402a4c4baae42398ce9180ff424d589b8bffc kcsan: Add Kernel Concurrency Sanitizer infrastructure

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
