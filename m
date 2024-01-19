Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42B42053
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705671125; cv=none; b=pyeXahtIehN23ywXdRWojMWuxvY7V4Ax+jKkAb8kFZevXnUDvH95GWKj63z5E49q3wgTN5q66mTJWjTLZrAlcI3uqBraXck389TGxiECB685Ol2DasCB3jvKY5xvgoLVLNmG+JquRK8uWTekjt/6zzXOMLDsJhTApDIQE2E5NN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705671125; c=relaxed/simple;
	bh=SYJe6tTozfNojRhO7CB12pVlzw3N7+3dFi0lSah2Y7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgiuaJwzXTu7CrTdkIwOzIErhSDlYVmKgXmpuONrdqRiMCKhsMHC1sGG9B9N6+78Zsc6oxY6sDA14I/SwyRRGZoJC0zEdyq2h1oGu6C1uYyQ4VZA2hKe4QT2lDWOiN+8Z2hXwkBdyawKppezbdbMlrfZ7pAj7+oD3+j0ZegXCwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyqYNwVW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyqYNwVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705671123; x=1737207123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SYJe6tTozfNojRhO7CB12pVlzw3N7+3dFi0lSah2Y7s=;
  b=EyqYNwVWqaH6u13I1LLEKf3ezQ5IcFCES3LanAeF1LxAq0UE2FvwXtbW
   gLWFjOeD+FRHD4SSkhuRbZxnXwP9u0VKzqvpNy0gwuAkkcFsyr2sXxx0W
   7NE0eRqmfdbqJAso8Xc8LkYWQ+3/BDK0tpY3gRtxr/Iw351M0jfJnAp1K
   OVKVgwjphFB98AzGRoTVlVcxTipDOTwJyeDtCPhuxN1CDivMFq3l3eEbm
   iWhqmbWVx37rgMeCMK0l54Y2+3jPyxP++dGZLNzL6gLE+dtEEXR6+2Js7
   3zZXCbRoycLcACufZ6NyrAkrKYIuwHQPVuunvccxcbNcxREGfEV2Gg9K6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14101334"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="14101334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 05:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="33395986"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2024 05:32:03 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQoyW-000462-07;
	Fri, 19 Jan 2024 13:32:00 +0000
Date: Fri, 19 Jan 2024 21:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v4a 9/44]
 drivers/net/ethernet/marvell/octeon_ep/octep_main.h:366:9: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202401192118.aVamotDc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v4a
head:   1eb3a6cb0f321dd3a285899d1af24a4d75f70d2e
commit: 4e29874e95dbb4062f7e9528992bcfdb0100dfae [9/44] dyndbg: move flags field to a new structure
config: loongarch-randconfig-r121-20240119 (https://download.01.org/0day-ci/archive/20240119/202401192118.aVamotDc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240119/202401192118.aVamotDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192118.aVamotDc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/marvell/octeon_ep/octep_cn9k_pf.c: note: in included file:
>> drivers/net/ethernet/marvell/octeon_ep/octep_main.h:366:9: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/marvell/octeon_ep/octep_main.h:366:9: sparse:   also defined here

vim +366 drivers/net/ethernet/marvell/octeon_ep/octep_main.h

862cd659a6fbac Veerasenareddy Burru 2022-04-12  349  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  350  /* Write windowed register.
862cd659a6fbac Veerasenareddy Burru 2022-04-12  351   * @param  oct  -  pointer to the Octeon device.
862cd659a6fbac Veerasenareddy Burru 2022-04-12  352   * @param  addr -  Address of the register to write
862cd659a6fbac Veerasenareddy Burru 2022-04-12  353   * @param  val  -  Value to write
862cd659a6fbac Veerasenareddy Burru 2022-04-12  354   *
862cd659a6fbac Veerasenareddy Burru 2022-04-12  355   * This routine is called to write to the indirectly accessed
862cd659a6fbac Veerasenareddy Burru 2022-04-12  356   * Octeon registers that are visible through a PCI BAR0 mapped window
862cd659a6fbac Veerasenareddy Burru 2022-04-12  357   * register.
862cd659a6fbac Veerasenareddy Burru 2022-04-12  358   * @return   Nothing.
862cd659a6fbac Veerasenareddy Burru 2022-04-12  359   */
862cd659a6fbac Veerasenareddy Burru 2022-04-12  360  static inline void
862cd659a6fbac Veerasenareddy Burru 2022-04-12  361  OCTEP_PCI_WIN_WRITE(struct octep_device *oct, u64 addr, u64 val)
862cd659a6fbac Veerasenareddy Burru 2022-04-12  362  {
862cd659a6fbac Veerasenareddy Burru 2022-04-12  363  	writeq(addr, oct->pci_win_regs.pci_win_wr_addr);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  364  	writeq(val, oct->pci_win_regs.pci_win_wr_data);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  365  
862cd659a6fbac Veerasenareddy Burru 2022-04-12 @366  	dev_dbg(&oct->pdev->dev,
862cd659a6fbac Veerasenareddy Burru 2022-04-12  367  		"%s: reg: 0x%016llx val: 0x%016llx\n", __func__, addr, val);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  368  }
862cd659a6fbac Veerasenareddy Burru 2022-04-12  369  

:::::: The code at line 366 was first introduced by commit
:::::: 862cd659a6fbac664f1fcdd7149046040a7a7e9c octeon_ep: Add driver framework and device initialization

:::::: TO: Veerasenareddy Burru <vburru@marvell.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
