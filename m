Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93532F2F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689000801; x=1720536801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ktmylRA31eje8Xk+BLYZxWtSQFDUeP+hW2tupW9u8s=;
  b=jlWJAI/h+MH4oYo8F7H+NHZx6YfmwSB46PoSQZyOYBpRoxfhkPJoqvWO
   4i6hjp0yHnllW5LWwG0YmEXH7A+7FOCLGAX1WH5wj6cIUYWJ15OKkfrAH
   rAL9HhwGQFm1A8LkQNCAsfn5ciKa2IM6a0N5tkmDNi8ZOYP3LCP5ljbGp
   NCpHCDxrDsNjb7+MKLWTknBHP7Bog9S1np7CoN3lp+qdeALj35pESA5wr
   gOz6vyE6B74c86947gDjssj4MIXIFTnqssgV4mbScP7b0kPKWxrArnCrf
   lY1IwPoA8CG0w0FenE7mwJNNf8+JEdPpC5xjTicIbRuNiQOenfLSkzTJl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="364402036"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="364402036"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 07:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="834304762"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="834304762"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2023 07:53:19 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIsGM-0003lw-1y;
	Mon, 10 Jul 2023 14:53:18 +0000
Date: Mon, 10 Jul 2023 22:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2256/26452]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for
 function 'ufshcd_blk_crypto_mode_num_for_alg_dusize'
Message-ID: <202307102223.xkH9yg5o-lkp@intel.com>
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
head:   12d0946b1cd8bb830ae7ceb9af1b6771becab5d9
commit: b7b3af961465d23a733bb44d4a49bb78d4d5b08f [2256/26452] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-randconfig-r025-20230710 (https://download.01.org/0day-ci/archive/20230710/202307102223.xkH9yg5o-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307102223.xkH9yg5o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307102223.xkH9yg5o-lkp@intel.com/

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
