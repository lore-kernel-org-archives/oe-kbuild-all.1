Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223CC17D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 01:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748310190; cv=none; b=YKay4XDqjOZE+YB+38HI+tpUkTl8KEVqclACVp7vh1SS79MoHRPRZXtRt3pp8H+ewNekC5znv0CHFV4f+rl/8T5xefEtCkVEigaoEK6MJCAR0GOffD5LaIohB1x378qNbZikeRLk+r5vsyO5yMpT/fy3CqbT6us3M4VLnMz0QsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748310190; c=relaxed/simple;
	bh=KUTwONWq6gf+MHdl8vqmdVJtINBiTk7Zf85C+MhZJug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqdwC+oa0IHedumT0GrXNKTiKeIhBlmyvXJHuc5oAk+6d13Vr8ZhP6KVhWvm3mr7pGDwgH/vewJ8Z740skEVAgg0/2bFpXBXWwpmdqUx7gO7F+2YUpMI3SE2yTeJlqqqyETXYi1UF0xoU9KAlJdxjX6cZJ4aDvwqQNHlUlvLdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHIeI6mE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHIeI6mE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748310189; x=1779846189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUTwONWq6gf+MHdl8vqmdVJtINBiTk7Zf85C+MhZJug=;
  b=HHIeI6mE9bXDU6ftGoANrOEpu908ByXdf0l2TAdKhonfTOMkolgmd47h
   bgc9u7cjHOjuzwKKhCmVAPKUNSMBFBUwTocxBKHq2FaP1EfbJHxWLqC3F
   kUaeA8AVpk4iDz3zqUE7swcog9AQ+JlHLYQMOOaA/txRRf8dcvujf/3fy
   dCw3qlVhQNDHBp115tl618Jw4Ifi+0Mswdc6VMefXPmJB2aaKVi1Os8MB
   61QoIeEroGfuw3LfJmrz4yTR54ZriTJhZidpbHDZrVSq2mCT/jvaF5gf7
   zPYC4kChfqTnMnauoKJgnT4sTgMjMKknt9U3/IdJ9yZWd2tiNpS04dRms
   A==;
X-CSE-ConnectionGUID: Gtbj8HJzTguxBKjv+Md3LQ==
X-CSE-MsgGUID: Qe1dd9EBSjaq6/UQbnSx0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60936489"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="60936489"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 18:43:08 -0700
X-CSE-ConnectionGUID: 11YvZvJvSmG2xHqFadbewA==
X-CSE-MsgGUID: 5mpIlvTUQZKe/KYzBmgh5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="147608323"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2025 18:43:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJjLN-000Snk-0F;
	Tue, 27 May 2025 01:43:05 +0000
Date: Tue, 27 May 2025 09:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm_plat.c:104:6:
 warning: no previous prototype for 'mtk_unprepare_vdec_dvfs'
Message-ID: <202505270951.FxEbkkVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: 317445034101ba60e481a53bb26ac8c303bb776f [133/133] CHROMIUM: mediatek: decoder: add mmdvfs interface to support decoder
config: arm64-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270951.FxEbkkVl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270951.FxEbkkVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270951.FxEbkkVl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm_plat.c:104:6: warning: no previous prototype for 'mtk_unprepare_vdec_dvfs' [-Wmissing-prototypes]
    void mtk_unprepare_vdec_dvfs(struct mtk_vcodec_dec_dvfs *vdec_dvfs)
         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm_plat.c: In function 'vcodec_dvfs_helper_update_freq':
>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm_plat.c:195:17: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
     struct device *dev;
                    ^~~
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm_plat.c: In function 'vcodec_dvfs_helper_remove_freq':
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm_plat.c:211:17: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
     struct device *dev;
                    ^~~


vim +/mtk_unprepare_vdec_dvfs +104 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm_plat.c

   103	
 > 104	void mtk_unprepare_vdec_dvfs(struct mtk_vcodec_dec_dvfs *vdec_dvfs)
   105	{
   106		/* Set to lowest clock before leaving */
   107		mtk_vcodec_dvfs_tbl_deinit(vdec_dvfs);
   108	}
   109	
   110	static void set_vdec_opp(struct mtk_vcodec_dec_dvfs *vdec_dvfs, unsigned long freq)
   111	{
   112		struct device *dev = &vdec_dvfs->sub_dev->plat_dev->dev;
   113		unsigned long freq_64 = freq;
   114		struct dev_pm_opp *opp;
   115		int volt = 0;
   116		int ret;
   117	
   118		opp = dev_pm_opp_find_freq_ceil(dev, &freq_64);
   119		if (IS_ERR(opp)) {
   120			mtk_dvfs_err(dev, "Failed to get dev_pm_opp");
   121			return;
   122		}
   123	
   124		volt = dev_pm_opp_get_voltage(opp);
   125		dev_pm_opp_put(opp);
   126	
   127		if (vdec_dvfs->vdec_mmdvfs_clk) {
   128			mtk_mmdvfs_enable_vcp(true, VCP_PWR_USR_VDEC);
   129			ret = clk_set_rate(vdec_dvfs->vdec_mmdvfs_clk, freq_64);
   130			if (ret)
   131				mtk_dvfs_err(dev, "failed to set mmdvfs rate %lu\n", freq_64);
   132			mtk_mmdvfs_enable_vcp(false, VCP_PWR_USR_VDEC);
   133	
   134			mtk_dvfs_debug(dev, 8, "freq %lu, find_freq %lu", freq, freq_64);
   135		} else if (vdec_dvfs->vdec_reg) {
   136			ret = regulator_set_voltage(vdec_dvfs->vdec_reg, volt, INT_MAX);
   137			if (ret)
   138				mtk_dvfs_err(dev, "failed to set regulator voltage %d\n", volt);
   139	
   140			mtk_dvfs_debug(dev, 8, "freq %lu, voltage %d", freq, volt);
   141		}
   142	}
   143	
   144	static void vcodec_pmqos_get_target_bw(struct mtk_vcodec_dec_dvfs *vdec_dvfs, u64 *target_bw_r,
   145					       u64 *target_bw_w, int id)
   146	{
   147		u64 target_freq = vdec_dvfs->vdec_dvfs_params.target_freq;
   148		u64 total_bw;
   149	
   150		if (list_empty(&vdec_dvfs->vdec_dvfs_inst)) {
   151			*target_bw_r = 0;
   152			*target_bw_w = 0;
   153	
   154			return;
   155		}
   156	
   157		total_bw = (u64)vdec_dvfs->vdec_larb_bw[id].bw_r * target_freq;
   158		*target_bw_r = div_u64(total_bw, vdec_dvfs->vdec_dvfs_params.min_freq);
   159	
   160		total_bw = (u64)vdec_dvfs->vdec_larb_bw[id].bw_w * target_freq;
   161		*target_bw_w = div_u64(total_bw, vdec_dvfs->vdec_dvfs_params.min_freq);
   162	}
   163	
   164	void vcodec_pmqos_helper_update(struct mtk_vcodec_dec_ctx *ctx, int hw_idx)
   165	{
   166		struct mtk_vcodec_dec_dvfs *vdec_dvfs = mtk_vdec_get_dvfs(ctx->dev, hw_idx);
   167		struct device *dev = &vdec_dvfs->sub_dev->plat_dev->dev;
   168		u64 bw_r, bw_w, icc_path_r_id, icc_path_w_id;
   169		u32 i, larb_id, icc_couont = 0;
   170		struct icc_path **icc_path = vdec_dvfs->vdec_qos_req;
   171	
   172		for (i = 0; i < vdec_dvfs->vdec_larb_cnt; i++) {
   173			if (hw_idx != vdec_dvfs->vdec_larb_bw[i].hw_id)
   174				continue;
   175	
   176			larb_id = vdec_dvfs->vdec_larb_bw[i].larb_id;
   177			icc_path_r_id = icc_couont * 2;
   178			icc_path_w_id = icc_couont * 2 + 1;
   179	
   180			vcodec_pmqos_get_target_bw(vdec_dvfs, &bw_r, &bw_w, i);
   181	
   182			mtk_icc_set_bw(icc_path[icc_path_r_id], MBps_to_icc((u32)bw_r), 0);
   183			mtk_icc_set_bw(icc_path[icc_path_w_id], MBps_to_icc((u32)bw_w), 0);
   184	
   185			mtk_dvfs_debug(dev, 5, "hw_id:%d larb %d bw %llu %llu MB/s",
   186				       hw_idx, larb_id, bw_r, bw_w);
   187			icc_couont++;
   188		}
   189	}
   190	EXPORT_SYMBOL_GPL(vcodec_pmqos_helper_update);
   191	
   192	static void vcodec_dvfs_helper_update_freq(struct mtk_vcodec_dec_ctx *ctx, int hw_id)
   193	{
   194		struct mtk_vcodec_dec_dvfs *vdec_dvfs = mtk_vdec_get_dvfs(ctx->dev, hw_id);
 > 195		struct device *dev;
   196	
   197		dev = &vdec_dvfs->sub_dev->plat_dev->dev;
   198		if (!mtk_vcodec_dvfs_update_picinfo(ctx, vdec_dvfs))
   199			return;
   200	
   201		mtk_vcodec_dvfs_update_freq(vdec_dvfs, false);
   202		if (vdec_dvfs->vdec_dvfs_params.target_freq == vdec_dvfs->vdec_dvfs_params.work_freq)
   203			return;
   204	
   205		vdec_dvfs->vdec_dvfs_params.work_freq = vdec_dvfs->vdec_dvfs_params.target_freq;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
