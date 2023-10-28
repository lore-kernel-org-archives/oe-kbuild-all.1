Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051664419
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyCwT09Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698477797; x=1730013797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OX7OaWMyGli2yQsdk6/FMKFyw3hJ+qrtmm7RfCwxusY=;
  b=DyCwT09QJZIscEY5Y1swY53HZNEUgYQV1Q5NUVhSTSnYZaGiLop9Nqro
   qLQyKVWMdczWYxjjdgTqY2Mosg9bTSWWSoVEh20islsxZAko+50bTJyl7
   xINkDKjrFsVQJ6gh9uT1E2qSXkviz/IGFquiJoTwIRe7pMgrglCWt7fOU
   ly7jLR7gqJ75XuVRx99nWnfkBWyyFeV2dS4f5KfUjgzYe3hvUjHHCCmvK
   JUxYsnCCcQ5Sde7X5Ysv3wJ1M2E6MOVD3g649eIKNjguhlYVSri9CnUaI
   eeuslI5VoK+hkjDKUaATQM7UQ+DbrugA0mVHxMOZiC5gLVnt/sQQfkhuw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="391751862"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="391751862"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 00:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="753333667"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="753333667"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Oct 2023 00:23:14 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwdf5-000BYJ-1g;
	Sat, 28 Oct 2023 07:23:11 +0000
Date: Sat, 28 Oct 2023 15:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	tsbogend@alpha.franken.de, gregory.clement@bootlin.com,
	vladimir.kondratiev@intel.com,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 05/10] MIPS: Refactor mips_cps_core_entry
 implementation
Message-ID: <202310281539.nqlVBqte-lkp@intel.com>
References: <20231027221106.405666-6-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027221106.405666-6-jiaxun.yang@flygoat.com>

Hi Jiaxun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc7 next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiaxun-Yang/MIPS-Export-higher-highest-relocation-functions-in-uasm/20231028-061419
base:   linus/master
patch link:    https://lore.kernel.org/r/20231027221106.405666-6-jiaxun.yang%40flygoat.com
patch subject: [PATCH v2 05/10] MIPS: Refactor mips_cps_core_entry implementation
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310281539.nqlVBqte-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281539.nqlVBqte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281539.nqlVBqte-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/kernel/smp-cps.c: In function 'setup_cps_vecs':
>> arch/mips/kernel/smp-cps.c:150:19: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     150 |         cps_vec = (void *)TO_UNCAC(cps_vec_pa);
         |                   ^


vim +150 arch/mips/kernel/smp-cps.c

   114	
   115	static int __init setup_cps_vecs(void)
   116	{
   117		extern void excep_tlbfill(void);
   118		extern void excep_xtlbfill(void);
   119		extern void excep_cache(void);
   120		extern void excep_genex(void);
   121		extern void excep_intex(void);
   122		extern void excep_ejtag(void);
   123		phys_addr_t cps_vec_pa;
   124		void *cps_vec;
   125	
   126		/* Try to allocate in KSEG1 first */
   127		cps_vec_pa = memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN,
   128							0x0, KSEGX_SIZE - 1);
   129	
   130		if (cps_vec_pa)
   131			core_entry_reg = CKSEG1ADDR(cps_vec_pa) &
   132						CM_GCR_Cx_RESET_BASE_BEVEXCBASE;
   133	
   134		if (!cps_vec_pa && mips_cm_is64) {
   135			cps_vec_pa = memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN,
   136								0x0, SZ_4G - 1);
   137			if (cps_vec_pa)
   138				core_entry_reg = (cps_vec_pa & CM_GCR_Cx_RESET_BASE_BEVEXCBASE) |
   139						CM_GCR_Cx_RESET_BASE_MODE;
   140		}
   141	
   142		if (!cps_vec_pa)
   143			return -ENOMEM;
   144	
   145		/* We want to ensure cache is clean before writing uncached mem */
   146		blast_dcache_range(TO_CAC(cps_vec_pa), TO_CAC(cps_vec_pa) + BEV_VEC_SIZE);
   147		bc_wback_inv(TO_CAC(cps_vec_pa), BEV_VEC_SIZE);
   148		__sync();
   149	
 > 150		cps_vec = (void *)TO_UNCAC(cps_vec_pa);
   151		mips_cps_build_core_entry(cps_vec);
   152	
   153		memcpy(cps_vec + 0x200, &excep_tlbfill, 0x80);
   154		memcpy(cps_vec + 0x280, &excep_xtlbfill, 0x80);
   155		memcpy(cps_vec + 0x300, &excep_cache, 0x80);
   156		memcpy(cps_vec + 0x380, &excep_genex, 0x80);
   157		memcpy(cps_vec + 0x400, &excep_intex, 0x80);
   158		memcpy(cps_vec + 0x480, &excep_ejtag, 0x80);
   159	
   160		/* Make sure no prefetched data in cache */
   161		blast_inv_dcache_range(TO_CAC(cps_vec_pa), TO_CAC(cps_vec_pa) + BEV_VEC_SIZE);
   162		bc_inv(TO_CAC(cps_vec_pa), BEV_VEC_SIZE);
   163		__sync();
   164	
   165		return 0;
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
