Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5A17CA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 07:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694243998; x=1725779998;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jYoUiKLdigLkLOIUjdCpZFyy+xV1zipi4jXf+up/cdo=;
  b=NpUPVfLIvK/kGBviCsWW2VgxwGHutbglLCq6U3YS5zTZzzmMPtseCIZt
   gLNTy5W7z0/nH1SNXlyo/Y8JEKQV3afjYUyTwF+S8spZVyj/AOf4Ds+0D
   f+YEcZOmyUQsl2QrVbb1jG2x3Dp+QjE3ErVLVIyeSN55thzIFTuiag7nH
   tLc4X1jqNBm0JZwqDJP/x58cwgeGCU49r4Ke61OhvsJihgYpDPQI8AoTC
   j63KqOHCPr/LHpjUm9vffyj/28RERh4pCo1nIi3KwyKBRBnU4nEoltE8U
   DXCZ4wXOkQ9eDO4dVhP3Xwy+/HqM4oEt1hri1UACSbjIUNpivip2zL1op
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357263607"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="357263607"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 00:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="885910892"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="885910892"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 00:19:31 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qesFw-00034N-09;
	Sat, 09 Sep 2023 07:19:48 +0000
Date: Sat, 9 Sep 2023 15:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 31/88]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:1552:13: warning: unused variable
 'ret'
Message-ID: <202309091543.pPbqfcsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   dcd62291d3f1ba328303b1617495fa4542117fc1
commit: 0fe7df79bd6f886a94832c8742f2e3df7e9080bb [31/88] drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link
config: x86_64-randconfig-r024-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091543.pPbqfcsT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091543.pPbqfcsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091543.pPbqfcsT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1552:13: warning: unused variable 'ret' [-Wunused-variable]
    1552 |         int ret;
         |             ^~~
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1551:28: warning: unused variable 'aux' [-Wunused-variable]
    1551 |         struct drm_dp_aux *aux = &nv_connector->aux;
         |                            ^~~
   drivers/gpu/drm/nouveau/dispnv50/disp.c: At top level:
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2608:1: warning: no previous prototype for 'nv50_display_read_hw_state' [-Wmissing-prototypes]
    2608 | nv50_display_read_hw_state(struct nouveau_drm *drm)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ret +1552 drivers/gpu/drm/nouveau/dispnv50/disp.c

4cbb0f8d2b06c7 drivers/gpu/drm/nouveau/nvd0_display.c  Ben Skeggs   2012-03-12  1535  
6eca310e8924ab drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2021-05-14  1536  /* TODO: Should we extend this to PWM-only backlights?
6eca310e8924ab drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2021-05-14  1537   * As well, should we add a DRM helper for waiting for the backlight to acknowledge
6eca310e8924ab drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2021-05-14  1538   * the panel backlight has been shut off? Intel doesn't seem to do this, and uses a
6eca310e8924ab drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2021-05-14  1539   * fixed time delay from the vbios…
6eca310e8924ab drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2021-05-14  1540   */
e84a35a8054397 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs   2014-06-05  1541  static void
fa9f9489d9f9d7 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2020-11-13  1542  nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
e84a35a8054397 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs   2014-06-05  1543  {
e84a35a8054397 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs   2014-06-05  1544  	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
e84a35a8054397 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs   2014-06-05  1545  	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
cd5609f715aa3a drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2020-11-13  1546  	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
98c9644f3363d3 drivers/gpu/drm/nouveau/dispnv50/disp.c Randy Dunlap 2021-07-14  1547  #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
98c9644f3363d3 drivers/gpu/drm/nouveau/dispnv50/disp.c Randy Dunlap 2021-07-14  1548  	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
6eca310e8924ab drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2021-05-14  1549  	struct nouveau_backlight *backlight = nv_connector->backlight;
98c9644f3363d3 drivers/gpu/drm/nouveau/dispnv50/disp.c Randy Dunlap 2021-07-14  1550  #endif
4944245cebb9da drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2020-08-26 @1551  	struct drm_dp_aux *aux = &nv_connector->aux;
6eca310e8924ab drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul   2021-05-14 @1552  	int ret;
839ca903f12ef8 drivers/gpu/drm/nouveau/nv50_display.c  Ben Skeggs   2016-11-04  1553  

:::::: The code at line 1552 was first introduced by commit
:::::: 6eca310e8924ab98c73b81dfd39e7dd553ceddfd drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Lyude Paul <lyude@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
