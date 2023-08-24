Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA915AC8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 20:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692908854; x=1724444854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8HNB24aNxEV6aHFbLdvObZnueWLnmek16RCPDSvqGxM=;
  b=YFV+/y/v7pkASVSKGTgJqECYSSreiWt9q0qPSWyn6X8faWCMZVxbqjzl
   2MIsT4CgSV75JAjEMWbK6VkuOBF1S2DU3ALI78nwk6nU59CMBq2RgdnRb
   7Ua5LOsdMEFypHk1fj0U6af6ELy+J1UrWa6X3J71+bqj3Q12mQwP/i024
   P77a5zw9QcThx61wqeJRxi0j0wA9hNXGzTCteuPpHEPl3mXbc0nEWfbyr
   11VzkXFf0sJHMufH7fJuxsJBJB6V3c0GD7EJZr4w+12JwTp2PmCsbxzg5
   /tqAt10Xejv/7LxIsJUxIzUMGOA3Adj30XN4KnYU/QW7MIQqsz/GmBmOg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354080187"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354080187"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 13:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860844732"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="860844732"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 13:27:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZGvM-0002x6-2f;
	Thu, 24 Aug 2023 20:27:26 +0000
Date: Fri, 25 Aug 2023 04:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] partitions/ibm: refactor deprecated strncpy
Message-ID: <202308250444.JdyxfAJf-lkp@intel.com>
References: <20230823-strncpy-block-partitions-cmdline-ibm-v2-1-40c77f7182fc@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823-strncpy-block-partitions-cmdline-ibm-v2-1-40c77f7182fc@google.com>

Hi Justin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 706a741595047797872e669b3101429ab8d378ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Stitt/partitions-ibm-refactor-deprecated-strncpy/20230824-052625
base:   706a741595047797872e669b3101429ab8d378ef
patch link:    https://lore.kernel.org/r/20230823-strncpy-block-partitions-cmdline-ibm-v2-1-40c77f7182fc%40google.com
patch subject: [PATCH v2] partitions/ibm: refactor deprecated strncpy
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230825/202308250444.JdyxfAJf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250444.JdyxfAJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250444.JdyxfAJf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   block/partitions/ibm.c: In function 'find_label.isra':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_329' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/string.h:281:9: note: in expansion of macro 'BUILD_BUG_ON'
     281 |         BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||                \
         |         ^~~~~~~~~~~~
   block/partitions/ibm.c:114:33: note: in expansion of macro 'strtomem_pad'
     114 |                                 strtomem_pad(type, label->vol.vollbl, 4);
         |                                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_331' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/string.h:281:9: note: in expansion of macro 'BUILD_BUG_ON'
     281 |         BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||                \
         |         ^~~~~~~~~~~~
   block/partitions/ibm.c:117:33: note: in expansion of macro 'strtomem_pad'
     117 |                                 strtomem_pad(type, label->lnx.vollbl, 4);
         |                                 ^~~~~~~~~~~~
   block/partitions/ibm.c: In function 'ibm_partition':
   block/partitions/ibm.c:335:22: warning: 'strncmp' of strings of length 0 and 4 and bound of 4 evaluates to nonzero [-Wstring-compare]
     335 |                 if (!strncmp(type, "VOL1", 4)) {
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/ibm.c:338:29: warning: 'strncmp' of strings of length 0 and 4 and bound of 4 evaluates to nonzero [-Wstring-compare]
     338 |                 } else if (!strncmp(type, "LNX1", 4)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/ibm.c:342:29: warning: 'strncmp' of strings of length 0 and 4 and bound of 4 evaluates to nonzero [-Wstring-compare]
     342 |                 } else if (!strncmp(type, "CMS1", 4)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
