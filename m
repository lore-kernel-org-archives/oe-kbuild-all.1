Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CFA65B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 01:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UB95bAiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702519044; x=1734055044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NnbzYOWGZweEC3nk9Kynd9O6zWSw1MnE6hKaXG8RDBg=;
  b=UB95bAiVcz9RdPgtBSXw/r2mEpuXBRjP5kmjRyy5kqvWDjzGT17XXRp3
   3Lx6toVZtnLLnz2L/8/cCVwInGM95ir2KkernVw+FmFa+qeQpHFDmMBpt
   iiM306ClEKscQZVWyoowQY/T9smZhYe2+ZOMcop/r/T0e1EK6Ih1kk6Js
   qtMAd6QoqNcm2MPDqochevJo+JvOjz60F7dukN9dWmfHGrbVDjGGT6QAc
   aknqd0txFFdINMZMtxPMDE6wgu38FYj8ssD4MA1JAFA21gdTQCnTmWCaX
   dEXW2xbP/o4Ibl3FfDVUut1qGAGkIogE13CTg/ECZY6R4QIoBtgEkghx0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8450347"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="8450347"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 17:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844534199"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="844534199"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2023 17:57:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDayV-000LPP-26;
	Thu, 14 Dec 2023 01:57:19 +0000
Date: Thu, 14 Dec 2023 09:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Borislav Petkov <bp@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/edac/cpc925_edac.c:314:40: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202312140910.pdMaZpsA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: e3c4ff6d8c949fa9a9ea1bd005bf1967efe09d5d EDAC: Remove EDAC_MM_EDAC
date:   7 years ago
config: powerpc64-randconfig-r113-20231118 (https://download.01.org/0day-ci/archive/20231214/202312140910.pdMaZpsA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312140910.pdMaZpsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140910.pdMaZpsA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/edac/cpc925_edac.c:314:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *cell @@     got unsigned int const *[assigned] reg @@
   drivers/edac/cpc925_edac.c:314:40: sparse:     expected restricted __be32 const [usertype] *cell
   drivers/edac/cpc925_edac.c:314:40: sparse:     got unsigned int const *[assigned] reg
   drivers/edac/cpc925_edac.c:316:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *cell @@     got unsigned int const *[assigned] reg @@
   drivers/edac/cpc925_edac.c:316:39: sparse:     expected restricted __be32 const [usertype] *cell
   drivers/edac/cpc925_edac.c:316:39: sparse:     got unsigned int const *[assigned] reg
   In file included from drivers/edac/cpc925_edac.c:22:
   include/linux/module.h:131:13: warning: 'init_module' specifies less restrictive attribute than its target 'cpc925_edac_init': 'cold' [-Wmissing-attributes]
     131 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/edac/cpc925_edac.c:1091:1: note: in expansion of macro 'module_init'
    1091 | module_init(cpc925_edac_init);
         | ^~~~~~~~~~~
   drivers/edac/cpc925_edac.c:1067:19: note: 'init_module' target declared here
    1067 | static int __init cpc925_edac_init(void)
         |                   ^~~~~~~~~~~~~~~~
   include/linux/module.h:137:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'cpc925_edac_exit': 'cold' [-Wmissing-attributes]
     137 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/edac/cpc925_edac.c:1092:1: note: in expansion of macro 'module_exit'
    1092 | module_exit(cpc925_edac_exit);
         | ^~~~~~~~~~~
   drivers/edac/cpc925_edac.c:1086:20: note: 'cleanup_module' target declared here
    1086 | static void __exit cpc925_edac_exit(void)
         |                    ^~~~~~~~~~~~~~~~

vim +314 drivers/edac/cpc925_edac.c

2a9036afffb3a17 Harry Ciao  2009-06-17  294  
2a9036afffb3a17 Harry Ciao  2009-06-17  295  /* Get total memory size from Open Firmware DTB */
2a9036afffb3a17 Harry Ciao  2009-06-17  296  static void get_total_mem(struct cpc925_mc_pdata *pdata)
2a9036afffb3a17 Harry Ciao  2009-06-17  297  {
2a9036afffb3a17 Harry Ciao  2009-06-17  298  	struct device_node *np = NULL;
2a9036afffb3a17 Harry Ciao  2009-06-17  299  	const unsigned int *reg, *reg_end;
2a9036afffb3a17 Harry Ciao  2009-06-17  300  	int len, sw, aw;
2a9036afffb3a17 Harry Ciao  2009-06-17  301  	unsigned long start, size;
2a9036afffb3a17 Harry Ciao  2009-06-17  302  
2a9036afffb3a17 Harry Ciao  2009-06-17  303  	np = of_find_node_by_type(NULL, "memory");
2a9036afffb3a17 Harry Ciao  2009-06-17  304  	if (!np)
2a9036afffb3a17 Harry Ciao  2009-06-17  305  		return;
2a9036afffb3a17 Harry Ciao  2009-06-17  306  
2a9036afffb3a17 Harry Ciao  2009-06-17  307  	aw = of_n_addr_cells(np);
2a9036afffb3a17 Harry Ciao  2009-06-17  308  	sw = of_n_size_cells(np);
2a9036afffb3a17 Harry Ciao  2009-06-17  309  	reg = (const unsigned int *)of_get_property(np, "reg", &len);
2a9036afffb3a17 Harry Ciao  2009-06-17  310  	reg_end = reg + len/4;
2a9036afffb3a17 Harry Ciao  2009-06-17  311  
2a9036afffb3a17 Harry Ciao  2009-06-17  312  	pdata->total_mem = 0;
2a9036afffb3a17 Harry Ciao  2009-06-17  313  	do {
2a9036afffb3a17 Harry Ciao  2009-06-17 @314  		start = of_read_number(reg, aw);
2a9036afffb3a17 Harry Ciao  2009-06-17  315  		reg += aw;
2a9036afffb3a17 Harry Ciao  2009-06-17  316  		size = of_read_number(reg, sw);
2a9036afffb3a17 Harry Ciao  2009-06-17  317  		reg += sw;
956b9ba156dbfdb Joe Perches 2012-04-29  318  		edac_dbg(1, "start 0x%lx, size 0x%lx\n", start, size);
2a9036afffb3a17 Harry Ciao  2009-06-17  319  		pdata->total_mem += size;
2a9036afffb3a17 Harry Ciao  2009-06-17  320  	} while (reg < reg_end);
2a9036afffb3a17 Harry Ciao  2009-06-17  321  
2a9036afffb3a17 Harry Ciao  2009-06-17  322  	of_node_put(np);
956b9ba156dbfdb Joe Perches 2012-04-29  323  	edac_dbg(0, "total_mem 0x%lx\n", pdata->total_mem);
2a9036afffb3a17 Harry Ciao  2009-06-17  324  }
2a9036afffb3a17 Harry Ciao  2009-06-17  325  

:::::: The code at line 314 was first introduced by commit
:::::: 2a9036afffb3a174e980f90eb507c5aea6b540f6 edac: add CPC925 Memory Controller driver

:::::: TO: Harry Ciao <qingtao.cao@windriver.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
