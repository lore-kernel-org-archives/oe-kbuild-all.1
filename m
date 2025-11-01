Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640F1E487
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990285; cv=none; b=pIT38aR3qnytWN1x3K5nIhX07/JpYuNnxgCNl3dDstGKpdZkp1fflthYPbOY9ih6w1NOIIRXtAjJmDX0WJZ+QgFDyKOvIp9RP6pZk3a1C01VV9Ma3IrdKN/zuhgyfMpz8jjb6i9GEHgUQufI77DMtXBNTzoP7/fJs3f7e/hj+7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990285; c=relaxed/simple;
	bh=GYZRbZmOXROJXrNLlE4D5YsGxZyYNJQyF1i6vFz8vRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qy+D56ag2/Ye8Z7l6lkOkvMua4m12l/SCOVdh1KouE0PolphP+qu8zgWGbvdQPdHf+Rfay7kd5M2vewlDHNl/6Dw3gGODuZBe+fkSN76XnYbF07vAWdK/6ctRxneDuJPe0+Z2SnvDQRJ6C9Tdd3b5lxgs94MUHVx10Q6yfzVQ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0+Pyvuw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0+Pyvuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761990282; x=1793526282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GYZRbZmOXROJXrNLlE4D5YsGxZyYNJQyF1i6vFz8vRk=;
  b=a0+Pyvuw3jLGrThLyUnzMawbOc83YxkfsliNWkz98XYxGBYWGYKQsLpR
   1v1+yZgSNB9vRlGgy3mkQaI2KO+En2ya7vEH14gY8u4PEUbJ4FtVDY/Rp
   As2yz6SRKt+xuxYRMSUfKzoFQjIMvapCxaUYEnytpMGVE+636KO7TRhsG
   x70Qdw2+gy+/PAPD0KwNTJWYA+LV0jU6cW7QUbItD3yw95QDb63hcsnWq
   DKroL+p1UO1dY9zJE0Jy4UWre1cgw8nkHrv1/DaOA9sD1Ciarj1WsppKI
   uqpdTfkKQLzSwwgu0Z3IoZhNfrhtF/1tghttFDng1Ji9mjDcwTOoOD5E7
   w==;
X-CSE-ConnectionGUID: NbqkqIOHR+qbLJb4iKxrhA==
X-CSE-MsgGUID: YDP2vT7xRp25hev+e2qnTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75489888"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="75489888"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 02:44:41 -0700
X-CSE-ConnectionGUID: N1qZFQllQOWG1Rwv5/N8rw==
X-CSE-MsgGUID: 99Oc0E3/TXuja9YJIXYQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="190779280"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2025 02:44:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF8A1-000O5G-39;
	Sat, 01 Nov 2025 09:44:38 +0000
Date: Sat, 1 Nov 2025 17:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 0/1]
 drivers/gpu/drm/xe/xe_guc_ct.c:1814:24: error: implicit declaration of
 function 'xe_guc_log_snapshot_capture'; did you mean
 'xe_guc_ct_snapshot_capture'?
Message-ID: <202511011746.ql1EXFrG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   bdc81b76cc3e91b2a805bff546c72244ef2504fd
commit: ff6482fb458953e111a82b7c537363d9aacf04bf [0/1] drm/xe/guc: Dead CT helper
config: x86_64-randconfig-012-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011746.ql1EXFrG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011746.ql1EXFrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011746.ql1EXFrG-lkp@intel.com/

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
