Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C6521353
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 01:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709859620; cv=none; b=a5zM6hJrpovaStlKhY5cfSlhRZNp+LJ0LLyp6fuiJL8+WcC/D+rCg2hZSPUPCk866VeZt8GqiMezIVYeKrml/G/HX7Z67zjxBDArm9+bj5T1dGS2o/x5A4ZZkcptpnf6tvX/X/2UN2dHL/28Smoh7H6AX5xEK+hffb2Z226K12M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709859620; c=relaxed/simple;
	bh=er9iUe3d1wOEFS6QXl+S8kmpYMEuP3OheavW2bfOwug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5lrUekD6rw8GePVYiMr9cnMcly+VFaTc1c1wAycc+Nxd03WW/dCn1u+i/FLttbKjd3waQ9BouG36+l6il70/xVGpmfSeaqsGphYnDyiV8owW2HG719E/+GDViJ9iL+nN9akEIzsZJ0lraugJftvSSRMV22EGiiD4Uf2F2bvfX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVQh8DB1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVQh8DB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709859618; x=1741395618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=er9iUe3d1wOEFS6QXl+S8kmpYMEuP3OheavW2bfOwug=;
  b=mVQh8DB17UTGvqXk1IEn0RzrOCKhCv6orCo2gqrGtkX/Aj+dUnYuWDj9
   S99ax16xUzT3oiKvf73OXnFvEf0ks8SKjd1firwkpooiP4ru+a9tbXUnd
   KtLFOsrvkqLK3Lvh8DUwoiFr8GVFDW/tAOA5QwWCre2nTVmsj7ONJbB2S
   PvHTSxyAKQHv569swkSjbaiGGGNoPb4J4kGOpSTSxm9w6w54BlhwSFFsv
   gQ07sMvOva6YokhNw9QVWK6ep5VkkwxHBzpK9JkCRet4rpnLCcA/9FpeD
   2s/BPgw4DXuWdYvq0XrZTit+oV/um5m5zWpv4pclEeSm4tCxxXxMTBzpt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15994094"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="15994094"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 16:58:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10417935"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2024 16:58:28 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riOZ6-0005qf-1Y;
	Fri, 08 Mar 2024 00:58:24 +0000
Date: Fri, 8 Mar 2024 08:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sriram Dash <quic_sriramd@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/3] USB: dwc3: qcom: Add support for firmware managed
 resources
Message-ID: <202403080837.mI1doJRI-lkp@intel.com>
References: <1709657858-8563-3-git-send-email-quic_sriramd@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1709657858-8563-3-git-send-email-quic_sriramd@quicinc.com>

Hi Sriram,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240305]
[cannot apply to robh/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.8-rc7 v6.8-rc6 v6.8-rc5 v6.8-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sriram-Dash/dt-bindings-usb-qcom-dwc3-Add-support-for-multiple-power-domains/20240306-010051
base:   next-20240305
patch link:    https://lore.kernel.org/r/1709657858-8563-3-git-send-email-quic_sriramd%40quicinc.com
patch subject: [RFC 2/3] USB: dwc3: qcom: Add support for firmware managed resources
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403080837.mI1doJRI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080837.mI1doJRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080837.mI1doJRI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:157: warning: Function parameter or struct member 'pd_list' not described in 'qcom_snps_hsphy'
>> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:157: warning: Function parameter or struct member 'genpd_core' not described in 'qcom_snps_hsphy'
>> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:157: warning: Function parameter or struct member 'genpd_transfer' not described in 'qcom_snps_hsphy'
>> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:157: warning: Function parameter or struct member 'fw_managed' not described in 'qcom_snps_hsphy'
>> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:157: warning: Function parameter or struct member 'snps_femto_v2_device_ops' not described in 'qcom_snps_hsphy'


vim +157 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c

   114	
   115	/**
   116	 * struct qcom_snps_hsphy - snps hs phy attributes
   117	 *
   118	 * @dev: device structure
   119	 *
   120	 * @phy: generic phy
   121	 * @base: iomapped memory space for snps hs phy
   122	 *
   123	 * @num_clks: number of clocks
   124	 * @clks: array of clocks
   125	 * @phy_reset: phy reset control
   126	 * @vregs: regulator supplies bulk data
   127	 * @phy_initialized: if PHY has been initialized correctly
   128	 * @mode: contains the current mode the PHY is in
   129	 * @update_seq_cfg: tuning parameters for phy init
   130	 */
   131	struct qcom_snps_hsphy {
   132		struct device *dev;
   133	
   134		struct phy *phy;
   135		void __iomem *base;
   136	
   137		int num_clks;
   138		struct clk_bulk_data *clks;
   139		struct reset_control *phy_reset;
   140		struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
   141	
   142		bool phy_initialized;
   143		enum phy_mode mode;
   144		struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
   145	
   146		struct dev_pm_domain_list *pd_list;
   147		struct device *genpd_core;
   148		struct device *genpd_transfer;
   149	
   150		bool fw_managed;
   151		/* separate resource management for fw_managed vs locally managed devices */
   152		struct snps_femto_v2_device_ops {
   153			int (*resume_resource)(struct qcom_snps_hsphy *hsphy);
   154			int (*suspend_resource)(struct qcom_snps_hsphy *hsphy);
   155		} snps_femto_v2_device_ops;
   156	
 > 157	};
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
