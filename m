Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1CC11C94
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 03:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715138585; cv=none; b=AaGYvQxaDQUU0aTNfK8Cf2xExawMoFFhlnQRvrOYKXk8ontM99XRDWKZy8sj8F6QL3eLOA37SUHrFS874xsdhINM95cXE6w8RUs1hSi+6W6agd9VgfSgQQQRPRH78iqjpOes3NCYAdHNlimhMzAphKo88FVBlW5iOzm0fwI2mLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715138585; c=relaxed/simple;
	bh=TYiDW/ytglgjHK0I6iejG+2IRyuqW835XZhpbmCqJCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcFjdwiuV8920NrllAaR2gsWSc2u6EEwQ/hSARWuZqGATlbuj3VgsbQXjf6XFqLRxv/qYVAAFeL8OUU/F6OFZf8Col1DtSZav0eBFpy1WJRmMwciYYCx+mqjJj37FtsJ0+srBfx2VlH+TssGCjgHCPKsjpOSSKi98dNkL4+QyNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k08LhB1B; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k08LhB1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715138584; x=1746674584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TYiDW/ytglgjHK0I6iejG+2IRyuqW835XZhpbmCqJCA=;
  b=k08LhB1BNB7WZrwBcYU2NAGTBy51/uaaqeHicO27bx9S73eSpndOQbhu
   vxANFQK/nrqIjqiRMM8XLb/wvrag/UyP5q+BqWsuivLYUKG6VIJzFr6OW
   PFtwAHTLAC8cMN7jZOyenla56NC683fUV+P9rfn71XMcCK/9lllP6inIc
   /Otkvye91N0NW0ObB+fMpQrRqUgZEOsaeSto5qET9e0B0B09WTHlGZ8OT
   40dXG3uxXU8ha0HLMni28JIhBl7oZ/1re8hbFI0R435fyw44B+yIgEhBm
   SZPi81uRu7FKZ716BDwltvk/L/lKdw4SBtKgAZTfySyeR3fF3NRZraOB6
   g==;
X-CSE-ConnectionGUID: TVJITA/RSxumFg3GyiSMug==
X-CSE-MsgGUID: 25GoIrbaQ46i+CO3PZYB2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11104298"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="11104298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 20:23:03 -0700
X-CSE-ConnectionGUID: dtc4mAQETMOPtEZSP6Dx9Q==
X-CSE-MsgGUID: +X9yA49rS5qDNYVe8EvJOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28608728"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2024 20:23:02 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4XtU-0002um-1S;
	Wed, 08 May 2024 03:23:00 +0000
Date: Wed, 8 May 2024 11:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kiran K <kiran.k@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] Bluetooth: btintel_pcie: Add support for PCIe
 transport
Message-ID: <202405081103.uZlK7ysR-lkp@intel.com>
References: <20240507155658.294676-2-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507155658.294676-2-kiran.k@intel.com>

Hi Kiran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.9-rc7 next-20240507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiran-K/Bluetooth-btintel_pcie-Add-support-for-PCIe-transport/20240507-234447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240507155658.294676-2-kiran.k%40intel.com
patch subject: [PATCH v2 2/3] Bluetooth: btintel_pcie: Add support for PCIe transport
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240508/202405081103.uZlK7ysR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081103.uZlK7ysR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081103.uZlK7ysR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/btintel_pcie.c: In function 'btintel_pcie_enable_bt':
>> drivers/bluetooth/btintel_pcie.c:192:47: warning: right shift count >= width of type [-Wshift-count-overflow]
     192 |                               data->ci_p_addr >> 32);
         |                                               ^~
   drivers/bluetooth/btintel_pcie.c:184:13: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
     184 |         u32 reg;
         |             ^~~
   drivers/bluetooth/btintel_pcie.c: In function 'btintel_pcie_msix_rx_handle':
   drivers/bluetooth/btintel_pcie.c:458:22: warning: variable 'frbd' set but not used [-Wunused-but-set-variable]
     458 |         struct frbd *frbd;
         |                      ^~~~


vim +192 drivers/bluetooth/btintel_pcie.c

   174	
   175	/* This function enables BT function by setting BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT bit in
   176	 * BTINTEL_PCIE_CSR_FUNC_CTRL_REG register and wait for MSI-X with
   177	 * BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0.
   178	 * Then the host reads firmware version from BTINTEL_CSR_F2D_MBX and the boot stage
   179	 * from BTINTEL_PCIE_CSR_BOOT_STAGE_REG.
   180	 */
   181	static int btintel_pcie_enable_bt(struct btintel_pcie_data *data)
   182	{
   183		int err;
   184		u32 reg;
   185	
   186		data->gp0_received = false;
   187	
   188		/* Update the DMA address of CI struct to CSR */
   189		btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_CI_ADDR_LSB_REG,
   190				      data->ci_p_addr & 0xffffffff);
   191		btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_CI_ADDR_MSB_REG,
 > 192				      data->ci_p_addr >> 32);
   193	
   194		/* Reset the cached value of boot stage. it is updated by the MSI-X
   195		 * gp0 interrupt handler.
   196		 */
   197		data->boot_stage_cache = 0x0;
   198	
   199		/* Set MAC_INIT bit to start primary bootloader */
   200		reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
   201	
   202		btintel_pcie_set_reg_bits(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
   203					  BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT);
   204	
   205		/* Wait until MAC_ACCESS is granted */
   206		err = btintel_pcie_poll_bit(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
   207					    BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS,
   208					    BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS,
   209					    BTINTEL_DEFAULT_MAC_ACCESS_TIMEOUT_US);
   210		if (err < 0)
   211			return -ENODEV;
   212	
   213		/* MAC is ready. Enable BT FUNC */
   214		btintel_pcie_set_reg_bits(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
   215					  BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_ENA |
   216					  BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_INIT);
   217	
   218		reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
   219	
   220		/* wait for interrupt from the device after booting up to primary
   221		 * bootloader.
   222		 */
   223		err = wait_event_timeout(data->gp0_wait_q, data->gp0_received,
   224					 msecs_to_jiffies(BTINTEL_DEFAULT_INTR_TIMEOUT));
   225		if (!err)
   226			return -ETIME;
   227	
   228		/* Check cached boot stage is BTINTEL_PCIE_CSR_BOOT_STAGE_ROM(BIT(0)) */
   229		if (~data->boot_stage_cache & BTINTEL_PCIE_CSR_BOOT_STAGE_ROM)
   230			return -ENODEV;
   231	
   232		return 0;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
