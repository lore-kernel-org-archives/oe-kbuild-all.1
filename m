Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D26185B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 09:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692611814; x=1724147814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u10SPeTiIr1iJBWGRAw5xH7DphDxRIywnKua8TAZAtE=;
  b=Pvq1G+dF8OhEn9AUpbf/k68tWmi1JNT1jt4SxD5aLX4JbtOvIQGoxaxg
   R2/bs8JBaCsjEsxez3WAC8xQ4W0WAQr2OL5+HhVdF/pbizJtZV8nUyXqx
   T8m51vcmi+XuD6eSxB0PLhY7D2Uu+8jdc+Qj6OWcKBT5ldIn2ZVsaqvT0
   RHTRWWrkd44KGHmOqzvNmi/I9W+wuq5fzMcPTim4H4Ph+XJRgdvURGqkW
   ttpHJqRgTIDTzJiH3jPkaCJcq/15ZuO9jr39y52/CUF6s7MIMLbYGKJzH
   8vLQTpIS53va2Rnz41VXUAwyHYjAiyfSINFyxo1EG7aChzLyDLfTKRfqy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="363707498"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="363707498"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 02:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770885116"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="770885116"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 02:56:51 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY1eU-0000Ng-1P;
	Mon, 21 Aug 2023 09:56:50 +0000
Date: Mon, 21 Aug 2023 17:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: "sw.multimedia" <sw.multimedia@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"jack.zhu" <jack.zhu@starfivetech.com>,
	"keith.zhao" <keith.zhao@starfivetech.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: [esmil:visionfive 53/59]
 drivers/gpu/drm/starfive/starfive_drm_gem.c:17:42: warning: 'mmap_mem_ops'
 defined but not used
Message-ID: <202308211751.mGGf4GC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   a6b7b4fc1e5719be8b5897f31b9326100f945d51
commit: cd449db0cf6e75db28c9fcefc5a588d39265c167 [53/59] drm/starfive: Add StarFive drm driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230821/202308211751.mGGf4GC1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308211751.mGGf4GC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308211751.mGGf4GC1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/starfive/starfive_drm_gem.c:17:42: warning: 'mmap_mem_ops' defined but not used [-Wunused-const-variable=]
      17 | static const struct vm_operations_struct mmap_mem_ops = {
         |                                          ^~~~~~~~~~~~


vim +/mmap_mem_ops +17 drivers/gpu/drm/starfive/starfive_drm_gem.c

    15	
    16	static const struct drm_gem_object_funcs starfive_gem_object_funcs;
  > 17	static const struct vm_operations_struct mmap_mem_ops = {
    18	#ifdef CONFIG_HAVE_IOREMAP_PROT
    19		.access = generic_access_phys
    20	#endif
    21	};
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
