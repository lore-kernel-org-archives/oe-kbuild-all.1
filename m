Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1394165F17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 20:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727555075; cv=none; b=dPc5ETI9XU6wQlrEXLSWsoWKlKRmy1sEfVXfcVlGza4WhDBtYE8PN7Lz8aARJd5PMLma4vt/mjBlqnjCBlUaWu+dXC2SZX8UfgDFcUMyrl1udf9Xr0eJcaR5+KHxkWX9jy5W5PuFMkYjKUo7KOUHcIrIqHDhlCdSqyIKc8aFHkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727555075; c=relaxed/simple;
	bh=xggOzMekrI531hS5y2g7iJu4ATiliKiV7qrl5xfkWrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3OIZC4izwLAVohwa7j+UlsujRS+1181kt9GWuNmyhmgjCidI5JDQTvgTSSLjIVZUpUwYe2TfrkQUooGZw7jqOhk1LfA1tPm5EDTDNUaoXyx+vXGenDkNlpOCVNdEczWwUu8Q0n8UuX4uMOuXUSQkPCB1uf7GvBPu+qYWERAlLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBRxfNUF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBRxfNUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727555073; x=1759091073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xggOzMekrI531hS5y2g7iJu4ATiliKiV7qrl5xfkWrY=;
  b=hBRxfNUF+vGTupbA0Fn3Fve9mRomDnpiO4q7RWN1A1ylZUad7HVBOmBm
   nCYESm5OuSo3xZFro4EKZ6eHgoViyEHWPkKLpdQmtmeo3vu9SHnjWYt8+
   ICQktY5qEP5x5Y+Qr/zmDj/oMkrj96mPqBYwbfRmo/11fp41nQ84YI9R1
   8cY4T3g23OUseuT+JqF+HCkV4ui8IUieJ2gU22k3FGf4vFBU79PccjYnV
   4jG7+WpUhurVAM0FGBYH4OWalLDA1nHVjzh3+dCdTd1Ytd7hypu62BTUM
   R575xzfPF/vUfVpJ0IPK/SobHM4sLPVKCSsAvzZUUZCDEof9BogDo/HIS
   A==;
X-CSE-ConnectionGUID: Bu57Kf8JRmq3sUeweAfiDw==
X-CSE-MsgGUID: LOEhlTMvSyelJJ/H6bhW8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="29557041"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="29557041"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 13:24:33 -0700
X-CSE-ConnectionGUID: DsWm27+LQESPFC8e8sPXRA==
X-CSE-MsgGUID: cA1IJQLGRXSKp/tKNOPSdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72550809"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2024 13:24:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sudzR-000Na9-1x;
	Sat, 28 Sep 2024 20:24:29 +0000
Date: Sun, 29 Sep 2024 04:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1487/23799]
 drivers/firmware/efi/libstub/arm-stub.c:72:6: sparse: sparse: symbol
 'install_memreserve_table' was not declared. Should it be static?
Message-ID: <202409290414.yOuyHbaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 805a16040f9b52834cff060839fe25ad655f042e [1487/23799] efi/arm: libstub: add a root memreserve config table
config: arm64-randconfig-r133-20240926 (https://download.01.org/0day-ci/archive/20240929/202409290414.yOuyHbaP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409290414.yOuyHbaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290414.yOuyHbaP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/libstub/arm-stub.c:72:6: sparse: sparse: symbol 'install_memreserve_table' was not declared. Should it be static?
   drivers/firmware/efi/libstub/arm-stub.c:72:6: warning: no previous prototype for 'install_memreserve_table' [-Wmissing-prototypes]
      72 | void install_memreserve_table(efi_system_table_t *sys_table_arg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/arm-stub.c:116:15: warning: no previous prototype for 'efi_entry' [-Wmissing-prototypes]
     116 | unsigned long efi_entry(void *handle, efi_system_table_t *sys_table,
         |               ^~~~~~~~~
   drivers/firmware/efi/libstub/arm-stub.c: In function 'efi_entry':
   drivers/firmware/efi/libstub/arm-stub.c:135:29: warning: variable 'si' set but not used [-Wunused-but-set-variable]
     135 |         struct screen_info *si;
         |                             ^~

vim +/install_memreserve_table +72 drivers/firmware/efi/libstub/arm-stub.c

    71	
  > 72	void install_memreserve_table(efi_system_table_t *sys_table_arg)
    73	{
    74		struct linux_efi_memreserve *rsv;
    75		efi_guid_t memreserve_table_guid = LINUX_EFI_MEMRESERVE_TABLE_GUID;
    76		efi_status_t status;
    77	
    78		status = efi_call_early(allocate_pool, EFI_LOADER_DATA, sizeof(*rsv),
    79					(void **)&rsv);
    80		if (status != EFI_SUCCESS) {
    81			pr_efi_err(sys_table_arg, "Failed to allocate memreserve entry!\n");
    82			return;
    83		}
    84	
    85		rsv->next = 0;
    86		rsv->base = 0;
    87		rsv->size = 0;
    88	
    89		status = efi_call_early(install_configuration_table,
    90					&memreserve_table_guid,
    91					rsv);
    92		if (status != EFI_SUCCESS)
    93			pr_efi_err(sys_table_arg, "Failed to install memreserve config table!\n");
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
