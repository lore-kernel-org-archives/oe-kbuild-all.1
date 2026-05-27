Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1DB2FFFB5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779854960; cv=none; b=MvTt4IiNqeX4QVTqsIoISYInjLMT1XVlsuj+4XnS6NI7OJYOTcTU4GLtD55iS6xQvGhMDtgMSZUU3Ekr7CVRv/6os3QnXsbyKTJqDIfh/QFo96BSx3nujyKOjsfKOhbk8aGSoOkbpH8FHKc2hmeDoXimjj8C2Vg/NduAwVM+Tgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779854960; c=relaxed/simple;
	bh=uJRosapFHdUhxOpn7FsFGzfi8h6cBUsm/isJK4iVY/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sDNSSDaiuoP+2L+MPXY7tDFT/D8TqKsU2Y3l45LuJGqS5OqgwVL216GhLuzGo1gib9m+hoNPPLhHUjfLkL0gU6zaF0Mb0EfvEDvMXqP5G7JgFfPTD2L0bvnMy0wwQGIBh8Wy7pPwnBDwZoAQW++BCpkx0RiGYherbzMthfnTSkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQiMocq+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQiMocq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779854959; x=1811390959;
  h=date:from:to:cc:subject:message-id;
  bh=uJRosapFHdUhxOpn7FsFGzfi8h6cBUsm/isJK4iVY/w=;
  b=PQiMocq+vWfKOzwBUcYaUFSCY/Bt590Xhi5wRT8ZLmvTXey+aebG1p4r
   S9HRqYhBRHxIX4s5vfq9tM4xVbkja6FGTG4YKwg9KKwAxsIid7uBKR+0f
   YiK1eUXdT9mp2VsR1JCGmsGrjJtfynT0dy96bjAUe92MejQynAVIuzGpJ
   SCKHKa7jfz93Mg8QsFb1btWBQnuZ7YVBNiHblu5W96xwjtmLBtx0x6Hkq
   Da0p33ktaWMb3gHcfGe9Pgy6qD9l422ybxLCdSIGQyfW4FKv2JnU9a6ve
   9SFPgAPsl/5wfERKyS5ieMZ6rHQ/d/L/U8qQ9EsThTG6EUsANlyOt3KUa
   w==;
X-CSE-ConnectionGUID: b68y0nHrR4uwz7ebI01VDw==
X-CSE-MsgGUID: xVnKo2TuSQqwwrUfvBCwZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79713922"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="79713922"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 21:09:17 -0700
X-CSE-ConnectionGUID: wsWOUJFKRsKyNCQsKX0P9Q==
X-CSE-MsgGUID: ea0MocIlSJKjva27FaVwuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="265988991"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 May 2026 21:09:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS5Zx-000000003Nw-0gVJ;
	Wed, 27 May 2026 04:09:13 +0000
Date: Wed, 27 May 2026 12:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 0/2]
 drivers/gpu/drm/xe/xe_guc_ct.c:1814:22: warning: assignment to 'struct
 xe_guc_log_snapshot *' from 'int' makes pointer from integer without a cast
Message-ID: <202605271116.S11cMJQv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7d38f5b0e4b0d06970e261174e220a997a0908e7
commit: ff6482fb458953e111a82b7c537363d9aacf04bf [0/2] drm/xe/guc: Dead CT helper
config: i386-randconfig-006-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271116.S11cMJQv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271116.S11cMJQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271116.S11cMJQv-lkp@intel.com/

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
