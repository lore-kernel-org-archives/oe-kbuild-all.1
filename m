Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5C819E99F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766830625; cv=none; b=OwdDHTM9qW/FEPsGKRY/aHrIhMMeCR7ATS5qLHvi63QH+ORDe6PbAwDGVOQhsuSAdHjfdW4sqT9lGc13Ff/BncTRJ+eHuRNK5j8reQ4TIrFe+QErPrYpCCTxcRNIsYyVjPbwkHm4ai97xrr0p+ujTuPWSJUIG1IdyLtgUDzMpM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766830625; c=relaxed/simple;
	bh=waLyeQh/IwLLwgylCpFfApcTpRKojb9K/QEkwCXohwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CKWJu/bC71f8lG5hoHs6M+6meCDZoqsjncfIlLRE+/lLJdx4dMqpVp0SwAjyc/Xy7OAQBCaMekOTlOsX3VDL5Aw++0KC2P8WCjJ/I3+yq7Q/+VHIOtM1ORvoIi+UEliC59A+5GUeweVrwz3xHoxWrpBojoaWh+j6H9F9oF2GKCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UC+REEA5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UC+REEA5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766830623; x=1798366623;
  h=date:from:to:cc:subject:message-id;
  bh=waLyeQh/IwLLwgylCpFfApcTpRKojb9K/QEkwCXohwo=;
  b=UC+REEA5NQP0AhV8TVCA528q6eHGN2hannPYbh+mt7fiyG8/1qmlW072
   41Lvist6hIk0VWjYz0ed6BNoosBBmUt3db7RYnvp+L/NgfekS5oXIJeP5
   OrfVtUG80NNEoIBma4NsFDYzESLANvmIzTeON6biBkqPx3Rtr2OPV0heh
   8Sh1EQd6Wx8PlH0fEaCaVih5KNgSirBlHf/nr+AaCKRDQSZ+W9qvDxmrF
   Tuy7j7zCGiYsmJID3shwYqjMOiT7tcjLw9/tOBIUm3WGqe5eatHcrFtvU
   gk7KpubIv5QVCxjXD+/1ZrxudMKxKPNXg5SPiimeChSt+QoOvsD9VY9jE
   w==;
X-CSE-ConnectionGUID: kHAVSb3VQqGkNGpVKQxNZA==
X-CSE-MsgGUID: eLMXxtVuRQqnbPV26+kMMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68614383"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68614383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 02:17:02 -0800
X-CSE-ConnectionGUID: LssgIFdESnC86S+7Xir6eA==
X-CSE-MsgGUID: OuCkhoS6Toii6OcKr42N1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200449517"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Dec 2025 02:17:01 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZRM3-000000005jV-0j2w;
	Sat, 27 Dec 2025 10:16:59 +0000
Date: Sat, 27 Dec 2025 18:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 20/29]
 drivers/firmware/efi/libstub/zboot.c:102:11: error: too few arguments to
 function 'efi_zboot_decompress'
Message-ID: <202512271845.G7pNw5Jv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: 48d32d494f9f9a7f30d08647fd94bf20c50705e9 [20/29] efi/zboot: Add support for ELF payloads
config: riscv-randconfig-002-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271845.G7pNw5Jv-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271845.G7pNw5Jv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271845.G7pNw5Jv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype for 'entry_offset' [-Wmissing-prototypes]
      36 | unsigned long entry_offset(void)
         |               ^~~~~~~~~~~~
   drivers/firmware/efi/libstub/zboot.c: In function 'efi_zboot_entry':
>> drivers/firmware/efi/libstub/zboot.c:102:11: error: too few arguments to function 'efi_zboot_decompress'
     102 |  status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
         |           ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/libstub/zboot.c:8:
   drivers/firmware/efi/libstub/efistub.h:1268:14: note: declared here
    1268 | efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen,
         |              ^~~~~~~~~~~~~~~~~~~~


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
