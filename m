Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E717D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 05:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689743106; x=1721279106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18kJ63RjN7hTdGAsNYN9zNvg2GxXChnyj7bav3Eegec=;
  b=nsL3ysbd74JezrjyBnnL8iGbtdg9Ot+pnGGQxMGh1nb040IsAdeWwaXB
   lN29a0cudfm5MjAXkthval7pLSJyt6j14fh3eVFqmQRzOiKjkDstVvtjN
   9Z+/3oqAbQ3VyX0jMZctrLcWPtGV5DsThqiKQrrMHbdAU+VSfWI4j+1Ws
   JwNb1zglItOUaWUI+/geLlTX8RpWcqN3N6AEMiu2C6YmmH+0FFg0ppIUr
   QpxwdKYyytEYNLVAHVayxLf7hFLOT/GDaelWeyzIfUcEHDQvNcuKgkpaN
   TS8x6lUDIGLF+/Gcu6GQA7xUlw480DFcbe0r5woR+Zl1f0MOO842XvowU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="351243180"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="351243180"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 22:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847927210"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="847927210"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 22:05:02 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLzN0-0004AJ-0A;
	Wed, 19 Jul 2023 05:05:02 +0000
Date: Wed, 19 Jul 2023 13:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 3979/12466]
 drivers/base/power/domain.c:260:6: warning: no previous prototype for
 function 'pm_genpd_disable_clks'
Message-ID: <202307191227.5dvzZYDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 01a19a7ad755e54def65a81ac23b93fa5a77cc4d [3979/12466] LF-4713-1 PM: domains: add pm domain clocks support
config: arm64-randconfig-r013-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191227.5dvzZYDX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191227.5dvzZYDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191227.5dvzZYDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:260:6: warning: no previous prototype for function 'pm_genpd_disable_clks' [-Wmissing-prototypes]
   void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
        ^
   drivers/base/power/domain.c:260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   ^
   static 
>> drivers/base/power/domain.c:266:5: warning: no previous prototype for function 'pm_genpd_enable_clks' [-Wmissing-prototypes]
   int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
       ^
   drivers/base/power/domain.c:266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   ^
   static 
   2 warnings generated.


vim +/pm_genpd_disable_clks +260 drivers/base/power/domain.c

   259	
 > 260	void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   261	{
   262		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0)
   263			clk_bulk_disable_unprepare(genpd->num_clks, genpd->clks);
   264	}
   265	
 > 266	int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   267	{
   268		int ret;
   269	
   270		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0) {
   271			ret = clk_bulk_prepare_enable(genpd->num_clks, genpd->clks);
   272			if (ret) {
   273				dev_err(&genpd->dev, "failed to enable clocks\n");
   274				return ret;
   275			}
   276		}
   277	
   278		return 0;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
