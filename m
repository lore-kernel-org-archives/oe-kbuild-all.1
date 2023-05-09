Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A8160
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683591948; x=1715127948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XQBRuY02cprKxmS5+tZVJnNvozbfpXBEe1gvkF2MQgU=;
  b=NElwakezc/o9CGUzqNM7KUlbyn4w7FChK2ALXz35kMAUO67YpUKCpUeR
   rsClcn2+MXHTpk+7RcgKvMRYLEH9EuPaTmyLzWVEOoT81oIE0V//vcU/S
   FCmy6aadvL9K5WLP/FC0VQQ1k9YTxb/AH+hfzxiChaZYBe9hjcI50/ccZ
   1MTHuE1mqVC6SQnaIeCKHIjjy2prNeJBF4xqth/rb9Rj0+JqrU8Q6Fw+2
   h5qnaR/3kfac2D0MxJnIERdTpOsAv54XQ+WiQ7QhQHKEqsov//PVEExxq
   XMmPsSyDqhhMQDL9ZR5XPEP+gCWDPTksMJq1hXLrl3F6RPA6tQrd5b3e1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415344234"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="415344234"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 17:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="788309023"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="788309023"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 May 2023 17:25:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwBAn-0001Tp-2R;
	Tue, 09 May 2023 00:25:45 +0000
Date: Tue, 9 May 2023 08:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 32/33] lib/devres.c:40:32: error: implicit
 declaration of function 'ioremap_driver_hardened'
Message-ID: <202305090858.ZLHhwEA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   b143cfba688689945ae56d38a6f76100859b5025
commit: 33c1b6e80d0ac63ef0e7f18c6441f69adf79514e [32/33] lib/devres: Mark devm_ioremap shared when the device is authorized
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230509/202305090858.ZLHhwEA1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/33c1b6e80d0ac63ef0e7f18c6441f69adf79514e
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter
        git checkout 33c1b6e80d0ac63ef0e7f18c6441f69adf79514e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090858.ZLHhwEA1-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/devres.c: In function '__devm_ioremap':
>> lib/devres.c:40:32: error: implicit declaration of function 'ioremap_driver_hardened' [-Werror=implicit-function-declaration]
      40 |                         addr = ioremap_driver_hardened(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:40:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      40 |                         addr = ioremap_driver_hardened(offset, size);
         |                              ^
>> lib/devres.c:46:32: error: implicit declaration of function 'ioremap_driver_hardened_uc' [-Werror=implicit-function-declaration]
      46 |                         addr = ioremap_driver_hardened_uc(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:46:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      46 |                         addr = ioremap_driver_hardened_uc(offset, size);
         |                              ^
>> lib/devres.c:52:32: error: implicit declaration of function 'ioremap_driver_hardened_wc' [-Werror=implicit-function-declaration]
      52 |                         addr = ioremap_driver_hardened_wc(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:52:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      52 |                         addr = ioremap_driver_hardened_wc(offset, size);
         |                              ^
   lib/devres.c:58:32: error: implicit declaration of function 'ioremap_driver_hardened_np' [-Werror=implicit-function-declaration]
      58 |                         addr = ioremap_driver_hardened_np(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:58:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      58 |                         addr = ioremap_driver_hardened_np(offset, size);
         |                              ^
   cc1: some warnings being treated as errors


vim +/ioremap_driver_hardened +40 lib/devres.c

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
  > 40				addr = ioremap_driver_hardened(offset, size);
    41			else
    42				addr = ioremap(offset, size);
    43			break;
    44		case DEVM_IOREMAP_UC:
    45			if (dev->authorized)
  > 46				addr = ioremap_driver_hardened_uc(offset, size);
    47			else
    48				addr = ioremap_uc(offset, size);
    49			break;
    50		case DEVM_IOREMAP_WC:
    51			if (dev->authorized)
  > 52				addr = ioremap_driver_hardened_wc(offset, size);
    53			else
    54				addr = ioremap_wc(offset, size);
    55			break;
    56		case DEVM_IOREMAP_NP:
    57			if (dev->authorized)
    58				addr = ioremap_driver_hardened_np(offset, size);
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
