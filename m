Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E091213ACA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 18:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694890758; x=1726426758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBeuABchE9bAdbZdLQeaxdFRuPjEX9Qtnh5cbNNZLWI=;
  b=e9MHIra6cy9e6LSOOp35FSX9o5AmPU1d/8TTMqZtaHDM70GxQSfOOcps
   lgpQRy0uidumLB2L4hKmGCvoWq4ZScughxlVTPObfSzt/uJrbwecXEW1+
   OqcVqXSV21hkT7odLeOMLLpswlefprj10VK9WX90Jqb6z+TdvAcTGbT1d
   0KH9VrXtbofTX6WAmtXQV/x6MasBI+hVxhQVUg3Wub+4UwPhGBQAwZqUK
   lMYBtAFb77kLdTuJWWOEB6bT7anjR/d+G8b+BSqWTJ2wOdappDfallkXZ
   vsW85nB4hLcL27D8Bxc9yd1I80GZ1etEXKTSwBMuF8Fxi7FUULDvJMhhf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="369767223"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="369767223"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 11:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="888584475"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="888584475"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2023 11:58:38 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhaVf-0004Zq-0L;
	Sat, 16 Sep 2023 18:59:15 +0000
Date: Sun, 17 Sep 2023 02:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 8/32]
 drivers/net/wireless/ath/ath10k/core.c:928:50: warning: '%s' directive
 output may be truncated writing up to 99 bytes into a region of size 93
Message-ID: <202309170205.zVQDKvdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   de10967a8b79627cbe295d7331f84fc9cff3bcef
commit: ab5b9b701262f2f2c916d70b757382da1a64a1d3 [8/32] ZEN: Disable stack conservation for GCC
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230917/202309170205.zVQDKvdE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170205.zVQDKvdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170205.zVQDKvdE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_fetch_board_file':
   drivers/net/wireless/ath/ath10k/core.c:928:50: warning: '%s' directive output may be truncated writing up to 99 bytes into a region of size between 98 and 99 [-Wformat-truncation=]
     928 |         snprintf(filename, sizeof(filename), "%s/%s", dir, file);
         |                                                  ^~
   ......
    1282 |                 ar->normal_mode_fw.board = ath10k_fetch_fw_file(ar,
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~
    1283 |                                                                 ar->hw_params.fw.dir,
         |                                                                 ~~~~~~~~~~~~~~~~~~~~~
    1284 |                                                                 boardname);
         |                                                                 ~~~~~~~~~~
   In function 'ath10k_fetch_fw_file',
       inlined from 'ath10k_core_fetch_board_data_api_1' at drivers/net/wireless/ath/ath10k/core.c:1282:30,
       inlined from 'ath10k_core_fetch_board_file' at drivers/net/wireless/ath/ath10k/core.c:1655:8:
   drivers/net/wireless/ath/ath10k/core.c:928:9: note: 'snprintf' output 2 or more bytes (assuming 102) into a destination of size 100
     928 |         snprintf(filename, sizeof(filename), "%s/%s", dir, file);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_fetch_firmware_files':
>> drivers/net/wireless/ath/ath10k/core.c:928:50: warning: '%s' directive output may be truncated writing up to 99 bytes into a region of size 93 [-Wformat-truncation=]
     928 |         snprintf(filename, sizeof(filename), "%s/%s", dir, file);
         |                                                  ^~
   ......
    1249 |         ar->pre_cal_file = ath10k_fetch_fw_file(ar, ATH10K_FW_DIR, filename);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'ath10k_fetch_fw_file',
       inlined from 'ath10k_fetch_cal_file' at drivers/net/wireless/ath/ath10k/core.c:1249:21,
       inlined from 'ath10k_core_fetch_firmware_files' at drivers/net/wireless/ath/ath10k/core.c:2189:2:
   drivers/net/wireless/ath/ath10k/core.c:928:9: note: 'snprintf' output between 8 and 107 bytes into a destination of size 100
     928 |         snprintf(filename, sizeof(filename), "%s/%s", dir, file);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_fetch_firmware_files':
>> drivers/net/wireless/ath/ath10k/core.c:928:50: warning: '%s' directive output may be truncated writing up to 99 bytes into a region of size 93 [-Wformat-truncation=]
     928 |         snprintf(filename, sizeof(filename), "%s/%s", dir, file);
         |                                                  ^~
   ......
    1257 |         ar->cal_file = ath10k_fetch_fw_file(ar, ATH10K_FW_DIR, filename);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'ath10k_fetch_fw_file',
       inlined from 'ath10k_fetch_cal_file' at drivers/net/wireless/ath/ath10k/core.c:1257:17,
       inlined from 'ath10k_core_fetch_firmware_files' at drivers/net/wireless/ath/ath10k/core.c:2189:2:
   drivers/net/wireless/ath/ath10k/core.c:928:9: note: 'snprintf' output between 8 and 107 bytes into a destination of size 100
     928 |         snprintf(filename, sizeof(filename), "%s/%s", dir, file);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +928 drivers/net/wireless/ath/ath10k/core.c

5e3dd157d7e70f0 Kalle Valo       2013-06-12  913  
5e3dd157d7e70f0 Kalle Valo       2013-06-12  914  static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
5e3dd157d7e70f0 Kalle Valo       2013-06-12  915  						   const char *dir,
5e3dd157d7e70f0 Kalle Valo       2013-06-12  916  						   const char *file)
5e3dd157d7e70f0 Kalle Valo       2013-06-12  917  {
5e3dd157d7e70f0 Kalle Valo       2013-06-12  918  	char filename[100];
5e3dd157d7e70f0 Kalle Valo       2013-06-12  919  	const struct firmware *fw;
5e3dd157d7e70f0 Kalle Valo       2013-06-12  920  	int ret;
5e3dd157d7e70f0 Kalle Valo       2013-06-12  921  
5e3dd157d7e70f0 Kalle Valo       2013-06-12  922  	if (file == NULL)
5e3dd157d7e70f0 Kalle Valo       2013-06-12  923  		return ERR_PTR(-ENOENT);
5e3dd157d7e70f0 Kalle Valo       2013-06-12  924  
5e3dd157d7e70f0 Kalle Valo       2013-06-12  925  	if (dir == NULL)
5e3dd157d7e70f0 Kalle Valo       2013-06-12  926  		dir = ".";
5e3dd157d7e70f0 Kalle Valo       2013-06-12  927  
5e3dd157d7e70f0 Kalle Valo       2013-06-12 @928  	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
c8e028026387ea2 Andres Rodriguez 2018-05-10  929  	ret = firmware_request_nowarn(&fw, filename, ar->dev);
9f5bcfe93315d75 Michal Kazior    2017-02-13  930  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
9f5bcfe93315d75 Michal Kazior    2017-02-13  931  		   filename, ret);
9f5bcfe93315d75 Michal Kazior    2017-02-13  932  
5e3dd157d7e70f0 Kalle Valo       2013-06-12  933  	if (ret)
5e3dd157d7e70f0 Kalle Valo       2013-06-12  934  		return ERR_PTR(ret);
5e3dd157d7e70f0 Kalle Valo       2013-06-12  935  
5e3dd157d7e70f0 Kalle Valo       2013-06-12  936  	return fw;
5e3dd157d7e70f0 Kalle Valo       2013-06-12  937  }
5e3dd157d7e70f0 Kalle Valo       2013-06-12  938  

:::::: The code at line 928 was first introduced by commit
:::::: 5e3dd157d7e70f0e3cea3f2573ed69fb156a19d5 ath10k: mac80211 driver for Qualcomm Atheros 802.11ac CQA98xx devices

:::::: TO: Kalle Valo <kvalo@qca.qualcomm.com>
:::::: CC: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
