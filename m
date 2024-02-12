Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2656DFBFC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707726282; cv=none; b=FAMdiRLaxdEQuIfKLiaPNoythBL2YbWa16sEQFcUE0utz8KIniekyh5dISnUsDTcEMSGRCIR3xE3Ld7B+B4OFk7KHUH+Pnt/hCJyawPc+jl7G7xLUQbrsV/xIw0zq780nQ8mkpbD4fRINT/MRJLXa6DJJj96DVT/slu5376g6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707726282; c=relaxed/simple;
	bh=evG198+kB183IkSs01Vb60TrWYb0VKDDfeFOfJUo1Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmV4NrPN2pmJFu7Ho94t9qW2p0uPm7FiROw9wcZ7WQ8//h2DOHRJDXOacisBpXhXAdDFyB11JJEdOPU5h5waLXkxgOQDPnlqPI9sG4dgOUFAYi96d0cKd70M5DSMF3L9volu2qdN2U9HwAu/7EZt7SgHH4f+GJTJdKDpi09wwNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2xY9BKh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2xY9BKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707726280; x=1739262280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=evG198+kB183IkSs01Vb60TrWYb0VKDDfeFOfJUo1Yw=;
  b=F2xY9BKhY8Jr44ehb4YmrG1q6+uBlndF3er1VJjHV6XDe716gNTIGjjI
   cGEEjDBQpkvD1sM50/FUmgOXsQdnvV0C/76gNMDHIV1V3y/TSm61fnx/X
   phuVJB8J9XhyevXwQK5C6tIVOg6zZuVTCJW0okhdUH8Pnv9+hrka5XV3g
   ZyivDLeQpjhU+r1s4ISZU0P2/euWm/3Y03btcYrW3RfVl8ywvjpXUuf5+
   742jNqt8evnY+eqF15MZOvSooDMKFJmQLiKnvLduMNarbqVxHMEboxwMt
   rJGH05CIjwsagiwDD4xl8DVdQeOd+7PhR3JYji6PnZE4k2jFCft567X9H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1594323"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1594323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 00:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="7152965"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2024 00:24:37 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZRcA-00071K-3C;
	Mon, 12 Feb 2024 08:24:34 +0000
Date: Mon, 12 Feb 2024 16:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sophgo:sg2000/stuck 3/5] clk-cv18xx-pll.c:undefined reference to
 `__udivdi3'
Message-ID: <202402121653.vR0g9zpy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sophgo/linux.git sg2000/stuck
head:   1420ad016c811326d57be88f38fc355cbc1b5462
commit: 275b931b1a033fd3a1733d2eede791b589fcbe5e [3/5] clk: sophgo: Add CV1800/SG2000 series clock controller driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240212/202402121653.vR0g9zpy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402121653.vR0g9zpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402121653.vR0g9zpy-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/clk/sophgo/clk-cv18xx-pll.o: in function `fpll_recalc_rate':
>> clk-cv18xx-pll.c:(.text+0x310): undefined reference to `__udivdi3'
>> m68k-linux-ld: clk-cv18xx-pll.c:(.text+0x324): undefined reference to `__umoddi3'
   m68k-linux-ld: drivers/clk/sophgo/clk-cv18xx-pll.o: in function `fpll_find_rate.isra.0':
   clk-cv18xx-pll.c:(.text+0x448): undefined reference to `__udivdi3'
   m68k-linux-ld: clk-cv18xx-pll.c:(.text+0x460): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
