Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503633D398
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPwggr2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701345183; x=1732881183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/D0nP31y+BNUImC7h5CDgKynd/wZk76Z+YgWlhGsLuc=;
  b=nPwggr2RbOT8mmyd9DbXarDX8Dzx6bewBOefHlb11ORSAK0XneGT5nRU
   QYm1RQTpuXDjdwUMBQUCZwj7mMy4sP6GeqObMSCQ/O0r6xkWrFKoQOESI
   6KOUaCL5/AmYWDyp5CTuyOrnqxLW1kam/CiCC7+SOzrfOXTBqELNSLtEH
   92ksIuxNUl0Vlqyq4NQXwysN952Lmq+AkVmWsO77V9Lcu1DitpdQNl3UH
   sMZy6KYwCLBDh1qatNGSy5cPu4yId0+2MCO0ooIKT6/i4D7ZY2uku78s1
   BGyBjokmmR52DRQLIphWZVL4vjIiDxTxxMBbmEDy9cCAymy7NOH+Z/ar7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372691991"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="372691991"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100918760"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="1100918760"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2023 03:53:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8fbF-0001oB-1U;
	Thu, 30 Nov 2023 11:52:57 +0000
Date: Thu, 30 Nov 2023 19:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 15/17]
 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:718: warning: Function
 parameter or member 'parsed' not described in 'idpf_rx_singleq_base_csum'
Message-ID: <202311301936.oImJWAf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   1b1f16c230ce8b25207b3f807bd386fa564a3dec
commit: 3eb3222ace7950d8c3a2cc849fe73816d07c8a3a [15/17] idpf: reuse libie's definitions of parsed ptype structures
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311301936.oImJWAf8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301936.oImJWAf8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301936.oImJWAf8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:718: warning: Function parameter or member 'parsed' not described in 'idpf_rx_singleq_base_csum'
>> drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:718: warning: Excess function parameter 'ptype' description in 'idpf_rx_singleq_base_csum'
>> drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:758: warning: Function parameter or member 'parsed' not described in 'idpf_rx_singleq_flex_csum'
>> drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:758: warning: Excess function parameter 'ptype' description in 'idpf_rx_singleq_flex_csum'
--
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:2835: warning: Function parameter or member 'parsed' not described in 'idpf_rx_rsc'
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:2835: warning: Excess function parameter 'decoded' description in 'idpf_rx_rsc'


vim +718 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c

a5ab9ee0df0be8 Joshua Hay        2023-08-07  703  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  704  /**
a5ab9ee0df0be8 Joshua Hay        2023-08-07  705   * idpf_rx_singleq_base_csum - Indicate in skb if hw indicated a good cksum
a5ab9ee0df0be8 Joshua Hay        2023-08-07  706   * @rx_q: Rx completion queue
a5ab9ee0df0be8 Joshua Hay        2023-08-07  707   * @skb: skb currently being received and modified
a5ab9ee0df0be8 Joshua Hay        2023-08-07  708   * @rx_desc: the receive descriptor
a5ab9ee0df0be8 Joshua Hay        2023-08-07  709   * @ptype: Rx packet type
a5ab9ee0df0be8 Joshua Hay        2023-08-07  710   *
a5ab9ee0df0be8 Joshua Hay        2023-08-07  711   * This function only operates on the VIRTCHNL2_RXDID_1_32B_BASE_M base 32byte
a5ab9ee0df0be8 Joshua Hay        2023-08-07  712   * descriptor writeback format.
a5ab9ee0df0be8 Joshua Hay        2023-08-07  713   **/
a5ab9ee0df0be8 Joshua Hay        2023-08-07  714  static void idpf_rx_singleq_base_csum(struct idpf_queue *rx_q,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  715  				      struct sk_buff *skb,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  716  				      union virtchnl2_rx_desc *rx_desc,
3eb3222ace7950 Alexander Lobakin 2023-11-29  717  				      struct libie_rx_ptype_parsed parsed)
a5ab9ee0df0be8 Joshua Hay        2023-08-07 @718  {
a5ab9ee0df0be8 Joshua Hay        2023-08-07  719  	struct idpf_rx_csum_decoded csum_bits;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  720  	u32 rx_error, rx_status;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  721  	u64 qword;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  722  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  723  	qword = le64_to_cpu(rx_desc->base_wb.qword1.status_error_ptype_len);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  724  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  725  	rx_status = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_QW1_STATUS_M, qword);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  726  	rx_error = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_QW1_ERROR_M, qword);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  727  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  728  	csum_bits.ipe = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_ERROR_IPE_M, rx_error);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  729  	csum_bits.eipe = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_ERROR_EIPE_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  730  				   rx_error);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  731  	csum_bits.l4e = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_ERROR_L4E_M, rx_error);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  732  	csum_bits.pprs = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_ERROR_PPRS_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  733  				   rx_error);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  734  	csum_bits.l3l4p = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_STATUS_L3L4P_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  735  				    rx_status);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  736  	csum_bits.ipv6exadd = FIELD_GET(VIRTCHNL2_RX_BASE_DESC_STATUS_IPV6EXADD_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  737  					rx_status);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  738  	csum_bits.nat = 0;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  739  	csum_bits.eudpe = 0;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  740  
3eb3222ace7950 Alexander Lobakin 2023-11-29  741  	idpf_rx_singleq_csum(rx_q, skb, &csum_bits, parsed);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  742  }
a5ab9ee0df0be8 Joshua Hay        2023-08-07  743  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  744  /**
a5ab9ee0df0be8 Joshua Hay        2023-08-07  745   * idpf_rx_singleq_flex_csum - Indicate in skb if hw indicated a good cksum
a5ab9ee0df0be8 Joshua Hay        2023-08-07  746   * @rx_q: Rx completion queue
a5ab9ee0df0be8 Joshua Hay        2023-08-07  747   * @skb: skb currently being received and modified
a5ab9ee0df0be8 Joshua Hay        2023-08-07  748   * @rx_desc: the receive descriptor
a5ab9ee0df0be8 Joshua Hay        2023-08-07  749   * @ptype: Rx packet type
a5ab9ee0df0be8 Joshua Hay        2023-08-07  750   *
a5ab9ee0df0be8 Joshua Hay        2023-08-07  751   * This function only operates on the VIRTCHNL2_RXDID_2_FLEX_SQ_NIC flexible
a5ab9ee0df0be8 Joshua Hay        2023-08-07  752   * descriptor writeback format.
a5ab9ee0df0be8 Joshua Hay        2023-08-07  753   **/
a5ab9ee0df0be8 Joshua Hay        2023-08-07  754  static void idpf_rx_singleq_flex_csum(struct idpf_queue *rx_q,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  755  				      struct sk_buff *skb,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  756  				      union virtchnl2_rx_desc *rx_desc,
3eb3222ace7950 Alexander Lobakin 2023-11-29  757  				      struct libie_rx_ptype_parsed parsed)
a5ab9ee0df0be8 Joshua Hay        2023-08-07 @758  {
a5ab9ee0df0be8 Joshua Hay        2023-08-07  759  	struct idpf_rx_csum_decoded csum_bits;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  760  	u16 rx_status0, rx_status1;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  761  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  762  	rx_status0 = le16_to_cpu(rx_desc->flex_nic_wb.status_error0);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  763  	rx_status1 = le16_to_cpu(rx_desc->flex_nic_wb.status_error1);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  764  
a5ab9ee0df0be8 Joshua Hay        2023-08-07  765  	csum_bits.ipe = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_STATUS0_XSUM_IPE_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  766  				  rx_status0);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  767  	csum_bits.eipe = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_STATUS0_XSUM_EIPE_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  768  				   rx_status0);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  769  	csum_bits.l4e = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_STATUS0_XSUM_L4E_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  770  				  rx_status0);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  771  	csum_bits.eudpe = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_STATUS0_XSUM_EUDPE_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  772  				    rx_status0);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  773  	csum_bits.l3l4p = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_STATUS0_L3L4P_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  774  				    rx_status0);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  775  	csum_bits.ipv6exadd = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_STATUS0_IPV6EXADD_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  776  					rx_status0);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  777  	csum_bits.nat = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_STATUS1_NAT_M,
a5ab9ee0df0be8 Joshua Hay        2023-08-07  778  				  rx_status1);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  779  	csum_bits.pprs = 0;
a5ab9ee0df0be8 Joshua Hay        2023-08-07  780  
3eb3222ace7950 Alexander Lobakin 2023-11-29  781  	idpf_rx_singleq_csum(rx_q, skb, &csum_bits, parsed);
a5ab9ee0df0be8 Joshua Hay        2023-08-07  782  }
a5ab9ee0df0be8 Joshua Hay        2023-08-07  783  

:::::: The code at line 718 was first introduced by commit
:::::: a5ab9ee0df0be82aefb099d29b707d2b106e1c87 idpf: add singleq start_xmit and napi poll

:::::: TO: Joshua Hay <joshua.a.hay@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
