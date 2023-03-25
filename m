Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300E11840
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679733477; x=1711269477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/vEruDkudEVBFOAQGWYHztaqUg5m75SWSqz1gK8JLN0=;
  b=b/uKomR+zFUWk5WX4mlLE1M2UcJRVjuM1OqalU3PGaSGEUs3tl1LMvD+
   tndVFPRR+VUhOyRwPANsfJtmic1d8O1/GSYy4sR6Z1tjh1iEhyKzidSuj
   9JTlI/RwhOW4IC335z2ys+B6SIGvZnzEoSAblPd//IlXAcnZIheFI8A+z
   ZlS0bKkNdXD5t7/spaXxnsx5VCYR5LTjj7oLJ9264Qbn4NuXbj6i6dYgh
   7gaivIJChwjcMQdHVvFMyBfSml9FkSxcnrq+8+zNgHp6YbSdmkH6tCfSs
   Pkn2a1nyM0GH+b7p9qwBSCqG7wJ3zIsyNXt8bBrQiQX7x9LxnsvK7byc5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="402550865"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="402550865"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 01:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="806940287"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="806940287"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Mar 2023 01:37:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfzPO-000G71-1g;
	Sat, 25 Mar 2023 08:37:54 +0000
Date: Sat, 25 Mar 2023 16:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fsfa3 17/17] include/asm-generic/rwonce.h:44:26:
 error: array subscript 0 is outside array bounds of 'const volatile int[0]'
Message-ID: <202303251631.oyjkxqNQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fsfa3
head:   2226ddb6a576f7f89a8a06a3f89b68f5109ded53
commit: 2226ddb6a576f7f89a8a06a3f89b68f5109ded53 [17/17] Makefile: Enable -Wstringop-overflow and -Warray-bounds
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230325/202303251631.oyjkxqNQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=2226ddb6a576f7f89a8a06a3f89b68f5109ded53
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars testing/fsfa3
        git checkout 2226ddb6a576f7f89a8a06a3f89b68f5109ded53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251631.oyjkxqNQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/rwonce.h:29,
                    from include/linux/compiler.h:247,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from drivers/net/wwan/t7xx/t7xx_state_monitor.c:17:
   In function 'preempt_count',
       inlined from 't7xx_fsm_append_event' at drivers/net/wwan/t7xx/t7xx_state_monitor.c:439:43:
>> include/asm-generic/rwonce.h:44:26: error: array subscript 0 is outside array bounds of 'const volatile int[0]' [-Werror=array-bounds]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/preempt.h:17:16: note: in expansion of macro 'READ_ONCE'
      17 |         return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
         |                ^~~~~~~~~
   In function 'preempt_count',
       inlined from 't7xx_fsm_append_event' at drivers/net/wwan/t7xx/t7xx_state_monitor.c:439:43:
>> include/asm-generic/rwonce.h:44:26: error: array subscript 0 is outside array bounds of 'const volatile int[0]' [-Werror=array-bounds]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/preempt.h:17:16: note: in expansion of macro 'READ_ONCE'
      17 |         return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
         |                ^~~~~~~~~
   In function 'preempt_count',
       inlined from 't7xx_fsm_append_event' at drivers/net/wwan/t7xx/t7xx_state_monitor.c:439:43:
>> include/asm-generic/rwonce.h:44:26: error: array subscript 0 is outside array bounds of 'const volatile int[0]' [-Werror=array-bounds]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/preempt.h:17:16: note: in expansion of macro 'READ_ONCE'
      17 |         return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
         |                ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +44 include/asm-generic/rwonce.h

e506ea451254ab1 Will Deacon 2019-10-15  28  
e506ea451254ab1 Will Deacon 2019-10-15  29  /*
e506ea451254ab1 Will Deacon 2019-10-15  30   * Yes, this permits 64-bit accesses on 32-bit architectures. These will
e506ea451254ab1 Will Deacon 2019-10-15  31   * actually be atomic in some cases (namely Armv7 + LPAE), but for others we
e506ea451254ab1 Will Deacon 2019-10-15  32   * rely on the access being split into 2x32-bit accesses for a 32-bit quantity
e506ea451254ab1 Will Deacon 2019-10-15  33   * (e.g. a virtual address) and a strong prevailing wind.
e506ea451254ab1 Will Deacon 2019-10-15  34   */
e506ea451254ab1 Will Deacon 2019-10-15  35  #define compiletime_assert_rwonce_type(t)					\
e506ea451254ab1 Will Deacon 2019-10-15  36  	compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),	\
e506ea451254ab1 Will Deacon 2019-10-15  37  		"Unsupported access size for {READ,WRITE}_ONCE().")
e506ea451254ab1 Will Deacon 2019-10-15  38  
e506ea451254ab1 Will Deacon 2019-10-15  39  /*
e506ea451254ab1 Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
3c9184109e78ea2 Will Deacon 2019-10-30  41   * atomicity. Note that this may result in tears!
e506ea451254ab1 Will Deacon 2019-10-15  42   */
b78b331a3f5c077 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
e506ea451254ab1 Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
b78b331a3f5c077 Will Deacon 2019-10-15  45  #endif
e506ea451254ab1 Will Deacon 2019-10-15  46  

:::::: The code at line 44 was first introduced by commit
:::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,WRITE}_ONCE definitions out into rwonce.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
