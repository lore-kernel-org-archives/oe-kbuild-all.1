Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680B8F7D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 22:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675376516; x=1706912516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ih45qw3GO+A2Jg57523xVsGMRHouyCzrPpg2VyURJ3o=;
  b=MQNTaBTDof8vDWKneO5fRfhVN48efAsBqmof+nci3ZizCc2rXHjYdJKa
   D0U7g8QjLB3ypV5Bc2S5DW8t9k9HcYWx2jIn2r3GIx14CFRz4mTyxPLsr
   +MTUIcllgDGGR7mQerGLrUb2E68ZMscJW/yzvTBoGCWwBBq3cS2z/NyJU
   +e8S/L8q9JwL+liQo3L2Op/o/OvyitaLnhUfRoZ/eUJB79SjMRHOEts66
   CC8i/BzlAFHmrHB3y0qCZo5PIB10JqksNUf4oMgd20ckHhpxELpuKs4Sb
   4r54Ib40cRAFW3zc9bWNSpE8rQ1M5vcasTklTDqL/Gn5ExvpzPoxYIGD+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308927188"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="308927188"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 14:21:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="729048449"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="729048449"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 14:21:53 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNhxp-0006um-0z;
	Thu, 02 Feb 2023 22:21:53 +0000
Date: Fri, 3 Feb 2023 06:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: arch/mips/kernel/vpe-mt.c:(.text.vpe_run+0x280): undefined reference
 to `physical_memsize'
Message-ID: <202302030625.2g3E98sY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7368fd30165ced757d64da48e2091c83815ce5c
commit: 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
date:   9 months ago
config: mips-randconfig-r002-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030625.2g3E98sY-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b4537199a4a8480b8c3ba37a2d44765ce76cd9b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mips-linux-ld: arch/mips/kernel/vpe-mt.o: in function `vpe_run':
>> arch/mips/kernel/vpe-mt.c:(.text.vpe_run+0x280): undefined reference to `physical_memsize'
>> mips-linux-ld: arch/mips/kernel/vpe-mt.c:(.text.vpe_run+0x284): undefined reference to `physical_memsize'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
