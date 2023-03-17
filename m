Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136F31FBD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679046428; x=1710582428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IImQqJFLe+vJF4DkNYEB4GjILaHwxzgd8THj+BnUWIM=;
  b=CrD342Phzphsu17N4tsF8lQTcfMgRx4ZrEcFB3asCsPB8W3Eet+mbJgp
   RPNGdLuTTUzBasuSM7b8i5GfC1Gs0WVz+zN+l96YRRvjqPLTXa/JSHNQw
   gXThhHR0eQwaqQDFsT0/CVBeQ93HXmMuUOv7XFl3zeqAVMAX/4dVNEnaX
   vG6gBV6bnrDsO6aYW8qkONfSuGGZ6IVZnyFmwGnY2HXgfAHqe7GqIMAIe
   nVxi5KXcy+BrZg62AEw1NJKyFUo3C99NMOzsn0lQeGCWQY/Spm0rYN827
   v5gwlflBxHlHX8NjKos7RS1sPx3jXwV22FiLerNGZ9XfP2G3vHKJcUaYu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338243695"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338243695"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 02:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712692913"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="712692913"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Mar 2023 02:47:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd6fv-0009Gg-1I;
	Fri, 17 Mar 2023 09:47:03 +0000
Date: Fri, 17 Mar 2023 17:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Naik <abhishek.naik@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 18/20] ERROR: modpost:
 "iwl_mvm_get_tas_approved_list"
 [drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko] undefined!
Message-ID: <202303171755.uzf1tkly-lkp@intel.com>
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
commit: 72bb7b286759a4f480114977d4faf353385bd167 [18/20] iwlwifi: mvm: Add debugfs to get TAS status
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230317/202303171755.uzf1tkly-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=72bb7b286759a4f480114977d4faf353385bd167
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout 72bb7b286759a4f480114977d4faf353385bd167
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171755.uzf1tkly-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__aeabi_uldivmod" [drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko] undefined!
>> ERROR: modpost: "iwl_mvm_get_tas_approved_list" [drivers/net/wireless/intel/iwlwifi/mvm/iwlmvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
