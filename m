Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3AA15A8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 01:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712538717; cv=none; b=uux3wrKHovO/CX70/As8yc3VgOlg/m1eih7VK2i6nFa1B5Gz856Abg4MYUx1E9wWK91W/DMKS7nEc8ZJWLqG3qFrpb+n+14U/8vhyno2PR3U7wiqomg2HdgZo8LUVjxAiKc6efgx+POU76P/7GFjmo6rYr8WFImKPdT6haKldAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712538717; c=relaxed/simple;
	bh=oSlF9BhOr0tTraeR0jCfKTdPgQuAu7ub3qldNq9U0bs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QMjFN7ZfpIIN83uQxKOkTcbYWXymf2sGu3RQ3ihJSQStG/asS6jQNE25n/0cPu5QkUYMKJpGEcszd3ZSxl9k3p8b45FHtLcP07RL6Fxe0JFtRhOI/Tf7+qquIm0ywAa7zI9HJ4T7amDOhNRxCxck4J/QxLuKW0YoJBfAJzqeH14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cP86+mwr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cP86+mwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712538714; x=1744074714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oSlF9BhOr0tTraeR0jCfKTdPgQuAu7ub3qldNq9U0bs=;
  b=cP86+mwrDOZPUAWMg2n27je8w4Bu15wq7/zAuV5JlRnT0ldmzkYyt/oI
   tQEQfqnPA4XmfyvUEmjYcloUixlMbSSUVHiJZ11dV4fkeJsOpzIXlpOGA
   npUS5vnO3tpIxwrG+4ak3znbPQCq/iuq5IZHaCS1W5XwpM6iZU2jIZHFl
   vMlTFKnxIiBXtf5PWsiIUOSBJMkM3qAKvJlKlS2rl7OVSc/RTpQBvE+o3
   +QmN0ZyoFcQahY8RjbzUNCjnpzyi0PbTlNYc1vvPbT70tLJN6I49SP+CJ
   kVz9WSA/jiQGpoeFNguu4pgLXr8KLXRNqBzCxATAKM21tAfYbR6AUz6T6
   Q==;
X-CSE-ConnectionGUID: srihmDCgR+2xbkQi9k1/Ow==
X-CSE-MsgGUID: AkPWyPi6TTu1NxXLRiKp8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="19237404"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="19237404"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 18:11:53 -0700
X-CSE-ConnectionGUID: sFQDoeXbTEW9BU4OW0HHAg==
X-CSE-MsgGUID: CounF8vqT4GbfcpLRlCTqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="24494483"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2024 18:11:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtdY4-0004ks-18;
	Mon, 08 Apr 2024 01:11:48 +0000
Date: Mon, 8 Apr 2024 09:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3427/4242] WARNING: modpost: vmlinux: section
 mismatch in reference: (unknown)+0x1788 (section: __ex_table) -> .LASF745
 (section: .debug_str)
Message-ID: <202404080918.beDnJRyy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
commit: 23f5507fb176717bfe7a73dc27f2ef14777ff51b [3427/4242] mm: memcg: add NULL check to obj_cgroup_put()
config: riscv-buildonly-randconfig-r001-20230517 (https://download.01.org/0day-ci/archive/20240408/202404080918.beDnJRyy-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404080918.beDnJRyy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404080918.beDnJRyy-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13a4 (section: __ex_table) -> .LASF666 (section: .debug_str)
ERROR: modpost: __ex_table+0x13a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13a8 (section: __ex_table) -> .LASF668 (section: .debug_str)
ERROR: modpost: __ex_table+0x13a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x13b0 (section: __ex_table) -> .LLST753 (section: .debug_loc)
ERROR: modpost: __ex_table+0x13b0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14a0 (section: __ex_table) -> .LASF3206 (section: .debug_str)
ERROR: modpost: __ex_table+0x14a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14a4 (section: __ex_table) -> .LASF3208 (section: .debug_str)
ERROR: modpost: __ex_table+0x14a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14ac (section: __ex_table) -> .LASF3210 (section: .debug_str)
ERROR: modpost: __ex_table+0x14ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14b0 (section: __ex_table) -> .LASF3212 (section: .debug_str)
ERROR: modpost: __ex_table+0x14b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14b8 (section: __ex_table) -> .LASF3214 (section: .debug_str)
ERROR: modpost: __ex_table+0x14b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14bc (section: __ex_table) -> .LASF3216 (section: .debug_str)
ERROR: modpost: __ex_table+0x14bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14c4 (section: __ex_table) -> .LASF3218 (section: .debug_str)
ERROR: modpost: __ex_table+0x14c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14c8 (section: __ex_table) -> .LASF3220 (section: .debug_str)
ERROR: modpost: __ex_table+0x14c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14d0 (section: __ex_table) -> .LASF567 (section: .debug_str)
ERROR: modpost: __ex_table+0x14d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14d4 (section: __ex_table) -> .LASF569 (section: .debug_str)
ERROR: modpost: __ex_table+0x14d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14dc (section: __ex_table) -> .LASF571 (section: .debug_str)
ERROR: modpost: __ex_table+0x14dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14e0 (section: __ex_table) -> .LASF573 (section: .debug_str)
ERROR: modpost: __ex_table+0x14e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14e8 (section: __ex_table) -> .LASF575 (section: .debug_str)
ERROR: modpost: __ex_table+0x14e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14ec (section: __ex_table) -> .LASF577 (section: .debug_str)
ERROR: modpost: __ex_table+0x14ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14f4 (section: __ex_table) -> .LASF578 (section: .debug_str)
ERROR: modpost: __ex_table+0x14f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x14f8 (section: __ex_table) -> .LASF580 (section: .debug_str)
ERROR: modpost: __ex_table+0x14f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x153c (section: __ex_table) -> .LLST383 (section: .debug_loc)
ERROR: modpost: __ex_table+0x153c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1554 (section: __ex_table) -> .LLST386 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16c0 (section: __ex_table) -> .LASF3799 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16c8 (section: __ex_table) -> .LASF3801 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16cc (section: __ex_table) -> .LASF3803 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16d4 (section: __ex_table) -> .LASF3805 (section: .debug_str)
ERROR: modpost: __ex_table+0x16d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16d8 (section: __ex_table) -> .LASF3807 (section: .debug_str)
ERROR: modpost: __ex_table+0x16d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16e0 (section: __ex_table) -> .LASF3809 (section: .debug_str)
ERROR: modpost: __ex_table+0x16e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16e4 (section: __ex_table) -> .LASF3811 (section: .debug_str)
ERROR: modpost: __ex_table+0x16e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16ec (section: __ex_table) -> .LASF3813 (section: .debug_str)
ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16f0 (section: __ex_table) -> .LASF3869 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16f8 (section: __ex_table) -> .LASF3196 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x16fc (section: __ex_table) -> .LASF3198 (section: .debug_str)
ERROR: modpost: __ex_table+0x16fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1704 (section: __ex_table) -> .LASF3200 (section: .debug_str)
ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1708 (section: __ex_table) -> .LASF3202 (section: .debug_str)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1710 (section: __ex_table) -> .LASF3204 (section: .debug_str)
ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1714 (section: __ex_table) -> .LASF3206 (section: .debug_str)
ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x171c (section: __ex_table) -> .LASF3208 (section: .debug_str)
ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1720 (section: __ex_table) -> .LASF3210 (section: .debug_str)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1728 (section: __ex_table) -> .LASF3212 (section: .debug_str)
ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x172c (section: __ex_table) -> .LASF3220 (section: .debug_str)
ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1738 (section: __ex_table) -> .LLST1152 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1740 (section: __ex_table) -> .LLST1154 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1744 (section: __ex_table) -> .LLST1155 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x174c (section: __ex_table) -> .LLST1156 (section: .debug_loc)
ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1758 (section: __ex_table) -> .LLST1158 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x175c (section: __ex_table) -> .LLST1160 (section: .debug_loc)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1770 (section: __ex_table) -> .LLST1162 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1774 (section: __ex_table) -> .LLST1163 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1774 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x177c (section: __ex_table) -> .LASF741 (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1780 (section: __ex_table) -> .LASF743 (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1788 (section: __ex_table) -> .LASF745 (section: .debug_str)
ERROR: modpost: __ex_table+0x1788 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x178c (section: __ex_table) -> .LASF747 (section: .debug_str)
ERROR: modpost: __ex_table+0x178c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1794 (section: __ex_table) -> .LASF749 (section: .debug_str)
ERROR: modpost: __ex_table+0x1794 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1798 (section: __ex_table) -> .LASF751 (section: .debug_str)
ERROR: modpost: __ex_table+0x1798 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17a0 (section: __ex_table) -> .LASF753 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17a4 (section: __ex_table) -> .LASF755 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17ac (section: __ex_table) -> .LASF757 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17b0 (section: __ex_table) -> .LASF759 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17b8 (section: __ex_table) -> .LASF761 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17bc (section: __ex_table) -> .LASF763 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17c4 (section: __ex_table) -> .LASF765 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17c8 (section: __ex_table) -> .LASF767 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17d0 (section: __ex_table) -> .LASF769 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x17d4 (section: __ex_table) -> .LASF771 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x183c (section: __ex_table) -> .LC80 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x183c references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1860 (section: __ex_table) -> .LC82 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x186c (section: __ex_table) -> .LC83 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x186c references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1870 (section: __ex_table) -> .LC84 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1870 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1878 (section: __ex_table) -> .LC85 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x187c (section: __ex_table) -> .LC86 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x187c references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1884 (section: __ex_table) -> .LASF31 (section: .debug_str)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1888 (section: __ex_table) -> .LASF33 (section: .debug_str)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18ac (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18ac references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18b4 (section: __ex_table) -> .LLST833 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18b4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18b8 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18c0 (section: __ex_table) -> .LLST835 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18c0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18c4 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18c4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18cc (section: __ex_table) -> .LLST837 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18cc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18d0 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18d0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18d8 (section: __ex_table) -> .LLST840 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18d8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18dc (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18e4 (section: __ex_table) -> .LASF4847 (section: .debug_str)
ERROR: modpost: __ex_table+0x18e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18e8 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18f0 (section: __ex_table) -> .LLST393 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18f4 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x18fc (section: __ex_table) -> .LLST396 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18fc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1900 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1900 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1908 (section: __ex_table) -> .LLST399 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x190c (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x190c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1914 (section: __ex_table) -> .LASF4849 (section: .debug_str)
ERROR: modpost: __ex_table+0x1914 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1918 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1918 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1920 (section: __ex_table) -> .LLST403 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1920 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1924 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x192c (section: __ex_table) -> .LASF4851 (section: .debug_str)
ERROR: modpost: __ex_table+0x192c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1930 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1930 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1938 (section: __ex_table) -> .LASF4852 (section: .debug_str)
ERROR: modpost: __ex_table+0x1938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x193c (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x193c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1944 (section: __ex_table) -> .LLST407 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1944 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1948 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1948 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1954 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1960 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x196c (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x196c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1978 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1984 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1984 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x198c (section: __ex_table) -> .LASF4854 (section: .debug_str)
ERROR: modpost: __ex_table+0x198c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1990 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1998 (section: __ex_table) -> .LLST149 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x199c (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x199c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x19a4 (section: __ex_table) -> .LLST152 (section: .debug_loc)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x19a8 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x19b0 (section: __ex_table) -> .LASF4855 (section: .debug_str)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x19b4 (section: __ex_table) -> .LLST831 (section: .debug_loc)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x19bc (section: __ex_table) -> .LASF4856 (section: .debug_str)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x19c0 (section: __ex_table) -> .LASF4857 (section: .debug_str)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
