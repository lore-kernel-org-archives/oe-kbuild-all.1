Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F437755C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534621; cv=none; b=XiJZ15qvmM2gaSUo7NhHsOZ90IFdSsp2shP0aqx1a/vqyDREe4mVcKrcF41m4UOwo/oF7LSWDGF2N8yFHMiPC2jVhFnjSuLLFu3Le633gfgIs5lcB4xh9qXNAMUsRRjZBbg3n1GmK9eKlEwZinxR1AGyH38tAKZTEy3NcE5KNKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534621; c=relaxed/simple;
	bh=pu1LbotLSFywFHDfLAyBqe+BMrvtRoyfrN6O37UN46s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e1+czmauHX99HfkdR2IxaMrceTd1LhlI1mI8UbJO1Wd1oVezUPIl/SjA0xfGR0pf2zg8M1n5nToGJmRgm+vB+yx72UH65JjZ10GidpkM1LE1+UZxe/MApj0B1RozxXpJ3DN6/FFv5k6+G0IBttxXlq5sFP1oozDIev4IaN+LYkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfGloXEA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfGloXEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534621; x=1807070621;
  h=date:from:to:cc:subject:message-id;
  bh=pu1LbotLSFywFHDfLAyBqe+BMrvtRoyfrN6O37UN46s=;
  b=DfGloXEA4qosKnSCyENopTqw3GuXOdMKdaJTmHYiSwWz5xf01/gBhEgW
   xxnhaDMOWQWzTq4+yGDfelDvBzmjJlmUo7QjTv26qcSYTxSwZ58lHJO3r
   X2B5lwcXvj5+GhghQP0oRJTcZKfXo9jQoby5SWqS20rhUj351r+/Odu9z
   EWImmpmuV769ijYlCpIICZsRH7QbakZ0Se18bNqZyjN3061mi5r4wnAf3
   U7NkW7AUi0uvbEZJOWYefwUFJcRZQxDoEKHvod1NsdSEDsG2NOCBwYIiF
   xfTOGQbPwWW1vdFhRqoFhk0x5jyu+osGbl3vGMcfP7oVJfj+Mgz1SzLQG
   Q==;
X-CSE-ConnectionGUID: FofUPtyVRIqVALYUX9MQqg==
X-CSE-MsgGUID: X20d+9QkSaCqlc/qeYZevg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87564368"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87564368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:39 -0700
X-CSE-ConnectionGUID: c+xo1pIXSO6Pv+vgpxAodQ==
X-CSE-MsgGUID: Q9BWLlZ6Sl6TJuw+WP9NQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232928785"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 21:03:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-00000000091-0p7u;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: include/vdso/unaligned.h:23:9: warning: '__builtin_memcpy'
 reading 4 bytes from a region of size 0
Message-ID: <202604070917.ZVd6Ugz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bfe62a454542cfad3379f6ef5680b125f41e20f4
commit: a339671db64b12bb02492557d2b0658811286277 vdso: Switch get/put_unaligned() from packed struct to memcpy()
date:   3 months ago
config: mips-randconfig-r111-20260406 (https://download.01.org/0day-ci/archive/20260407/202604070917.ZVd6Ugz4-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604070917.ZVd6Ugz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to memcpy()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604070917.ZVd6Ugz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/mips/include/uapi/asm/byteorder.h:15,
                    from arch/mips/include/asm/bitops.h:21,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from arch/mips/boot/compressed/decompress.c:14:
   In function 'get_unaligned_le32',
       inlined from 'decompress_kernel' at arch/mips/boot/compressed/decompress.c:113:16:
>> include/vdso/unaligned.h:23:9: warning: '__builtin_memcpy' reading 4 bytes from a region of size 0 [-Wstringop-overread]
      23 |         __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      24 |                          sizeof(__get_unaligned_val));                  \
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   include/linux/unaligned.h:23:28: note: in expansion of macro '__get_unaligned_t'
      23 |         return le32_to_cpu(__get_unaligned_t(__le32, p));
         |                            ^~~~~~~~~~~~~~~~~
   In file included from arch/mips/boot/compressed/decompress.c:22:
   arch/mips/boot/compressed/decompress.h: In function 'decompress_kernel':
   arch/mips/boot/compressed/decompress.h:6:39: note: at offset -4 into source object '__image_end' of size [0, 2147483647]
       6 | extern unsigned char __image_begin[], __image_end[];
         |                                       ^~~~~~~~~~~


vim +/__builtin_memcpy +23 include/vdso/unaligned.h

     6	
     7	/**
     8	 * __get_unaligned_t - read an unaligned value from memory.
     9	 * @type:	the type to load from the pointer.
    10	 * @ptr:	the pointer to load from.
    11	 *
    12	 * Use memcpy to affect an unaligned type sized load avoiding undefined behavior
    13	 * from approaches like type punning that require -fno-strict-aliasing in order
    14	 * to be correct. As type may be const, use __unqual_scalar_typeof to map to a
    15	 * non-const type - you can't memcpy into a const type. The
    16	 * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its required
    17	 * expression rather than type, a pointer is used to avoid warnings about mixing
    18	 * the use of 0 and NULL. The void* cast silences ubsan warnings.
    19	 */
    20	#define __get_unaligned_t(type, ptr) ({					\
    21		type *__get_unaligned_ctrl_type __always_unused = NULL;		\
    22		__unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_unaligned_val; \
  > 23		__builtin_memcpy(&__get_unaligned_val, (void *)(ptr),		\
    24				 sizeof(__get_unaligned_val));			\
    25		__get_unaligned_val;						\
    26	})
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
