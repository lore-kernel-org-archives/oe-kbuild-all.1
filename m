Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E181C5F1F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736005622; cv=none; b=igJpXPniSGElDWt5PNnvdZ1ynuAwXVrSQwXreHKpdQkbJA1++C5nLZu2b+pNXk7Iqh7jQF2EkuTx0ZFe3X5L6TD69bv5UPT3DAtlnfQsLhcguKFEC2RDf16xJRg1D1a49DakhiyhEQwbMn1j/70YswBo8FMzsjadcmCC86pelDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736005622; c=relaxed/simple;
	bh=fbr07a0oxzqUCVyg3zt6BppXONYgLGwTcnpNxWNTjM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILhe9RadKX4gnjPufPq4kBph7DiXdMffw9AqIUrC6ocdWdj2Pv8iTPaWpxQ/WVf04FWFUpXCDA67MHepB7VhiiKz32HjT8+ExmsJyASouw//f0/7PsZ8V9t92u9tgU0eIZqckZR0rCegyXYEJ7PHWkNXsBLsrkzwd8Scvxsc0SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5WKTrjg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5WKTrjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736005619; x=1767541619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fbr07a0oxzqUCVyg3zt6BppXONYgLGwTcnpNxWNTjM4=;
  b=N5WKTrjgD/LMEMxPFizIem24ttRTJQdPCof6veO7CKdLOtBcNA70Bswb
   RycQ8b2txLgwDVvQ9mICxQUt0mq0R5UzPCtzMMGhDu5qEJ8txXkFLLRdP
   nfcis5UBCJF/qXPcqtMUnq2qs9WqI2VT57mUoa89FLvUvy2acw/xbIZL0
   KuDNoFTCRlaqLuoU/iN/io8yWURsC6oCBeB3x+GLdYXBDNAoxohRQwxTh
   iPNizqbt+1vNxcmSNMcJ6AEYiLvbYG7dS52GdloD/yGxGm3A93JwjXxq/
   c34bGs23RV8WK1Ix4noHfQZw8YJqsl4DPU8KA/rCGqGutWLznm6IBh5XX
   g==;
X-CSE-ConnectionGUID: Sc2pgxXQRw2WutdVI+aZqg==
X-CSE-MsgGUID: xV/fn09PRcuuCg3EuFSCbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36094427"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="36094427"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 07:46:58 -0800
X-CSE-ConnectionGUID: ChndAzcxS8mrTTdZBXc4Qw==
X-CSE-MsgGUID: aIgxDF4+TkuJckNdbQM5kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101891609"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jan 2025 07:46:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU6MY-000B1R-29;
	Sat, 04 Jan 2025 15:46:54 +0000
Date: Sat, 4 Jan 2025 23:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jon Mason <jdmason@kudzu.us>
Subject: drivers/ntb/msi.c:38: warning: Function parameter or struct member
 'desc_changed' not described in 'ntb_msi_init'
Message-ID: <202501042317.rG3tE7M5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 26b3a37b928457ba2cd98eaf6d7b0feca5a30fa6 NTB: Introduce MSI library
date:   6 years ago
config: alpha-randconfig-r025-20220508 (https://download.01.org/0day-ci/archive/20250104/202501042317.rG3tE7M5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501042317.rG3tE7M5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501042317.rG3tE7M5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ntb/msi.c:38: warning: Function parameter or struct member 'desc_changed' not described in 'ntb_msi_init'
   drivers/ntb/msi.c:288: warning: Function parameter or struct member 'name' not described in 'ntbm_msi_request_threaded_irq'
   drivers/ntb/msi.c:288: warning: Function parameter or struct member 'msi_desc' not described in 'ntbm_msi_request_threaded_irq'
   drivers/ntb/msi.c:288: warning: Excess function parameter 'devname' description in 'ntbm_msi_request_threaded_irq'


vim +38 drivers/ntb/msi.c

    22	
    23	/**
    24	 * ntb_msi_init() - Initialize the MSI context
    25	 * @ntb:	NTB device context
    26	 *
    27	 * This function must be called before any other ntb_msi function.
    28	 * It initializes the context for MSI operations and maps
    29	 * the peer memory windows.
    30	 *
    31	 * This function reserves the last N outbound memory windows (where N
    32	 * is the number of peers).
    33	 *
    34	 * Return: Zero on success, otherwise a negative error number.
    35	 */
    36	int ntb_msi_init(struct ntb_dev *ntb,
    37			 void (*desc_changed)(void *ctx))
  > 38	{
    39		phys_addr_t mw_phys_addr;
    40		resource_size_t mw_size;
    41		size_t struct_size;
    42		int peer_widx;
    43		int peers;
    44		int ret;
    45		int i;
    46	
    47		peers = ntb_peer_port_count(ntb);
    48		if (peers <= 0)
    49			return -EINVAL;
    50	
    51		struct_size = sizeof(*ntb->msi) + sizeof(*ntb->msi->peer_mws) * peers;
    52	
    53		ntb->msi = devm_kzalloc(&ntb->dev, struct_size, GFP_KERNEL);
    54		if (!ntb->msi)
    55			return -ENOMEM;
    56	
    57		ntb->msi->desc_changed = desc_changed;
    58	
    59		for (i = 0; i < peers; i++) {
    60			peer_widx = ntb_peer_mw_count(ntb) - 1 - i;
    61	
    62			ret = ntb_peer_mw_get_addr(ntb, peer_widx, &mw_phys_addr,
    63						   &mw_size);
    64			if (ret)
    65				goto unroll;
    66	
    67			ntb->msi->peer_mws[i] = devm_ioremap(&ntb->dev, mw_phys_addr,
    68							     mw_size);
    69			if (!ntb->msi->peer_mws[i]) {
    70				ret = -EFAULT;
    71				goto unroll;
    72			}
    73		}
    74	
    75		return 0;
    76	
    77	unroll:
    78		for (i = 0; i < peers; i++)
    79			if (ntb->msi->peer_mws[i])
    80				devm_iounmap(&ntb->dev, ntb->msi->peer_mws[i]);
    81	
    82		devm_kfree(&ntb->dev, ntb->msi);
    83		ntb->msi = NULL;
    84		return ret;
    85	}
    86	EXPORT_SYMBOL(ntb_msi_init);
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
