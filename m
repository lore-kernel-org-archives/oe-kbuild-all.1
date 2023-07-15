Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919CD7EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 01:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689382865; x=1720918865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qae8LkAdac1mrXHjHYmeeqNWu0ATtPc3MFWkcc6vvL4=;
  b=neBwX1bamzwAuHoumLyh80IzcLTTXCrGq0Xjx1l6Y+BGqKBtnBXo3L6y
   +cUSRcOJ/578PCH33/7SbHYDL2kIlZSRYMCfpfvP+MQR4+7N4AAHShMp1
   hde/bNTsi0+tf0klKrt2gwsufUBN6UVkesZtGBqs0qte2ya3puKiMwepn
   ri1klhCF/bXrKZtO/XastYiIey+lguLvT8OLKwCAdPLOM4dorSirF0ipr
   7ZmzOcsERfhzPaV7mrX0Z4pQrCvNphxlrEL6upJwoTevo7uvVkRYqaiSB
   DUbPUOL1TRGZ4FkShtoCFstKA6ydMnuIE27oxheQnlWWm2ch/0FWf3JXT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="431790850"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="431790850"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 18:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="846659625"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="846659625"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Jul 2023 18:00:47 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKTeQ-0007nh-21;
	Sat, 15 Jul 2023 01:00:46 +0000
Date: Sat, 15 Jul 2023 08:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:arm64-gcs 1/48] include/linux/pgtable.h:528:16: error:
 implicit declaration of function 'pmd_mkwrite_novma'; did you mean
 'pte_mkwrite_novma'?
Message-ID: <202307150826.lvF1KJkK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   e90b1663883e49f3f5aef612fde57503c21ad1ad
commit: 7a8d3d70c8ecb0b3392221a446051a64f9cbadda [1/48] mm: Rename arch pte_mkwrite()'s to pte_mkwrite_novma()
config: sparc-randconfig-r015-20230714 (https://download.01.org/0day-ci/archive/20230715/202307150826.lvF1KJkK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150826.lvF1KJkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150826.lvF1KJkK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:29,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/pci.h:2593,
                    from arch/sparc/lib/iomap.c:5:
   include/linux/pgtable.h: In function 'pmd_mkwrite':
>> include/linux/pgtable.h:528:16: error: implicit declaration of function 'pmd_mkwrite_novma'; did you mean 'pte_mkwrite_novma'? [-Werror=implicit-function-declaration]
     528 |         return pmd_mkwrite_novma(pmd);
         |                ^~~~~~~~~~~~~~~~~
         |                pte_mkwrite_novma
>> include/linux/pgtable.h:528:16: error: incompatible types when returning type 'int' but 'pmd_t' was expected
     528 |         return pmd_mkwrite_novma(pmd);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +528 include/linux/pgtable.h

   524	
   525	#if defined(CONFIG_HAS_HUGE_PAGE) && !defined(pmd_mkwrite)
   526	static inline pmd_t pmd_mkwrite(pmd_t pmd)
   527	{
 > 528		return pmd_mkwrite_novma(pmd);
   529	}
   530	#endif
   531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
