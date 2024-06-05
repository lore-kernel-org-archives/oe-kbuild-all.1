Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494A915EFDF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717627666; cv=none; b=tzv3Zz2okHvKmaKxO3w098ItcfHVjyeHIo8xGu7o/sN8HHy1NBWJ+vsxkco0p9VfI4PYuxS3bHe3HFKgUKFV8FVpinlchHNfM84UeKG8N6YPySkLiHHrHzdPSnlviDpYLEKDpVrniE1fhyDKHAMeKbh9c5RzQnhDbXkg3B3r4a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717627666; c=relaxed/simple;
	bh=AjctYTf/RWZRswceTMdWqT8/wOTMr6x/HMQbUTygQGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZasUCxJ6hAfTtqMcA3COHNI0d3pponr0eZIzgvGGO6us7HMdKLvNVCCmHxMhbltZh5bYIo4yY2kXCP7rEG1q0Zv5R5C+T2LNainYIkXrgW/3bjHoZvAXYnZ/96mHUgzQL05QOh13H6W2dmth+bGFm3R+LiZXacbXzU15wMIZFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSDAZ7ON; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSDAZ7ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717627665; x=1749163665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjctYTf/RWZRswceTMdWqT8/wOTMr6x/HMQbUTygQGk=;
  b=RSDAZ7ONWOGGTtPcZmfD4nOuEY8cEkNmo9qZ3Oy9/PaznEQigJDbbU9h
   F1DlklnY9jkTEM/YkteR+KxOhjvyCVBCI42OwMyti0NmxhnjV8/EN8LPD
   8cMF6I/CnBq0F/318bM8NEALnepJw8Gl3nBXIOfq3SfRKClS+8ichK75V
   t4dY9iiu5t3UAKCXVUPIyBxVD1mrj15el3SFSpSKnOcZGC3QFpcl83uoJ
   74fVvAOXuZdyiDO3Y5Hkg12/Y+nIuL67kr8ugp4m3ZdMPTyipwwc3cREC
   7JZ79PUln+b7O1y+rWgwXN1qfnsAww4LuJfkOhyVBTMOMIV/xkF/ThKSR
   Q==;
X-CSE-ConnectionGUID: I7q9jGayT2ql5/rkI/SH6w==
X-CSE-MsgGUID: c9f4zjZBRlurIVtIzTR6Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14404541"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="14404541"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 15:47:44 -0700
X-CSE-ConnectionGUID: HtvFg3fETam+Zs1dplm7bw==
X-CSE-MsgGUID: rM3IhHhASfO7DEQ/G2O5TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="42856877"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Jun 2024 15:47:42 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEzPj-0002Oy-0o;
	Wed, 05 Jun 2024 22:47:30 +0000
Date: Thu, 6 Jun 2024 06:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 118/123]
 drivers/gpu/drm/mediatek/mtk_crtc.c:781:32: warning: cast to pointer from
 integer of different size
Message-ID: <202406060650.AcaixmiP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   de0bcc86c8087469675cc88c772f57202abea3e2
commit: 05b8aa4867fdd9b34c94ba227f985a9284cef78d [118/123] BACKPORT: FROMLIST: drm/mediatek: Add secure flow support to mediatek-drm
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406060650.AcaixmiP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060650.AcaixmiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060650.AcaixmiP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:293,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/mediatek/mtk_crtc.c:6:
   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_update_config':
>> drivers/gpu/drm/mediatek/mtk_crtc.c:781:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     781 |                         memset((void *)sec_data->addr_metadatas, 0,
         |                                ^
   include/linux/fortify-string.h:435:44: note: in definition of macro '__fortify_memset_chk'
     435 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                            ^~~~~~
   include/linux/fortify-string.h:445:17: note: in expansion of macro '__struct_size'
     445 |                 __struct_size(p), __member_size(p))
         |                 ^~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c:781:25: note: in expansion of macro 'memset'
     781 |                         memset((void *)sec_data->addr_metadatas, 0,
         |                         ^~~~~~
>> drivers/gpu/drm/mediatek/mtk_crtc.c:781:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     781 |                         memset((void *)sec_data->addr_metadatas, 0,
         |                                ^
   include/linux/fortify-string.h:435:52: note: in definition of macro '__fortify_memset_chk'
     435 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                    ^~~~~~~~~~~~
   include/linux/fortify-string.h:445:35: note: in expansion of macro '__member_size'
     445 |                 __struct_size(p), __member_size(p))
         |                                   ^~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c:781:25: note: in expansion of macro 'memset'
     781 |                         memset((void *)sec_data->addr_metadatas, 0,
         |                         ^~~~~~
>> drivers/gpu/drm/mediatek/mtk_crtc.c:781:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     781 |                         memset((void *)sec_data->addr_metadatas, 0,
         |                                ^
   include/linux/fortify-string.h:436:29: note: in definition of macro '__fortify_memset_chk'
     436 |         __underlying_memset(p, c, __fortify_size);                      \
         |                             ^
   drivers/gpu/drm/mediatek/mtk_crtc.c:781:25: note: in expansion of macro 'memset'
     781 |                         memset((void *)sec_data->addr_metadatas, 0,
         |                         ^~~~~~


vim +781 drivers/gpu/drm/mediatek/mtk_crtc.c

   731	
   732	static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
   733	{
   734	#if IS_REACHABLE(CONFIG_MTK_CMDQ)
   735		struct cmdq_client cmdq_client;
   736		struct cmdq_pkt *cmdq_handle;
   737	#endif
   738		struct drm_crtc *crtc = &mtk_crtc->base;
   739		struct mtk_drm_private *priv = crtc->dev->dev_private;
   740		unsigned int pending_planes = 0, pending_async_planes = 0;
   741		int i;
   742	
   743		mutex_lock(&mtk_crtc->hw_lock);
   744		mtk_crtc->config_updating = true;
   745		if (needs_vblank)
   746			mtk_crtc->pending_needs_vblank = true;
   747	
   748		for (i = 0; i < mtk_crtc->layer_nr; i++) {
   749			struct drm_plane *plane = &mtk_crtc->planes[i];
   750			struct mtk_plane_state *plane_state;
   751	
   752			plane_state = to_mtk_plane_state(plane->state);
   753			if (plane_state->pending.dirty) {
   754				plane_state->pending.config = true;
   755				plane_state->pending.dirty = false;
   756				pending_planes |= BIT(i);
   757			} else if (plane_state->pending.async_dirty) {
   758				plane_state->pending.async_config = true;
   759				plane_state->pending.async_dirty = false;
   760				pending_async_planes |= BIT(i);
   761			}
   762		}
   763		if (pending_planes)
   764			mtk_crtc->pending_planes = true;
   765		if (pending_async_planes)
   766			mtk_crtc->pending_async_planes = true;
   767	
   768		if (priv->data->shadow_register) {
   769			mtk_mutex_acquire(mtk_crtc->mutex);
   770			mtk_crtc_ddp_config(crtc, NULL);
   771			mtk_mutex_release(mtk_crtc->mutex);
   772		}
   773	#if IS_REACHABLE(CONFIG_MTK_CMDQ)
   774		if (mtk_crtc->sec_on) {
   775			mbox_flush(mtk_crtc->sec_cmdq_client.chan, 0);
   776			mtk_crtc->sec_cmdq_handle.cmd_buf_size = 0;
   777	
   778			if (mtk_crtc->sec_cmdq_handle.sec_data) {
   779				struct cmdq_sec_data *sec_data = mtk_crtc->sec_cmdq_handle.sec_data;
   780	
 > 781				memset((void *)sec_data->addr_metadatas, 0,
   782				       sec_data->addr_metadata_cnt * sizeof(u64));
   783				sec_data->addr_metadata_cnt = 0;
   784			}
   785	
   786			mtk_crtc_enable_secure_state(crtc);
   787	
   788			cmdq_client = mtk_crtc->sec_cmdq_client;
   789			cmdq_handle = &mtk_crtc->sec_cmdq_handle;
   790		} else if (mtk_crtc->cmdq_client.chan) {
   791			mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
   792			mtk_crtc->cmdq_handle.cmd_buf_size = 0;
   793	
   794			cmdq_client =  mtk_crtc->cmdq_client;
   795			cmdq_handle = &mtk_crtc->cmdq_handle;
   796		}
   797	
   798		if (cmdq_client.chan) {
   799			cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
   800			cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
   801			mtk_crtc_ddp_config(crtc, cmdq_handle);
   802			cmdq_pkt_finalize(cmdq_handle);
   803			dma_sync_single_for_device(cmdq_client.chan->mbox->dev,
   804						   cmdq_handle->pa_base,
   805						   cmdq_handle->cmd_buf_size,
   806						   DMA_TO_DEVICE);
   807			/*
   808			 * CMDQ command should execute in next 3 vblank.
   809			 * One vblank interrupt before send message (occasionally)
   810			 * and one vblank interrupt after cmdq done,
   811			 * so it's timeout after 3 vblank interrupt.
   812			 * If it fail to execute in next 3 vblank, timeout happen.
   813			 */
   814			mtk_crtc->cmdq_vblank_cnt = 3;
   815	
   816			mbox_send_message(cmdq_client.chan, cmdq_handle);
   817			mbox_client_txdone(cmdq_client.chan, 0);
   818		}
   819	#endif
   820		mtk_crtc->config_updating = false;
   821		mutex_unlock(&mtk_crtc->hw_lock);
   822	}
   823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
