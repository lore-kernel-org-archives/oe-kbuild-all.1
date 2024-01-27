Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCA822F0F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 23:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706399053; cv=none; b=mi3ihdcTbXB2znLAaVGFnghdKst30GWvnTey0qDZZ2nJauuj61pZdJYB6EkPnyK/WoqGkfA4Jcp2rbbKAzGIAfjO3xOciUNEupkIP0lhfccCc7pquz6ozNfIYq6yGcTM5Ud1Z61027CYJQgcu3Czjb59UxFL6r5qaSN1NRo0xvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706399053; c=relaxed/simple;
	bh=U1AxWClhKSzifIbdDnbsW9clzyYeqHy+cMhLWIr7qKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g80aD+GFH8j203l7ODGEnhl2fn4bryobAGKowcp7xEmRtSETr1VYhRgW2beWQBr8A2rhaJaLsViBzSvDoNOjrWWQ8eY/X0bxKP7O07Znd83L54pZrJtKG+dsNVIR9VfbudXWpZvE9nROPnVPreq5sqG9IR1bypgA6ckRPIIlfOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HV8DhDsF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV8DhDsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706399050; x=1737935050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U1AxWClhKSzifIbdDnbsW9clzyYeqHy+cMhLWIr7qKc=;
  b=HV8DhDsF8szvnFUa0Wh1UY/NOU9afXpb41fOVyPuqu+RAADqzuLY0jVD
   1QE8GwivP7qEFN/+6Ufv+zMpwqsNXs0crKkmewgNjG4g8F04avj/+xN+3
   VIaH2h+Nx/4gqLdY5Nr6mq/pcT/ShX0FBh1NYPIuJMFm8P8pIzozQQaC4
   bG6oxug5vnEo6Ep0YgkwKxhsTeKApGVj5FHzHtEZuGDCuIRIhsHQZep32
   lalyLdsBISIK4XYwOO+oq5sz355O/9LKDTX0U6f0H/Lfe+m26cQLm6e5D
   hxWEGlRv04CbDtMlV8qR6oR6jMjwPK9xjgtvnwYw/ao7oXVOrLq+G20JS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9376880"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9376880"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 15:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="737023180"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="737023180"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Jan 2024 15:44:06 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTsLD-0002s2-39;
	Sat, 27 Jan 2024 23:44:03 +0000
Date: Sun, 28 Jan 2024 07:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Paloma Arellano <quic_parellan@quicinc.com>,
	freedreno@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, neil.armstrong@linaro.org,
	marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
	quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
	swboyd@chromium.org, seanpaul@chromium.org,
	quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
	Paloma Arellano <quic_parellan@quicinc.com>,
	quic_khsieh@quicinc.com
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
Message-ID: <202401280752.AmrDI7Ox-lkp@intel.com>
References: <20240125193834.7065-11-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125193834.7065-11-quic_parellan@quicinc.com>

Hi Paloma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.8-rc1]
[also build test WARNING on linus/master next-20240125]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paloma-Arellano/drm-msm-dpu-allow-dpu_encoder_helper_phys_setup_cdm-to-work-for-DP/20240126-034233
base:   v6.8-rc1
patch link:    https://lore.kernel.org/r/20240125193834.7065-11-quic_parellan%40quicinc.com
patch subject: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show major and minor val
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240128/202401280752.AmrDI7Ox-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280752.AmrDI7Ox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280752.AmrDI7Ox-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_catalog.c:541: warning: Function parameter or struct member 'major' not described in 'dp_catalog_hw_revision'
>> drivers/gpu/drm/msm/dp/dp_catalog.c:541: warning: Function parameter or struct member 'minor' not described in 'dp_catalog_hw_revision'


vim +541 drivers/gpu/drm/msm/dp/dp_catalog.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  531  
757a2f36ab095f Kuogee Hsieh     2022-02-25  532  /**
757a2f36ab095f Kuogee Hsieh     2022-02-25  533   * dp_catalog_hw_revision() - retrieve DP hw revision
757a2f36ab095f Kuogee Hsieh     2022-02-25  534   *
757a2f36ab095f Kuogee Hsieh     2022-02-25  535   * @dp_catalog: DP catalog structure
757a2f36ab095f Kuogee Hsieh     2022-02-25  536   *
5febc52d5716d6 Paloma Arellano  2024-01-25  537   * Return: void
757a2f36ab095f Kuogee Hsieh     2022-02-25  538   *
757a2f36ab095f Kuogee Hsieh     2022-02-25  539   */
5febc52d5716d6 Paloma Arellano  2024-01-25  540  void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor)
757a2f36ab095f Kuogee Hsieh     2022-02-25 @541  {
757a2f36ab095f Kuogee Hsieh     2022-02-25  542  	const struct dp_catalog_private *catalog = container_of(dp_catalog,
757a2f36ab095f Kuogee Hsieh     2022-02-25  543  				struct dp_catalog_private, dp_catalog);
5febc52d5716d6 Paloma Arellano  2024-01-25  544  	u32 reg_dp_hw_version;
757a2f36ab095f Kuogee Hsieh     2022-02-25  545  
5febc52d5716d6 Paloma Arellano  2024-01-25  546  	reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
5febc52d5716d6 Paloma Arellano  2024-01-25  547  	*major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
5febc52d5716d6 Paloma Arellano  2024-01-25  548  	*minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);
757a2f36ab095f Kuogee Hsieh     2022-02-25  549  }
757a2f36ab095f Kuogee Hsieh     2022-02-25  550  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
