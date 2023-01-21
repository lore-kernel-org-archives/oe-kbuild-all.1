Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA167E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 06:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674283624; x=1705819624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xxuYZcWYIl9/JFQwO/T6ZcJdMfb3qaN2iESwMWVGj4U=;
  b=LOM5GIyTiy82jBqnoLzICvZcPCcQ/xpH5Y3vvSyZTPN2wTC/saND2Gtf
   q1ZHUOnmdQVQDN1z6VzwtxUuloUX8U9IsfMJCNDv8nSxgF9BF0+2qfXHK
   c+bOycp4wJAKyYalN591IE/kbVQNH4VsX/rrGW23OrOJ9RKXz2P5ILaaN
   izgy6Upxpt7xsfJwnFfmqybnvR7HBXA+QB1DtjfOdzsykn+OZfF/EBiXu
   Mr0AJgkRZdaI3yA/LjDGiQuP0ihGxyn5gElmzuTbpmYqNyos4RMLe9mI9
   rFE4CCO4GszERUJIMPw+5agpu0lzVem7GgnYqwB5f1M45tosVWKaHuWAt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313654087"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="313654087"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 22:47:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749603531"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="749603531"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 22:47:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ7eX-0003hm-1q;
	Sat, 21 Jan 2023 06:47:01 +0000
Date: Sat, 21 Jan 2023 14:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 60/98] aspeed-sbc.c:undefined reference to
 `arch_debugfs_dir'
Message-ID: <202301211431.WzdYJZx2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   a4cca653c668f2108ca4cbafe596d9ff072a56c8
commit: 471af484e37d146008f00679e19c83bcfa7c3c25 [60/98] ARM: soc: aspeed: Add secure boot controller support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301211431.WzdYJZx2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/shenki/linux/commit/471af484e37d146008f00679e19c83bcfa7c3c25
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout 471af484e37d146008f00679e19c83bcfa7c3c25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/soc/aspeed/aspeed-sbc.o: in function `aspeed_sbc_init':
>> aspeed-sbc.c:(.init.text+0xc2): undefined reference to `arch_debugfs_dir'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
