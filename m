Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7758227706
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 21:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679692359; x=1711228359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zqxhtrF2/kYpuz2321QQr5UBrUdW68WoRfA0Rdky2F8=;
  b=gRGSFS0AUZy3Uegc8uLteWB5QCyyJE3BF0D9s2VexTr/AZm0gx4gB177
   ZaCHa+svLhxdkzFUxdhh+vIdkKGnfGRkOakiax6erqLN4Z1D1KwFN0PNc
   DYXj0E3XGku9NlmOPgJ1pNwG4vqvYGDrgOFyCNr8uEqjFdk75iKHN2ETD
   nghwLtVUhYBvJac9+9qhTMD1oFOgCICW2uygiNX0zBeGUzpLzdf6kjnDy
   3Lxjb5Q3cFw7jVo+jPOAOhjafpN0JKU6EhGbJIFpe8fCLd9QyVJwci5y5
   PAXbe5ens2wO5XJWvP+v/RoQOvYAu6bhMnT+nbk//Ma/IY7iap5knZjRD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323769599"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="323769599"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 14:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="772026096"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="772026096"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2023 14:12:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfoi9-000FfE-0y;
	Fri, 24 Mar 2023 21:12:33 +0000
Date: Sat, 25 Mar 2023 05:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:pr/17 29/32]
 drivers/net/ethernet/intel/iavf/iavf_xsk.c:6:10: fatal error:
 linux/net/intel/libie.h: No such file or directory
Message-ID: <202303250536.4brXi8YL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/17
head:   966873bc3f1da2cbd3450c8920c2c60cf52e0069
commit: e9e2e3e34bb925af1f0b7e73bf3a737d2b063c9e [29/32] iavf: Implement AF_XDP RX processing
config: loongarch-randconfig-r006-20230322 (https://download.01.org/0day-ci/archive/20230325/202303250536.4brXi8YL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/e9e2e3e34bb925af1f0b7e73bf3a737d2b063c9e
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin pr/17
        git checkout e9e2e3e34bb925af1f0b7e73bf3a737d2b063c9e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/net/ethernet/intel/iavf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250536.4brXi8YL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/iavf/iavf_xsk.c:6:10: fatal error: linux/net/intel/libie.h: No such file or directory
       6 | #include <linux/net/intel/libie.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +6 drivers/net/ethernet/intel/iavf/iavf_xsk.c

     3	
     4	#include <linux/bpf_trace.h>
     5	#include <linux/filter.h>
   > 6	#include <linux/net/intel/libie.h>
     7	#include <net/xdp_sock_drv.h>
     8	#include <net/xdp_sock.h>
     9	#include "iavf.h"
    10	#include "iavf_trace.h"
    11	#include "iavf_xsk.h"
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
