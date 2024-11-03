Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38412C2FB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 22:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730672275; cv=none; b=qLDXyfWrWEoud0mRSOq2YxcwmTYLvW+WtYjQQkCFcg+AT418+yBw5jO2FZ2wXTtBG1uG36KekUHt/43NPulLltXWJgRNNl2+QCiWgMSao2rsUHjKoH+FDmj8UQ9DtEXPBKVHRwIBc6z7FXjRjUEN9NvfpP0/5ZM+WyINb8laUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730672275; c=relaxed/simple;
	bh=VOB1OIK29K9TiaJiab9XTOI61mofBoUutAbzIYNP7sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mIkUroSbNy7kwD98rESCk2zj5xtSWUKmObuQ5HXsvFClcS2LFPK3Rll4VUdWaKtSABdcxQAYq4U4UYRkq+QECMrXKe3f0N+hOBdHHbtGQ2o4QsshPhBMSUdgg3wBSHh7Qrlw6brdcP4jWdJBs11aQFqmPxjc5LYDjD8AvcJhbJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrzZ8g3o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrzZ8g3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730672274; x=1762208274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOB1OIK29K9TiaJiab9XTOI61mofBoUutAbzIYNP7sQ=;
  b=mrzZ8g3ooNsFVCqmB9h/ZtXDNflLAr9XJc3PX8s+BAMuQ+67VYEh7zAD
   BZSwQRLx1RYVTpsTUxVWb0xKg+Zm4PVgqfHz/NvBpr0x29EBO7e5iyhW1
   y3ntQgUW553FjvvdrBCoMstNjzsbZ/AG1etrkXu2iqfLZUqkgfxNuV2jU
   lRf+NSyisUCdMGJhJEgZwnquLoMNb8+VCBPxB6S1PoKKeK+O4tW4oWmjc
   JbCq6Wjx4K81pOzNisJZc5c6bjQVjVlaZAl4Oit1WmnFacB1ThkFicbxz
   UhUJtE0s8LDI9WvNHcf0DV3f4HH32lJ9+JBCLQp4WbbIN35Q9RoV5bwRk
   Q==;
X-CSE-ConnectionGUID: yiVBJ+/cS1eN0nHL6L1tCg==
X-CSE-MsgGUID: o1I1Xf6WRyuprmyWaWaaQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52922102"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52922102"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 14:17:53 -0800
X-CSE-ConnectionGUID: iA0yg6pVRbCVToZebeUJ0w==
X-CSE-MsgGUID: sAeLMV34QsSqRg6c06YMlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="83574269"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Nov 2024 14:17:51 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7iur-000kFN-28;
	Sun, 03 Nov 2024 22:17:49 +0000
Date: Mon, 4 Nov 2024 06:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [linux-next:master 7685/8858]
 drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: error: '_preemphasis' directive
 output may be truncated writing 12 bytes into a region of size between 4 and
 14
Message-ID: <202411040654.iDf1aTGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: 28edaacb821c69241f6c0be6bbd29f7145f1b44f [7685/8858] drm: zynqmp_dp: Add debugfs interface for compliance testing
config: arm64-randconfig-r111-20241103 (https://download.01.org/0day-ci/archive/20241104/202411040654.iDf1aTGd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241104/202411040654.iDf1aTGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040654.iDf1aTGd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: error: '_preemphasis' directive output may be truncated writing 12 bytes into a region of size between 4 and 14 [-Werror=format-truncation=]
    2312 |                 snprintf(name, sizeof(name), fmt, i);
         |                                              ^~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:17: note: 'snprintf' output between 18 and 28 bytes into a destination of size 19
    2312 |                 snprintf(name, sizeof(name), fmt, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2317:53: error: '_swing' directive output may be truncated writing 6 bytes into a region of size between 4 and 14 [-Werror=format-truncation=]
    2317 |                 snprintf(name, sizeof(name), "lane%d_swing", i);
         |                                                     ^~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:2317:17: note: 'snprintf' output between 12 and 22 bytes into a destination of size 19
    2317 |                 snprintf(name, sizeof(name), "lane%d_swing", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/_preemphasis +2312 drivers/gpu/drm/xlnx/zynqmp_dp.c

  2278	
  2279	DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_ignore_hpd, zynqmp_dp_ignore_hpd_get,
  2280				 zynqmp_dp_ignore_hpd_set, "%llu\n");
  2281	
  2282	static void zynqmp_dp_bridge_debugfs_init(struct drm_bridge *bridge,
  2283						  struct dentry *root)
  2284	{
  2285		struct zynqmp_dp *dp = bridge_to_dp(bridge);
  2286		struct dentry *test;
  2287		int i;
  2288	
  2289		dp->test.bw_code = DP_LINK_BW_5_4;
  2290		dp->test.link_cnt = dp->num_lanes;
  2291	
  2292		test = debugfs_create_dir("test", root);
  2293	#define CREATE_FILE(name) \
  2294		debugfs_create_file(#name, 0600, test, dp, &fops_zynqmp_dp_##name)
  2295		CREATE_FILE(pattern);
  2296		CREATE_FILE(enhanced);
  2297		CREATE_FILE(downspread);
  2298		CREATE_FILE(active);
  2299		CREATE_FILE(custom);
  2300		CREATE_FILE(rate);
  2301		CREATE_FILE(lanes);
  2302		CREATE_FILE(ignore_aux_errors);
  2303		CREATE_FILE(ignore_hpd);
  2304	
  2305		for (i = 0; i < dp->num_lanes; i++) {
  2306			static const char fmt[] = "lane%d_preemphasis";
  2307			char name[sizeof(fmt)];
  2308	
  2309			dp->debugfs_train_set[i].dp = dp;
  2310			dp->debugfs_train_set[i].lane = i;
  2311	
> 2312			snprintf(name, sizeof(name), fmt, i);
  2313			debugfs_create_file(name, 0600, test,
  2314					    &dp->debugfs_train_set[i],
  2315					    &fops_zynqmp_dp_preemphasis);
  2316	
> 2317			snprintf(name, sizeof(name), "lane%d_swing", i);
  2318			debugfs_create_file(name, 0600, test,
  2319					    &dp->debugfs_train_set[i],
  2320					    &fops_zynqmp_dp_swing);
  2321		}
  2322	}
  2323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
