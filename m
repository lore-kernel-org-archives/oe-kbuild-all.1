Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D589C7DA9C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753617395; cv=none; b=Nj6Y/KiubbGo7/BIoxCQfipCeeKmVCsSkSwZ+CD1mwBLpdQdKhQJmF4Ei17ouoSJL1dinv/R373aQEXQRotuw6SrRiEBzIuP7Ch7mSvikLf7FQLGkDAzHEGHxokC1hxXoikKEJqmG38RgtL1Fy/xOV073E+gZA34tYCNNZrMoE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753617395; c=relaxed/simple;
	bh=MCtnhMyV6TCEcTvIMyGfGnvcxeKLYRXzeOA51kZ9L0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fs2JmGdoJs+N73A2wGYsknpkmHDIJdi6AlWrQ1PrNZ3pp9nsZUTt0xuRTX/z1brUo/U5+dK4DPouIAaN/3K+EmhRnrw2Of0UBl1h0U4vbGeP68ncvTRl0SY3zjYb8EVEaeP5uLFFvYTcqAOKLs8cV8/9A5tDa+63zQ5ux0BBzYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8GLxwMZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8GLxwMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753617394; x=1785153394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MCtnhMyV6TCEcTvIMyGfGnvcxeKLYRXzeOA51kZ9L0s=;
  b=h8GLxwMZQy6lz2ySkNDdu9aJu8BbcSr3KI11BgB8FSPl2dWwccSw6mDp
   yQ2FrO0XQd30tlyKtgj0+APihES/b6cku6HP0VvY4OXXqYvM5c96fcG7v
   bymNNVGtPL0/HGXUsrXJfw3vmiDkxjwFnr7v6SYkP18FPHCq6Ro1cwWGf
   3aVztxuDaKFmokubWnqXATc2xHGofF3r7IZ8rBipD+fwK5IsmRvGMAdAo
   DFHyf3s0Lvi0MYnAe6+B6zk9r+VqOM+kUQnNsyHV7JrbNh8j4uI8F590n
   oUH3v7IVzaoU4+3GPd4bDwRiyt3qNuqgQbYu+IDREQMFsTRGZ9UGaxV0w
   A==;
X-CSE-ConnectionGUID: kXliqJBER0+j4B50peMsyw==
X-CSE-MsgGUID: qIoIV+uIQv68iEaWfOCLUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55968405"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55968405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 04:56:33 -0700
X-CSE-ConnectionGUID: zwFQHWKnTWeXsP48MXYyCg==
X-CSE-MsgGUID: QAsZdawaT4iPyUmAYxnIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161741239"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2025 04:56:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufzzS-000Mc3-0j;
	Sun, 27 Jul 2025 11:56:30 +0000
Date: Sun, 27 Jul 2025 19:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 drivers/gpu/drm/xe/xe_guc_ct.c:1814:24: error: implicit declaration of
 function 'xe_guc_log_snapshot_capture'; did you mean
 'xe_guc_ct_snapshot_capture'?
Message-ID: <202507271932.Rk3EvHQR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e9bbc29c066a63a4c4dd6e328c43e04f61be700e
commit: ff6482fb458953e111a82b7c537363d9aacf04bf [0/2] drm/xe/guc: Dead CT helper
config: x86_64-randconfig-121-20250727 (https://download.01.org/0day-ci/archive/20250727/202507271932.Rk3EvHQR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271932.Rk3EvHQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271932.Rk3EvHQR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_guc_ct.c: In function 'ct_dead_capture':
>> drivers/gpu/drm/xe/xe_guc_ct.c:1814:24: error: implicit declaration of function 'xe_guc_log_snapshot_capture'; did you mean 'xe_guc_ct_snapshot_capture'? [-Werror=implicit-function-declaration]
    1814 |         snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        xe_guc_ct_snapshot_capture
>> drivers/gpu/drm/xe/xe_guc_ct.c:1814:22: warning: assignment to 'struct xe_guc_log_snapshot *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1814 |         snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
         |                      ^
>> drivers/gpu/drm/xe/xe_guc_ct.c:1821:17: error: implicit declaration of function 'xe_guc_log_snapshot_free'; did you mean 'xe_guc_ct_snapshot_free'? [-Werror=implicit-function-declaration]
    1821 |                 xe_guc_log_snapshot_free(snapshot_log);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 xe_guc_ct_snapshot_free
   drivers/gpu/drm/xe/xe_guc_ct.c: In function 'ct_dead_print':
>> drivers/gpu/drm/xe/xe_guc_ct.c:1840:33: error: implicit declaration of function 'drm_line_printer'; did you mean 'drm_info_printer'? [-Werror=implicit-function-declaration]
    1840 |         struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
         |                                 ^~~~~~~~~~~~~~~~
         |                                 drm_info_printer
>> drivers/gpu/drm/xe/xe_guc_ct.c:1840:33: error: invalid initializer
>> drivers/gpu/drm/xe/xe_guc_ct.c:1857:9: error: implicit declaration of function 'xe_guc_log_snapshot_print'; did you mean 'xe_guc_ct_snapshot_print'? [-Werror=implicit-function-declaration]
    1857 |         xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         xe_guc_ct_snapshot_print
   cc1: some warnings being treated as errors


vim +1814 drivers/gpu/drm/xe/xe_guc_ct.c

  1785	
  1786	#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
  1787	static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
  1788	{
  1789		struct xe_guc_log_snapshot *snapshot_log;
  1790		struct xe_guc_ct_snapshot *snapshot_ct;
  1791		struct xe_guc *guc = ct_to_guc(ct);
  1792		unsigned long flags;
  1793		bool have_capture;
  1794	
  1795		if (ctb)
  1796			ctb->info.broken = true;
  1797	
  1798		/* Ignore further errors after the first dump until a reset */
  1799		if (ct->dead.reported)
  1800			return;
  1801	
  1802		spin_lock_irqsave(&ct->dead.lock, flags);
  1803	
  1804		/* And only capture one dump at a time */
  1805		have_capture = ct->dead.reason & (1 << CT_DEAD_STATE_CAPTURE);
  1806		ct->dead.reason |= (1 << reason_code) |
  1807				   (1 << CT_DEAD_STATE_CAPTURE);
  1808	
  1809		spin_unlock_irqrestore(&ct->dead.lock, flags);
  1810	
  1811		if (have_capture)
  1812			return;
  1813	
> 1814		snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
  1815		snapshot_ct = xe_guc_ct_snapshot_capture((ct), true);
  1816	
  1817		spin_lock_irqsave(&ct->dead.lock, flags);
  1818	
  1819		if (ct->dead.snapshot_log || ct->dead.snapshot_ct) {
  1820			xe_gt_err(ct_to_gt(ct), "Got unexpected dead CT capture!\n");
> 1821			xe_guc_log_snapshot_free(snapshot_log);
  1822			xe_guc_ct_snapshot_free(snapshot_ct);
  1823		} else {
  1824			ct->dead.snapshot_log = snapshot_log;
  1825			ct->dead.snapshot_ct = snapshot_ct;
  1826		}
  1827	
  1828		spin_unlock_irqrestore(&ct->dead.lock, flags);
  1829	
  1830		queue_work(system_unbound_wq, &(ct)->dead.worker);
  1831	}
  1832	
  1833	static void ct_dead_print(struct xe_dead_ct *dead)
  1834	{
  1835		struct xe_guc_ct *ct = container_of(dead, struct xe_guc_ct, dead);
  1836		struct xe_device *xe = ct_to_xe(ct);
  1837		struct xe_gt *gt = ct_to_gt(ct);
  1838		static int g_count;
  1839		struct drm_printer ip = xe_gt_info_printer(gt);
> 1840		struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
  1841	
  1842		if (!dead->reason) {
  1843			xe_gt_err(gt, "CTB is dead for no reason!?\n");
  1844			return;
  1845		}
  1846	
  1847		drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
  1848	
  1849		/* Can't generate a genuine core dump at this point, so just do the good bits */
  1850		drm_puts(&lp, "**** Xe Device Coredump ****\n");
  1851		xe_device_snapshot_print(xe, &lp);
  1852	
  1853		drm_printf(&lp, "**** GT #%d ****\n", gt->info.id);
  1854		drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
  1855	
  1856		drm_puts(&lp, "**** GuC Log ****\n");
> 1857		xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
  1858	
  1859		drm_puts(&lp, "**** GuC CT ****\n");
  1860		xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
  1861	
  1862		drm_puts(&lp, "Done.\n");
  1863	}
  1864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
