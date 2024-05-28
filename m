Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5656F17798C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716926017; cv=none; b=nspGcGvtJl2munFMfxrF3g1sq146vBJwLz+SE83Z+YqKiKPozp6Ypi3a3Z7Rhi6ph0e5j5rBM93GnsnLdmgNhiPIZmK2ZTon6PhWqd3n7ORffGP+AfVOyyeuhqoOWcwzKKSEm4J4kQNjk31KhQlv9Wuov7s8iWZZI6R32T2Eo+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716926017; c=relaxed/simple;
	bh=2GDLW8mBju1o4uG0m5oGOiGTXqNYk//TNfdjYbjVCC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwurQwQdyTsd9XhS0VaWJn3edlmPmUmUDn4h9IjuomtpBNt9qxp1UTXgpyELKxJ0n/m/DuvLOINzmHEdXK/1n2Rz/qN1DMAAyZR7VSkX0vV85yUwOFSjmh24AFkNbdPCCZC6AxqRo6jpjQkgmFyzrIfdzw7kxkrkntDS7FEn82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ca9Ni0tG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ca9Ni0tG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716926016; x=1748462016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2GDLW8mBju1o4uG0m5oGOiGTXqNYk//TNfdjYbjVCC0=;
  b=Ca9Ni0tGuPXLUhL2u5d8Xlb1z4tGVsJDC83DG9uoIrNYwryUTGIykm09
   68bWzp5NzLL8a8OCmfiss4Nxx09ROAcve+1i08QG8M4eHiEaq182xmwN4
   xiQSQDRghkNxqpdepSB1DR+Vwhg5Inaw7vTAOn2V4hTMM1+mEhxkkOBTk
   N6YustHOs93GPJ1iupqu1FHwQ7KqC8Nbk6hJ6gwbIITfaT51TgzOs3Yia
   k1I1p5bQA+oEyt5WJ16ciFwDo7m+w0lxkK4M7QLcYEQ79Ypu8DWytQait
   3HTNbi0TdONSvaOx9l2nP7mK6iGSuHLGTOjfumelzLfYpdVyWOCt0rwv/
   A==;
X-CSE-ConnectionGUID: vSytnPSKTcKOahQ1OnwbGw==
X-CSE-MsgGUID: BUSbvHA3Sa+xiVvnctwfKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38680920"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="38680920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 12:53:33 -0700
X-CSE-ConnectionGUID: TbU7bDAvS9WqN0SZ/Fi57Q==
X-CSE-MsgGUID: HAEOm8hlQN+2e4GC485Nog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="66372826"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2024 12:53:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC2sx-000ChX-0X;
	Tue, 28 May 2024 19:53:27 +0000
Date: Wed, 29 May 2024 03:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	larysa.zaremba@intel.com, netdev@vger.kernel.org,
	michal.kubiak@intel.com, anthony.l.nguyen@intel.com,
	magnus.karlsson@intel.com
Subject: Re: [Intel-wired-lan] [PATCH iwl-net 08/11] ice: xsk: fix txq
 interrupt mapping
Message-ID: <202405290301.TKfQE09f-lkp@intel.com>
References: <20240528131429.3012910-9-maciej.fijalkowski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528131429.3012910-9-maciej.fijalkowski@intel.com>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-net-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Fijalkowski/ice-respect-netif-readiness-in-AF_XDP-ZC-related-ndo-s/20240528-211914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20240528131429.3012910-9-maciej.fijalkowski%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-net 08/11] ice: xsk: fix txq interrupt mapping
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240529/202405290301.TKfQE09f-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290301.TKfQE09f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290301.TKfQE09f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_xsk.c:117: warning: Function parameter or struct member 'qid' not described in 'ice_qvec_cfg_msix'
   drivers/net/ethernet/intel/ice/ice_xsk.c:479: warning: Function parameter or struct member 'xsk_pool' not described in '__ice_alloc_rx_bufs_zc'
   drivers/net/ethernet/intel/ice/ice_xsk.c:528: warning: Function parameter or struct member 'xsk_pool' not described in 'ice_alloc_rx_bufs_zc'
   drivers/net/ethernet/intel/ice/ice_xsk.c:983: warning: Function parameter or struct member 'xsk_pool' not described in 'ice_xmit_pkt'
   drivers/net/ethernet/intel/ice/ice_xsk.c:1008: warning: Function parameter or struct member 'xsk_pool' not described in 'ice_xmit_pkt_batch'
   drivers/net/ethernet/intel/ice/ice_xsk.c:1041: warning: Function parameter or struct member 'xsk_pool' not described in 'ice_fill_tx_hw_ring'


vim +117 drivers/net/ethernet/intel/ice/ice_xsk.c

2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  109  
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  110  /**
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  111   * ice_qvec_cfg_msix - Enable IRQ for given queue vector
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  112   * @vsi: the VSI that contains queue vector
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  113   * @q_vector: queue vector
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  114   */
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  115  static void
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  116  ice_qvec_cfg_msix(struct ice_vsi *vsi, struct ice_q_vector *q_vector, u16 qid)
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04 @117  {
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  118  	u16 reg_idx = q_vector->reg_idx;
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  119  	struct ice_pf *pf = vsi->back;
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  120  	struct ice_hw *hw = &pf->hw;
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  121  	int q, _qid = qid;
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  122  
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  123  	ice_cfg_itr(hw, q_vector);
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  124  
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  125  	for (q = 0; q < q_vector->num_ring_tx; q++) {
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  126  		ice_cfg_txq_interrupt(vsi, _qid, reg_idx, q_vector->tx.itr_idx);
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  127  		_qid++;
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  128  	}
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  129  
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  130  	_qid = qid;
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  131  
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  132  	for (q = 0; q < q_vector->num_ring_rx; q++) {
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  133  		ice_cfg_rxq_interrupt(vsi, _qid, reg_idx, q_vector->rx.itr_idx);
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  134  		_qid++;
d77176d15a1b0ed Maciej Fijalkowski     2024-05-28  135  	}
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  136  
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  137  	ice_flush(hw);
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  138  }
2d4238f55697221 Krzysztof Kazimierczak 2019-11-04  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
