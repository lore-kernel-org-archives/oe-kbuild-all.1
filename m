Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53715B2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 03:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685678047; x=1717214047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4DZ+CS+ivWYgkq54v40f7HE0xFCNK0woRKW8gMsTMa4=;
  b=mbIEvF4QT4KVqriI24cVMi2oXdzSJcmyu9wdRqCA18JkNPcBDkNyAdaC
   nO+Ngwd8jjlrFsbCy/T7ikpotZvTwglORq8YJyiHcQK8shYHEArIg7WTr
   UK8vV5Sk8M62jQ/ZnsNQyYUs3akYObGt5UKfARcrGVBoDT6JEbLMiCUFN
   3KMNdjwigbrbjy/GKVAI9YsSOIZRfdc4vdppSGQ+G10SgWU8EZTy/kKlY
   uwrPHBW2VAwCxQCy0O7BWonb9LiT3seXGIKsE2pJ4ENo7ef2LgnzoqfYd
   C9CYg0SAX2fYfz4Pn0Tbei9iy9GkYnw5FLW4Z3vGV5jU/9JTVt9CqCLD2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="336125792"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="336125792"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 20:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="797445087"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="797445087"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2023 20:54:05 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4vrZ-00002c-0F;
	Fri, 02 Jun 2023 03:54:05 +0000
Date: Fri, 2 Jun 2023 11:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 55/62] FATAL ERROR: Unable to parse
 input tree
Message-ID: <202306021142.d137BSiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   ec8b57432a44b3954e0d713a56d1cb5ef00abecb
commit: c10bf488ba8be30a1ba8433201d2fa398e341e36 [55/62] ARM: dts: stm32: add CAN support on stm32f746
config: arm-randconfig-r046-20230531 (https://download.01.org/0day-ci/archive/20230602/202306021142.d137BSiU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=c10bf488ba8be30a1ba8433201d2fa398e341e36
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout c10bf488ba8be30a1ba8433201d2fa398e341e36
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021142.d137BSiU-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm/boot/dts/stm32f746.dtsi:312.20-21 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
