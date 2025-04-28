Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08D61D90A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889590; cv=none; b=Xh+c4nAvv03bojxJt1juCdEF2F6a/OT0q6Jq9m0RYrDAMRJGYo5P8BdhPAwkhdl0+MUb0lsIBI9lEyJtwJWuSjCNB9ZbMuNpKW/04SSVYcIvseKlz3XyvEDFTG1M8fU+Gzpy/jEZ6JzsQ8wQJg1cTb31JcPW5d3zNUUlW8aK2no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889590; c=relaxed/simple;
	bh=JGFsuXEaBArvdOwz2LsN39fAihdxRl9xDbq+kwZJ3as=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LoBBe1hZzdE2IiQtLeNDok0l0fBKD8xZhAtX4jw5I9Yw2oGfsQZ9kVXdR1RVMFWrb0EWtb1GsgKdxg+p68s3veMi24MgtFoktZ5m33+UP/aYFYxxrP6GpgVCnQPvOL2Ym58hi/CoDu6WnLpgPMYJ0LiziAs7ayHnBamm4nL7t1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXY8Dm4q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXY8Dm4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889588; x=1777425588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGFsuXEaBArvdOwz2LsN39fAihdxRl9xDbq+kwZJ3as=;
  b=XXY8Dm4qa/pzR+sCNoVsseP1K+cI8KN4avIlRV7GvYgFATtm/kfzoOKV
   5K43vE5i5BrLVu4ys2qSPgIxs99Tv6Dd85GKJ/+B+FDKIB51t7Qb+HgR6
   qTbKSHogdGDbWBZql//fZ+McJI6yIbvUwrHVKEq6j1f7u/vlPEO4H2HPO
   uvxJAn3w3lnWobN5ztP+N4cPaFRnDw7Khz+SnxGlDajq+tnJtCmjRUHvI
   RX1/Z8rcxICKbDoBMMT87l76j25ONG3EzBChMOnCL+pxX/AL0bjnctIYX
   K017ojOJDA2xlnPPA9/tVXe2DigVeuyuOr7yZcKZIbl5ayiZ9hfqXypIP
   Q==;
X-CSE-ConnectionGUID: tEDmUMuoQtuyNCvwTibWig==
X-CSE-MsgGUID: coapGsC/Th6dEZndvtQdwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165298"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: Wvm6+M9nSTuoTLNek6j+8Q==
X-CSE-MsgGUID: 3yLrhXVaQoOvK+ce3ZJ6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775842"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdA-00006N-0v;
	Tue, 29 Apr 2025 01:19:28 +0000
Date: Tue, 29 Apr 2025 06:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 37/37]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:4373:6: warning: no previous prototype
 for function 'mtk_dp_hdcp_atomic_check'
Message-ID: <202504290656.kQuDoFZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f02706a87d01b3276dd25abaab122a7c8adbc6ac
commit: 0d43a2e82b935a7486ba1c21669596ff0a59ac27 [37/37] CHROMIUM: drm/mediatek: refine mst control flow
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250429/202504290656.kQuDoFZM-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290656.kQuDoFZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290656.kQuDoFZM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_dp_v2.c:8:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2565:6: warning: no previous prototype for function 'mtk_dp_dsc_support_v2' [-Wmissing-prototypes]
    2565 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2565:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2565 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2573:6: warning: no previous prototype for function 'mtk_dp_dsc_enable_v2' [-Wmissing-prototypes]
    2573 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2573:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2573 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2603:6: warning: no previous prototype for function 'mtk_dp_dsc_disable_v2' [-Wmissing-prototypes]
    2603 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2603:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2603 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2633:6: warning: no previous prototype for function 'mtk_dp_set_chunk_size_v2' [-Wmissing-prototypes]
    2633 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2633:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2633 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2652:6: warning: no previous prototype for function 'mtk_dp_dsc_set_param_v2' [-Wmissing-prototypes]
    2652 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2652:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2652 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2678:6: warning: no previous prototype for function 'mtk_dp_dsc_set_pps_v2' [-Wmissing-prototypes]
    2678 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2678:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2678 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2698:6: warning: no previous prototype for function 'mtk_dp_dsc_pps_send_v2' [-Wmissing-prototypes]
    2698 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2698:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2698 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2704:6: warning: no previous prototype for function 'mtk_dp_dsc_parse_pps_param_v2' [-Wmissing-prototypes]
    2704 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2704:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2704 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3694:5: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3694 |         u8 data;
         |            ^
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:4373:6: warning: no previous prototype for function 'mtk_dp_hdcp_atomic_check' [-Wmissing-prototypes]
    4373 | void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, enum dp_encoder_id id,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4373:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4373 | void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, enum dp_encoder_id id,
         | ^
         | static 
   14 warnings generated.


vim +/mtk_dp_hdcp_atomic_check +4373 drivers/gpu/drm/mediatek/mtk_dp_v2.c

218314d73d3257 mac.shen 2025-01-27  4372  
56c7482df8dc4a Mac Shen 2025-02-02 @4373  void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, enum dp_encoder_id id,
56c7482df8dc4a Mac Shen 2025-02-02  4374  			      struct drm_connector_state *state)
218314d73d3257 mac.shen 2025-01-27  4375  {
56c7482df8dc4a Mac Shen 2025-02-02  4376  	bool need_hdcp;
218314d73d3257 mac.shen 2025-01-27  4377  
56c7482df8dc4a Mac Shen 2025-02-02  4378  	mutex_lock(&mtk_dp->hdcp_mutex);
56c7482df8dc4a Mac Shen 2025-02-02  4379  
56c7482df8dc4a Mac Shen 2025-02-02  4380  	need_hdcp = mtk_dp_hdcp_need_hdcp(mtk_dp);
218314d73d3257 mac.shen 2025-01-27  4381  
0d43a2e82b935a Mac Shen 2025-03-04  4382  	if (!need_hdcp)
218314d73d3257 mac.shen 2025-01-27  4383  		mtk_dp_hdcp_disable(mtk_dp);
218314d73d3257 mac.shen 2025-01-27  4384  
56c7482df8dc4a Mac Shen 2025-02-02  4385  	if (need_hdcp)
218314d73d3257 mac.shen 2025-01-27  4386  		mtk_dp_hdcp_enable(mtk_dp);
56c7482df8dc4a Mac Shen 2025-02-02  4387  
56c7482df8dc4a Mac Shen 2025-02-02  4388  	mutex_unlock(&mtk_dp->hdcp_mutex);
218314d73d3257 mac.shen 2025-01-27  4389  }
218314d73d3257 mac.shen 2025-01-27  4390  

:::::: The code at line 4373 was first introduced by commit
:::::: 56c7482df8dc4a22d074197a9e4313cc79b734a3 CHROMIUM: drm/mediatek: Add support for MST HDCP

:::::: TO: Mac Shen <mac.shen@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
