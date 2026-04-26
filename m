Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56852556E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 00:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777162490; cv=none; b=cP4nM2oHBs9CMZdF6cs5E+0MOqX0qvtj69OMtbp+gp52BuvWl5DgYGjyFoNQAkvoLxSRqkCJheysMKc5JQdWE29sk1lQUl4bv4iZxvFqM9JmVeJngYd48JbuZVDzKrKFjiBeXfA2Zjj12mG/IHhqR+yvvSltuBhpw3932aw3Q4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777162490; c=relaxed/simple;
	bh=j0QOFpm4PUSLMAFVx7Cuw2PqIvnVD2fXseS3mEw+iCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jYSGYHwmVfg4StEqjjAl/IoeSOS/OY3yHX3eH2+RjUi/K2gkCWSj5xpaEacoVMGhr21GmiIVaH72lTy7+oJfQVEGXu2vQVwsoLBG+sLbanYQOQPppQ026p9r9+zaCSyPqPD09T7PYmvN6mrFq1VD7j13ZaDkQ1uh/SsxFBtuUZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEKtSg9x; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEKtSg9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777162487; x=1808698487;
  h=date:from:to:cc:subject:message-id;
  bh=j0QOFpm4PUSLMAFVx7Cuw2PqIvnVD2fXseS3mEw+iCo=;
  b=aEKtSg9xf6Th0UCp2uJ6meb57RvHfrqH/ujl+yj7STfTGCKHctGDUYcq
   66o/p0FR+N1VD9SIRIh2a/C6VEHCWEyyKxsg3uJRRYMnbBVhvl+vKmVRW
   ZwvkYFAmMY9itXvsx8o4j+/AXQuTIyh8LM6GXrCJNLQqJ5oqBBGZeA5Nh
   MiUAaQVd2gbm4qrNFVneVobz9Q+8GvzG97uMOd6y6tTqhKySF4LDHHK0d
   KWb+SNUT3uE2PwsvXCu7BWKW5i4jBffojorX4RmnJa0pKMvNUQuBq8ATn
   h+1TyL97s9/8N9IBNAsqYmgP9R3qEhZ4pIB6joxGh2uEXUPWL+12fheyW
   g==;
X-CSE-ConnectionGUID: cMOJkd4jSxqhzUg2NuQJMA==
X-CSE-MsgGUID: gfTAw1j2TxefeQDBPdZcEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="78085676"
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="78085676"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 17:14:47 -0700
X-CSE-ConnectionGUID: B78zj7pNTj6RV3s3XOT/mw==
X-CSE-MsgGUID: YxWFqilWTC23aBHGclekng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="233174814"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Apr 2026 17:14:46 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGn91-000000007Ej-1o5y;
	Sun, 26 Apr 2026 00:14:43 +0000
Date: Sun, 26 Apr 2026 08:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/gpu/drm/msm/dsi/dsi_host.c:555: warning: Function parameter or member
 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'
Message-ID: <202604260817.i1wn25ch-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   27ed6947ea3491af6f95acb920bac1d1d7dcf8e6
commit: 43723dff1a59d6aa25dd6b81129ff747be2e52c5 [1/1] drm/msm/dsi: fix pclk rate calculation for bonded dsi
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260426/202604260817.i1wn25ch-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604260817.i1wn25ch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604260817.i1wn25ch-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dsi/dsi_host.c:555: warning: Function parameter or member 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'


vim +555 drivers/gpu/drm/msm/dsi/dsi_host.c

c4d8cfe516dc54 Sibi Sankar      2018-05-29  531  
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  532  /**
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  533   * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  534   * @mode: The selected mode for the DSI output
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  535   * @dsc: DRM DSC configuration for this DSI output
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  536   *
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  537   * Adjust the pclk rate by calculating a new hdisplay proportional to
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  538   * the compression ratio such that:
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  539   *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  540   *
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  541   * Porches do not need to be adjusted:
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  542   * - For VIDEO mode they are not compressed by DSC and are passed as is.
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  543   * - For CMD mode there are no actual porches. Instead these fields
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  544   *   currently represent the overhead to the image data transfer. As such, they
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  545   *   are calculated for the final mode parameters (after the compression) and
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  546   *   are not to be adjusted too.
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  547   *
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  548   *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  549   *  transfer time and data overhead as a starting point of the calculations.
7c370f2cb7fc8b Dmitry Baryshkov 2024-02-08  550   */
43723dff1a59d6 Pengyu Luo       2026-03-07  551  static unsigned long
43723dff1a59d6 Pengyu Luo       2026-03-07  552  dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
43723dff1a59d6 Pengyu Luo       2026-03-07  553  				const struct drm_dsc_config *dsc,
43723dff1a59d6 Pengyu Luo       2026-03-07  554  				bool is_bonded_dsi)
7c9e4a554d4a71 Jessica Zhang    2023-06-09 @555  {
43723dff1a59d6 Pengyu Luo       2026-03-07  556  	int hdisplay, new_hdisplay, new_htotal;
43723dff1a59d6 Pengyu Luo       2026-03-07  557  
43723dff1a59d6 Pengyu Luo       2026-03-07  558  	/*
43723dff1a59d6 Pengyu Luo       2026-03-07  559  	 * For bonded DSI, split hdisplay across two links and round up each
43723dff1a59d6 Pengyu Luo       2026-03-07  560  	 * half separately, passing the full hdisplay would only round up once.
43723dff1a59d6 Pengyu Luo       2026-03-07  561  	 * This also aligns with the hdisplay we program later in
43723dff1a59d6 Pengyu Luo       2026-03-07  562  	 * dsi_timing_setup()
43723dff1a59d6 Pengyu Luo       2026-03-07  563  	 */
43723dff1a59d6 Pengyu Luo       2026-03-07  564  	hdisplay = mode->hdisplay;
43723dff1a59d6 Pengyu Luo       2026-03-07  565  	if (is_bonded_dsi)
43723dff1a59d6 Pengyu Luo       2026-03-07  566  		hdisplay /= 2;
43723dff1a59d6 Pengyu Luo       2026-03-07  567  
43723dff1a59d6 Pengyu Luo       2026-03-07  568  	new_hdisplay = DIV_ROUND_UP(hdisplay * drm_dsc_get_bpp_int(dsc),
7c9e4a554d4a71 Jessica Zhang    2023-06-09  569  				    dsc->bits_per_component * 3);
7c9e4a554d4a71 Jessica Zhang    2023-06-09  570  
43723dff1a59d6 Pengyu Luo       2026-03-07  571  	if (is_bonded_dsi)
43723dff1a59d6 Pengyu Luo       2026-03-07  572  		new_hdisplay *= 2;
43723dff1a59d6 Pengyu Luo       2026-03-07  573  
43723dff1a59d6 Pengyu Luo       2026-03-07  574  	new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
7c9e4a554d4a71 Jessica Zhang    2023-06-09  575  
9f236108915246 Jonathan Marek   2024-10-07  576  	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
7c9e4a554d4a71 Jessica Zhang    2023-06-09  577  }
7c9e4a554d4a71 Jessica Zhang    2023-06-09  578  

:::::: The code at line 555 was first introduced by commit
:::::: 7c9e4a554d4a712bc6891a49d52b1ec030ed5b4a drm/msm/dsi: Reduce pclk rate for compression

:::::: TO: Jessica Zhang <quic_jesszhan@quicinc.com>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
