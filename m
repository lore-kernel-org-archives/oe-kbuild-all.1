Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81A519CC12
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725301515; cv=none; b=GOJnB20K/Mv9DzjxSC9ruqk6bqOw0jrGnS5Ah+uPB4EkIQ+38+Guhd55HmFMuk5Hi/A4hJZATTmcm3VYu5ODWaXUzOq943UO8l0mUem/Vi0JHnJN13vEwbgdm+/01qAsvWHKc/LmzmtauMvSYYgRKq88U9Q2qVdnDxIIf65EAak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725301515; c=relaxed/simple;
	bh=o7xttXOpSPFUYQDcn3GkbfnFAq6X6gii0ngkKbIFR7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tz9G7FhmECeIyPARXbX2kAomN6S1J1+/TCtWxqOSk9WEfvrowUZ59lAzATneapbk9cFGM+12WRcGa2BB6Cxjz1tP2wMxNpMequiuaJUVPuxrFZu/gY5dIZ/GGPAZ7cSpLUsYaXhk/PXXkbTvd5AzYmAmOswdx5YpuovUQl4703s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUJUR//d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUJUR//d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725301514; x=1756837514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o7xttXOpSPFUYQDcn3GkbfnFAq6X6gii0ngkKbIFR7c=;
  b=mUJUR//d8HoM6f4/ugiCiHm642Y+SysPCF9GuDW8RhvIiZFTHQH4coyn
   c/rW5oJIvdguDe6qugBjZ85DnOUDtS5HCocKCJP6RKEBAcrXMMKp4jTdU
   eGRpMRm27/z+6ERIgkJsr73BrhH8fWn31N14nphnKXQmPflrtXwPGutr9
   FJ3ez1pyuCO7KSUOrCn8VtVlSiQ0Qp+dFrKLIL7E6u/VcFHdmbPiDby+D
   5qPBhfcZQR5JXrDE5GXkQYuEvcxYAHLybbNyjVRmVKPgUz6a4auuXr3Qi
   /GrZ1o0Hmxoyvc54SVexuAOjKlLV2XgxkYIVvNW70fJGsz+N4bHz/w+4Z
   g==;
X-CSE-ConnectionGUID: 1cXRLZyuSXCBQku5p6QT3Q==
X-CSE-MsgGUID: WQ6Ie4+XTO2OWZAgAMlHXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34543283"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="34543283"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 11:25:13 -0700
X-CSE-ConnectionGUID: oBVSMh7VR32JTdIMEwZrog==
X-CSE-MsgGUID: ndudxrsBSW6Guz8/AHogXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="64716018"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2024 11:25:12 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slBji-0005oj-0y;
	Mon, 02 Sep 2024 18:25:10 +0000
Date: Tue, 3 Sep 2024 02:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25143/30000]
 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:104: warning: Excess
 function parameter 'direction' description in 'rnpgbevf_set_ring_vector'
Message-ID: <202409030213.Wm0NsmFj-lkp@intel.com>
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
commit: 656d579e9c4f700f9f7debda0c2541f34fc39a35 [25143/30000] drivers: initial support for rnpgbevf drivers from Mucse Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240903/202409030213.Wm0NsmFj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030213.Wm0NsmFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030213.Wm0NsmFj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:104: warning: Function parameter or member 'rnpgbevf_queue' not described in 'rnpgbevf_set_ring_vector'
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:104: warning: Function parameter or member 'rnpgbevf_msix_vector' not described in 'rnpgbevf_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:104: warning: Excess function parameter 'direction' description in 'rnpgbevf_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:104: warning: Excess function parameter 'queue' description in 'rnpgbevf_set_ring_vector'
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:104: warning: Excess function parameter 'msix_vector' description in 'rnpgbevf_set_ring_vector'
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:892: warning: Excess function parameter 'skb' description in 'rnpgbevf_is_non_eop'
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1738: warning: Excess function parameter 'rx_ring' description in 'rnpgbevf_pull_tail'
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2049: warning: Function parameter or member 'type' not described in 'rnpgbevf_update_itr'
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3728: warning: Function parameter or member 't' not described in 'rnpgbevf_watchdog'
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3728: warning: Excess function parameter 'data' description in 'rnpgbevf_watchdog'


vim +104 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c

    94	
    95	/**
    96	 * rnpgbevf_set_ivar - set IVAR registers - maps interrupt causes to vectors
    97	 * @adapter: pointer to adapter struct
    98	 * @direction: 0 for Rx, 1 for Tx, -1 for other causes
    99	 * @queue: queue to map the corresponding interrupt to
   100	 * @msix_vector: the vector to map to the corresponding queue
   101	 */
   102	static void rnpgbevf_set_ring_vector(struct rnpgbevf_adapter *adapter,
   103					     u8 rnpgbevf_queue, u8 rnpgbevf_msix_vector)
 > 104	{
   105		struct rnpgbevf_hw *hw = &adapter->hw;
   106		u32 data = 0;
   107	
   108		data = hw->vfnum << 24;
   109		data |= (rnpgbevf_msix_vector << 8);
   110		data |= (rnpgbevf_msix_vector << 0);
   111		DPRINTK(IFUP, INFO,
   112			"Set Ring-Vector queue:%d (reg:0x%x) <-- Rx-MSIX:%d, Tx-MSIX:%d\n",
   113			rnpgbevf_queue, RING_VECTOR(rnpgbevf_queue),
   114			rnpgbevf_msix_vector, rnpgbevf_msix_vector);
   115	
   116		rnpgbevf_wr_reg(hw->ring_msix_base + RING_VECTOR(rnpgbevf_queue), data);
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
