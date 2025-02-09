Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B219199939
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 11:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739100099; cv=none; b=LCBF58c8PqiEpRkNWbSt+FcjLQPM/t+fIDPMTVxQpghmjL3LhiBYF59tKBYABDaTPcx2335QsSmjaxjzL9GGAL7KV33uN27IWhR+xJldORpym+CmwkSP7G7VJ5OlHS5kuuf33wG7uRGZE/jwGRDJJnKs/nS0nVq65IYKV+f6I7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739100099; c=relaxed/simple;
	bh=LDW/XQ0GacDudIuOZ8nlB7TScUMIBgMD138iC1H+YXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJNuy789oO6KTzSDliIym6CT5ECGVb2tpwSr1PFu1TmtUdpSOuwRIvUa9xjkIGgKM/494x3j6AT7F2VgQty2cf+XQzNHXbBrmvG3rAgI9zFoBB3YgBvElldpm1tktA8Pucu94hDd5R0m+GO0bw2hmleOMUvkopipYgenVxydzsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmYmvO9s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmYmvO9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739100098; x=1770636098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDW/XQ0GacDudIuOZ8nlB7TScUMIBgMD138iC1H+YXA=;
  b=dmYmvO9shDBv/+gEo5DKZtEpIM4GP+nyydj+Brc58WXtlt/TYDZbC1FR
   o08QFTXiqHIHysvBTZjit6P3Bo3xOix5AwYRdnS1nHTR0JQ+aIpgVBhq5
   z7sO6N09u1f8HVr2mg9JRlDgkc1nX0A/NFKoasaHcTgjbEmRLabihg9IF
   C3ux9In1WuZsggBBN3xPZmZtyNnqAIrn4jCGgIWk/ZrHR0K4AwzgI7MGk
   qA4Mfw4LAR85R7iDkAsiLNJXKaze/rhIKaqse70lalGNr9suhorC6E2zq
   8+C8nA/qrhhSiDi1mpYKo1xUYL9iONzlgTC4AvwRIh0HLRnD7rz7XMim2
   Q==;
X-CSE-ConnectionGUID: NbgLTldXT7WC5eKWR2I+Tg==
X-CSE-MsgGUID: 2xyIgAkUTkysEcPSqApXrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39582237"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39582237"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 03:21:38 -0800
X-CSE-ConnectionGUID: TarO1t02T+yE376Tb+qF2w==
X-CSE-MsgGUID: v6j4bjgpRaKZG3BxUz8Egw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117145085"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2025 03:21:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th5NV-0011Ox-1r;
	Sun, 09 Feb 2025 11:21:33 +0000
Date: Sun, 9 Feb 2025 19:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: arch/s390/include/asm/bitops.h:60:17: error: impossible constraint
 in 'asm'
Message-ID: <202502091912.xL2xTCGw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9946eaf552b194bb352c2945b54ff98c8193b3f1
commit: b2bc1b1a77c0ffc2f51e90b1112d7f5530e4d15c s390/bitops: Provide optimized arch_test_bit()
date:   4 weeks ago
config: s390-randconfig-r052-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091912.xL2xTCGw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091912.xL2xTCGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091912.xL2xTCGw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/vmalloc.h:5,
                    from mm/vmalloc.c:11:
   In function 'arch_test_bit',
       inlined from 'node_state' at include/linux/nodemask.h:423:9,
       inlined from 'warn_if_node_offline' at include/linux/gfp.h:252:2,
       inlined from '__alloc_pages_node_noprof' at include/linux/gfp.h:267:2,
       inlined from 'alloc_pages_node_noprof' at include/linux/gfp.h:296:9,
       inlined from 'vm_area_alloc_pages.constprop' at mm/vmalloc.c:3591:11:
>> arch/s390/include/asm/bitops.h:60:17: warning: 'asm' operand 2 probably does not match constraints
      60 |                 asm volatile(
         |                 ^~~
>> arch/s390/include/asm/bitops.h:60:17: error: impossible constraint in 'asm'


vim +/asm +60 arch/s390/include/asm/bitops.h

    48	
    49	static __always_inline bool arch_test_bit(unsigned long nr, const volatile unsigned long *ptr)
    50	{
    51	#ifdef __HAVE_ASM_FLAG_OUTPUTS__
    52		const volatile unsigned char *addr;
    53		unsigned long mask;
    54		int cc;
    55	
    56		if (__builtin_constant_p(nr)) {
    57			addr = (const volatile unsigned char *)ptr;
    58			addr += (nr ^ (BITS_PER_LONG - BITS_PER_BYTE)) / BITS_PER_BYTE;
    59			mask = 1UL << (nr & (BITS_PER_BYTE - 1));
  > 60			asm volatile(
    61				"	tm	%[addr],%[mask]\n"
    62				: "=@cc" (cc)
    63				: [addr] "R" (*addr), [mask] "I" (mask)
    64				);
    65			return cc == 3;
    66		}
    67	#endif
    68		return generic_test_bit(nr, ptr);
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
