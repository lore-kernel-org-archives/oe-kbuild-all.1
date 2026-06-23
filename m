Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCF32D7DEF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208853; cv=none; b=PxnPWen030SvCa7mhNKZOq2IAt9jdLZ4mc6K/SGBP3FEx2bFceQ/uPtCpzppuCUnySkswZWWgpoUIt6IyQd7gMSYJAjSSkSauEj+P3Wel+HAb0pPRNlULoiWI62qGE8Y7MCP78DhoSbAr6ifb8QXFYW7LsKxZUIDl5DXVqKwdOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208853; c=relaxed/simple;
	bh=eH+wyuwYQbgaT0xGWuI7AtGcqCXIQtR/LL7orR9lHJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hvz+UtI1Uc7fc+9fEbHABvkUdBsYfbZembcgq0tTPkNWZrzNkQND4uexJPIFo1aWQVQQobvUKd8qB4ZCcqpFP4NfqjYSQ6b+D78ti6TXCvE20gffdfK2sD34eyULJECikkeHdtQte3LrNPZSUnIfHcN2Mphq2r7Lqf42Lb97tKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2FweM5u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2FweM5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782208850; x=1813744850;
  h=date:from:to:cc:subject:message-id;
  bh=eH+wyuwYQbgaT0xGWuI7AtGcqCXIQtR/LL7orR9lHJY=;
  b=E2FweM5u+IIuoY0lZ2LH2lN8ttl1Lb1KskLsVfA5E34pVRe8FI6p4a+7
   atk9gs6sCCpSLaJKO5AsK+rWqXFaBixhca8cSRO9uqSFGVvqtOSe7tdsN
   8NgHUD2hQaCOq9MVjO+JqTiVAfQ42lT5W2jXcypb6mgvanmJiMgvmKfhK
   aqHPTViL6iKCQVW6vHmQ4CYVP7scd2jXGl9WdCI197aeSuEiZCW8GYodu
   neC+h17zRIubanxLzWCcatVjcHeB4HgaLu/HEBBm8FRkEX6/flWLk3+bN
   j387UbxW73EnRh/h67hA40zmzdyiSHVG+bY7GDnye8ZgwS30uGdKd4M8V
   g==;
X-CSE-ConnectionGUID: 5lKqeQKjRBSwdBpKbJGVcQ==
X-CSE-MsgGUID: v36MHm6hQ/W83+E6VYkVpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94338168"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94338168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:00:50 -0700
X-CSE-ConnectionGUID: M+cFkBD5SraviTRR2fhjBA==
X-CSE-MsgGUID: 9h8evxrWTkKGnuZqxDwvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="245335843"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2026 03:00:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbxvy-000000002P1-00xr;
	Tue, 23 Jun 2026 10:00:46 +0000
Date: Tue, 23 Jun 2026 18:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: net/sched/bpf_qdisc.c:205:18: sparse: sparse: symbol
 'bpf_kfree_skb_dtor' was not declared. Should it be static?
Message-ID: <202606231739.u9sdVZuA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d801f0ab03e4f32f9a33d203154ce84887921
commit: c99d97b46631c4bea0c14b7581b7a59214601e63 bpf: net_sched: Use the correct destructor kfunc type
date:   5 months ago
config: riscv-randconfig-r111-20260623 (https://download.01.org/0day-ci/archive/20260623/202606231739.u9sdVZuA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231739.u9sdVZuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c99d97b46631 ("bpf: net_sched: Use the correct destructor kfunc type")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231739.u9sdVZuA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/bpf_qdisc.c:205:18: sparse: sparse: symbol 'bpf_kfree_skb_dtor' was not declared. Should it be static?
   net/sched/bpf_qdisc.c:234:17: sparse: sparse: symbol 'bpf_qdisc_init_prologue' was not declared. Should it be static?
   net/sched/bpf_qdisc.c:261:18: sparse: sparse: symbol 'bpf_qdisc_reset_destroy_epilogue' was not declared. Should it be static?

vim +/bpf_kfree_skb_dtor +205 net/sched/bpf_qdisc.c

   204	
 > 205	__bpf_kfunc void bpf_kfree_skb_dtor(void *skb)
   206	{
   207		bpf_kfree_skb(skb);
   208	}
   209	CFI_NOSEAL(bpf_kfree_skb_dtor);
   210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
