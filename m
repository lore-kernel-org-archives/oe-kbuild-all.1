Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5523F39D0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968580; cv=none; b=u0zqsUuX1fWzMP/HKuV7cp+MDwhPJ3ZHk37ZaP1qYtbPcARGYmfl8bQ+Hk38BzABBaqqcTuDUujPa4KwBTJ3eNPfXP5jdzOPOwunZuxa0dRPzUvucIobgJmlVu3v/HZBg/PK6XcQJPc6IxNWNVWlUIjrxEUGqBQlAbzvaL/vZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968580; c=relaxed/simple;
	bh=Q018WIfOvzsASSQgsAsbvCVUlqdbDRpiVs/mafwQl7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aOmUWrh5+XKTQH33R9nXWcfgGj8aFwtoXs86WiVxiLH+f8oZ1rwj3s2vrQl1PhUO0Ft0cbs2ZR08nQvjwj/MydmmTvPt8joiNpUa3J2eNDxyzA5055Mb2aELH6QnN8urU/ULP4mbnsYdoj8IgAkaRH6cQ2NrkJo3yIxy0HN+7yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZerRqy9Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZerRqy9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785968579; x=1817504579;
  h=date:from:to:cc:subject:message-id;
  bh=Q018WIfOvzsASSQgsAsbvCVUlqdbDRpiVs/mafwQl7M=;
  b=ZerRqy9Y1/8wq+6e9A2fnFEnua/y+hl7fsqqPt8oWqBYq4s3Snl/rVy2
   iwel1S9KRWdQy9f/RGJRu25NGmpdGEYU+OH6OPV8pjKmDx9GW/EkdUy2S
   Q/ei4ySPz2WkHMCNKAcCp1GssVfAKeOdkBfW7vaS/eDMZuobuQ1t8aOqz
   1ZwEv2HF6WKSO+x6nwmeC6xPK4UKUau15jJeY04kk+58sE1ESt65UxWiJ
   3FH/nrYxM1WAmoNcpMJM2ZC3y44kb8tMFw3T2GeybhLpRAoBXZ1uDlPON
   RkuzmY7VnpgZith6W+ka6ud3h9YqKCZVgXjXYNfCLt8PRmgASlPhR+Lmr
   w==;
X-CSE-ConnectionGUID: cL6Eg8HmTZuFo9GSEBioow==
X-CSE-MsgGUID: zXz2Y7y8QDSIUEG9qXniOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="103956705"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="103956705"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:22:58 -0700
X-CSE-ConnectionGUID: UkjWXXuXQByeE/RhymBKBw==
X-CSE-MsgGUID: 2Ww1jp5NRkaA+V6yoXA28Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="265773497"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Aug 2026 15:22:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrk0k-00000000DZ2-44UV;
	Wed, 05 Aug 2026 22:22:54 +0000
Date: Thu, 06 Aug 2026 06:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:pfncache-rcu-debug 8/9] ERROR: modpost: "__umoddi3"
 [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202608060535.iMcNAnE7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux pfncache-rcu-debug
head:   8c4982ab129843cd9340cb055dfb6947aba11b78
commit: 024c810fe3ba3772608c193103449d9f1f7f5c37 [8/9] [NOT-FOR-UPSTREAM] debug: steal-time GPC invalidation counters
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260806/202608060535.iMcNAnE7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060535.iMcNAnE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060535.iMcNAnE7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [arch/x86/kvm/kvm.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
