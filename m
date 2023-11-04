Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DCA847E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUjnQ+NC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699081404; x=1730617404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PLWVUlQUMqpTmU53L8daCQl3ulgIhvmsh0rOV3caIA8=;
  b=SUjnQ+NC1aXc30naXe5UnqP/2JvMq2AdtQf6xKawPRYcaI0eB5M4tWsX
   EtLCEbKOBI3tXROdxiaeOU/oauzmoKl6AD1F1uiUD3qblcL1cI5vbNp0Q
   25E4dZpSX0opOcA//Cyn+/b6AvG1gZUoaokiXnj5PeKIedFy4eucDtjPF
   JOIe/9ektdEhMa8IACBs5dQSWd83ArXR6wsFdG9gd80uQTpeVQcFPMrtq
   B43jObf/IP1Po4DmTwZkSV9tSj4n+GhfVS1qOP4QVNI5ZrwT3IvoT/gyP
   6Qy9bQkdC5iIuDS5qLNwHL8fGYyItMgKIMFDe5IN8qRuqlw4a7qmqc4ID
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453368007"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="453368007"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 00:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852484568"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="852484568"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2023 00:03:22 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzAgi-0003ax-0T;
	Sat, 04 Nov 2023 07:03:20 +0000
Date: Sat, 4 Nov 2023 15:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/firmware/efi/libstub/efi-stub-helper.c:662: warning:
 Function parameter or member 'out' not described in 'efi_load_initrd'
Message-ID: <202311041426.TPbxzuRy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90b0c2b2edd1adff742c621e246562fbefa11b70
commit: f4dc7fffa9873db50ec25624572f8217a6225de8 efi: libstub: unify initrd loading between architectures
date:   1 year, 1 month ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20231104/202311041426.TPbxzuRy-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041426.TPbxzuRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041426.TPbxzuRy-lkp@intel.com/

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
