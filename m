Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19A512D1F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765607592; cv=none; b=piAOCivQYWJV6M9/n53BPYaBoFVJ/KynAiKjrY5NbFCwDyNrju0DBjTWN91jHdiamxVz4Lj1VtrU+CWPYde39HXZm1XmB+DiRBVKEgFue7EOHIk9uOZe+9zjmTgj1U9y1ikgTl8N72sNrg8qva2lmHHtB7qZywGmrpOSVj7TfT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765607592; c=relaxed/simple;
	bh=wmJdESA6/pSbKhjnVgVS+KonXuHc/svMpzNmilRLFxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PCFy9Avca01v6V7b9UHs85VbAZL0ZHfgIeAVlnAbl1+7kaxd4lY8Ey171zXMqX+UfRwxHAWWmJDicQN4VsPRn0zak3AlIXREkd25orePR52l0kXbxTTxurqYwoplGAohaCxLNwoefmgkBkk4Fhn7X+EK2GHj7sfpQ59YPT31u2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyMZUY6k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyMZUY6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765607590; x=1797143590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wmJdESA6/pSbKhjnVgVS+KonXuHc/svMpzNmilRLFxc=;
  b=CyMZUY6kIZCvpwfife2MgUnkuPL5ZItA9LtkIWcO2a1p22IcSJN484Sb
   T6Ou7bsILXGKHGftGQg/p03OQfHwF1yQ3lWhYgNpcjscYG7aY3nLyCfmC
   Zj5G3MK+AywTzlDKoL9V8lo/GN3ZI/kssXLkW4nRAI345xchgkOyrgPMR
   HY981BaHJQ6A+R3aVDg03wR2eKJc/kmK5QshAkMpAcKZpVHVEW7eF1Jq2
   Jqs/St3zpjI9wBfddXx8eaNDR3wz4gNIBKFSw9w1IuJxHyAmdKlcqa0vC
   VvJNsZqNzmadIxoJxNAgJ7r3gRf8iXHt2J0On0+kN3hFyOy6c2FLsuhhr
   w==;
X-CSE-ConnectionGUID: yUmj/JSRSnGGa03phWI4IQ==
X-CSE-MsgGUID: Lc43n9hTSoaEM0cWFAkPOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78241652"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78241652"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:33:10 -0800
X-CSE-ConnectionGUID: 9efJbgfnSGS/BMVAY6dhvA==
X-CSE-MsgGUID: xQF2/7UISXGo68K6l5JNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="198094473"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 22:33:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJBi-000000007Av-42YU;
	Sat, 13 Dec 2025 06:33:06 +0000
Date: Sat, 13 Dec 2025 14:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/18]
 drivers/bluetooth/btintel_pcie.c:134:72: warning: right shift count >= width
 of type
Message-ID: <202512131401.6PEY4Xwd-lkp@intel.com>
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
config: i386-randconfig-012-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131401.6PEY4Xwd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131401.6PEY4Xwd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131401.6PEY4Xwd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/btintel_pcie.c: In function 'btintel_pcie_setup_dbgc':
>> drivers/bluetooth/btintel_pcie.c:134:72: warning: right shift count >= width of type [-Wshift-count-overflow]
     134 |                 db_frag.bufs[i].buf_addr_msb = (u32)((buf->data_p_addr >> 32) & 0xffffffff);
         |                                                                        ^~


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
