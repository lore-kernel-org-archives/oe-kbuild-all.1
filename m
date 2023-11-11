Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF1714270
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5WMT4id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699708796; x=1731244796;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DnZ0H53ajsgPN8i68Xrh6sr9tVRMyOv9h5oMyG99OCQ=;
  b=Z5WMT4idNLsn9NJhbdIzaYvMxDuM2SfN2gjqk3yjdhdXr3JSSqHuAQ/C
   kN6IYjbTCYVvMmlu43ql/rrabafAy7jKXj48B3CbHHaK9l1/ex0glDzyJ
   148yJfbhOO47PxOCZmBhh+Zg3DIPG8Dfjpe22xuULE9hZ/h73bbVNRD9Y
   8lTVbUpihBJU2BGvLFA8EGUwCycmOCh4ILWzX5uToMxTSGv8tAE4nAql9
   XQ4UhnkcUjhLbAZ5MwkETBpqkxGgX35SztrmvvDlkeIjEss4htjBKoQDS
   b5dAAowKjpxfSfuxZv0vwnm73G8e3OOVqQmFoSn13jRok4Y4E5oT+HUhI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476501197"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="476501197"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 05:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="829861141"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="829861141"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Nov 2023 05:19:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ntx-000AT7-0J
	for oe-kbuild-all@lists.linux.dev;
	Sat, 11 Nov 2023 13:19:53 +0000
Date: Sat, 11 Nov 2023 21:19:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_t 11282/30000]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: sparse: sparse: symbol
 'ufshcd_blk_crypto_mode_num_for_alg_dusize' was not declared. Should it be
 static?
Message-ID: <202311112136.pRTK7WYq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: b01c73ea7129745ce9d94b8d3b35663b716cd95b [11282/30000] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231111/202311112136.pRTK7WYq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311112136.pRTK7WYq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112136.pRTK7WYq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/ufs/ufshcd-crypto.c:250:26: sparse: sparse: symbol 'ufshcd_blk_crypto_mode_num_for_alg_dusize' was not declared. Should it be static?
   drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for 'ufshcd_blk_crypto_mode_num_for_alg_dusize' [-Wmissing-prototypes]
     250 | enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd-crypto.c:272: warning: Function parameter or member 'ksm_ops' not described in 'ufshcd_hba_init_crypto_spec'

vim +/ufshcd_blk_crypto_mode_num_for_alg_dusize +250 drivers/scsi/ufs/ufshcd-crypto.c

   249	
 > 250	enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
   251						enum ufs_crypto_alg ufs_crypto_alg,
   252						enum ufs_crypto_key_size key_size)
   253	{
   254		/*
   255		 * This is currently the only mode that UFS and blk-crypto both support.
   256		 */
   257		if (ufs_crypto_alg == UFS_CRYPTO_ALG_AES_XTS &&
   258			key_size == UFS_CRYPTO_KEY_SIZE_256)
   259			return BLK_ENCRYPTION_MODE_AES_256_XTS;
   260	
   261		return BLK_ENCRYPTION_MODE_INVALID;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
