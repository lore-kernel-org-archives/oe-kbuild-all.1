Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBF2EACE9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760882346; cv=none; b=dKSaT6AaLtRo23G/2m+xjt3Tygabw04Ym6PSVQlofvH9DW7UHO7c8ebzOJjk2AVtOC/WlcPMvu5OLfl4XONh5BWh/AbZi5mnehs4FXIgU4mR0c6H9A1UNPzlAxLs0YKHwSZQ6ts7LvKPeM539kjKup88YQxCg9Iv7qnSTCrq+KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760882346; c=relaxed/simple;
	bh=l0SvDcGP/bIL1ovyuyF5dCqeqhciT/yt8nmIUm4Jgeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDonz222wuFly1Ki+fvyX37Abbn2eB4uR4ZreSjOB/BGkdubNQlxV2ABFc8Uc8unDGRiDqIc+gRnOoGBIkKP2tsThhrfozdjfUeL+fvMXQoiH3cUvyuwwAmCiorifaYRA81YcBllT3VAOy2nTzHd+xpFo1YMYnAL1nixFAOhCIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9m57nbv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9m57nbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760882344; x=1792418344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0SvDcGP/bIL1ovyuyF5dCqeqhciT/yt8nmIUm4Jgeg=;
  b=M9m57nbv+IGA2qRQhRec7AXe/4wFUy/t9eJ23vEjyecPJu4MhESMRM+C
   pllpudSxL52chUgC2Y7qmlEMpGCDYKikgd53wtKXnprIWS3HAHlnGODfb
   ICrdvU349X37ESg4Wp3Y7M6TRfRbIuQrNSbO+Eb6iRLLVZ4UHEBUwaBqn
   WkhId+UA01x9PFmtKOxkTHTVMeU7euKSAcowFPsO++O+joVy2AJ45Dn2K
   8c34ZMx5vdCxl5n1RZ/viSFk0gruxByCdgu0KpyF3k+lj/DdrQzfMjYU+
   WCAj5iVHZyWsqip4Aktsm8nrWwIDHJILOKv7cirtNN+vcEU2FBrUHIjJc
   g==;
X-CSE-ConnectionGUID: Vn3rCBv5QGetCuXvVATV5g==
X-CSE-MsgGUID: YKfSsEdWRdy1nunPx1+V/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62944612"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62944612"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 06:59:04 -0700
X-CSE-ConnectionGUID: egz/K2JuRim+Ucpxny4uig==
X-CSE-MsgGUID: /kYdd9dbQ8ONAyKXvClCeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="183619582"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 Oct 2025 06:59:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vATw4-00097F-0q;
	Sun, 19 Oct 2025 13:59:00 +0000
Date: Sun, 19 Oct 2025 21:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: [iwlwifi-next:next 15/27]
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:4222:13: error:
 implicit declaration of function 'iwl_drv_is_wifi7_supported'
Message-ID: <202510192142.k1XJfAf1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   06e43d6edf6a2718459d469e2a644527970d05c3
commit: 1f9285c0c2eb5b0ea5c8acded4406d57ae3576a4 [15/27] wifi: iwlwifi: be more chatty when we fail to find a wifi7 device
config: arc-randconfig-002-20251019 (https://download.01.org/0day-ci/archive/20251019/202510192142.k1XJfAf1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510192142.k1XJfAf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510192142.k1XJfAf1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:180:13: warning: 'iwl_drv_is_wifi7_supported' defined but not used [-Wunused-function]
     180 | static bool iwl_drv_is_wifi7_supported(struct iwl_trans *trans)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c: In function 'iwl_pci_gen1_2_probe':
>> drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:4222:13: error: implicit declaration of function 'iwl_drv_is_wifi7_supported' [-Werror=implicit-function-declaration]
    4222 |         if (iwl_drv_is_wifi7_supported(iwl_trans)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iwl_drv_is_wifi7_supported +4222 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c

  4155	
  4156	int iwl_pci_gen1_2_probe(struct pci_dev *pdev,
  4157				 const struct pci_device_id *ent,
  4158				 const struct iwl_mac_cfg *mac_cfg,
  4159				 u8 __iomem *hw_base, u32 hw_rev)
  4160	{
  4161		const struct iwl_dev_info *dev_info;
  4162		struct iwl_trans_info info = {
  4163			.hw_id = (pdev->device << 16) + pdev->subsystem_device,
  4164			.hw_rev = hw_rev,
  4165		};
  4166		struct iwl_trans *iwl_trans;
  4167		struct iwl_trans_pcie *trans_pcie;
  4168		int ret;
  4169	
  4170		iwl_trans = iwl_trans_pcie_alloc(pdev, mac_cfg, &info, hw_base);
  4171		if (IS_ERR(iwl_trans))
  4172			return PTR_ERR(iwl_trans);
  4173	
  4174		trans_pcie = IWL_TRANS_GET_PCIE_TRANS(iwl_trans);
  4175	
  4176		iwl_trans_pcie_check_product_reset_status(pdev);
  4177		iwl_trans_pcie_check_product_reset_mode(pdev);
  4178	
  4179		/* set the things we know so far for the grab NIC access */
  4180		iwl_trans_set_info(iwl_trans, &info);
  4181	
  4182		/*
  4183		 * Let's try to grab NIC access early here. Sometimes, NICs may
  4184		 * fail to initialize, and if that happens it's better if we see
  4185		 * issues early on (and can reprobe, per the logic inside), than
  4186		 * first trying to load the firmware etc. and potentially only
  4187		 * detecting any problems when the first interface is brought up.
  4188		 */
  4189		ret = iwl_pcie_prepare_card_hw(iwl_trans);
  4190		if (!ret) {
  4191			ret = iwl_trans_activate_nic(iwl_trans);
  4192			if (ret)
  4193				goto out_free_trans;
  4194			if (iwl_trans_grab_nic_access(iwl_trans)) {
  4195				get_crf_id(iwl_trans, &info);
  4196				/* all good */
  4197				iwl_trans_release_nic_access(iwl_trans);
  4198			} else {
  4199				ret = -EIO;
  4200				goto out_free_trans;
  4201			}
  4202		}
  4203	
  4204		info.hw_rf_id = iwl_read32(iwl_trans, CSR_HW_RF_ID);
  4205	
  4206		/*
  4207		 * The RF_ID is set to zero in blank OTP so read version to
  4208		 * extract the RF_ID.
  4209		 * This is relevant only for family 9000 and up.
  4210		 */
  4211		if (iwl_trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_9000 &&
  4212		    !CSR_HW_RFID_TYPE(info.hw_rf_id) && map_crf_id(iwl_trans, &info)) {
  4213			ret = -EINVAL;
  4214			goto out_free_trans;
  4215		}
  4216	
  4217		IWL_INFO(iwl_trans, "PCI dev %04x/%04x, rev=0x%x, rfid=0x%x\n",
  4218			 pdev->device, pdev->subsystem_device,
  4219			 info.hw_rev, info.hw_rf_id);
  4220	
  4221	#if !IS_ENABLED(CONFIG_IWLMLD)
> 4222		if (iwl_drv_is_wifi7_supported(iwl_trans)) {
  4223			IWL_ERR(iwl_trans,
  4224				"IWLMLD needs to be compiled to support this device\n");
  4225			ret = -EOPNOTSUPP;
  4226			goto out_free_trans;
  4227		}
  4228	#endif
  4229	
  4230		dev_info = iwl_pci_find_dev_info(pdev->device, pdev->subsystem_device,
  4231						 CSR_HW_RFID_TYPE(info.hw_rf_id),
  4232						 CSR_HW_RFID_IS_CDB(info.hw_rf_id),
  4233						 IWL_SUBDEVICE_RF_ID(pdev->subsystem_device),
  4234						 IWL_SUBDEVICE_BW_LIM(pdev->subsystem_device),
  4235						 !iwl_trans->mac_cfg->integrated);
  4236		if (dev_info) {
  4237			iwl_trans->cfg = dev_info->cfg;
  4238			info.name = dev_info->name;
  4239		}
  4240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
