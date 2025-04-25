Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09E2367BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574902; cv=none; b=S2V1PAGYeANtlABQMShUJBFPyX5k06hq3e1q/Rxw9EM97CE1z+wDlfLFyxec6b9gjA9e0IF1IofnZqWgnrQRTIP7xJTeRr9lmuAna8alDDixLLbn8CvLuAlxmYbl4hpPbZdB8DW8iSUQz8YUMaMxQf11yGvQWDSsPimOZBE3WWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574902; c=relaxed/simple;
	bh=/ZehficicnMLM5eu0RQWkFkhSgi6qKn5y2ES7HEbj3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G46CLDXa+yOulm/1t4xErM0gRAkiF8Q6eTCQ+7+sh1yk+HrMOTMOMBgcGXE3zBiMKsCGjEFo/wyK2sVnN9fw2fAWspjOt1WPx6D4lprmRm8ZcwBotvCeQ+8cgkuqOD3y0uZqZ5au6j0juuwYROr8vvLsHUirrMUhl/TmzsBijlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyOqgqYy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyOqgqYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745574900; x=1777110900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ZehficicnMLM5eu0RQWkFkhSgi6qKn5y2ES7HEbj3Q=;
  b=UyOqgqYy9Oona0tQMEBGxpmz94uXSLzPMx7mDp8idgIh3kyu56QZSxly
   VzUt9vCu8/vboBgkaB8tTklJ9nlo0yj8Q4E0YMs23cCfb3OBOrijPK0Xy
   VvibeTlhVMLKS9LCEY8ttGpm34T4qLpbwclF7Pe0AWVAi9gYNUxUpIaz+
   a3LozzuRD2w87nyIhVAhE7rygwctkGdLvel0Sa6ny+DWGircjxGv7XYmS
   4jaBqBcV4fFs0bBRtJAD8tM0bECpZwwOqQlSkPOuWpoTAM44swmU8QwOf
   WQJTxbGu73RXyXUNvLfRhT7hbRPKbhcjp1thUbBWRbte8PyC+6fV78ieC
   w==;
X-CSE-ConnectionGUID: VxrGPrbIRqGnBMjGVXXfpw==
X-CSE-MsgGUID: DzYqjE7iThKOxT3GtR7KPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="51041033"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51041033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:54:59 -0700
X-CSE-ConnectionGUID: 0YHgGRn4T9e2JMLaiFy0lg==
X-CSE-MsgGUID: dRHBErsaTB6h6EKlDDp+vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132861161"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2025 02:54:58 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Fln-00052n-2y;
	Fri, 25 Apr 2025 09:54:55 +0000
Date: Fri, 25 Apr 2025 17:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 5/5] mm/page-writeback.c:603:52: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202504251701.LrKRr5aG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   2d5b212095073630f641c9ff65aa1465096fc086
commit: 2d5b212095073630f641c9ff65aa1465096fc086 [5/5] CHROMIUM: mm: introduce sysctl knobs to cap dirty ratios
config: i386-randconfig-061-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251701.LrKRr5aG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251701.LrKRr5aG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251701.LrKRr5aG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page-writeback.c:603:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __user * @@     got void *buffer @@
   mm/page-writeback.c:603:52: sparse:     expected void [noderef] __user *
   mm/page-writeback.c:603:52: sparse:     got void *buffer
   mm/page-writeback.c:654:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __user * @@     got void *buffer @@
   mm/page-writeback.c:654:52: sparse:     expected void [noderef] __user *
   mm/page-writeback.c:654:52: sparse:     got void *buffer
   mm/page-writeback.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:702:9: sparse: sparse: context imbalance in 'account_page_redirty' - different lock contexts for basic block
   include/linux/rcupdate.h:702:9: sparse: sparse: context imbalance in '__cancel_dirty_page' - different lock contexts for basic block
   include/linux/rcupdate.h:702:9: sparse: sparse: context imbalance in 'clear_page_dirty_for_io' - different lock contexts for basic block

vim +603 mm/page-writeback.c

   595	
   596	int dirty_background_ratio_max_bytes_handler(struct ctl_table *table,
   597			int write, void *buffer, size_t *lenp,
   598			loff_t *ppos)
   599	{
   600		int ret;
   601		unsigned long old_bytes = dirty_background_ratio_max_bytes;
   602	
 > 603		ret = proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
   604		if (ret == 0 && write) {
   605			if (DIV_ROUND_UP(dirty_background_ratio_max_bytes,
   606					 PAGE_SIZE) > UINT_MAX) {
   607				dirty_background_ratio_max_bytes = old_bytes;
   608				return -ERANGE;
   609			}
   610		}
   611		return ret;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
