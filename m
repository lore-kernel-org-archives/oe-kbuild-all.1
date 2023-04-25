Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6147B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 05:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682399420; x=1713935420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0h3tAaz2zAMBc6n3sW4xR2AgtwJsJs543IFoWcexzgw=;
  b=jRo2tozIRN1O3zTxW4W/vEA5JxjWCGjF+hh03+szKMYQcjeEjG1NQfzu
   MzLC5H0gCJPLOhxromn8EyBP5ba47CtgNok3dbGgOH89GCNlioVzeEkln
   rPkcEmP4YapgPBouHDwKMV7UVu5HbeSuOB7aJaGA/+JjMkL3EhzAC0wZ6
   xT2amLCDLXBMcXx6199R9CbuLTW+N7aAG8wSbHnHeZCuve8D5MaaRUziH
   G2AY6Kja5rFvrxDWb5RV+xzjZdfckRTv1APkFidLt7+lYvEWSDucU4QOa
   /thqMh4vGB6zOA6vrKpRLGLv3LFVO0edRhcPXPQg2kLREtHd+GOTrDQ8S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="344136826"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="344136826"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 22:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="782688877"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="782688877"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2023 22:10:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prAwT-000j12-1W;
	Tue, 25 Apr 2023 05:10:17 +0000
Date: Tue, 25 Apr 2023 13:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Beichler <benjamin.beichler@uni-rostock.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3] average: change non-init state and add check for
 added values
Message-ID: <202304251243.k6TscyK6-lkp@intel.com>
References: <20230424210430.390592-1-benjamin.beichler@uni-rostock.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424210430.390592-1-benjamin.beichler@uni-rostock.de>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.3 next-20230424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Beichler/average-change-non-init-state-and-add-check-for-added-values/20230425-050642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230424210430.390592-1-benjamin.beichler%40uni-rostock.de
patch subject: [RFC PATCH v3] average: change non-init state and add check for added values
config: x86_64-randconfig-a011-20230424 (https://download.01.org/0day-ci/archive/20230425/202304251243.k6TscyK6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5dcb0037ea1da8b44284784d7c5d62aab16abad4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Beichler/average-change-non-init-state-and-add-check-for-added-values/20230425-050642
        git checkout 5dcb0037ea1da8b44284784d7c5d62aab16abad4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251243.k6TscyK6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_self_refresh_helper.c:8:
>> include/linux/average.h:50:59: error: expected ';', ',' or ')' before 'unsigned'
      50 |                                                           unsigned long val)    \
         |                                                           ^~~~~~~~
   drivers/gpu/drm/drm_self_refresh_helper.c:56:1: note: in expansion of macro 'DECLARE_EWMA'
      56 | DECLARE_EWMA(psr_time, 4, 4)
         | ^~~~~~~~~~~~
--
   In file included from drivers/net/virtio_net.c:19:
>> include/linux/average.h:50:59: error: expected ';', ',' or ')' before 'unsigned'
      50 |                                                           unsigned long val)    \
         |                                                           ^~~~~~~~
   drivers/net/virtio_net.c:54:1: note: in expansion of macro 'DECLARE_EWMA'
      54 | DECLARE_EWMA(pkt_len, 0, 64)
         | ^~~~~~~~~~~~


vim +50 include/linux/average.h

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
    25	 * that this parameter must be a power of two for efficiency. A
    26	 * weight of 1 is not allowed, because of the internal init function,
    27	 * but nevertheless it makes no sense, since it means no averaging at all.
    28	 */
    29	
    30	#define EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp)			\
    31		do {								\
    32			BUILD_BUG_ON(!__builtin_constant_p(_precision));	\
    33			BUILD_BUG_ON(!__builtin_constant_p(_weight_rcp));	\
    34										\
    35			BUILD_BUG_ON((_precision) > 30);			\
    36			BUILD_BUG_ON_NOT_POWER_OF_2(_weight_rcp);		\
    37			BUILD_BUG_ON(_weight_rcp <= 1);				\
    38		} while (0)
    39	
    40	#define DECLARE_EWMA(name, _precision, _weight_rcp)				\
    41		struct ewma_##name {							\
    42			unsigned long internal;						\
    43		};									\
    44		static inline void ewma_##name##_init(struct ewma_##name *e)		\
    45		{									\
    46			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp);		\
    47			e->internal = ULONG_MAX;					\
    48		}									\
    49			static inline void ewma_##name##_init_val(struct ewma_##name *e	\
  > 50								  unsigned long val)	\
    51		{									\
    52			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp);		\
    53			e->internal = val;						\
    54		}									\
    55		static inline unsigned long						\
    56		ewma_##name##_read(struct ewma_##name *e)				\
    57		{									\
    58			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp);		\
    59			return unlikely(e->internal == ULONG_MAX) ?			\
    60					0 : e->internal >> (_precision);		\
    61		}									\
    62		static inline void ewma_##name##_add(struct ewma_##name *e,		\
    63						     unsigned long val)			\
    64		{									\
    65			unsigned long internal = READ_ONCE(e->internal);		\
    66			unsigned long weight_rcp = ilog2(_weight_rcp);			\
    67			unsigned long precision = _precision;				\
    68			unsigned long max_val = ULONG_MAX >> (precision + weight_rcp);	\
    69											\
    70			EWMA_BUILD_TIME_CHECKS(_precision, _weight_rcp);		\
    71			WARN_ONCE(val > max_val, "Value (%lu) is too large for ewma_##name##_add, this will result in unexpected values of the ewma filter. Max valid value is %lu",\
    72				  val, max_val);					\
    73			WRITE_ONCE(e->internal, unlikely(internal != ULONG_MAX) ?	\
    74				(((internal << weight_rcp) - internal) +		\
    75					(val << precision)) >> weight_rcp :		\
    76				(val << precision));					\
    77		}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
