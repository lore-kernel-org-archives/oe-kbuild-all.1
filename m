Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24C41F7916
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 05:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788584943; cv=none; b=pj+9hsdEF7AkWMvoXUTgcRonkjITE4QBxNmhudzXkDBlmOw8jvM0gPx9iCMLb7KY/epQeX9SyYUtNX47bqwVVvZMX+uKK+BCeRHB1hXtbirYAswa7YIWzP6QBJ20hJkW4NDo9Bvj05mcdpOxKsO4PZLk31L2IyAYC9j0tCyRIvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788584943; c=relaxed/simple;
	bh=adVHETW+RE8MyLUO9/vEuXlIpVxgGyqUUtq4a7RCl/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F4ndbpKlb50Zl0w08u6erzMxzVWvimeB/XEzAOqhmx1aWWl8E9eWEPEAR5nBs9zvo5MAM96Fs98FOsbuS+GR2wN8ug7TsgmQ/BUic5R8Os9dJih44p81zlmv5NMaV+5GUVSL1r62DucoqNFdIV1nrhf97CtJkVeppshtECXntpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HefAoZxW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HefAoZxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788584941; x=1820120941;
  h=date:from:to:cc:subject:message-id;
  bh=adVHETW+RE8MyLUO9/vEuXlIpVxgGyqUUtq4a7RCl/A=;
  b=HefAoZxWejrhMWSHT+tlW40jzdyJJ8ckJhQ69PWbQBufH44lA55rslZa
   N+UbXwqa/33ibT5cz9rdenLlEU6LC3rC18k611RT1i643YexVZqrt2vlE
   WNuqMIzClrxCvYP53rKNlrtx9nvftaGq8wNKWW7g1elvPi17qguehWcai
   8KfLHd8oUZQWlZQvsUTINFrjxecOBoojbyWH/xE7145XCQkwIrZG53Yln
   C6RaDVND6GF7qczBXLyJdB1odwEz+O8TNZCg8IBdbpKGmOkGTKAz27AlW
   Oashny7dWWeq9ZUicHMvDkPTw4a3ejch+hOWZtGFWp1VHGsoI5lK5beMY
   Q==;
X-CSE-ConnectionGUID: eOiZAfHURpKgDuX0rcouWw==
X-CSE-MsgGUID: kWZmkfyjRQSwQltOnSbtEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89008081"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89008081"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 22:09:01 -0700
X-CSE-ConnectionGUID: sWysTfsHR6SYjhxP9vFPPg==
X-CSE-MsgGUID: 7vq+zoaXSTWtjVOz4viPMQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2026 22:08:58 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2ie8-0000000003X-2bdq;
	Sat, 05 Sep 2026 05:08:56 +0000
Date: Sat, 05 Sep 2026 13:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 0/1]
 drivers/gpu/drm/xe/xe_guc_ct.c:1814:17: error: call to undeclared function
 'xe_guc_log_snapshot_capture'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609051354.Ew3u0eT2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   1f0237f915e8bc71c6a8e62175c6b9bf058338dc
commit: ff6482fb458953e111a82b7c537363d9aacf04bf [0/1] drm/xe/guc: Dead CT helper
config: x86_64-randconfig-103-20260904 (https://download.01.org/0day-ci/archive/20260905/202609051354.Ew3u0eT2-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051354.Ew3u0eT2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051354.Ew3u0eT2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/gpu/drm/xe/xe_guc_ct.c:1814:17: error: call to undeclared function 'xe_guc_log_snapshot_capture'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1814 |         snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
         |                        ^
   drivers/gpu/drm/xe/xe_guc_ct.c:1814:17: note: did you mean 'xe_guc_ct_snapshot_capture'?
   drivers/gpu/drm/xe/xe_guc_ct.c:1700:28: note: 'xe_guc_ct_snapshot_capture' declared here
    1700 | struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
         |                            ^
>> drivers/gpu/drm/xe/xe_guc_ct.c:1814:15: error: incompatible integer to pointer conversion assigning to 'struct xe_guc_log_snapshot *' from 'int' [-Wint-conversion]
    1814 |         snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_guc_ct.c:1821:3: error: call to undeclared function 'xe_guc_log_snapshot_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1821 |                 xe_guc_log_snapshot_free(snapshot_log);
         |                 ^
   drivers/gpu/drm/xe/xe_guc_ct.c:1821:3: note: did you mean 'xe_guc_ct_snapshot_free'?
   drivers/gpu/drm/xe/xe_guc_ct.c:1760:6: note: 'xe_guc_ct_snapshot_free' declared here
    1760 | void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
         |      ^
>> drivers/gpu/drm/xe/xe_guc_ct.c:1840:26: error: call to undeclared function 'drm_line_printer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1840 |         struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
         |                                 ^
   drivers/gpu/drm/xe/xe_guc_ct.c:1840:26: note: did you mean 'drm_info_printer'?
   include/drm/drm_print.h:363:34: note: 'drm_info_printer' declared here
     363 | static inline struct drm_printer drm_info_printer(struct device *dev)
         |                                  ^
>> drivers/gpu/drm/xe/xe_guc_ct.c:1840:21: error: initializing 'struct drm_printer' with an expression of incompatible type 'int'
    1840 |         struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
         |                            ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_guc_ct.c:1857:2: error: call to undeclared function 'xe_guc_log_snapshot_print'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1857 |         xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
         |         ^
   drivers/gpu/drm/xe/xe_guc_ct.c:1857:2: note: did you mean 'xe_guc_ct_snapshot_print'?
   drivers/gpu/drm/xe/xe_guc_ct.c:1733:6: note: 'xe_guc_ct_snapshot_print' declared here
    1733 | void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
         |      ^
   drivers/gpu/drm/xe/xe_guc_ct.c:1876:2: error: call to undeclared function 'xe_guc_log_snapshot_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1876 |         xe_guc_log_snapshot_free(ct->dead.snapshot_log);
         |         ^
   1 warning and 7 errors generated.


vim +/xe_guc_log_snapshot_capture +1814 drivers/gpu/drm/xe/xe_guc_ct.c

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
