Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3E2AE97
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757274402; cv=none; b=l4qAOuSJmZmYBq6v6eN452kq3f8mjR3t+4QiCufqoeAvDCC5xoiuAfd9AMkzEC6CIA1KepV+e6b+SeDMsD+GVFDylVcU6akgM6JcTQxY5jejnUvAfQyVpXsI7P9gp/2D4zN9jT8v5sFStxcTp5xnujWRtC9/LvdShlMtLo7vh9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757274402; c=relaxed/simple;
	bh=Jl3CZZI7wyFKt/NMiLdVfFxYZ3NKgIk1liDhaSjfCGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W9NeY1te4yD0yelpvyXCRGJhCTWM6iLiHrYh8GZIIUvkN66aYICyISYjJGK0QbhMmthraKx8LW3Rx+cFdbzqMX7hmMgSFRVFbhpkMmxsAqBTRgj0Kllj7g/BTAuFkhPItSY/6WpiXCRqdCqf9yJpABFePH/5vr2olOaFM6O9Skg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTUya8rx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTUya8rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757274400; x=1788810400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jl3CZZI7wyFKt/NMiLdVfFxYZ3NKgIk1liDhaSjfCGw=;
  b=TTUya8rxzUlVlgJD8WltM0AmAKylSaOGZ1xMZsl4MeEBwc9l/0cFiHxj
   zyP30n4tFxc53od5Cz86nw7K0caJppCjAENJXwn7D8v+f+4MqNHFZl+KG
   06LKsBAax+GAamafscSaOtMzOQRcml2FTSDyv3A2shcnGkvFyWEXXKidU
   So8yrazf7ST2NCMqYTmMb70vN4wKqQA7x5CKncn3DNysT6WXs+rpRbIJG
   GC2I1X7n44mV1TbXKBtZBAzuAAc12vv/MD/rj5kczOv2OdLoPDjkPnZXC
   pM09vxLEpnZAM/89a0jEsZc3/7JiQVhWCOGuVb/7pNxilMsZDCi8u2Yfj
   A==;
X-CSE-ConnectionGUID: aQg4Jnd9R2O1oiUJrogHRQ==
X-CSE-MsgGUID: gwV69gfpTEGRou9vn/XYnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59395712"
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="59395712"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 12:46:39 -0700
X-CSE-ConnectionGUID: VocHR2ASQsyV2RLYUcV1Ow==
X-CSE-MsgGUID: Qao6PxXeSXavaIUFNYlZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="209777736"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Sep 2025 12:46:38 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvLLP-0002Tj-1p;
	Sun, 07 Sep 2025 19:46:35 +0000
Date: Mon, 8 Sep 2025 03:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Golan Ben Ami <golan.ben.ami@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-chromeos:android16-6.12-desktop__release/core98-95 1/1]
 drivers/net/wireless/iwl7000/iwlwifi/pcie/gen1_2/trans.c:4193:27: error: no
 member named 'requires_dma_protection' in 'struct pci_dev'
Message-ID: <202509080338.RnqBSkoQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git android16-6.12-desktop__release/core98-95
head:   9b124aabc795120a803333660f1ab01a2a3aacef
commit: 9b124aabc795120a803333660f1ab01a2a3aacef [1/1] ANDROID: release core 95
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250908/202509080338.RnqBSkoQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509080338.RnqBSkoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509080338.RnqBSkoQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/iwl7000/iwlwifi/pcie/gen1_2/trans.c:4193:27: error: no member named 'requires_dma_protection' in 'struct pci_dev'
    4193 |                 .dma_protection = pdev->requires_dma_protection,
         |                                   ~~~~  ^
   1 error generated.


vim +4193 drivers/net/wireless/iwl7000/iwlwifi/pcie/gen1_2/trans.c

  4185	
  4186	int iwl_pci_gen1_2_probe(struct pci_dev *pdev,
  4187				 const struct pci_device_id *ent,
  4188				 const struct iwl_mac_cfg *trans)
  4189	{
  4190		const struct iwl_dev_info *dev_info;
  4191		struct iwl_trans_info info = {
  4192			.hw_id = (pdev->device << 16) + pdev->subsystem_device,
> 4193			.dma_protection = pdev->requires_dma_protection,
  4194		};
  4195		struct iwl_trans *iwl_trans;
  4196		struct iwl_trans_pcie *trans_pcie;
  4197		unsigned int txcmd_size, txcmd_align;
  4198		int ret;
  4199	
  4200		iwl_trans = iwl_trans_pcie_alloc(pdev, trans, &info);
  4201		if (IS_ERR(iwl_trans))
  4202			return PTR_ERR(iwl_trans);
  4203	
  4204		trans_pcie = IWL_TRANS_GET_PCIE_TRANS(iwl_trans);
  4205	
  4206		iwl_trans_pcie_check_product_reset_status(pdev);
  4207		iwl_trans_pcie_check_product_reset_mode(pdev);
  4208	
  4209		/* set the things we know so far for the grab NIC access */
  4210		iwl_trans_set_info(iwl_trans, &info);
  4211	
  4212		/*
  4213		 * Let's try to grab NIC access early here. Sometimes, NICs may
  4214		 * fail to initialize, and if that happens it's better if we see
  4215		 * issues early on (and can reprobe, per the logic inside), than
  4216		 * first trying to load the firmware etc. and potentially only
  4217		 * detecting any problems when the first interface is brought up.
  4218		 */
  4219		ret = iwl_pcie_prepare_card_hw(iwl_trans);
  4220		if (!ret) {
  4221			ret = iwl_finish_nic_init(iwl_trans);
  4222			if (ret)
  4223				goto out_free_trans;
  4224			if (iwl_trans_grab_nic_access(iwl_trans)) {
  4225				get_crf_id(iwl_trans, &info);
  4226				/* all good */
  4227				iwl_trans_release_nic_access(iwl_trans);
  4228			} else {
  4229				ret = -EIO;
  4230				goto out_free_trans;
  4231			}
  4232		}
  4233	
  4234		info.hw_rf_id = iwl_read32(iwl_trans, CSR_HW_RF_ID);
  4235	
  4236		/*
  4237		 * The RF_ID is set to zero in blank OTP so read version to
  4238		 * extract the RF_ID.
  4239		 * This is relevant only for family 9000 and up.
  4240		 */
  4241		if (iwl_trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_9000 &&
  4242		    !CSR_HW_RFID_TYPE(info.hw_rf_id) && map_crf_id(iwl_trans, &info)) {
  4243			ret = -EINVAL;
  4244			goto out_free_trans;
  4245		}
  4246	
  4247		IWL_INFO(iwl_trans, "PCI dev %04x/%04x, rev=0x%x, rfid=0x%x\n",
  4248			 pdev->device, pdev->subsystem_device,
  4249			 info.hw_rev, info.hw_rf_id);
  4250	
  4251		dev_info = iwl_pci_find_dev_info(pdev->device, pdev->subsystem_device,
  4252						 CSR_HW_RFID_TYPE(info.hw_rf_id),
  4253						 CSR_HW_RFID_IS_CDB(info.hw_rf_id),
  4254						 IWL_SUBDEVICE_RF_ID(pdev->subsystem_device),
  4255						 IWL_SUBDEVICE_BW_LIM(pdev->subsystem_device),
  4256						 !iwl_trans->mac_cfg->integrated);
  4257		if (dev_info) {
  4258			iwl_trans->cfg = dev_info->cfg;
  4259			info.name = dev_info->name;
  4260		}
  4261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
