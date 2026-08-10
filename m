Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7332FF675
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786394793; cv=none; b=qXthurRdJINDwECtRFrRwgjUhBUrbzRPK+uwK9Ew0d0k1UsnsDNaMAejOkJ1tGj+rMhT/41srFUYgQJUQX8GhPoJo/TYQpFw/3oB3/yUtzdWnPHkQNZcTiOFlo5ZKbJB5/z70BwkIWVYnj/bIp8EhkhsQRtArNowSmkLA+OQr4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786394793; c=relaxed/simple;
	bh=Tqf9mpiiLJXNdLWlAejAqxY3nrAkQ2ZUK2UnjoQAIvk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iob01gGIOlySKUHMlGmcwNaIMh+ra0GD0IMw/5+7lxdKo7sAjxhDiscbYgIIpvwtxQycBhIQOL8jrfTnYoblXUbiUjQ+xNRQK2SCO5TeHigc9XldAEZK5C9XvDwJGfms8dhoEirNBvEGiTsFzUnmQSLiFtHmOFhY4Ane53c/GcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcQKgeFk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcQKgeFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786394792; x=1817930792;
  h=date:from:to:cc:subject:message-id;
  bh=Tqf9mpiiLJXNdLWlAejAqxY3nrAkQ2ZUK2UnjoQAIvk=;
  b=hcQKgeFkom94YugPVBE6wjRd9NqruimhB9IlrsNQWl+sWIEuPvAB76KD
   xTdLkXSYIqmuB8Mk4mWDKCLjB7SDEYxcPAZXw3SxHaW5QykKqKAo/xaog
   tIajDNdxyf2JLvs4Ip0Ficke49j/qt/DqmWGW8xsaOVBi0gSmHcDq8ZAm
   zb2Oy9oqJgzHknwe9GzfVCS5oolac9IeOL2ATzJWrgUvPq0rpC91Cz1zZ
   5qFy+G+Pk4MDj+xeuJaU9IuY8AZ3YJF5O0prXl7eObq9taheu9ps9x82v
   f1cIsE5E7Sg3zRa6xEQNe2MBsbvy8wziuMgFfhF6LD66IxcqkpJKomiGk
   Q==;
X-CSE-ConnectionGUID: QCmPK3b2RcqCfoPwzbF4Xg==
X-CSE-MsgGUID: +tHqTNjDRqWCFhk1K1qjHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86928859"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="86928859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 13:46:31 -0700
X-CSE-ConnectionGUID: u/Js8L+eS+uGOtnHBCTNog==
X-CSE-MsgGUID: 7PjXhg4yQTmm52Inibdzgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="256913525"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Aug 2026 13:46:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtWt8-00000000Nig-4908;
	Mon, 10 Aug 2026 20:46:26 +0000
Date: Tue, 11 Aug 2026 04:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 65/67]
 drivers/media/platform/apple/avd/avd-av1.c:115:33: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202608110446.ZUUTBSNC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   6b01d08e5d4d33d4a7cdfb1ecea6f78e295bfd75
commit: 0d6dcb9b11b41af215b8a8443b0e3f7d5aa6c110 [65/67] media: apple: avd: add av1 support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260811/202608110446.ZUUTBSNC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608110446.ZUUTBSNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608110446.ZUUTBSNC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/apple/avd/avd-av1.c:27:
   drivers/media/platform/apple/avd/avd-av1.c: In function 'set_refs':
>> drivers/media/platform/apple/avd/avd-av1.c:115:33: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     115 | #define AV1_GM_TYPE(v)          FIELD_PREP(GENMASK(31, 30), v)
         |                                 ^~~~~~~~~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~
   drivers/media/platform/apple/avd/avd-av1.c:315:30: note: in expansion of macro 'AV1_GM_TYPE'
     315 |                         push(AV1_GM_TYPE(gm->type[ref_idx]) |
         |                              ^~~~~~~~~~~
   drivers/media/platform/apple/avd/avd-av1.c: In function 'set_header':
   drivers/media/platform/apple/avd/avd-av1.c:586:47: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     586 |                         frame->upscaled_width - 1, "upscaled_width");
         |                         ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/media/platform/apple/avd/avd-inst.h:195:41: note: in definition of macro 'push'
     195 | #define push(inst, name) push(avd, ctx, inst)
         |                                         ^~~~


vim +/FIELD_PREP +115 drivers/media/platform/apple/avd/avd-av1.c

    24	
    25	#include "avd.h"
    26	#include "avd-av1-entropymode.h"
  > 27	#include "avd-inst.h"
    28	
    29	/*
    30	 * This comes from
    31	 * verisilicon/rockchip_vpu981_hw_av1_dec.c
    32	 *
    33	 * These 3 values aren't defined enum v4l2_av1_segment_feature because
    34	 * they are not part of the specification
    35	 */
    36	#define V4L2_AV1_SEG_LVL_ALT_LF_Y_H	2
    37	#define V4L2_AV1_SEG_LVL_ALT_LF_U	3
    38	#define V4L2_AV1_SEG_LVL_ALT_LF_V	4
    39	
    40	#define AV1_DIV_ROUND_UP_POW2(value, n)			\
    41	({							\
    42		typeof(n) _n  = n;				\
    43		typeof(value) _value = value;			\
    44		(_value + (BIT(_n) >> 1)) >> _n;		\
    45	})
    46	
    47	#define AV1_DIV_ROUND_UP_POW2_SIGNED(value, n)				\
    48	({									\
    49		typeof(n) _n_  = n;						\
    50		typeof(value) _value_ = value;					\
    51		(((_value_) < 0) ? -AV1_DIV_ROUND_UP_POW2(-(_value_), (_n_))	\
    52			: AV1_DIV_ROUND_UP_POW2((_value_), (_n_)));		\
    53	})
    54	
    55	#define DIV_LUT_BITS 8
    56	#define DIV_LUT_NUM BIT(DIV_LUT_BITS)
    57	#define DIV_LUT_PREC_BITS 14
    58	#define WARPEDMODEL_PREC_BITS 16
    59	#define WARP_PARAM_REDUCE_BITS 6
    60	
    61	#define AV1_CODEC_MODE_INTRABC(v)	FIELD_PREP(BIT(28), !!(v))
    62	
    63	#define AV1_HDR_JNT_COMP(v)		FIELD_PREP(BIT(0), !!(v))
    64	#define AV1_HDR_DUAL_FILTER(v)		FIELD_PREP(BIT(5), !!(v))
    65	#define AV1_HDR_MASKED_COMPOUND(v)	FIELD_PREP(BIT(6), !!(v))
    66	#define AV1_HDR_INTRA_EDGE_FILTER(v)	FIELD_PREP(BIT(8), !!(v))
    67	#define AV1_HDR_128X128_SUPERBLOCK(v)	FIELD_PREP(BIT(10), !!(v))
    68	#define AV1_HDR_SCREEN_CONTENT_TOOLS(v)	FIELD_PREP(BIT(11), !!(v))
    69	
    70	#define AV1_FLAGS_TX_MODE_LARGEST(v)		FIELD_PREP(BIT(0), !!(v))
    71	#define AV1_FLAGS_TX_MODE_SELECT(v)		FIELD_PREP(BIT(1), !!(v))
    72	#define AV1_FLAGS_TX_REDUCED_SET(v)		FIELD_PREP(BIT(2), !!(v))
    73	#define AV1_FLAGS_ALLOW_WARPED_MOTION(v)	FIELD_PREP(BIT(3), !!(v))
    74	#define AV1_FLAGS_SKIP_MODE(v)			FIELD_PREP(BIT(4), !!(v))
    75	#define AV1_FLAGS_INTRABC(v)			FIELD_PREP(BIT(6), !!(v))
    76	#define AV1_FLAGS_INTEGER_MV(v)			FIELD_PREP(BIT(7), !!(v))
    77	#define AV1_FLAGS_DISABLE_CDF_UPDATE(v)		FIELD_PREP(BIT(8), !!(v))
    78	#define AV1_FLAGS_TX_MODE_ONLY_4X4(v)		FIELD_PREP(BIT(9), !!(v))
    79	#define AV1_FLAGS_HIGH_PRECISION_MV(v)		FIELD_PREP(BIT(10), !!(v))
    80	#define AV1_FLAGS_SEG_TEMPORAL_UPDATE(v)	FIELD_PREP(BIT(13), !!(v))
    81	#define AV1_FLAGS_SEG_UPDATE_MAP(v)		FIELD_PREP(BIT(14), !!(v))
    82	#define AV1_FLAGS_SEG_ENABLED(v)		FIELD_PREP(BIT(15), !!(v))
    83	#define AV1_FLAGS_SEG_UPDATE_DATA(v)		FIELD_PREP(BIT(16), !!(v))
    84	#define AV1_FLAGS_INTRA(v)			FIELD_PREP(BIT(31), !!(v))
    85	#define AV1_FLAGS_ORDER_HINT(v)			FIELD_PREP(GENMASK(30, 23), v)
    86	
    87	#define AV1_FLAGS_REFERENCE_SELECT(v)		FIELD_PREP(BIT(28), !!(v))
    88	#define AV1_FLAGS_INTERPOLATION_FILTER(v)	FIELD_PREP(GENMASK(31, 29), v)
    89	
    90	#define AV1_SEG_ALT_Q(v)	FIELD_PREP(GENMASK(8, 0), v)
    91	#define AV1_SEG_ALT_Q_EN(v)	FIELD_PREP(BIT(9), !!(v))
    92	#define AV1_SEG_REF_FRAME(v)	FIELD_PREP(GENMASK(12, 10), v)
    93	#define AV1_SEG_REF_FRAME_EN(v)	FIELD_PREP(BIT(13), !!(v))
    94	#define AV1_SEG_REF_SKIP_EN(v)	FIELD_PREP(BIT(14), !!(v))
    95	#define AV1_SEG_REF_GMV_EN(v)	FIELD_PREP(BIT(15), !!(v))
    96	
    97	#define AV1_SEG_LF_V(v)		FIELD_PREP(GENMASK(6, 0), v)
    98	#define AV1_SEG_LF_V_EN(v)	FIELD_PREP(BIT(7), !!(v))
    99	#define AV1_SEG_LF_U(v)		FIELD_PREP(GENMASK(14, 8), v)
   100	#define AV1_SEG_LF_U_EN(v)	FIELD_PREP(BIT(15), !!(v))
   101	#define AV1_SEG_LF_Y_H(v)	FIELD_PREP(GENMASK(22, 16), v)
   102	#define AV1_SEG_LF_Y_H_EN(v)	FIELD_PREP(BIT(23), !!(v))
   103	#define AV1_SEG_LF_Y_V(v)	FIELD_PREP(GENMASK(30, 24), v)
   104	#define AV1_SEG_LF_Y_V_EN(v)	FIELD_PREP(BIT(31), !!(v))
   105	
   106	#define AV1_SEG_UNK0(v)		FIELD_PREP(BIT(16), !!(v))
   107	
   108	#define AV1_QP_U_DC(v)		FIELD_PREP(GENMASK(13, 7), v)
   109	#define AV1_QP_Y_DC(v)		FIELD_PREP(GENMASK(20, 14), v)
   110	#define AV1_QP_BASE_IDX(v)	FIELD_PREP(GENMASK(28, 21), v)
   111	#define AV1_QP_DELTA_RES(v)	FIELD_PREP(GENMASK(30, 29), v)
   112	#define AV1_QP_PRESENT(v)	FIELD_PREP(BIT(31), !!(v))
   113	
   114	#define AV1_GM_VALID(v)		FIELD_PREP(BIT(30), !!(v))
 > 115	#define AV1_GM_TYPE(v)		FIELD_PREP(GENMASK(31, 30), v)
   116	#define AV1_GM_PARAM0(v)	FIELD_PREP(GENMASK(29, 15), v)
   117	#define AV1_GM_PARAM1(v)	FIELD_PREP(GENMASK(14, 0), v)
   118	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
