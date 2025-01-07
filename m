Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72CB1547D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244348; cv=none; b=bwKHpP4A5Li55x1MrG9EPbMpuPf6r+4Pbv3wCXpqP70/8mPVpK7lQ0TVzFexEY96YguTMXK9Sm11xQPGEMDBYKRmiAbK2wPtmDCbkuftdiR+H+q1dY+0aO1k4S7WsabmDfcTPS8YWYwarJRHhqERYA8xoT+SQjai7pu3YDumHGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244348; c=relaxed/simple;
	bh=bj7kVPGaXCmz9NoBAL1gIB7Y+Hi2+rVJB9w82k0ww+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EzT0blkLpglhD7KwM6ljtnvajCg2jNV9I7Xdyd2do6t8fNELdtrWNJgD7WR8c414wzZwRuQUvk1UIcDWUhIQuH2F2WE6WWQ/9q1HFHYHV5bH4GChXk/5JB5I8EaX881Oo1nkKYfyQdajK6Bg7xzmFleB1tBrDSxn0QEV8ChU+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcfP0iY+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcfP0iY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736244345; x=1767780345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bj7kVPGaXCmz9NoBAL1gIB7Y+Hi2+rVJB9w82k0ww+E=;
  b=TcfP0iY+oN+XAwNx5IL3X6u4KZWz3KIYjFrHc8odw1gBRkSEwjnQnqqF
   xnKMxdcJ4teMgf6zTpSgGd7cPO5meOFri/mZILhO/vRfzape9BgK7zz7o
   /XI5yBi6aOtBdDKWpnr7IGDDK48HuMq/78wsPUNM6m39UQJPxQ81pIYab
   2oyZTA64RWN6Ox4ScXlLFsvc3N5NPuvrqmbegRlCMX5E0CONoFoW9BY6K
   u1kU8m46o2FRE5AAJoQ4dRf+luvkXIk1rV2MOuQAdPAPMrRvKoP9qYJ5k
   llHiY+jypL622ZEDcLrVO56sQAjy7n96AyYZKElyAKegyWZanPG308j/A
   w==;
X-CSE-ConnectionGUID: OCrK71w0SC2gAiWkO3bryA==
X-CSE-MsgGUID: 0Zy8p5eTQP2MToU0iX09lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36314315"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36314315"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 02:05:44 -0800
X-CSE-ConnectionGUID: dmfwgdvFST2jEUN2uGeSsQ==
X-CSE-MsgGUID: 4iwjcVWHTNmhIMz7niiH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103215323"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jan 2025 02:05:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV6Sy-000EX3-0d;
	Tue, 07 Jan 2025 10:05:40 +0000
Date: Tue, 7 Jan 2025 18:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] drivers/nvme/host/qmap.c:37:3:
 sparse: sparse: symbol 'qmap_list' was not declared. Should it be static?
Message-ID: <202501071754.VIzM7lkX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 6e74a414cbefd3f08ab27d0e7ee5b56afa19a7f4 [1347/1347] bytedance: nvme-qmap: modify according advise
config: arm64-randconfig-r133-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071754.VIzM7lkX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250107/202501071754.VIzM7lkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071754.VIzM7lkX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/nvme/host/qmap.c:32:21: sparse: sparse: symbol 'qmap_mgr' was not declared. Should it be static?
>> drivers/nvme/host/qmap.c:37:3: sparse: sparse: symbol 'qmap_list' was not declared. Should it be static?
>> drivers/nvme/host/qmap.c:40:25: sparse: sparse: symbol 'debug_nvme_qmap' was not declared. Should it be static?
   drivers/nvme/host/qmap.c:1172:30: sparse: sparse: symbol 'nvme_qmap_fops' was not declared. Should it be static?

vim +/qmap_list +37 drivers/nvme/host/qmap.c

    33	
    34	struct {
    35		struct rw_semaphore list_rwsem;
    36		struct list_head	qmap_head;
  > 37	} qmap_list;
    38	
    39	#ifdef CONFIG_DEBUG_FS
  > 40	struct dentry		*debug_nvme_qmap;
    41	#endif
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
