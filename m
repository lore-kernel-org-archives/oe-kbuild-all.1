Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C3B1D5ABF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889589; cv=none; b=HP/rZdFmHxK7R9UbeBldCPMb8e34gDMdp0YMmqXuKvZa1aaegZbwenxf6SW/CklFHdSiGA4j9XznGvMJ95fBXAu3hj35M0qZ79ow7AG4jG/LUxmM/6MPmoTS91NLfP6VvyKl4keVgDvpZjsTMdujHLe++FCUPquMlVAMYZIh3jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889589; c=relaxed/simple;
	bh=A3d3Vbu9zF8TY9MkfsxDuvl1Y5b6cUfKc/SS9Vibhi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQKMaxxznSRGLZ87u9jcsaqp3WbD47qDXdWQvYWgpe4HCHg6vpTkra8CwRYdDD2fwvnearEZFxYPFaJ96V6eiY1aU50+klJM60BSUH/4TSZcAsD25cHRf4SPbvXqQ6lBY2Jnh4Vnv3q2P59UrkSjm/oogWF/TlTK/pA1ukpbhbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnkhrCZb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnkhrCZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889587; x=1777425587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3d3Vbu9zF8TY9MkfsxDuvl1Y5b6cUfKc/SS9Vibhi4=;
  b=ZnkhrCZbXnOo0w9kFu2HNeN6IvT+LkW5fc+p9SI+1p4q9UjGIDrbxlEG
   xywx9pok24lbHBVyP2puWqLOe5Wa9335NKvUcDL5EupzPjBnEuaLkDZjm
   nv820i5Ar/adEyVXSO7cIjiB0RxbtsrEjKmmUJ7dKwcIeRq+WQiic7CEI
   B4giaK1TvsdrJg7tddHG64MN8jrP3+lcgrAbLTn8loCLGU+ebTME4JBp7
   OnZLB+1vDW//Odf6O8cfX//DCI+BbghUbzCQzCZdRM3Bl9r4PDevaHaF/
   pg5ROjzm5qS2oq1RqMCrnKAnaJbadox8XAGx4GiuYCSAXpkVbHEgLfbZz
   A==;
X-CSE-ConnectionGUID: cxVVypL0QXC+n8JAmu9k6w==
X-CSE-MsgGUID: PrlwPN5ATpO7mvLR4sm3mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165294"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165294"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: NOXwb+JHT52Wxk9JNxXBNw==
X-CSE-MsgGUID: drUk0tXdTMWs4HNyjpYEtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775841"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdA-00006K-0q;
	Tue, 29 Apr 2025 01:19:28 +0000
Date: Tue, 29 Apr 2025 05:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 37/37]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:4373:6: warning: no previous prototype
 for 'mtk_dp_hdcp_atomic_check'
Message-ID: <202504290535.OQy7RicU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   d43279d93f3193ddf5b9466de554fdd82a8c6028
commit: 0d43a2e82b935a7486ba1c21669596ff0a59ac27 [37/37] CHROMIUM: drm/mediatek: refine mst control flow
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250429/202504290535.OQy7RicU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290535.OQy7RicU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290535.OQy7RicU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2565:6: warning: no previous prototype for 'mtk_dp_dsc_support_v2' [-Wmissing-prototypes]
    2565 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2573:6: warning: no previous prototype for 'mtk_dp_dsc_enable_v2' [-Wmissing-prototypes]
    2573 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2603:6: warning: no previous prototype for 'mtk_dp_dsc_disable_v2' [-Wmissing-prototypes]
    2603 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2633:6: warning: no previous prototype for 'mtk_dp_set_chunk_size_v2' [-Wmissing-prototypes]
    2633 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2652:6: warning: no previous prototype for 'mtk_dp_dsc_set_param_v2' [-Wmissing-prototypes]
    2652 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2678:6: warning: no previous prototype for 'mtk_dp_dsc_set_pps_v2' [-Wmissing-prototypes]
    2678 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2698:6: warning: no previous prototype for 'mtk_dp_dsc_pps_send_v2' [-Wmissing-prototypes]
    2698 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2704:6: warning: no previous prototype for 'mtk_dp_dsc_parse_pps_param_v2' [-Wmissing-prototypes]
    2704 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: In function 'mtk_dp_video_config_v2':
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3694:12: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3694 |         u8 data;
         |            ^~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: At top level:
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:4373:6: warning: no previous prototype for 'mtk_dp_hdcp_atomic_check' [-Wmissing-prototypes]
    4373 | void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, enum dp_encoder_id id,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4675:18: warning: initialized field overwritten [-Woverride-init]
    4675 |         .reset = drm_atomic_helper_connector_reset,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4675:18: note: (near initialization for 'mtk_dp_con_funcs.reset')


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
