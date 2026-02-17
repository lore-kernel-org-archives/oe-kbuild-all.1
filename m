Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCFE205E26
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 23:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371323; cv=none; b=nYwxbjSVNMFXa/najHJprwZKHf//WYAQCLrisls7gCBf6/gkNOQylNhEVpEYXipMatMXcf+ol/TYYwqjwSPQWCCLkWj8f+vILysPgINIgaAjcL8bqTLmPJUiZD5r1M/zMpcQeT5MREqoMvpbC4jk0YeFfQKW0NKw9fru014XFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371323; c=relaxed/simple;
	bh=qzbjuGf8KGxile7C41TLsujVWhUXZqbJCLnHd+zq5rw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FMNqCBZwzf2Me8IsJNE2SObyaSrgjth1cNrfg3FsXC9oRjtHAaB5njNp470CJYLIOyZEIwyvpkJxvu7ie6c8u+yI7ivcWTabniARJmfM2DUIoWb8339RbIwQRFOmG2cCmqJZeqZNAao+4LpZVupi/vrA4wsB35v7rNfgHjh6mzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWlA1wn7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWlA1wn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771371322; x=1802907322;
  h=date:from:to:cc:subject:message-id;
  bh=qzbjuGf8KGxile7C41TLsujVWhUXZqbJCLnHd+zq5rw=;
  b=VWlA1wn7R+jIJzh/y1PHBfhzenYlZta6ZkpIMv9EBqd6MsiAm+uT5qMt
   SqtCof0Yvq5gQhsz7iwgxQrizXDoSxtFhW9o7jzbBfEAM8E2hBaKxAt2j
   lLpYatdLgge2fjjGvkgnKTeIBXSQpsfuv1GDJt4So73RN6opI6yi0jOIW
   +i6/17GKncgj/OU1k/klJLKnZo4H6R2JrFX8WQbxX0N36EHQEhU2pF5qh
   O84pxVSWg67ho3ib1ivYruAtWqF4/R0Jd62mM5y3fmeeWlv+Pm1sXRn+F
   aAQaBC9BDAm52KZGs9skGpvDz/YnrDnTnlYUcaxH1MbOfvS0dv2bL9g4t
   g==;
X-CSE-ConnectionGUID: D5A2/Z9ARhuR1rAiCSNRcA==
X-CSE-MsgGUID: DJNFvAeWR+y8qtTtRvfeYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83814987"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83814987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 15:35:21 -0800
X-CSE-ConnectionGUID: zh4ghPOKSzyNhK7QVyjREw==
X-CSE-MsgGUID: ZGh2j0TgTYmiHavmtqpJgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="217920768"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2026 15:35:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsUb7-000000011pE-3bhu;
	Tue, 17 Feb 2026 23:35:17 +0000
Date: Wed, 18 Feb 2026 07:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 29/29]
 drivers/gpu/drm/mediatek/mtk_crtc.c:1636:38: error: 'struct mtk_crtc' has no
 member named 'cmdq_client'
Message-ID: <202602180735.oBsge6nb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6c509938997c816f735861adbb9f3ee5fc429d32
commit: cfe9fe44771fdec6b88e7dbac8e80abf4c1c9d50 [29/29] CHROMIUM: drm/mediatek: fix the issue: black line appears when suspend/resume
config: arm64-randconfig-003-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180735.oBsge6nb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180735.oBsge6nb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180735.oBsge6nb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_update_srt_state':
   drivers/gpu/drm/mediatek/mtk_crtc.c:598:32: warning: variable 'state' set but not used [-Wunused-but-set-variable]
     598 |         struct mtk_crtc_state *state;
         |                                ^~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_atomic_flush':
>> drivers/gpu/drm/mediatek/mtk_crtc.c:1636:38: error: 'struct mtk_crtc' has no member named 'cmdq_client'
    1636 |                         if (!mtk_crtc->cmdq_client.chan)
         |                                      ^~
   drivers/gpu/drm/mediatek/mtk_crtc.c: At top level:
   drivers/gpu/drm/mediatek/mtk_crtc.c:558:13: warning: 'mtk_crtc_post_update_hrt_state' defined but not used [-Wunused-function]
     558 | static void mtk_crtc_post_update_hrt_state(struct mtk_crtc *mtk_crtc)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1636 drivers/gpu/drm/mediatek/mtk_crtc.c

  1625	
  1626	static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
  1627					  struct drm_atomic_state *state)
  1628	{
  1629		struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
  1630		int i;
  1631	
  1632		if (crtc->state->color_mgmt_changed)
  1633			for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
  1634				mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
  1635	
> 1636				if (!mtk_crtc->cmdq_client.chan)
  1637					mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state, NULL);
  1638			}
  1639	
  1640		mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
  1641	}
  1642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
