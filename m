Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A162B5E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 23:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgSAwVzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697154246; x=1728690246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zSuLwD9P6z2knCJntWiML+HPrMbb772iipuKuTuOBFo=;
  b=OgSAwVzgx4pe+074yq0m93Ay2L3KZJj8AneHeeL1BDFDabMw1aF5Tz0O
   1WMrCUDHBv7tca1FvEubPFyY3WgRmXi9xSjPtVBP1TG6Qb8ndyinL2qLs
   hZ7mJDgIFQmSZ7ylwxYnWzasfjEuk6leEY4hwn/SDSj3z50i+pp2jf2Md
   fPaqk3hcqUeYZxur9MjlpMS5TvvoQ39FVSl/BjxbtdClpMxCYjE/M6mY/
   OooA0NSiCXLwxp0YaoH+gZiwYGmEltjUiKpyvQi4fh15VtRCW/Guef1Jc
   Lbr7ohsbctR3y8P9q6i9Ks/gQZ/zbyiMLTHZJM66YdCOCQj3Es3ljqIiO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388930441"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="388930441"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 16:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1085885017"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1085885017"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2023 16:44:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr5LW-00044H-1q;
	Thu, 12 Oct 2023 23:44:02 +0000
Date: Fri, 13 Oct 2023 07:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 410/30000]
 drivers/gpu/drm/mxsfb/mxsfb_drv.c:161:22: warning: no previous prototype for
 'mxsfb_pipe_mode_valid'
Message-ID: <202310130719.vFGROssV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 7bfb905f8ed24eae5f84f5a294286e5d5721825c [410/30000] drm/mxsfb: Add max-memory-bandwidth property for MXSFB
config: riscv-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310130719.vFGROssV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130719.vFGROssV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130719.vFGROssV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/mxsfb_drv.c:161:22: warning: no previous prototype for 'mxsfb_pipe_mode_valid' [-Wmissing-prototypes]
     161 | enum drm_mode_status mxsfb_pipe_mode_valid(struct drm_crtc *crtc,
         |                      ^~~~~~~~~~~~~~~~~~~~~


vim +/mxsfb_pipe_mode_valid +161 drivers/gpu/drm/mxsfb/mxsfb_drv.c

   160	
 > 161	enum drm_mode_status mxsfb_pipe_mode_valid(struct drm_crtc *crtc,
   162						   const struct drm_display_mode *mode)
   163	{
   164		struct drm_simple_display_pipe *pipe =
   165			container_of(crtc, struct drm_simple_display_pipe, crtc);
   166		struct mxsfb_drm_private *mxsfb = drm_pipe_to_mxsfb_drm_private(pipe);
   167		u32 bpp;
   168		u64 bw;
   169	
   170		if (!pipe->plane.state->fb)
   171			bpp = 32;
   172		else
   173			bpp = pipe->plane.state->fb->format->depth;
   174	
   175		bw = mode->crtc_clock * 1000;
   176		bw = bw * mode->hdisplay * mode->vdisplay * (bpp / 8);
   177		bw = div_u64(bw, mode->htotal * mode->vtotal);
   178	
   179		if (mxsfb->max_bw && (bw > mxsfb->max_bw))
   180			return MODE_BAD;
   181	
   182		return MODE_OK;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
