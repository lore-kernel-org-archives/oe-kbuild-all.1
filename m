Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE802066EB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733407386; cv=none; b=ti9P77SUBmnYRwdywIqKI79vFR0vxl6ks6nAwuncwh5cWlgmEdaOMuvHm126B0HC9wOGiQuamT4srL+58cziNIpor/jbjvz4hNrW/xyXwC1LpblFRpv3cjgBaIAuXUBXJcyYcbwoinV/4snSWjZq3asr+76xPyX15IRR8b8vaZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733407386; c=relaxed/simple;
	bh=jmE08aHx6IRWjDFh9O+zkDzokPNSm7/r5BykigF5Y0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qguMlWuCfmQstVNcMe88NzdQmW81EZkCYOpL5OCKNQRB+2p2bAf4tbfHECcdItelhlQOZqwGJS/oLZihH2r8jdghUBA0SBE0G7lBtqb7v33NnvATfKNE+h5AiuyVqmulNZSvMi+/PRfyow7Mcd2aJcUI5fFG2XU3G82r4de0uGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMMX6Dcf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMMX6Dcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733407384; x=1764943384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jmE08aHx6IRWjDFh9O+zkDzokPNSm7/r5BykigF5Y0w=;
  b=XMMX6Dcf8ubxVW5CXcLaF/aDzMpSLNOBhxnW6AHQ71nCx7UZZIVUHJvb
   l2QXBCFNYqhQqlWleqq2eVsgwbr9l2Zx3yy1LlDEwKRcGWOckUIyNhZ7H
   EqSxfk8dv7TDui6qXbor5O0vCsjMIE93JGI7QVjxhURG6NPw84M4JhKyP
   zJtI9ywOhLWuauW7K2WpghZe+vjPyFAjQmY+XZtyhfEHLiPrw74FFX1Ev
   Qq9ea2L/PKp0pcm5offrJ25qkbPJZ/Ajogt8gTU8Xk2H5VVaY2HDg1w03
   BuCm11zgD4eCiD38ALd4fEJ/ohl5O/eSuPLGGUlE3brnvWzKyPVZ1GqRO
   A==;
X-CSE-ConnectionGUID: XM0lA1I3RJ2pTB3HlL4hoQ==
X-CSE-MsgGUID: 1hnyRSHrTji7oSUzNLRPAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33051192"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33051192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 06:03:03 -0800
X-CSE-ConnectionGUID: 78Np4Px6THSPt8CnWVzxeA==
X-CSE-MsgGUID: eYLnincQSuuli1fGnLkhKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="125011956"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Dec 2024 06:03:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJCRY-00003o-1q;
	Thu, 05 Dec 2024 14:03:00 +0000
Date: Thu, 5 Dec 2024 22:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 08/21] riscv: mm: Reimplement page table entry
 atomic get function
Message-ID: <202412052157.OnB29LbN-lkp@intel.com>
References: <20241205103729.14798-9-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205103729.14798-9-luxu.kernel@bytedance.com>

Hi Xu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on arnd-asm-generic/master]
[cannot apply to akpm-mm/mm-everything tip/perf/core perf-tools/perf-tools s390/features linus/master acme/perf/core v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Lu/riscv-mm-Distinguish-hardware-base-page-and-software-base-page/20241205-184429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20241205103729.14798-9-luxu.kernel%40bytedance.com
patch subject: [RFC PATCH v2 08/21] riscv: mm: Reimplement page table entry atomic get function
config: arm-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241205/202412052157.OnB29LbN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052157.OnB29LbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052157.OnB29LbN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:30,
                    from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/pgtable.h:616:21: error: 'pgdp_get_lockless' declared as function returning an array
     616 | static inline pgd_t pgdp_get_lockless(pgd_t *pgdp)
         |                     ^~~~~~~~~~~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:317,
                    from arch/arm/kernel/asm-offsets.c:10:
   include/linux/pgtable.h: In function 'pgdp_get_lockless':
>> include/asm-generic/rwonce.h:48:2: error: returning 'const volatile pmdval_t *' {aka 'const volatile unsigned int *'} from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
      48 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   arch/arm/include/asm/pgtable.h:154:33: note: in expansion of macro 'READ_ONCE'
     154 | #define pgdp_get(pgpd)          READ_ONCE(*pgdp)
         |                                 ^~~~~~~~~
   include/linux/pgtable.h:618:16: note: in expansion of macro 'pgdp_get'
     618 |         return pgdp_get(pgdp);
         |                ^~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=4053518211
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=4053518211
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=4053518211
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=4053518211
   make: Target 'prepare' not remade because of errors.


vim +/pgdp_get_lockless +616 include/linux/pgtable.h

   614	
   615	#ifndef pgdp_get_lockless
 > 616	static inline pgd_t pgdp_get_lockless(pgd_t *pgdp)
   617	{
   618		return pgdp_get(pgdp);
   619	}
   620	#endif
   621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
