Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88983184
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 00:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717718667; cv=none; b=OLwGEecnKFOlryC/WGPQx7+h+NuKGOBZSW9dSNe7Tb0W9VROchw14spO4PXZhX3PhjhkkVMwx4y10GSVQxF7Rohluh/pWKlCmvmR8pZsuG0dCD71XMlt8E6kAmTEmPyGHeYxlJDQIPUxGbr6zpz5eEQgVX28Jwd6aRnAk0qgKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717718667; c=relaxed/simple;
	bh=NdYW5RDPM74NpAZ3xcP774UxCnJinmAzZgFImgqRDds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=be7N3ccOHaeoys0tmgYX6egTJxRsYvdvz+P6sd88+oGQk92XzYPMqfFV3gWXyTXuD9MwQBiQwW6Jpi00IXACqulVqwWPhPrveO5R047WD/esLo3FMT6v1CtYHRVvqioUzrUNuANcQllnjGjbXvKoY4KwkHDCQwG0+aavbO95hmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzQhfjQz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzQhfjQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717718666; x=1749254666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdYW5RDPM74NpAZ3xcP774UxCnJinmAzZgFImgqRDds=;
  b=FzQhfjQzn44ZFwqmNgyoJLbGtE45T6FMCWmLbB3AF7vybJTXswEdbpW1
   29fXGOC8zNDk4BLcpIUE27E1l83u8iCdxspyvEzrLdwUTJ+adtuBX67LI
   gpiosm+K3BIfWoP009MH0uktTPhZP6x/ZELg9yE96mr5I9Iszu3URn3h5
   FPVyog6eGXitqM8mS9mUUwWqsbuvEhQen5dXnsPAU2akp2O4ejrSQhRPO
   sb+ZVw57hEF6J53rhBg56A/2uWR4piUO6bDxOsed8uFGcyH4g1cI5o294
   Hemc692YgXEvvDS3Llc2AWw6o8/c4/Rxj7M3CtPuHZDKygKaGBz3r9XjM
   Q==;
X-CSE-ConnectionGUID: oLOH9bDETmuat7iwMqbhdA==
X-CSE-MsgGUID: Xz8ihK9jTMea+uttMXJSAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25828484"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25828484"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 17:04:25 -0700
X-CSE-ConnectionGUID: j/61vJFITi+J+eTNTGiY8g==
X-CSE-MsgGUID: xOXix06WTxWIbb3ToCLnyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38816263"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2024 17:04:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFN5h-0003tS-1F;
	Fri, 07 Jun 2024 00:04:21 +0000
Date: Fri, 7 Jun 2024 08:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Simei Su <simei.su@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: [tnguy-next-queue:dev-queue 70/81]
 drivers/net/ethernet/intel/ice/ice_virtchnl.c:3851:26: error: implicit
 declaration of function 'ice_ptp_read_src_clk_reg'
Message-ID: <202406070705.6IjwhIMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   ace679d6a9e3623d89804105baaca54d4e5e9c49
commit: c3bafac0365a81a223dff3ca0a68665926ef077d [70/81] ice: support Rx timestamp on flex descriptor
config: arm-randconfig-004-20240607 (https://download.01.org/0day-ci/archive/20240607/202406070705.6IjwhIMk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070705.6IjwhIMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070705.6IjwhIMk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_virtchnl.c: In function 'ice_vc_get_phc_time':
>> drivers/net/ethernet/intel/ice/ice_virtchnl.c:3851:26: error: implicit declaration of function 'ice_ptp_read_src_clk_reg' [-Werror=implicit-function-declaration]
    3851 |         phc_time->time = ice_ptp_read_src_clk_reg(pf, NULL);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ice_ptp_read_src_clk_reg +3851 drivers/net/ethernet/intel/ice/ice_virtchnl.c

  3829	
  3830	static int ice_vc_get_phc_time(struct ice_vf *vf)
  3831	{
  3832		enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_SUCCESS;
  3833		struct virtchnl_phc_time *phc_time = NULL;
  3834		struct ice_pf *pf = vf->pf;
  3835		int len = 0;
  3836		int ret;
  3837	
  3838		if (!test_bit(ICE_VF_STATE_ACTIVE, vf->vf_states)) {
  3839			v_ret = VIRTCHNL_STATUS_ERR_PARAM;
  3840			goto err;
  3841		}
  3842	
  3843		len = sizeof(struct virtchnl_phc_time);
  3844		phc_time = kzalloc(len, GFP_KERNEL);
  3845		if (!phc_time) {
  3846			v_ret = VIRTCHNL_STATUS_ERR_NO_MEMORY;
  3847			len = 0;
  3848			goto err;
  3849		}
  3850	
> 3851		phc_time->time = ice_ptp_read_src_clk_reg(pf, NULL);
  3852	
  3853	err:
  3854		/* send the response back to the VF */
  3855		ret = ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_1588_PTP_GET_TIME,
  3856					    v_ret, (u8 *)phc_time, len);
  3857		kfree(phc_time);
  3858		return ret;
  3859	}
  3860	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
