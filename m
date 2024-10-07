Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AD91D8A09
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728313517; cv=none; b=bYJ3agTquMN2hwDtGh6tPpCOHoJ811x1m7kQsKoGeqLcPkkWMTk3kzEyLLzUYEWWotU7JCPS9UxymGnpKqJ4I1drNGo6Nx/je3SgGaaBfEnzgPXah6OTsCtM9LeF3GYU8domfjbsIE7tNliG6cSVvJsMIMFRde/vO2R/vYxsbd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728313517; c=relaxed/simple;
	bh=8m/kHbuWYC8Jki8u+kqzirurlQkmTkFZilhMsghYC44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XL9driz/hnK1wl4OmQEPIUFJgUfbBH4eCpip1BU63YNf04g6IZF9DehdE3QqJQ5ggk4kfrIyllkmPD9R0hTgeVbF4Lr9oXtmDSvdb2R7XwKuGJqh8Eoar9jTnXj8OPDs24VWAxLpqvJtjdoG2aq5kQZC+/LdNgYrAAzSzYWS5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBiwZrZp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBiwZrZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728313516; x=1759849516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8m/kHbuWYC8Jki8u+kqzirurlQkmTkFZilhMsghYC44=;
  b=FBiwZrZppXJsl0WxjtA9j57roqc6kPfdeyInDzi99f8ElZk2/b73wMm2
   19u6Osc6Qoq/gU1T0fvzAhnjPMKOIVo2i6GPmnmgjAvT8tltbwUftIw2w
   wr2b0GXBv+XmAdFPeqXKQv3jaRa4RcAd2gxbkH+f3J+TNzLG1F1B1DUdH
   7+DNfaoSO71U7nQE4DmN8KFBxGyjle8Gtl4NZA/PM8XjgBfc9/G9/ZsCl
   tyVQsMPXptcj87KO7RexhVAFGh07RIm9A0kcF9vHrlAhTu92oRFpxPcvK
   uBmSQLTOkBlkLk4USFVRfPQ2zdc/vlteGDvaKeRwVjQo0Yk4wIgVNaFoi
   w==;
X-CSE-ConnectionGUID: h0fDj29qTpSmmabPmmG9sw==
X-CSE-MsgGUID: 2DPH388vSG62NoD0W4tseQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="50001306"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="50001306"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 08:05:14 -0700
X-CSE-ConnectionGUID: jd2zbP8dQ8eq8zqkPkD0cQ==
X-CSE-MsgGUID: L+gD0XKqTu24+uQhmNCojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="98822608"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Oct 2024 08:04:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxpI6-00058k-31;
	Mon, 07 Oct 2024 15:04:54 +0000
Date: Mon, 7 Oct 2024 23:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mounik Katikala <mounik.katikala@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1067/1093]
 drivers/media/platform/xilinx/xilinx-isppipeline.c:100:36: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202410072350.haRbIm4l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   3c31f9d5fb29a99c43f59d424f7f717ee2177e14
commit: 116fbf86655bcc669b416defceabf085291f4500 [1067/1093] v4l: xilinx: isppipeline: Add support for AEC
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410072350.haRbIm4l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072350.haRbIm4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410072350.haRbIm4l-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-isppipeline.c: In function 'xisp_s_ctrl':
>> drivers/media/platform/xilinx/xilinx-isppipeline.c:100:36: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     100 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-isppipeline.c:104:27: note: in expansion of macro 'XGET_BIT'
     104 |                 bool en = XGET_BIT(_index, xisp->module_en); \
         |                           ^~~~~~~~
   drivers/media/platform/xilinx/xilinx-isppipeline.c:287:17: note: in expansion of macro 'XISP_SET_CFG'
     287 |                 XISP_SET_CFG(XISP_AEC_INDEX, XISP_AEC_CONFIG_REG, xisp->threshold_aec);
         |                 ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +100 drivers/media/platform/xilinx/xilinx-isppipeline.c

    91	
    92	#define XISP_RESET_DEASSERT		(0)
    93	#define XISP_RESET_ASSERT		(1)
    94	#define XISP_START			BIT(0)
    95	#define XISP_AUTO_RESTART		BIT(7)
    96	#define XISP_STREAM_ON			(XISP_AUTO_RESTART | XISP_START)
    97	#define XILINX_ISP_VERSION_1					BIT(0)
    98	#define XILINX_ISP_VERSION_2					BIT(1)
    99	#define XISP_AEC_THRESHOLD_DEFAULT	(20)
 > 100	#define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
   101	#define XISP_SET_CFG(INDEX, REG, VAL)	\
   102		do {	\
   103			u32 _index = (INDEX); \
   104			bool en = XGET_BIT(_index, xisp->module_en); \
   105			bool byp_en = XGET_BIT(_index, xisp->module_bypass_en); \
   106			bool byp = XGET_BIT(_index, xisp->module_bypass); \
   107			\
   108			if (en)	\
   109				if (!byp_en || !(byp_en && byp)) \
   110					xvip_write(&xisp->xvip, (REG), (VAL)); \
   111		} while (0)
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
