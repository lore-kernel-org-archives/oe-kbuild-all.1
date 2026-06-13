Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966A225416
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781341886; cv=none; b=FEwdb9cb+Y1sqnG7U5GTpa8VlDKZ0HkDTaiultnbvKyPScUG9+Ro22a/7owC7Lf1kC0GALq/iOOs6zTOZucQyr1qhUFfvFTvTiw1dihIuvRe9HhEpoVvTH4tLmmj9fV1r8Jise+IAIDnv9DE6bMv6Y46RWJFEZ5CffvYp51SDjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781341886; c=relaxed/simple;
	bh=U7rWKhO9+qnqEej+eYdabEEaDrvpfuE7hGPlEXRmNOE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KaHP8x7OjLPHG7OUDa5vTWRy1zDorBGTqcUjKRT6aNvSvrH8K13e6ORpKefAoIGCaKZQy8AJE14b1+cL1D6sIcFwL0CQH1jxKjvgtYFj8Iq2D7fbUWmKXQeQHzaTQUDF8sZH3UXxd2No0C9l1pxHyyQV/rrXOJTaJr7KcrcV2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqTKv8Qz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqTKv8Qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781341884; x=1812877884;
  h=date:from:to:cc:subject:message-id;
  bh=U7rWKhO9+qnqEej+eYdabEEaDrvpfuE7hGPlEXRmNOE=;
  b=VqTKv8QzBOz+vuQD9zTIBXUarpckprq1P6XFglztYKg8+q+RBsyQHm6q
   yLUrFGcO/0uhYXBXesOMlQNXMWwf2wY1jc5DABlhA6h1XlfeLkruA/Mhm
   ypy8ceJWqhCOSTZo2q38XRqvMURIgZYJSI10GfXHdRynr7gVdzj/zo9A4
   PGyJfuh9GMe31LUMTC+V1ZqpLnClaiN9M9h55CyAIfWqIEpm15I/3FFDx
   LqZ3E+OfPcYzrCPDi2FRez0zOYqqno3s/oQar1H9v4g6WGBVlOlhzxwmt
   KpnHeT4WiHRfSYPCvo8OvdFddCyv1lypcWDnKfoi7sYO/wdCbeuAzPV9x
   A==;
X-CSE-ConnectionGUID: W+c8RUo3SuuTpzswCRQrsg==
X-CSE-MsgGUID: NhyNfcQHSbO8/ljJSLjpZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93552348"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="93552348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 02:11:24 -0700
X-CSE-ConnectionGUID: 5lYQa2EoTmu30bISi/dvXw==
X-CSE-MsgGUID: QWawq/9iSLKpgaFXmbUdZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="277222037"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2026 02:11:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYKOe-00000000PpS-0InE;
	Sat, 13 Jun 2026 09:11:20 +0000
Date: Sat, 13 Jun 2026 17:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 9/9]
 drivers/net/ethernet/intel/idpf/xdp.h:52:32: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202606131700.1bxLBC2r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/alobakin/linux libeth
head:   9e46fc70df7af200bb7352af1c5e1501e3b67672
commit: 9e46fc70df7af200bb7352af1c5e1501e3b67672 [9/9] idpf: add flow-based XDP fallback for FWs without Tx FIFO support
config: sparc64-randconfig-r122-20260613 (https://download.01.org/0day-ci/archive/20260613/202606131700.1bxLBC2r-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131700.1bxLBC2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131700.1bxLBC2r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/intel/idpf/xsk.c: note: in included file:
>> drivers/net/ethernet/intel/idpf/xdp.h:52:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] cmd_dtype @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/intel/idpf/xdp.h:52:32: sparse:     expected unsigned char [usertype] cmd_dtype
   drivers/net/ethernet/intel/idpf/xdp.h:52:32: sparse:     got restricted __le16 [usertype]
--
   drivers/net/ethernet/intel/idpf/xdp.c: note: in included file:
>> drivers/net/ethernet/intel/idpf/xdp.h:52:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] cmd_dtype @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/intel/idpf/xdp.h:52:32: sparse:     expected unsigned char [usertype] cmd_dtype
   drivers/net/ethernet/intel/idpf/xdp.h:52:32: sparse:     got restricted __le16 [usertype]

vim +52 drivers/net/ethernet/intel/idpf/xdp.h

    27	
    28	static inline void idpf_xdp_tx_xmit_fb(struct libeth_xdp_tx_desc desc, u32 i,
    29					       const struct libeth_xdpsq *sq, u64 priv)
    30	{
    31		struct idpf_flex_tx_sched_desc *tx_desc = sq->descs;
    32		u32 cmd;
    33	
    34		cmd = FIELD_PREP(IDPF_TXD_FLEX_FLOW_DTYPE_M,
    35				 IDPF_TX_DESC_DTYPE_FLEX_FLOW_SCHE);
    36		if (desc.flags & LIBETH_XDP_TX_LAST)
    37			cmd |= IDPF_TXD_FLEX_FLOW_CMD_EOP;
    38		if (priv && (desc.flags & LIBETH_XDP_TX_CSUM))
    39			cmd |= IDPF_TXD_FLEX_FLOW_CMD_CS_EN;
    40	
    41		tx_desc = &tx_desc[i];
    42		tx_desc->buf_addr = cpu_to_le64(desc.addr);
    43	
    44	#ifdef __LIBETH_WORD_ACCESS
    45		*(u64 *)&tx_desc->qw1 = ((u64)desc.len << 48) | ((u64)i << 32) | cmd;
    46	#else
    47		tx_desc->qw1.rxr_bufsize = cpu_to_le16(desc.len);
    48		tx_desc->qw1.compl_tag = cpu_to_le16(i);
    49		tx_desc->qw1.ts[0] = 0;
    50		tx_desc->qw1.ts[1] = 0;
    51		tx_desc->qw1.ts[2] = 0;
  > 52		tx_desc->qw1.cmd_dtype = cpu_to_le16(cmd);
    53	#endif
    54	}
    55	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
