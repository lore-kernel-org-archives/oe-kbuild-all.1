Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B213F294A0A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018145; cv=none; b=eoLlLOIt09sRwwStau4GU/BXn+XmxwdW06IXl+kqIRFOvH3s3xujwrzZC0HrEvFjXDmbGZ6WMXKvp6VhkznLkr53sI6Y22ElNCVpJLOM5W3eDI8q5sAuKqSx6SWWMgIAPvMbjrDUGCdm+Kz7wDrdyfjGxnR+bZq70+EmrTlbNhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018145; c=relaxed/simple;
	bh=AgqQK1qum11oOeKc0WLyZmUkknWfLniKi61gvS6H+LA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3vtJulq/Wbafm19rmRh5IUjmnGoy0MfrTmA/tVR6m6+lrUDRlthJC4scKfTmz6nDLG9bAa11Qzitszds0q0aHciRhqmkceq+7zj2rLgU7zVu8SAulcwiaeRNvIbYWm2xhEUunPljEvfgAgxw9d/DNnKv6eZx6YWmwpv6nv5WFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q92fLaBd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q92fLaBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751018143; x=1782554143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgqQK1qum11oOeKc0WLyZmUkknWfLniKi61gvS6H+LA=;
  b=Q92fLaBdTsgmIAHT0AxkOMlaBQMqiyon5dV2iF4qecYeX/9OrOw9kmCO
   wFzomtOZ/WZloxZVrhewM7tBHIPJOzTpqU5+hmFsupSw80u+vP35E7S/K
   nxaEQKxAi5nX928LboBrKbt8HzO6WJhvwSb8VoFaMWTxp6mevewL2cPp7
   4RR7/UiMAXwlW52a4Ee7OmMPvAJ6fhhyJ78vrEsA7IqsRs9vLbNX9ilpU
   MSK220gZ0AnelpwCOnQuTuu41+709gD8+yEMrmMEoUwP/G/KZ001dJzIb
   ohYpbIXvRgQFbPh+NlGv2ZQCfRIymUbjftELNueHPeizDj1sIuWP27l1n
   Q==;
X-CSE-ConnectionGUID: gfk9I4yoQ+e46z2Bs2uiEA==
X-CSE-MsgGUID: AKM0oJaPSg+IeRTrcAEbjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53201878"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53201878"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:55:42 -0700
X-CSE-ConnectionGUID: tY98T9NCRJyYys1wqF1RKA==
X-CSE-MsgGUID: o2ZYYOzqSD2EyX4RSl4i8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153060397"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jun 2025 02:55:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV5o2-000W2e-23;
	Fri, 27 Jun 2025 09:55:38 +0000
Date: Fri, 27 Jun 2025 17:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [chunkuang-hu:mediatek-drm-fixes 1/3]
 drivers/gpu/drm/mediatek/mtk_crtc.c:729:22: error: 'struct mtk_crtc' has no
 member named 'cmdq_client'
Message-ID: <202506271738.OUuTv3Q1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-drm-fixes
head:   8708a4897380da17bd1afa70f8c6bef06fefe360
commit: a778e858372a64dac4ffa245f019b263883c23eb [1/3] drm/mediatek: Add wait_event_timeout when disabling plane
config: csky-randconfig-r064-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271738.OUuTv3Q1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271738.OUuTv3Q1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271738.OUuTv3Q1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_plane_disable':
>> drivers/gpu/drm/mediatek/mtk_crtc.c:729:22: error: 'struct mtk_crtc' has no member named 'cmdq_client'
     729 |         if (!mtk_crtc->cmdq_client.chan)
         |                      ^~
   In file included from include/linux/swait.h:8,
                    from include/linux/completion.h:12,
                    from include/linux/srcutree.h:15,
                    from include/linux/srcu.h:61,
                    from include/linux/notifier.h:16,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/mediatek/mtk_crtc.c:6:
>> drivers/gpu/drm/mediatek/mtk_crtc.c:749:36: error: 'struct mtk_crtc' has no member named 'cmdq_vblank_cnt'
     749 |                            mtk_crtc->cmdq_vblank_cnt == 0,
         |                                    ^~
   include/linux/wait.h:276:24: note: in definition of macro '___wait_cond_timeout'
     276 |         bool __cond = (condition);                                              \
         |                        ^~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c:748:9: note: in expansion of macro 'wait_event_timeout'
     748 |         wait_event_timeout(mtk_crtc->cb_blocking_queue,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_crtc.c:748:36: error: 'struct mtk_crtc' has no member named 'cb_blocking_queue'
     748 |         wait_event_timeout(mtk_crtc->cb_blocking_queue,
         |                                    ^~
   include/linux/wait.h:308:53: note: in definition of macro '___wait_event'
     308 |                 long __int = prepare_to_wait_event(&wq_head, &__wq_entry, state);\
         |                                                     ^~~~~~~
   include/linux/wait.h:420:25: note: in expansion of macro '__wait_event_timeout'
     420 |                 __ret = __wait_event_timeout(wq_head, condition, timeout);      \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c:748:9: note: in expansion of macro 'wait_event_timeout'
     748 |         wait_event_timeout(mtk_crtc->cb_blocking_queue,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_crtc.c:749:36: error: 'struct mtk_crtc' has no member named 'cmdq_vblank_cnt'
     749 |                            mtk_crtc->cmdq_vblank_cnt == 0,
         |                                    ^~
   include/linux/wait.h:310:21: note: in definition of macro '___wait_event'
     310 |                 if (condition)                                                  \
         |                     ^~~~~~~~~
   include/linux/wait.h:392:32: note: in expansion of macro '___wait_cond_timeout'
     392 |         ___wait_event(wq_head, ___wait_cond_timeout(condition),                 \
         |                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:420:25: note: in expansion of macro '__wait_event_timeout'
     420 |                 __ret = __wait_event_timeout(wq_head, condition, timeout);      \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c:748:9: note: in expansion of macro 'wait_event_timeout'
     748 |         wait_event_timeout(mtk_crtc->cb_blocking_queue,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_crtc.c:749:36: error: 'struct mtk_crtc' has no member named 'cmdq_vblank_cnt'
     749 |                            mtk_crtc->cmdq_vblank_cnt == 0,
         |                                    ^~
   include/linux/wait.h:320:21: note: in definition of macro '___wait_event'
     320 |                 if (condition)                                                  \
         |                     ^~~~~~~~~
   include/linux/wait.h:392:32: note: in expansion of macro '___wait_cond_timeout'
     392 |         ___wait_event(wq_head, ___wait_cond_timeout(condition),                 \
         |                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/wait.h:420:25: note: in expansion of macro '__wait_event_timeout'
     420 |                 __ret = __wait_event_timeout(wq_head, condition, timeout);      \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c:748:9: note: in expansion of macro 'wait_event_timeout'
     748 |         wait_event_timeout(mtk_crtc->cb_blocking_queue,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_crtc.c:748:36: error: 'struct mtk_crtc' has no member named 'cb_blocking_queue'
     748 |         wait_event_timeout(mtk_crtc->cb_blocking_queue,
         |                                    ^~
   include/linux/wait.h:323:22: note: in definition of macro '___wait_event'
     323 |         finish_wait(&wq_head, &__wq_entry);                                     \
         |                      ^~~~~~~
   include/linux/wait.h:420:25: note: in expansion of macro '__wait_event_timeout'
     420 |                 __ret = __wait_event_timeout(wq_head, condition, timeout);      \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c:748:9: note: in expansion of macro 'wait_event_timeout'
     748 |         wait_event_timeout(mtk_crtc->cb_blocking_queue,
         |         ^~~~~~~~~~~~~~~~~~


vim +729 drivers/gpu/drm/mediatek/mtk_crtc.c

   721	
   722	void mtk_crtc_plane_disable(struct drm_crtc *crtc, struct drm_plane *plane)
   723	{
   724		struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
   725		struct mtk_plane_state *plane_state = to_mtk_plane_state(plane->state);
   726		int i;
   727	
   728		/* no need to wait for disabling the plane by CPU */
 > 729		if (!mtk_crtc->cmdq_client.chan)
   730			return;
   731	
   732		if (!mtk_crtc->enabled)
   733			return;
   734	
   735		/* set pending plane state to disabled */
   736		for (i = 0; i < mtk_crtc->layer_nr; i++) {
   737			struct drm_plane *mtk_plane = &mtk_crtc->planes[i];
   738			struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(mtk_plane->state);
   739	
   740			if (mtk_plane->index == plane->index) {
   741				memcpy(mtk_plane_state, plane_state, sizeof(*plane_state));
   742				break;
   743			}
   744		}
   745		mtk_crtc_update_config(mtk_crtc, false);
   746	
   747		/* wait for planes to be disabled by CMDQ */
 > 748		wait_event_timeout(mtk_crtc->cb_blocking_queue,
 > 749				   mtk_crtc->cmdq_vblank_cnt == 0,
   750				   msecs_to_jiffies(500));
   751	}
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
