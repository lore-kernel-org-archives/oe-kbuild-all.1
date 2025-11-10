Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD3B27AC4C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806277; cv=none; b=LF3ouPFw92nHZ/yajVnZFKgx6rVtRM8PvDAkYTZA955MzfR6etGTEQIBRJKW9TpGhLlgP7H7vq+QN0TGUnsrCSN34zDasEIdYG0i1j8GgPRA4XMZBRFc5mEcIUsF5DVfgqNZNmeKXHhBtC1NPNvZ5BSXem2qVZUDB6Vtm3q+Qto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806277; c=relaxed/simple;
	bh=UgxS/sQuKvzlwa+w9DzqM2SxR9lmwII4cMFyY4u5m+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jf3WkvW/3sbfKmUAHY1R+ff3tCw5pgjNXH8gG4E19FxcEo8FT29a2G/a918b44FIggLEvND8p0JYaFMRATl2pfORS5HSk+0SIERYwmdOexOiJF87pFWrFSMskuqkfzj6b5pUqHp/PSEtq6ktpZN+9ta+8aWyxet0nRc/iZT7Fss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxx4Pkul; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxx4Pkul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762806276; x=1794342276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgxS/sQuKvzlwa+w9DzqM2SxR9lmwII4cMFyY4u5m+A=;
  b=gxx4PkulbSYQl6P01uLlXh2uYI+a3bq+nVp7mvkp/Qi359RrM6oGRtVl
   Otjyx3Htc5Lk/QRjJk3OVuB+qctzkUCUzY7g0hfDlK22PaIYQxq7WSy3G
   hOl4sdHKP2rOPnAeJYpol/qA45hxDv1fQFRtFshysN1KzGV/P8oAYX3VZ
   8rCeWPH9mBbTXglSxz1iYbDKaxv68FCtSp8Eoylv66ZXoW0XGFFCdvN+E
   PAMbntTojFD0IPojbhSTmHpcvUcJkmcKMxMfY3fqkFDC21FxBByUqqJQK
   8BM5mrpFtWCVX8cbQHYWjXEzH8Dc6lCAb9UsYaoIoCfrUN7WZ+TOV4xUg
   A==;
X-CSE-ConnectionGUID: Sm758873T72FwDy83dK2xQ==
X-CSE-MsgGUID: d98r6yyESdOrCG7RrIILGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68713262"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="68713262"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 12:24:36 -0800
X-CSE-ConnectionGUID: MjjEPCL6Tdyq8WgqD+eYdw==
X-CSE-MsgGUID: YB/7yBbXR/2gkidaCkGmTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188724202"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Nov 2025 12:24:35 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIYRE-0000y1-0s;
	Mon, 10 Nov 2025 20:24:32 +0000
Date: Tue, 11 Nov 2025 04:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Alexey Kardashevskiy <aik@amd.com>
Subject: [linux-next:master 5404/7661] drivers/pci/ide.c:266: undefined
 reference to `tsm_ide_stream_unregister'
Message-ID: <202511110401.d8l5Et2R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ab40c92c74c6b0c611c89516794502b3a3173966
commit: a4438f06b1db15ce3d831ce82b8767665638aa2a [5404/7661] PCI/TSM: Report active IDE streams
config: powerpc-randconfig-001-20251111 (https://download.01.org/0day-ci/archive/20251111/202511110401.d8l5Et2R-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110401.d8l5Et2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110401.d8l5Et2R-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/pci/ide.o: in function `pci_ide_stream_release':
>> drivers/pci/ide.c:266: undefined reference to `tsm_ide_stream_unregister'
   powerpc-linux-ld: drivers/pci/tsm.o: in function `connect_store':
   drivers/pci/tsm.c:256: undefined reference to `find_tsm_dev'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TSM
   Depends on [n]: VIRT_DRIVERS [=n]
   Selected by [y]:
   - PCI_TSM [=y] && PCI [=y]


vim +266 drivers/pci/ide.c

   242	
   243	/**
   244	 * pci_ide_stream_release() - unwind and release an @ide context
   245	 * @ide: partially or fully registered IDE settings descriptor
   246	 *
   247	 * In support of automatic cleanup of IDE setup routines perform IDE
   248	 * teardown in expected reverse order of setup and with respect to which
   249	 * aspects of IDE setup have successfully completed.
   250	 *
   251	 * Be careful that setup order mirrors this shutdown order. Otherwise,
   252	 * open code releasing the IDE context.
   253	 */
   254	void pci_ide_stream_release(struct pci_ide *ide)
   255	{
   256		struct pci_dev *pdev = ide->pdev;
   257		struct pci_dev *rp = pcie_find_root_port(pdev);
   258	
   259		if (ide->partner[PCI_IDE_RP].enable)
   260			pci_ide_stream_disable(rp, ide);
   261	
   262		if (ide->partner[PCI_IDE_EP].enable)
   263			pci_ide_stream_disable(pdev, ide);
   264	
   265		if (ide->tsm_dev)
 > 266			tsm_ide_stream_unregister(ide);
   267	
   268		if (ide->partner[PCI_IDE_RP].setup)
   269			pci_ide_stream_teardown(rp, ide);
   270	
   271		if (ide->partner[PCI_IDE_EP].setup)
   272			pci_ide_stream_teardown(pdev, ide);
   273	
   274		if (ide->name)
   275			pci_ide_stream_unregister(ide);
   276	
   277		pci_ide_stream_free(ide);
   278	}
   279	EXPORT_SYMBOL_GPL(pci_ide_stream_release);
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
