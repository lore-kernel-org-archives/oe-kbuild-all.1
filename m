Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1720BB5C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729881807; cv=none; b=WXDCs5YUYhMV87ca3kS3Dz258YPqxA2bjSxqSq/439blr3EpJRmrlu0ZN29PwZM7PlMmlhhfyXcocn6nP/phVCLB+ECz6dw7AWY8SrzTxfPpN7b1a3bKERZrOnTV2fctn4xP9t11/paD9VpqqlyLrc/pxzsB2r2ZHPwyZbitzyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729881807; c=relaxed/simple;
	bh=RgH0lgvagcmlkAbTV97JC02f+ay4+pDNDyXQeZbqPWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DRgjPMOxevp8IIv9xRgQ/iUWeqW7J8Q1VUYbixq2HlY+Co/Z19qoAxzApqYfIVOqJ7sF5eUE7rhUp5SXb+ZNaDZ9WHWGUgD58nPNmP9HyQD79UrXTFL1/Q9sj/yA0+ikwf9k5CgY1FwsJ7eD6TDsJIiL9L5Y2dY6oET520K6h7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLMyHj5S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLMyHj5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729881805; x=1761417805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RgH0lgvagcmlkAbTV97JC02f+ay4+pDNDyXQeZbqPWY=;
  b=FLMyHj5STYD8hKSLnX8sRg1et8BZsAp7nLVSZBzUhKAD9CjDtompfHi8
   e5iB2DhieIXfmUquXdDlE1GbXl8pTcBYhLaRqRkb7xnRBHoJBA9DVKNvM
   XK3kxSqZXIj/zBjwD9mlZLdKU/GBBDzZ2sWaS8zSbYMfTRDWMBjJmdIwJ
   OgOgsgQ8YkgPq6U6p+zhX94NlCv1UP7Kp0VgV3AS7No3o8qtPWl1RX0SX
   6Rh0MtEXSzsVn+2q+L47RgQdNjCX69ge7YN/G6ljDzPvf638cGV6anjLC
   PcwybOucCyXQyRItOIo9PAbPCox6w338zK/xYHA0siXS0WR+04obOjjlc
   w==;
X-CSE-ConnectionGUID: Z940DUqBTy2e4twOCOLI5A==
X-CSE-MsgGUID: OzRpaRPPR6q82Ob0OjJfxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29669841"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="29669841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 11:43:25 -0700
X-CSE-ConnectionGUID: 1gizOXmASPKCjqIDwIVfWg==
X-CSE-MsgGUID: 9DYYKNeWS+iixbv1+OS1rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="85599371"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2024 11:43:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4PHN-000Yku-25;
	Fri, 25 Oct 2024 18:43:21 +0000
Date: Sat, 26 Oct 2024 02:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc32-lib 19/33] include/linux/crc32.h:52:29: error:
 expected identifier or '(' before numeric constant
Message-ID: <202410260239.C4urZdrq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib
head:   173b25426b0584097e1e1a772bc09bf8c0780837
commit: f7f6af3d9ab8c5e851046390ac3f9d67b67a1033 [19/33] lib/crc32: expose whether the lib is really optimized at runtime
config: arc-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260239.C4urZdrq-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260239.C4urZdrq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260239.C4urZdrq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crc32.c:29:
>> include/linux/crc32.h:52:29: error: expected identifier or '(' before numeric constant
      52 | #define crc32_optimizations 0
         |                             ^
   lib/crc32.c:342:5: note: in expansion of macro 'crc32_optimizations'
     342 | u32 crc32_optimizations;
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/crc32.c:31:
>> include/linux/crc32.h:52:29: error: expected identifier or '(' before numeric constant
      52 | #define crc32_optimizations 0
         |                             ^
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/crc32.c:343:1: note: in expansion of macro 'EXPORT_SYMBOL'
     343 | EXPORT_SYMBOL(crc32_optimizations);
         | ^~~~~~~~~~~~~
   lib/crc32.c:343:15: note: in expansion of macro 'crc32_optimizations'
     343 | EXPORT_SYMBOL(crc32_optimizations);
         |               ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   include/linux/compiler.h:227:71: error: lvalue required as unary '&' operand
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                                                                       ^
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/crc32.c:343:1: note: in expansion of macro 'EXPORT_SYMBOL'
     343 | EXPORT_SYMBOL(crc32_optimizations);
         | ^~~~~~~~~~~~~


vim +52 include/linux/crc32.h

    39	
    40	/*
    41	 * crc32_optimizations contains flags that indicate which CRC32 library
    42	 * functions are using architecture-specific optimizations.  Unlike
    43	 * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
    44	 * variants and also whether any needed CPU features are available at runtime.
    45	 */
    46	#define CRC32_LE_OPTIMIZATION	BIT(0) /* crc32_le() is optimized */
    47	#define CRC32_BE_OPTIMIZATION	BIT(1) /* crc32_be() is optimized */
    48	#define CRC32C_OPTIMIZATION	BIT(2) /* __crc32c_le() is optimized */
    49	#if IS_ENABLED(CONFIG_CRC32_ARCH)
    50	extern u32 crc32_optimizations;
    51	#else
  > 52	#define crc32_optimizations 0
    53	#endif
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
