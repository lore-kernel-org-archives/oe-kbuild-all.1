Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73BEC5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680695112; x=1712231112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XE8hynVnTHuOdYF6HwKlWRCDdIsESoItKAcQQq4hB44=;
  b=iDe6lI/ih3bNDjH5oAkvJPEjEqAjU9BZn1yv5YFqBWRR/pkpiR7pYT4c
   5TLE71OaALNNuR9Bc/qYreu67wwbgxxA16xk95C6HqGRwuGCniHRZvkCm
   xBgl9q4a0Aldfzfme+t3hEBfVcuCypH3PJk+QLCHqe/IGLpLzRq8XXKrF
   FuFUAYArcp3mf60Etx95DumLbVCRnkF+R3HqlnhZaENnBBh5irQaQXZFu
   6n5OaULpJvMxh1Tb6LGI1GrFF8xX+P3zFYWr54OoH39CPGyFlP/xUA6ny
   r/qN99l+qqZE/Fkv9XK4nUj5z3kBpnP31UNqj4hqG55EgaVqdpqmLVgV7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="345009921"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="345009921"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 04:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="680253499"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="680253499"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 04:45:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk1Ze-000QVM-1P;
	Wed, 05 Apr 2023 11:45:10 +0000
Date: Wed, 5 Apr 2023 19:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 101/124] Error:
 arch/arm64/boot/dts/qcom/msm8996.dtsi:2955.30-31 syntax error
Message-ID: <202304051927.veyf7fFO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   7379ec723197b418f1f4f8b77bd497e4c552aa73
commit: cf2cc49500a61dea43a16a2614d8698db6f783a5 [101/124] arm64: dts: qcom: msm8996: fix sound card reset line polarity
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230405/202304051927.veyf7fFO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=cf2cc49500a61dea43a16a2614d8698db6f783a5
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout cf2cc49500a61dea43a16a2614d8698db6f783a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051927.veyf7fFO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/msm8996.dtsi:2955.30-31 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
