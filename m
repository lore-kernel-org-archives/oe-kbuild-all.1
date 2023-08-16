Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15108D2F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 22:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692225517; x=1723761517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CwmH146Zl/EtHcKmzJkS5MTRZiLXbt12cugSMdlcWls=;
  b=GPrvyjs/S9fayad9x8OUTzXh+boslwMbF6mUKnXeiY6hmV5/CaGUQ8B5
   29MquscgC4oI8HPlve6GcdWZyOvQOL5RG4rexyXoTWuig8Yl7MMt+I3zS
   EUXw3TRbPXt0ZxKy/d5bFu8VKc2khx6RCZdLn5PXv2L8W87jVGWDwTF3p
   FcoXnRB4y3iA7LH3qnOnwBTOA/p8dWERDX6Cd+bciFATpA7WeQJz4shgN
   iFqvyvyuixAwla1ccUHiTGoZgc3bTsAPIasLZzeSr369/uoJapKbE8P4M
   PpEI28uKuxnlUTOxS7XkW3XDKXXjuehDvum2EftyemFf91sud5hr0SDxn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352973397"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="352973397"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 15:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763795057"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="763795057"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 15:38:34 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWP9h-0000cp-23;
	Wed, 16 Aug 2023 22:38:22 +0000
Date: Thu, 17 Aug 2023 06:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 12045/30000]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous declaration
 for 'ufshcd_blk_crypto_mode_num_for_alg_dusize'
Message-ID: <202308170619.WBVecfFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a89c7b9715e2d482a08b58b698f0cf37da373070
commit: b01c73ea7129745ce9d94b8d3b35663b716cd95b [12045/30000] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-randconfig-x076-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170619.WBVecfFx-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170619.WBVecfFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170619.WBVecfFx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous declaration for 'ufshcd_blk_crypto_mode_num_for_alg_dusize' [-Wmissing-declarations]
    enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
