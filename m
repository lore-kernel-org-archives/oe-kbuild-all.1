Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB51322B7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 11:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770724302; cv=none; b=fOPXoL2F5PSmo7EePxDN2DlGIK4MOpI7oVbJ8EdC5JdRfjTNxRSyQ6rNoG6qRFa62qbEb8OJnxEpttH3BoNBV3A9xZ0DPx/ErTiIUz/SzOlRF8kRfZHDEn8ulB30ZuZ9zCdBb8/D3TOyCXEk3Yl3oJ91ZRWBwJatVCgMO2qnBpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770724302; c=relaxed/simple;
	bh=+A/0pOGodMjBOHe08tgO5PYNKBj4gWlddENLaoDL7dI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q3lEOtxIs5avHcQ4/yBu/gwdrFjnnbwsM343tjHUwJKVMwQbnaCY7YwIa++06oHER2vOmDagzuIfoNUZlHaE5utQwptGlxrSH9tIbs3I/y7L2aKSmWWjXMSu1jupBUCMA8PEpuAKCAVj8OkCzf7mm0cqY7006F6oP9ZJEvkWcQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idkDKns6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idkDKns6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770724300; x=1802260300;
  h=date:from:to:cc:subject:message-id;
  bh=+A/0pOGodMjBOHe08tgO5PYNKBj4gWlddENLaoDL7dI=;
  b=idkDKns6WJgi0Fk7RfbiYg66/jc3VWkjZd/ICdrB1wk65YY3h0VULUcB
   xULnkFK6Ik3hFKNvU8vDDnQnhXHdQHRYiA+GoGVdqCl/ESdVWX1xkCI+m
   VIsCqbkif/8g28d/C4vx7ZMjKIHJv3egDK8RLCSH91YMhOjm208oyADis
   AcYbA1q1gJUVDzNfH3fs5CRxntTnDgESe1ZN1bPxQ7/7jr6KbChTWw/Zb
   daiZB91pEVcAZ9y24qWKJgPuK614a+ivTY/BZRA/p2GpWsa7yqyzvHJ1X
   LB4fxNUF15/mt5tVo/G4BscTVI/cLuxfJ5mXxlNNxZY2lG9LTz5nlcDOG
   w==;
X-CSE-ConnectionGUID: oq17LS4MQTiOIks0FQqBBA==
X-CSE-MsgGUID: p/kEPOo1TOO56s8BmzJvvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71060502"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71060502"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 03:51:40 -0800
X-CSE-ConnectionGUID: nF+4WW6LQkGX4wJQkfLyFQ==
X-CSE-MsgGUID: VodMdQt3SQC7HuHwf13Pxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210999923"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Feb 2026 03:51:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpmHI-00000000oye-0zez;
	Tue, 10 Feb 2026 11:51:36 +0000
Date: Tue, 10 Feb 2026 19:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-slaunch 38/41]
 drivers/firmware/efi/libstub/x86-stub.c:832:18: error: too many arguments to
 function 'efi_secure_launch_init'
Message-ID: <202602101924.HOJWqnvm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: a64c42672d622dc2867904b9857ef64a890610bd [38/41] x86/efistub: EFI stub DRTM launch support for Secure Launch
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602101924.HOJWqnvm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101924.HOJWqnvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101924.HOJWqnvm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/x86-stub.c: In function 'efi_stub_entry':
>> drivers/firmware/efi/libstub/x86-stub.c:832:18: error: too many arguments to function 'efi_secure_launch_init'
     832 |         status = efi_secure_launch_init(handle);
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/libstub/x86-stub.c:21:
   drivers/firmware/efi/libstub/efistub.h:1258:14: note: declared here
    1258 | efi_status_t efi_secure_launch_init(void)
         |              ^~~~~~~~~~~~~~~~~~~~~~


vim +/efi_secure_launch_init +832 drivers/firmware/efi/libstub/x86-stub.c

   810	
   811	/*
   812	 * On success, this routine will jump to the relocated image directly and never
   813	 * return.  On failure, it will exit to the firmware via efi_exit() instead of
   814	 * returning.
   815	 */
   816	void __noreturn efi_stub_entry(efi_handle_t handle,
   817				       efi_system_table_t *sys_table_arg,
   818				       struct boot_params *boot_params)
   819	
   820	{
   821		efi_guid_t guid = EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID;
   822		const struct linux_efi_initrd *initrd = NULL;
   823		unsigned long kernel_entry;
   824		struct setup_header *hdr;
   825		efi_status_t status;
   826	
   827		efi_system_table = sys_table_arg;
   828		/* Check if we were booted by the EFI firmware */
   829		if (efi_system_table->hdr.signature != EFI_SYSTEM_TABLE_SIGNATURE)
   830			efi_exit(handle, EFI_INVALID_PARAMETER);
   831	
 > 832		status = efi_secure_launch_init(handle);
   833		switch (status) {
   834			case EFI_SUCCESS:
   835			case EFI_UNSUPPORTED:
   836				break;
   837			default:
   838				efi_exit(handle, status);
   839		}
   840	
   841		if (!IS_ENABLED(CONFIG_EFI_HANDOVER_PROTOCOL) || !boot_params) {
   842			status = efi_allocate_bootparams(handle, &boot_params);
   843			if (status != EFI_SUCCESS)
   844				efi_exit(handle, status);
   845		}
   846	
   847		hdr = &boot_params->hdr;
   848	
   849		if (have_unsupported_snp_features())
   850			efi_exit(handle, EFI_UNSUPPORTED);
   851	
   852		if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
   853			efi_dxe_table = get_efi_config_table(EFI_DXE_SERVICES_TABLE_GUID);
   854			if (efi_dxe_table &&
   855			    efi_dxe_table->hdr.signature != EFI_DXE_SERVICES_TABLE_SIGNATURE) {
   856				efi_warn("Ignoring DXE services table: invalid signature\n");
   857				efi_dxe_table = NULL;
   858			}
   859		}
   860	
   861		/* grab the memory attributes protocol if it exists */
   862		efi_bs_call(locate_protocol, &guid, NULL, (void **)&memattr);
   863	
   864		status = efi_setup_5level_paging();
   865		if (status != EFI_SUCCESS) {
   866			efi_err("efi_setup_5level_paging() failed!\n");
   867			goto fail;
   868		}
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
