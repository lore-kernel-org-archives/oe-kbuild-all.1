Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7DBD2E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675754629; x=1707290629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLfTzJBty4AxR7P6ydUyf7tbTUo2O1IGIThvsYckKp4=;
  b=fyJzoKfs99jqOk0cl6tMV7RKYYpKfmdDNg8Grm24RuMMGqJ/kI6+8olT
   w0M2FZdkaRtoGogEeK2IZG3uiSDH29cKo+Qk86mEEZ7Fcuy0NRal4fyhw
   sDb5xLVf89kCjq3wfAIieBegh0AhuiWNw9Rs6Lfkne+OX7aC+RSWNT0d1
   c3V7uwCekPnFgryRsYUcZcl+46UDtDNw+nm+2KMD1flTD4vJfVG8Cnb92
   L3BY/IS2vlRksUciJKXMj/NlNduGSF00Zobv/j5B4/vIPxtKeDw38oEgO
   8lq6C6agbRi/arBnuwTR0JFp5Z8ni2+pVAEogwm4HcvMIwjYFoCmgXBeu
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309074210"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="309074210"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 23:23:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="616706016"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="616706016"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Feb 2023 23:23:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPIKP-0003GM-1r;
	Tue, 07 Feb 2023 07:23:45 +0000
Date: Tue, 7 Feb 2023 15:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 12115/28826]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for
 function 'ufshcd_blk_crypto_mode_num_for_alg_dusize'
Message-ID: <202302071521.s4MLk5Cy-lkp@intel.com>
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
head:   e30e26520b6013d387aad21658e609fb663a9f35
commit: b01c73ea7129745ce9d94b8d3b35663b716cd95b [12115/28826] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-randconfig-a001-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071521.s4MLk5Cy-lkp@intel.com/config)
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
