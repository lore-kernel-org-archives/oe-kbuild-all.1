Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A223112B86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693246158; x=1724782158;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+pmqR/WUEaPo+U6xjIho/O5UCou/EgFhDSf1375h/4U=;
  b=n1ui11ni08YwSZTrxQmGeh+YF5s//EWQ/8bP2eUBBLs1vN4ovYIfNlGU
   bT+V9+3EuSMxRjoAP4UjLk1TaKI2UjZOdJSfigDoKMvT+3miRTu55sUyc
   2uOzbKWmVlLgUDGgJuDXRNIWZl5Bc1BV9iLDwxb7UwhYqc5BpxzWk8/2C
   zb/oU/ytcx0d13CRp8zlaCiyLe9uSPyipjYCgC9g3bTRKENB1YanFuORt
   tZ17nNAoRoHZZjrTL480ymlTMjxB4w9l0PYAsVEEqz6wPSHIemYRClJYN
   keHcqsTuphFv69WGmSjbRHCTiAiSEn8ET7LNhLPHhcBG7veLwQEfKuxle
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354691929"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="354691929"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 11:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="861916151"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="861916151"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Aug 2023 11:09:14 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qagfp-00085z-2e
	for oe-kbuild-all@lists.linux.dev;
	Mon, 28 Aug 2023 18:09:13 +0000
Date: Tue, 29 Aug 2023 02:09:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2251/26832]
 kernel/irq_work.c:52:13: warning: no previous prototype for
 'irq_local_work_raise'
Message-ID: <202308290234.vbShSVpb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ef4cd214d7c9836eb64fced61f30c02eadf8a91c
commit: 2d5253bea505b64cf79922d14e34f1411e1b9b95 [2251/26832] genirq: irq_pipeline: add IRQ pipeline core
config: sparc-randconfig-r014-20230828 (https://download.01.org/0day-ci/archive/20230829/202308290234.vbShSVpb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290234.vbShSVpb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290234.vbShSVpb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq_work.c:45:13: warning: no previous prototype for 'arch_irq_work_raise' [-Wmissing-prototypes]
      45 | void __weak arch_irq_work_raise(void)
         |             ^~~~~~~~~~~~~~~~~~~
>> kernel/irq_work.c:52:13: warning: no previous prototype for 'irq_local_work_raise' [-Wmissing-prototypes]
      52 | void __weak irq_local_work_raise(void)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/irq_local_work_raise +52 kernel/irq_work.c

    44	
  > 45	void __weak arch_irq_work_raise(void)
    46	{
    47		/*
    48		 * Lame architectures will get the timer tick callback
    49		 */
    50	}
    51	
  > 52	void __weak irq_local_work_raise(void)
    53	{
    54		arch_irq_work_raise();
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
