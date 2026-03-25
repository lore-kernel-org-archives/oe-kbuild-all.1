Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A95535838E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774421039; cv=none; b=udWudW/fb4QKIq8IxZtaBTloW93dObKzMILBmubZtWfQjGNGTRXUSO3r6U5nEnig1rip0ZVKhWl1YIJDLRvzjKzL/D7yWBTtPdtRAOFaqwjiy/+k9nqO8mFELV5hCocPhqKVPMIHN2z0anoFodpoWzXSZNQ9V20P9umtjq51I10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774421039; c=relaxed/simple;
	bh=hHyIJfe+RBMj/9nCD6k5EPQ0ndHbn5yhwIDXlm4nPi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kIU45IXcHfW9v0Ki/QCIAt5WG+6I7cRONpv9wSjiScsV1GIM2KReF29jtBS83Cn9jXcnF5cIixpIoivkVdYI0XFUdy6jKRX7pWLLMgnkiXD1mKZZGPCxU7fantweSMckTNodjpaCt5kKuwcb8zVsMOJOwAMU27ucscfhIZrN948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UA0hHxXR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UA0hHxXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774421038; x=1805957038;
  h=date:from:to:cc:subject:message-id;
  bh=hHyIJfe+RBMj/9nCD6k5EPQ0ndHbn5yhwIDXlm4nPi8=;
  b=UA0hHxXRPHRaAEVqtsnv3k4hwGZfqsXGxjPP3NzRoGrtgoxVBTAQ8qg8
   7sOHa5j15JkVr5yLszGGNrZzv7ls3LRiJV+cQ2uF7miq6ZrYyAGt6F05R
   MEfHvDL+6HttsATY7o1uUmXujXqNPRE9nuBI5POX9IKchI40fdkYDMYio
   B+ErtvP/ZSIkFQPiDZcJDJyzjmwu19Cz02EQYObs/+4qHhVqrQOylqBYp
   xc7yRrTeh840Mc/7nysRuwmfdTfMchf33kjm2GHPA7XnQ1CgCDNZtsW3M
   fNJBChm3nxDLbZIEUrDBEbWLzP05t8JEKJ+sEhs7r+A6hOWho/x4s8qCY
   Q==;
X-CSE-ConnectionGUID: rsckDi7CQKmcbsmB28nmOQ==
X-CSE-MsgGUID: mOoXVp8SREOJtMFxnidR4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75340214"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75340214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 23:43:55 -0700
X-CSE-ConnectionGUID: bD29/lhLTxSG1As2VY854w==
X-CSE-MsgGUID: LXog+5CYSO+f5iDHxBEpMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224600437"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 23:43:54 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Hy3-000000006KK-3NRF;
	Wed, 25 Mar 2026 06:43:51 +0000
Date: Wed, 25 Mar 2026 14:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 44/44]
 drivers/bluetooth/btintel_pcie.c:134:72: warning: right shift count >= width
 of type
Message-ID: <202603251440.Ec6QsRUw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiran,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: 277a489a74a56c03863c799b2d50515d9d547b90 [44/44] FROMGIT: Bluetooth: btintel_pcie: Setup buffers for firmware traces
config: i386-randconfig-141-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251440.Ec6QsRUw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251440.Ec6QsRUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251440.Ec6QsRUw-lkp@intel.com/

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
