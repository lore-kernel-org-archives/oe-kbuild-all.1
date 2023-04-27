Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3202533D9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682609908; x=1714145908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iA/lmj8eN+AYFls32Q1l/lmleuyuAdD46e7b2lMcWLU=;
  b=UFP7t2XDEyORRwqeQbcDA5Cg9i8GpXvB0dfoCBCnSiFWIG4g5/7lOncV
   k8t9RZrvjXrsV73PhLfIC8BmXuz4YDR2IOpN4fc4hVtJVPypI+UKAgiZw
   gtFmSwisA1aNXrNg5IdXM9KDJjwBsse/PCGqNnyAnfDBgobOdG3HhEVLa
   qkiFs30Fte7ovBfreXs9DhFfrsmEygKLgSlxOmYm47kyMLoxHt0SPQRch
   Pa9AT73ihCkXvM6IbA+DKlPr6MZdWEGKD/F2jeDhcr26uDvtnaa+6zeJw
   Z0eidYO9gOyMlfzGUPjzw1h+/dmnvC2pecOuabMV58XqChhHnGJWgEqJE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="433764546"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="433764546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 08:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868771525"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="868771525"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 08:38:26 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps3hR-0000Iz-2m;
	Thu, 27 Apr 2023 15:38:25 +0000
Date: Thu, 27 Apr 2023 23:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:next 1/1] include/linux/tpm.h:285:9: error:
 redeclaration of enumerator 'TPM_CHIP_FLAG_FIRMWARE_UPGRADE'
Message-ID: <202304272341.NHxy54IG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git next
head:   e2f14081c68395f0b0f9072bbf5e56450b1cb3f8
commit: e2f14081c68395f0b0f9072bbf5e56450b1cb3f8 [1/1] tpm: Re-enable TPM chip boostrapping non-tpm_tis TPM drivers
config: m68k-buildonly-randconfig-r005-20230427 (https://download.01.org/0day-ci/archive/20230427/202304272341.NHxy54IG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=e2f14081c68395f0b0f9072bbf5e56450b1cb3f8
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd next
        git checkout e2f14081c68395f0b0f9072bbf5e56450b1cb3f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash security/keys/trusted-keys/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304272341.NHxy54IG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/keys/trusted-type.h:12,
                    from security/keys/trusted-keys/trusted_core.c:10:
>> include/linux/tpm.h:285:9: error: redeclaration of enumerator 'TPM_CHIP_FLAG_FIRMWARE_UPGRADE'
     285 |         TPM_CHIP_FLAG_FIRMWARE_UPGRADE          = BIT(7),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tpm.h:284:9: note: previous definition of 'TPM_CHIP_FLAG_FIRMWARE_UPGRADE' with type 'int'
     284 |         TPM_CHIP_FLAG_FIRMWARE_UPGRADE          = BIT(7),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tpm.h:286:9: error: redeclaration of enumerator 'TPM_CHIP_FLAG_FIRMWARE_UPGRADE'
     286 |         TPM_CHIP_FLAG_FIRMWARE_UPGRADE          = BIT(7),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tpm.h:285:9: note: previous definition of 'TPM_CHIP_FLAG_FIRMWARE_UPGRADE' with type 'int'
     285 |         TPM_CHIP_FLAG_FIRMWARE_UPGRADE          = BIT(7),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/TPM_CHIP_FLAG_FIRMWARE_UPGRADE +285 include/linux/tpm.h

   275	
   276	enum tpm_chip_flags {
   277		TPM_CHIP_FLAG_BOOTSTRAPPED		= BIT(0),
   278		TPM_CHIP_FLAG_TPM2			= BIT(1),
   279		TPM_CHIP_FLAG_IRQ			= BIT(2),
   280		TPM_CHIP_FLAG_VIRTUAL			= BIT(3),
   281		TPM_CHIP_FLAG_HAVE_TIMEOUTS		= BIT(4),
   282		TPM_CHIP_FLAG_ALWAYS_POWERED		= BIT(5),
   283		TPM_CHIP_FLAG_FIRMWARE_POWER_MANAGED	= BIT(6),
   284		TPM_CHIP_FLAG_FIRMWARE_UPGRADE		= BIT(7),
 > 285		TPM_CHIP_FLAG_FIRMWARE_UPGRADE		= BIT(7),
   286		TPM_CHIP_FLAG_FIRMWARE_UPGRADE		= BIT(7),
   287	};
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
