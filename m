Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426553C060
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 05:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711690902; cv=none; b=A6uh9ZqYiZ6TWcyBKnRSKdbDUHfz1MaQzYiX7f7W8rZK2fI6BwHtPQOjY0atBseMZLZ8r6vjlipi1RIH4RMcxP/4FPcg3alci44hP3Phs50NopP/0PIaEKA2lwVZqi1WCY/4ucubUV1dGElOzfOuOxrtLh+WTQSmJtDsf2Y/i78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711690902; c=relaxed/simple;
	bh=2p6WHy1KghV9AWWW+dRBwYD4E3PGhR5I/DFpothseRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBN0padUNX6QhthbUZTXjMwQS0ykTo5DlHhdZRAMfBQd4W1cNH1m20y0xbSeCM6LZKHsL760seAs/Mc0iF+29gpKe61rnQ4n84IsSpQQsKMlWd2/9oUCUTdVvKbcFCZZ9+ItPbBcgy/fvfOw+SOPUpF73oSSXRv3qYQRiyzLYpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+B1Pwfd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+B1Pwfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711690899; x=1743226899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2p6WHy1KghV9AWWW+dRBwYD4E3PGhR5I/DFpothseRY=;
  b=e+B1Pwfdg9TwgKvNyidgDacqch2bmGM+VK3ToYQ2/C8zaU9uoW1hSJVl
   YXDQ5ZU4DPSnIAiQ6/+nAxzdhPDsrxh+HNwupS6zGMUWLQk4VTVFGnXv/
   gXF2F010dcaRwJSsFn+mJjfMYvzaih688d4I+C8yYWbP7vkzLQOfnUqEy
   1s44+gcmS3pR8RC/D2wAKmsXSpDxfbC7A872TEjOX/Y3ovJlUNjzGboy+
   sAb2rePTyc9HK+YWyihCyMrZQNw2h72aZ370QfafPqS6zuW8VYPhRC8i4
   VkgHAykGwMI02YPEk95aw2mVYpUHHOytGh4gVvfQxNfTRGwIfSUlSbF7d
   Q==;
X-CSE-ConnectionGUID: Pn2X38rWTPeCsQGMHtbulQ==
X-CSE-MsgGUID: opgV6VC7TG+l3BL4YTgyZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18255654"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="18255654"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 22:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="16912701"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2024 22:41:35 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq4zd-0002sy-1g;
	Fri, 29 Mar 2024 05:41:33 +0000
Date: Fri, 29 Mar 2024 13:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 04/13] pinctrl: renesas: pinctrl-rzg2l: Allow more
 bits for pin configuration
Message-ID: <202403291329.MFqzXI9m-lkp@intel.com>
References: <20240326222844.1422948-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326222844.1422948-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-drivers/renesas-pinctrl]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next robh/for-next linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-pinctrl-renesas-rzg2l-pinctrl-Remove-the-check-from-the-object/20240327-063509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/20240326222844.1422948-5-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [RFC PATCH 04/13] pinctrl: renesas: pinctrl-rzg2l: Allow more bits for pin configuration
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403291329.MFqzXI9m-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291329.MFqzXI9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291329.MFqzXI9m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: In function 'rzg2l_pinctrl_set_mux':
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) &        \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) &        \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:34: note: in expansion of macro '__bf_cast_unsigned'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:34: note: in expansion of macro '__bf_cast_unsigned'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/renesas/pinctrl-rzg2l.c:8:
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:156:44: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:156:44: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:50: note: in expansion of macro 'FIELD_GET'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:105:41: note: in expansion of macro 'GENMASK'
     105 | #define RZG2L_SINGLE_PIN_INDEX_MASK     GENMASK(62, 56)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:114:60: note: in expansion of macro 'RZG2L_SINGLE_PIN_INDEX_MASK'
     114 |                                                  FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) &        \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) &        \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:34: note: in expansion of macro '__bf_cast_unsigned'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:34: note: in expansion of macro '__bf_cast_unsigned'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/compiler_types.h:429:23: note: in definition of macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:50: note: in expansion of macro 'FIELD_GET'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                  ^~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:156:44: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:115:60: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:523:27: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
     523 |                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);


vim +8 include/uapi/linux/bits.h

3c7a8e190bc580 Paolo Bonzini 2023-12-12   6  
3c7a8e190bc580 Paolo Bonzini 2023-12-12   7  #define __GENMASK(h, l) \
3c7a8e190bc580 Paolo Bonzini 2023-12-12  @8          (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
3c7a8e190bc580 Paolo Bonzini 2023-12-12   9           (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
3c7a8e190bc580 Paolo Bonzini 2023-12-12  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
