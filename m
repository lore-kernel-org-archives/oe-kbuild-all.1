Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7963B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682286753; x=1713822753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+KoBPOTA0l3nYi3QKC3gks6vIAEn/Yja6N//yw9aMCs=;
  b=n0X56WDFh80PRInCjlA43gEr+iacc/Oqtuc0ErG/rqN2knQcNZJRohAG
   oK/TfIO7SIgfDGwuRFQV4/OcOTrAsNMIkiSaPK+MGDv2EcvTp9YovWhrZ
   j/c/5BmU3GYtP39tkwYN8hSxHMXgpDGBzb6/SwchtmJB+JjynibxJyM2M
   bXWwJa74SRJ0sQGNkAr0dDxlGnNWy0s/qNtvBl9eFAupvaO5vHEFL+xXy
   qATOiWPxmXDL9TU/uzUtAgLBHDtTbRPb96g4vRQ0OCL33j3273mcesZp5
   yLg8b+CwWPnMiOb8YwefuqE+eyoDAbG+g2JIdLooLMSyP74GK2eSW102t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="345075885"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="345075885"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 14:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="643137247"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="643137247"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Apr 2023 14:52:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqhdG-000i6S-0Z;
	Sun, 23 Apr 2023 21:52:30 +0000
Date: Mon, 24 Apr 2023 05:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/367] ld.lld: error: undefined symbol:
 spi_mem_exec_op
Message-ID: <202304240559.5uonfXiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   49b35eb3bdd5b8dc0275804e106363275217ba92
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/367] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230424/202304240559.5uonfXiY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240559.5uonfXiY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: spi_mem_exec_op
   >>> referenced by spi-cadence-quadspi.c:393 (drivers/spi/spi-cadence-quadspi.c:393)
   >>>               vmlinux.o:(cqspi_mem_do_calibration)
   >>> referenced by spi-cadence-quadspi.c:393 (drivers/spi/spi-cadence-quadspi.c:393)
   >>>               vmlinux.o:(cqspi_mem_do_calibration)
   >>> referenced by spi-cadence-quadspi.c:393 (drivers/spi/spi-cadence-quadspi.c:393)
   >>>               vmlinux.o:(cqspi_mem_do_calibration)
   >>> referenced 9 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
