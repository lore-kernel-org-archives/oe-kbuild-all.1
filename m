Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D05528643D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771041130; cv=none; b=fRb67jS9enEP9tbxKcDOw8Lvts4nC60a5VL/jp2CdRZoWanZAe7nup9we0bJhOnfalrRV3yLSpoQg+7J2046ciaRqfbyQArHRVLALD719fJ5kbyhgG4iHVgd4FTGcSfnv/JglHp4lRfcLLpnd2Ycy8IOOBD1g+JPUHvLtl0j8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771041130; c=relaxed/simple;
	bh=PXcDgysbEuUASaAzjTEiEAGOq/daJBefMGTCrQlRBrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OVkYgL9Ts7+AeC0X6pvFrYdi2E6fkilqP/Sp90XqweyZA1CEuYuxs5aHl3TXSf6sAjFrvahkqZuwdxiPXZblJXIkTZzTh5YdxPGKbRzuPVAQFS2OlooQ0LNDWlqB9R53wOl2YH68tDU2T+hk3PIhMTzZuVMkEAXv2FX3crpsW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avvZIiMx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avvZIiMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771041127; x=1802577127;
  h=date:from:to:cc:subject:message-id;
  bh=PXcDgysbEuUASaAzjTEiEAGOq/daJBefMGTCrQlRBrY=;
  b=avvZIiMxjbwah+0K224mM4uPf9inARAkraxA+CXhK/qZGAQXTrd0fHho
   RwCsO8vDJmAPpbJaGHDHtONaiFHJSSiH2JZssQTlzoPWolty7TDMti8VR
   D/45w9RlgpIauhhHBeuucjeO+wqP2DA/r1MvR8Tto9NTQkivXDk/w7UMN
   Cq3eEOaF4C4Y2yAZ/0eaukc7tk1reCHfIv8dBU8mx+X8QwZ3VHOIoAlBD
   /NMzjaiLcdsyLQ8TTMXudHPbG+ivaVZU70NMT8ZWm8Ud8gfAig7lRbQN+
   VChkawOtUefVlGIg1y6P681t+AjnRK3UVk32hrpTqaa4t4A47Uy9lq7Fc
   A==;
X-CSE-ConnectionGUID: qZOID8sJSeWNkvsU2UnCDA==
X-CSE-MsgGUID: 5CwxWLYlTDeYen81WB68cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72127796"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72127796"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 19:52:07 -0800
X-CSE-ConnectionGUID: Y67l4rDNTW+BFhiCvxucxA==
X-CSE-MsgGUID: GeVOKEiZTjOy3a2jqMnKfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="242414666"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2026 19:52:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr6hP-00000000w8y-1k1u;
	Sat, 14 Feb 2026 03:52:03 +0000
Date: Sat, 14 Feb 2026 11:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:qp-trie 4/8] kernel/bpf/qp_trie.c:35:5: error:
 flexible array member in a struct with no named members
Message-ID: <202602141132.qtNXygBZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git qp-trie
head:   85dca79aa9199152741f7429b86cf4cb78f21124
commit: 8e2c1f634e226c78b9fe6fcf77a0e1d2769d7143 [4/8] bpf: Add QP-trie map type
config: parisc-randconfig-001-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141132.qtNXygBZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141132.qtNXygBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141132.qtNXygBZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/qp_trie.c:35:5: error: flexible array member in a struct with no named members
      35 |  u8 data[]; /* key[key_size] followed by value[value_size] */
         |     ^~~~


vim +35 kernel/bpf/qp_trie.c

    33	
    34	struct qp_trie_leaf {
  > 35		u8 data[];	/* key[key_size] followed by value[value_size] */
    36	};
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
