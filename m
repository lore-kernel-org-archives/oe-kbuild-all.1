Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578F1F5435
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 11:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736508894; cv=none; b=OODzzj6CMy0OHRttUjSIr7wv4ujiBdzkZQuwdOZ7qzTv7Hh+9f4J2WY7+b4+QRI+UAOrb6+yWI/VffPHyggLBwzb/DCeJmKl2+VCf+ylOYC8RcRHg1o/v79PkkZnDUhfC3ye/QRwTwFELNzJfZxTeHMbXhTLhlD5ltMGtQbBArY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736508894; c=relaxed/simple;
	bh=s4+fg7qHmBbAvYu6mIh8+ZhKtPFZEUCWYAQ/Zxh+3Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1vD4kKo47EkUvExL27RpMsOJ2cCN56a5DtRT2+KYlm+hOjKzFIFHnDbuLxXrBXt0ma1kso2PaIcvf9hbl9dwwjyxoF9WN7UG3aCMVU6cMEtPJ4rBT76OLFDagY5UmwhEGLEGb65mNfu2d81lj9lLq8Y2vnD9HC6O8gj1bbO2X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miv8WkO7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miv8WkO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736508893; x=1768044893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4+fg7qHmBbAvYu6mIh8+ZhKtPFZEUCWYAQ/Zxh+3Ok=;
  b=miv8WkO7g8+m9c/B151kZ/RnOxeNfyOF4viRQbjhyldsjVRkh38NaIpi
   7LR321kTGyOeXD3o7mkSgLmN9QZ5uJozHTGu4TFaXxalzYSADt9A7w3lw
   5BJTpFt1qmL1wxyQsruG+TmFW75+0YrIOc7cLSAe7DR/+Pdi6/rpcd9N3
   erJfvSYul0UZJvXmRzHBZU+OOixBdn3d4kUOljYHu3pyq/cEUniv9iP4F
   UrruF+xNjoxLjx4C6f7rP2wuwl4g4T+hjqa12T/YDFXLFs2HTkBb/TmVj
   aqZkh84rsPeRG+1RkXKNSzDsku7E8dsBPLvvPXPI6mvgHZzJAnbOSCpg6
   A==;
X-CSE-ConnectionGUID: oD+bHeinSa26qRVvpnVpmQ==
X-CSE-MsgGUID: jVCgs3BkTY2RR07l92GzmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47374171"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47374171"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:34:52 -0800
X-CSE-ConnectionGUID: Yfx1jn1YTy+WoC4TQWBCpg==
X-CSE-MsgGUID: +z9tESD6SrqzVudsRVNoFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134612461"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 03:34:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWDHr-000J8N-2w;
	Fri, 10 Jan 2025 11:34:47 +0000
Date: Fri, 10 Jan 2025 19:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 333/504]
 drivers/usb/dwc3/gadget_hibernation.c:16: warning: cannot understand
 function prototype: 'u32 save_reg_addr[] = '
Message-ID: <202501101920.3garS2Fm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 852fef317cff07d1feee37e7d6ae013b9da7394e [333/504] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: loongarch-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101920.3garS2Fm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101920.3garS2Fm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101920.3garS2Fm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/gadget_hibernation.c:16: warning: cannot understand function prototype: 'u32 save_reg_addr[] = '
>> drivers/usb/dwc3/gadget_hibernation.c:74: warning: Function parameter or struct member 'epnum' not described in 'restart_ep0_trans'
>> drivers/usb/dwc3/gadget_hibernation.c:400: warning: Function parameter or struct member '_dwc' not described in 'dwc3_gadget_exit_hibernation'
>> drivers/usb/dwc3/gadget_hibernation.c:400: warning: Excess function parameter 'dwc' description in 'dwc3_gadget_exit_hibernation'


vim +16 drivers/usb/dwc3/gadget_hibernation.c

    14	
    15	/* array of registers to save on hibernation and restore them on wakeup */
  > 16	static u32 save_reg_addr[] = {
    17		DWC3_DCTL,
    18		DWC3_DCFG,
    19		DWC3_DEVTEN
    20	};
    21	
    22	/**
    23	 * save_regs - Saves registers on hibernation
    24	 * @dwc: pointer to our controller context structure
    25	 *
    26	 * Returns 0 on success otherwise negative errno.
    27	 */
    28	static int save_regs(struct dwc3 *dwc)
    29	{
    30		int i;
    31	
    32		if (!dwc->saved_regs) {
    33			dwc->saved_regs = devm_kmalloc(dwc->dev,
    34						       sizeof(save_reg_addr),
    35						       GFP_KERNEL);
    36			if (!dwc->saved_regs) {
    37				dev_err(dwc->dev, "Not enough memory to save regs\n");
    38				return -ENOMEM;
    39			}
    40		}
    41	
    42		for (i = 0; i < ARRAY_SIZE(save_reg_addr); i++)
    43			dwc->saved_regs[i] = dwc3_readl(dwc->regs,
    44							save_reg_addr[i]);
    45		return 0;
    46	}
    47	
    48	/**
    49	 * restore_regs - Restores registers on wakeup
    50	 * @dwc: pointer to our controller context structure
    51	 */
    52	static void restore_regs(struct dwc3 *dwc)
    53	{
    54		int i;
    55	
    56		if (!dwc->saved_regs) {
    57			dev_warn(dwc->dev, "Regs not saved\n");
    58			return;
    59		}
    60	
    61		for (i = 0; i < ARRAY_SIZE(save_reg_addr); i++)
    62			dwc3_writel(dwc->regs, save_reg_addr[i],
    63				    dwc->saved_regs[i]);
    64	}
    65	
    66	/**
    67	 * restart_ep0_trans - Restarts EP0 transfer on wakeup
    68	 * @dwc: pointer to our controller context structure
    69	 * epnum: endpoint number
    70	 *
    71	 * Returns 0 on success otherwise negative errno.
    72	 */
    73	static int restart_ep0_trans(struct dwc3 *dwc, int epnum)
  > 74	{
    75		struct dwc3_ep *dep = dwc->eps[epnum];
    76		struct dwc3_trb *trb = dwc->ep0_trb;
    77		struct dwc3_gadget_ep_cmd_params params;
    78		int ret;
    79		u32 cmd;
    80	
    81		memset(&params, 0, sizeof(params));
    82		params.param0 = upper_32_bits(dwc->ep0_trb_addr);
    83		params.param1 = lower_32_bits(dwc->ep0_trb_addr);
    84	
    85		/* set HWO bit back to 1 and restart transfer */
    86		trb->ctrl |= DWC3_TRB_CTRL_HWO;
    87	
    88		/* Clear the TRBSTS feild */
    89		trb->size &= ~(0x0F << 28);
    90	
    91		cmd = DWC3_DEPCMD_STARTTRANSFER | DWC3_DEPCMD_PARAM(0);
    92		ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
    93		if (ret < 0) {
    94			dev_err(dwc->dev, "failed to restart transfer on %s\n",
    95				dep->name);
    96			return ret;
    97		}
    98	
    99		dwc3_gadget_ep_get_transfer_index(dep);
   100	
   101		return 0;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
