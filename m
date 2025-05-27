Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9DD101C8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 01:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748308988; cv=none; b=beXmIsmQ6+ZFQZFRz3mEj0ajVuk3l2CQymlofKDP/TOED4fjcyS0vSVN3rpNQw2fsP+qTNql+0eeY30CYoE4/v4xJmTwmzOSL6Hjnw5sPoIqsV0ZyDX1nZanOV5QV+lvArOhpqQSBsrfM3MFFQmV+3YBAtGgDJexnZ22as99JCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748308988; c=relaxed/simple;
	bh=pqzm5hWs3t87BH2fT4cyXibFjW1X/P/CWjHe/B3cFZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLpTIzGEdG3LTgzrYn5yTgiVW7CSfaLUlsThZQA9iBioiUz5CLUiQL2tUn4QIr8lHXhuRb+EtGfnvU/KoOyejMyEHpFDY5moQ1rIqg26OOx9ExGapZlIhu8Ua9NKhc71jMl2cBv8SFueVe5K1NiEjfuPlkG9CcgUeqTPuaHUyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZG1Q3r9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZG1Q3r9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748308987; x=1779844987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pqzm5hWs3t87BH2fT4cyXibFjW1X/P/CWjHe/B3cFZk=;
  b=DZG1Q3r9TiZOeDSG19B+InLfbHmBqoTQeKNVGioQBSRY1Slpv/Bppmty
   WEvhCJxNwbndq9V7ByCRuNV7XcCK9I6PF8ce1uKFmZgjsLgEe30BsJXTC
   21QmZR9maQ8zyse0RB0CrVsZZnBC2HDfxeysVQDjIuTC04grNrU90CQrX
   wo6FvrTx77S0XFQrI3hCcZaoxZfThxutdW4TlSd70PWAnTb2i/h3jyOdH
   MYHxxt/RGpPgYnxBaOqQea1paf+dfPitVsfVkzubCO83iPj1H4+HP0uEG
   gH6gEefb6fGd+JRkHzTQbgGr6udeokT6W5MBm59M0xNkRU+s4Xm+cunQf
   A==;
X-CSE-ConnectionGUID: 55bSW050Q1SQOXo5pdHCJg==
X-CSE-MsgGUID: ueTJGclcTj6wyg4hGZIJ2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50441557"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="50441557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 18:23:06 -0700
X-CSE-ConnectionGUID: KECbb9WRQIip0hbVOikVcQ==
X-CSE-MsgGUID: UFwCqQOtQLqewkRogeRhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143029224"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2025 18:23:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJj1z-000Sn4-1S;
	Tue, 27 May 2025 01:23:03 +0000
Date: Tue, 27 May 2025 09:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 104/104]
 drivers/gpu/drm/mediatek/mtk_dp_mst.c:981:14: warning: assignment to 'int'
 from 'struct drm_encoder *' makes integer from pointer without a cast
Message-ID: <202505270915.XRZCHpqq-lkp@intel.com>
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
commit: d12007dbbfb528e0618c79a77643e64dff14d0cc [104/104] CHROMIUM: drm/mediatek: Refine the MST ACT flow
config: arm64-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270915.XRZCHpqq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270915.XRZCHpqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270915.XRZCHpqq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp_mst.c: In function 'mtk_dp_mst_drv_set_hdcp_setting':
>> drivers/gpu/drm/mediatek/mtk_dp_mst.c:981:14: warning: assignment to 'int' from 'struct drm_encoder *' makes integer from pointer without a cast [-Wint-conversion]
      encoder_id = mtk_dp->mtk_con[i]->encoder;
                 ^


vim +981 drivers/gpu/drm/mediatek/mtk_dp_mst.c

   960	
   961	void mtk_dp_mst_drv_set_hdcp_setting(struct mtk_dp *mtk_dp)
   962	{
   963		u8 i;
   964		int encoder_id;
   965		u16 start_slot, end_slot;
   966		struct drm_dp_mst_atomic_payload *payload;
   967		struct drm_dp_mst_topology_state *mst_state;
   968	
   969		mtk_dp_mst_hal_hdcp_enable(mtk_dp, true);
   970	
   971		mst_state = to_drm_dp_mst_topology_state(mtk_dp->mgr.base.state);
   972		if (IS_ERR_OR_NULL(mst_state)) {
   973			dev_err(mtk_dp->dev, "[DPTX] fail to get mst topology state!\n");
   974			return;
   975		}
   976	
   977		for (i = 0; i < ARRAY_SIZE(mtk_dp->mtk_con); i++) {
   978			if (!mst_con_with_encoder(mtk_dp->mtk_con[i]))
   979				continue;
   980	
 > 981			encoder_id = mtk_dp->mtk_con[i]->encoder;
   982			if ((mst_state->payload_mask >> encoder_id) & 0x1) {
   983				payload = drm_atomic_get_mst_payload_state(mst_state,
   984									   mtk_dp->mtk_con[i]->port);
   985				if (IS_ERR_OR_NULL(payload)) {
   986					dev_err(mtk_dp->dev, "[DPTX] fail to get mst payload state!\n");
   987					continue;
   988				}
   989	
   990				start_slot = payload->vc_start_slot;
   991				end_slot = start_slot + payload->time_slots;
   992	
   993				/* reg_vc_payload_timeslot */
   994				if ((start_slot > 64) || (end_slot > 64))
   995					dev_err(mtk_dp->dev,
   996						"[DPTX] Invalid slot region, start_slot %d, end_slot %d\n",
   997						start_slot, end_slot);
   998				else
   999					mtk_dp_mst_hal_hdcp_set_timeslot(mtk_dp, start_slot, end_slot);
  1000			}
  1001		}
  1002	
  1003		mtk_dp_mst_hal_hdcp_trigger_act(mtk_dp);
  1004	}
  1005	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
