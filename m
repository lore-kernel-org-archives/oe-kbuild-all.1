Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72D51C02
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 01:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712282006; cv=none; b=qXr1SGHoh9pq5cI93a3+OiHxE1UREhbewWLXtfWQwIMTwWkQvmP+irYu3qRhqhlscHFdsHXmqzNuZvt2n/cAvrHrToUEBUCMx5B+NmqOXm/xBUv/ArzEPvLC+iskiMPgCa+WJT7XRbQ/iIpW5bCddcbkxI93JtpTX4eH5VCNNy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712282006; c=relaxed/simple;
	bh=8CzqFsDTKK/ukOeTo1RUgDtvo311nfQZaNVBf8HqETo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZ8LUwnOsXtV16wsS9f9Jx3l0GdfouxiBHlrXp3Gg1R09fPmgeoPJ244c9qMUQ6j+WX4PFhMIsbBIk7fxPJIPuiZuYvMQpfN/oGjrdcdA8BWSV/a2v236LfJP3jtzq2HTJ+vpSD/A3NL4L7KEIEL0LpbpuFaQ3SmaHk2Dwmfqt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/at0aSZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/at0aSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712282003; x=1743818003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8CzqFsDTKK/ukOeTo1RUgDtvo311nfQZaNVBf8HqETo=;
  b=K/at0aSZpPOllo3kUXbzQLHMbbPAnUciXiHk4vgj69gH2HZTDGR29k92
   ggBeLa8Z3lG64s9CYcw7TJBz5d2DORX2oqxQ6e5GR0Jd7en7LtVk1vPWh
   YGakmoGZMmOAdxLBq2tCe36uOzjwy4Qsr2ygAYCrI01WGJ545nkRLEkWC
   d55tb+OlEVEFd0STQcRcwUNAeniqoKl3xz94sJ1KCrOqFaPqkFbol4JE0
   ftCbNJenKyZ4EyZSobYu6vntkQje3kohpjc+FKyW1uMtyuHwmZx3OjC/A
   vVzc8VrR/VZkNx2RP2el5Q23BevvbgWoHSOJ3TGDFvH3j8WP9nqc21jd+
   Q==;
X-CSE-ConnectionGUID: qlJBKyOeSh6wsot9NgIpew==
X-CSE-MsgGUID: vW0ZQCvSQbGqkHELrw2fsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11376930"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="11376930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 18:53:23 -0700
X-CSE-ConnectionGUID: QJqRuZrqQWmPk6VTNZp3sA==
X-CSE-MsgGUID: MhzDEULCSUqgXbosrNgcdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23478649"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2024 18:53:21 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsYla-0001kQ-2b;
	Fri, 05 Apr 2024 01:53:18 +0000
Date: Fri, 5 Apr 2024 09:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [linux-next:master 2709/3921] WARNING: modpost: vmlinux: section
 mismatch in reference: (unknown)+0x1488 (section: __ex_table) -> .LASF136
 (section: .debug_str)
Message-ID: <202404050934.bdQwGSAA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
commit: 302519d9e80a7fbf2cf8d0b8961d491af648759f [2709/3921] asm-generic/io.h: kill vmalloc.h dependency
config: riscv-buildonly-randconfig-r005-20221114 (https://download.01.org/0day-ci/archive/20240405/202404050934.bdQwGSAA-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050934.bdQwGSAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050934.bdQwGSAA-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: local symbol 'simple_strtoull' was exported
ERROR: modpost: vmlinux: local symbol 'simple_strtoul' was exported
ERROR: modpost: vmlinux: local symbol 'simple_strtol' was exported
ERROR: modpost: vmlinux: local symbol 'simple_strtoll' was exported
ERROR: modpost: vmlinux: local symbol 'vsnprintf' was exported
ERROR: modpost: vmlinux: local symbol 'vscnprintf' was exported
ERROR: modpost: vmlinux: local symbol 'snprintf' was exported
ERROR: modpost: vmlinux: local symbol 'scnprintf' was exported
ERROR: modpost: vmlinux: local symbol 'vsprintf' was exported
ERROR: modpost: vmlinux: local symbol 'sprintf' was exported
ERROR: modpost: vmlinux: local symbol 'vbin_printf' was exported
ERROR: modpost: vmlinux: local symbol 'bstr_printf' was exported
ERROR: modpost: vmlinux: local symbol 'bprintf' was exported
ERROR: modpost: vmlinux: local symbol 'vsscanf' was exported
ERROR: modpost: vmlinux: local symbol 'sscanf' was exported
ERROR: modpost: vmlinux: local symbol 'minmax_running_max' was exported
ERROR: modpost: vmlinux: local symbol 'xas_load' was exported
ERROR: modpost: vmlinux: local symbol 'xas_nomem' was exported
ERROR: modpost: vmlinux: local symbol 'xas_create_range' was exported
ERROR: modpost: vmlinux: local symbol 'xas_store' was exported
ERROR: modpost: vmlinux: local symbol 'xas_get_mark' was exported
ERROR: modpost: vmlinux: local symbol 'xas_set_mark' was exported
ERROR: modpost: vmlinux: local symbol 'xas_clear_mark' was exported
ERROR: modpost: vmlinux: local symbol 'xas_init_marks' was exported
ERROR: modpost: vmlinux: local symbol 'xas_split_alloc' was exported
ERROR: modpost: vmlinux: local symbol 'xas_split' was exported
ERROR: modpost: vmlinux: local symbol 'xas_pause' was exported
ERROR: modpost: vmlinux: local symbol '__xas_prev' was exported
ERROR: modpost: vmlinux: local symbol '__xas_next' was exported
ERROR: modpost: vmlinux: local symbol 'xas_find' was exported
ERROR: modpost: vmlinux: local symbol 'xas_find_marked' was exported
ERROR: modpost: vmlinux: local symbol 'xas_find_conflict' was exported
ERROR: modpost: vmlinux: local symbol 'xa_load' was exported
ERROR: modpost: vmlinux: local symbol '__xa_erase' was exported
ERROR: modpost: vmlinux: local symbol 'xa_erase' was exported
ERROR: modpost: vmlinux: local symbol '__xa_store' was exported
ERROR: modpost: vmlinux: local symbol 'xa_store' was exported
ERROR: modpost: vmlinux: local symbol '__xa_cmpxchg' was exported
ERROR: modpost: vmlinux: local symbol '__xa_insert' was exported
ERROR: modpost: vmlinux: local symbol 'xa_store_range' was exported
ERROR: modpost: vmlinux: local symbol 'xa_get_order' was exported
ERROR: modpost: vmlinux: local symbol '__xa_alloc' was exported
ERROR: modpost: vmlinux: local symbol '__xa_alloc_cyclic' was exported
ERROR: modpost: vmlinux: local symbol '__xa_set_mark' was exported
ERROR: modpost: vmlinux: local symbol '__xa_clear_mark' was exported
ERROR: modpost: vmlinux: local symbol 'xa_get_mark' was exported
ERROR: modpost: vmlinux: local symbol 'xa_set_mark' was exported
ERROR: modpost: vmlinux: local symbol 'xa_clear_mark' was exported
ERROR: modpost: vmlinux: local symbol 'xa_find' was exported
ERROR: modpost: vmlinux: local symbol 'xa_find_after' was exported
ERROR: modpost: vmlinux: local symbol 'xa_extract' was exported
ERROR: modpost: vmlinux: local symbol 'xa_delete_node' was exported
ERROR: modpost: vmlinux: local symbol 'xa_destroy' was exported
ERROR: modpost: vmlinux: local symbol 'clear_page' was exported
ERROR: modpost: vmlinux: local symbol '__delay' was exported
ERROR: modpost: vmlinux: local symbol 'udelay' was exported
ERROR: modpost: vmlinux: local symbol 'ndelay' was exported
ERROR: modpost: vmlinux: local symbol '__asm_copy_to_user' was exported
ERROR: modpost: vmlinux: local symbol '__asm_copy_from_user' was exported
ERROR: modpost: vmlinux: local symbol '__clear_user' was exported
ERROR: modpost: vmlinux: local symbol 'xor_regs_2_' was exported
ERROR: modpost: vmlinux: local symbol 'xor_regs_3_' was exported
ERROR: modpost: vmlinux: local symbol 'xor_regs_4_' was exported
ERROR: modpost: vmlinux: local symbol 'xor_regs_5_' was exported
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13b0 (section: __ex_table) -> .LASF1893 (section: .debug_str)
ERROR: modpost: __ex_table+0x13b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13b4 (section: __ex_table) -> .LASF1895 (section: .debug_str)
ERROR: modpost: __ex_table+0x13b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13ec (section: __ex_table) -> .LASF1680 (section: .debug_str)
ERROR: modpost: __ex_table+0x13ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13f0 (section: __ex_table) -> .LASF1682 (section: .debug_str)
ERROR: modpost: __ex_table+0x13f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13f8 (section: __ex_table) -> .LASF394 (section: .debug_str)
ERROR: modpost: __ex_table+0x13f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13fc (section: __ex_table) -> .LASF396 (section: .debug_str)
ERROR: modpost: __ex_table+0x13fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1404 (section: __ex_table) -> .LASF398 (section: .debug_str)
ERROR: modpost: __ex_table+0x1404 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1408 (section: __ex_table) -> .LASF400 (section: .debug_str)
ERROR: modpost: __ex_table+0x1408 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1428 (section: __ex_table) -> .LASF2193 (section: .debug_str)
ERROR: modpost: __ex_table+0x1428 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x142c (section: __ex_table) -> .LASF2195 (section: .debug_str)
ERROR: modpost: __ex_table+0x142c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1434 (section: __ex_table) -> .LASF2197 (section: .debug_str)
ERROR: modpost: __ex_table+0x1434 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1438 (section: __ex_table) -> .LASF2199 (section: .debug_str)
ERROR: modpost: __ex_table+0x1438 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1458 (section: __ex_table) -> .LLST3914 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1458 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1464 (section: __ex_table) -> .LLST3917 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1464 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1468 (section: __ex_table) -> .LLST3919 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1468 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1470 (section: __ex_table) -> .LLST3921 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1470 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1474 (section: __ex_table) -> .LLST3923 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1474 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1480 (section: __ex_table) -> .LLRL3926 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1480 references non-executable section '.debug_rnglists'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1488 (section: __ex_table) -> .LASF136 (section: .debug_str)
ERROR: modpost: __ex_table+0x1488 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x148c (section: __ex_table) -> .LASF138 (section: .debug_str)
ERROR: modpost: __ex_table+0x148c references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1494 (section: __ex_table) -> .LASF140 (section: .debug_str)
ERROR: modpost: __ex_table+0x1494 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1498 (section: __ex_table) -> .LASF142 (section: .debug_str)
ERROR: modpost: __ex_table+0x1498 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14a0 (section: __ex_table) -> .LASF1737 (section: .debug_str)
ERROR: modpost: __ex_table+0x14a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14a4 (section: __ex_table) -> .LASF1739 (section: .debug_str)
ERROR: modpost: __ex_table+0x14a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14ac (section: __ex_table) -> .LASF1741 (section: .debug_str)
ERROR: modpost: __ex_table+0x14ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14b0 (section: __ex_table) -> .LASF1743 (section: .debug_str)
ERROR: modpost: __ex_table+0x14b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14b8 (section: __ex_table) -> .LASF1745 (section: .debug_str)
ERROR: modpost: __ex_table+0x14b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14bc (section: __ex_table) -> .LASF1747 (section: .debug_str)
ERROR: modpost: __ex_table+0x14bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1500 (section: __ex_table) -> .LASF1022 (section: .debug_str)
ERROR: modpost: __ex_table+0x1500 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1504 (section: __ex_table) -> .LASF1024 (section: .debug_str)
ERROR: modpost: __ex_table+0x1504 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x150c (section: __ex_table) -> .LASF1026 (section: .debug_str)
ERROR: modpost: __ex_table+0x150c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1510 (section: __ex_table) -> .LASF1028 (section: .debug_str)
ERROR: modpost: __ex_table+0x1510 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1518 (section: __ex_table) -> .LASF1030 (section: .debug_str)
ERROR: modpost: __ex_table+0x1518 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x151c (section: __ex_table) -> .LASF1032 (section: .debug_str)
ERROR: modpost: __ex_table+0x151c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1798 (section: __ex_table) -> .LLRL2170 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1798 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17b0 (section: __ex_table) -> .LLST1998 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17b8 (section: __ex_table) -> .LLST2000 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17bc (section: __ex_table) -> .LLST2002 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17c4 (section: __ex_table) -> .LLST2004 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17e0 (section: __ex_table) -> .LLST2930 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x17e0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1800 (section: __ex_table) -> .LASF3344 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1804 (section: __ex_table) -> .LASF3346 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x180c (section: __ex_table) -> .LASF3348 (section: .debug_str)
ERROR: modpost: __ex_table+0x180c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1810 (section: __ex_table) -> .LASF3346 (section: .debug_str)
ERROR: modpost: __ex_table+0x1810 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1824 (section: __ex_table) -> .LLST1850 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1824 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1828 (section: __ex_table) -> .LLST1852 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1828 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1830 (section: __ex_table) -> .LLST1854 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1830 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1834 (section: __ex_table) -> .LLST1856 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1834 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1840 (section: __ex_table) -> .LASF6368 (section: .debug_str)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x184c (section: __ex_table) -> .LLST1844 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x184c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1854 (section: __ex_table) -> .LLST1846 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1854 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1858 (section: __ex_table) -> .LLST1848 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1870 (section: __ex_table) -> .LLST1836 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1870 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1878 (section: __ex_table) -> .LLST1838 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x187c (section: __ex_table) -> .LLST1840 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1884 (section: __ex_table) -> .LLST1842 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: event_f2fs_issue_reset_zone+0xc (section: .data) -> big_key_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x268 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x274 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x278 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x284 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x288 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x294 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x298 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x2a4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x2a8 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ethnl_netdev_notifier+0x2b4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x20 (section: .data) -> .LBE709 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x2c (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x30 (section: .data) -> .LBE710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x34 (section: .data) -> .LBE709 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x40 (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x44 (section: .data) -> .LBE710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x48 (section: .data) -> .LBE709 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x54 (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x58 (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x5c (section: .data) -> .LBE709 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x68 (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x6c (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x70 (section: .data) -> .LBE712 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x7c (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x80 (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x84 (section: .data) -> .LBB717 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x90 (section: .data) -> .LBE717 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x94 (section: .data) -> .LBB710 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0x98 (section: .data) -> .LBE709 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsq_tasklet+0xa4 (section: .data) -> .LBB710 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
