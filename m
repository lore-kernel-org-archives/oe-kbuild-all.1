Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2022114A4E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711723618; cv=none; b=rvoyEVrs6FaaN7RZvuMTlIp45UuvbYKmnVbT+mZHcrY42K15cTul6ju0tFAhYvy9O4eenmp4ivUmKGZlOFZKW4g+pFmh6wzFEPrZvBo4VSYX0Khav/So+HkLGonGwHlGgY3FKE/wG5VsgHdtUtcP8FIQ+Sdhe4/jfaljR5FF+FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711723618; c=relaxed/simple;
	bh=3LT5LiJFvFPyGpjhKQdrgDnwZNJL146ejMFvnLp/2CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEH8g7LKsXyoKTLZJr9PrUW+sxjuf4YiR1mCuy2LL+BlRPxD+bO+hs+W5Wn1k/qODxUt9H10GZtSeO+BOIez+TTiJjINFXuJ/3L/Gv00p+AfQeeLJp1CUZfHVHsvpID9INWuVWu8DME6PFgWzQrMYhcOF5jal7jI1R/tmoiDO9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxPqVgLX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxPqVgLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711723615; x=1743259615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3LT5LiJFvFPyGpjhKQdrgDnwZNJL146ejMFvnLp/2CI=;
  b=WxPqVgLXGhqUEB/xemPpoW9MiRyCirROAwo9H4bWcyinbw13h702PaL1
   7ql+1cbj211QBh1n12j2HsHDsph99bcKaT6nJBsQhrbJUf9+dYdAycMK8
   36OAMi/ZhDD1h+j+oSc6kKWPs3RqxgeF3OlHTLeopaok5Abcqck0DVFJQ
   CbdX/S7Bn+jX4Un4MbnGOPFUMQ68E85H2UllfDEKbwchYVanV7vHG0Io7
   lHSiM1Q3XQ6nbKY/RcJWiktcgIin3k4WF29hf9jVTIlJxY46lPFIagnPX
   Ttgv0RpShQ2/hrLAvRrCaL9cdrjoDeZWUtMWCS6S0DMptT5bgmMUbWN8W
   Q==;
X-CSE-ConnectionGUID: UJmBurNdT8yLS+S6wgxcTw==
X-CSE-MsgGUID: q/wh2iBWSdmxEee3QpNlqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="32315445"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="32315445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 07:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="21729832"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Mar 2024 07:46:53 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqDVK-0003HS-2Z;
	Fri, 29 Mar 2024 14:46:50 +0000
Date: Fri, 29 Mar 2024 22:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 04/13] pinctrl: renesas: pinctrl-rzg2l: Allow more
 bits for pin configuration
Message-ID: <202403292238.PUySRZTg-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next robh/for-next linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-pinctrl-renesas-rzg2l-pinctrl-Remove-the-check-from-the-object/20240327-063509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/20240326222844.1422948-5-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [RFC PATCH 04/13] pinctrl: renesas: pinctrl-rzg2l: Allow more bits for pin configuration
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403292238.PUySRZTg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403292238.PUySRZTg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403292238.PUySRZTg-lkp@intel.com/

All errors (new ones prefixed by >>):

     115 |                                                  FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
         |                                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1509:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1509 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1509:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1509 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
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
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1509:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1509 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
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
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1509:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1509 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
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
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1509:19: note: in expansion of macro 'RZG2L_PIN_CFG_TO_PORT_OFFSET'
    1509 |         u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitfield.h:10:
   drivers/pinctrl/renesas/pinctrl-rzg2l.c: At top level:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/bitfield.h:136:17: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     136 |                 BUILD_BUG_ON_ZERO((_mask) == 0) +                       \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/bitfield.h:138:17: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     138 |                 BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/bitfield.h:119:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     119 | #define __BF_CHECK_POW2(n)      BUILD_BUG_ON_ZERO(((n) & ((n) - 1)) != 0)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:140:17: note: in expansion of macro '__BF_CHECK_POW2'
     140 |                 __BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +  \
         |                 ^~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:67: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:67: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:142:64: note: in definition of macro 'FIELD_PREP_CONST'
     142 |                 (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
         |                                                                ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:67: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
--
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/bitfield.h:119:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     119 | #define __BF_CHECK_POW2(n)      BUILD_BUG_ON_ZERO(((n) & ((n) - 1)) != 0)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:140:17: note: in expansion of macro '__BF_CHECK_POW2'
     140 |                 __BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +  \
         |                 ^~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:91:50: note: in expansion of macro 'FIELD_PREP_CONST'
      91 |                                                  FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:91:50: note: in expansion of macro 'FIELD_PREP_CONST'
      91 |                                                  FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:41: note: in expansion of macro 'GENMASK'
      83 | #define PIN_CFG_MASK                    GENMASK(46, 0)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:91:67: note: in expansion of macro 'PIN_CFG_MASK'
      91 |                                                  FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
         |                                                                   ^~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:142:64: note: in definition of macro 'FIELD_PREP_CONST'
     142 |                 (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
         |                                                                ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:83:41: note: in expansion of macro 'GENMASK'
      83 | #define PIN_CFG_MASK                    GENMASK(46, 0)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:91:67: note: in expansion of macro 'PIN_CFG_MASK'
      91 |                                                  FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
         |                                                                   ^~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:49: error: initializer element is not constant
      89 | #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
         |                                                 ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:89:49: note: (near initialization for 'r9a07g044_gpio_configs[0]')
      89 | #define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)    (FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
         |                                                 ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1594:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1594 |         RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/bitfield.h:136:17: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     136 |                 BUILD_BUG_ON_ZERO((_mask) == 0) +                       \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1595:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1595 |         RZG2L_GPIO_PORT_PACK(2, 0x11, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: negative width in bit-field '<anonymous>'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/bitfield.h:138:17: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     138 |                 BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1595:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1595 |         RZG2L_GPIO_PORT_PACK(2, 0x11, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/bitfield.h:119:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     119 | #define __BF_CHECK_POW2(n)      BUILD_BUG_ON_ZERO(((n) & ((n) - 1)) != 0)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:140:17: note: in expansion of macro '__BF_CHECK_POW2'
     140 |                 __BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +  \
         |                 ^~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1595:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1595 |         RZG2L_GPIO_PORT_PACK(2, 0x11, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:67: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1595:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1595 |         RZG2L_GPIO_PORT_PACK(2, 0x11, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:50: note: in expansion of macro 'FIELD_PREP_CONST'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:67: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1595:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1595 |         RZG2L_GPIO_PORT_PACK(2, 0x11, RZG2L_MPXED_PIN_FUNCS),
         |         ^~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:8:31: warning: left shift count >= width of type [-Wshift-count-overflow]
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^~
   include/linux/bitfield.h:142:64: note: in definition of macro 'FIELD_PREP_CONST'
     142 |                 (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))  \
         |                                                                ^~~~~
   include/linux/bits.h:35:38: note: in expansion of macro '__GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:82:41: note: in expansion of macro 'GENMASK'
      82 | #define PIN_CFG_PIN_REG_MASK            GENMASK(54, 47)
         |                                         ^~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:90:67: note: in expansion of macro 'PIN_CFG_PIN_REG_MASK'
      90 |                                                  FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
         |                                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:97:41: note: in expansion of macro 'RZG2L_GPIO_PORT_SPARSE_PACK'
      97 | #define RZG2L_GPIO_PORT_PACK(n, a, f)   RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzg2l.c:1595:9: note: in expansion of macro 'RZG2L_GPIO_PORT_PACK'
    1595 |         RZG2L_GPIO_PORT_PACK(2, 0x11, RZG2L_MPXED_PIN_FUNCS),
..


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
