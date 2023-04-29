Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB57D3229
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 21:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682803634; x=1714339634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=050HZcmNBN/wzgZ9rAZB1l6d6oMY/0quvgnYDV5pXe4=;
  b=HOvFLPAcfhrvN5vIrQVg9Qzx4vZOG2kkdHJZ6ZFCqIR/AqfUaOkzyVv+
   fgoVvMkqo+zeo5ET5mrWPNEU95tHpy4P8Fu1jo7f0VQLCljlNycYK2AkF
   TSZUFI3mHE+SV8HuV8cAM7+oZfrszYDwFm5Pd6IY2eYMDjaGWz9UgpEsQ
   QM7tJ5s8zSYqU6wKvXwGqFudsFRiksLA/BtSGANsw/ZZgS/A1mZOfzfJt
   /BRdyRU8XklAQouI98Gk9aSdTlNQz0s0G5+xYr9w5Wp0+rNSOQp42gA5h
   8Vwda5hdariTWe0q5eV88PXrF9c9orwlG/W9390almEm2LRO+BuQi1Roc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="332304005"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="332304005"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 14:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="764786807"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="764786807"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2023 14:27:13 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pss64-0001ML-1p;
	Sat, 29 Apr 2023 21:27:12 +0000
Date: Sun, 30 Apr 2023 05:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 375/27008] htmldocs:
 Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline
 emphasis start-string without end-string.
Message-ID: <202304300524.Ui2CGkBB-lkp@intel.com>
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
head:   d5ed2ca98e482beb70819315665172025f8a3bc6
commit: 2d4a45a8388023a4a1f35813cad0e2bab225047b [375/27008] FROMGIT: docs: driver-model: Add documentation for sync_state
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 2d4a45a8388023a4a1f35813cad0e2bab225047b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304300524.Ui2CGkBB-lkp@intel.com/

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
https://github.com/intel/lkp-tests
