Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493B63C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+U9AXQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697900187; x=1729436187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hgva9SVB8kTeinMcZ1tNcH/Lr3ps9gXEEPhhmHEiUGY=;
  b=E+U9AXQoP9Nllt4566UoD3y9ZtoNt3To8Qm4Ov64HGGAPPz6VhrWp8+1
   r3W46t4ygy9RQhIp3IbSxPioUm4cpWlDZisLozStIWkZhPVYD+dakZYRn
   wDkqu+KpK2/s8gDZ0JP71IVBwaonCAzzqafCVpeMFzk0R7Wzex0rHUHxj
   xD3aFP+WkJS8B7BRcBAQ0vKmtd36uhcTadWlBkZLaM8jbEjjsz03vEmLr
   430icpOYzYhY8tQ6e/4Q6n+Ywq21AAN5YbNKzgcDtxJVl5chcYTAma576
   Cann+Uu7SMuMpFB8K5kLirHPuOV5+L3TnAWQNRZR+wr2KKUsZ+kCbkNmM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="472860088"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="472860088"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 07:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="874218843"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="874218843"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2023 07:56:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quDOb-0004wo-0r;
	Sat, 21 Oct 2023 14:56:09 +0000
Date: Sat, 21 Oct 2023 22:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 8/32]
 drivers/net/wireless/ath/ath10k/core.c:928:50: warning: '%s' directive
 output may be truncated writing up to 99 bytes into a region of size 93
Message-ID: <202310212207.XfFj3Z3u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   c44f39dcd5eed0778160b330a32df5d144b5d363
commit: b5f1619b46882ebd4cc029ef4745ec97a98fcb2a [8/32] ZEN: Disable stack conservation for GCC
config: csky-randconfig-002-20231021 (https://download.01.org/0day-ci/archive/20231021/202310212207.XfFj3Z3u-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310212207.XfFj3Z3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212207.XfFj3Z3u-lkp@intel.com/

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

5e3dd157d7e70f Kalle Valo       2013-06-12  913  
5e3dd157d7e70f Kalle Valo       2013-06-12  914  static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
5e3dd157d7e70f Kalle Valo       2013-06-12  915  						   const char *dir,
5e3dd157d7e70f Kalle Valo       2013-06-12  916  						   const char *file)
5e3dd157d7e70f Kalle Valo       2013-06-12  917  {
5e3dd157d7e70f Kalle Valo       2013-06-12  918  	char filename[100];
5e3dd157d7e70f Kalle Valo       2013-06-12  919  	const struct firmware *fw;
5e3dd157d7e70f Kalle Valo       2013-06-12  920  	int ret;
5e3dd157d7e70f Kalle Valo       2013-06-12  921  
5e3dd157d7e70f Kalle Valo       2013-06-12  922  	if (file == NULL)
5e3dd157d7e70f Kalle Valo       2013-06-12  923  		return ERR_PTR(-ENOENT);
5e3dd157d7e70f Kalle Valo       2013-06-12  924  
5e3dd157d7e70f Kalle Valo       2013-06-12  925  	if (dir == NULL)
5e3dd157d7e70f Kalle Valo       2013-06-12  926  		dir = ".";
5e3dd157d7e70f Kalle Valo       2013-06-12  927  
5e3dd157d7e70f Kalle Valo       2013-06-12 @928  	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
c8e028026387ea Andres Rodriguez 2018-05-10  929  	ret = firmware_request_nowarn(&fw, filename, ar->dev);
9f5bcfe93315d7 Michal Kazior    2017-02-13  930  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
9f5bcfe93315d7 Michal Kazior    2017-02-13  931  		   filename, ret);
9f5bcfe93315d7 Michal Kazior    2017-02-13  932  
5e3dd157d7e70f Kalle Valo       2013-06-12  933  	if (ret)
5e3dd157d7e70f Kalle Valo       2013-06-12  934  		return ERR_PTR(ret);
5e3dd157d7e70f Kalle Valo       2013-06-12  935  
5e3dd157d7e70f Kalle Valo       2013-06-12  936  	return fw;
5e3dd157d7e70f Kalle Valo       2013-06-12  937  }
5e3dd157d7e70f Kalle Valo       2013-06-12  938  

:::::: The code at line 928 was first introduced by commit
:::::: 5e3dd157d7e70f0e3cea3f2573ed69fb156a19d5 ath10k: mac80211 driver for Qualcomm Atheros 802.11ac CQA98xx devices

:::::: TO: Kalle Valo <kvalo@qca.qualcomm.com>
:::::: CC: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
