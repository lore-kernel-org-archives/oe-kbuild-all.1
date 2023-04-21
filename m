Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB2612D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 19:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682107023; x=1713643023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PimsIxKp3BU3ncSxpCFZpZlocKisOevOWmhPstEXVss=;
  b=Qvg703hs6HCl2zRX3sIVu3j0cXFA54L8O+Kb/0xGJhJavwKz7K8+riSb
   xa3wG7L5k0gVw1oq+zTBHsarLuN4szywI1xwCmRSRW+Qwm/wWszldSQu+
   JqCV7JBxYp2nT4R2Q5+cftMm6Db9maNIkO+v2YBkq6lXO/JixwiHPt5vj
   LPauuZm1+vWYTtoEsqz1E6VRiodJ02npPk93gXQwVY/yR6fP0tQvZDx87
   rorTwOK5JMj6J//2wUxi0KBMnBVqAOdaEnkfEnYlNJ+P9r2vYU4Nwt3zd
   kTgRjYXyoGtmsEKlEJH80auVv+zRxHzUBiHxZWHKJ8Pj9uBUBitvK1c3e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325669187"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325669187"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 12:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642620438"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="642620438"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 12:54:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppwpp-000glv-19;
	Fri, 21 Apr 2023 19:54:21 +0000
Date: Sat, 22 Apr 2023 03:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Beichler <benjamin.beichler@uni-rostock.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2] average: rewrite for clearity
Message-ID: <202304220335.I8vXhd1J-lkp@intel.com>
References: <20230421134604.211128-1-benjamin.beichler@uni-rostock.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421134604.211128-1-benjamin.beichler@uni-rostock.de>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Beichler/average-rewrite-for-clearity/20230421-214746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230421134604.211128-1-benjamin.beichler%40uni-rostock.de
patch subject: [RFC v2] average: rewrite for clearity
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230422/202304220335.I8vXhd1J-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f61e21185a0ffa11e3d84ed0b6159882a921347e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Beichler/average-rewrite-for-clearity/20230421-214746
        git checkout f61e21185a0ffa11e3d84ed0b6159882a921347e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/core/ drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220335.I8vXhd1J-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/virtio_net.c:19:
   drivers/net/virtio_net.c: In function 'ewma_pkt_len_init_val':
>> include/linux/average.h:45:17: error: expected ';' before 'e'
      45 |                 e->internal = init << _precision;                               \
         |                 ^
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   drivers/net/virtio_net.c: In function 'ewma_pkt_len_read':
>> include/linux/average.h:55:17: error: expected ';' before 'return'
      55 |                 return e->internal >> (_precision);                             \
         |                 ^~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:24,
                    from drivers/net/virtio_net.c:7:
   drivers/net/virtio_net.c: In function 'ewma_pkt_len_add':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:66:17: note: in expansion of macro 'WRITE_ONCE'
      66 |                 WRITE_ONCE(e->internal,                                         \
         |                 ^~~~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   In file included from drivers/net/virtio_net.c:19:
>> include/linux/average.h:62:31: warning: unused variable 'precision' [-Wunused-variable]
      62 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
>> include/linux/average.h:61:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      61 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
>> include/linux/average.h:60:31: warning: unused variable 'internal' [-Wunused-variable]
      60 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:24,
                    from drivers/net/virtio_net.c:7:
   drivers/net/virtio_net.c: In function 'ewma_pkt_len_add_or_init':
>> include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
      59 | do {                                                                    \
         | ^~
   include/linux/average.h:79:17: note: in expansion of macro 'WRITE_ONCE'
      79 |                 WRITE_ONCE(e->internal, internal ?                              \
         |                 ^~~~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   In file included from drivers/net/virtio_net.c:19:
   include/linux/average.h:75:31: warning: unused variable 'precision' [-Wunused-variable]
      75 |                 unsigned long precision = _precision;                           \
         |                               ^~~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   include/linux/average.h:74:31: warning: unused variable 'weight_rcp' [-Wunused-variable]
      74 |                 unsigned long weight_rcp = ilog2(_weight_rcp);                  \
         |                               ^~~~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   include/linux/average.h:73:31: warning: unused variable 'internal' [-Wunused-variable]
      73 |                 unsigned long internal = READ_ONCE(e->internal);                \
         |                               ^~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   drivers/net/virtio_net.c: In function 'ewma_pkt_len_read':
   include/linux/average.h:56:9: error: control reaches end of non-void function [-Werror=return-type]
      56 |         }                                                                       \
         |         ^
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +45 include/linux/average.h

     8	
     9	/*
    10	 * Exponentially weighted moving average (EWMA)
    11	 *
    12	 * This implements a fixed-precision EWMA algorithm, with both the
    13	 * precision and fall-off coefficient determined at compile-time
    14	 * and built into the generated helper funtions.
    15	 *
    16	 * The first argument to the macro is the name that will be used
    17	 * for the struct and helper functions.
    18	 *
    19	 * The second argument, the precision, expresses how many bits are
    20	 * used for the fractional part of the fixed-precision values.
    21	 *
    22	 * The third argument, the weight reciprocal, determines how the
    23	 * new values will be weighed vs. the old state, new values will
    24	 * get weight 1/weight_rcp and old values 1-1/weight_rcp. Note
    25	 * that this parameter must be a power of two for efficiency.
    26	 */
    27	
    28	#define EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
    29		do {								\
    30			BUILD_BUG_ON(!__builtin_constant_p(_precision));	\
    31			BUILD_BUG_ON(!__builtin_constant_p(_weight_rcp));	\
    32										\
    33			BUILD_BUG_ON((_precision) > 30);			\
    34			BUILD_BUG_ON_NOT_POWER_OF_2(_weight_rcp);		\
    35		} while (0)
    36	
    37	#define DECLARE_EWMA(name, _precision, _weight_rcp)				\
    38		struct ewma_##name {							\
    39			unsigned long internal;						\
    40		};									\
    41		static inline void ewma_##name##_init_val(struct ewma_##name *e,	\
    42							  unsigned long init)		\
    43		{									\
    44			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
  > 45			e->internal = init << _precision;				\
    46		}									\
    47		static inline void ewma_##name##_init(struct ewma_##name *e)		\
    48		{									\
    49				ewma_##name##_init_val(e, 0);				\
    50		}									\
    51		static inline unsigned long						\
    52		ewma_##name##_read(struct ewma_##name *e)				\
    53		{									\
    54			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
  > 55			return e->internal >> (_precision);				\
    56		}									\
    57		static inline void ewma_##name##_add(struct ewma_##name *e,		\
    58						     unsigned long val)			\
    59		{									\
  > 60			unsigned long internal = READ_ONCE(e->internal);		\
  > 61			unsigned long weight_rcp = ilog2(_weight_rcp);			\
  > 62			unsigned long precision = _precision;				\
    63											\
    64			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
    65											\
  > 66			WRITE_ONCE(e->internal,						\
    67				(((internal << weight_rcp) - internal) +		\
    68					(val << precision)) >> weight_rcp);		\
    69		}									\
    70		static inline void ewma_##name##_add_or_init(struct ewma_##name *e,	\
    71						     unsigned long val)			\
    72		{									\
    73			unsigned long internal = READ_ONCE(e->internal);		\
    74			unsigned long weight_rcp = ilog2(_weight_rcp);			\
    75			unsigned long precision = _precision;				\
    76											\
    77			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
    78											\
    79			WRITE_ONCE(e->internal, internal ?				\
    80				(((internal << weight_rcp) - internal) +		\
    81					(val << precision)) >> weight_rcp :		\
    82				(val << precision));					\
    83		}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
