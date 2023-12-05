Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260BC58126
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWGcYzVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701776861; x=1733312861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/pPGhlGTnM9oQLy7M6WtIxrVGP6wBtkBr8qngEB5GA=;
  b=EWGcYzVFXMArnXIqWZg5FMZpBzfBc/8+ggvncEoyUohfmDUWhHEPnBtd
   x8BJ9MwI7kif7ujgEO/Mdn+hXJGnycnwrdBb9Z8XR065VbNg1V9QTnNrD
   Ihb9cX2qpVsWRU6tVn8VR4NOLlYI/ls5u+6XgB4SGBQwFfjY7pwVEfSaa
   uAsHqPz8wDW1Vvmh2XdlGag9NOU4UrjUHtS7Z0figEtMZKXyd8tYWJL6n
   +mswJjP1aK4eAV5WBVuZb5JQJYWDywvW32+muQE0EMKasMJ5OApe0AtQ7
   C4S6m9UDKaiuLQ6Bh1e2eoEz2fPAw0uE6mQqnAdnlTR9tR0aoSEySwp04
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384279812"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="384279812"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018198398"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018198398"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:47:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATtl-0008uf-0V;
	Tue, 05 Dec 2023 11:47:33 +0000
Date: Tue, 5 Dec 2023 19:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFT PATCH v2 1/4] drm/msm/dpu: enable writeback on SM8150
Message-ID: <202312051918.XcPf4xI6-lkp@intel.com>
References: <20231203003203.1293087-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203003203.1293087-2-dmitry.baryshkov@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-dpu-enable-writeback-on-SM8150/20231203-083350
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231203003203.1293087-2-dmitry.baryshkov%40linaro.org
patch subject: [RFT PATCH v2 1/4] drm/msm/dpu: enable writeback on SM8150
config: i386-buildonly-randconfig-001-20231203 (https://download.01.org/0day-ci/archive/20231205/202312051918.XcPf4xI6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051918.XcPf4xI6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051918.XcPf4xI6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:658:
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h:299:29: error: 'WB_SDM845_MASK' undeclared here (not in a function); did you mean 'WB_SM8250_MASK'?
     299 |                 .features = WB_SDM845_MASK,
         |                             ^~~~~~~~~~~~~~
         |                             WB_SM8250_MASK


vim +299 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h

   294	
   295	static const struct dpu_wb_cfg sm8150_wb[] = {
   296		{
   297			.name = "wb_2", .id = WB_2,
   298			.base = 0x65000, .len = 0x2c8,
 > 299			.features = WB_SDM845_MASK,
   300			.format_list = wb2_formats,
   301			.num_formats = ARRAY_SIZE(wb2_formats),
   302			.clk_ctrl = DPU_CLK_CTRL_WB2,
   303			.xin_id = 6,
   304			.vbif_idx = VBIF_RT,
   305			.maxlinewidth = 4096,
   306			.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
   307		},
   308	};
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
