Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34112349AEB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 10:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078882; cv=none; b=DDScFFCQUc0xwAsvYqBFV+aE2DCNur1hjz9kYuzweMZmIY1bMPyqgQAA4yYN9pIN8sYSAY1I7tYGPw621pV4NoUc6NsQkCfLs+DozqayCA8SSh9VTDIEcy9njEIJHPIoCRR8qXlDURzo+eEuSEeBPBinM2zLMhnUbrh7DbnKXb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078882; c=relaxed/simple;
	bh=AmUt/0GK3UxEqYEw7QmdUXXfbu/j6oftOmva9IAFObs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=taLj0j0NEd+4TG1S5LWFUY7c2pxaBUpY3KyrL9KBI8LVabWQA6NfaKiDIZCvGV1++pNoSEj555h6YTupKcsx38W0UR36Tsdi1d3dFJUqL8PdL6AyDtgXbbs6phNOM6qWRd5/HIkDUKMLt09Kot3sCdmpPzk4sxTwh6S08X1PEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNNlptbI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNNlptbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769078880; x=1800614880;
  h=date:from:to:cc:subject:message-id;
  bh=AmUt/0GK3UxEqYEw7QmdUXXfbu/j6oftOmva9IAFObs=;
  b=CNNlptbIMNzPHu4yZrbJszkXlurf/F/nVBN4WcKdr+HvlgTpEKteha+G
   Oijr50W608quz2ZwT94eR9E4k5wJvCvJAE+RUQD11y//ylwKysnCFHhC0
   HCY37yRJJpDG0UG9Q+3qGLKuzWUv0TqphFGjz4L6H3m5jHzhR9PcouHBx
   PFAkL5Tp5XxTWbm19AcWyWT3/N1W9LxDCwHX1sQWMZhDahwxFTFAUOYIT
   KtIic4jaLTsk+skrBCqt/X81F4uKk8gr4egl/mkXucv9WvFXGdtmuJB4k
   glX4+oYf67T+NyC7mxIiVquyWZMG1JqMS4ezTULSgDuU+F2gRcJB4VbD+
   g==;
X-CSE-ConnectionGUID: DNLei2UhQJGeSdjstlgL0g==
X-CSE-MsgGUID: 08IjQ9KhSu+VSFRmL6pzFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57882073"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="57882073"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 02:47:57 -0800
X-CSE-ConnectionGUID: AeghQaQ+Sh2AZsplUAuQYg==
X-CSE-MsgGUID: QE30xmqsQaiYGe3e+deiOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="237966556"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jan 2026 02:47:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visEE-00000000SkJ-15lv;
	Thu, 22 Jan 2026 10:47:54 +0000
Date: Thu, 22 Jan 2026 18:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/1]
 drivers/gpu/drm/xe/xe_guc_ct.c:1814:22: warning: assignment to 'struct
 xe_guc_log_snapshot *' from 'int' makes pointer from integer without a cast
Message-ID: <202601221840.kfUKbO4w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   68975f170b906f5a8dd4c950e4f3ae21e5351623
commit: ff6482fb458953e111a82b7c537363d9aacf04bf [0/1] drm/xe/guc: Dead CT helper
config: i386-randconfig-003-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221840.kfUKbO4w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221840.kfUKbO4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221840.kfUKbO4w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_guc_ct.c: In function 'ct_dead_capture':
   drivers/gpu/drm/xe/xe_guc_ct.c:1814:24: error: implicit declaration of function 'xe_guc_log_snapshot_capture'; did you mean 'xe_guc_ct_snapshot_capture'? [-Werror=implicit-function-declaration]
    1814 |         snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        xe_guc_ct_snapshot_capture
>> drivers/gpu/drm/xe/xe_guc_ct.c:1814:22: warning: assignment to 'struct xe_guc_log_snapshot *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1814 |         snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
         |                      ^
   drivers/gpu/drm/xe/xe_guc_ct.c:1821:17: error: implicit declaration of function 'xe_guc_log_snapshot_free'; did you mean 'xe_guc_ct_snapshot_free'? [-Werror=implicit-function-declaration]
    1821 |                 xe_guc_log_snapshot_free(snapshot_log);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 xe_guc_ct_snapshot_free
   drivers/gpu/drm/xe/xe_guc_ct.c: In function 'ct_dead_print':
   drivers/gpu/drm/xe/xe_guc_ct.c:1840:33: error: implicit declaration of function 'drm_line_printer'; did you mean 'drm_info_printer'? [-Werror=implicit-function-declaration]
    1840 |         struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
         |                                 ^~~~~~~~~~~~~~~~
         |                                 drm_info_printer
   drivers/gpu/drm/xe/xe_guc_ct.c:1840:33: error: invalid initializer
   drivers/gpu/drm/xe/xe_guc_ct.c:1857:9: error: implicit declaration of function 'xe_guc_log_snapshot_print'; did you mean 'xe_guc_ct_snapshot_print'? [-Werror=implicit-function-declaration]
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
  1821			xe_guc_log_snapshot_free(snapshot_log);
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
