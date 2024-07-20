Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A54D2E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721454481; cv=none; b=r27STonTEFcY4usGt5h4kgmN1wdm9HV4zoyb2OaKtyDNS2MXP5CmdXIs7DgOM+IRplN3wx7Z30MXatokJCn7u0aoR15NHeHO3w78/3H9jy+FbS3UUPuEAkJxxrPJ2Ntf8V3IQN8ENZ1mp0ZkF8KerGKLUssqr/b4sRJkqnPfWV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721454481; c=relaxed/simple;
	bh=Sj8yL6RDwKf5GiTnEuOJlrUCwPLhzKS2hS6awVqcEJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrMdXYZ5YVHV+YEiLii0tHEQMKGLDqLjNX3hDOwY5AZaNI9YpKCyNuy5BOB6YK2NG+IUwY1Y7A8eajejKh2f94Z0wueRY3u89hTsRgSCYPK55feudj+NpcDUQdNLoJhH7I4ldnPQKzA2YwATbC6HEB2e8vT8w8gOq6Yi0OPoLZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCYFoOAT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCYFoOAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721454480; x=1752990480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sj8yL6RDwKf5GiTnEuOJlrUCwPLhzKS2hS6awVqcEJg=;
  b=SCYFoOATFaw5RHmULwDRgP55bd9yepFFqQ2iGugvlhy6GHZgT6SG20Ea
   XHPaDm2PiJythtdcxeTErsN4CO79bJh6VMLhawciXfOt6dEqpviTqO/8g
   w23VAyMAWTa3OQmi+TwkP9rxGNyGtQ/+rWoxdArWv9+SnpT6WDjGCRFYm
   5JuB2NX+FpzPR0YMmt3/UzBzw9ez4rynDfOIAQqs6BiU3kGVNpzNSDI/F
   OriV8ROHVx1Ptk4Ez4hko78/bltNKYYMkB2adGituTdjMd84O+4sKwK3v
   9cfMu/ry9VwyQVGVAyR6LZTODE63dxxi+U0iCIrpGj8AvDS4JPTxzYjQS
   Q==;
X-CSE-ConnectionGUID: 6+YsLIRAQ/eclb8sOlOQUA==
X-CSE-MsgGUID: vOdn6dQXQtmmAi5EDQ0a4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30473957"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="30473957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 22:47:59 -0700
X-CSE-ConnectionGUID: yGg43nVmTZurVs9M78BdKA==
X-CSE-MsgGUID: Rep8kCJ8Tw6s3YdKXrIH/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="82373668"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jul 2024 22:47:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV2wm-000it8-0w;
	Sat, 20 Jul 2024 05:47:56 +0000
Date: Sat, 20 Jul 2024 13:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 36/38] include/linux/mm_types.h:512:41: error:
 passing argument 3 of 'pmd_populate' from incompatible pointer type
Message-ID: <202407201306.NLb2aJOR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   b17c1bbf65811ff797f57b7ddc4fdf4b86d86030
commit: 46417a6009d8064f174e7987dae8288f5cd9c4eb [36/38] pass ptdesc to pmd_populate
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407201306.NLb2aJOR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201306.NLb2aJOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201306.NLb2aJOR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/riscv/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   mm/memory.c: In function 'pmd_install':
>> include/linux/mm_types.h:512:41: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     511 |         const struct page *:            (const struct ptdesc *)(p),     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     512 |         struct page *:                  (struct ptdesc *)(p)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct ptdesc *
   mm/memory.c:440:39: note: in expansion of macro 'page_ptdesc'
     440 |                 pmd_populate(mm, pmd, page_ptdesc(*pte));
         |                                       ^~~~~~~~~~~
   In file included from mm/memory.c:86:
   arch/riscv/include/asm/pgalloc.h:36:31: note: expected 'pgtable_t' {aka 'struct page *'} but argument is of type 'struct ptdesc *'
      36 |         pmd_t *pmd, pgtable_t pte)
         |                     ~~~~~~~~~~^~~
--
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/mremap.c:11:
   mm/mremap.c: In function 'move_normal_pmd':
>> include/linux/mm_types.h:512:41: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     511 |         const struct page *:            (const struct ptdesc *)(p),     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     512 |         struct page *:                  (struct ptdesc *)(p)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct ptdesc *
   mm/mremap.c:286:35: note: in expansion of macro 'page_ptdesc'
     286 |         pmd_populate(mm, new_pmd, page_ptdesc(pmd_pgtable(pmd)));
         |                                   ^~~~~~~~~~~
   In file included from mm/mremap.c:31:
   arch/riscv/include/asm/pgalloc.h:36:31: note: expected 'pgtable_t' {aka 'struct page *'} but argument is of type 'struct ptdesc *'
      36 |         pmd_t *pmd, pgtable_t pte)
         |                     ~~~~~~~~~~^~~


vim +/pmd_populate +512 include/linux/mm_types.h

9a35de4ffc209b Vishal Moola (Oracle  2023-08-07  501) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  502) #define ptdesc_page(pt)			(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  503) 	const struct ptdesc *:		(const struct page *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  504) 	struct ptdesc *:		(struct page *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  505) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  506) #define ptdesc_folio(pt)		(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  507) 	const struct ptdesc *:		(const struct folio *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  508) 	struct ptdesc *:		(struct folio *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  509) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  510) #define page_ptdesc(p)			(_Generic((p),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  511) 	const struct page *:		(const struct ptdesc *)(p),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07 @512) 	struct page *:			(struct ptdesc *)(p)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  513) 

:::::: The code at line 512 was first introduced by commit
:::::: bf2d4334f72e4e033166c5a3bf1331a7238eab9d mm: add utility functions for ptdesc

:::::: TO: Vishal Moola (Oracle) <vishal.moola@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
