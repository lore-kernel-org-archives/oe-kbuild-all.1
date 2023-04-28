Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF9015AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682645258; x=1714181258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/V2s9U85XMAIoHtVkgQC2DonYeVYqHUbkxCJ7FEGIjE=;
  b=TgIjTDNBK+WyJPPvJWcKPJgOncXRTfdCDJG3NFquZN4G/JI1DfeeTp8u
   9h/bmlSzJg+xW1aFixWNtw/FqBkZzs9BisNs++Gl0wc3oQwAndyn75CKy
   TqWOZLu7OM+NHRnY8yykuFOPFmpU239e6FIaSuor4bqxmNxliWGVFSqfS
   39dLnTZjyQuJ0XMcT6BQIaB06OICE1elevw5XqFItZxxDeUc3vn5a0fqn
   lQNZ9r9qjL2SeSrVFS46tQV/qMYa0KzJvu8GDcghMy5YNh5reqPHruYzy
   mL7eG22m5QgMVoW5ub4S6PVH8Q6erq4b5l4omi8+82ZQqw34C9Vse9JdW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="345071970"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="345071970"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 18:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868962668"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="868962668"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 18:27:32 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psCtX-0000GH-21;
	Fri, 28 Apr 2023 01:27:31 +0000
Date: Fri, 28 Apr 2023 09:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:for-next 71/73]
 drivers/firmware/efi/libstub/efi-stub-helper.c:825:30: warning: implicit
 declaration of function 'efi_get_kimg_min_align'
Message-ID: <202304280951.J4cWLyx7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   6ea13757cbd6077ce0a7f54c80f9a75ec16e14d1
commit: 17e3193214a13b77e1ce3ec38d819904da2ab7a8 [71/73] arm64: libstub: Move KASLR handling functions to efi-stub-helper.c
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230428/202304280951.J4cWLyx7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=17e3193214a13b77e1ce3ec38d819904da2ab7a8
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer for-next
        git checkout 17e3193214a13b77e1ce3ec38d819904da2ab7a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280951.J4cWLyx7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/efi-stub-helper.c: In function 'efi_kaslr_relocate_kernel':
>> drivers/firmware/efi/libstub/efi-stub-helper.c:825:30: warning: implicit declaration of function 'efi_get_kimg_min_align' [-Wimplicit-function-declaration]
     825 |         u64 min_kimg_align = efi_get_kimg_min_align();
         |                              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/efi-stub-helper.c:868:9: warning: implicit declaration of function 'caches_clean_inval_pou' [-Wimplicit-function-declaration]
     868 |         caches_clean_inval_pou(*image_addr, *image_addr + kernel_codesize);
         |         ^~~~~~~~~~~~~~~~~~~~~~


vim +/efi_get_kimg_min_align +825 drivers/firmware/efi/libstub/efi-stub-helper.c

   799	
   800	/**
   801	 * efi_kaslr_relocate_kernel() - Relocate the kernel (random if KASLR enabled)
   802	 * @image_addr:	Pointer to the current kernel location
   803	 * @reserve_addr:	Pointer to the relocated kernel location
   804	 * @reserve_size:	Size of the relocated kernel
   805	 * @kernel_size:	Size of the text + data
   806	 * @kernel_codesize:	Size of the text
   807	 * @kernel_memsize:	Size of the text + data + bss
   808	 * @phys_seed:		Random seed used for the relocation
   809	 *
   810	 * If KASLR is not enabled, this function relocates the kernel to a fixed
   811	 * address (or leave it as its current location). If KASLR is enabled, the
   812	 * kernel physical location is randomized using the seed in parameter.
   813	 *
   814	 * Return:	status code, EFI_SUCCESS if relocation is successful
   815	 */
   816	efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
   817					       unsigned long *reserve_addr,
   818					       unsigned long *reserve_size,
   819					       unsigned long kernel_size,
   820					       unsigned long kernel_codesize,
   821					       unsigned long kernel_memsize,
   822					       u32 phys_seed)
   823	{
   824		efi_status_t status;
 > 825		u64 min_kimg_align = efi_get_kimg_min_align();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
