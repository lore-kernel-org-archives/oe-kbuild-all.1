Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316611854
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 04:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680149730; x=1711685730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jbi6Z3Jr9sEUcjkvqner98IBij81vo1clPwD4R/LS78=;
  b=jDXl3e4F7rvk4510lex9yrvmXeZ/KDBcJxyIWSaJTHb+i1bSEoaTNyL8
   y1WG6cBJS2+b2kHU981V1f/D9HYlcMcScIojLWb9Ha2Fj9CosZ7/AMnD0
   IpefDEJiDd4suLJjCTVq29tmyEmPH4ak4CB0ym1zi2eDg20vo3J2AdQW8
   e/pyg/vAXjuj5rX74b7XCL76JbGa1+dgrztlLvqq9KIiNls9FfI6pCTmp
   dJssB85qSkU2ifOJhsPrGrNRhAWk7d9F+Pxec8R7Eg8eG23Dtbs7pNJI/
   dDKAi4VgojQ7/OFTygSwJPYy4Sk87vcf9aph9RE3P7FG7iQVppzZRHro9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339787035"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="339787035"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 21:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717157598"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="717157598"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 21:15:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phjh9-000KJw-1r;
	Thu, 30 Mar 2023 04:15:27 +0000
Date: Thu, 30 Mar 2023 12:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: xtensa-linux-ld: section .start VMA
 [00000000d1000000,00000000d1000007] overlaps section .image VMA
 [00000000d0003000,00000000d12232af]
Message-ID: <202303301228.XrFgOQyu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffe78bbd512166e0ef1cc4858010b128c510ed7d
commit: 725aea873261e8d986e527838fde2a721f0962d8 xtensa: enable KCSAN
date:   11 months ago
config: xtensa-randconfig-r016-20230327 (https://download.01.org/0day-ci/archive/20230330/202303301228.XrFgOQyu-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=725aea873261e8d986e527838fde2a721f0962d8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 725aea873261e8d986e527838fde2a721f0962d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301228.XrFgOQyu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .start VMA [00000000d1000000,00000000d1000007] overlaps section .image VMA [00000000d0003000,00000000d12232af]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
