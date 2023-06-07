Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD063B3E0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 22:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686178257; x=1717714257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrtc7OFqF4wObZ+DzAl7wp07pLrXRTg0t44dCfjOrTE=;
  b=YLiczbHgTEnbLbnV4nCAwlT7NxM17qJG1lHumAjzFuXRQMkWmrXI3o9/
   VFh+vNT+cRcqC2aY0gbK1FgbyYJguGhLx6lxeQ72Q1wdCkbJXYRxl/n4s
   kdlXQHHbDcBrVv/+qmW9WqhUY3cKTibJISvNN9TSKRdU5xri8/gCNW0D8
   TaNO0sMcavVmmr4RwDjdwEm8l9/f/1I0IEKc2nwiH5t40ZrVY+7AZ7bdG
   SP+JM6evE0hbRaxqwUS/0k6Z5lVqCVJww+OMpeDpoAlaY9OdHYAam/LkR
   WyqQJLjJvmcR4MhY76oG7D8FUlWDoc3UKwmOtNOgbTPRzawKhj9doDP4u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357142242"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="357142242"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 15:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="1039860161"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="1039860161"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2023 15:50:55 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q71zS-0006yh-2R;
	Wed, 07 Jun 2023 22:50:54 +0000
Date: Thu, 8 Jun 2023 06:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2256/26438]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: sparse: sparse: symbol
 'ufshcd_blk_crypto_mode_num_for_alg_dusize' was not declared. Should it be
 static?
Message-ID: <202306080616.NX2RbW6J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   bffea4e72d4ba4e65d29ae653dd47db1f51808b9
commit: b7b3af961465d23a733bb44d4a49bb78d4d5b08f [2256/26438] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: i386-randconfig-s003-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080616.NX2RbW6J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout b7b3af961465d23a733bb44d4a49bb78d4d5b08f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/scsi/ufs/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080616.NX2RbW6J-lkp@intel.com/

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
