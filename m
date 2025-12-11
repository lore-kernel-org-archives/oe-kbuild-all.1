Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F11519B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765419810; cv=none; b=i/Xy+KQdj/inTsHSFCwimWDso0eVCk9AUR1vQvIWN+UyeiPufrMuGIl1/OiYUVxURKfh5IWuGPN32bsMvpVOibbBoKVb5kse4AqYeV4DLkL6xtYoRSatJN2o5c5YpD693FgoDGk8lhGoL7M4dP2ydJfiT0lEM4hSPbqrANDe5F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765419810; c=relaxed/simple;
	bh=WHuI1vYJo+9ofZOIK3vZhE0UGR3dKo3DWtur0wGlxzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vba84FsLmINH+DZgQwfcwhm15PoVA5GiFW7EvCTZ6IMzIdqAkfeVPpQrdUxoxWPFrqVHAn0Wm6GxDhDAqT54UsMWHmGW8RnrRZ1bCVLQkXMK58etDEsC8Ke43SrFYos/GBqJGqb088lS5tJ4zTjt+z1jwE0ibsB7gcDPtNkomlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTJyKP83; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTJyKP83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765419808; x=1796955808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHuI1vYJo+9ofZOIK3vZhE0UGR3dKo3DWtur0wGlxzA=;
  b=OTJyKP83KgTvfTQ7TMHakoPv9OCW9p6km0rVLFzeeGL/rWAAyUT3592+
   HK99cxbDfu9/fSjcwkNHhuGSR501K69Xz2GUaUokaMqdYao7reO8XjLue
   S2QA6AnzjN/sLZIpJVsneyaCIQqGhKOJbIjrmmohtZADhAfzk3EMhACY3
   +XnwL1UACJ4K9AzWGrmQDn7LAqHWrf7X6EHaqSofLAqIQkIwALjxnsZY/
   0MwLfNe+pHRvd1cgoSxRxYoFqdkDeHiCRxsaNR8kG1uUimpckQH20193v
   FqCG7k1YYC1n/+j8cLKp+SH9Y3d7p/LjjNE3WtA8uF1vZ6h0ML7WSkcIc
   A==;
X-CSE-ConnectionGUID: xD/+GQR6RVarpb/2RhF//Q==
X-CSE-MsgGUID: WRcDDe/6TxO/Cw4bmCYe/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69984960"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="69984960"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:23:27 -0800
X-CSE-ConnectionGUID: Wyv+4FXESCuraixAFoU7TQ==
X-CSE-MsgGUID: q6m8kPMQQjup+409uq3ulA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197487210"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2025 18:23:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWKy-0000000041h-2f4e;
	Thu, 11 Dec 2025 02:23:24 +0000
Date: Thu, 11 Dec 2025 10:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/5] net/smc/smc_clc.c:1263:6:
 warning: no previous prototype for 'smc_clc_vendor_opt_validate'
Message-ID: <202512111035.I1jeNnJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: b4ca66f6c08c6ab9caf3759162598f263da012ae [0/5] anolis: net/smc: support Alibaba unique experimental options
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512111035.I1jeNnJ8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111035.I1jeNnJ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111035.I1jeNnJ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/smc/smc_clc.c:1263:6: warning: no previous prototype for 'smc_clc_vendor_opt_validate' [-Wmissing-prototypes]
    1263 | void smc_clc_vendor_opt_validate(struct smc_clc_msg_proposal *pclc,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/smc_clc_vendor_opt_validate +1263 net/smc/smc_clc.c

  1262	
> 1263	void smc_clc_vendor_opt_validate(struct smc_clc_msg_proposal *pclc,
  1264					 struct smc_init_info *ini)
  1265	{
  1266		struct smc_clc_msg_smcd *prop_smcd = smc_get_clc_msg_smcd(pclc);
  1267	
  1268		if (!prop_smcd)
  1269			return;
  1270	
  1271		if (memcmp(prop_smcd->vendor_oui, SMC_VENDOR_OUI_ALIBABA,
  1272			   sizeof(SMC_VENDOR_OUI_ALIBABA)))
  1273			return;
  1274	
  1275		if (!prop_smcd->vendor_exp_options.valid)
  1276			return;
  1277	
  1278		ini->vendor_opt_valid = 1;
  1279	}
  1280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
