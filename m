Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6119BA3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686332625; x=1717868625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o585FB0CLahAOlr8Uc0kwp+BKHOunEapgbz0gC3+Z9w=;
  b=AdbECEfSdUz2CPuX36+cO8LIPCLUdMlJyDW143Lf9piEeOlFXes7dFoK
   b3k0i3C548MooVeXBb5J6qiPL4TjLyQaRodjFLDVceGzaOuBQKVMbANHn
   aOe+ipYGaWxaKu04//wJ4bG7URKioypaSr899P7BFJCHx6NA8ZyJdCQ+l
   pjGVivgsZM2V71J/2cSoC+brBDaOk/zgeeiy+JaXrC3K2ffdeytygpIgO
   c05bFL+LiQMkbXIJQKO6gRuuSAlsebfcPByCaq37TLD8oAFs7qpHF1Bp5
   gN5PvTyYhEs83PFsUuYxAmS69G9kwgsHU/nMwyheDq4312PtczFDcjmCm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="444025692"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="444025692"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 10:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="687825719"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="687825719"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Jun 2023 10:43:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7g9B-0009Ge-33;
	Fri, 09 Jun 2023 17:43:37 +0000
Date: Sat, 10 Jun 2023 01:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, arnd@arndb.de, christophe.leroy@csgroup.eu,
	hch@lst.de, rppt@kernel.org, willy@infradead.org,
	agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
	schnelle@linux.ibm.com, David.Laight@aculab.com, shorne@gmail.com,
	deller@gmx.de, Baoquan He <bhe@redhat.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH v6 10/19] s390: mm: Convert to GENERIC_IOREMAP
Message-ID: <202306100105.8GHnoMCP-lkp@intel.com>
References: <20230609075528.9390-11-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609075528.9390-11-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/asm-generic-iomap-h-remove-ARCH_HAS_IOREMAP_xx-macros/20230609-160014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230609075528.9390-11-bhe%40redhat.com
patch subject: [PATCH v6 10/19] s390: mm: Convert to GENERIC_IOREMAP
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230610/202306100105.8GHnoMCP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch akpm-mm mm-everything
        git checkout akpm-mm/mm-everything
        b4 shazam https://lore.kernel.org/r/20230609075528.9390-11-bhe@redhat.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100105.8GHnoMCP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/perf_cpum_sf.c:25:
   include/asm-generic/io.h: In function 'ioremap':
>> include/asm-generic/io.h:1089:41: error: '_PAGE_IOREMAP' undeclared (first use in this function); did you mean 'VM_IOREMAP'?
    1089 |         return ioremap_prot(addr, size, _PAGE_IOREMAP);
         |                                         ^~~~~~~~~~~~~
         |                                         VM_IOREMAP
   include/asm-generic/io.h:1089:41: note: each undeclared identifier is reported only once for each function it appears in


vim +1089 include/asm-generic/io.h

80b0ca98f91ddb Christoph Hellwig 2019-08-13  1083  
2fe481688890d6 Baoquan He        2023-06-09  1084  #ifndef ioremap
2fe481688890d6 Baoquan He        2023-06-09  1085  #define ioremap ioremap
80b0ca98f91ddb Christoph Hellwig 2019-08-13  1086  static inline void __iomem *ioremap(phys_addr_t addr, size_t size)
80b0ca98f91ddb Christoph Hellwig 2019-08-13  1087  {
80b0ca98f91ddb Christoph Hellwig 2019-08-13  1088  	/* _PAGE_IOREMAP needs to be supplied by the architecture */
80b0ca98f91ddb Christoph Hellwig 2019-08-13 @1089  	return ioremap_prot(addr, size, _PAGE_IOREMAP);
80b0ca98f91ddb Christoph Hellwig 2019-08-13  1090  }
2fe481688890d6 Baoquan He        2023-06-09  1091  #endif
80b0ca98f91ddb Christoph Hellwig 2019-08-13  1092  #endif /* !CONFIG_MMU || CONFIG_GENERIC_IOREMAP */
97c9801a15e5b0 Christoph Hellwig 2019-08-11  1093  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
