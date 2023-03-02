Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA916EDB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 03:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677728460; x=1709264460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AriKVVFRLJRU5/HzJAcIv04ZKKCjjN0BI9+H2oA8Tp4=;
  b=HvPnYbz4UTtZdUczdGElPZkhL4GPFrLOqj4lD/hPRLjLJvUIm8AakTSm
   lih7NUZf7RkBGv0wejnbru1uF4nJfUiigTU/xAZJ/xW/l+IxHurrotBKh
   NIApXC1I9ur0H2XWVm8nPyR5Nt8jSw03NTZp7k9y5mZJ0/jDumS2OTlXz
   71fHMnYTiGBMtOMv7M8Tn6h76GMXc7RJs5v7A5V99Auo4L/fIMPhfWeYi
   q+lsn0QITVnMxUcZlGeqALZfdO0jvA+wE90ThIHWfL9oFvr4HdUw8aVaH
   SORo4AejrljujtugRfwa3a2AYdudCLqiAKGCBcA8bSqjiuzR3MSQ/PQAa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332087426"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332087426"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 19:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="677027881"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="677027881"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2023 19:40:59 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXZoQ-00009x-1L;
	Thu, 02 Mar 2023 03:40:58 +0000
Date: Thu, 2 Mar 2023 11:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Wengang Wu <wgw@motorola.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-omap:android-beagle-x15-4.14 16603/30000] <stdin>:1332:2:
 warning: #warning syscall pidfd_send_signal not implemented
Message-ID: <202303021110.EklCRwUW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/omap android-beagle-x15-4.14
head:   bb5a46d9a30e6126b85ef4cf108499488c438462
commit: c8b9b2c5cca36e3bbc567a1f030ee10a795b409d [16603/30000] BACKPORT: signal: add pidfd_send_signal() syscall
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230302/202303021110.EklCRwUW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-omap https://android.googlesource.com/kernel/omap
        git fetch --no-tags android-omap android-beagle-x15-4.14
        git checkout c8b9b2c5cca36e3bbc567a1f030ee10a795b409d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021110.EklCRwUW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1332:2: warning: #warning syscall pidfd_send_signal not implemented [-Wcpp]
--
>> <stdin>:1332:2: warning: #warning syscall pidfd_send_signal not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
