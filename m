Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C445612D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 19:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682107019; x=1713643019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/lYIu1m8i1kxelZx40qdh7jWxOiyYCqEZUfsKaCw7w=;
  b=aGBeuUG5vDFQ7MI2koFrQmllF9vC7lhhnAsp7PBhF7qujsz2NrIzV+OF
   /nU0sNrp3bdph6xmlESV8tXpY05zM5qviT40m6+SjQEV7xGaPpP4uGiuG
   KIxSn5Y5AVGs5Z7/9wEz2OyJt2RRmJbxFpQEDgGJdCi8tFFqROdsi82dS
   HOfWfU3fqJp+joGeAeWEc4grzWk5iUjxEXnFpqO/fGElLN/Z4kZmTVvdW
   lMwV2ONepnpB8nEyruZ4MPKmIqebbjHX1coZBmOh2ace9hQ2ntL4NG3rE
   egqSmoZ0jg/PDrTgGBZKGW6hZ0QuPSH1PZmBEopuNLwCbxQccr3Ack4H3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325669183"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325669183"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 12:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642620437"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="642620437"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 12:54:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppwpp-000glo-0y;
	Fri, 21 Apr 2023 19:54:21 +0000
Date: Sat, 22 Apr 2023 03:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Beichler <benjamin.beichler@uni-rostock.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2] average: rewrite for clearity
Message-ID: <202304220315.LBDGnyr0-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Beichler/average-rewrite-for-clearity/20230421-214746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230421134604.211128-1-benjamin.beichler%40uni-rostock.de
patch subject: [RFC v2] average: rewrite for clearity
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230422/202304220315.LBDGnyr0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f61e21185a0ffa11e3d84ed0b6159882a921347e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Beichler/average-rewrite-for-clearity/20230421-214746
        git checkout f61e21185a0ffa11e3d84ed0b6159882a921347e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/ drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220315.LBDGnyr0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/virtio_net.c:19:
   drivers/net/virtio_net.c: In function 'ewma_pkt_len_init_val':
   include/linux/average.h:45:17: error: expected ';' before 'e'
      45 |                 e->internal = init << _precision;                               \
         |                 ^
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~
   drivers/net/virtio_net.c: In function 'ewma_pkt_len_read':
   include/linux/average.h:55:17: error: expected ';' before 'return'
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
   include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
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
   include/asm-generic/rwonce.h:59:1: error: expected ';' before 'do'
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


vim +/precision +62 include/linux/average.h

ef4d9af62f47e3 Mark Rutland      2017-10-23   8  
eb1e011a14748a Johannes Berg     2017-02-15   9  /*
eb1e011a14748a Johannes Berg     2017-02-15  10   * Exponentially weighted moving average (EWMA)
eb1e011a14748a Johannes Berg     2017-02-15  11   *
eb1e011a14748a Johannes Berg     2017-02-15  12   * This implements a fixed-precision EWMA algorithm, with both the
eb1e011a14748a Johannes Berg     2017-02-15  13   * precision and fall-off coefficient determined at compile-time
eb1e011a14748a Johannes Berg     2017-02-15  14   * and built into the generated helper funtions.
eb1e011a14748a Johannes Berg     2017-02-15  15   *
eb1e011a14748a Johannes Berg     2017-02-15  16   * The first argument to the macro is the name that will be used
eb1e011a14748a Johannes Berg     2017-02-15  17   * for the struct and helper functions.
eb1e011a14748a Johannes Berg     2017-02-15  18   *
eb1e011a14748a Johannes Berg     2017-02-15  19   * The second argument, the precision, expresses how many bits are
eb1e011a14748a Johannes Berg     2017-02-15  20   * used for the fractional part of the fixed-precision values.
eb1e011a14748a Johannes Berg     2017-02-15  21   *
eb1e011a14748a Johannes Berg     2017-02-15  22   * The third argument, the weight reciprocal, determines how the
eb1e011a14748a Johannes Berg     2017-02-15  23   * new values will be weighed vs. the old state, new values will
eb1e011a14748a Johannes Berg     2017-02-15  24   * get weight 1/weight_rcp and old values 1-1/weight_rcp. Note
eb1e011a14748a Johannes Berg     2017-02-15  25   * that this parameter must be a power of two for efficiency.
eb1e011a14748a Johannes Berg     2017-02-15  26   */
c5485a7e7569ab Bruno Randolf     2010-11-16  27  
f61e21185a0ffa Benjamin Beichler 2023-04-21  28  #define EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
f61e21185a0ffa Benjamin Beichler 2023-04-21  29  	do {								\
f61e21185a0ffa Benjamin Beichler 2023-04-21  30  		BUILD_BUG_ON(!__builtin_constant_p(_precision));	\
f61e21185a0ffa Benjamin Beichler 2023-04-21  31  		BUILD_BUG_ON(!__builtin_constant_p(_weight_rcp));	\
f61e21185a0ffa Benjamin Beichler 2023-04-21  32  									\
f61e21185a0ffa Benjamin Beichler 2023-04-21  33  		BUILD_BUG_ON((_precision) > 30);			\
f61e21185a0ffa Benjamin Beichler 2023-04-21  34  		BUILD_BUG_ON_NOT_POWER_OF_2(_weight_rcp);		\
f61e21185a0ffa Benjamin Beichler 2023-04-21  35  	} while (0)
f61e21185a0ffa Benjamin Beichler 2023-04-21  36  
eb1e011a14748a Johannes Berg     2017-02-15  37  #define DECLARE_EWMA(name, _precision, _weight_rcp)				\
2377799c084d86 Johannes Berg     2015-07-13  38  	struct ewma_##name {							\
2377799c084d86 Johannes Berg     2015-07-13  39  		unsigned long internal;						\
2377799c084d86 Johannes Berg     2015-07-13  40  	};									\
f61e21185a0ffa Benjamin Beichler 2023-04-21  41  	static inline void ewma_##name##_init_val(struct ewma_##name *e,	\
f61e21185a0ffa Benjamin Beichler 2023-04-21  42  						  unsigned long init)		\
f61e21185a0ffa Benjamin Beichler 2023-04-21  43  	{									\
f61e21185a0ffa Benjamin Beichler 2023-04-21  44  		EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
f61e21185a0ffa Benjamin Beichler 2023-04-21  45  		e->internal = init << _precision;				\
f61e21185a0ffa Benjamin Beichler 2023-04-21  46  	}									\
2377799c084d86 Johannes Berg     2015-07-13  47  	static inline void ewma_##name##_init(struct ewma_##name *e)		\
2377799c084d86 Johannes Berg     2015-07-13  48  	{									\
f61e21185a0ffa Benjamin Beichler 2023-04-21  49  			ewma_##name##_init_val(e, 0);				\
2377799c084d86 Johannes Berg     2015-07-13  50  	}									\
2377799c084d86 Johannes Berg     2015-07-13  51  	static inline unsigned long						\
2377799c084d86 Johannes Berg     2015-07-13  52  	ewma_##name##_read(struct ewma_##name *e)				\
2377799c084d86 Johannes Berg     2015-07-13  53  	{									\
f61e21185a0ffa Benjamin Beichler 2023-04-21  54  		EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
eb1e011a14748a Johannes Berg     2017-02-15  55  		return e->internal >> (_precision);				\
2377799c084d86 Johannes Berg     2015-07-13  56  	}									\
2377799c084d86 Johannes Berg     2015-07-13  57  	static inline void ewma_##name##_add(struct ewma_##name *e,		\
2377799c084d86 Johannes Berg     2015-07-13  58  					     unsigned long val)			\
2377799c084d86 Johannes Berg     2015-07-13  59  	{									\
ef4d9af62f47e3 Mark Rutland      2017-10-23 @60  		unsigned long internal = READ_ONCE(e->internal);		\
eb1e011a14748a Johannes Berg     2017-02-15 @61  		unsigned long weight_rcp = ilog2(_weight_rcp);			\
eb1e011a14748a Johannes Berg     2017-02-15 @62  		unsigned long precision = _precision;				\
2377799c084d86 Johannes Berg     2015-07-13  63  										\
f61e21185a0ffa Benjamin Beichler 2023-04-21  64  		EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
f61e21185a0ffa Benjamin Beichler 2023-04-21  65  										\
f61e21185a0ffa Benjamin Beichler 2023-04-21 @66  		WRITE_ONCE(e->internal,						\
f61e21185a0ffa Benjamin Beichler 2023-04-21  67  			(((internal << weight_rcp) - internal) +		\
f61e21185a0ffa Benjamin Beichler 2023-04-21  68  				(val << precision)) >> weight_rcp);		\
f61e21185a0ffa Benjamin Beichler 2023-04-21  69  	}									\
f61e21185a0ffa Benjamin Beichler 2023-04-21  70  	static inline void ewma_##name##_add_or_init(struct ewma_##name *e,	\
f61e21185a0ffa Benjamin Beichler 2023-04-21  71  					     unsigned long val)			\
f61e21185a0ffa Benjamin Beichler 2023-04-21  72  	{									\
f61e21185a0ffa Benjamin Beichler 2023-04-21  73  		unsigned long internal = READ_ONCE(e->internal);		\
f61e21185a0ffa Benjamin Beichler 2023-04-21  74  		unsigned long weight_rcp = ilog2(_weight_rcp);			\
f61e21185a0ffa Benjamin Beichler 2023-04-21  75  		unsigned long precision = _precision;				\
f61e21185a0ffa Benjamin Beichler 2023-04-21  76  										\
f61e21185a0ffa Benjamin Beichler 2023-04-21  77  		EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
2377799c084d86 Johannes Berg     2015-07-13  78  										\
ef4d9af62f47e3 Mark Rutland      2017-10-23  79  		WRITE_ONCE(e->internal, internal ?				\
eb1e011a14748a Johannes Berg     2017-02-15  80  			(((internal << weight_rcp) - internal) +		\
eb1e011a14748a Johannes Berg     2017-02-15  81  				(val << precision)) >> weight_rcp :		\
ef4d9af62f47e3 Mark Rutland      2017-10-23  82  			(val << precision));					\
2377799c084d86 Johannes Berg     2015-07-13  83  	}
2377799c084d86 Johannes Berg     2015-07-13  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
