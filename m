Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0F83201
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 23:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675295532; x=1706831532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D2I9TeA2Tawzj+jB0UYLaHcjxxaaPZASn+fihGeKsOk=;
  b=XaSpiBrbZll+E1JgC5XO88+CpD9Czg829tSTcNo+6brMejHoVgdZZ73E
   4oNOIMXG9fxM7cZyHrSoTBcNHy0s7Q/6Z4SaPDrmvJb/h4XEVFD8pQ7R6
   1CwCeVhMnT4Y+hQ5UFV6TCJwtc6CGHOzWQlU7oE+bmWEndGkCGUnjGrny
   wgcRpbr1k/v4X8VePPdkeve8zUtWvNs76JhZIojDZlh0gQr0PBzTT73GM
   a5sRWs480cRd8RUoq5TrrBmaM+3gK70SwDKQLHfFZpV35eSMSzcYEI829
   AWIPHxl/mmGQ7Yh4w3NnpfzAaf+9p+8KqVEUqTnCAqTKb4De+kRfW3Bcf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414511041"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="414511041"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 15:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695548885"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695548885"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Feb 2023 15:51:57 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNMtQ-0005vQ-1U;
	Wed, 01 Feb 2023 23:51:56 +0000
Date: Thu, 2 Feb 2023 07:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test 14/40] pci.c:undefined reference to
 `pci_create_OF_bus_map'
Message-ID: <202302020739.cLZQSxQV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   9ffcf6a19dbb2a24de2c2d7b2af1e130986cd565
commit: 869363998da87c80c16ff1221e95b41b2d3cceb2 [14/40] powerpc/pci: Allow to disable filling deprecated pci-OF-bus-map
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230202/202302020739.cLZQSxQV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=869363998da87c80c16ff1221e95b41b2d3cceb2
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 869363998da87c80c16ff1221e95b41b2d3cceb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/platforms/chrp/pci.o: in function `chrp_find_bridges':
>> pci.c:(.init.text+0xaec): undefined reference to `pci_create_OF_bus_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
