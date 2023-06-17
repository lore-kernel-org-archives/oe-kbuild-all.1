Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4596947F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687015958; x=1718551958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lijx4yXJmpORgNsG4rFjFxM9RpvtzVAFnhigdq6V+wc=;
  b=bqD3rAsX4BY7hH2JkI9fQwLWBGoIrQecRtY5g2PRc5qk13fSsiXD1YGY
   uSdMo/YPEj/qHQDVONkrc0dqRsIbyftItenCKtVz0m0WB/6czZWOFP42e
   9msziNg3lzvypXHEeRMzecuTWLH8lv52s5QkBqXlOBvZr1v/WxPGXq7Ab
   xAYRrTM7JJnySKGdlx+aQC7jcsftQho6ZWObVgPmkg006yuWQyDevgMVC
   JUD/DYEbH8acXGZ9U8ucz/7VHlHmbCzwtoTTfE6GtWleCNNq+y2dBCrKq
   AasuDUH1k6oYmNWDuqIrrmqtmXV8rNKnIn8PV1yvsTbkf+yTg6jHU1Caa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="425343128"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="425343128"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 08:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="887435116"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="887435116"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Jun 2023 08:32:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAXum-0002qr-20;
	Sat, 17 Jun 2023 15:32:36 +0000
Date: Sat, 17 Jun 2023 23:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: GUO Zihua <guozihua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] crypto: Introduce SM9 key exchange algorithm
Message-ID: <202306172332.1ilDNlcS-lkp@intel.com>
References: <20230617101443.6083-4-guozihua@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230617101443.6083-4-guozihua@huawei.com>

Hi GUO,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.4-rc6 next-20230616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GUO-Zihua/MPI-Export-mpi_add_ui-and-mpi_mod-for-SM9/20230617-181723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20230617101443.6083-4-guozihua%40huawei.com
patch subject: [RFC PATCH 3/3] crypto: Introduce SM9 key exchange algorithm
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230617/202306172332.1ilDNlcS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add herbert-cryptodev-2.6 https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
        git fetch herbert-cryptodev-2.6 master
        git checkout herbert-cryptodev-2.6/master
        b4 shazam https://lore.kernel.org/r/20230617101443.6083-4-guozihua@huawei.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306172332.1ilDNlcS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/sm9_lib.c:12:10: fatal error: crypto/sm9.h: No such file or directory
      12 | #include <crypto/sm9.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
--
>> crypto/sm9.c:20:10: fatal error: crypto/sm9.h: No such file or directory
      20 | #include <crypto/sm9.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.


vim +20 crypto/sm9.c

  > 20	#include <crypto/sm9.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
