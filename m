Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6812AD2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766754212; cv=none; b=GuweWnep8rN+ssqlHgaK4TUjQeyCgnqiU9NddoSHmS9oSyoG4Rf+zjqPa93sG558p/enU9WF7DEUpRSm/lydThK5RnqDlrTBREzbsKe5HF7ektYSlsMGxZYq0LErVukrCUDSfP/xdj/I4pVGE8Ieg65eo0Ulb5vYmMnulsPl3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766754212; c=relaxed/simple;
	bh=9YdZzEAbofxVaxglfWO2jF1QRssb6tkG6W1T+FnBIGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoDPc19xz//dPxXBxfqtFBnsnjKR4Tms4Xkok6EMgq54l8UP4vNjWAIDbl6kgc2y3fAmLwBRa0qkV/862AZfj0T4RwCWYDj0FoS38PCApg/ckzLjcypVr1QsbORL9GMU3iIC5bHIcf85gZTiS9ap/tIAr2Dk24+MwkB2HR8WjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTHcgGSw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTHcgGSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766754211; x=1798290211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9YdZzEAbofxVaxglfWO2jF1QRssb6tkG6W1T+FnBIGg=;
  b=OTHcgGSwYWi4gb5KcC5U+se36TDT30/oUdDHK5LBOoyWaXsJxVsf8lr+
   r5t+iIT1PjZnJ7NwJDUeBxSVCo7uC8St+34/4FsvBTiZ+07MB2DwNNvd4
   8jUEzzWeX5ITCmZ7zRZqOyFjc/lQq+OzJKK2LgAPbR+5GJU6SWCk/NV+q
   P1lqwn0apmtxrMtaob8d3wmNpRSB8Vsi5d8gZKWML3TgM2qvK+v+0TR/M
   E5HVDKNu+WDWQIeOvXRYK6PeXIJ010oorlpvMl7Xr+nMYh+TJha3/AmoW
   Jn4YLpe7J4WNftS0ks51F3Kd1pWiommXiNSPl36D87gQzfT3TOxFBP8+1
   g==;
X-CSE-ConnectionGUID: BEZLJWf4S++GuaFzi1Wb9A==
X-CSE-MsgGUID: gGu/SQN5RjybhlmKEHpYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68443775"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68443775"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 05:03:30 -0800
X-CSE-ConnectionGUID: BTqgoosyTNuUQHMcdAoE1g==
X-CSE-MsgGUID: vd7TULrOTCezpPb2WnQAHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200685821"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Dec 2025 05:03:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ7Ta-0000000052f-1Jdp;
	Fri, 26 Dec 2025 13:03:26 +0000
Date: Fri, 26 Dec 2025 21:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Lifshits <vitaly.lifshits@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev,
	Vitaly Lifshits <vitaly.lifshits@intel.com>
Subject: Re: [Intel-wired-lan] [PATCH iwl-net v1 2/2] e1000e: clear DPG_EN
 after reset to avoid autonomous power-gating
Message-ID: <202512262022.ZrpAYewG-lkp@intel.com>
References: <20251223095032.1379862-3-vitaly.lifshits@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223095032.1379862-3-vitaly.lifshits@intel.com>

Hi Vitaly,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-net-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Lifshits/e1000e-introduce-new-MAC-type-for-Panther-Lake-PCH/20251223-175226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20251223095032.1379862-3-vitaly.lifshits%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-net v1 2/2] e1000e: clear DPG_EN after reset to avoid autonomous power-gating
config: i386-randconfig-141-20251224 (https://download.01.org/0day-ci/archive/20251226/202512262022.ZrpAYewG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512262022.ZrpAYewG-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/e1000e/ich8lan.c:4938 e1000_reset_hw_ich8lan() warn: inconsistent indenting

vim +4938 drivers/net/ethernet/intel/e1000e/ich8lan.c

  4823	
  4824	/**
  4825	 *  e1000_reset_hw_ich8lan - Reset the hardware
  4826	 *  @hw: pointer to the HW structure
  4827	 *
  4828	 *  Does a full reset of the hardware which includes a reset of the PHY and
  4829	 *  MAC.
  4830	 **/
  4831	static s32 e1000_reset_hw_ich8lan(struct e1000_hw *hw)
  4832	{
  4833		struct e1000_dev_spec_ich8lan *dev_spec = &hw->dev_spec.ich8lan;
  4834		u16 kum_cfg;
  4835		u32 ctrl, reg;
  4836		s32 ret_val;
  4837	
  4838		/* Prevent the PCI-E bus from sticking if there is no TLP connection
  4839		 * on the last TLP read/write transaction when MAC is reset.
  4840		 */
  4841		ret_val = e1000e_disable_pcie_master(hw);
  4842		if (ret_val)
  4843			e_dbg("PCI-E Master disable polling has failed.\n");
  4844	
  4845		e_dbg("Masking off all interrupts\n");
  4846		ew32(IMC, 0xffffffff);
  4847	
  4848		/* Disable the Transmit and Receive units.  Then delay to allow
  4849		 * any pending transactions to complete before we hit the MAC
  4850		 * with the global reset.
  4851		 */
  4852		ew32(RCTL, 0);
  4853		ew32(TCTL, E1000_TCTL_PSP);
  4854		e1e_flush();
  4855	
  4856		usleep_range(10000, 11000);
  4857	
  4858		/* Workaround for ICH8 bit corruption issue in FIFO memory */
  4859		if (hw->mac.type == e1000_ich8lan) {
  4860			/* Set Tx and Rx buffer allocation to 8k apiece. */
  4861			ew32(PBA, E1000_PBA_8K);
  4862			/* Set Packet Buffer Size to 16k. */
  4863			ew32(PBS, E1000_PBS_16K);
  4864		}
  4865	
  4866		if (hw->mac.type == e1000_pchlan) {
  4867			/* Save the NVM K1 bit setting */
  4868			ret_val = e1000_read_nvm(hw, E1000_NVM_K1_CONFIG, 1, &kum_cfg);
  4869			if (ret_val)
  4870				return ret_val;
  4871	
  4872			if (kum_cfg & E1000_NVM_K1_ENABLE)
  4873				dev_spec->nvm_k1_enabled = true;
  4874			else
  4875				dev_spec->nvm_k1_enabled = false;
  4876		}
  4877	
  4878		ctrl = er32(CTRL);
  4879	
  4880		if (!hw->phy.ops.check_reset_block(hw)) {
  4881			/* Full-chip reset requires MAC and PHY reset at the same
  4882			 * time to make sure the interface between MAC and the
  4883			 * external PHY is reset.
  4884			 */
  4885			ctrl |= E1000_CTRL_PHY_RST;
  4886	
  4887			/* Gate automatic PHY configuration by hardware on
  4888			 * non-managed 82579
  4889			 */
  4890			if ((hw->mac.type == e1000_pch2lan) &&
  4891			    !(er32(FWSM) & E1000_ICH_FWSM_FW_VALID))
  4892				e1000_gate_hw_phy_config_ich8lan(hw, true);
  4893		}
  4894		ret_val = e1000_acquire_swflag_ich8lan(hw);
  4895		e_dbg("Issuing a global reset to ich8lan\n");
  4896		ew32(CTRL, (ctrl | E1000_CTRL_RST));
  4897		/* cannot issue a flush here because it hangs the hardware */
  4898		msleep(20);
  4899	
  4900		/* Set Phy Config Counter to 50msec */
  4901		if (hw->mac.type == e1000_pch2lan) {
  4902			reg = er32(FEXTNVM3);
  4903			reg &= ~E1000_FEXTNVM3_PHY_CFG_COUNTER_MASK;
  4904			reg |= E1000_FEXTNVM3_PHY_CFG_COUNTER_50MSEC;
  4905			ew32(FEXTNVM3, reg);
  4906		}
  4907	
  4908		if (!ret_val)
  4909			clear_bit(__E1000_ACCESS_SHARED_RESOURCE, &hw->adapter->state);
  4910	
  4911		if (ctrl & E1000_CTRL_PHY_RST) {
  4912			ret_val = hw->phy.ops.get_cfg_done(hw);
  4913			if (ret_val)
  4914				return ret_val;
  4915	
  4916			ret_val = e1000_post_phy_reset_ich8lan(hw);
  4917			if (ret_val)
  4918				return ret_val;
  4919		}
  4920	
  4921		/* For PCH, this write will make sure that any noise
  4922		 * will be detected as a CRC error and be dropped rather than show up
  4923		 * as a bad packet to the DMA engine.
  4924		 */
  4925		if (hw->mac.type == e1000_pchlan)
  4926			ew32(CRC_OFFSET, 0x65656565);
  4927	
  4928		ew32(IMC, 0xffffffff);
  4929		er32(ICR);
  4930	
  4931		reg = er32(KABGTXD);
  4932		reg |= E1000_KABGTXD_BGSQLBIAS;
  4933		ew32(KABGTXD, reg);
  4934	
  4935	       /* The reset value of DPG_EN bit was changed to 1
  4936		* clear it to avoid unexpected autonomous power-gating
  4937		*/
> 4938	       if (hw->mac.type >= e1000_pch_ptp) {
  4939			reg = er32(CTRL_EXT);
  4940			reg &= ~E1000_CTRL_EXT;
  4941			ew32(CTRL_EXT, reg);
  4942		}
  4943	
  4944		return 0;
  4945	}
  4946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
