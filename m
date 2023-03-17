Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9036E62D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 03:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679025357; x=1710561357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVpPBm34pMV+LjVSdsPggQzH8UJLm/ibRoHhxkSyeAc=;
  b=QJxMiz3Cg7gJrqQiUTjcf2p66lfibp7jYe2tEczxZNW+7CzXC1q+Aj2I
   YWsnyI/XPJo1t+S0wH/LJDXRtpjZrdI88IUKwa7g3U+eEezshL1pIV7PH
   VugAfq1ddYHN5T7n5RxKlf68dfvVxnApz4IR/1N8In3387bORYma3XrAr
   qjJfJnqSESyGrHOh6zoTIIVPr11yB95Al6N3GiQT5cxJpvsV/eLyJgRPq
   6jz4Jor2MZqr5qdjQ4lbAAA3Tkh1t+6llVGu7biT/qq80WmoFsAQ/namS
   fDq3Win5y3ssf5+QDZEbbnBJv8StJxiRk2rEuxBx3pPN6jMzn+XEg6Hzs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335665180"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="335665180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 20:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="749114558"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="749114558"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2023 20:55:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd1C6-00093a-0m;
	Fri, 17 Mar 2023 03:55:54 +0000
Date: Fri, 17 Mar 2023 11:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Avraham Stern <avraham.stern@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 6/20] ERROR: modpost: "__aeabi_uldivmod"
 [drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko] undefined!
Message-ID: <202303171120.dS0f5NIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   95c0ef33f4a09287f7ded7a3c0f86daba8564b1a
commit: 7a2b9c4760b2623c824fc3532320288805bf1574 [6/20] wifi: iwlwifi: mvm: implement PHC clock adjustments
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230317/202303171120.dS0f5NIi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=7a2b9c4760b2623c824fc3532320288805bf1574
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout 7a2b9c4760b2623c824fc3532320288805bf1574
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171120.dS0f5NIi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
