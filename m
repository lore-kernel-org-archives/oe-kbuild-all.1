Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2135E1944C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKwdN10W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701264088; x=1732800088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dY08exS+VlJxdOCpgbGs2hSpaVvNOEytGROjyViMRUc=;
  b=WKwdN10W1Tj8F/A0MqWBGK5NeqcEp2jkLKcEH23AQK8rL7LjAdj2RaPq
   bzF+mQclKrUkxD5gtwnDpeXfdW3UYykVh6ykO0k/YyGSfdnLiMkQYd2El
   d+krcibLVCX0EgknQJDqwQ5m8XvacjrnLO4I6rHoA4fePzqwCzvJfiqdA
   hhKpcwRanTQetXc2kpt0VfqN6v9o1bgR9cIc+GCCrDlG0vPA6TSmcvD6x
   8i3t7JCjTQ0wNqwrMVAPZI3BeLiJ72IUycuGE6vyWek1tIwdtHl3MY2ur
   hofXf4NOuldPVu6Lb6DBs2cDUM8N7apcFt27yd7E/lbikYWS024xiKxki
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392904988"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392904988"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768918600"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="768918600"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Nov 2023 05:21:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8KVG-0000H2-2T;
	Wed, 29 Nov 2023 13:21:22 +0000
Date: Wed, 29 Nov 2023 21:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3681/3829] arch/sparc/mm/init_64.c:2220:23:
 warning: variable 'pagecv_flag' set but not used
Message-ID: <202311292022.U9pg0esq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f5c003694fab4b1ba6cbdcc417488b975c088d0
commit: 520f30b8bba1b0f078a382bd3859f176a2126a03 [3681/3829] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
config: sparc-randconfig-002-20231129 (https://download.01.org/0day-ci/archive/20231129/202311292022.U9pg0esq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311292022.U9pg0esq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292022.U9pg0esq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/mm/init_64.c: In function 'arch_hugetlb_valid_size':
   arch/sparc/mm/init_64.c:361:24: warning: variable 'hv_pgsz_idx' set but not used [-Wunused-but-set-variable]
     361 |         unsigned short hv_pgsz_idx;
         |                        ^~~~~~~~~~~
   arch/sparc/mm/init_64.c: In function 'sun4v_linear_pte_xor_finalize':
>> arch/sparc/mm/init_64.c:2220:23: warning: variable 'pagecv_flag' set but not used [-Wunused-but-set-variable]
    2220 |         unsigned long pagecv_flag;
         |                       ^~~~~~~~~~~


vim +/pagecv_flag +2220 arch/sparc/mm/init_64.c

c69ad0a3f7d871 David S. Miller 2012-09-06  2217  
c69ad0a3f7d871 David S. Miller 2012-09-06  2218  static void __init sun4v_linear_pte_xor_finalize(void)
c69ad0a3f7d871 David S. Miller 2012-09-06  2219  {
494e5b6faeda1d Khalid Aziz     2015-05-27 @2220  	unsigned long pagecv_flag;
494e5b6faeda1d Khalid Aziz     2015-05-27  2221  
494e5b6faeda1d Khalid Aziz     2015-05-27  2222  	/* Bit 9 of TTE is no longer CV bit on M7 processor and it instead
494e5b6faeda1d Khalid Aziz     2015-05-27  2223  	 * enables MCD error. Do not set bit 9 on M7 processor.
494e5b6faeda1d Khalid Aziz     2015-05-27  2224  	 */
494e5b6faeda1d Khalid Aziz     2015-05-27  2225  	switch (sun4v_chip_type) {
494e5b6faeda1d Khalid Aziz     2015-05-27  2226  	case SUN4V_CHIP_SPARC_M7:
7d484acb2f9064 Allen Pais      2017-07-24  2227  	case SUN4V_CHIP_SPARC_M8:
c5b8b5beee1e2a Khalid Aziz     2016-04-19  2228  	case SUN4V_CHIP_SPARC_SN:
494e5b6faeda1d Khalid Aziz     2015-05-27  2229  		pagecv_flag = 0x00;
494e5b6faeda1d Khalid Aziz     2015-05-27  2230  		break;
494e5b6faeda1d Khalid Aziz     2015-05-27  2231  	default:
494e5b6faeda1d Khalid Aziz     2015-05-27  2232  		pagecv_flag = _PAGE_CV_4V;
494e5b6faeda1d Khalid Aziz     2015-05-27  2233  		break;
494e5b6faeda1d Khalid Aziz     2015-05-27  2234  	}
c69ad0a3f7d871 David S. Miller 2012-09-06  2235  #ifndef CONFIG_DEBUG_PAGEALLOC
c69ad0a3f7d871 David S. Miller 2012-09-06  2236  	if (cpu_pgsz_mask & HV_PGSZ_MASK_256MB) {
c69ad0a3f7d871 David S. Miller 2012-09-06  2237  		kern_linear_pte_xor[1] = (_PAGE_VALID | _PAGE_SZ256MB_4V) ^
922631b988d8cb David S. Miller 2013-09-18  2238  			PAGE_OFFSET;
494e5b6faeda1d Khalid Aziz     2015-05-27  2239  		kern_linear_pte_xor[1] |= (_PAGE_CP_4V | pagecv_flag |
c69ad0a3f7d871 David S. Miller 2012-09-06  2240  					   _PAGE_P_4V | _PAGE_W_4V);
c69ad0a3f7d871 David S. Miller 2012-09-06  2241  	} else {
c69ad0a3f7d871 David S. Miller 2012-09-06  2242  		kern_linear_pte_xor[1] = kern_linear_pte_xor[0];
c69ad0a3f7d871 David S. Miller 2012-09-06  2243  	}
c69ad0a3f7d871 David S. Miller 2012-09-06  2244  
c69ad0a3f7d871 David S. Miller 2012-09-06  2245  	if (cpu_pgsz_mask & HV_PGSZ_MASK_2GB) {
c69ad0a3f7d871 David S. Miller 2012-09-06  2246  		kern_linear_pte_xor[2] = (_PAGE_VALID | _PAGE_SZ2GB_4V) ^
922631b988d8cb David S. Miller 2013-09-18  2247  			PAGE_OFFSET;
494e5b6faeda1d Khalid Aziz     2015-05-27  2248  		kern_linear_pte_xor[2] |= (_PAGE_CP_4V | pagecv_flag |
c69ad0a3f7d871 David S. Miller 2012-09-06  2249  					   _PAGE_P_4V | _PAGE_W_4V);
c69ad0a3f7d871 David S. Miller 2012-09-06  2250  	} else {
c69ad0a3f7d871 David S. Miller 2012-09-06  2251  		kern_linear_pte_xor[2] = kern_linear_pte_xor[1];
c69ad0a3f7d871 David S. Miller 2012-09-06  2252  	}
c69ad0a3f7d871 David S. Miller 2012-09-06  2253  
c69ad0a3f7d871 David S. Miller 2012-09-06  2254  	if (cpu_pgsz_mask & HV_PGSZ_MASK_16GB) {
c69ad0a3f7d871 David S. Miller 2012-09-06  2255  		kern_linear_pte_xor[3] = (_PAGE_VALID | _PAGE_SZ16GB_4V) ^
922631b988d8cb David S. Miller 2013-09-18  2256  			PAGE_OFFSET;
494e5b6faeda1d Khalid Aziz     2015-05-27  2257  		kern_linear_pte_xor[3] |= (_PAGE_CP_4V | pagecv_flag |
c69ad0a3f7d871 David S. Miller 2012-09-06  2258  					   _PAGE_P_4V | _PAGE_W_4V);
c69ad0a3f7d871 David S. Miller 2012-09-06  2259  	} else {
c69ad0a3f7d871 David S. Miller 2012-09-06  2260  		kern_linear_pte_xor[3] = kern_linear_pte_xor[2];
c69ad0a3f7d871 David S. Miller 2012-09-06  2261  	}
c69ad0a3f7d871 David S. Miller 2012-09-06  2262  #endif
c69ad0a3f7d871 David S. Miller 2012-09-06  2263  }
c69ad0a3f7d871 David S. Miller 2012-09-06  2264  

:::::: The code at line 2220 was first introduced by commit
:::::: 494e5b6faeda1d1e830a13e10b3c7bc323f35d97 sparc: Resolve conflict between sparc v9 and M7 on usage of bit 9 of TTE

:::::: TO: Khalid Aziz <khalid.aziz@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
