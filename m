Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922382;
	b=LrfzeLwaw8BuwAVd3lW7k6eM2glrkKtW1Fh6KHGuEqAgaXBeMbHjwRB8p/mcsR8CKA/J
	 R2WZqSEM1nXDen+9EPPtWTgn3ezuPcigAVpF0ohiaZbC+Med5VwZr1TeTaWt0WNMlMplc
	 NV8DjHpgKa88b/sqWp7abfsnA9AhI6nNG2VaPS3xrF/t9JN7SBP2d/6iIEy2RqFt+VpfL
	 cd1N//Yykf6L//25PsdcCGrjgvGSkG2t+xWo0Y0IoK9w3Gv+2smSQNbxMLgIuHts7P0Gd
	 UJPsXtSOa7uOdvyaMxKrfKqLkSHVCguVxqvAAxQq3Tbb1UaMXfic3UQ7lVh9hjeKvnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922382;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mty3QCtny+kxDlCmdX8ssy+X5iQX3S1usQjDW0VglUg=;
	b=SVQugRAT15GUOfShn9Vy0lzfRVHU03ftHlaOYRTJOy3iv8iGNzvK8ayAWbSI7IE2xKBa
	 3JsipwCfLJitH3fFMiqJXD5rldDBEmKLaEL1K+IlQ0J0e5I3+ZjyZ8h6HFSI0B5rhZs4z
	 i8CyolwH2AM63ssjzabE6hDg3Vg33AS0D5f8t1lj63vG3iZy8A0GVs8C4QFptnmi6KPEI
	 CgYXsmtlMF4UimIk4Lr4v+2ONnJeqi3P8/rClUwyygfjHbOoF/n3I+3iON5WAHlJPgqAL
	 pUfBQXFwMxBUcULn2Y2gIbhVDNljxlCue2ZbS+U7g0a3VC5IWoSo+7nhglX14mW6ZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQdLlc+i;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF6F606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 13:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQdLlc+i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794922382; x=1826458382;
  h=date:from:to:cc:subject:message-id;
  bh=B3k19C46oxvmNK98eF2GKdwx5NtCxSNcnqEGDdv1USw=;
  b=DQdLlc+ibkAs8xj2q3KeR8dynwrnRaJ4Ks9cCKUhNqVERRCztigCWSQ3
   uoGWGrKp/40Z8UxHa6KqKPQcHtdE4BXbQRna2DW7NKtslAy9hrZKQo/Ao
   fIJhLQ06Ft80+wy5p8F55mUZokyaeoH5/HnYEkYKwjNxRA6r1cjxHb6CR
   GmVHRGQ8CM1zJl1hJ76FvgFLaTL+P2VivOzM+uO8VE+ag/XOqh12FhcJn
   NK3Vkijefo31gf7qLt4CrLwK9uPvaIOkNztxwPLv6GXpZazmaEbkqQG/P
   pII+XBBDkDNriGUYxTG9t0XmdRF9flqpNVTtJAvzwhEUHqxNUe23uxRXK
   g==;
X-CSE-ConnectionGUID: D68opgvhRt6tOy3l0W+YXQ==
X-CSE-MsgGUID: dgvu4RBEQ4i2feTaRAIJHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3681699"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3681699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:33:01 -0800
X-CSE-ConnectionGUID: R/IVg+3bT3qJIE/3qgtrGQ==
X-CSE-MsgGUID: IuquUHOGSnC0xtDuk6C0vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9624490"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2026 05:33:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTJIn-0000000037i-2Sf0;
	Tue, 17 Nov 2026 13:32:49 +0000
Date: Tue, 17 Nov 2026 14:32:05 +0100
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees+treewide@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 strncmp+0x40 (section: .text.unlikely) -> initcall_level_names (section:
 .init.data)
Message-ID: <20261117142858.2AAnSUeF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: 0af298e62e5cff4ebf9bec47b8711177a7e2f115 treewide: refresh kmalloc_obj() conversions
date:   11 days ago
config: xtensa-randconfig-r2306-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117142858.2AAnSUeF-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117142858.2AAnSUeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0af298e62e5c ("treewide: refresh kmalloc_obj() conversions")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117142858.2AAnSUeF-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: strncmp+0x40 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
