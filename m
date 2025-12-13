Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6762DEA68
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765655600; cv=none; b=Vfvd9MQmwWO0gr+1mLyQcU6n7AdNev5AjFvjwDspsUtgV35SmDCi/nRRX08rtVmPKMhbC3QCCQjmQuCJH0Z9Bs8/WLQUmWSNEw4ywLaZsku9wfRB+lfuG5sIH5lTPy8fXrQUADuHP6+jXHzNjJ07jz5JrK6CPGX1wPJpfZDmHyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765655600; c=relaxed/simple;
	bh=AOC2loxk7tRA8VSyP6QsHaFWnRAYxLDftWuApE2x8E4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oM4Hj8UDUgxkYtD2xDTzY795a8uhvmXwhqcEZvHhmm/NvB+RplobVacK6ruC4rkRg8mgVErD1yec9ImFL3EHurmkCtGLznPzPQWrgKk6IeBB+kd7WAsmA+ifWyoKWgQ2Vg7js+pIJztuKGUNwWMWQO2BwFEJRjsz0AMQBwjarSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAXcO9Kz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAXcO9Kz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765655599; x=1797191599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOC2loxk7tRA8VSyP6QsHaFWnRAYxLDftWuApE2x8E4=;
  b=DAXcO9KzOmESYHiO54JBhE8C3Bw9teLWgm1KEb9k5gHO1yEbQwPX9ijW
   odNtxkcW0hQE/MokopNRYq5FsSDzwa8i183ZMU6LOujwy8/0yk03KU9PV
   MHGaAHIMBAs0XphPOSi7XoAEP0L6dlDDbT6YLwQG0BCpo87PDcpGpbe5N
   mE+ZS0kYYXzOPLLUAed48jEqlIGMWl5C+BeVq1wCELIDVbvhdz0tvtfy3
   Gx5mPk3UMfWUuC5Qo1Q+9ZQ3tKuSLPqGJiCNBfU0ttuTWiHRuKWyxbgxz
   HPqxZyu7Swckzm2iTjZb2FekJW3hbgknDtCfnEbtn51En4Kt0YLzpR8IY
   A==;
X-CSE-ConnectionGUID: sLo5KzRORYaK6orqnF6vqA==
X-CSE-MsgGUID: xdrg3+0QTB6NmNZAunv1iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79076634"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79076634"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:53:17 -0800
X-CSE-ConnectionGUID: 4yYui4DFTGm9PXPuaadRkQ==
X-CSE-MsgGUID: Urg/tW3hRPeGkoKqgWGn4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196979702"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 11:53:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVg1-0000000088N-1dE7;
	Sat, 13 Dec 2025 19:53:13 +0000
Date: Sun, 14 Dec 2025 03:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/18]
 drivers/bluetooth/btintel_pcie.c:134:58: warning: shift count >= width of
 type
Message-ID: <202512140314.lkx4Ma5x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 277a489a74a56c03863c799b2d50515d9d547b90 [0/18] FROMGIT: Bluetooth: btintel_pcie: Setup buffers for firmware traces
config: i386-randconfig-001-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140314.lkx4Ma5x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140314.lkx4Ma5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140314.lkx4Ma5x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btintel_pcie.c:134:58: warning: shift count >= width of type [-Wshift-count-overflow]
     134 |                 db_frag.bufs[i].buf_addr_msb = (u32)((buf->data_p_addr >> 32) & 0xffffffff);
         |                                                                        ^  ~~
   drivers/bluetooth/btintel_pcie.c:419:20: warning: unused function 'btintel_pcie_in_rom' [-Wunused-function]
     419 | static inline bool btintel_pcie_in_rom(struct btintel_pcie_data *data)
         |                    ^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +134 drivers/bluetooth/btintel_pcie.c

    90	
    91	/* This function initializes the memory for DBGC buffers and formats the
    92	 * DBGC fragment which consists header info and DBGC buffer's LSB, MSB and
    93	 * size as the payload
    94	 */
    95	static int btintel_pcie_setup_dbgc(struct btintel_pcie_data *data)
    96	{
    97		struct btintel_pcie_dbgc_ctxt db_frag;
    98		struct data_buf *buf;
    99		int i;
   100	
   101		data->dbgc.count = BTINTEL_PCIE_DBGC_BUFFER_COUNT;
   102		data->dbgc.bufs = devm_kcalloc(&data->pdev->dev, data->dbgc.count,
   103					       sizeof(*buf), GFP_KERNEL);
   104		if (!data->dbgc.bufs)
   105			return -ENOMEM;
   106	
   107		data->dbgc.buf_v_addr = dmam_alloc_coherent(&data->pdev->dev,
   108							    data->dbgc.count *
   109							    BTINTEL_PCIE_DBGC_BUFFER_SIZE,
   110							    &data->dbgc.buf_p_addr,
   111							    GFP_KERNEL | __GFP_NOWARN);
   112		if (!data->dbgc.buf_v_addr)
   113			return -ENOMEM;
   114	
   115		data->dbgc.frag_v_addr = dmam_alloc_coherent(&data->pdev->dev,
   116							     sizeof(struct btintel_pcie_dbgc_ctxt),
   117							     &data->dbgc.frag_p_addr,
   118							     GFP_KERNEL | __GFP_NOWARN);
   119		if (!data->dbgc.frag_v_addr)
   120			return -ENOMEM;
   121	
   122		data->dbgc.frag_size = sizeof(struct btintel_pcie_dbgc_ctxt);
   123	
   124		db_frag.magic_num = BTINTEL_PCIE_MAGIC_NUM;
   125		db_frag.ver = BTINTEL_PCIE_DBGC_FRAG_VERSION;
   126		db_frag.total_size = BTINTEL_PCIE_DBGC_FRAG_PAYLOAD_SIZE;
   127		db_frag.num_buf = BTINTEL_PCIE_DBGC_FRAG_BUFFER_COUNT;
   128	
   129		for (i = 0; i < data->dbgc.count; i++) {
   130			buf = &data->dbgc.bufs[i];
   131			buf->data_p_addr = data->dbgc.buf_p_addr + i * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
   132			buf->data = data->dbgc.buf_v_addr + i * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
   133			db_frag.bufs[i].buf_addr_lsb = (u32)(buf->data_p_addr & 0xffffffff);
 > 134			db_frag.bufs[i].buf_addr_msb = (u32)((buf->data_p_addr >> 32) & 0xffffffff);
   135			db_frag.bufs[i].buf_size = BTINTEL_PCIE_DBGC_BUFFER_SIZE;
   136		}
   137	
   138		memcpy(data->dbgc.frag_v_addr, &db_frag, sizeof(db_frag));
   139		return 0;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
