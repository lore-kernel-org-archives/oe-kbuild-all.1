Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2BC46B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 01:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713488573; cv=none; b=AkPiqI5hr6n30ltUnO8426mkhTsFjygMexEtsdCjav6FaX2zK4oeS2To37h4e6RGypncMaW1IZwAUHzzsyxO6mYuQw7YhSu2285vNggdPGssfblKSo8M2N0LanRx2uTWxz2K0/qmzvFf2ZLphDYRYNyOpWrUsbJJ1Bn0+FNwfVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713488573; c=relaxed/simple;
	bh=tDSRg7MF+p9cvLvMN9e71c/ZVhYpn74aj6OJuPyn63g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hrwhdnsiGacybgFT9c730WiQAKncrCC1eq7YQ5pj4flu0lG+Y+W0KxE4Z3AUgB9IVnWmaLoh49RAELtOc6mgdJTuZ6RPjcWNfnlgmeO6/77j9+ox7D5Zb6q1Wdor2vXlDfnlkdwn4RGbPpGvTj8qa7NJuafMpusmoiaLMK2rdJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlBY6cif; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlBY6cif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713488571; x=1745024571;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tDSRg7MF+p9cvLvMN9e71c/ZVhYpn74aj6OJuPyn63g=;
  b=dlBY6cifpVfb3nuyfAeLFQTJpzsI6tj4B1Qez9dzVshuAvE+c+ogIa3X
   YPBkNh2hTUNq/Sj8hosIzxOubxFCm/w0wQQxtyQq8XwSxfx++ulnOg8Ft
   ww6PaVKXHYIb4P5DgseljzyQaWlWZ5ZYkLMWAXLgMnn84244i58QA6xQI
   gvwRHuTidj1YRWNwA1IQYL0TW5HY61kVj1hEeSUYwpmVxZ63GxP+VhnyF
   hVWjhmMsKUSuOVU9bIUpORQItmEd+kEUeAJZSA+KI0WsRzw+BPTtGmJom
   qCW5Bo0b1C8WxLaNIASyATFCFg6Lm+88UwxchWKhtbET67RWP5MLdLSnJ
   Q==;
X-CSE-ConnectionGUID: 4V7dXvzJSqe7yix2OCe2sA==
X-CSE-MsgGUID: cntsGQ1YT4uys9yBoayaTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20214648"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="20214648"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 18:02:50 -0700
X-CSE-ConnectionGUID: 1iTyx1p4Tumb/sE/IRn9jg==
X-CSE-MsgGUID: ZHNDsFk4SoSZ+TAW+Sr8Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23192804"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Apr 2024 18:02:49 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxceK-0009Qa-2h
	for oe-kbuild-all@lists.linux.dev;
	Fri, 19 Apr 2024 01:02:45 +0000
Date: Fri, 19 Apr 2024 09:02:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 7573/9999]
 drivers/nvme/host/pci.c:2705:25: sparse: sparse: symbol 'nvme_dev_pm_ops'
 was not declared. Should it be static?
Message-ID: <202404190855.Bmsj8VGO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: bc7304877066a781782a7b43ea0ed2edcc767637 [7573/9999] BACKPORT: FROMGIT: nvme-pci: Use host managed power state for suspend
config: x86_64-randconfig-123-20240419 (https://download.01.org/0day-ci/archive/20240419/202404190855.Bmsj8VGO-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190855.Bmsj8VGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190855.Bmsj8VGO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/pci.c:2705:25: sparse: sparse: symbol 'nvme_dev_pm_ops' was not declared. Should it be static?
   drivers/nvme/host/pci.c:1263: warning: Function parameter or member 'nvmeq' not described in 'nvme_suspend_queue'
   drivers/nvme/host/pci.o: warning: objtool: __nvme_alloc_host_mem()+0x90: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_pci_cmd_size()+0x63: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_pci_setup_prps()+0x211: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_set_host_mem()+0x107: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_alloc_sq_cmds()+0xa1: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_free_iod()+0x1e9: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_map_data()+0x2d1: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_timeout()+0x1b5: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_map_cmb()+0x14f: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_create_queue()+0xbe: sibling call from callable instruction with modified stack frame
   drivers/nvme/host/pci.o: warning: objtool: nvme_setup_io_queues()+0x63d: sibling call from callable instruction with modified stack frame

vim +/nvme_dev_pm_ops +2705 drivers/nvme/host/pci.c

  2704	
> 2705	const struct dev_pm_ops nvme_dev_pm_ops = {
  2706		.suspend = nvme_suspend,
  2707		.resume = nvme_resume,
  2708		.freeze = nvme_simple_suspend,
  2709		.thaw = nvme_simple_resume,
  2710		.poweroff = nvme_simple_suspend,
  2711		.restore = nvme_simple_resume,
  2712	};
  2713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
