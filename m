Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F173314D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 07:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147894; cv=none; b=oAy+1OjP4D7g/rmI2dQUv1L9aKVpN8P2Ewh+JefdXHoGVnowEbD+offdZqs1VeMcwQwHLt6Nh5Foi5ekuXZ8tjnVbRHoRWUFyg4j/UbDVYdyFZAiMiRvYNun7FHtWQQpy434zEkHy3DKOXfIHZ4N5I7Gael14Z/wNzDOl5d0Vls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147894; c=relaxed/simple;
	bh=DKuT5FfPXMmbPEcuVYXS9SG7/zyvip1i2aXuZBWzrRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KU5S5jk3E68I/9IoDbO0vcn9fXTwg25iBb0imFfbphoXCCSdPNpHlR7mqPZr9q7RtjVe7yGIdOl/2YtUDPvDdtxZRHLx3+ADxC6AcBHDgnrfQdPMAKrrguLQLzv9AXPmrk2terLpgGfpac9a6zqi2rI3TrMppGUBmI8RMXqgigo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3I1EY+x; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3I1EY+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790147891; x=1821683891;
  h=date:from:to:cc:subject:message-id;
  bh=DKuT5FfPXMmbPEcuVYXS9SG7/zyvip1i2aXuZBWzrRw=;
  b=l3I1EY+x7fxeckpR+iJl73gpPIDUIojRsYc2FKlk65vBaEJRHiOJuE6F
   hf4TLnI5vAfF2yu3I3QCXtEa55d0mfWh33r7fm1sUOIM/O/hT0GQVrF7t
   VphvA8KagJlnuglHxLzeNy8U55WdKr73ldI0qPuGJADiqgN7MCxBetElx
   d5qwwIgwBHjBdLJ4JzmGi2TLCgwmp4yI/O+xvqHZ0Jf46jCvbGEzc570L
   wiMmW46hA6xMMcTXVh1DoTroWJVSdR1JJcz/Iadzwqmmy/X7/rsg06Ke8
   kLS+Eowna4S32VD5StP8nL//aUaAmiBi5CIF2L9o8KIQaytjykLeBcF9+
   Q==;
X-CSE-ConnectionGUID: jb+kpIFJSI+RXaApLyVjqQ==
X-CSE-MsgGUID: nHYa4ZrMREi6c85IN53csA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94635026"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="94635026"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 00:18:11 -0700
X-CSE-ConnectionGUID: zDVr5ci+RI2zGnL/TyCjcw==
X-CSE-MsgGUID: lxwzgmH0S4yCVdBQFMAI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272080783"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 00:18:09 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9HF1-000000000Z9-1Aw3;
	Wed, 23 Sep 2026 07:18:07 +0000
Date: Wed, 23 Sep 2026 09:17:16 +0200
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8x50/iio-max34417-adc 1/1]
 include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_468' declared with attribute error: FIELD_GET: mask is
 zero
Message-ID: <202609230935.40M4of6d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8x50/iio-max34417-adc
head:   de823e9d8fbc63a8820dec0af4752e8bed7a1c33
commit: de823e9d8fbc63a8820dec0af4752e8bed7a1c33 [1/1] WiP: iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260923/202609230935.40M4of6d-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230935.40M4of6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230935.40M4of6d-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iio/adc/max34417.c: In function 'max34417_read_current':
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_unsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_unsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
   In file included from drivers/iio/adc/max34417.c:10:
>> include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/bitfield.h:98:42: note: in definition of macro '__FIELD_GET'
      98 |                 (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));     \
         |                                          ^~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bitfield.h:98:42: note: in definition of macro '__FIELD_GET'
      98 |                 (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));     \
         |                                          ^~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
   include/linux/bits.h:48:27: warning: left shift count >= width of type [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/bitfield.h:98:61: note: in definition of macro '__FIELD_GET'
      98 |                 (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));     \
         |                                                             ^~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/bitfield.h:98:61: note: in definition of macro '__FIELD_GET'
      98 |                 (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));     \
         |                                                             ^~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:27: note: in expansion of macro 'GENMASK'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                           ^~~~~~~
   In function 'max34417_read_current',
       inlined from 'max34417_read_raw' at drivers/iio/adc/max34417.c:233:11:
   include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_468' declared with attribute error: FIELD_GET: mask is zero
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      97 |                 __BF_FIELD_CHECK_MASK(mask, 0U, pfx);                   \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:17: note: in expansion of macro '__FIELD_GET'
     178 |                 __FIELD_GET(_mask, _reg, "FIELD_GET: ");                \
         |                 ^~~~~~~~~~~
   drivers/iio/adc/max34417.c:214:17: note: in expansion of macro 'FIELD_GET'
     214 |         *val2 = FIELD_GET(GENMASK(55, 32), scaled_val);
         |                 ^~~~~~~~~
..


vim +/__compiletime_assert_468 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
