Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FB9625
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 03:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686801478; x=1718337478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/CIVTfNmsUxyembVt069GGZYVNHbOxF6u7mgwiM08g=;
  b=HPEObo9gkdWwoomgJFbtzWPDO24vVlFGN9KQzfuJvqlQs0+lbrv1rKFp
   Yfx8+YLmDVX3eUISqQPXpv+t0Bnqs3S/gIo4U1cRMboYf5xIRfWIeEvBp
   BFcMoiH89mfWoyRR+kkYep4xMrU9/w5Ht7uT3maI9k7GMOiZWOkTZlBys
   znsrBMghaTOaGpLu5mQICXE7QSo2kYjPUgmGMEFREPQiY6e6vE+oUeeT5
   X56ZZyN3PaBtABLSFneI8lgELhMD2IsWUJWg2DOPhWhjid/uzeQDXMAVb
   /ermq6Fw7R0IOL/DECt25syBEQ9L18qNvNskWsaj0J9qaAxX5BNnZEb66
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="356295874"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="356295874"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 20:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="856774277"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="856774277"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2023 20:57:57 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9e7I-0001Oj-35;
	Thu, 15 Jun 2023 03:57:52 +0000
Date: Thu, 15 Jun 2023 11:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 375/27777] htmldocs:
 Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline
 emphasis start-string without end-string.
Message-ID: <202306151142.ieawr1JA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saravana,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   39a9b92e9828f28d3c1bfae81b3121d973b76ad3
commit: 2d4a45a8388023a4a1f35813cad0e2bab225047b [375/27777] FROMGIT: docs: driver-model: Add documentation for sync_state
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 2d4a45a8388023a4a1f35813cad0e2bab225047b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151142.ieawr1JA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.

vim +215 Documentation/driver-api/driver-model/driver.rst

2d4a45a8388023 Documentation/driver-api/driver-model/driver.rst Saravana Kannan 2019-10-11  214  
^1da177e4c3f41 Documentation/driver-model/driver.txt            Linus Torvalds  2005-04-16 @215  	int 	(*remove)	(struct device *dev);
^1da177e4c3f41 Documentation/driver-model/driver.txt            Linus Torvalds  2005-04-16  216  

:::::: The code at line 215 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
