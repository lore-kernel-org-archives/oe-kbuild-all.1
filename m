Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747A517E2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683621241; x=1715157241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ybdeUiWls5gk7W33MfcSc65Z7BTBx0cQmHkP34csahE=;
  b=WmbKE+3OqKvi1yi+ElhR5+/F4zF+fmrHL4yD8yP9a1+v4AKl3+lwGrW4
   gQXhgojh+YIrPoyUenREYCgfSqlP/6Ra9bmZQspg2RKezGq/TcqFQPdNV
   t8fQDLgH8p1b8/1Uz1GtQ1ugjFM9v24CiQZs/+7wVJIV9RtRZlL+/5z8v
   PZUn0nHom6pYCZreO0zHy47WFR4+/UzE95m6HqMSlB4oKWwKHRCIbPbKi
   6evN6pklvqEVWFpWuAHTMBFYvrdua9MdBn9fD5HkoFcR930Y+C8Zf6Rfk
   Sqi+EmbXY3A32oj3s7PCNX+UjIiDV6ObazSCJ4kyiNAbbEtwrLgXga74W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348669166"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="348669166"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 01:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731591228"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="731591228"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 May 2023 01:33:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwIn5-0001ym-2A;
	Tue, 09 May 2023 08:33:47 +0000
Date: Tue, 9 May 2023 16:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 5898/9999] altera_tse_main.c:undefined
 reference to `devm_ioremap_nocache'
Message-ID: <202305091625.sdaYpqzK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

It's probably a bug fix that unveils the link errors.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: b97ed64cf80b072cb765c3b9389a7f19df2dd595 [5898/9999] init/Kconfig: make COMPILE_TEST depend on !S390
config: s390-randconfig-r044-20230507 (https://download.01.org/0day-ci/archive/20230509/202305091625.sdaYpqzK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b97ed64cf80b072cb765c3b9389a7f19df2dd595
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout b97ed64cf80b072cb765c3b9389a7f19df2dd595
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091625.sdaYpqzK-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/net/ethernet/altera/altera_tse_main.o: in function `request_and_map':
>> altera_tse_main.c:(.text+0x12ee): undefined reference to `devm_ioremap_nocache'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
