Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D7322E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 21:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676841228; x=1708377228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6+XvKJEfmB0xJildPFFEHkOBU1CdupmzP2KMwWOR3w=;
  b=nBpDHRDuh4Auaq8EVs1IIR4wX5XmYbpQ6x8ti0u92a4IZZOl2tJbSKEM
   fvZlH8IQk2PFtdimmufoa5h+g7zoun+XDPsY/HpKUKYxLhyeHfdHBj5hR
   gMFcikKMujiI0uUNog7W3uL2OVAqyKImUBjnYGjiM1v9fNObDG5J2qLI6
   5OflZ63mbvBjYkNTLd2/OxcwyHnunYSLhxQm/3pzahyKA0+Z5fI8nSSVr
   OKFVTWBdb1JKnYdhibwGcFm6hVdByEVLeqjUNIv6qH9R7FcA0wE7OfJkb
   RfQnjo9cFJCygsBpi7bZ30l1pb6pDB0S0OIaFKgIwfXUXZmte/p+EpkcZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="334487816"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="334487816"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 13:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="813932107"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="813932107"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2023 13:13:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTr0D-000DSL-0c;
	Sun, 19 Feb 2023 21:13:45 +0000
Date: Mon, 20 Feb 2023 05:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/md/dm-verity-avb.c:177:6: warning: no previous prototype for
 function 'dm_verity_avb_error_handler'
Message-ID: <202302200551.fQ6zKLSd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: f6219b7d72f896548c596ddb6249ecffdab8b041 ANDROID: AVB error handler to invalidate vbmeta partition.
date:   2 years, 2 months ago
config: x86_64-randconfig-a014-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200551.fQ6zKLSd-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=f6219b7d72f896548c596ddb6249ecffdab8b041
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout f6219b7d72f896548c596ddb6249ecffdab8b041
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/ drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200551.fQ6zKLSd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-verity-avb.c:177:6: warning: no previous prototype for function 'dm_verity_avb_error_handler' [-Wmissing-prototypes]
   void dm_verity_avb_error_handler(void)
        ^
   drivers/md/dm-verity-avb.c:177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_verity_avb_error_handler(void)
   ^
   static 
   1 warning generated.


vim +/dm_verity_avb_error_handler +177 drivers/md/dm-verity-avb.c

   176	
 > 177	void dm_verity_avb_error_handler(void)
   178	{
   179		dev_t dev;
   180	
   181		DMINFO("AVB error handler called for %s", avb_vbmeta_device);
   182	
   183		if (strcmp(avb_invalidate_on_error, "yes") != 0) {
   184			DMINFO("Not configured to invalidate");
   185			return;
   186		}
   187	
   188		if (avb_vbmeta_device[0] == '\0') {
   189			DMERR("avb_vbmeta_device parameter not set");
   190			goto fail_no_dev;
   191		}
   192	
   193		dev = name_to_dev_t(avb_vbmeta_device);
   194		if (!dev) {
   195			DMERR("No matching partition for device: %s",
   196			      avb_vbmeta_device);
   197			goto fail_no_dev;
   198		}
   199	
   200		invalidate_vbmeta(dev);
   201	
   202	fail_no_dev:
   203		;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
