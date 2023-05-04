Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2832EA94B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683219591; x=1714755591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=baBWoCXAZCPEuOvyuTmBjvea+9i4B4aDt4CYe8XeBIs=;
  b=EwTeo8vsG0MzVozxjgFRP2Mrp8G09x/RPBnDYQCEWvsJMxegipPz7zAV
   MpUxmGBCiMwVMRmpd/lVKEJzkv3t4ZjegyUhzQXYIl+6q9+qDzwSS7Wqj
   h+L0AUCwJ7j0vcy9nVI4EzHwYaDlGcL8EEuVYda3wu4vBBYp/rA7tVQ8/
   6QNh5o9OC5KXAWZ44rUTh+pCyXZZwwAJTpVw5VLv9LE9v7gYJ0oKsHZSK
   7QeFACFoJA3eO3mrkp0rDfnWop7EP9RR9giAC8n9VRr6MbHk4UcliJa1n
   zsXSYSJg/Ib/UTXkCHshkMbkJICQWEdITNMu712Gr+q5gw4D1+KWwEsgo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="435303679"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="435303679"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 09:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="762009936"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="762009936"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 May 2023 09:59:48 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pucJ1-00003o-31;
	Thu, 04 May 2023 16:59:47 +0000
Date: Fri, 5 May 2023 00:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup 15/15]
 drivers/firmware/efi/libstub/x86-stub.c:825:35: warning: implicit
 declaration of function 'kaslr_get_random_long'; did you mean
 'get_random_long'?
Message-ID: <202305050057.pH9XUcjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup
head:   f42a97cc423ed45c3d10175914700a3396b6458c
commit: f42a97cc423ed45c3d10175914700a3396b6458c [15/15] x86: efistub: Avoid legacy decompressor when doing EFI boot
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230505/202305050057.pH9XUcjY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=f42a97cc423ed45c3d10175914700a3396b6458c
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efistub-cleanup
        git checkout f42a97cc423ed45c3d10175914700a3396b6458c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050057.pH9XUcjY-lkp@intel.com/

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
