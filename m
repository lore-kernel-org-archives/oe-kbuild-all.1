Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5861B969
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710627909; cv=none; b=FBhUIrmmiCOxJvvsxZ+GZiELaLXXNoIF6sEv6QIjbIsSK8eqCKYnv7ia4y4y3bZCro89s/K5O6rNIWAzCZzEJg0OklrxKbHpk9OMLPDtKI6FQbGqqc01kY+0TwZqgfOw6HV/7eTRXCw55bqN/RqRPOpAn3Yc+TUZ1Q96qLl91aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710627909; c=relaxed/simple;
	bh=5oh7Wbue/By7lbdOL0xaPdir6EGtNI1q1Npf1I9il7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OpOHenW7/i3QkI6bVpbdOOiVoYn1qSJ0M5vYSYb+8EnNFXKBB/QuDRAvjMObuhS65b43fyWhkMfe11NZw8dedglfybnQBS7iyStsDDJw0Yw0l/euEp9aa4ucjMNR2KIMG7SnzRyfMw4v10luBLOChWYfO6ugyyyux2iNdBVMyok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEZA6yu8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEZA6yu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710627907; x=1742163907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5oh7Wbue/By7lbdOL0xaPdir6EGtNI1q1Npf1I9il7M=;
  b=BEZA6yu8kG0MJI3slsYwMPY39P1E0bsS8PncChnUq5AyZchINVXvmrxX
   yD9og4B0oRGl6LXEraItrTJ1fFLMVN3O2gvDUfgLg5hN+hqWRHPaqduMd
   JoazLs02Vh5c6jxCBOz2knT6fzT7fvBRt831YF3DuOvVGiE1kVEo946DE
   PxPVIrwcF5gp1UtrXSQbh0CcZ/Z5EkFOW4yWd4ucrPpHP9RY8T3kw6t8E
   87iW97DItUDwkZdaFWT43u8A9C6iCw5xTgBmVcEYWap7SQLSGxWx8epgo
   oyUT4i0sZUaiiAIjUq56ETmXYNbD8Dx4wZ5eXP52E/uWcIMO5UM8b4m4U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="16929245"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="16929245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 15:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="17735690"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Mar 2024 15:25:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlcSa-000FpN-2j;
	Sat, 16 Mar 2024 22:25:00 +0000
Date: Sun, 17 Mar 2024 06:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/net/ethernet/intel/ice/ice_common.c:3965:22: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202403170604.SHUg8ed5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: 46afaee1d54b15e084dfe90ffec3eea5ba7d65c8 ice: update E810 100g nic driver
date:   9 months ago
config: x86_64-randconfig-122-20240316 (https://download.01.org/0day-ci/archive/20240317/202403170604.SHUg8ed5-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170604.SHUg8ed5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170604.SHUg8ed5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_common.c:3965:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] datalen @@     got unsigned char [usertype] data_size @@
   drivers/net/ethernet/intel/ice/ice_common.c:3965:22: sparse:     expected restricted __le16 [addressable] [usertype] datalen
   drivers/net/ethernet/intel/ice/ice_common.c:3965:22: sparse:     got unsigned char [usertype] data_size
>> drivers/net/ethernet/intel/ice/ice_common.c:5900:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] gpio_ctrl_handle @@     got unsigned short [usertype] gpio_ctrl_handle @@
   drivers/net/ethernet/intel/ice/ice_common.c:5900:31: sparse:     expected restricted __le16 [usertype] gpio_ctrl_handle
   drivers/net/ethernet/intel/ice/ice_common.c:5900:31: sparse:     got unsigned short [usertype] gpio_ctrl_handle
   drivers/net/ethernet/intel/ice/ice_common.c:5928:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] gpio_ctrl_handle @@     got unsigned short [usertype] gpio_ctrl_handle @@
   drivers/net/ethernet/intel/ice/ice_common.c:5928:31: sparse:     expected restricted __le16 [usertype] gpio_ctrl_handle
   drivers/net/ethernet/intel/ice/ice_common.c:5928:31: sparse:     got unsigned short [usertype] gpio_ctrl_handle
>> drivers/net/ethernet/intel/ice/ice_common.c:6305:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] handle @@     got unsigned short [usertype] handle @@
   drivers/net/ethernet/intel/ice/ice_common.c:6305:26: sparse:     expected restricted __le16 [usertype] handle
   drivers/net/ethernet/intel/ice/ice_common.c:6305:26: sparse:     got unsigned short [usertype] handle
>> drivers/net/ethernet/intel/ice/ice_common.c:6376:50: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] handle @@     got restricted __le16 [assigned] [usertype] handle @@
   drivers/net/ethernet/intel/ice/ice_common.c:6376:50: sparse:     expected unsigned short [usertype] handle
   drivers/net/ethernet/intel/ice/ice_common.c:6376:50: sparse:     got restricted __le16 [assigned] [usertype] handle
--
>> drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:6902:27: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:6913:27: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:6918:27: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:7074:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] n_proto @@     got int @@
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:7074:38: sparse:     expected restricted __be16 [usertype] n_proto
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:7074:38: sparse:     got int
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:7093:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] n_proto @@     got int @@
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:7093:38: sparse:     expected restricted __be16 [usertype] n_proto
   drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c:7093:38: sparse:     got int

vim +3965 drivers/net/ethernet/intel/ice/ice_common.c

  3935	
  3936	/**
  3937	 * ice_aq_read_topo_dev_nvm
  3938	 * @hw: pointer to the hardware structure
  3939	 * @topo_params: pointer to structure storing topology parameters for a device
  3940	 * @start_address: byte offset in the topology device NVM
  3941	 * @data: pointer to data buffer
  3942	 * @data_size: number of bytes to be read from the topology device NVM
  3943	 * @cd: pointer to command details structure or NULL
  3944	 * Read Topology Device NVM (0x06F3)
  3945	 *
  3946	 */
  3947	enum ice_status
  3948	ice_aq_read_topo_dev_nvm(struct ice_hw *hw,
  3949				 struct ice_aqc_link_topo_params *topo_params,
  3950				 u32 start_address, u8 *data, u8 data_size,
  3951				 struct ice_sq_cd *cd)
  3952	{
  3953		struct ice_aqc_read_topo_dev_nvm *cmd;
  3954		struct ice_aq_desc desc;
  3955		enum ice_status status;
  3956	
  3957		if (!data || data_size == 0 ||
  3958		    data_size > ICE_AQC_READ_TOPO_DEV_NVM_DATA_READ_SIZE)
  3959			return ICE_ERR_PARAM;
  3960	
  3961		cmd = &desc.params.read_topo_dev_nvm;
  3962	
  3963		ice_fill_dflt_direct_cmd_desc(&desc, ice_aqc_opc_read_topo_dev_nvm);
  3964	
> 3965		desc.datalen = data_size;
  3966		memcpy(&cmd->topo_params, topo_params, sizeof(*topo_params));
  3967		cmd->start_address = cpu_to_le32(start_address);
  3968	
  3969		status = ice_aq_send_cmd(hw, &desc, NULL, 0, cd);
  3970		if (status)
  3971			return status;
  3972	
  3973		memcpy(data, cmd->data_read, data_size);
  3974	
  3975		return 0;
  3976	}
  3977	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
