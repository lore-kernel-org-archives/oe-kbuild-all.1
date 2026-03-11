Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5573D333D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228272; cv=none; b=q9ACK3vDSJDXopECXK/9p4/7GIPtasdySLna+hNAJu5OAYLULLhUbumG3hErIn7laXe80bCBs0oCDY/sjqHfzM+LSp35EzC5G3iDY40Jt7YsJHVJ5lW7rsy/wWy6jeEfPBxcXWFMhtRv5AKAUlvpO5FekM3b2DgepsR2xMSWDb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228272; c=relaxed/simple;
	bh=fhKFZ8UlVFDXoWBnKbMcKdsQEAYY3+r1I5IszfsQGSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Us9grr4l4eGZuWt0WCWmmK/J0/dlTzM091hES9EiUQEH9XXyvLQhItAJdTgm/bmxLeUtrt91p2/YjC5ncUe/gAu0fITwIWSQn98D5XzmfUlNvN2kLGTDNbd/OnjQ3hfdImJoCUWF6Cn1ndRY/yVv3yq+AXlBPisPz5abmyIcCAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g600DrF1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g600DrF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773228268; x=1804764268;
  h=date:from:to:cc:subject:message-id;
  bh=fhKFZ8UlVFDXoWBnKbMcKdsQEAYY3+r1I5IszfsQGSE=;
  b=g600DrF1vSzOb8RH2C+A4pra4OQ6R1oY1dKvxNWLj9SkbyjjzN3NL1lI
   1fkml4HDbSD3wMwQoZRmzB1uqr43GG8DIuGqelCdYepcPl9hBGQDCxkhY
   5BIIaBMWIQ43gGHp9k8cGUrrrOpf6gfxjlu0aP3alX3NNZFor55ZK7H5i
   7BBAGRgP6WM96+t328nmVHZhUB5EICiiHa+ICald72SiTw+RFZ9scOkld
   r5yk5cO0lBXxntp8/XXtqejZLnKB49CRs75p/V8l9BgKf70GOKq0ksITc
   d6jkezfFRCa4dqbk4jzQuNV9GUTWxCXvr45/uek8QEI8JLNU5s350Q29O
   A==;
X-CSE-ConnectionGUID: 0awHWYv7Q4OTIo+PLuzOgw==
X-CSE-MsgGUID: It8x8IXZTyeaEIiIT8ybcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73990425"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="73990425"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 04:24:28 -0700
X-CSE-ConnectionGUID: 1ZkuXy0FSw6ICMSMsBVivg==
X-CSE-MsgGUID: QFs8mwcqQZa8M2dmztLgEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220616294"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Mar 2026 04:24:26 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Hfr-0000000014R-0OK0;
	Wed, 11 Mar 2026 11:24:23 +0000
Date: Wed, 11 Mar 2026 19:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 3/3] mm/page_alloc.c:6308:23:
 warning: no previous prototype for 'arch_memmap_init'
Message-ID: <202603111903.xxRCm90D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mike,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   105c73abbf7684dce0bec06bf6c17645c20b6f04
commit: ce6ee46e0f39ed97e23ebf7b5a565e0266a8a1a3 [3/3] mm/page_alloc: fix memory map initialization for descending nodes
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260311/202603111903.xxRCm90D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111903.xxRCm90D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111903.xxRCm90D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_alloc.c:2602:5: warning: no previous prototype for 'find_suitable_fallback' [-Wmissing-prototypes]
    2602 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3563:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3563 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6270:20: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
    6270 | void __init __weak memmap_init(void)
         |                    ^~~~~~~~~~~
>> mm/page_alloc.c:6308:23: warning: no previous prototype for 'arch_memmap_init' [-Wmissing-prototypes]
    6308 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7676:9: note: in expansion of macro 'adj_init_size'
    7676 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7676:9: note: in expansion of macro 'adj_init_size'
    7676 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7676:9: note: in expansion of macro 'adj_init_size'
    7676 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7676:9: note: in expansion of macro 'adj_init_size'
    7676 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7678:9: note: in expansion of macro 'adj_init_size'
    7678 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7678:9: note: in expansion of macro 'adj_init_size'
    7678 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7678:9: note: in expansion of macro 'adj_init_size'
    7678 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7678:9: note: in expansion of macro 'adj_init_size'
    7678 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7679:9: note: in expansion of macro 'adj_init_size'
    7679 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7679:9: note: in expansion of macro 'adj_init_size'
    7679 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7679:9: note: in expansion of macro 'adj_init_size'
    7679 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7679:9: note: in expansion of macro 'adj_init_size'
    7679 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7680:9: note: in expansion of macro 'adj_init_size'
    7680 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7680:9: note: in expansion of macro 'adj_init_size'
    7680 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: warning: comparison between two arrays [-Warray-compare]
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7680:9: note: in expansion of macro 'adj_init_size'
    7680 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7672 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7680:9: note: in expansion of macro 'adj_init_size'
    7680 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7672:27: warning: comparison between two arrays [-Warray-compare]


vim +/arch_memmap_init +6308 mm/page_alloc.c

  6306	
  6307	/* A stub for backwards compatibility with custom implementatin on IA-64 */
> 6308	void __meminit __weak arch_memmap_init(unsigned long size, int nid,
  6309					       unsigned long zone,
  6310					       unsigned long range_start_pfn)
  6311	{
  6312	}
  6313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
