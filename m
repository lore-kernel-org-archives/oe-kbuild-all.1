Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614172;
	b=cymYcIIT7TbD48KSoBWrWZQ6fwPISahHj0SP8igJ0gYoT4vwhiXmlX+Vd1pNYtsTrmQL
	 sq1c41a7SbfCQBvpwxOge1fntMgCDTFoBcNDMeLAKMxjkRoJ7HBfVsBlYT7rTR5ApO+ac
	 w3Au2b7X0BQGM9Y+Wq8VMefJKJFASgzG/cpIu8YMFo1f1QM3ywSjXj/Vwu9y7ZiCNYEA4
	 Nz1VLtZwMHL14ByBe8wnFl260clBBPpLIQygqYbxjCljbTtt2KKc8FOJu9oMbWzwWHpVA
	 zbOrBr4Ei5njgzskQhlVhkDgd6hpVmAObzuMnM+Y/BqfExEwLzAUpsZdWdbtA0J0r6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614172;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Z+bFzdbVLN2D+lZsuPAXWmapC/tcJCM6ivPex4GdFYo=;
	b=xFomDGPV76z8wk8qhpPoo5fvQgM7byA8mhTZn7ZHpube7FQZB230WfrNWXPQ9M6+O87y
	 4GExthbEzEoWhu61NLj2KUrmqxrmM9MFj0U+KQzoDzEYylfRBZZuRbUREsUHQJIK9OnkD
	 pBuVc7KqfsHSrFEKFqI2ObWKQzKHVr+Gm7FHAeVkAaPnSwZYsQsdjrVd2Uo7zzynVnMFs
	 fgvWiRaQdvPaOIX8XvcDs9NYgHrBYTzrmxqNAf/YAkpgqSguh115kCt49+10oViz/TYKI
	 ynPzDiI7Od+WcW/iEEZPXiFKP/jhArZL0sEmnhyz78w1ECiY/SiO1gnazuGJSZrahfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+Nn56zr;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0346D606A321
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 13:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0346D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+Nn56zr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795614171; x=1827150171;
  h=date:from:to:cc:subject:message-id;
  bh=VXG+MwojxPxv7q2scO39XHQZZoTAO6s60o44hCniOzE=;
  b=Q+Nn56zrVjsuHpAnvB77GF8uyDobistJ2XfZwAtugc3/sQ/vVbjB8+YT
   W6R3RAEFGJK/tycqN0R9FVcvXI7kk0V/Of2//+Dh8Tsc9+aOzdvQblsHw
   twr3rXf7lqAQ6HXzD5fEHkswBfFEhhvPmxeZjfjupkrPAU8Dw2cDfK0sw
   oM6dhQlSnPhPwF9/SF9o0Y3JeDmAyM7uNwTjV3RzDtOM63qQSQ144I5xq
   zrzcdgHqdpcZAPz2dJcIqmiMjvFNGmjpXhnQqTCady47nwTAOrPVJ7ePp
   +EO9gbPsvxRimgfGrQmHJCXs6V6wsBpNGFsiLaXJhO0I0nM5yRo7AnYHv
   g==;
X-CSE-ConnectionGUID: AffCW4EmQYiy9xc7prbxfQ==
X-CSE-MsgGUID: sg0UBHsmSO67ev5wvEIruQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4396893"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4396893"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:42:50 -0800
X-CSE-ConnectionGUID: J5LetRNlRd6F14ptEOsfzw==
X-CSE-MsgGUID: r3dZbi4xS4aZATHZF2ngQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12465449"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2026 05:42:47 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWDGm-0000000008d-3PpG;
	Wed, 25 Nov 2026 13:42:44 +0000
Date: Wed, 25 Nov 2026 14:42:22 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 8898/11500] net/6lowpan/nhc.c:140:13:
 sparse: sparse: cast removes address space '__rcu' of expression
Message-ID: <20261125143949.UXhG7C7o-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3dd8c790a7b7027abdd568e36db5e82ffaea7c77
commit: 111e1b0b985e3dbb41fffc6b5832c3322b6e38d5 [8898/11500] 6lowpan: nhc: use RCU instead of lowpan_nhc_lock
config: riscv-randconfig-r2305-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125143949.UXhG7C7o-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125143949.UXhG7C7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125143949.UXhG7C7o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/6lowpan/nhc.c:140:13: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +140 net/6lowpan/nhc.c

   137	
   138	int lowpan_nhc_add(const struct lowpan_nhc *nhc)
   139	{
 > 140		if (cmpxchg(&lowpan_nexthdr_nhcs[nhc->nexthdr], NULL,
   141			    RCU_INITIALIZER(nhc)))
   142			return -EEXIST;
   143	
   144		return 0;
   145	}
   146	EXPORT_SYMBOL(lowpan_nhc_add);
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
