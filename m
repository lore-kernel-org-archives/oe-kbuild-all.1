Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3AA3B6360
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735057; cv=none; b=nQG6dKztBwCWMBZCqfWDOT8DUAaWRqvCMIPLvSDmH5AE1zQ7soHz4MlkOuYLLiM5S1gznHb9AZiqI8sBw39lx3om5WCmcDciYI3bYHYMG1OCKLdA2vBQsGmn9BxAYFSE68V385mc8+Q6mV99hlvQsn3MtapXzJ3yorUqrIovIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735057; c=relaxed/simple;
	bh=9JKlS7JbeoD17JYp0RiV8E44TqEkEw70/pa0E1MekTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOMSQYFk9TvpGpXotdbmqS/XfQkSfq0qLdavRoN+HYEkS1cl5VefOoVQTvGihXv9+G9vn7SuQzatNKFm4u1gmeUw5XR4rfjEuMvLJZqPIxGRuGKmdIMZHGS74nQRnSq2ek2o2DHLPztemv8UkVz3q/lnAiOg0x9Hge3Q50CDvi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atXul4vL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atXul4vL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789735055; x=1821271055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9JKlS7JbeoD17JYp0RiV8E44TqEkEw70/pa0E1MekTE=;
  b=atXul4vLozw1AM1QObSMV1s2a+I9rpECXWSQUjUTMROv+r6HTVMK7YWK
   glt/G6PRrL/reMoqXSYDdfu7ZpLjeGu5i4iFc/X3FwkzWtZPpPUjyP23Q
   bjf3sK7/yziogxEj7e8AxiU3VlsKTXv94Uhc3IuVIuIOmqnNyP6sIXDkx
   nrU/OZP+d5huYNAbTk18biLQfne+ksm9KiAFXorzBdbuCFr7aLJ1H+e2k
   V9mHNKQel+2o1/304dkFO6FCZrx29fctrdjG7opBiHCNi+rxPh2JOYNce
   0KLL6FGnEKkuJxyf3yOEDktZgWarAoXWyBmQLqa92VLqzKlq+TseDRhy1
   g==;
X-CSE-ConnectionGUID: jIhMIM2MS06+j3B86M8a4Q==
X-CSE-MsgGUID: FhXlCRSfSlqslzhFerh0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="94070706"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="94070706"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 05:37:34 -0700
X-CSE-ConnectionGUID: cQ8BL3lORu2NXi05B+hDcw==
X-CSE-MsgGUID: 5br2+c1cR/+xJTrF5WNXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2573284"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 18 Sep 2026 05:37:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7XqM-000000009mj-2JTN;
	Fri, 18 Sep 2026 12:37:30 +0000
Date: Fri, 18 Sep 2026 20:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	intel-wired-lan@lists.osuosl.org, anthony.l.nguyen@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: From: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Message-ID: <202609182041.eKLUsbtF-lkp@intel.com>
References: <20260917094312.1567881-3-aleksandr.loktionov@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917094312.1567881-3-aleksandr.loktionov@intel.com>

Hi Aleksandr,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on tnguy-net-queue/dev-queue linus/master v7.3-rc3 next-20260916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksandr-Loktionov/From-Aleksandr-Loktionov-aleksandr-loktionov-intel-com/20260917-114312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20260917094312.1567881-3-aleksandr.loktionov%40intel.com
patch subject: From: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260918/202609182041.eKLUsbtF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609182041.eKLUsbtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609182041.eKLUsbtF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_fw_update.c: In function 'ice_send_component_table':
>> drivers/net/ethernet/intel/ice/ice_fw_update.c:255:51: error: 'ICE_F_EROT' undeclared (first use in this function)
     255 |                 if (!ice_is_feature_supported(pf, ICE_F_EROT)) {
         |                                                   ^~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_fw_update.c:255:51: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/intel/ice/ice_fw_update.c: In function 'ice_has_erot_incomplete':
   drivers/net/ethernet/intel/ice/ice_fw_update.c:680:49: error: 'ICE_F_EROT' undeclared (first use in this function)
     680 |         if (!ice_is_feature_supported(priv->pf, ICE_F_EROT))
         |                                                 ^~~~~~~~~~


vim +/ICE_F_EROT +255 drivers/net/ethernet/intel/ice/ice_fw_update.c

   213	
   214	/**
   215	 * ice_send_component_table - Send PLDM component table to firmware
   216	 * @context: PLDM fw update structure
   217	 * @component: the component to process
   218	 * @transfer_flag: relative transfer order of this component
   219	 *
   220	 * Read relevant data from the component and forward it to the device
   221	 * firmware. Check the response to determine if the firmware indicates that
   222	 * the update can proceed.
   223	 *
   224	 * This function sends AdminQ commands related to the NVM, and assumes that
   225	 * the NVM resource has been acquired.
   226	 *
   227	 * Returns: zero on success, or a negative error code on failure.
   228	 */
   229	static int
   230	ice_send_component_table(struct pldmfw *context, struct pldmfw_component *component,
   231				 u8 transfer_flag)
   232	{
   233		struct ice_fwu_priv *priv = container_of(context, struct ice_fwu_priv, context);
   234		struct netlink_ext_ack *extack = priv->extack;
   235		struct ice_aqc_nvm_comp_tbl *comp_tbl;
   236		u8 comp_response, comp_response_code;
   237		struct device *dev = context->dev;
   238		struct ice_pf *pf = priv->pf;
   239		struct ice_hw *hw = &pf->hw;
   240		size_t length;
   241		u8 comp_bit;
   242		int status;
   243	
   244		switch (component->identifier) {
   245		case NVM_COMP_ID_OROM:
   246			comp_bit = ICE_FWU_COMP_OROM;
   247			break;
   248		case NVM_COMP_ID_NVM:
   249			comp_bit = ICE_FWU_COMP_NVM;
   250			break;
   251		case NVM_COMP_ID_NETLIST:
   252			comp_bit = ICE_FWU_COMP_NETLIST;
   253			break;
   254		case NVM_COMP_ID_MANIFEST:
 > 255			if (!ice_is_feature_supported(pf, ICE_F_EROT)) {
   256				dev_err(dev, "Unable to update due to a firmware component with unknown ID %u\n",
   257					component->identifier);
   258				NL_SET_ERR_MSG_MOD(extack,
   259						   "Unable to update due to unknown firmware component");
   260				return -EOPNOTSUPP;
   261			}
   262			comp_bit = ICE_FWU_COMP_MANIFEST;
   263			break;
   264		default:
   265			dev_err(dev, "Unable to update due to a firmware component with unknown ID %u\n",
   266				component->identifier);
   267			NL_SET_ERR_MSG_MOD(extack, "Unable to update due to unknown firmware component");
   268			return -EOPNOTSUPP;
   269		}
   270	
   271		if (priv->seen_components & comp_bit) {
   272			dev_err(dev, "Duplicate component in PLDM image: component ID 0x%02x\n",
   273				component->identifier);
   274			NL_SET_ERR_MSG_MOD(extack, "Duplicate component in PLDM image");
   275			return -EOPNOTSUPP;
   276		}
   277		priv->seen_components |= comp_bit;
   278	
   279		length = struct_size(comp_tbl, cvs, component->version_len);
   280		comp_tbl = kzalloc(length, GFP_KERNEL);
   281		if (!comp_tbl)
   282			return -ENOMEM;
   283	
   284		comp_tbl->comp_class = cpu_to_le16(component->classification);
   285		comp_tbl->comp_id = cpu_to_le16(component->identifier);
   286		comp_tbl->comp_class_idx = FWU_COMP_CLASS_IDX_NOT_USE;
   287		comp_tbl->comp_cmp_stamp = cpu_to_le32(component->comparison_stamp);
   288		comp_tbl->cvs_type = component->version_type;
   289		comp_tbl->cvs_len = component->version_len;
   290		memcpy(comp_tbl->cvs, component->version_string, component->version_len);
   291	
   292		dev_dbg(dev, "Sending component table to firmware:\n");
   293	
   294		status = ice_nvm_pass_component_tbl(hw, (u8 *)comp_tbl, length,
   295						    transfer_flag, &comp_response,
   296						    &comp_response_code, NULL);
   297	
   298		kfree(comp_tbl);
   299	
   300		if (status) {
   301			dev_err(dev, "Failed to transfer component table to firmware, err %d aq_err %s\n",
   302				status, libie_aq_str(hw->adminq.sq_last_status));
   303			NL_SET_ERR_MSG_MOD(extack, "Failed to transfer component table to firmware");
   304			return -EIO;
   305		}
   306	
   307		return ice_check_component_response(pf, component->identifier, comp_response,
   308						    comp_response_code, extack);
   309	}
   310	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
