Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2760802
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 04:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721623815; cv=none; b=rcWFduMqxj5r8gY/FH2lQbxF8BFMUcsSAvzo5Hd3ezhh8wH7/ps6ckyFT4oKoIzP8uvj58+dNmXFNlPxTHgCf8etLXdTR4NhfmgksaCb61O2Q8k8EDjzcvUxMgGi5P2fnJ0q6kvKSwxlgL1a3gio1LT5wpVLBm5c+cs6QT+GAcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721623815; c=relaxed/simple;
	bh=8muP20s4C868vWiyvBhXJAd6xtKPy7be8vRMs9Wy+AI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwmCw+UgzOvJL3I304PN+zmXnj97y8n2VGOdLuGzgAqsUNA15AoFooAjoSHXXyEF700EWp8DXirdIO1vyvAW6hkx3SUbHdk92QN67P6AjnPsTxnXbV43TRu1PYoLoff9Up62KKylasCQ9bqWAqM56gJhCs8fSFIowAzJX2966OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0Q/pocx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0Q/pocx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721623813; x=1753159813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8muP20s4C868vWiyvBhXJAd6xtKPy7be8vRMs9Wy+AI=;
  b=G0Q/pocxxu6yly/UFeKIW4gDmXsQg6As5MSlz5J3n1g6TxsTnlZmOnCb
   V5wlBo4fpYwFMw8K30DbHDqPuzwe/zSqFYdndiLP5yLmFjI8/3g94Ct4k
   H6YWQHbXAajXG28dptcuSbgYia+7AgEzRrwthWj06ljR3OlAFfmwBmt3F
   GBdF6pYzuKPyZzxKiprELSwzF7lIlC+h83moDqyApLEsHr7nSBHhr/el6
   tHEjY4uhzk+Tkaqh+VWPLMFXtWB15+/gij0HrsdydDfiqF19tAjN23EZj
   8kNER6prlO2zgXeWpB2T8yDO9Xn+cpqLRlPRUhohGGRLBwCvxXLE/w0Ib
   g==;
X-CSE-ConnectionGUID: s4akv6hEQLqXfXxQwM/60w==
X-CSE-MsgGUID: d3Q7lD3nQ422Wmyc4UzkRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="29831272"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="29831272"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 21:50:13 -0700
X-CSE-ConnectionGUID: 8lMDSzIRRBeOMVuX16zXeQ==
X-CSE-MsgGUID: hUsiqSQ9Tt2JV/mPSYuQSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="51482738"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jul 2024 21:50:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVkzy-000ksU-12;
	Mon, 22 Jul 2024 04:50:10 +0000
Date: Mon, 22 Jul 2024 12:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 37/41]
 arch/openrisc/include/asm/pgalloc.h:35:38: error: implicit declaration of
 function 'ptdesc_pfn'; did you mean 'ptdesc_page'?
Message-ID: <202407221253.HR0vo3fk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   3fe05f7357f5b4db6bebc807eaa2398ea1b29129
commit: ebd650c6c69974af12394e8546dacad3a2d46695 [37/41] mm/pgtable: pass ptdesc to pmd_populate
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240722/202407221253.HR0vo3fk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221253.HR0vo3fk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221253.HR0vo3fk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/openrisc/kernel/asm-offsets.c:28:
   arch/openrisc/include/asm/pgalloc.h: In function 'pmd_populate':
>> arch/openrisc/include/asm/pgalloc.h:35:38: error: implicit declaration of function 'ptdesc_pfn'; did you mean 'ptdesc_page'? [-Wimplicit-function-declaration]
      35 |                      ((unsigned long)ptdesc_pfn(pte) <<
         |                                      ^~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:54:46: note: in definition of macro 'set_pmd'
      54 | #define set_pmd(pmdptr, pmdval) (*(pmdptr) = pmdval)
         |                                              ^~~~~~
   include/asm-generic/pgtable-nop4d.h:41:60: note: in expansion of macro '__pgd'
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                            ^~~~~
   include/asm-generic/pgtable-nopud.h:49:60: note: in expansion of macro '__p4d'
      49 | #define __pud(x)                                ((pud_t) { __p4d(x) })
         |                                                            ^~~~~
   include/asm-generic/pgtable-nopmd.h:53:60: note: in expansion of macro '__pud'
      53 | #define __pmd(x)                                ((pmd_t) { __pud(x) } )
         |                                                            ^~~~~
   arch/openrisc/include/asm/pgalloc.h:34:22: note: in expansion of macro '__pmd'
      34 |         set_pmd(pmd, __pmd(_KERNPG_TABLE +
         |                      ^~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +35 arch/openrisc/include/asm/pgalloc.h

    27	
    28	#define pmd_populate_kernel(mm, pmd, pte) \
    29		set_pmd(pmd, __pmd(_KERNPG_TABLE + __pa(pte)))
    30	
    31	static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
    32					struct ptdesc *pte)
    33	{
    34		set_pmd(pmd, __pmd(_KERNPG_TABLE +
  > 35			     ((unsigned long)ptdesc_pfn(pte) <<
    36			     (unsigned long) PAGE_SHIFT)));
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
