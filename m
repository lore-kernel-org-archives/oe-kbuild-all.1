Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCC3D9048
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326915; cv=none; b=sXSPaNi/K//oad8hF9ynJrQ+XvHUzbb58W2o2EnbFiHtEIkKK1xFyDSAy39ufrM1q+AN7GC4DlHGvCY+59uoHKskUpy4MeqjIcZHKTXaguZJ6TzofB71xkSO5oHejrOfC1czNb9b2/lj2Ds7gDElTx+xkQRrFRvXAveJlEGhYbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326915; c=relaxed/simple;
	bh=TOfXTAgO21Y+3HE5dmitUb6Mmbmwy0D0c5/KzDl45Tw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YAYbkPTAPxRmFGqGPnVDlTBXsFUId1RKmXv/WGTeWTb6/VokLxgozX1sxjOHacu7vDia8dCUxSJpbmLPl6+B9boj9WCQAdjgwIax/4pf6NmHHMuM6J0DowM+c0yg4Hto37c7P+mQKjWsy1LH7jn5TIM4sT3CgTuD+w5DX6hzvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzyZyLF7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzyZyLF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780326910; x=1811862910;
  h=date:from:to:cc:subject:message-id;
  bh=TOfXTAgO21Y+3HE5dmitUb6Mmbmwy0D0c5/KzDl45Tw=;
  b=XzyZyLF7k3ayEffRL4kuomj2C2i6wQNpj0NZLlkgLvOVstUkwuS5/0Ge
   WdnhEzpZ/0pU647Nr8ZP0DaOCypneuDPtxUUNlnRH7xrgh9VlgdWAhF2M
   TJhCF/zB4y2fcOZ+FlUoUXctbVn8fCHXS4mcl4RmOYjCh0el44Xg9TOTH
   JqcgB+rod60AnoItPrzAN5Z9553OZPcJoz20qPlEot/iu6qQVFUDOAMYW
   rhTMKTuFWTcgrGUDrhK8+ujYpXAU9r3NMqpdk0nfQUX5f1N8YZqwQZGf4
   rifTi4HcTqkQaTE2IY0RJOCqMtjRqSUDXjJ6LotGe3CHK3kkIZ2ZvG4mo
   A==;
X-CSE-ConnectionGUID: +vi+tlHYSKuR/Rtioui1RA==
X-CSE-MsgGUID: 8Nh2YRPcRh+pb82SxNzPQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81200774"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81200774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 08:15:10 -0700
X-CSE-ConnectionGUID: 4wcoDdIeR5GTaUayW8Tlww==
X-CSE-MsgGUID: fELGQF+uRpGMZi8I8fzb3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248517138"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jun 2026 08:15:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU4M5-00000000Ahh-1ELa;
	Mon, 01 Jun 2026 15:15:05 +0000
Date: Mon, 01 Jun 2026 23:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [superm1:superm1/backlight-property-v5 3/21]
 drivers/gpu/drm/drm_vblank.c:1412:6-25: WARNING: atomic_dec_and_test
 variation before object free at line 1419.
Message-ID: <202606012258.f60EpMuU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/backlight-property-v5
head:   5f2330560c00d587cd173ee4222011b62e1ac567
commit: eaf99ccba37426aac11866ffb268bd6b68417b00 [3/21] drm/vblank: Introduce deferred vblank enable/disable
config: sh-randconfig-r052-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012258.f60EpMuU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012258.f60EpMuU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_vblank.c:1412:6-25: WARNING: atomic_dec_and_test variation before object free at line 1419.
   drivers/gpu/drm/drm_vblank.c:1412:6-25: WARNING: atomic_dec_and_test variation before object free at line 1426.

vim +1412 drivers/gpu/drm/drm_vblank.c

  1395	
  1396	void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
  1397	{
  1398		struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
  1399		int vblank_offdelay = vblank->config.offdelay_ms;
  1400		bool needs_deferred_disable;
  1401	
  1402		if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
  1403			return;
  1404	
  1405		if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
  1406			return;
  1407	
  1408		needs_deferred_disable =
  1409			drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe));
  1410	
  1411		/* Last user schedules interrupt disable */
> 1412		if (!atomic_dec_and_test(&vblank->refcount))
  1413			return;
  1414	
  1415		if (!vblank_offdelay)
  1416			return;
  1417		else if (vblank_offdelay < 0) {
  1418			if (needs_deferred_disable)
> 1419				mod_delayed_work(dev->deferred_vblank_wq,
  1420						 &vblank->disable_work,
  1421						 0);
  1422			else
  1423				vblank_disable_fn(&vblank->disable_timer);
  1424		} else if (!vblank->config.disable_immediate) {
  1425			if (needs_deferred_disable)
  1426				mod_delayed_work(dev->deferred_vblank_wq,
  1427						 &vblank->disable_work,
  1428						 msecs_to_jiffies(vblank_offdelay));
  1429			else
  1430				mod_timer(&vblank->disable_timer,
  1431					  jiffies + ((vblank_offdelay * HZ) / 1000));
  1432		}
  1433	}
  1434	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
