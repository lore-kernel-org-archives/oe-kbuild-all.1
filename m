Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B6523D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 05:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hj4lE1hS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699595985; x=1731131985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G1SFGX583DNGsVIuyQbkBIMakhDRK9XrxM2SgsqjPso=;
  b=hj4lE1hS0XfA4y3W3+vNabh0dNGB9CtPARyI//3/Gq/gs8wnL2EZ9Ox+
   jW1o7uNhvup1Kx/O+vYpOAppQv9TXtDe+k5WTyhDIi1yvcWjVIyrSDXz3
   QkVuYlNUc/KmCyPgCvvK4xiyDHAi45EzqKRx31togwAshrlZ/Zw+eBaKz
   JH/Pdc5jpPrE7cTqB/D4Ec5dUDviUQrf+AgYofLsNJ6QuAAgq61eHPIZv
   seTnBOD+2fx3KeYjAbF+6Vhr3yi+vNrX9fGG78ddGnfH1Ez8q53T/E6fW
   m5PpZzAis+n+IStkblnT5VcrSM+YNH5AkepWwR+MocSvNezdEdF7GDygI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389945045"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="389945045"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 21:59:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887268376"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="887268376"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 21:59:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1KYP-0009Ry-06;
	Fri, 10 Nov 2023 05:59:41 +0000
Date: Fri, 10 Nov 2023 13:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2256/27787]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: sparse: sparse: symbol
 'ufshcd_blk_crypto_mode_num_for_alg_dusize' was not declared. Should it be
 static?
Message-ID: <202311101301.J6yGMzXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d43ac48de222318c621dccb5b140e46676779736
commit: b7b3af961465d23a733bb44d4a49bb78d4d5b08f [2256/27787] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-randconfig-122-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101301.J6yGMzXr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101301.J6yGMzXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101301.J6yGMzXr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/ufs/ufshcd-crypto.c:250:26: sparse: sparse: symbol 'ufshcd_blk_crypto_mode_num_for_alg_dusize' was not declared. Should it be static?

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
