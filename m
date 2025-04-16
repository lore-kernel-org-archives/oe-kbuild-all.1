Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495521B9E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823793; cv=none; b=UjjJg9f7wJaeQOsS+M5ngajO54c76/VcyMV/F3Ly1gJrmsxUIkEN8TuT1xpbDojZfZh1b7p/g9Ymz8/qlWGJrUU/Mxtmpa+gruE6D/5g3qWBGmfKMuvF2oAh5U7bL/D4roFEDz85h9sx8Sk8Fo+oo8n2njOawITRZyHKBM8g6wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823793; c=relaxed/simple;
	bh=7tcG1iwjZRC1tNZKonSJHTBHgoBPyi7kdVlyrK+Xzk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npEFQaAXj3x+HQqvk5uGbL7zbuzfSeLcnPkjwSgChQ76clDfah0Ifg1rFRTxn80rQUwCPY4Qw+aaiJw4fsCHpUCKvpY2gWXpmPHMC6DyG/rBzxHRH6ymwLtmcCrlgk00GYX8iYZpcS/Rt+YhtCUYhNs6/tWC7LsHUHdQ/mMoLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFRm/Eni; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFRm/Eni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744823791; x=1776359791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tcG1iwjZRC1tNZKonSJHTBHgoBPyi7kdVlyrK+Xzk8=;
  b=VFRm/EnioDyUjZzU9WYEnktkppFImYiSbI5kFMbnH2UBhlL+L38BFHn4
   Wxpse9rmy/txr75yBoDWxfob3VNo8p9MXrdOCC2+06oYPGC1KK/HdX/mF
   5b3ml4VIeGopFuTUOA87vLkM8/mk+hRBuxR/fm4902+/Gjvr8mD8bF2kC
   jvzObg/yy9smVpJhNFZ6zEn1mXY2+CspJmOAfVqVXBMyQibxNoHIGrVcH
   hKhtUJSsvkF9sTxATASZyVaTV1/MYbeucygT6FANtz11FzxfZ8pMzxaYa
   ktinvWNekSBuJC+OoyiXlxZN/vg88t2C2p9JeAlpoI/r2cs+aWJjqlDrr
   A==;
X-CSE-ConnectionGUID: zVRNkbDNQIapZzuXQyEm1w==
X-CSE-MsgGUID: tfLX+HymShaiT1mbqpwx/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57025373"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57025373"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:16:28 -0700
X-CSE-ConnectionGUID: eqod0pa/SxKEoM8m5GrF5Q==
X-CSE-MsgGUID: /sPPZ+8sQ/mCQCwjN7Bung==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130400444"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2025 10:16:27 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u56N6-000K78-1v;
	Wed, 16 Apr 2025 17:16:24 +0000
Date: Thu, 17 Apr 2025 01:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sven/smc-v4 4/9] include/linux/compiler_types.h:557:45:
 error: call to '__compiletime_assert_215' declared with attribute error:
 FIELD_PREP: mask is not constant
Message-ID: <202504170141.hnGzrbt7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sven/smc-v4
head:   682159b095a70eca3ef9bdd5bb513aae5aa992b6
commit: fff9f4467d52393012e4d98dd77d390299a98173 [4/9] WIP: mfd: Add Apple Silicon SMC driver
config: i386-buildonly-randconfig-002-20250417 (https://download.01.org/0day-ci/archive/20250417/202504170141.hnGzrbt7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170141.hnGzrbt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170141.hnGzrbt7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/mfd/macsmc.c: In function 'apple_smc_cmd_locked':
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
   In file included from drivers/mfd/macsmc.c:8:
>> include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
>> include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
   include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/bitfield.h:116:63: note: in definition of macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
   include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bitfield.h:116:63: note: in definition of macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:71:27: note: in expansion of macro 'SMC_DATA'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                           ^~~~~~~~
   include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   drivers/mfd/macsmc.c:96:29: note: in expansion of macro 'FIELD_GET'
      96 |                 *ret_data = FIELD_GET(SMC_DATA, smc->cmd_ret);
         |                             ^~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:96:39: note: in expansion of macro 'SMC_DATA'
      96 |                 *ret_data = FIELD_GET(SMC_DATA, smc->cmd_ret);
         |                                       ^~~~~~~~
   include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/compiler_types.h:537:23: note: in definition of macro '__compiletime_assert'
     537 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   drivers/mfd/macsmc.c:96:29: note: in expansion of macro 'FIELD_GET'
      96 |                 *ret_data = FIELD_GET(SMC_DATA, smc->cmd_ret);
         |                             ^~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))


vim +/__compiletime_assert_215 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
