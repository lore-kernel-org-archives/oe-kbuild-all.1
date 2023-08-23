Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BDB15B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 02:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692758761; x=1724294761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQxKenw5ad6uNeRzOaShOE7gaN4KMg5xBamplVGqIso=;
  b=Je4L/6zR7y1dsfNcqENtR3B6VpeI/nScKkxpvgoFJEzhWKPROWPoJoxl
   ZvYWrTil+8hwhfwjJ4a09AUUfQg357+FMc8RyYHWTjsftpILPlYFlhRRK
   UxzmCT+fDWKheEIYxbybcbAIC+r3cIyAsqdEA2Q6DVg8+iGDG40CsfKio
   Qjm7nUMfWElWTSIlbplOIx8/6uSfbd3L6gdNFUFT3ZHVSHaI5/5Z6s4wM
   nu7C4QNt0bLsJMIUXNtRxS9GW8cdfsrkJflN6rPUqhM4zzjqgvnrkQT1W
   PDecqb1q4xQ4n0RDp3AFr3Tbf/YC2zmTj5c2IctcZDnGBrde5QBGXWGUm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359032971"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="359032971"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 19:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="910334533"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="910334533"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 19:45:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYdsc-0000mM-35;
	Wed, 23 Aug 2023 02:45:58 +0000
Date: Wed, 23 Aug 2023 10:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2256/27207]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for
 function 'ufshcd_blk_crypto_mode_num_for_alg_dusize'
Message-ID: <202308231049.pBN8oOoQ-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d62f1fc1623efbeb110e393379097ee39766655d
commit: b7b3af961465d23a733bb44d4a49bb78d4d5b08f [2256/27207] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-randconfig-072-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231049.pBN8oOoQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231049.pBN8oOoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231049.pBN8oOoQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for function 'ufshcd_blk_crypto_mode_num_for_alg_dusize' [-Wmissing-prototypes]
   enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
                            ^
   drivers/scsi/ufs/ufshcd-crypto.c:250:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
   ^
   static 
   1 warning generated.


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
