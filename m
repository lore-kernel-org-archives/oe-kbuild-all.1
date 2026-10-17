Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA36356760
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 07:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792220428; cv=none; b=tg+/fih5EgMkvXCEoizNXCmosxUjegS3dJM0C3DNTXUjpG57M3eV9FSnOfr4/d69iigc/5ouAO66T0XBXL+FP2vmpp/8t5DszHscdJv0HTeZTwRDl3XKj1XCAxcYT/XUI8eq/4a512gyRIBWHxyoSIOuwUETiefa52mHiDz96Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792220428; c=relaxed/simple;
	bh=mpF9fnH0b1dl1wqdH1JeSWl6gQ3E+2NjErWvhhXjLTg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cyMYE5qTHR8fhNHeJl93XvIjm3yGF+KNsjMeM7bBrNomW0xpg4iaauxcma1vQpFB4vLA1CiQ77/g4WPPst0G79Q3Yf5eBGqAboOM7MauXoiCr7yjgt3poDqRhaRfcghZ65vc5gDLIgIMzOX1ARRVtKH/Xr3nm1lKNZiUDG+DYpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnhlpAzp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnhlpAzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792220419; x=1823756419;
  h=date:from:to:cc:subject:message-id;
  bh=mpF9fnH0b1dl1wqdH1JeSWl6gQ3E+2NjErWvhhXjLTg=;
  b=hnhlpAzp0nKXGLgcQaysI3qjy65yoRp9Nw9/kOg56+X/s6Lgs5qh1hhy
   7Ehtv4/r9KwVP/cKGUBz5LWwkZzPaFSXp5/57a3iQ+oaOGOoEoa7iQ2iy
   lYXodmK11fhavZj67ysNqxEy35CWwXFhym2QSCnbkpt9MUxGMTVQou1fr
   0mFiyr4QTl32FKY08YjuueAXrFewk4UzSv6p3u6qgEW/hNnNaRx8zuTtU
   cPJGNffLY+cJahCnwscMGH7eRAUMxJI2C9IgIl6akwEbVeovtAl5Y+Y/e
   Lht95eMzQon5N3YDuUT9NigfoOA3HZfIsx7t6TybIhRW77J7/QbZkosed
   w==;
X-CSE-ConnectionGUID: wY/C1NiURXmdxzbL8YDHYQ==
X-CSE-MsgGUID: Unu7IcbES26viRhxJda3Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1008451"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1008451"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 00:00:18 -0700
X-CSE-ConnectionGUID: ZNmxIKF0TLia5n8D8AUW6w==
X-CSE-MsgGUID: ypda/BMOSeqgsQIWrHh5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2105911"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Oct 2026 00:00:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHyOs-00000000JAk-2QQz;
	Sat, 17 Oct 2026 07:00:14 +0000
Date: Sat, 17 Oct 2026 14:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [linux-next:master 18009/18293]
 drivers/firmware/efi/runtime-wrappers.c:358:3: error: a label can only be
 part of a statement and a declaration is not a statement
Message-ID: <202610171413.TwVPuIEm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: 002a3f5757e07edd7fbef243d823b565624bc5fb [18009/18293] lkdtm: Add more EFI runtime tests
config: arm-randconfig-1000-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171413.TwVPuIEm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171413.TwVPuIEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171413.TwVPuIEm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/firmware/efi/runtime-wrappers.c: In function 'efi_call_rts':
>> include/linux/compiler_types.h:30:15: error: a label can only be part of a statement and a declaration is not a statement
    # define auto __auto_type
                  ^~~~~~~~~~~
   drivers/firmware/efi/runtime-wrappers.c:349:3: note: in expansion of macro 'auto'
      auto t = (efi_time_t *)efi.runtime->set_virtual_address_map;
      ^~~~
>> drivers/firmware/efi/runtime-wrappers.c:358:3: error: a label can only be part of a statement and a declaration is not a statement
      struct { efi_status_t (__efiapi *fn)(int); } s = { (void *)efi.runtime };
      ^~~~~~


vim +358 drivers/firmware/efi/runtime-wrappers.c

   240	
   241	/*
   242	 * Calls the appropriate efi_runtime_service() with the appropriate
   243	 * arguments.
   244	 */
   245	static void __nocfi efi_call_rts(struct work_struct *work)
   246	{
   247		const union efi_rts_args *args = efi_rts_work.args;
   248		efi_status_t status = EFI_NOT_FOUND;
   249		unsigned long flags;
   250	
   251		if (!efi_enabled(EFI_RUNTIME_SERVICES))
   252			efi_rts_park_worker();
   253	
   254		efi_runtime_lock_owner = current;
   255	
   256		arch_efi_call_virt_setup();
   257		flags = efi_call_virt_save_flags();
   258	
   259		switch (efi_rts_work.efi_rts_id) {
   260		case EFI_GET_TIME:
   261			status = efi_call_virt(get_time,
   262					       args->GET_TIME.time,
   263					       args->GET_TIME.capabilities);
   264			break;
   265		case EFI_SET_TIME:
   266			status = efi_call_virt(set_time,
   267					       args->SET_TIME.time);
   268			break;
   269		case EFI_GET_WAKEUP_TIME:
   270			status = efi_call_virt(get_wakeup_time,
   271					       args->GET_WAKEUP_TIME.enabled,
   272					       args->GET_WAKEUP_TIME.pending,
   273					       args->GET_WAKEUP_TIME.time);
   274			break;
   275		case EFI_SET_WAKEUP_TIME:
   276			status = efi_call_virt(set_wakeup_time,
   277					       args->SET_WAKEUP_TIME.enable,
   278					       args->SET_WAKEUP_TIME.time);
   279			break;
   280		case EFI_GET_VARIABLE:
   281			status = efi_call_virt(get_variable,
   282					       args->GET_VARIABLE.name,
   283					       args->GET_VARIABLE.vendor,
   284					       args->GET_VARIABLE.attr,
   285					       args->GET_VARIABLE.data_size,
   286					       args->GET_VARIABLE.data);
   287			break;
   288		case EFI_GET_NEXT_VARIABLE:
   289			status = efi_call_virt(get_next_variable,
   290					       args->GET_NEXT_VARIABLE.name_size,
   291					       args->GET_NEXT_VARIABLE.name,
   292					       args->GET_NEXT_VARIABLE.vendor);
   293			break;
   294		case EFI_SET_VARIABLE:
   295			status = efi_call_virt(set_variable,
   296					       args->SET_VARIABLE.name,
   297					       args->SET_VARIABLE.vendor,
   298					       args->SET_VARIABLE.attr,
   299					       args->SET_VARIABLE.data_size,
   300					       args->SET_VARIABLE.data);
   301			break;
   302		case EFI_QUERY_VARIABLE_INFO:
   303			status = efi_call_virt(query_variable_info,
   304					       args->QUERY_VARIABLE_INFO.attr,
   305					       args->QUERY_VARIABLE_INFO.storage_space,
   306					       args->QUERY_VARIABLE_INFO.remaining_space,
   307					       args->QUERY_VARIABLE_INFO.max_variable_size);
   308			break;
   309		case EFI_GET_NEXT_HIGH_MONO_COUNT:
   310			status = efi_call_virt(get_next_high_mono_count,
   311					       args->GET_NEXT_HIGH_MONO_COUNT.high_count);
   312			break;
   313		case EFI_UPDATE_CAPSULE:
   314			status = efi_call_virt(update_capsule,
   315					       args->UPDATE_CAPSULE.capsules,
   316					       args->UPDATE_CAPSULE.count,
   317					       args->UPDATE_CAPSULE.sg_list);
   318			break;
   319		case EFI_QUERY_CAPSULE_CAPS:
   320			status = efi_call_virt(query_capsule_caps,
   321					       args->QUERY_CAPSULE_CAPS.capsules,
   322					       args->QUERY_CAPSULE_CAPS.count,
   323					       args->QUERY_CAPSULE_CAPS.max_size,
   324					       args->QUERY_CAPSULE_CAPS.reset_type);
   325			break;
   326		case EFI_ACPI_PRM_HANDLER:
   327	#ifdef CONFIG_ACPI_PRMT
   328			status = arch_efi_call_virt(args, ACPI_PRM_HANDLER.acpi_prm_handler,
   329						    args->ACPI_PRM_HANDLER.param_buffer_addr,
   330						    args->ACPI_PRM_HANDLER.context);
   331			break;
   332	#endif
   333		default:
   334			/*
   335			 * Ideally, we should never reach here because a caller of this
   336			 * function should have put the right efi_runtime_service()
   337			 * function identifier into efi_rts_work->efi_rts_id
   338			 */
   339			pr_err("Requested executing invalid EFI Runtime Service.\n");
   340			break;
   341	
   342	#if IS_ENABLED(CONFIG_LKDTM)
   343		case EFI_LKDTM_RUNTIME_RO_TEST:
   344			/*
   345			 * Call GetTime() with the output argument pointing to
   346			 * executable memory, which should be mapped read-only in the
   347			 * EFI page tables.
   348			 */
 > 349			auto t = (efi_time_t *)efi.runtime->set_virtual_address_map;
   350	
   351			status = efi_call_virt(get_time, t, NULL);
   352			break;
   353		case EFI_LKDTM_RUNTIME_NX_TEST:
   354			/*
   355			 * Call efi.runtime, which points to a data object in a EFI
   356			 * runtime region, as if it were a function pointer.
   357			 */
 > 358			struct { efi_status_t (__efiapi *fn)(int); } s = { (void *)efi.runtime };
   359	
   360			status = arch_efi_call_virt((&s), fn, 0);
   361			break;
   362	#endif
   363		}
   364	
   365		efi_call_virt_check_flags(flags, efi_rts_work.caller);
   366		arch_efi_call_virt_teardown();
   367	
   368		/*
   369		 * EFI runtime services may also have been disabled because the
   370		 * firmware faulted, but the caller is still waiting for us in that
   371		 * case. Only park the worker if the caller has given up on it.
   372		 */
   373		if (READ_ONCE(efi_rts_abandoned))
   374			efi_rts_park_worker();
   375	
   376		efi_rts_work.status = status;
   377		complete(&efi_rts_work.efi_rts_comp);
   378		efi_runtime_lock_owner = NULL;
   379	}
   380	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
