Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF2E8836
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 02:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748313317; cv=none; b=rq4VpKvBWw9L12rb7SK1Fp58pMWaG/L9efdAdx3pGsOdPI854ZImRUhZYvGh50iZzqEi+z6eCmREK1sIbwUQeLAyq4MHhup9HhjGOxtqaah+7hH/s/DHgLDjvki/0H18hDnWodUgIz8Ea6+o/ayeDmGVy+yjQnZf11NN2gqQZ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748313317; c=relaxed/simple;
	bh=MBGYmlGffDMhsJzjkzhOy3DpKl6mOcjJxSL+dexUAEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcY5xIw4bHm9E7mnHeWSybkuTJo1UEiMkBo+wgn8Z64mK7QZTbmRIgdJrGIQLTRbuiB9VqEN/Zs7ZCMt01BmR0oY1eXIixA217tPDHzsYtg6Swm9MMk4xW5c7nncnriA6sbRm7A7iSQznQgTxaRmOXd//lml4pWlAvabzgnFC58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8k85GAv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8k85GAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748313315; x=1779849315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBGYmlGffDMhsJzjkzhOy3DpKl6mOcjJxSL+dexUAEE=;
  b=M8k85GAvcb1GY2ZIpK08nHt1Ko4J6Iz7GoZYFxlUB6i93/ssWtT1brgJ
   2ACK3kJuriXDuVjCnzHN80+Y8sDXhPPMw8D4/MiDbVNsxd6BqncP3t+QF
   J3R4O4R3pr4PTOLmPdhP6bO3dUrWpAmO0UZo9MHdrJNIZhOdv8/pny40A
   kdPVyACIL7lYqaUwT8nE2iGjBkW7ZOnQvGZSwB2VMQNUg89iJ7jEjQ6Ww
   XclZDkCF/Eax9wtEvuBK71LHcgC+2VDXBVlmsX5pD2M4PgwJ7tiE4MN11
   BYrY1gkALEASWZw2aX9hbDt9BvpEdtSIKik/miW3D7lU3vVidPDmYaRQG
   g==;
X-CSE-ConnectionGUID: bTb6Vc16Taiin2KttGdJWQ==
X-CSE-MsgGUID: RvZY+eFzTYSExmr5vPk8CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67697970"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="67697970"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 19:35:15 -0700
X-CSE-ConnectionGUID: y1IpXeKTScSkRiwY5Tdr4A==
X-CSE-MsgGUID: GSHBrd7LRUeSVwjKje3Jeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143046653"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2025 19:35:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJk9n-000SpM-1i;
	Tue, 27 May 2025 02:35:11 +0000
Date: Tue, 27 May 2025 10:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/gpu/drm/mediatek/mtk_dvo.c:623:6: warning: no previous prototype for
 function 'mtk_dvo_get_hrt_bw_by_datarate'
Message-ID: <202505271046.mStEBqKv-lkp@intel.com>
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
commit: 073720863458cfc81c898a81e68932cd296b3e37 [133/133] CHROMIUM: drm/mediatek: add display MMDVFS and MMQoS Support
config: arm-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271046.mStEBqKv-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271046.mStEBqKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271046.mStEBqKv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dvo.c:609:6: warning: no previous prototype for function 'mtk_dvo_start' [-Wmissing-prototypes]
     609 | void mtk_dvo_start(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:609:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     609 | void mtk_dvo_start(struct device *dev)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dvo.c:616:6: warning: no previous prototype for function 'mtk_dvo_stop' [-Wmissing-prototypes]
     616 | void mtk_dvo_stop(struct device *dev)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:616:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     616 | void mtk_dvo_stop(struct device *dev)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_dvo.c:623:6: warning: no previous prototype for function 'mtk_dvo_get_hrt_bw_by_datarate' [-Wmissing-prototypes]
     623 | void mtk_dvo_get_hrt_bw_by_datarate(struct device *dev, unsigned int *bw_base)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dvo.c:623:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     623 | void mtk_dvo_get_hrt_bw_by_datarate(struct device *dev, unsigned int *bw_base)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/gpu/drm/mediatek/mtk_crtc.c:661:25: warning: variable 'state' set but not used [-Wunused-but-set-variable]
     661 |         struct mtk_crtc_state *state;
         |                                ^
   drivers/gpu/drm/mediatek/mtk_crtc.c:621:13: warning: unused function 'mtk_crtc_post_update_hrt_state' [-Wunused-function]
     621 | static void mtk_crtc_post_update_hrt_state(struct mtk_crtc *mtk_crtc)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/mtk_dvo_get_hrt_bw_by_datarate +623 drivers/gpu/drm/mediatek/mtk_dvo.c

   622	
 > 623	void mtk_dvo_get_hrt_bw_by_datarate(struct device *dev, unsigned int *bw_base)
   624	{
   625		struct mtk_dvo *dvo = dev_get_drvdata(dev);
   626		int htotal, vtotal, vrefresh;
   627	
   628		htotal = dvo->mode.htotal;
   629		vtotal = dvo->mode.vtotal;
   630		vrefresh = drm_mode_vrefresh(&dvo->mode);
   631	
   632		*bw_base = (unsigned int)div_u64((unsigned long long)vtotal * htotal * vrefresh * 4,
   633						 1000000);
   634	}
   635	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
