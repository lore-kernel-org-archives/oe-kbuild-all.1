Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37E4317D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 03:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124500; cv=none; b=QB85g93j3eQltz6EuyW3ucs2/Utw666bxXSsJ1ZHpdPb5amLgx4ycY/PqIwLorRDqs2tHZUPPwwD1ZGfZKwge/9F0FO5PojGtwo4BHPkzYJsEEuxPkPWeMVRRzCSMH6jiyGuiYRmM/biWbW1NygJQx+NicIqNa6OA3rIJaq+SjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124500; c=relaxed/simple;
	bh=kPyBHZFJYZG55iBYBhzeEMguh1hORaA5fojB0Tl9Tu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ljLMA3BJlKPIxFDM6fLPLujSfPnCV5F65kDLO6qt6FqNIzl3m938PDwqJM18VM+ZAPAg9RDukqbzZlfeycjvqjhOH7sYY2rYiA5SIDTKpwizeWeQC544aNimcfIm02DQr8e1wOTYLJRUW1H5OfLyO2414kFUuDjhZhw2OtO+usw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrZifiKs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrZifiKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778124497; x=1809660497;
  h=date:from:to:cc:subject:message-id;
  bh=kPyBHZFJYZG55iBYBhzeEMguh1hORaA5fojB0Tl9Tu4=;
  b=ZrZifiKsnNBeTjGJmp6ieFAZ9ojuSLPLoqI4rC077+jnoZMvNqJsLAbn
   dGpaukGKRJM270ocWzVWJXXTMl2NUS9femTCnRcLJDcQyECQ+mxSPjh/E
   T46rijk+iYzStktiwniAWmoeRX0R1upSfyjkrx0R65O9vc3LG7AH1T5jK
   +I4OLmdPOOZ7zQpHhjFHpk9LbU7UY8mI3h/hY7HeoMH8hODlrE0M68lEv
   9EWQjIEeEVUID+0Ez5pwTmc70nOLMpx5Suy9/+spV+YAZVfZ+oIULKWHr
   9id734JHiEt1H77q9a4DLNI75wIV8IIrCSH3ObZsZY3D9HsxoKwmW47w9
   g==;
X-CSE-ConnectionGUID: hFl4ZbKlQ6WZ5yIqCRUDnw==
X-CSE-MsgGUID: 8NmUtXvYRl65vnKl0mI7gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="66596442"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="66596442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 20:28:16 -0700
X-CSE-ConnectionGUID: 7o4hTBObSG2TBmARhJJo/Q==
X-CSE-MsgGUID: gwFRxKtZS1KO9auMsCK6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="231799636"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2026 20:28:15 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKpPJ-000000001WX-0c91;
	Thu, 07 May 2026 03:28:13 +0000
Date: Thu, 07 May 2026 11:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 8/8]
 drivers/net/ethernet/intel/idpf/xdp.h:52:32: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202605071156.3OSoaxS2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/alobakin/linux libeth
head:   09f99e394061251bc42346001b2981cbbef452cb
commit: 09f99e394061251bc42346001b2981cbbef452cb [8/8] idpf: add flow-based XDP fallback for FWs without Tx FIFO support
config: s390-randconfig-r134-20260506 (https://download.01.org/0day-ci/archive/20260507/202605071156.3OSoaxS2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071156.3OSoaxS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071156.3OSoaxS2-lkp@intel.com/

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
