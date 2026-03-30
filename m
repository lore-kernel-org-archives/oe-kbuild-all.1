Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C537701B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 17:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891594; cv=none; b=HpKldn0MAgxT4xI52n/6WIsuh73nLkhApiihfx3zc2QYNEjRDJM0uq2vULr0vwnXyO2iejpaOkjMn/L57EXXY1NYJ6+bkMJbF6ECZ4md4byJH4xXLpiVd+eDnalGhvf351EjmMj6rZpDfjvrvkywCDbjUq3y0GHC2YApdyLDmV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891594; c=relaxed/simple;
	bh=gdNAN5MAGOoH47pwbdWWf0GuwSOjq73N8OdcEVWJDi0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RrCcOn9y0tkinKghDLAIm/iu9K6xCzT7hXGAm/tQe/pT3W/rXyUcwgzCUdkOibPd+TkL/DvX4FTDxzFPoO+Fl4k6ihyxvjSDjyvQDCavZWFol+2wiAU5uc/yekXBOdhru58GyAaoOlLsdpCdiaS3u+6JRP7vJk8XNLc1OJs1W7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9txmPaO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9txmPaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774891592; x=1806427592;
  h=date:from:to:cc:subject:message-id;
  bh=gdNAN5MAGOoH47pwbdWWf0GuwSOjq73N8OdcEVWJDi0=;
  b=D9txmPaOcoZZh+rZLKy1v1oksGFPk3ekobWtCR2AkTraRYqh+7KzQotB
   P2pC8/4nFwEPGZqr+LhBOyB3z+D1+uMdMhGdpILqSmcYuVyI11hxBNf1U
   bu5NDO6+kQB5mz5aXm0/Mj1EY8YqPa9ZGdpVLT6odrRgUBK7JskxS/ATV
   9RtSRKL5BJjwYTxUHVteWFRrK3LgWX/EDXfndXX43PVmLRiYGEzVLqcAR
   luD2yYe+Hl1Li7zM/AuiSpPBdSYBtHjK60NFwbqHli2sFqjQND7wXAIpr
   VCbkl9BfKtN32qYwCSDUBdYhKLZ2qRzLTReDZUry5cPEp2jZMJ0aq7ekF
   w==;
X-CSE-ConnectionGUID: 763942E5RTalzijREl/RKg==
X-CSE-MsgGUID: A1hqTUoGTDOrE4qeNX2Sbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="87285213"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="87285213"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 10:26:31 -0700
X-CSE-ConnectionGUID: H37pLkSnQw2930QeEDtjPQ==
X-CSE-MsgGUID: wVzNvs53RV+1//xHzzMc/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="226096930"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Mar 2026 10:26:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7GNf-0000000088T-093b;
	Mon, 30 Mar 2026 17:26:27 +0000
Date: Mon, 30 Mar 2026 19:25:26 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-10 0/3]
 drivers/firmware/efi/libstub/efi-stub-helper.c:662: warning: Function
 parameter or member 'out' not described in 'efi_load_initrd'
Message-ID: <202603301937.97EsGvMO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-10
head:   f02f89c5d44b7eb3ef78917e3f1bebe99fa01348
commit: f4dc7fffa9873db50ec25624572f8217a6225de8 [0/3] efi: libstub: unify initrd loading between architectures
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260330/202603301937.97EsGvMO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301937.97EsGvMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4dc7fffa987 ("efi: libstub: unify initrd loading between architectures")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301937.97EsGvMO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/efi-stub-helper.c:559: warning: Function parameter or member 'initrd' not described in 'efi_load_initrd_dev_path'
   drivers/firmware/efi/libstub/efi-stub-helper.c:559: warning: Excess function parameter 'load_addr' description in 'efi_load_initrd_dev_path'
   drivers/firmware/efi/libstub/efi-stub-helper.c:559: warning: Excess function parameter 'load_size' description in 'efi_load_initrd_dev_path'
>> drivers/firmware/efi/libstub/efi-stub-helper.c:662: warning: Function parameter or member 'out' not described in 'efi_load_initrd'


vim +662 drivers/firmware/efi/libstub/efi-stub-helper.c

f046fff8bc4c4d Ilias Apalodimas    2021-11-19  649  
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  650  /**
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  651   * efi_load_initrd() - Load initial RAM disk
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  652   * @image:	EFI loaded image protocol
947228cb9f1a2c Atish Patra         2021-07-02  653   * @soft_limit:	preferred address for loading the initrd
947228cb9f1a2c Atish Patra         2021-07-02  654   * @hard_limit:	upper limit address for loading the initrd
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  655   *
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  656   * Return:	status code
8c0a839c2bccb7 Heinrich Schuchardt 2020-06-16  657   */
f61900fd0ebf6c Arvind Sankar       2020-04-30  658  efi_status_t efi_load_initrd(efi_loaded_image_t *image,
f61900fd0ebf6c Arvind Sankar       2020-04-30  659  			     unsigned long soft_limit,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  660  			     unsigned long hard_limit,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  661  			     const struct linux_efi_initrd **out)
f61900fd0ebf6c Arvind Sankar       2020-04-30 @662  {
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  663  	efi_guid_t tbl_guid = LINUX_EFI_INITRD_MEDIA_GUID;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  664  	efi_status_t status = EFI_SUCCESS;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  665  	struct linux_efi_initrd initrd, *tbl;
f61900fd0ebf6c Arvind Sankar       2020-04-30  666  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  667  	if (!IS_ENABLED(CONFIG_BLK_DEV_INITRD) || efi_noinitrd)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  668  		return EFI_SUCCESS;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  669  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  670  	status = efi_load_initrd_dev_path(&initrd, hard_limit);
f61900fd0ebf6c Arvind Sankar       2020-04-30  671  	if (status == EFI_SUCCESS) {
f61900fd0ebf6c Arvind Sankar       2020-04-30  672  		efi_info("Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path\n");
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  673  		if (initrd.size > 0)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  674  			efi_measure_initrd(initrd.base, initrd.size);
f61900fd0ebf6c Arvind Sankar       2020-04-30  675  	} else if (status == EFI_NOT_FOUND) {
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  676  		status = efi_load_initrd_cmdline(image, &initrd, soft_limit,
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  677  						 hard_limit);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  678  		/* command line loader disabled or no initrd= passed? */
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  679  		if (status == EFI_UNSUPPORTED || status == EFI_NOT_READY)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  680  			return EFI_SUCCESS;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  681  		if (status == EFI_SUCCESS)
f61900fd0ebf6c Arvind Sankar       2020-04-30  682  			efi_info("Loaded initrd from command line option\n");
f61900fd0ebf6c Arvind Sankar       2020-04-30  683  	}
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  684  	if (status != EFI_SUCCESS)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  685  		goto failed;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  686  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  687  	status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, sizeof(initrd),
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  688  			     (void **)&tbl);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  689  	if (status != EFI_SUCCESS)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  690  		goto free_initrd;
f046fff8bc4c4d Ilias Apalodimas    2021-11-19  691  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  692  	*tbl = initrd;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  693  	status = efi_bs_call(install_configuration_table, &tbl_guid, tbl);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  694  	if (status != EFI_SUCCESS)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  695  		goto free_tbl;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  696  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  697  	if (out)
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  698  		*out = tbl;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  699  	return EFI_SUCCESS;
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  700  
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  701  free_tbl:
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  702  	efi_bs_call(free_pool, tbl);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  703  free_initrd:
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  704  	efi_free(initrd.size, initrd.base);
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  705  failed:
f4dc7fffa9873d Ard Biesheuvel      2022-09-16  706  	efi_err("Failed to load initrd: 0x%lx\n", status);
f61900fd0ebf6c Arvind Sankar       2020-04-30  707  	return status;
f61900fd0ebf6c Arvind Sankar       2020-04-30  708  }
14c574f35cfbc9 Arvind Sankar       2020-05-18  709  

:::::: The code at line 662 was first introduced by commit
:::::: f61900fd0ebf6c6b91719d63272a54f4d11051df efi/libstub: Unify initrd loading across architectures

:::::: TO: Arvind Sankar <nivedita@alum.mit.edu>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
