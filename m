Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4931C800
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766826040; cv=none; b=YOvweNKkiqbiJG3vLLpiIxtXt+WXXTHlH0O2/jbC4W0Ly724RkwkeVkeQ1Tiu8Ghu7wUjVIMA90dPoMRr9VOkhdYZFpjdhIh90LtKpydAdoil92mqeFSByWD9ePaDHbE0n1cORhtZY+pPA4WmLKbLiybXzGfCDrWIe0HZKrNA64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766826040; c=relaxed/simple;
	bh=n5inCwHWzYpy3WE9B4h1DnosQfurxUPswXI881k/kTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KtcgVRY/91TVvztI6d/nvHlCgI4Qwa6uzGMkAnxaTI/wLcfM1JPancVrxqVB97iOebTRi/bAZi09WgCC2J4kiDVndgnYN37aMLevSm6oN7KyyJTo8Q1hO6OOcVmkMAnanVT67ncEkhgjmrhfnVv7tyzjFbGLhqWkCw0qaGM1UAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk+se8gc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk+se8gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766826039; x=1798362039;
  h=date:from:to:cc:subject:message-id;
  bh=n5inCwHWzYpy3WE9B4h1DnosQfurxUPswXI881k/kTM=;
  b=Nk+se8gc7jtrxQ+jvE5yENNWjJLO+p5zo2LGSAwVhlH/JtOpsC6N47JY
   RzqQ3Dn368i5hsV5P96ioW8bB6dfFkPzVXz3bvfgqBjp2i86NeuIW7KBf
   KATjNQP7O2kHMlG63JPdmXnv4dWg5YsaKiUdgQIhdvT+F6Nq91qbg0yQ9
   aez3KKLinye99N4RFAu2Exo5ucge9eSFUY/TxK1Im5pujlR805CMSdE2h
   OMDM1eTiANlcCiqlnFlUFOM0d9iHKDy6YzwVdQA9540+olUYYuBTryRnE
   BzP88mQrpMbB0tWmeRf7Rxs/ssM5H4NrzDqXg1nawoipUJLMDDBIceakg
   w==;
X-CSE-ConnectionGUID: 9q7QnUQTSOmg23iUGVAi0A==
X-CSE-MsgGUID: tC4JxhqGTsypQnHUqFenQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68612563"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68612563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 01:00:39 -0800
X-CSE-ConnectionGUID: /fFQpWR+R4uK4aTWqYrBXg==
X-CSE-MsgGUID: SCppjJnLTsS31BqaEWxSlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="224012115"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Dec 2025 01:00:37 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZQA7-000000005hl-0WyL;
	Sat, 27 Dec 2025 09:00:35 +0000
Date: Sat, 27 Dec 2025 17:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 20/29]
 drivers/firmware/efi/libstub/zboot.c:102:18: error: too few arguments to
 function 'efi_zboot_decompress'; expected 3, have 2
Message-ID: <202512271600.YUUVWqqd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: 48d32d494f9f9a7f30d08647fd94bf20c50705e9 [20/29] efi/zboot: Add support for ELF payloads
config: loongarch-randconfig-r071-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271600.YUUVWqqd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271600.YUUVWqqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271600.YUUVWqqd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype for 'entry_offset' [-Wmissing-prototypes]
      36 | unsigned long entry_offset(void)
         |               ^~~~~~~~~~~~
   drivers/firmware/efi/libstub/zboot.c: In function 'efi_zboot_entry':
>> drivers/firmware/efi/libstub/zboot.c:102:18: error: too few arguments to function 'efi_zboot_decompress'; expected 3, have 2
     102 |         status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
         |                  ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/libstub/zboot.c:8:
   drivers/firmware/efi/libstub/efistub.h:1268:14: note: declared here
    1268 | efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen,
         |              ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +/efi_zboot_decompress +102 drivers/firmware/efi/libstub/zboot.c

48d32d494f9f9a Ard Biesheuvel 2024-12-16   35  
48d32d494f9f9a Ard Biesheuvel 2024-12-16  @36  unsigned long entry_offset(void)
48d32d494f9f9a Ard Biesheuvel 2024-12-16   37  {
48d32d494f9f9a Ard Biesheuvel 2024-12-16   38  	return entrypoint;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   39  }
48d32d494f9f9a Ard Biesheuvel 2024-12-16   40  
a050910972bb25 Ard Biesheuvel 2022-05-02   41  asmlinkage efi_status_t __efiapi
a050910972bb25 Ard Biesheuvel 2022-05-02   42  efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
a050910972bb25 Ard Biesheuvel 2022-05-02   43  {
0dc1754e16b4c1 Ard Biesheuvel 2024-11-20   44  	char *cmdline_ptr __free(efi_pool) = NULL;
026b85796ab4d5 Ard Biesheuvel 2023-04-18   45  	unsigned long image_base, alloc_size;
c51e97e7f1295d Ard Biesheuvel 2022-10-13   46  	efi_loaded_image_t *image;
a050910972bb25 Ard Biesheuvel 2022-05-02   47  	efi_status_t status;
a050910972bb25 Ard Biesheuvel 2022-05-02   48  
a050910972bb25 Ard Biesheuvel 2022-05-02   49  	WRITE_ONCE(efi_system_table, systab);
a050910972bb25 Ard Biesheuvel 2022-05-02   50  
a050910972bb25 Ard Biesheuvel 2022-05-02   51  	status = efi_bs_call(handle_protocol, handle,
c51e97e7f1295d Ard Biesheuvel 2022-10-13   52  			     &LOADED_IMAGE_PROTOCOL_GUID, (void **)&image);
a050910972bb25 Ard Biesheuvel 2022-05-02   53  	if (status != EFI_SUCCESS) {
0dc1754e16b4c1 Ard Biesheuvel 2024-11-20   54  		efi_err("Failed to locate parent's loaded image protocol\n");
a050910972bb25 Ard Biesheuvel 2022-05-02   55  		return status;
a050910972bb25 Ard Biesheuvel 2022-05-02   56  	}
a050910972bb25 Ard Biesheuvel 2022-05-02   57  
c51e97e7f1295d Ard Biesheuvel 2022-10-13   58  	status = efi_handle_cmdline(image, &cmdline_ptr);
c51e97e7f1295d Ard Biesheuvel 2022-10-13   59  	if (status != EFI_SUCCESS)
a050910972bb25 Ard Biesheuvel 2022-05-02   60  		return status;
a050910972bb25 Ard Biesheuvel 2022-05-02   61  
c51e97e7f1295d Ard Biesheuvel 2022-10-13   62  	efi_info("Decompressing Linux Kernel...\n");
c51e97e7f1295d Ard Biesheuvel 2022-10-13   63  
48d32d494f9f9a Ard Biesheuvel 2024-12-16   64  	status = efi_zboot_decompress_init(&alloc_size, &entrypoint);
0dc1754e16b4c1 Ard Biesheuvel 2024-11-20   65  	if (status != EFI_SUCCESS)
0dc1754e16b4c1 Ard Biesheuvel 2024-11-20   66  		return status;
c51e97e7f1295d Ard Biesheuvel 2022-10-13   67  
c51e97e7f1295d Ard Biesheuvel 2022-10-13   68  	 // If the architecture has a preferred address for the image,
c51e97e7f1295d Ard Biesheuvel 2022-10-13   69  	 // try that first.
c51e97e7f1295d Ard Biesheuvel 2022-10-13   70  	image_base = alloc_preferred_address(alloc_size);
c51e97e7f1295d Ard Biesheuvel 2022-10-13   71  	if (image_base == ULONG_MAX) {
c51e97e7f1295d Ard Biesheuvel 2022-10-13   72  		unsigned long min_kimg_align = efi_get_kimg_min_align();
c51e97e7f1295d Ard Biesheuvel 2022-10-13   73  		u32 seed = U32_MAX;
c51e97e7f1295d Ard Biesheuvel 2022-10-13   74  
c51e97e7f1295d Ard Biesheuvel 2022-10-13   75  		if (!IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
c51e97e7f1295d Ard Biesheuvel 2022-10-13   76  			// Setting the random seed to 0x0 is the same as
c51e97e7f1295d Ard Biesheuvel 2022-10-13   77  			// allocating as low as possible
c51e97e7f1295d Ard Biesheuvel 2022-10-13   78  			seed = 0;
c51e97e7f1295d Ard Biesheuvel 2022-10-13   79  		} else if (efi_nokaslr) {
c51e97e7f1295d Ard Biesheuvel 2022-10-13   80  			efi_info("KASLR disabled on kernel command line\n");
c51e97e7f1295d Ard Biesheuvel 2022-10-13   81  		} else {
c51e97e7f1295d Ard Biesheuvel 2022-10-13   82  			status = efi_get_random_bytes(sizeof(seed), (u8 *)&seed);
c51e97e7f1295d Ard Biesheuvel 2022-10-13   83  			if (status == EFI_NOT_FOUND) {
c51e97e7f1295d Ard Biesheuvel 2022-10-13   84  				efi_info("EFI_RNG_PROTOCOL unavailable\n");
c51e97e7f1295d Ard Biesheuvel 2022-10-13   85  				efi_nokaslr = true;
c51e97e7f1295d Ard Biesheuvel 2022-10-13   86  			} else if (status != EFI_SUCCESS) {
c51e97e7f1295d Ard Biesheuvel 2022-10-13   87  				efi_err("efi_get_random_bytes() failed (0x%lx)\n",
c51e97e7f1295d Ard Biesheuvel 2022-10-13   88  					status);
c51e97e7f1295d Ard Biesheuvel 2022-10-13   89  				efi_nokaslr = true;
a050910972bb25 Ard Biesheuvel 2022-05-02   90  			}
a050910972bb25 Ard Biesheuvel 2022-05-02   91  		}
a050910972bb25 Ard Biesheuvel 2022-05-02   92  
c51e97e7f1295d Ard Biesheuvel 2022-10-13   93  		status = efi_random_alloc(alloc_size, min_kimg_align, &image_base,
2f77465b05b127 Ard Biesheuvel 2024-01-30   94  					  seed, EFI_LOADER_CODE, 0, EFI_ALLOC_LIMIT);
a050910972bb25 Ard Biesheuvel 2022-05-02   95  		if (status != EFI_SUCCESS) {
c51e97e7f1295d Ard Biesheuvel 2022-10-13   96  			efi_err("Failed to allocate memory\n");
0dc1754e16b4c1 Ard Biesheuvel 2024-11-20   97  			return status;
a050910972bb25 Ard Biesheuvel 2022-05-02   98  		}
c51e97e7f1295d Ard Biesheuvel 2022-10-13   99  	}
a050910972bb25 Ard Biesheuvel 2022-05-02  100  
0dc1754e16b4c1 Ard Biesheuvel 2024-11-20  101  	// Decompress the payload into the newly allocated buffer
0dc1754e16b4c1 Ard Biesheuvel 2024-11-20 @102  	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:

:::::: The code at line 102 was first introduced by commit
:::::: 0dc1754e16b4c14ae42f6cf59f319331d885f0f6 efi/libstub: Avoid legacy decompressor zlib/zstd wrappers

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
