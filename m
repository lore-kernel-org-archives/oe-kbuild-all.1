Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976769;
	b=2DObIxIYW1MjLzU1Naj3nS6tnRPJBOyduml64xcpim+PCUoE1uOfCF3aUKbVapYBT5fL
	 9jGTIIB+1kKVpro9LFvH0ez0dhwHuPGekSbnqCJXPkldafDJdS346yUqEsnJOqvYO38R2
	 JwawunZp+CL6KkZgPmx2tCNpo+9Z0NqwliI8iiY7ZWCejZ9Ik05PrqL96x7NPQ0XjMoAU
	 /ZPAWjvLvXGcbZN/ooGr6JQ/tITG/oyI/+D/nQXoWlCioniATM8kiBuUH7646MYxSqaQp
	 NHlbpeCdVWX8Txu4OyXYfo+Gpm05cYSKkESKBWQSrugGP4R7pOMFUlvSn3Y5dvlfMoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976769;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Q2ThZGkmx/eHEiRnCHCk1qcucE3xOo81KphUkPwibvU=;
	b=qnW8veqVweJy/F08zbpjPUZIwv9ZoiYxcY0HtVhyuhegptDWG8oCj1odHdDAXFPAH4j7
	 kNh7d/OglCG3sQPz2PueW3YNe+pXumkHQyzpEeGqyLHG8JcwB1sv2foU3FhBpg3TGKLSk
	 t8xTRdJU3vERn8ho9jWdEWdoDkTJaU5eP3upFeUe3zer5qD/quQCpuIRDTS1GF49jtRdL
	 aVMYDrw012SOE+hhOJnWYYTiHsj3HwL0oe5KbvWrzzbxr9VU+FCMXakaOEJpHG65kSayp
	 xvsZq2bbkwwgmysX93UWnW3rTDKlQOamIc+hCVVFbzwbl7/A9mm7Azc3aXZWjnXQFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YL3WXcVT;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17872606A32A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 04:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17872606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YL3WXcVT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794976769; x=1826512769;
  h=date:from:to:cc:subject:message-id;
  bh=r7wR2OsautTOLpRVM69D0oS6hECdF44ruw0wyep4NMY=;
  b=YL3WXcVT1KhqLNgYOimBxLFXokgNhdhywQSPBeVk4kTfrZSAkp+Vn75x
   Ni2ffDjT+17YTvTtocw8+1GXKTI46be6syHJbOzJE/LD5JwoL0g0IemFg
   TKHnu8irGQrKh5KxveezinBosXxY7V3sEFboWobjPw++HqzBpqrY1F4Cz
   /FF4b0btIvQK7lpNsPIiEsRmBs2lnE74DfbFn1RaKnbZhz7on3JcraxRm
   N0k9DNsMa8fbyslNbTjoMHbTJoiuDjZR67LrH09kLavCf9gGEcQqUnYTT
   fNANsKyDZsj2TrU2pwxJWNk8KFCxTZx8jm3MkO/EacHWy4CkclTef4kZM
   w==;
X-CSE-ConnectionGUID: BfPnsGMoQc+JZF6Cb+jhrQ==
X-CSE-MsgGUID: Mo/lBKwYQG++ZsyQiD5reg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3657333"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3657333"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 20:39:29 -0800
X-CSE-ConnectionGUID: ZHFYZ+CyT2KAbI+1QVV3og==
X-CSE-MsgGUID: Ov03iGIoRuSrHF1zu2d/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10151713"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2026 20:39:27 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTXS9-000000003KU-0gHx;
	Wed, 18 Nov 2026 04:39:25 +0000
Date: Wed, 18 Nov 2026 05:39:22 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was not
 declared. Should it be static?
Message-ID: <20261118053742.bbC3d0Qf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Neill,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   8c75ea48a76401ef6e5d894fe15befd2e4d6e1e8
commit: 4a5826e549a3bd3bc3d81e19a1e2420f5f2070ef [1/1] Revert "ANDROID: disble the UID_SYS_STATS driver"
config: x86_64-randconfig-r2304-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118053742.bbC3d0Qf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118053742.bbC3d0Qf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118053742.bbC3d0Qf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/uid_sys_stats.c:38:12: sparse: sparse: symbol 'uid_lock' was not declared. Should it be static?

vim +/uid_lock +38 drivers/misc/uid_sys_stats.c

3669a3205af35a5 Neill Kapron 2023-05-08  31  
12788836b1f36ef Jin Qian     2015-03-11  32  #define UID_HASH_BITS	10
b6115e140102a29 Peifeng Li   2023-04-13  33  #define UID_HASH_NUMS	(1 << UID_HASH_BITS)
12788836b1f36ef Jin Qian     2015-03-11 @34  DECLARE_HASHTABLE(hash_table, UID_HASH_BITS);
b6115e140102a29 Peifeng Li   2023-04-13  35  /*
b6115e140102a29 Peifeng Li   2023-04-13  36   * uid_lock[bkt] ensure consistency of hash_table[bkt]
b6115e140102a29 Peifeng Li   2023-04-13  37   */
b6115e140102a29 Peifeng Li   2023-04-13 @38  spinlock_t uid_lock[UID_HASH_NUMS];
12788836b1f36ef Jin Qian     2015-03-11  39  

:::::: The code at line 38 was first introduced by commit
:::::: b6115e140102a290143ec02a3a2b3d5aec506b3a ANDROID: uid_sys_stat: split the global lock uid_lock to the fine-grained locks for each hlist in hash_table.

:::::: TO: Peifeng Li <lipeifeng@oppo.com>
:::::: CC: Neill Kapron <nkapron@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
