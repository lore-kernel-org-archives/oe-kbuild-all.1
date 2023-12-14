Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAE6A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxqeAVtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702581731; x=1734117731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Fdam4vE2Ku1uNp7Ee8nTxt9bEzoEzu172Jlr50E0AQ=;
  b=DxqeAVtfQ4Kc9PiTwjnk6arPyx2eGj94YlKcb4A3PyLdqwebD50y/OU1
   DtT4ILQpJefHEopULU0iJvjXXmkiXpZnLGw2Xr+0f0cEDmo6UptCHE207
   fODQo+cTt449yixCkbYj6Hx6oJivMzl4O8Cs8oYJ5teusX1xej9KNnY3B
   pGFomrRTe5av3DCfdFYTVIPEcbjfNejBkDufFIkPER0Qnu3NZ+vZ4XYp/
   v+vnaqR0xbSbAj+29hIa4iidVFgh0yH7ETOkJ7iiPG0dIdV81LVOXUXXB
   jgAoxH8GMHRTeLl8Fm3u6uhucdFULA4eagknDCM2/RccZgZ6BM+k6XKn+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2336928"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="2336928"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 11:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844838879"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="844838879"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Dec 2023 11:22:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDrHb-000MVu-1M;
	Thu, 14 Dec 2023 19:22:07 +0000
Date: Fri, 15 Dec 2023 03:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 11/15] drm/msm/dpu: add an API to setup the CDM block
 for writeback
Message-ID: <202312150312.QeRReP1C-lkp@intel.com>
References: <20231212002245.23715-12-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212002245.23715-12-quic_abhinavk@quicinc.com>

Hi Abhinav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231211]
[cannot apply to drm-misc/drm-misc-next linus/master v6.7-rc5 v6.7-rc4 v6.7-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-msm-dpu-add-formats-check-for-writeback-encoder/20231212-122641
base:   next-20231211
patch link:    https://lore.kernel.org/r/20231212002245.23715-12-quic_abhinavk%40quicinc.com
patch subject: [PATCH v3 11/15] drm/msm/dpu: add an API to setup the CDM block for writeback
config: i386-buildonly-randconfig-004-20231214 (https://download.01.org/0day-ci/archive/20231215/202312150312.QeRReP1C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150312.QeRReP1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150312.QeRReP1C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h:8,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c:7:
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:54:33: warning: 'dpu_csc10_rgb2yuv_601l' defined but not used [-Wunused-const-variable=]
      54 | static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:39:33: warning: 'dpu_csc10_YUV2RGB_601L' defined but not used [-Wunused-const-variable=]
      39 | static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:24:33: warning: 'dpu_csc_YUV2RGB_601L' defined but not used [-Wunused-const-variable=]
      24 | static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
         |                                 ^~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:10,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:20,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:21:
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:54:33: warning: 'dpu_csc10_rgb2yuv_601l' defined but not used [-Wunused-const-variable=]
      54 | static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~


vim +/dpu_csc10_rgb2yuv_601l +54 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h

    53	
  > 54	static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
    55		{
    56			TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
    57			TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
    58			TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
    59		},
    60		{ 0x00, 0x00, 0x00 },
    61		{ 0x0040, 0x0200, 0x0200 },
    62		{ 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
    63		{ 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
    64	};
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
