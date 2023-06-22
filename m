Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267822108B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 23:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687475580; x=1719011580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpWYSUu+SpwTY2UQskF+dHCUDDHgb/xJE2XwYsJ54Bo=;
  b=S9W+evziGdqwii1PMbEdzVGfFQ88AiS6Xvf2pJGx1vI2bSTVO3WlxwTf
   BB7CrT3+ZhmKcC4FDk4w/UOOac0ENKLlTX2+l5zn8y5C0PN6bsnzGtAEA
   Q6fjF7fjGcdlIuW9gaQyqwC3KFcC8fAo7ZVGtka9EnQxItqRqDiYpLYcg
   cxC13wY9Kys0Hk83xXt3Irs6MtgG6o7XyCKpiq0YlSEJIdUMfAPd/Qnb0
   3jwzYy+TmhGCXV9CPawfAieyLD5qp3EHypoCSsOZiDeLbTqncv533HEco
   H3+yyDmvM+dGQrqiVzFoiZiZ5LxfkIlxdmXKdXd9DWdlzAolt0LMD4fga
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="358129102"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="358129102"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 16:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="1045427255"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="1045427255"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2023 16:12:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCTTr-0007oC-2Q;
	Thu, 22 Jun 2023 23:12:47 +0000
Date: Fri, 23 Jun 2023 07:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 2934/9881]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 prototype for 'max11801_read_adc'
Message-ID: <202306230751.va9sjcun-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   3260d1af47b1bedfe12b79a26efa184b9a60a8a3
commit: bd34cf3f292d182344cba8955612ed51d4717610 [2934/9881] MLK-11703-1: input: touchscreen: max11801_ts: Add DCM mode for max11801 ADC
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230623/202306230751.va9sjcun-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230751.va9sjcun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230751.va9sjcun-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous prototype for 'max11801_read_adc' [-Wmissing-prototypes]
     148 | u32 max11801_read_adc(void)
         |     ^~~~~~~~~~~~~~~~~


vim +/max11801_read_adc +148 drivers/input/touchscreen/max11801_ts.c

   147	
 > 148	u32 max11801_read_adc(void)
   149	{
   150		u32 adc_data;
   151	
   152		if (!max11801_client) {
   153			pr_err("FAIL  max11801_client not initialize\n");
   154			return -1;
   155		}
   156		adc_data = max11801_dcm_sample_aux(max11801_client);
   157	
   158		return adc_data;
   159	}
   160	EXPORT_SYMBOL_GPL(max11801_read_adc);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
