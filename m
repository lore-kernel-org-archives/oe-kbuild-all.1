Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040BF3B42E6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366791; cv=none; b=ejyqaTSC5jcG5YhPaa4Utpu3SZvAwEVxuRy6tBTQ0Gzk3FHCDNkrJsLn5L5a3fC/EramFr+hC7Orp5vdj3F9R/FHZlhlHakDVcYeOszdhMEHYvHnOngpTjmsvy8rDiUiJF4YwiIudmEMiBgUCDnb1FPVxMlTzFv9UbxEF+YWfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366791; c=relaxed/simple;
	bh=XzeO4z+5kLBHfKtDB01hxv6xYsV34q9F+rVWjbhUDCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BH8E/rDbPkuCAYlvctvdxU4URI61nmtoReqaJkgtUtA2KKmiYMhr7TyO4gDUkJSsiK0sebY5Io/aJiob1+n8TwLrCrA65896kVgORx9sNCj6b51z+YAmenUaxOIlcKV6eQLWwVhnBTEHpLEXAlC4QpIYtMJ6EgvaeW+9T/AUtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpU0nwXc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpU0nwXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791366779; x=1822902779;
  h=date:from:to:cc:subject:message-id;
  bh=XzeO4z+5kLBHfKtDB01hxv6xYsV34q9F+rVWjbhUDCU=;
  b=lpU0nwXccOIfJ1u17xdINqoutn5i++qSHmNZpEvBxgfKYjL70mZ0ydTS
   U2ATYVjd2c23n1NGO1PuANG1w43nw9JAyI23uzPu04ALKaFeJnaKiYl6o
   8kvV9MRnhz9dszpf7b7Iv7OsU4XyAKVkaBe367nien0CByOMh8qI/jkYC
   ZIzZ8Soxj6oa5RAl/EjxgD72Gr9LA0NSnNTPOgoEkLMQjXaSinN0uakeG
   v8+iXZD4e0KOKYtRj3AUhESCitZG4FgrM+6bI6M8MyUK8pDCf8D6Dp1cj
   rhAXjrLVO5H/D7UfHkxuYPJQUUZmzEk8dOwFhPYeKYyGeZvm2JrpUXxAl
   g==;
X-CSE-ConnectionGUID: cMILi+0IQne0bbs/8QimPQ==
X-CSE-MsgGUID: H1OOj8l9R+u9udfXmdl2qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="5282"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="5282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:52:58 -0700
X-CSE-ConnectionGUID: 27YDDbMHQF6JMyDXioqJiA==
X-CSE-MsgGUID: 01317ZGcRva7O4AAExTNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285490753"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2026 02:52:57 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEOKU-000000002tR-23Iq;
	Wed, 07 Oct 2026 09:52:54 +0000
Date: Wed, 07 Oct 2026 11:52:36 +0200
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.3-rc2/efistub-cflags/v1 1/3]
 drivers/firmware/efi/libstub/x86-stub.c:912:17: error: conflicting types for
 'efi_stub_entry'; have 'void(void *, efi_system_table_t *, struct boot_params
 *)'
Message-ID: <202610071108.136si3jJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.3-rc2/efistub-cflags/v1
head:   2159811d2ce7cc76c851f7090c74da858e730202
commit: 583443a6eb93a57ef3cd3d24ca433b679d27a238 [1/3] efi/libstub: Declare the x86 stub's assembly entry points
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261007/202610071108.136si3jJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071108.136si3jJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071108.136si3jJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/x86-stub.c:912:17: error: conflicting types for 'efi_stub_entry'; have 'void(void *, efi_system_table_t *, struct boot_params *)'
     912 | void __noreturn efi_stub_entry(efi_handle_t handle,
         |                 ^~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/libstub/x86-stub.c:22:
   drivers/firmware/efi/libstub/x86-stub.h:13:28: note: previous declaration of 'efi_stub_entry' with type 'void(void *, efi_system_table_t *, struct boot_params *)'
      13 | asmlinkage void __noreturn efi_stub_entry(efi_handle_t handle,
         |                            ^~~~~~~~~~~~~~
>> drivers/firmware/efi/libstub/x86-stub.c:1054:6: error: conflicting types for 'efi_handover_entry'; have 'void(void *, efi_system_table_t *, struct boot_params *)'
    1054 | void efi_handover_entry(efi_handle_t handle, efi_system_table_t *sys_table_arg,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/x86-stub.h:16:17: note: previous declaration of 'efi_handover_entry' with type 'void(void *, efi_system_table_t *, struct boot_params *)'
      16 | asmlinkage void efi_handover_entry(efi_handle_t handle,
         |                 ^~~~~~~~~~~~~~~~~~


vim +912 drivers/firmware/efi/libstub/x86-stub.c

d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   906  
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19   907  /*
d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   908   * On success, this routine will jump to the relocated image directly and never
d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   909   * return.  On failure, it will exit to the firmware via efi_exit() instead of
d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   910   * returning.
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19   911   */
df9215f15206c2 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  @912  void __noreturn efi_stub_entry(efi_handle_t handle,
c3710de5065d63 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24   913  			       efi_system_table_t *sys_table_arg,
796eb8d26a57f9 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2020-01-13   914  			       struct boot_params *boot_params)
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   915  
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19   916  {
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   917  	efi_guid_t guid = EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID;
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16   918  	const struct linux_efi_initrd *initrd = NULL;
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   919  	unsigned long kernel_entry;
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   920  	struct setup_header *hdr;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19   921  	efi_status_t status;
54b52d87268034 arch/x86/boot/compressed/eboot.c        Matt Fleming               2014-01-10   922  
ccc27ae7749425 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-04-16   923  	efi_system_table = sys_table_arg;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19   924  	/* Check if we were booted by the EFI firmware */
ccc27ae7749425 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-04-16   925  	if (efi_system_table->hdr.signature != EFI_SYSTEM_TABLE_SIGNATURE)
3b8f44fc0810d5 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-16   926  		efi_exit(handle, EFI_INVALID_PARAMETER);
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19   927  
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   928  	if (!IS_ENABLED(CONFIG_EFI_HANDOVER_PROTOCOL) || !boot_params) {
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   929  		status = efi_allocate_bootparams(handle, &boot_params);
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   930  		if (status != EFI_SUCCESS)
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   931  			efi_exit(handle, status);
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   932  	}
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   933  
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   934  	hdr = &boot_params->hdr;
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   935  
31c77a50992e8d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   936  	if (have_unsupported_snp_features())
31c77a50992e8d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   937  		efi_exit(handle, EFI_UNSUPPORTED);
31c77a50992e8d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   938  
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   939  	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03   940  		efi_dxe_table = get_efi_config_table(EFI_DXE_SERVICES_TABLE_GUID);
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03   941  		if (efi_dxe_table &&
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03   942  		    efi_dxe_table->hdr.signature != EFI_DXE_SERVICES_TABLE_SIGNATURE) {
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03   943  			efi_warn("Ignoring DXE services table: invalid signature\n");
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03   944  			efi_dxe_table = NULL;
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03   945  		}
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   946  	}
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   947  
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   948  	/* grab the memory attributes protocol if it exists */
11078876b7a6a1 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   949  	efi_bs_call(locate_protocol, &guid, NULL, (void **)&memattr);
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy             2022-03-03   950  
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   951  	status = efi_setup_5level_paging();
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   952  	if (status != EFI_SUCCESS) {
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   953  		efi_err("efi_setup_5level_paging() failed!\n");
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   954  		goto fail;
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   955  	}
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   956  
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   957  #ifdef CONFIG_CMDLINE_BOOL
15aa8fb852f995 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-05-16   958  	status = parse_options(CONFIG_CMDLINE);
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   959  	if (status != EFI_SUCCESS) {
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   960  		efi_err("Failed to parse options\n");
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   961  		goto fail;
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   962  	}
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   963  #endif
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   964  	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   965  		unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
c33ce984435bb6 arch/x86/boot/compressed/eboot.c        Hans de Goede              2018-09-12   966  					       ((u64)boot_params->ext_cmd_line_ptr << 32));
15aa8fb852f995 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-05-16   967  		status = parse_options((char *)cmdline_paddr);
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   968  		if (status != EFI_SUCCESS) {
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   969  			efi_err("Failed to parse options\n");
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   970  			goto fail;
055042bedd4e0a drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   971  		}
7dde67f2a23ac1 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   972  	}
c33ce984435bb6 arch/x86/boot/compressed/eboot.c        Hans de Goede              2018-09-12   973  
cd0d9d92c8bb46 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27   974  	if (efi_mem_encrypt > 0)
cd0d9d92c8bb46 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27   975  		hdr->xloadflags |= XLF_MEM_ENCRYPTION;
cd0d9d92c8bb46 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2024-02-27   976  
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26   977  	status = efi_decompress_kernel(&kernel_entry, boot_params);
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   978  	if (status != EFI_SUCCESS) {
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   979  		efi_err("Failed to decompress kernel\n");
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   980  		goto fail;
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   981  	}
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07   982  
ec93fc371f014a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03   983  	/*
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   984  	 * At this point, an initrd may already have been loaded by the
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   985  	 * bootloader and passed via bootparams. We permit an initrd loaded
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   986  	 * from the LINUX_EFI_INITRD_MEDIA_GUID device path to supersede it.
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   987  	 *
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   988  	 * If the device path is not present, any command-line initrd=
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   989  	 * arguments will be processed only if image is not NULL, which will be
987053a30016a7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   990  	 * the case only if we were loaded via the PE entry point.
ec93fc371f014a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03   991  	 */
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16   992  	status = efi_load_initrd(image, hdr->initrd_addr_max, ULONG_MAX,
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16   993  				 &initrd);
20287d56f52dab drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2021-11-19   994  	if (status != EFI_SUCCESS)
ec93fc371f014a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03   995  		goto fail;
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16   996  	if (initrd && initrd->size > 0) {
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16   997  		efi_set_u64_split(initrd->base, &hdr->ramdisk_image,
eed4e0193ee7b0 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30   998  				  &boot_params->ext_ramdisk_image);
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16   999  		efi_set_u64_split(initrd->size, &hdr->ramdisk_size,
eed4e0193ee7b0 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  1000  				  &boot_params->ext_ramdisk_size);
79d3219d4e56b3 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-04  1001  	}
ec93fc371f014a drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-03  1002  
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2022-09-16  1003  
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  1004  	/*
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  1005  	 * If the boot loader gave us a value for secure_boot then we use that,
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  1006  	 * otherwise we ask the BIOS.
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  1007  	 */
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  1008  	if (boot_params->secure_boot == efi_secureboot_mode_unset)
cd33a5c1d53e43 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  1009  		boot_params->secure_boot = efi_get_secureboot();
ccc829ba3624be arch/x86/boot/compressed/eboot.c        Matthew Garrett            2017-08-25  1010  
ccc829ba3624be arch/x86/boot/compressed/eboot.c        Matthew Garrett            2017-08-25  1011  	/* Ask the firmware to clear memory on unclean shutdown */
cd33a5c1d53e43 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  1012  	efi_enable_reset_attack_mitigation();
0d95981438c3bd arch/x86/boot/compressed/eboot.c        Dominik Brodowski          2019-11-06  1013  
cd33a5c1d53e43 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2019-12-24  1014  	efi_random_get_seed();
0d95981438c3bd arch/x86/boot/compressed/eboot.c        Dominik Brodowski          2019-11-06  1015  
d228814b191344 drivers/firmware/efi/libstub/x86-stub.c Kuppuswamy Sathyanarayanan 2024-02-15  1016  	efi_retrieve_eventlog();
de8cb458625c16 arch/x86/boot/compressed/eboot.c        David Howells              2017-02-06  1017  
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming               2012-07-19  1018  	setup_graphics(boot_params);
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  1019  
56394ab8c26893 arch/x86/boot/compressed/eboot.c        Matt Fleming               2014-09-11  1020  	setup_efi_pci(boot_params);
dd5fc854de5fd3 arch/x86/boot/compressed/eboot.c        Matthew Garrett            2012-12-05  1021  
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1022  	setup_quirks(boot_params);
58c5475aba6770 arch/x86/boot/compressed/eboot.c        Lukas Wunner               2016-11-12  1023  
c0461bd1666635 drivers/firmware/efi/libstub/x86-stub.c Dionna Glaze               2023-06-06  1024  	setup_unaccepted_memory();
c0461bd1666635 drivers/firmware/efi/libstub/x86-stub.c Dionna Glaze               2023-06-06  1025  
aab9593c0cb445 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel             2018-07-20  1026  	status = exit_boot(boot_params, handle);
fb86b2440de0ec arch/x86/boot/compressed/eboot.c        Ulf Winkelvos              2014-07-10  1027  	if (status != EFI_SUCCESS) {
36bdd0a78d5683 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar              2020-04-30  1028  		efi_err("exit_boot() failed!\n");
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  1029  		goto fail;
fb86b2440de0ec arch/x86/boot/compressed/eboot.c        Ulf Winkelvos              2014-07-10  1030  	}
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  1031  
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1032  	/*
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1033  	 * Call the SEV init code while still running with the firmware's
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1034  	 * GDT/IDT, so #VC exceptions will be handled by EFI.
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1035  	 */
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1036  	sev_enable(boot_params);
cb1c9e02b0c130 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1037  
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1038  	efi_5level_switch();
d2d7a54f69b67c drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1039  
a1b87d54f4e45f drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1040  	enter_kernel(kernel_entry, boot_params);
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  1041  fail:
df9215f15206c2 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1042  	efi_err("efi_stub_entry() failed!\n");
90a2186b7df183 arch/x86/boot/compressed/eboot.c        Ingo Molnar                2018-07-11  1043  
3b8f44fc0810d5 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2020-02-16  1044  	efi_exit(handle, status);
291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming               2011-12-12  1045  }
df9215f15206c2 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1046  
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  1047  efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  1048  				   efi_system_table_t *sys_table_arg)
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  1049  {
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  1050  	efi_stub_entry(handle, sys_table_arg, NULL);
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  1051  }
dac628e9563640 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2025-01-26  1052  
df9215f15206c2 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1053  #ifdef CONFIG_EFI_HANDOVER_PROTOCOL
d7156b986d4cc0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07 @1054  void efi_handover_entry(efi_handle_t handle, efi_system_table_t *sys_table_arg,
d7156b986d4cc0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1055  			struct boot_params *boot_params)
d7156b986d4cc0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1056  {
d7156b986d4cc0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1057  	memset(_bss, 0, _ebss - _bss);
d7156b986d4cc0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1058  	efi_stub_entry(handle, sys_table_arg, boot_params);
d7156b986d4cc0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1059  }
d7156b986d4cc0 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel             2023-08-07  1060  

:::::: The code at line 912 was first introduced by commit
:::::: df9215f15206c2a81909ccf60f21d170801dce38 x86/efistub: Simplify and clean up handover entry code

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
