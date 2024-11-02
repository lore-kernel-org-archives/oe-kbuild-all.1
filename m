Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5293C13B791
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730565710; cv=none; b=El84he9pJzkl5bZfWQbgzPelkHUUiP4oLsDI1Wc2nsQfAR3X4oCdTeJnjYkjDabQUdP9WTjxRktXaHxF7WYU1l1fUZzCBkYypUVrl+RSSumbbx9cVSoXlPH2SH8uaC3FRAedB/aOmvWBx1qbqycBlHufItTTgOzlJ2G6gzOddH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730565710; c=relaxed/simple;
	bh=7fFO2puMlqZ/PS3uGHFdOzyHtQ7l0BWp5/xQF42+V4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T+WRoo519P2glUdd3WUgeIabRYnkVF5Vdoa0AIcUse1fXuGa32HAteUqe6gg0VWs9Qp7xC87fqU2iGEjZOKZ7hTEGL3+zYjSoi13bSZrxkZ+mrtjFDbeazDv0PUkpudotCZKEX3ErkyKPJxH7/ukh1b/nQK+KqzydmWXTQS7W9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvC+stXR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvC+stXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730565709; x=1762101709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fFO2puMlqZ/PS3uGHFdOzyHtQ7l0BWp5/xQF42+V4c=;
  b=ZvC+stXR0UjERiTrj6iqBori/epAcqNuDcHW7h4Oou5D4K0HArp2bhGf
   71mGPVOdzyrMS150mmtERX6+TP5zJoKuvqyreXW2vXjTG1JscBvf2aAhT
   JduaI0nJADQitZUZtEI/ny56IuxUFn2KAG6ouTyCMBxbFZtgGlRwzk2Dc
   /+e1//TcspzY8E4/Ep0YWK0qBSmgownPIfKrPn7KUCjHYllZlqiwJoOs1
   9ICDqtLAwekTqk5PMgim2zDpqbtUm9UeTosYDgNSVaz4XgTgmErcrO2Mw
   kmWWBy2L1MuYiE5zHOSY/SUHq+x0Vs0INnFAstvT92+7gC1Pg30pgm6If
   g==;
X-CSE-ConnectionGUID: URBzOORSQzSWFnEznNCr3w==
X-CSE-MsgGUID: nLeGCg8ORBi0VCQSXKe9NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34000598"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34000598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 09:41:46 -0700
X-CSE-ConnectionGUID: vmGksme2QYWaW79RaAxd4g==
X-CSE-MsgGUID: Lbl3HsSQS7KNu/v5p7YWag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="120697687"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2024 09:41:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7HC2-000jAn-2h;
	Sat, 02 Nov 2024 16:41:42 +0000
Date: Sun, 3 Nov 2024 00:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Cohen <amcohen@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 21/39]
 drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c:47:24: error: called object
 'page_address' is not a function or function pointer
Message-ID: <202411030017.81y88DP0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   7529d37fbe2eed8767663dafec3f554108d1eebe
commit: b58169eb17f05640abe5a2827c66afe30a5aadff [21/39] mlxsw: pci_xdp: Add fundamental APIs to support XDP
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241103/202411030017.81y88DP0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030017.81y88DP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030017.81y88DP0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c: In function 'mlxsw_xdp_buff_init':
>> drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c:47:24: error: called object 'page_address' is not a function or function pointer
      47 |         page_address = page_address(rx_pkt_info->pages[0]);
         |                        ^~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c:45:15: note: declared here
      45 |         void *page_address;
         |               ^~~~~~~~~~~~


vim +/page_address +47 drivers/net/ethernet/mellanox/mlxsw/pci_xdp.c

    40	
    41	void mlxsw_xdp_buff_init(struct xdp_buff *xdp_buff,
    42				 const struct mlxsw_pci_rx_pkt_info *rx_pkt_info,
    43				 struct xdp_rxq_info *xdp_rxq)
    44	{
    45		void *page_address;
    46	
  > 47		page_address = page_address(rx_pkt_info->pages[0]);
    48	
    49		xdp_init_buff(xdp_buff, PAGE_SIZE, xdp_rxq);
    50		xdp_prepare_buff(xdp_buff, page_address, MLXSW_PCI_RX_BUF_HEADROOM,
    51				 rx_pkt_info->sg_entries_size[0], false);
    52	
    53		mlxsw_xdp_frags_init(xdp_buff, rx_pkt_info);
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
