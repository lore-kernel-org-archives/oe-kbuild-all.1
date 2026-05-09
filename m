Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D4E18C332
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778320006; cv=none; b=DifEnC4b7kXopD64p92Fp6lrgV4pTefSjq2ogIR4WvnvBqhDfXPmq+3CBQoJWm1uRB25z5XRd6a58QOMDgGKSi1UkyKohOOK++4yKZtYiYXs1GL4bS8jaLZjoBeXfj8FZ7Bz2203fHKlLP/CQGqZhBo7ybkBkFxON6pPU7lR5d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778320006; c=relaxed/simple;
	bh=MrYxULpd+an3Jby68VqBv5VlLxawBh5Yk+sSFz5uj5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bO4Yu5nBULAJyoI4LH/Xb3DBWwlfMvRS2ZMhJAGSXsyVF2s/7JgueDa8uApIPHSlU7/p9dToC2p9h96zf79pH6y/uGCsX//SXfl/DG73TGQuhU1cnfMBC+SQHJIR3DdPbXunMIkBgEiuQ/UaL6E06S5+snXVszbHDbqpKxlI4qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHLpXR51; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHLpXR51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778320004; x=1809856004;
  h=date:from:to:cc:subject:message-id;
  bh=MrYxULpd+an3Jby68VqBv5VlLxawBh5Yk+sSFz5uj5k=;
  b=iHLpXR512kVB3c1LD05zObB8mXa8CJahMBtcbfuXPhZje3Rt1fgWMWVL
   6MAFPy88GU2Zpr6LABFzeVOXG5o2S5KYK3ckjzCZegcxI/mOwBYNWsp0i
   D+kBJu7V2YOu3CvYEulHSjSDVEU8ZFwxq7sDOP3giObZwOsUKmX+kbQte
   H4ju8IL6FMfM+VtzWdCWonehvQvL0sNvpvMJtVPo7RYAayLXwfl9WwJAW
   CBeRBJYjQj6Twpr+0gv8lbXV59+eTw1aD2SSjF9T/REKP9q4g09vPXm5g
   3KKsw/rt/v3C+QYw64NIGBj0jOJe2cVrxD5GqwxQX3fiV49GiBBf4m6XK
   A==;
X-CSE-ConnectionGUID: 0FE6vdG/T5uKmyKPY2ez7w==
X-CSE-MsgGUID: 39OdMBcDRv2q2jMcg978fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79136504"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79136504"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 02:46:43 -0700
X-CSE-ConnectionGUID: ip2/MjhcTUuJNQMcg4T7tQ==
X-CSE-MsgGUID: kuSeffbEQGS8TJzx19OtEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241991985"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 May 2026 02:46:42 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLeGc-000000000rR-3zrj;
	Sat, 09 May 2026 09:46:38 +0000
Date: Sat, 09 May 2026 17:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5]
 drivers/gpu/drm/msm/dsi/dsi_host.c:541: warning: Function parameter or struct
 member 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'
Message-ID: <202605091744.tQOIwqAG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Pengyu,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5efa9ec22e39d81237e6b9cefecfef3d547378ed
commit: 06a6e2d3c57b9c96e5f33a4b1c5661b7831950dc [5/5] drm/msm/dsi: fix pclk rate calculation for bonded dsi
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260509/202605091744.tQOIwqAG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091744.tQOIwqAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091744.tQOIwqAG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dsi/dsi_host.c:541: warning: Function parameter or struct member 'is_bonded_dsi' not described in 'dsi_adjust_pclk_for_compression'


vim +541 drivers/gpu/drm/msm/dsi/dsi_host.c

c4d8cfe516dc54 Sibi Sankar      2018-05-29  517  
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  518  /**
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  519   * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  520   * @mode: The selected mode for the DSI output
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  521   * @dsc: DRM DSC configuration for this DSI output
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  522   *
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  523   * Adjust the pclk rate by calculating a new hdisplay proportional to
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  524   * the compression ratio such that:
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  525   *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  526   *
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  527   * Porches do not need to be adjusted:
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  528   * - For VIDEO mode they are not compressed by DSC and are passed as is.
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  529   * - For CMD mode there are no actual porches. Instead these fields
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  530   *   currently represent the overhead to the image data transfer. As such, they
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  531   *   are calculated for the final mode parameters (after the compression) and
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  532   *   are not to be adjusted too.
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  533   *
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  534   *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  535   *  transfer time and data overhead as a starting point of the calculations.
3b56d27ba1578c Dmitry Baryshkov 2024-02-08  536   */
06a6e2d3c57b9c Pengyu Luo       2026-03-07  537  static unsigned long
06a6e2d3c57b9c Pengyu Luo       2026-03-07  538  dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
06a6e2d3c57b9c Pengyu Luo       2026-03-07  539  				const struct drm_dsc_config *dsc,
06a6e2d3c57b9c Pengyu Luo       2026-03-07  540  				bool is_bonded_dsi)
7c9e4a554d4a71 Jessica Zhang    2023-06-09 @541  {
06a6e2d3c57b9c Pengyu Luo       2026-03-07  542  	int hdisplay, new_hdisplay, new_htotal;
06a6e2d3c57b9c Pengyu Luo       2026-03-07  543  
06a6e2d3c57b9c Pengyu Luo       2026-03-07  544  	/*
06a6e2d3c57b9c Pengyu Luo       2026-03-07  545  	 * For bonded DSI, split hdisplay across two links and round up each
06a6e2d3c57b9c Pengyu Luo       2026-03-07  546  	 * half separately, passing the full hdisplay would only round up once.
06a6e2d3c57b9c Pengyu Luo       2026-03-07  547  	 * This also aligns with the hdisplay we program later in
06a6e2d3c57b9c Pengyu Luo       2026-03-07  548  	 * dsi_timing_setup()
06a6e2d3c57b9c Pengyu Luo       2026-03-07  549  	 */
06a6e2d3c57b9c Pengyu Luo       2026-03-07  550  	hdisplay = mode->hdisplay;
06a6e2d3c57b9c Pengyu Luo       2026-03-07  551  	if (is_bonded_dsi)
06a6e2d3c57b9c Pengyu Luo       2026-03-07  552  		hdisplay /= 2;
06a6e2d3c57b9c Pengyu Luo       2026-03-07  553  
06a6e2d3c57b9c Pengyu Luo       2026-03-07  554  	new_hdisplay = DIV_ROUND_UP(hdisplay * drm_dsc_get_bpp_int(dsc),
7c9e4a554d4a71 Jessica Zhang    2023-06-09  555  				    dsc->bits_per_component * 3);
7c9e4a554d4a71 Jessica Zhang    2023-06-09  556  
06a6e2d3c57b9c Pengyu Luo       2026-03-07  557  	if (is_bonded_dsi)
06a6e2d3c57b9c Pengyu Luo       2026-03-07  558  		new_hdisplay *= 2;
06a6e2d3c57b9c Pengyu Luo       2026-03-07  559  
06a6e2d3c57b9c Pengyu Luo       2026-03-07  560  	new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
7c9e4a554d4a71 Jessica Zhang    2023-06-09  561  
24436a540d16ca Jonathan Marek   2024-10-07  562  	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
7c9e4a554d4a71 Jessica Zhang    2023-06-09  563  }
7c9e4a554d4a71 Jessica Zhang    2023-06-09  564  

:::::: The code at line 541 was first introduced by commit
:::::: 7c9e4a554d4a712bc6891a49d52b1ec030ed5b4a drm/msm/dsi: Reduce pclk rate for compression

:::::: TO: Jessica Zhang <quic_jesszhan@quicinc.com>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
