Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086A43C0B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675871890; x=1707407890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nsUO5d/Su1Adr3FIMhzSE7jjSVJd4yfIWmybQaGdjeY=;
  b=DzeN5/hkeOa+mvfn3PY/4J/9aNW238c5MM8Q5caLk0cBjlvaunCYrCiq
   suxuxaPsdLZhHIPXw4T9ivCxg6fY5lIMID6vubE+GKbHJD26TM5NrQQkm
   ahvrzx+xVlnBMfCf+lDIAjSCLddpmvBgFJsqWzUQ01uq41Lhzqs9fZfbF
   7ompYqtvk0f7Mj13eAWZlRANeDTIhobgQ9OuDiG8+plaKTP6Xqgttwmtu
   zvPbBDEUir5XkRr4E/i1ld/bqZIvLHTlEESC7dKngbQt9ccBdZBS8j0uS
   e8iJ6h0mafWZVd2ChFYrw5KG6pE1LcZ/5RczbWNYOmL8SfXtkWGYt2Bps
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416057990"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="416057990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 07:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="697701986"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="697701986"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2023 07:58:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPmpj-0004W5-10;
	Wed, 08 Feb 2023 15:58:07 +0000
Date: Wed, 8 Feb 2023 23:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 31/31] lib/devres.c:58:32: error:
 implicit declaration of function 'ioremap_driver_hardened_np'; did you mean
 'ioremap_driver_hardened_uc'?
Message-ID: <202302082347.BtRVzxkz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   fd61f2d2a82f5c0c284fa3f074bae5016c39e7bc
commit: fd61f2d2a82f5c0c284fa3f074bae5016c39e7bc [31/31] lib/devres: Mark devm_ioremap shared when the device is authorized
config: mips-randconfig-s042-20230206 (https://download.01.org/0day-ci/archive/20230208/202302082347.BtRVzxkz-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/fd61f2d2a82f5c0c284fa3f074bae5016c39e7bc
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout fd61f2d2a82f5c0c284fa3f074bae5016c39e7bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   lib/devres.c: In function '__devm_ioremap':
>> lib/devres.c:58:32: error: implicit declaration of function 'ioremap_driver_hardened_np'; did you mean 'ioremap_driver_hardened_uc'? [-Werror=implicit-function-declaration]
      58 |                         addr = ioremap_driver_hardened_np(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                ioremap_driver_hardened_uc
   lib/devres.c:58:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      58 |                         addr = ioremap_driver_hardened_np(offset, size);
         |                              ^
   cc1: some warnings being treated as errors


vim +58 lib/devres.c

    25	
    26	static void __iomem *__devm_ioremap(struct device *dev, resource_size_t offset,
    27					    resource_size_t size,
    28					    enum devm_ioremap_type type)
    29	{
    30		void __iomem **ptr, *addr = NULL;
    31	
    32		ptr = devres_alloc_node(devm_ioremap_release, sizeof(*ptr), GFP_KERNEL,
    33					dev_to_node(dev));
    34		if (!ptr)
    35			return NULL;
    36	
    37		switch (type) {
    38		case DEVM_IOREMAP:
    39			if (dev->authorized)
    40				addr = ioremap_driver_hardened(offset, size);
    41			else
    42				addr = ioremap(offset, size);
    43			break;
    44		case DEVM_IOREMAP_UC:
    45			if (dev->authorized)
    46				addr = ioremap_driver_hardened_uc(offset, size);
    47			else
    48				addr = ioremap_uc(offset, size);
    49			break;
    50		case DEVM_IOREMAP_WC:
    51			if (dev->authorized)
    52				addr = ioremap_driver_hardened_wc(offset, size);
    53			else
    54				addr = ioremap_wc(offset, size);
    55			break;
    56		case DEVM_IOREMAP_NP:
    57			if (dev->authorized)
  > 58				addr = ioremap_driver_hardened_np(offset, size);
    59			else
    60				addr = ioremap_np(offset, size);
    61			break;
    62		}
    63	
    64		if (addr) {
    65			*ptr = addr;
    66			devres_add(dev, ptr);
    67		} else
    68			devres_free(ptr);
    69	
    70		return addr;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
