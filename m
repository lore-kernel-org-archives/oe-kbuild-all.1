Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCAB946F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693562862; x=1725098862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vMXbBJe4notA3fi7nOfWIn3pdVW8zNmGT5BMd+ucitA=;
  b=jLBjvGCqpaKsJbIyhIhEedfIhfVxxYntmQzFcWS3T03p3k791j1coq+f
   MO+Y1nRQfcEXbo0imoaoOuoNwNHG+B433xcE8rnZ2OqF+nN8KQPOl6K7F
   kePHugz4Je8ZWPXyNTh9Ei27r4xUXE1BsxagJrXmlk76MTceOhaMq6/pa
   hvFv1BiIVXo+OYjxw8Xxtc5zHJmvtJ6EjP8FRKDMH3QM+ZNsBOgbRJkvs
   KDUwXiYwWKBYecmuJWBaxCdc8wn95ttyEbojUZBUNCH3DpAH+GVhwJv66
   Om+2YnM3MlofD+W+LqDiW+CPoZ9UIJrdGnz9ZFrIHUK/7Aq+IDRFM66xT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373579929"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="373579929"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 03:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883128383"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="883128383"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 03:07:36 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc13r-0001Ad-34;
	Fri, 01 Sep 2023 10:07:31 +0000
Date: Fri, 1 Sep 2023 18:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6094/24603]
 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:64:5: warning: "CONFIG_PM" is not
 defined, evaluates to 0
Message-ID: <202309011812.THxz4GHq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: ba7179b2e4a0549e119cc83c5dfe5eb013cef3c2 [6094/24603] Merge remote-tracking branch 'origin/display/dsim' into display/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309011812.THxz4GHq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011812.THxz4GHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011812.THxz4GHq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:64:5: warning: "CONFIG_PM" is not defined, evaluates to 0 [-Wundef]
      64 | #if CONFIG_PM
         |     ^~~~~~~~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: In function 'sec_dsim_of_parse_resets':
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:291:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     291 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: At top level:
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:72:12: warning: 'imx_sec_dsim_runtime_resume' defined but not used [-Wunused-function]
      72 | static int imx_sec_dsim_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:68:12: warning: 'imx_sec_dsim_runtime_suspend' defined but not used [-Wunused-function]
      68 | static int imx_sec_dsim_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_PM +64 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c

25799de94b286c Fancy Fang 2018-06-06  63  
b5a7aa6c474c92 Fancy Fang 2018-07-02 @64  #if CONFIG_PM
b5a7aa6c474c92 Fancy Fang 2018-07-02  65  static int imx_sec_dsim_runtime_suspend(struct device *dev);
b5a7aa6c474c92 Fancy Fang 2018-07-02  66  static int imx_sec_dsim_runtime_resume(struct device *dev);
b5a7aa6c474c92 Fancy Fang 2018-07-02  67  #else
b5a7aa6c474c92 Fancy Fang 2018-07-02 @68  static int imx_sec_dsim_runtime_suspend(struct device *dev)
b5a7aa6c474c92 Fancy Fang 2018-07-02  69  {
b5a7aa6c474c92 Fancy Fang 2018-07-02  70  	return 0;
b5a7aa6c474c92 Fancy Fang 2018-07-02  71  }
b5a7aa6c474c92 Fancy Fang 2018-07-02 @72  static int imx_sec_dsim_runtime_resume(struct device *dev)
b5a7aa6c474c92 Fancy Fang 2018-07-02  73  {
b5a7aa6c474c92 Fancy Fang 2018-07-02  74  	return 0;
b5a7aa6c474c92 Fancy Fang 2018-07-02  75  }
b5a7aa6c474c92 Fancy Fang 2018-07-02  76  #endif
b5a7aa6c474c92 Fancy Fang 2018-07-02  77  

:::::: The code at line 64 was first introduced by commit
:::::: b5a7aa6c474c926d8d7d919ebdb84ac3dfb328bd MLK-19017-6 drm/imx: add system pm support for SEC DSIM

:::::: TO: Fancy Fang <chen.fang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
