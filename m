Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F460B8D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6pdCj/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702572146; x=1734108146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zc7xZ5KKNaVbvHQDjlcCSw2WtTquQyocOyzMz5fNqtY=;
  b=Y6pdCj/zUR8ST0FQz52zGlAwYcdgCdvk3dpqQTR9OpPoA5dS4PxyN0/v
   d720KLxwapXsXVP4F5RcGPSpJJvsLt0SorWq0JvlpNVufQ2X2zjkEq9Fc
   dkK079CBtlKDVkCcbbV+H6lW42/Jqw6iaKEPrJWKP63w72YU9gdcGscRU
   jwEBMSwiey40H7AezPtwR76F/tyvVbQjAaAV3iDEEpgJ0d/6JU8mjMg9B
   2IBCjUgkUfZjjgYyA7aArBrI34coLYsqwnod1K63DC8tYBlh0oiP2G0p8
   Hr2M4+diKtPzYixinWSgXSBR5LrK23pxACyOKIKBh0dtlVhh6dtPLx8t0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394014452"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="394014452"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803345644"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="803345644"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Dec 2023 08:42:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDomw-000MKk-1E;
	Thu, 14 Dec 2023 16:42:20 +0000
Date: Fri, 15 Dec 2023 00:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/15] drm/msm/dpu: move csc matrices to dpu_hw_util
Message-ID: <202312150009.KQMKi1JM-lkp@intel.com>
References: <20231212002245.23715-5-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212002245.23715-5-quic_abhinavk@quicinc.com>

Hi Abhinav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231211]
[cannot apply to drm-misc/drm-misc-next linus/master v6.7-rc5 v6.7-rc4 v6.7-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-msm-dpu-add-formats-check-for-writeback-encoder/20231212-122641
base:   next-20231211
patch link:    https://lore.kernel.org/r/20231212002245.23715-5-quic_abhinavk%40quicinc.com
patch subject: [PATCH v3 4/15] drm/msm/dpu: move csc matrices to dpu_hw_util
config: i386-buildonly-randconfig-004-20231214 (https://download.01.org/0day-ci/archive/20231215/202312150009.KQMKi1JM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150009.KQMKi1JM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150009.KQMKi1JM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:10,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:20,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h:8,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:29:
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:37:33: warning: 'dpu_csc10_YUV2RGB_601L' defined but not used [-Wunused-const-variable=]
      37 | static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:22:33: warning: 'dpu_csc_YUV2RGB_601L' defined but not used [-Wunused-const-variable=]
      22 | static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
         |                                 ^~~~~~~~~~~~~~~~~~~~


vim +/dpu_csc10_YUV2RGB_601L +37 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h

    21	
  > 22	static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
    23		{
    24			/* S15.16 format */
    25			0x00012A00, 0x00000000, 0x00019880,
    26			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
    27			0x00012A00, 0x00020480, 0x00000000,
    28		},
    29		/* signed bias */
    30		{ 0xfff0, 0xff80, 0xff80,},
    31		{ 0x0, 0x0, 0x0,},
    32		/* unsigned clamp */
    33		{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
    34		{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
    35	};
    36	
  > 37	static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
    38		{
    39			/* S15.16 format */
    40			0x00012A00, 0x00000000, 0x00019880,
    41			0x00012A00, 0xFFFF9B80, 0xFFFF3000,
    42			0x00012A00, 0x00020480, 0x00000000,
    43		},
    44		/* signed bias */
    45		{ 0xffc0, 0xfe00, 0xfe00,},
    46		{ 0x0, 0x0, 0x0,},
    47		/* unsigned clamp */
    48		{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
    49		{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
