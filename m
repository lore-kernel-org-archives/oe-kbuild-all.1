Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437427C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 03:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680578640; x=1712114640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QeKjUcqbMiuafe2rqYJYMRjk3HN16WQxf27Ju+9sZms=;
  b=Ixex/snYBLKdVsgYT83kRwvMieJ4nq5rs/ugw/pba4g6WP87VxiY6j3A
   fq1oOtgyGD65fBGiV8efupyZRec0XU2X+WkulxhJS/u1rjPRsX1CZNzER
   fqggcCZ7i/zY3Kyd2iJ+Ksx0zY4gXldy2m4kR4ZE3NmGNcZmcZH15Zyza
   YeM5tGi4ZEzQHXKONA5nT/6lztX2xoXI6NMYUrWw8i0rMCCepEJBQzyC+
   fN41ZZqAdyuYmN+/zks0UZTpnhlECTPhW4iz6VFiOHO3SvfrU9rGIM9uO
   y8etUqdBeKZUBBK3GwBJCyEhdrJ/GXsaTW+0JJjLoOYSGw4ZqoPnFadv7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="343778749"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="343778749"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 20:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="750759864"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="750759864"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Apr 2023 20:23:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjXH3-000P6t-2J;
	Tue, 04 Apr 2023 03:23:57 +0000
Date: Tue, 4 Apr 2023 11:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 12115/29325]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for
 function 'ufshcd_blk_crypto_mode_num_for_alg_dusize'
Message-ID: <202304041135.KBeeeWHu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Satya,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   e8676808abe2a4dd79bd76700719c360d84b343d
commit: b01c73ea7129745ce9d94b8d3b35663b716cd95b [12115/29325] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041135.KBeeeWHu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout b01c73ea7129745ce9d94b8d3b35663b716cd95b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/scsi/ufs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041135.KBeeeWHu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for function 'ufshcd_blk_crypto_mode_num_for_alg_dusize' [-Wmissing-prototypes]
   enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
                            ^
   drivers/scsi/ufs/ufshcd-crypto.c:250:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
   ^
   static 
   1 warning generated.
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
https://github.com/intel/lkp-tests
