Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9506631
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 00:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710895198; cv=none; b=f/+JApvcAZCDBeQlRGmcpshZkq3v+uNIdDkbYRDHF4GNfOOo9jZK5R7t1ZN97hTQyTLfSniDsuV2lL3ASe9hb3fqhuftgJmFmoeVVFg8dNM3RKb5z3VK4LOoHAO9x2Dl725DUbhlqknh3ILHILZrwlLItAzBKnLvy6UnpVTed3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710895198; c=relaxed/simple;
	bh=blP8Q8qzLEAGHsuOrJp+M9e87zZEDwgHumPnQtAvhwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q3DMNDvTe6nJoFVt9ubMQqHbHzP4OqJ72ud8Zve9HqYB+aUv4BGeQMt105ECiEoPXuLAL2qBS3mb4axZEml6GS1J1l+qmAU0DLfVhp1u2yqiCxfx9X4phbWKjV3OY8DtICZg4FbfwbZNSzQy1y334IfwPAxeU80JQnBgdivklQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6fxTRyp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6fxTRyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710895197; x=1742431197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blP8Q8qzLEAGHsuOrJp+M9e87zZEDwgHumPnQtAvhwY=;
  b=j6fxTRyp4I1q5XFyNWqGK0f7D3LVJL76dNiJCliFqsA0+lWkUcIWpnic
   wpoeyQqousDD0wp92CyexYoa/0/TN24h5n0LZzR2eLllJqu/zSYcyHzqG
   H0Mzz2slUc/hh+6f2cjL/mGsX1VH0ofULT/ZjcMHceJtyplm/7OGIkgDT
   jqQMwZ5bDjL1YEnRD2+WcjLa3ukLZS8WxA9qnyKYq1bDW8P6fTITpJAeR
   qYuVT3taXjPOVMqoNPxZh384PHiNoReV6dI4pwr6Vpl2gEfqaC3iGUmDz
   QzPuUO7h2r1bUdC94iVKGypmV0xz3zPf0lYsuYwqZ0xxiqmk9jA2JDzb0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="31234544"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="31234544"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 17:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="44951154"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Mar 2024 17:39:55 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmjzj-000ICL-3D;
	Wed, 20 Mar 2024 00:39:52 +0000
Date: Wed, 20 Mar 2024 08:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_prototype 74/78]
 include/linux/align.h:8:48: error: 'typeof' applied to a bit-field
Message-ID: <202403200810.1sCpR1ue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_prototype
head:   7315604eb1d087836123bc9670d2be420a42d37f
commit: 6235640ae08dd66d5f64292e2ccedfcf7c564678 [74/78] mm/page_alloc: reuse existing bit field for pfmemalloc
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240320/202403200810.1sCpR1ue-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403200810.1sCpR1ue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403200810.1sCpR1ue-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/page_frag_alloc.c:17:
   mm/page_frag_alloc.c: In function '__page_frag_alloc_align':
>> include/linux/align.h:8:48: error: 'typeof' applied to a bit-field
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                                ^
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_frag_alloc.c:92:18: note: in expansion of macro 'ALIGN'
      92 |         offset = ALIGN(nc->offset, -align_mask);
         |                  ^~~~~
>> include/linux/align.h:8:48: error: 'typeof' applied to a bit-field
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                                ^
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_frag_alloc.c:92:18: note: in expansion of macro 'ALIGN'
      92 |         offset = ALIGN(nc->offset, -align_mask);
         |                  ^~~~~


vim +/typeof +8 include/linux/align.h

08c5188ef40ff8 Andy Shevchenko 2021-05-06   6  
08c5188ef40ff8 Andy Shevchenko 2021-05-06   7  /* @a is a power of 2 value */
08c5188ef40ff8 Andy Shevchenko 2021-05-06  @8  #define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
08c5188ef40ff8 Andy Shevchenko 2021-05-06   9  #define ALIGN_DOWN(x, a)	__ALIGN_KERNEL((x) - ((a) - 1), (a))
08c5188ef40ff8 Andy Shevchenko 2021-05-06  10  #define __ALIGN_MASK(x, mask)	__ALIGN_KERNEL_MASK((x), (mask))
08c5188ef40ff8 Andy Shevchenko 2021-05-06  11  #define PTR_ALIGN(p, a)		((typeof(p))ALIGN((unsigned long)(p), (a)))
08c5188ef40ff8 Andy Shevchenko 2021-05-06  12  #define PTR_ALIGN_DOWN(p, a)	((typeof(p))ALIGN_DOWN((unsigned long)(p), (a)))
08c5188ef40ff8 Andy Shevchenko 2021-05-06  13  #define IS_ALIGNED(x, a)		(((x) & ((typeof(x))(a) - 1)) == 0)
08c5188ef40ff8 Andy Shevchenko 2021-05-06  14  

:::::: The code at line 8 was first introduced by commit
:::::: 08c5188ef40ff82aed559123dc0ab2d2254b1b1c kernel.h: drop inclusion in bitmap.h

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
