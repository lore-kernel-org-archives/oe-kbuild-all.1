Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53732F30
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680107262; x=1711643262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zI5ctVrP6qN58r/F+R826DRtUZczA8hxcOuPINzfL9A=;
  b=Smuvy3tIv9sHvbRHlr7iRPbJSTOyrZDhepC3rFI59nYSxDCKYklGdfvX
   E/M4u5dEE8nyWq2+EvU6dsJtO8LOnmLbJgnRL1MG78AxliMI8kXHLf930
   ZxcEGeS4HiQC+RlxeAM5IBaWhWRsriXfkCs4dD506txGP9gnnD4Hkc3vm
   H11PqIZ90jX1b3SaNc5ml3apvJwms29r0Rq6DK6Fwe/TioJb8SfXL3CwF
   OijYE9dcg5SjhnftWdRq8Y3/67jNlhS+WzXEAO2sGrYh9RBKu4N+3RjsD
   S+wi/OKofbyQdtBHeL6PlUE+9ZNZw0edUSIeNqnEMnAzq10KjV4ytzbY3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="403565586"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="403565586"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 09:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="686882050"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="686882050"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2023 09:23:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phYZg-000Jid-32;
	Wed, 29 Mar 2023 16:23:00 +0000
Date: Thu, 30 Mar 2023 00:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jani-drm:is-power-of-2 2/4] arch/microblaze/mm/pgtable.c:188:
 warning: "is_power_of_2" redefined
Message-ID: <202303300054.Zf4h2DYa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~jani/drm is-power-of-2
head:   051d03b7787fe9ae1e18d6c8724a5d5eda53bc77
commit: 4235abad8fc74bbff10731f7db52beba111da70d [2/4] log2: have is_power_of_2() support bigger types than unsigned long
config: microblaze-randconfig-r031-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300054.Zf4h2DYa-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add jani-drm git://people.freedesktop.org/~jani/drm
        git fetch --no-tags jani-drm is-power-of-2
        git checkout 4235abad8fc74bbff10731f7db52beba111da70d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash arch/microblaze/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300054.Zf4h2DYa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/microblaze/mm/pgtable.c:188: warning: "is_power_of_2" redefined
     188 | #define is_power_of_2(x)        ((x) != 0 && (((x) & ((x) - 1)) == 0))
         | 
   In file included from include/linux/kernel.h:24,
                    from arch/microblaze/mm/pgtable.c:30:
   include/linux/log2.h:58: note: this is the location of the previous definition
      58 | #define is_power_of_2(n)                                                \
         | 


vim +/is_power_of_2 +188 arch/microblaze/mm/pgtable.c

15902bf63c8332 Michal Simek 2009-05-26  186  
15902bf63c8332 Michal Simek 2009-05-26  187  /* is x a power of 2? */
15902bf63c8332 Michal Simek 2009-05-26 @188  #define is_power_of_2(x)	((x) != 0 && (((x) & ((x) - 1)) == 0))
15902bf63c8332 Michal Simek 2009-05-26  189  

:::::: The code at line 188 was first introduced by commit
:::::: 15902bf63c8332946e5a1f48a72e3ae22874b11b microblaze_mmu_v2: Page table - ioremap - pgtable.c/h, section update

:::::: TO: Michal Simek <monstr@monstr.eu>
:::::: CC: Michal Simek <monstr@monstr.eu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
