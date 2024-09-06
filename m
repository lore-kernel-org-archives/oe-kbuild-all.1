Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF5E1D5CDB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725654116; cv=none; b=nG3UH7j/dkkhD4+cBTbKp37kpyI6flpwlhX/nsIWqjjIX7uZ6zcUYua+Navua++FNCvdFAoUN8M/DBmMz7XdJrg/HcJJ6Zv/vfmAE3opuTlzSz6zouXTWaXzhI2UcQOEmQQ5NmEfvYPeXS6aiMvPvekBoiqEGlqinNRGcmH/qto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725654116; c=relaxed/simple;
	bh=Z0faJocwXpaa07ctahBkmuiWBOl1Ec3JVsHkN4X5lOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oXj1oTb2sMOb6Rddz7zeR+EiMMunh3hg0XkbZOAV6DKqM4oWr9JSDRdsBwWE+P9KAy226VqiRxgF2zlyP0OaoyPKUufpqUSk7BxPTh9dn3nRXOVvoUGf8Psy91NFgNOLs7x4SThbu4jhrxlSIxQNU4tdU27kLqEjfJ+QhdIvYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7yagB77; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7yagB77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725654116; x=1757190116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z0faJocwXpaa07ctahBkmuiWBOl1Ec3JVsHkN4X5lOo=;
  b=H7yagB77CbEp6iUVR9cdb/F6GoEzTRWNe24CVHaLn8i40VhKw5/nn1ul
   Ie+1LiGjUx2YDZEtM+96yDYk7w0VgW/6TlZpcR7T5Rvqc2rSw7e1v4CXr
   G6xXPyXu06HEK3Jm30TmMPsVlQMFYdCLRzAkpLh2r6+GFgn1WThqjZBh4
   UMvGRAgTQTiz7gsJl45CP2Zefl+2e7DBKxXHkxRSmgEiu9qrputoaXmf+
   pvRUfegLt4ulo+T2xmLl24M686JC5Y/gQ7I1IC1Rt2ED0yI708CtvQj8U
   OLySLBBhTLPJGz2jK/JSCBwtix9FgGkVuYk7j5j1WkT/ZP0aV93sRyoAL
   A==;
X-CSE-ConnectionGUID: n7T0jBR6SdC3jWcwK/WdXw==
X-CSE-MsgGUID: WV2vimZyTRSjn7gxgLuSsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="46951373"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="46951373"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 13:21:55 -0700
X-CSE-ConnectionGUID: rYFXymkkTF2dJ87q2mrc+w==
X-CSE-MsgGUID: RnhK9HN8RuqrYxwZKheaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="70847751"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2024 13:21:54 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smfSp-000BgJ-08;
	Fri, 06 Sep 2024 20:21:51 +0000
Date: Sat, 7 Sep 2024 04:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: {standard input}:4719: Error: opcode not supported on this
 processor: mips32r6 (mips32r6) `dmfgc0 $6,$9,7'
Message-ID: <202409070438.79SGqcTc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b831f83e40a24f07c8dcba5be408d93beedc820f
commit: a640d6762a7d404644201ebf6d2a078e8dc84f97 MIPS: mipsregs: Set proper ISA level for virt extensions
date:   7 months ago
config: mips-randconfig-r111-20240819 (https://download.01.org/0day-ci/archive/20240907/202409070438.79SGqcTc-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070438.79SGqcTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070438.79SGqcTc-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:4719: Error: opcode not supported on this processor: mips32r6 (mips32r6) `dmfgc0 $6,$9,7'
>> {standard input}:4731: Error: opcode not supported on this processor: mips32r6 (mips32r6) `dmtgc0 $2,$9,7'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
