Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553F5110B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 05:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677733984; x=1709269984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4OQnqGscwvM/yFo9NBURJugYdlNWXutVc5RyIaA7WiY=;
  b=gNUhR3XcKZqyXeDpCA4ABYiLcKaKDU7ppOLNUU1WUubeFv4ji6uHvxoZ
   t2cv6bgXkQ0ExYrWFehUq9f5L4MzKmH/GWFX0pC5xQatLUrR1eIOf3qiy
   CpL/QNBVTQP1fsD6D4LDWULKnLd81zZDMrHIN8rn4/JP0K6XoW+Erq+pk
   lNdTogodnv0Eh24rLp10jXvNuU+LHFwunSmtOhyCy7SGPJc1L1XH6Q9X3
   MSRbgv9bDAZJMQEgAykh5L1T2cK0EGfoGTHT7TSEZ45cugNoD5QH+JjJZ
   JiO+W8o3UBSmBYYo2YEMRiE3tvZ14I14I6s4jntzqIwzTUrddwqKXaa4h
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399408026"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="399408026"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 21:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738912584"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="738912584"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 21:13:02 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXbFW-0000EL-0P;
	Thu, 02 Mar 2023 05:13:02 +0000
Date: Thu, 2 Mar 2023 13:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Wengang Wu <wgw@motorola.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-omap:android-beagle-x15-4.14 16613/30000] <stdin>:1335:2:
 warning: #warning syscall pidfd_open not implemented
Message-ID: <202303021329.w8Inmrfx-lkp@intel.com>
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
commit: 708c2df8cdb7956cfcf54aa48dfd3e8177a3a3f0 [16613/30000] BACKPORT: arch: wire-up pidfd_open()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230302/202303021329.w8Inmrfx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-omap https://android.googlesource.com/kernel/omap
        git fetch --no-tags android-omap android-beagle-x15-4.14
        git checkout 708c2df8cdb7956cfcf54aa48dfd3e8177a3a3f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021329.w8Inmrfx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1332:2: warning: #warning syscall pidfd_send_signal not implemented [-Wcpp]
>> <stdin>:1335:2: warning: #warning syscall pidfd_open not implemented [-Wcpp]
--
   <stdin>:1332:2: warning: #warning syscall pidfd_send_signal not implemented [-Wcpp]
>> <stdin>:1335:2: warning: #warning syscall pidfd_open not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
