Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F823A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679551457; x=1711087457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0SE9I5FM808xtLFwLmAOdJAHDP8VQ6DtoBSVP600xNo=;
  b=BONTl8gp3XbqvcOXFiorKKI8IWGetIyOtLwIKtrBiVdgHpFUpi9CcSCM
   5jpq8Z1lctWTNQPAZjwRgzK8Gn/qew9OyFk1iWEEbi780/sBh2iYe4VNp
   3ZIfqS3btpzTDgZBkIGdFJeLyjYvx08Ewjt9ngEmszRArwBJzSpWvDgRM
   Rc/L2uzS17WwntTtYvvzvP60Psu6tCYIj5qxWTNtVy496ZsGAwaVMyeJf
   vyjcoskb9rwoyXJAGBpPkAjDpnoY5jDlnW3oVOIPXKtqybmjU8veo4dw+
   f47kEQv3R5s7fPs7gSZztWH1y6MQQSXMQss0f2pU/TQ8sAix1u/0W2TeP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319056597"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319056597"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 23:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714674252"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714674252"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Mar 2023 23:04:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfE3X-000E1r-2S;
	Thu, 23 Mar 2023 06:04:11 +0000
Date: Thu, 23 Mar 2023 14:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fsfa3 17/17] hppa-linux-gcc: error: unrecognized
 command-line option '-fstrict-flex-arrays=3'
Message-ID: <202303231428.zEj8YhJa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fsfa3
head:   0866a2ea45cdf26bbee3f4b1bd9a840c74de54e3
commit: 0866a2ea45cdf26bbee3f4b1bd9a840c74de54e3 [17/17] Makefile: Enable -Wstringop-overflow and -Warray-bounds and -fstrict-flex-arrays=3
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230323/202303231428.zEj8YhJa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=0866a2ea45cdf26bbee3f4b1bd9a840c74de54e3
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars testing/fsfa3
        git checkout 0866a2ea45cdf26bbee3f4b1bd9a840c74de54e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231428.zEj8YhJa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-gcc: error: unrecognized command-line option '-fstrict-flex-arrays=3'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
>> hppa-linux-gcc: error: unrecognized command-line option '-fstrict-flex-arrays=3'
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1288: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
