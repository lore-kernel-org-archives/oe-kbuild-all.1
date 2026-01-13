Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED53B3815C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295265; cv=none; b=aweghzYu+hhtH5bprheKcX8pzeDyXOE1ESiOtGfecZ1serT7RmmdR1cZFYYah3JyEWy9s0qRvt0RIV6pexMj4g8CdogK1UBwbOGrXfilmssrGGQZVVr6dzbBshJrWensLyLpQciB3j9XCh2u6hifjLsJ44QU4VB4mVRfRu6fI10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295265; c=relaxed/simple;
	bh=S9I689+ocpT9z7BqnkFwnKfb2T5Lai0p4stBePp8DH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DCEkoglsVRfdpXRMNJL8zU93P0Q1Z5EHrCZ8KN7cP4eBM0CQbwyfyYXKA6I4kP5nUbIylwXXDgoUYBcWjUpGD3VVXxFADrSBXu9ZsvvT59K2u3Z0C+1dOWZEDGV1/BFtSBbK+tnhMgzUgddsKjRYlaQrE0DycQEUELevS4Yla/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IShXIKvW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IShXIKvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768295263; x=1799831263;
  h=date:from:to:cc:subject:message-id;
  bh=S9I689+ocpT9z7BqnkFwnKfb2T5Lai0p4stBePp8DH0=;
  b=IShXIKvWqxNT7sN/XTqpsGKEmzj6N02rVK276x/GCsMv7//KRiby2XEv
   A3MY/Wbtn6u9F4FqTCxOzgTwXfo0Kl1WYWxGp27oqSZxXkTDBFniUlHXw
   +VqRprik87SIxaI04r+dSXTjAaApeJyfgXVlh8KT5KAPOU8pJBPe1i46O
   bTRXNiNoZHK1V7k/521UfkzqZsdxbj7cI6ws7kcdfsRasf5EbI+bMliKZ
   CXGaLRt0H+Xiq+cibSi9+f15Qx8gklDnIt1lr+naVp+4i6Glx5aUZK7Az
   Rb1yGvRhvFdI16ezksP8aX4Nh3XmYjiCCA7KQK42lHn2/YHc73fp09t8X
   A==;
X-CSE-ConnectionGUID: rT6e3k2oTSaUlZyNIK1ODg==
X-CSE-MsgGUID: 4qpUc8EmSueMWbKHQNqLaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69558939"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69558939"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:07:42 -0800
X-CSE-ConnectionGUID: KwTQtl88SN6bSylisHwbJA==
X-CSE-MsgGUID: mxd+oUjOTbaYkqIFLS4f4A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 01:07:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfaNG-00000000EVg-2yxM;
	Tue, 13 Jan 2026 09:07:38 +0000
Date: Tue, 13 Jan 2026 17:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/gpu/drm/xe/xe_guc_ct.c:1814:24: error: implicit declaration of
 function 'xe_guc_log_snapshot_capture'; did you mean
 'xe_guc_ct_snapshot_capture'?
Message-ID: <202601131604.xpj8s1EL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   113ac3ac68b3559c98fa1bcaa0e46044cabfcad6
commit: ff6482fb458953e111a82b7c537363d9aacf04bf [0/1] drm/xe/guc: Dead CT helper
config: x86_64-randconfig-002-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131604.xpj8s1EL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131604.xpj8s1EL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131604.xpj8s1EL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_guc_ct.c: In function 'ct_dead_capture':
>> drivers/gpu/drm/xe/xe_guc_ct.c:1814:24: error: implicit declaration of function 'xe_guc_log_snapshot_capture'; did you mean 'xe_guc_ct_snapshot_capture'? [-Wimplicit-function-declaration]
    1814 |         snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        xe_guc_ct_snapshot_capture
>> drivers/gpu/drm/xe/xe_guc_ct.c:1814:22: error: assignment to 'struct xe_guc_log_snapshot *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1814 |         snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
         |                      ^
>> drivers/gpu/drm/xe/xe_guc_ct.c:1821:17: error: implicit declaration of function 'xe_guc_log_snapshot_free'; did you mean 'xe_guc_ct_snapshot_free'? [-Wimplicit-function-declaration]
    1821 |                 xe_guc_log_snapshot_free(snapshot_log);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 xe_guc_ct_snapshot_free
   drivers/gpu/drm/xe/xe_guc_ct.c: In function 'ct_dead_print':
>> drivers/gpu/drm/xe/xe_guc_ct.c:1840:33: error: implicit declaration of function 'drm_line_printer'; did you mean 'drm_info_printer'? [-Wimplicit-function-declaration]
    1840 |         struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
         |                                 ^~~~~~~~~~~~~~~~
         |                                 drm_info_printer
>> drivers/gpu/drm/xe/xe_guc_ct.c:1840:33: error: invalid initializer
>> drivers/gpu/drm/xe/xe_guc_ct.c:1857:9: error: implicit declaration of function 'xe_guc_log_snapshot_print'; did you mean 'xe_guc_ct_snapshot_print'? [-Wimplicit-function-declaration]
    1857 |         xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         xe_guc_ct_snapshot_print


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
