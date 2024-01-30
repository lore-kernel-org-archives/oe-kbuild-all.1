Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F06438380
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 05:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706593250; cv=none; b=nHpCVK8sq3oP5FCKAPEhaEeMAdmtkS9gHmiK0gKOmnKR1zmI/tq0QYBppS1OVgSw1iECzRuMuu+wdHRxssPbALxq//g17ETPwjRYncGautOwu9MxF2k9dYO8vJ2aOpYeZ5bFjw4yV+ZCnvdq+vnJ/+sAVC8FXRWn00E9/XR7YU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706593250; c=relaxed/simple;
	bh=q5w5kBrq00tpTVAVHAPxx+a1xvAM5qmmxnXh+QlQvWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SoM+FoYIRR2QrYDp3InOxgrB4tJ9AychUioS0Qq2kNdpbMtYtKKn7Fu8YepUZglS3GlgfxbrkUppvFPvIymyqzdc7mmfEtj3jUrhATdQb5+MmVv52NfFRw+cyioP4+03NrFPY3hncNx2p5HbMHuOWw8end6mv/6twAM8QYS1NCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2ue4C1F; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2ue4C1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706593249; x=1738129249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q5w5kBrq00tpTVAVHAPxx+a1xvAM5qmmxnXh+QlQvWs=;
  b=G2ue4C1F2ZPdSLtzrvdyZ96rY+JcbnAwV9K89tCI0ubj4FQl5koFsVi0
   0TGbJUlxbuVAI/cpTz1JSpf7RpFJ0llOGIhD181v+1kH0mPJazZ2rzHNz
   HbVJqxcAszu46aVWGGem/44rW+vno1RORgs/0YDvIuOre/g6Mb+ZBCMIw
   JRJkcV4obt4AovNypxCLz1QyXN8Nc5NBIY7RyL0DgMpQPHVW6f2ay/ML+
   BTjNhoWvr1cUT/LXvnugHf/nkuO+liPFS5p/58YrX17JDKgKN5Jwg+eJN
   1ZbUBktBEiXKheT9cp/N1RFlE2bNs7IQ5w0NX19OA1Xw3ecVjdnmXl5mU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9815839"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="9815839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 21:40:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3548325"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2024 21:40:47 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUgrV-0004wA-0E;
	Tue, 30 Jan 2024 05:40:45 +0000
Date: Tue, 30 Jan 2024 13:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 20/22]
 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:961: warning: Excess
 function parameter 'rx_q' description in
 'idpf_rx_singleq_extract_base_fields'
Message-ID: <202401301308.YctIW0kR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   001088a7cb427528b6de7c2b879ad817e5515281
commit: 9a8c4937f43e93815440fdf12a145224e45ac433 [20/22] idpf: split &idpf_queue into 4 strictly-typed queue structures
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240130/202401301308.YctIW0kR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401301308.YctIW0kR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401301308.YctIW0kR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:961: warning: Excess function parameter 'rx_q' description in 'idpf_rx_singleq_extract_base_fields'
>> drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:985: warning: Excess function parameter 'rx_q' description in 'idpf_rx_singleq_extract_flex_fields'
--
>> drivers/net/ethernet/intel/idpf/idpf_ethtool.c:696: warning: Function parameter or struct member 'type' not described in 'idpf_add_queue_stats'


vim +961 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c

d4d5587182664b Pavan Kumar Linga 2023-08-07  945  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  946  /**
a5ab9ee0df0be8 Joshua Hay        2023-08-07  947   * idpf_rx_singleq_extract_base_fields - Extract fields from the Rx descriptor
a5ab9ee0df0be8 Joshua Hay        2023-08-07  948   * @rx_q: Rx descriptor queue
a5ab9ee0df0be8 Joshua Hay        2023-08-07  949   * @rx_desc: the descriptor to process
a5ab9ee0df0be8 Joshua Hay        2023-08-07  950   * @fields: storage for extracted values
a5ab9ee0df0be8 Joshua Hay        2023-08-07  951   *
a5ab9ee0df0be8 Joshua Hay        2023-08-07  952   * Decode the Rx descriptor and extract relevant information including the
a5ab9ee0df0be8 Joshua Hay        2023-08-07  953   * size and Rx packet type.
a5ab9ee0df0be8 Joshua Hay        2023-08-07  954   *
a5ab9ee0df0be8 Joshua Hay        2023-08-07  955   * This function only operates on the VIRTCHNL2_RXDID_1_32B_BASE_M base 32byte
a5ab9ee0df0be8 Joshua Hay        2023-08-07  956   * descriptor writeback format.
a5ab9ee0df0be8 Joshua Hay        2023-08-07  957   */
9a8c4937f43e93 Alexander Lobakin 2023-11-29  958  static void
9a8c4937f43e93 Alexander Lobakin 2023-11-29  959  idpf_rx_singleq_extract_base_fields(const union virtchnl2_rx_desc *rx_desc,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  960  				    struct idpf_rx_extracted *fields)
a5ab9ee0df0be8 Joshua Hay        2023-08-07 @961  {
a5ab9ee0df0be8 Joshua Hay        2023-08-07  962  	u64 qword;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  963  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  964  	qword = le64_to_cpu(rx_desc->base_wb.qword1.status_error_ptype_len);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  965  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  966  	fields->size = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_QW1_LEN_PBUF_M, qword);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  967  	fields->rx_ptype = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_QW1_PTYPE_M, qword);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  968  }
a5ab9ee0df0be8 Joshua Hay        2023-08-07  969  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  970  /**
a5ab9ee0df0be8 Joshua Hay        2023-08-07  971   * idpf_rx_singleq_extract_flex_fields - Extract fields from the Rx descriptor
a5ab9ee0df0be8 Joshua Hay        2023-08-07  972   * @rx_q: Rx descriptor queue
a5ab9ee0df0be8 Joshua Hay        2023-08-07  973   * @rx_desc: the descriptor to process
a5ab9ee0df0be8 Joshua Hay        2023-08-07  974   * @fields: storage for extracted values
a5ab9ee0df0be8 Joshua Hay        2023-08-07  975   *
a5ab9ee0df0be8 Joshua Hay        2023-08-07  976   * Decode the Rx descriptor and extract relevant information including the
a5ab9ee0df0be8 Joshua Hay        2023-08-07  977   * size and Rx packet type.
a5ab9ee0df0be8 Joshua Hay        2023-08-07  978   *
a5ab9ee0df0be8 Joshua Hay        2023-08-07  979   * This function only operates on the VIRTCHNL2_RXDID_2_FLEX_SQ_NIC flexible
a5ab9ee0df0be8 Joshua Hay        2023-08-07  980   * descriptor writeback format.
a5ab9ee0df0be8 Joshua Hay        2023-08-07  981   */
9a8c4937f43e93 Alexander Lobakin 2023-11-29  982  static void
9a8c4937f43e93 Alexander Lobakin 2023-11-29  983  idpf_rx_singleq_extract_flex_fields(const union virtchnl2_rx_desc *rx_desc,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  984  				    struct idpf_rx_extracted *fields)
a5ab9ee0df0be8 Joshua Hay        2023-08-07 @985  {
a5ab9ee0df0be8 Joshua Hay        2023-08-07  986  	fields->size = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_PKT_LEN_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  987  				 le16_to_cpu(rx_desc->flex_nic_wb.pkt_len));
a5ab9ee0df0be8 Joshua Hay        2023-08-07  988  	fields->rx_ptype = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_PTYPE_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  989  				     le16_to_cpu(rx_desc->flex_nic_wb.ptype_flex_flags0));
a5ab9ee0df0be8 Joshua Hay        2023-08-07  990  }
a5ab9ee0df0be8 Joshua Hay        2023-08-07  991  

:::::: The code at line 961 was first introduced by commit
:::::: a5ab9ee0df0be82aefb099d29b707d2b106e1c87 idpf: add singleq start_xmit and napi poll

:::::: TO: Joshua Hay <joshua.a.hay@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
