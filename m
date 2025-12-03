Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9831691D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785247; cv=none; b=VE+7rAGQwZlMgfga7dy0LQ4EKVsNIkblOaKHfulLfDBzv5DGerngNnGn4OXAEF37hhICpBUMQQfeq0DpSPL3DOJGV5slJJWrWBIFJ+3ksrnxHlbjubjEr0bZ1w+PJqABvFGRl4LyEBnENfn9y2NuyUMipE8cIliGnZ/OHjiMjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785247; c=relaxed/simple;
	bh=2P6OYaClAP44yNql82gAiBoFKRDukNEpuBXDqPmT2Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WTSyw9Evh0gSgESMcOWLuhE9zsa5GvsAsKoSyCT1QWPvsk74IIBt1GiB9NN3bAYe0XqfRFsawUwlhx8AiEXXAe7F6mBShBAZKmSdUjAJRzbprwyqu/rlKJPyRZSQrtdfIaBcqVPI77A/ibj94xtFuV0lgieKjL8tQ/p5yZ0CLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6fLRqYc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6fLRqYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764785244; x=1796321244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2P6OYaClAP44yNql82gAiBoFKRDukNEpuBXDqPmT2Tg=;
  b=N6fLRqYcBR1gf5IY7UC4+hqlpw10PDpGaQeZOlVrxUS8aSiG2rUQtCUc
   Oa5s8G0Berjj4f2GLkwxoBz7W9N5a6NF8oD/XGcFskSppf5FSRaXCePIc
   yt6reMfkpJ9sAY6wiC8fHc8MnxcfwZC8C9BP6DiZrV8nXHCHfMAjaoa42
   a6dKpd/+BIMAAWuw62/PhQdUjFyvSOdKUD66WZApDJK19tWHCJtnfU41F
   C9gWKs7jyA2JaRUXkoOs1B3gByH7WBVv/MUCWaOoi04rVB3bAi+wdFSBj
   zoZ+snzbfx4leLX/9K0GNI8+RK8wgKPvg4Bdm8l310ooQU3MgqmMCIPZf
   w==;
X-CSE-ConnectionGUID: imiHgpWQTMGafry4w85G5w==
X-CSE-MsgGUID: Asl6e3PgSqmABwEBhLYu+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89441623"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="89441623"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 10:07:22 -0800
X-CSE-ConnectionGUID: LJPI9hrISTKgKCh5wowIhQ==
X-CSE-MsgGUID: QiYAAxGgQvCcisAAWFnMuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="199700459"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Dec 2025 10:07:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQrG2-00000000CuB-2618;
	Wed, 03 Dec 2025 18:07:18 +0000
Date: Thu, 4 Dec 2025 02:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Koby Elbaz <koby.elbaz@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Subject: [habanaai-drivers-accel-habanalabs:habanalabs-next 15/17]
 drivers/accel/habanalabs/gaudi3/gaudi3.c:13104:18: error: variable
 'instance' set but not used
Message-ID: <202512040235.nuiZVoCD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/HabanaAI/drivers.accel.habanalabs.kernel habanalabs-next
head:   7dafc58c0da3fa475f72a64c5dbdeaddea7a9583
commit: 6df00d3b6692ad4d1abf64579ffed9e024ed77db [15/17] accel/habanalabs: integrate Gaudi3 with sysfs, debugfs, and driver subsystems
config: x86_64-randconfig-001-20251203 (https://download.01.org/0day-ci/archive/20251204/202512040235.nuiZVoCD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040235.nuiZVoCD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040235.nuiZVoCD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/habanalabs/gaudi3/gaudi3.c: In function 'gaudi3_handle_sei_event':
>> drivers/accel/habanalabs/gaudi3/gaudi3.c:13104:18: error: variable 'instance' set but not used [-Werror=unused-but-set-variable]
   13104 |         u32 die, instance, err_cnt = 0;
         |                  ^~~~~~~~
   drivers/accel/habanalabs/gaudi3/gaudi3.c: In function 'gaudi3_handle_spi_event':
   drivers/accel/habanalabs/gaudi3/gaudi3.c:13218:26: error: variable 'instance' set but not used [-Werror=unused-but-set-variable]
   13218 |         u32 die, hdcore, instance, err_cnt = 0;
         |                          ^~~~~~~~
   cc1: all warnings being treated as errors


vim +/instance +13104 drivers/accel/habanalabs/gaudi3/gaudi3.c

d44a665843a5a9 Koby Elbaz 2025-11-30  13097  
d44a665843a5a9 Koby Elbaz 2025-11-30  13098  static u32 gaudi3_handle_sei_event(struct hl_device *hdev,
d44a665843a5a9 Koby Elbaz 2025-11-30  13099  				   struct hl_eq_dynamic_entry *eq_dynamic_entry,
d44a665843a5a9 Koby Elbaz 2025-11-30  13100  				   u32 *reset_flags,
d44a665843a5a9 Koby Elbaz 2025-11-30  13101  				   u64 *event_mask)
d44a665843a5a9 Koby Elbaz 2025-11-30  13102  {
d44a665843a5a9 Koby Elbaz 2025-11-30  13103  	enum hl_agg_component_type agg_component_type;
d44a665843a5a9 Koby Elbaz 2025-11-30 @13104  	u32 die, instance, err_cnt = 0;
d44a665843a5a9 Koby Elbaz 2025-11-30  13105  	u16 data_size, eng_id;
d44a665843a5a9 Koby Elbaz 2025-11-30  13106  
d44a665843a5a9 Koby Elbaz 2025-11-30  13107  	data_size = le16_to_cpu(eq_dynamic_entry->hdr.size);
d44a665843a5a9 Koby Elbaz 2025-11-30  13108  	agg_component_type = eq_dynamic_entry->agg_hdr.int_comp_type;
d44a665843a5a9 Koby Elbaz 2025-11-30  13109  	die = eq_dynamic_entry->agg_hdr.die_id;
d44a665843a5a9 Koby Elbaz 2025-11-30  13110  	instance = eq_dynamic_entry->agg_hdr.comp_instance;
d44a665843a5a9 Koby Elbaz 2025-11-30  13111  	eng_id = eq_agg_header_to_engine_id(&eq_dynamic_entry->agg_hdr);
d44a665843a5a9 Koby Elbaz 2025-11-30  13112  
d44a665843a5a9 Koby Elbaz 2025-11-30  13113  	switch (agg_component_type) {
d44a665843a5a9 Koby Elbaz 2025-11-30  13114  	case INT_COMP_TYPE_ARC_FARM:
d44a665843a5a9 Koby Elbaz 2025-11-30  13115  		err_cnt = gaudi3_handle_arc_farm_sei_err(hdev, data_size, eq_dynamic_entry);
d44a665843a5a9 Koby Elbaz 2025-11-30  13116  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13117  	case INT_COMP_TYPE_CPU:
d44a665843a5a9 Koby Elbaz 2025-11-30  13118  		err_cnt = gaudi3_handle_cpu_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13119  							&eq_dynamic_entry->cpu_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13120  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13121  	case INT_COMP_TYPE_CS:
d44a665843a5a9 Koby Elbaz 2025-11-30  13122  		err_cnt = gaudi3_handle_cs_sei_err(hdev, data_size, &eq_dynamic_entry->cs_sei_data,
d44a665843a5a9 Koby Elbaz 2025-11-30  13123  							reset_flags, event_mask);
d44a665843a5a9 Koby Elbaz 2025-11-30  13124  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13125  	case INT_COMP_TYPE_D2D_MAC:
d44a665843a5a9 Koby Elbaz 2025-11-30  13126  		err_cnt = gaudi3_handle_d2d_mac_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13127  							&eq_dynamic_entry->d2dmac_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13128  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13129  	case INT_COMP_TYPE_D2D_PHY:
d44a665843a5a9 Koby Elbaz 2025-11-30  13130  		err_cnt = gaudi3_handle_d2d_phy_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13131  							&eq_dynamic_entry->d2dphy_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13132  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13133  	case INT_COMP_TYPE_DEC:
d44a665843a5a9 Koby Elbaz 2025-11-30  13134  		err_cnt = gaudi3_handle_decoder_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13135  							&eq_dynamic_entry->razwi_with_intr_cause);
d44a665843a5a9 Koby Elbaz 2025-11-30  13136  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13137  	case INT_COMP_TYPE_EDMA:
d44a665843a5a9 Koby Elbaz 2025-11-30  13138  		err_cnt = gaudi3_handle_edma_sei_err(hdev, data_size, eq_dynamic_entry, eng_id,
d44a665843a5a9 Koby Elbaz 2025-11-30  13139  						     event_mask);
d44a665843a5a9 Koby Elbaz 2025-11-30  13140  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13141  	case INT_COMP_TYPE_EDUP:
d44a665843a5a9 Koby Elbaz 2025-11-30  13142  		err_cnt = gaudi3_handle_edup_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13143  							&eq_dynamic_entry->razwi_with_intr_cause);
d44a665843a5a9 Koby Elbaz 2025-11-30  13144  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13145  	case INT_COMP_TYPE_MC:
d44a665843a5a9 Koby Elbaz 2025-11-30  13146  		err_cnt = gaudi3_handle_hbm_mc_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13147  							&eq_dynamic_entry->hbm_mc_cmn_sei_info,
d44a665843a5a9 Koby Elbaz 2025-11-30  13148  							reset_flags, event_mask);
d44a665843a5a9 Koby Elbaz 2025-11-30  13149  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13150  	case INT_COMP_TYPE_MME:
d44a665843a5a9 Koby Elbaz 2025-11-30  13151  		err_cnt = gaudi3_handle_mme_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13152  							&eq_dynamic_entry->mme_sei_data, eng_id,
d44a665843a5a9 Koby Elbaz 2025-11-30  13153  							event_mask);
d44a665843a5a9 Koby Elbaz 2025-11-30  13154  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13155  	case INT_COMP_TYPE_NCH:
d44a665843a5a9 Koby Elbaz 2025-11-30  13156  		err_cnt = gaudi3_handle_nch_sei_err(hdev, data_size, die,
d44a665843a5a9 Koby Elbaz 2025-11-30  13157  							&eq_dynamic_entry->nch_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13158  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13159  	case INT_COMP_TYPE_PARC:
d44a665843a5a9 Koby Elbaz 2025-11-30  13160  		err_cnt = gaudi3_handle_parc_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13161  							&eq_dynamic_entry->parc_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13162  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13163  	case INT_COMP_TYPE_PCIE:
d44a665843a5a9 Koby Elbaz 2025-11-30  13164  		err_cnt = gaudi3_handle_pcie0_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13165  							&eq_dynamic_entry->pcie_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13166  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13167  	case INT_COMP_TYPE_PDMA:
d44a665843a5a9 Koby Elbaz 2025-11-30  13168  		err_cnt = gaudi3_handle_pdma_sei_err(hdev, data_size, eq_dynamic_entry);
d44a665843a5a9 Koby Elbaz 2025-11-30  13169  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13170  	case INT_COMP_TYPE_PLL:
d44a665843a5a9 Koby Elbaz 2025-11-30  13171  		err_cnt = gaudi3_handle_pll_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13172  							&eq_dynamic_entry->pll_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13173  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13174  	case INT_COMP_TYPE_PSOC:
d44a665843a5a9 Koby Elbaz 2025-11-30  13175  		err_cnt = gaudi3_handle_psoc_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13176  							&eq_dynamic_entry->psoc_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13177  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13178  	case INT_COMP_TYPE_ROT:
d44a665843a5a9 Koby Elbaz 2025-11-30  13179  		err_cnt = gaudi3_handle_rotator_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13180  							&eq_dynamic_entry->rot_sei_data, eng_id,
d44a665843a5a9 Koby Elbaz 2025-11-30  13181  							event_mask);
d44a665843a5a9 Koby Elbaz 2025-11-30  13182  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13183  	case INT_COMP_TYPE_SOB:
d44a665843a5a9 Koby Elbaz 2025-11-30  13184  		err_cnt = gaudi3_handle_sob_sei_err(hdev, data_size,
d44a665843a5a9 Koby Elbaz 2025-11-30  13185  							&eq_dynamic_entry->sob_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13186  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13187  	case INT_COMP_TYPE_STLB:
d44a665843a5a9 Koby Elbaz 2025-11-30  13188  		err_cnt = handle_hmmu_sei_events(hdev, data_size, &eq_dynamic_entry->stlb_sei_data);
d44a665843a5a9 Koby Elbaz 2025-11-30  13189  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13190  	case INT_COMP_TYPE_TPC:
d44a665843a5a9 Koby Elbaz 2025-11-30  13191  		err_cnt = handle_tpc_sei_events(hdev, data_size, &eq_dynamic_entry->tpc_sei_data,
d44a665843a5a9 Koby Elbaz 2025-11-30  13192  						eng_id, event_mask);
d44a665843a5a9 Koby Elbaz 2025-11-30  13193  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13194  	default:
d44a665843a5a9 Koby Elbaz 2025-11-30  13195  		dev_err(hdev->dev, "SEI event handling for component type %u is missing\n",
d44a665843a5a9 Koby Elbaz 2025-11-30  13196  			agg_component_type);
d44a665843a5a9 Koby Elbaz 2025-11-30  13197  		break;
d44a665843a5a9 Koby Elbaz 2025-11-30  13198  	}
d44a665843a5a9 Koby Elbaz 2025-11-30  13199  
d44a665843a5a9 Koby Elbaz 2025-11-30  13200  	if (!err_cnt)
d44a665843a5a9 Koby Elbaz 2025-11-30  13201  		goto out;
d44a665843a5a9 Koby Elbaz 2025-11-30  13202  
d44a665843a5a9 Koby Elbaz 2025-11-30  13203  	gaudi3_sei_razwi_handler(hdev, eq_dynamic_entry, event_mask);
d44a665843a5a9 Koby Elbaz 2025-11-30  13204  	gaudi3_check_for_glbl_errors(hdev, eq_dynamic_entry);
d44a665843a5a9 Koby Elbaz 2025-11-30  13205  	hl_debugfs_cfg_access_history_dump(hdev);
d44a665843a5a9 Koby Elbaz 2025-11-30  13206  
d44a665843a5a9 Koby Elbaz 2025-11-30  13207  out:
d44a665843a5a9 Koby Elbaz 2025-11-30  13208  	return err_cnt;
d44a665843a5a9 Koby Elbaz 2025-11-30  13209  }
d44a665843a5a9 Koby Elbaz 2025-11-30  13210  

:::::: The code at line 13104 was first introduced by commit
:::::: d44a665843a5a9a4d59c724fab9bc92c88b810ba accel/habanalabs: add Gaudi3 ASIC core implementation

:::::: TO: Koby Elbaz <koby.elbaz@intel.com>
:::::: CC: Konstantin Sinyuk <konstantin.sinyuk@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
