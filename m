Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF43205
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 23:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680477813; x=1712013813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fpvQles44p1P72ynF3H5hDgq7raZ1fcNQtRFsRCId4g=;
  b=hjlGnEjxsrUGr/5lH5KhlrU/OFzbgYgCK9bqLxlgemCpEuk5SNgU7Zoj
   8yd+AQi46XEo9m3LYuJyCkDujvafvsv3fkLgvrn9YGPxGU5DKEokFlbil
   vvILqhAN73iewVm2nBiVy2qEyVV2Xl3b39pWDMbhuAMplZxt3AcFnLdjh
   md1/9y3aXP4aKNIiIqwGFpUdHVpWgTtqSU/fZV4ZW/ZWUp8ynY1y+bO71
   5id0vKE10cejwOQUAacuC8yjHcXPqJICX/HOqPQ8Z4kM7gNENCZ+eq2nO
   Z0lSE2vtusX7idzsNFuhf5JRg+HaKasjLPzjW6EsPbhmHgqo11EJs8Cx5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="325774511"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="325774511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 16:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="635907451"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="635907451"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Apr 2023 16:23:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj72p-000Nmn-0r;
	Sun, 02 Apr 2023 23:23:31 +0000
Date: Mon, 3 Apr 2023 07:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [matthias-bgg:v6.3-next/dts64 42/51] Error:
 arch/arm64/boot/dts/mediatek/mt6795.dtsi:636.21-22 syntax error
Message-ID: <202304030759.fgIYIlmw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.3-next/dts64
head:   966e221240f3c1d11a314630e9cc3c0609174210
commit: a7c7f1fe2fde4d4f6593bc24a0adbfc8f8375287 [42/51] arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
config: arm64-randconfig-r005-20230402 (https://download.01.org/0day-ci/archive/20230403/202304030759.fgIYIlmw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?id=a7c7f1fe2fde4d4f6593bc24a0adbfc8f8375287
        git remote add matthias-bgg https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
        git fetch --no-tags matthias-bgg v6.3-next/dts64
        git checkout a7c7f1fe2fde4d4f6593bc24a0adbfc8f8375287
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304030759.fgIYIlmw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt6795.dtsi:636.21-22 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
