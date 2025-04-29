Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1345A35966
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940861; cv=none; b=NnBXDwuJCF/SfJaaHZa8hYZcXTQiJlCx2gu6WzaIEPS7jAGV7D8K4uOq7sLgYLjbkF5bxr8uC4bEZKLXFoyUX0zEvH6i0XJit+/Jw0FGTjT1cOExH5vdz9CHnv8nD6juaTjB5GiyARUpz4zknU4XwLf0z1A7YREYbxmNXGfQBrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940861; c=relaxed/simple;
	bh=XIavdkleZILZLeHAJLfi8X7dsOcpfbM1bwwwrxhhTgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6TLFep3pQ36vKhKN8qtxd0mm0bZCs9htM1qbKAkxs0Bt9ARuSXabwBDihepqu9/bablP2QjsbnmIaQzBb46bvHHYd51o0jNPs6exF+u5sX8aYK1BjNUBYtnuy0umzz6i9YJuMUJIICBZqaZSArPCA7jRvtifDjBi9Wlp51fvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgf3yhXk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgf3yhXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745940860; x=1777476860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIavdkleZILZLeHAJLfi8X7dsOcpfbM1bwwwrxhhTgg=;
  b=lgf3yhXkxwd0BVUBZPcWcecDYtepzaC9+w2493Rsa326NCWNqtY6E/lR
   8nWfPZ8e72k4eycol0JTB6Z6pA4xWXYNPtJm8plXOsCm88v4wmxO28wnH
   kMKeAoYWE97clVidywD4CZAvztZEZJukUiSI7FLw+9NQi2EN5KssyP/Hd
   JVQM554sLNm8I4oBKpkq+Q41Zq8q+sH34/RcMm+12d9Y9W5Qu9S0jKl31
   QNA5gFMEMDOYXhKcQ/p7gNRX6SpmhZDsprhxw2dvyKWPaL9LLem54yrlO
   tE2ZVnTjiWBDBnnxrcEhVYoE5/fB0PgrKUjHHfLRi5oXgGh5bFVU4TN/r
   g==;
X-CSE-ConnectionGUID: 6EQHdD2lRNyoqecAjkjDpQ==
X-CSE-MsgGUID: krnUXuV4Qy67H9z2fFfTPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="35184081"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="35184081"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:34:18 -0700
X-CSE-ConnectionGUID: ZITNuOU1Sw+YCV1O0mzdOQ==
X-CSE-MsgGUID: saHCKuKBRcO0XcDlkliAkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133569018"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2025 08:34:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9myM-0000qL-1p;
	Tue, 29 Apr 2025 15:34:14 +0000
Date: Tue, 29 Apr 2025 23:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, James Morse <james.morse@arm.com>
Subject: [morse:mpam/snapshot/v6.15-rc3 100/110]
 include/linux/debugfs.h:419:16: warning: 'return' with a value, in function
 returning void
Message-ID: <202504292304.mcEM0Eu1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.15-rc3
head:   2cc3eff27207d40f181a59f04660a1e8e9746ff8
commit: 482d40a25255bb2c3df8cebda0f06cd2af2d4b95 [100/110] debugfs: Add stub to fix the build when debugfs is not enabled
config: sparc-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250429/202504292304.mcEM0Eu1-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292304.mcEM0Eu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292304.mcEM0Eu1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/ti_sci.c:13:
   include/linux/debugfs.h: In function 'debugfs_create_cpumask':
>> include/linux/debugfs.h:419:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
     419 |         return ERR_PTR(-ENODEV);
         |                ^~~~~~~~~~~~~~~~
   include/linux/debugfs.h:416:20: note: declared here
     416 | static inline void debugfs_create_cpumask(const char *name, umode_t mode,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/firmware/turris-mox-rwtm.c:13:
   include/linux/debugfs.h: In function 'debugfs_create_cpumask':
>> include/linux/debugfs.h:419:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
     419 |         return ERR_PTR(-ENODEV);
         |                ^~~~~~~~~~~~~~~~
   include/linux/debugfs.h:416:20: note: declared here
     416 | static inline void debugfs_create_cpumask(const char *name, umode_t mode,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/turris-mox-rwtm.c: In function 'mox_get_board_info':
   drivers/firmware/turris-mox-rwtm.c:263:90: warning: '%08x' directive writing 8 bytes into a region of size between 7 and 9 [-Wformat-overflow=]
     263 |                         "%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
         |                                                                                          ^~~~
   drivers/firmware/turris-mox-rwtm.c:262:17: note: 'sprintf' output between 135 and 137 bytes into a destination of size 135
     262 |                 sprintf(rwtm->pubkey,
         |                 ^~~~~~~~~~~~~~~~~~~~~
     263 |                         "%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     264 |                         ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                         s[8], s[9], s[10], s[11], s[12], s[13], s[14], s[15]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/return +419 include/linux/debugfs.h

   415	
   416	static inline void debugfs_create_cpumask(const char *name, umode_t mode,
   417						  struct dentry *parent, struct cpumask *value)
   418	{
 > 419		return ERR_PTR(-ENODEV);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
