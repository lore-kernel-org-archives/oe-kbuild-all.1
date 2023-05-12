Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01477818
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 03:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683863556; x=1715399556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEmWG+mZHCEucWD+DLO7IftihYuw+Mt5Idv+ZuG/LAM=;
  b=Q7paHxwCjj/EOtfbZWiSe4UtpTyqzpzbx6wDnPNDvmWbG/CIkGgjGZCe
   3ymgKEAwlYXzr+acMTzoYevo1PT9RBp+nGNtkRLjXS9+6nSeTluYfcyF8
   0qT7FRVActT4IJrVhdA8BvBlWCL/fIQ25pHbqiLHFtHtJ1XhS5hCppUe3
   Pi0tVTNdxdjEHeE5GbgQz/0EF+2L2UcRhBKSpPkfvPdMDTgtUW7llqSDK
   K1KVlCKFtlvUF8QUFSwWUumgqLX/UzWd/c7vKIaTXFX5zKy83QvKdf6/k
   nIulkAflCTPdRlo4nDAdoBUfRr6t2WkgvqDK1A+jYUxFkg2I/VQrxdNjI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="437027722"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="437027722"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 20:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="769629435"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="769629435"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2023 20:52:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxJpa-0004T8-24;
	Fri, 12 May 2023 03:52:34 +0000
Date: Fri, 12 May 2023 11:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 22/30] acpi.c:undefined reference to
 `acpi_get_genport_coordinates'
Message-ID: <202305121138.EmsT0Loo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: d37b575b54f54d44a5fef781206685ed0c739998 [22/30] cxl: Store the access coordinates for the generic ports
config: ia64-buildonly-randconfig-r002-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121138.EmsT0Loo-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=d37b575b54f54d44a5fef781206685ed0c739998
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout d37b575b54f54d44a5fef781206685ed0c739998
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121138.EmsT0Loo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/cxl/acpi.o: in function `add_host_bridge_dport':
>> acpi.c:(.text+0x2f82): undefined reference to `acpi_get_genport_coordinates'
>> ia64-linux-ld: acpi.c:(.text+0x3142): undefined reference to `acpi_get_genport_coordinates'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
