Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D29367
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 01:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677547453; x=1709083453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VgM91EdZL5H1PsfGbcBLxWaivsgICoR6piMTbZXTNgA=;
  b=fyBU2if0Cg8GnCenuCkSSg/Rbe7tOgW2/o//taNptfACaFeYHAKWOVKB
   pW+meOAcLEZnuIkYLjnP4GuZRj4w/fgzMa2bKpNZdFICspomFp/tH+rvd
   8j6gY1a7VSUu8FmpH26Ity3Ze7zxLyJSBvLk+EsaYSMNcE9J1TQH/KZ6C
   QuCSGCBp78pcjLkGO5vOkLmy8eL5IltOeK7uKaA38xmXNjoCNjgYg0wY6
   GdFU/T25N8nueqlhr2AqQVmL3SX6MGttFLMR6emNCp1OeAPjZjD7LZ4+D
   JBb0Rz0jZMKkwkblK4cv/x4bguBSTLEmmFibtjsRu6P2iPOYkqH1nweem
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317819453"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="317819453"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 17:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="848073201"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="848073201"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Feb 2023 17:24:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWoiw-0004xb-2d;
	Tue, 28 Feb 2023 01:24:10 +0000
Date: Tue, 28 Feb 2023 09:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 315/583]
 drivers/char/broadcom/bcm2835-gpiomem.c:110:29: error: implicit declaration
 of function 'phys_mem_access_prot'; did you mean
 'phys_mem_access_prot_allowed'?
Message-ID: <202302280914.saJgfCR1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi popcornmix,

First bad commit (maybe != root cause):

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: d1d5f68880b390d41b4116a4187a4d52fbb94b0a [315/583] char: Add broadcom char drivers back to build files
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230228/202302280914.saJgfCR1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/d1d5f68880b390d41b4116a4187a4d52fbb94b0a
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout d1d5f68880b390d41b4116a4187a4d52fbb94b0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280914.saJgfCR1-lkp@intel.com/

Note: the l1k/rpi-6.2.y-await-linktraining HEAD f3a9201f7f484c1295cdec53c1b9bd2a19ffb231 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/char/broadcom/bcm2835-gpiomem.c: In function 'bcm2835_gpiomem_mmap':
>> drivers/char/broadcom/bcm2835-gpiomem.c:110:29: error: implicit declaration of function 'phys_mem_access_prot'; did you mean 'phys_mem_access_prot_allowed'? [-Werror=implicit-function-declaration]
     110 |         vma->vm_page_prot = phys_mem_access_prot(file, gpio_page,
         |                             ^~~~~~~~~~~~~~~~~~~~
         |                             phys_mem_access_prot_allowed
>> drivers/char/broadcom/bcm2835-gpiomem.c:110:29: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
   cc1: some warnings being treated as errors
--
   drivers/char/broadcom/rpivid-mem.c: In function 'rpivid_mem_mmap':
>> drivers/char/broadcom/rpivid-mem.c:112:29: error: implicit declaration of function 'phys_mem_access_prot'; did you mean 'phys_mem_access_prot_allowed'? [-Werror=implicit-function-declaration]
     112 |         vma->vm_page_prot = phys_mem_access_prot(file, pages, len,
         |                             ^~~~~~~~~~~~~~~~~~~~
         |                             phys_mem_access_prot_allowed
>> drivers/char/broadcom/rpivid-mem.c:112:29: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_TLV320AIC32X4_I2C
   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && I2C [=m] && COMMON_CLK [=n]
   Selected by [m]:
   - SND_AUDIOSENSE_PI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   WARNING: unmet direct dependencies detected for COMMON_CLK_HIFIBERRY_DACPRO
   Depends on [n]: COMMON_CLK [=n]
   Selected by [m]:
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUS [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADCPRO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   WARNING: unmet direct dependencies detected for COMMON_CLK_HIFIBERRY_DACPLUSHD
   Depends on [n]: COMMON_CLK [=n]
   Selected by [m]:
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSHD [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])


vim +110 drivers/char/broadcom/bcm2835-gpiomem.c

b571183670210c Luke Wren 2015-08-21  103  
b571183670210c Luke Wren 2015-08-21  104  static int bcm2835_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
b571183670210c Luke Wren 2015-08-21  105  {
b571183670210c Luke Wren 2015-08-21  106  	/* Ignore what the user says - they're getting the GPIO regs
b571183670210c Luke Wren 2015-08-21  107  	   whether they like it or not! */
b571183670210c Luke Wren 2015-08-21  108  	unsigned long gpio_page = inst->gpio_regs_phys >> PAGE_SHIFT;
b571183670210c Luke Wren 2015-08-21  109  
b571183670210c Luke Wren 2015-08-21 @110  	vma->vm_page_prot = phys_mem_access_prot(file, gpio_page,
b571183670210c Luke Wren 2015-08-21  111  						 PAGE_SIZE,
b571183670210c Luke Wren 2015-08-21  112  						 vma->vm_page_prot);
b571183670210c Luke Wren 2015-08-21  113  	vma->vm_ops = &bcm2835_gpiomem_vm_ops;
b571183670210c Luke Wren 2015-08-21  114  	if (remap_pfn_range(vma, vma->vm_start,
b571183670210c Luke Wren 2015-08-21  115  			gpio_page,
b571183670210c Luke Wren 2015-08-21  116  			PAGE_SIZE,
b571183670210c Luke Wren 2015-08-21  117  			vma->vm_page_prot)) {
b571183670210c Luke Wren 2015-08-21  118  		return -EAGAIN;
b571183670210c Luke Wren 2015-08-21  119  	}
b571183670210c Luke Wren 2015-08-21  120  	return 0;
b571183670210c Luke Wren 2015-08-21  121  }
b571183670210c Luke Wren 2015-08-21  122  

:::::: The code at line 110 was first introduced by commit
:::::: b571183670210c9b2901c27e49855daa267deee7 Add /dev/gpiomem device for rootless user GPIO access

:::::: TO: Luke Wren <luke@raspberrypi.org>
:::::: CC: Dom Cobley <popcornmix@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
