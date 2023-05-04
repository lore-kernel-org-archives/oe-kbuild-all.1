Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9AFBF7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683212296; x=1714748296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z63+Q/NqkOUMQyIaiCl8XuguPlk7KHCDiIRvcYOthno=;
  b=T8MiKlmPNJAqyv0aIlS7UF3h7QVcAyx1AqSIiO+EppdRyzef/RN6FGhh
   h3rOau1/cUsSgXawhP6tGtYFRni8U5bej/xmG/FXG9IA3iDeVG1tReQNR
   OYoxvd26Cydua8HP1CwIpwlTl96Vv26isKE2eMp46VNVgjtFsLp5d2ipB
   mVxR6HP4/lj85+rXLhd3pLXsrthyeDljf471uXwTA6vkAfVTEzvv4Qljh
   VT+h5oRdTEtqogEXLUsqp71FpyXGzDsiC71cX2+hlm9P8b5TBMA1QlzLj
   5fU5N+7CCHGpALRrge3fGErdQpwmgU+00Gp+cAeUr7Id0Wg4hqo7ZRBH3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="351971737"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="351971737"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 07:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="647366552"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="647366552"
Received: from lkp-server01.sh.intel.com (HELO d0e14d8700eb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 May 2023 07:55:42 -0700
Received: from kbuild by d0e14d8700eb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puaMv-00002U-2t;
	Thu, 04 May 2023 14:55:41 +0000
Date: Thu, 4 May 2023 22:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup 15/15]
 drivers/firmware/efi/libstub/x86-stub.c:825:35: warning: implicit
 declaration of function 'kaslr_get_random_long'; did you mean
 'get_random_long'?
Message-ID: <202305042245.HXjdUQy7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup
head:   1201fa1f2a7026937d0a906b96b4e4ec12e65079
commit: 1201fa1f2a7026937d0a906b96b4e4ec12e65079 [15/15] x86: efistub: Avoid legacy decompressor when doing EFI boot
config: i386-randconfig-a004-20230501 (https://download.01.org/0day-ci/archive/20230504/202305042245.HXjdUQy7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=1201fa1f2a7026937d0a906b96b4e4ec12e65079
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efistub-cleanup
        git checkout 1201fa1f2a7026937d0a906b96b4e4ec12e65079
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042245.HXjdUQy7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/x86-stub.c: In function 'efi_get_seed':
>> drivers/firmware/efi/libstub/x86-stub.c:825:35: warning: implicit declaration of function 'kaslr_get_random_long'; did you mean 'get_random_long'? [-Wimplicit-function-declaration]
     825 |         *(unsigned long *)seed ^= kaslr_get_random_long("EFI");
         |                                   ^~~~~~~~~~~~~~~~~~~~~
         |                                   get_random_long


vim +825 drivers/firmware/efi/libstub/x86-stub.c

   816	
   817	static void efi_get_seed(void *seed, int size)
   818	{
   819		efi_get_random_bytes(size, seed);
   820	
   821		/*
   822		 * This only updates seed[0] when running on 32-bit, but in that case,
   823		 * we don't use seed[1] anyway, as there is no virtual KASLR on 32-bit.
   824		 */
 > 825		*(unsigned long *)seed ^= kaslr_get_random_long("EFI");
   826	}
   827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
