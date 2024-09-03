Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCFB1A42B9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361684; cv=none; b=ATaK2RPNqsRg2jSyfxTHAC9YiLJbbfpQZSXAg0Tybdt4tB/IQP2mF0EH2f0QELwR9In/53amSAfxx6otpYbgEx6yNH7AikV2T44uAIub23UIpXW/Kq68ke+0JiVN7CTdZQLNV8OVJZtY6fUUwCOOcklxz3RXaJtDq0iCygdptLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361684; c=relaxed/simple;
	bh=xRn6yyxRy6xJrthBq/u5AoQBpTfTQe3m4E35RDmELDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhiYE66RL75ZROv5izhxwmZBlMXyVTNpVfrO3ifmD0VsP23Uoc9o+qLttKD1fFuPoHOE8ZKzbiz0a7qj4i444oGWWJKs/yNOMEg4WkICxNS0JZJgUs99jRv/wk0nAj+axOdqI61x65UuLCn2SdGSBUEOs5WtcnlFVRcVLx+aRss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9EqipI0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9EqipI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725361682; x=1756897682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xRn6yyxRy6xJrthBq/u5AoQBpTfTQe3m4E35RDmELDA=;
  b=T9EqipI02chlhZo9VI3m6NB01+yswuGg4bsLY6ecdpBhcRkHMZsH6o4/
   IELPiUJvbleaMigbESwSRtPqfwGX7/XAB7SxJuCtEHb9X1izjXQMdnvMj
   1KFX9N3A9O3OgEhc34gjSX+hjcmVAJAM7ebwbHNBqDqDN4Yzi/JyZyNAo
   obExrf9irVAsiG6kIbgO9yNw8L9vUtbUGmSfHbN0oBZvg4VFoV9oz0WGD
   n54J+B0ZtKwQ0dDSA1i7uET1KvZb1wrlGW2op1OM1SeAdTKIcSJuW4O6I
   pxX2RwpXo9/0Q1C81FMdmf6QKd2ngb8L0Yowzi2ZMTQT7UaO1JyhmOgCb
   Q==;
X-CSE-ConnectionGUID: R7ERMEK2SoazKW3+BIrbZA==
X-CSE-MsgGUID: XtpwuHIeT+OG9GdwaOCfLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="26867824"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="26867824"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 04:07:59 -0700
X-CSE-ConnectionGUID: sb22ipsBQQGx1A4uYyHM7g==
X-CSE-MsgGUID: CDMcIHeeRVekteUf/rQZlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="64886685"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2024 04:07:59 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slRO8-0006XY-1f;
	Tue, 03 Sep 2024 11:07:56 +0000
Date: Tue, 3 Sep 2024 19:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yibo Dong <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27098/30000]
 drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: Excess function
 parameter 'direction' description in 'rnpvf_set_ring_vector'
Message-ID: <202409031941.6m1LMpai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7bed6628b750ffd687d1da0a170dece4b0c08bd
commit: 6cf173c15990725cb9c0c4570fbc90e937a757b4 [27098/30000] drivers: initial support for rnpvf drivers from Mucse Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240903/202409031941.6m1LMpai-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031941.6m1LMpai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031941.6m1LMpai-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: Function parameter or member 'rnpvf_queue' not described in 'rnpvf_set_ring_vector'
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: Function parameter or member 'rnpvf_msix_vector' not described in 'rnpvf_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: Excess function parameter 'direction' description in 'rnpvf_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: Excess function parameter 'queue' description in 'rnpvf_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:112: warning: Excess function parameter 'msix_vector' description in 'rnpvf_set_ring_vector'
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:807: warning: Excess function parameter 'rx_ring' description in 'rnpvf_pull_tail'
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1030: warning: Excess function parameter 'skb' description in 'rnpvf_is_non_eop'
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2203: warning: Function parameter or member 'type' not described in 'rnpvf_update_itr'
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3922: warning: Function parameter or member 't' not described in 'rnpvf_watchdog'
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3922: warning: Excess function parameter 'data' description in 'rnpvf_watchdog'


vim +112 drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c

   102	
   103	/**
   104	 * rnpvf_set_ivar - set IVAR registers - maps interrupt causes to vectors
   105	 * @adapter: pointer to adapter struct
   106	 * @direction: 0 for Rx, 1 for Tx, -1 for other causes
   107	 * @queue: queue to map the corresponding interrupt to
   108	 * @msix_vector: the vector to map to the corresponding queue
   109	 */
   110	static void rnpvf_set_ring_vector(struct rnpvf_adapter *adapter,
   111					  u8 rnpvf_queue, u8 rnpvf_msix_vector)
 > 112	{
   113		struct rnpvf_hw *hw = &adapter->hw;
   114		u32 data = 0;
   115	
   116		data = hw->vfnum << 24;
   117		data |= (rnpvf_msix_vector << 8);
   118		data |= (rnpvf_msix_vector << 0);
   119		DPRINTK(IFUP, INFO,
   120			"Set Ring-Vector queue:%d (reg:0x%x) <-- Rx-MSIX:%d, Tx-MSIX:%d\n",
   121			rnpvf_queue, RING_VECTOR(rnpvf_queue), rnpvf_msix_vector,
   122			rnpvf_msix_vector);
   123	
   124		rnpvf_wr_reg(hw->ring_msix_base + RING_VECTOR(rnpvf_queue), data);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
