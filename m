Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A7016DEAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725146066; cv=none; b=fRV2s6Tnmf2nBLauM9L69EOHmE4TndW2Pu4EyFEagIw+zouyY0+p54+vuRWYo3Lmgtxy4KxbWZYKzNZxeEC9nPlQ7izyirzV5gGiqotChJVNxANQx9URU667RJVtVwF/ux8Bj0ZzNOeBuMeX2zrOfGwN6J6mTltH716/lE+ta3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725146066; c=relaxed/simple;
	bh=DfaagWOeoivfgQcEVF8ZrMM+YC9zIQsBH9ZZfOMV1+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aM2o5kZI7FZRy7LRm3sHnxuVyfkJghXUys5DI/aknvgkiGOS5VpmibCy1CPFDldru9s1c6khcmOeZurswuz/iXPB/iccE2KU9L4G5RN6iR9CsTdrdtO7RnmEly2EMvqeE81nZS2OMGrhFGo1Ud7Tc1f5Ezluw58dNVNyIH6OEgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYe70Crx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYe70Crx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725146065; x=1756682065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DfaagWOeoivfgQcEVF8ZrMM+YC9zIQsBH9ZZfOMV1+Q=;
  b=OYe70Crx7DZtdQ9EOr2iQ/R9uw1xkMhd59sB3YjaIdGYK74LSYuDZNJ5
   aQglzZB+JHCtw09hFHhC6rGmewSuyE4L0SrFUWjk8RatFuocPNkM6pBAg
   rQ8Y/2jZ8AB5gu8E1gKEm05FWH9i8MhZCAe+nLHjoAoZSncs4SYVCKfga
   TXRpp2AsQFKX1l/q+0/fQMVi0UQw9c7bZZrHvHggYM73JahEpMnOCk/WY
   RsJuWB+qhKWn+cebO5kX/8qc4NHB6wWWOEr2+U53e0iLIgaPyZ7GAGk3w
   f1o3Q656VilzSXX5/uHnkQ850dM996EBt7tG6LYPUkHKrdIP/4RefuQtf
   g==;
X-CSE-ConnectionGUID: r4GFps0VTBKHZqo/6xeTpA==
X-CSE-MsgGUID: LVUnqP1UQLaZNp3D0JA/Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="41254684"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="41254684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 16:14:24 -0700
X-CSE-ConnectionGUID: 5fMCZ3xSSyitgLPR2Jni0A==
X-CSE-MsgGUID: TOaoXOQ4TCOMGDGs9R1vHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="94948173"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2024 16:14:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skXIS-0003C2-28;
	Sat, 31 Aug 2024 23:14:20 +0000
Date: Sun, 1 Sep 2024 07:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [lumag-msm:msm-next-lumag-test 5/20]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c:241:16: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202409010721.z5Wmn7uE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/lumag/msm msm-next-lumag-test
head:   19618c65e67f0e394e0299fba12e3582f0312e19
commit: 9a751567df0a8f759bc3d00553cdedf1f9ea5cd9 [5/20] drm/msm/dpu: Configure DP INTF/PHY selector
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409010721.z5Wmn7uE-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010721.z5Wmn7uE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010721.z5Wmn7uE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c: In function 'dpu_hw_dp_phy_intf_sel':
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c:241:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     241 |         sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF0, phys[0]);
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +241 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c

   233	
   234	static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
   235					   enum dpu_dp_phy_sel phys[2])
   236	{
   237		struct dpu_hw_blk_reg_map *c = &mdp->hw;
   238		unsigned int intf;
   239		u32 sel = 0;
   240	
 > 241		sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF0, phys[0]);
   242		sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF1, phys[1]);
   243	
   244		for (intf = 0; intf < 2; intf++) {
   245			switch (phys[intf]) {
   246			case DPU_DP_PHY_0:
   247				sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY0, intf + 1);
   248				break;
   249			case DPU_DP_PHY_1:
   250				sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY1, intf + 1);
   251				break;
   252			case DPU_DP_PHY_2:
   253				sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY2, intf + 1);
   254				break;
   255			default:
   256				/* ignore */
   257				break;
   258			}
   259		}
   260	
   261		DPU_REG_WRITE(c, MDP_DP_PHY_INTF_SEL, sel);
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
