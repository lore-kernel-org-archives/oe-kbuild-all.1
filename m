Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5B53CC9E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776926830; cv=none; b=pHmT18Cr69D2YEVjuU2I5y/lzHUGo+9LdEipRVCRmQqPYOIe3Zg0g4ZbCfg19N16BCaaixKHpMiU7T0Oq3emMf4CGpeJDAaoU+vBj0moCYKsrC8zKZYD/7Urzi8EtUIuGZYF/KU+zG3FKZKscVY3XdbTazBtQmoznwupv494F5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776926830; c=relaxed/simple;
	bh=3tif0WF0wNJAVdjSXlOF9knYXymOsb+PnguSSCnZf8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I/7NEeorcweF4vlKBW6maShfEzKJfQZ06bqt8ckNb88fxDrnkJkQGi/zVjWtaMmjo8t/xltf/HdnTefcOUkIKIO3tfxqNyK4e7CZf+mRjc9grIU68e84QxgNwRtHSSk25WxyA3Qa743UoHXpBoxmPm1yjWegoGLM5cFi2M9KL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXCqYg8u; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXCqYg8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776926829; x=1808462829;
  h=date:from:to:cc:subject:message-id;
  bh=3tif0WF0wNJAVdjSXlOF9knYXymOsb+PnguSSCnZf8I=;
  b=kXCqYg8udWkKmbSs6X+9NArm+3f+MqQpvxxaf3lbDOCGIP6ni0LDHcuB
   px1tsgV93O1gokmm+TBkCCkEtVmgRKArHtdjAEMXhY96tbo9HR8V5Jsvp
   p2Dp8D6HuDYhCAf1/lyQ8V8zkaGUghvaKl7D1rXzBHMEUfkAi7fQqCu/5
   PQRDx+N/dNLbr6SH4awDvJKXu6tv+Zar+3IkYbHyiRBb2LNITXvUlgkVJ
   lGaDjuU0GrMwbLqguVBwV48XyR7lN0t9dReZ6i3j9b+O8Sql1CdXxj9b4
   /adr2t/tItYxrCpAYRKriwaJVNXedpAwgxIrE0bOwdZ10XmHnG72Z2RkO
   w==;
X-CSE-ConnectionGUID: 3zGzL6AhRpCmYDrcQhFs7A==
X-CSE-MsgGUID: Bw4Ibr6rTHORS7GKMlwyVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88195772"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="88195772"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 23:47:09 -0700
X-CSE-ConnectionGUID: T/QBl2TIRxCwjfH06D+JBg==
X-CSE-MsgGUID: n2dDyFzqQ7Gci077nLYOoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="229391768"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2026 23:47:07 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFnq3-000000001sL-3VlG;
	Thu, 23 Apr 2026 06:47:03 +0000
Date: Thu, 23 Apr 2026 14:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: KancyJoe <kancy2333@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/pmos-v3 7/26]
 sound/soc/qcom/qdsp6/audioreach.c:755:43: error: assignment of member
 'hw_interface_type' in read-only object
Message-ID: <202604231447.VCvBxCpn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/pmos-v3
head:   8bac0544d1a4e155182b87aca13870ba2a0a3c49
commit: 29cdaf388e5fb3df4c09814c374e4aec27bddfed [7/26] audioreach: Add dedicated WSA2 support.
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260423/202604231447.VCvBxCpn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604231447.VCvBxCpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604231447.VCvBxCpn-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/qcom/qdsp6/audioreach.c: In function 'audioreach_codec_dma_set_media_format':
>> sound/soc/qcom/qdsp6/audioreach.c:755:43: error: assignment of member 'hw_interface_type' in read-only object
     755 |                 module->hw_interface_type = 2;  // need to set lpaif type back to WSA after set active channel mask
         |                                           ^


vim +/hw_interface_type +755 sound/soc/qcom/qdsp6/audioreach.c

   689	
   690	/* LPASS Codec DMA port Module Media Format Setup */
   691	static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
   692							 const struct audioreach_module *module,
   693							 const struct audioreach_module_config *cfg)
   694	{
   695		struct apm_codec_dma_module_intf_cfg *intf_cfg;
   696		struct apm_module_frame_size_factor_cfg *fs_cfg;
   697		struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
   698		struct apm_module_param_data *param_data;
   699		struct apm_module_hw_ep_mf_cfg *hw_cfg;
   700		int ic_sz = APM_CDMA_INTF_CFG_PSIZE;
   701		int ep_sz = APM_HW_EP_CFG_PSIZE;
   702		int fs_sz = APM_FS_CFG_PSIZE;
   703		int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
   704		int size = ic_sz + ep_sz + fs_sz + pm_sz;
   705		void *p;
   706	
   707		struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
   708		static u8 last_active_channel_mask = 0;
   709	
   710		if (IS_ERR(pkt))
   711			return PTR_ERR(pkt);
   712	
   713		p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
   714	
   715		hw_cfg = p;
   716		param_data = &hw_cfg->param_data;
   717		param_data->module_instance_id = module->instance_id;
   718		param_data->error_code = 0;
   719		param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
   720		param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
   721	
   722		hw_cfg->mf.sample_rate = cfg->sample_rate;
   723		hw_cfg->mf.bit_width = cfg->bit_width;
   724		hw_cfg->mf.num_channels = cfg->num_channels;
   725		hw_cfg->mf.data_format = module->data_format;
   726		p += ep_sz;
   727	
   728		fs_cfg = p;
   729		param_data = &fs_cfg->param_data;
   730		param_data->module_instance_id = module->instance_id;
   731		param_data->error_code = 0;
   732		param_data->param_id = PARAM_ID_HW_EP_FRAME_SIZE_FACTOR;
   733		param_data->param_size = fs_sz - APM_MODULE_PARAM_DATA_SIZE;
   734		fs_cfg->frame_size_factor = 1;
   735		p += fs_sz;
   736	
   737		intf_cfg = p;
   738		param_data = &intf_cfg->param_data;
   739		param_data->module_instance_id = module->instance_id;
   740		param_data->error_code = 0;
   741		param_data->param_id = PARAM_ID_CODEC_DMA_INTF_CFG;
   742		param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
   743	
   744		intf_cfg->cfg.lpaif_type = module->hw_interface_type;
   745		intf_cfg->cfg.intf_index = module->hw_interface_idx;
   746		// dev_err(graph->dev, "IDX: 0x%08X, TYPE: 0x%08X", module->hw_interface_idx, module->hw_interface_type);
   747	
   748		if((intf_cfg->cfg.lpaif_type == 7 && cfg->num_channels <= 2 && intf_cfg->cfg.intf_index == 1)
   749			|| ((intf_cfg->cfg.intf_index == 1) && (intf_cfg->cfg.lpaif_type == 2) && (cfg->num_channels <= 2) && (last_active_channel_mask>>2 & 0b11) != 0)) // Dedicated WSA2 RX0
   750		{
   751			intf_cfg->cfg.active_channels_mask = ((1 << cfg->num_channels) - 1) << 2; 
   752			last_active_channel_mask = intf_cfg->cfg.active_channels_mask;
   753			// dev_err(graph->dev, "Setting mask to 0b1100");
   754			intf_cfg->cfg.lpaif_type = 2;	// adsp do not support WSA2 DMA
 > 755			module->hw_interface_type = 2;	// need to set lpaif type back to WSA after set active channel mask
   756		} else
   757			intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
   758	
   759		p += ic_sz;
   760	
   761		pm_cfg = p;
   762		param_data = &pm_cfg->param_data;
   763		param_data->module_instance_id = module->instance_id;
   764		param_data->error_code = 0;
   765		param_data->param_id = PARAM_ID_HW_EP_POWER_MODE_CFG;
   766		param_data->param_size = pm_sz - APM_MODULE_PARAM_DATA_SIZE;
   767		pm_cfg->power_mode.power_mode = 0;
   768	
   769		return q6apm_send_cmd_sync(graph->apm, pkt, 0);
   770	}
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
