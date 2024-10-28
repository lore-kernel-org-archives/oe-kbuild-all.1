Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF041DED68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730129292; cv=none; b=LLW1wFj2lR606cvzMUWZF+rM71I4TnZ9RNanoflZW6qTvut5egEsKaQ+hzAMzCt0Nn4buylVRZ7/bQBTMHHyZDINcjmrYt2PueR9AMM9swa72h/XmRZpxSjWljsWFRqeOI976VYiKoC4rolrG9aLz7Heekdk5Edhp5liLMotYPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730129292; c=relaxed/simple;
	bh=oY/YkoarWJv/FffyjVuQqBtS+ffbN4KoaV9mEuvx24c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8PIwgYq+VS+5J0MIgmnjqCUz70xf6BDnVqdCJqYZF4dp6XinYJ9umrGsPFvrvLHrGsrYAqGRLhWwJMywXk47NRaQRlV7GvQN6iTMugylQcwlvKVU4oRF/lj07XJEfRqcWJkeABEJLdP2cUlN94EE485BoYyHUperkswsxbS/sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=em3FHkHE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="em3FHkHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730129290; x=1761665290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oY/YkoarWJv/FffyjVuQqBtS+ffbN4KoaV9mEuvx24c=;
  b=em3FHkHEElSX6PYhyUB8urGUbR6Am9n1y8wRonjZDRZtotmKt2VveT4z
   Yv+brA1nlfbkJcZYHBPNWDl3iHH8Gkv93eZndPb0G0sD4KXHSa6W2BD4D
   Sp5KlGnpZ0eaknTYPiCBJ3Oc5d7Zs2NRfB0zF3h5AtDH/RsBE15kJQ1K5
   Va9sb0PWTgijvWOiUqdlzLLBym7MZl9tcwuODa0ecDY9+Q5oQ8XO8Hh/5
   nNY7FWLFabhXefuewqWbsNucbaRLDZE7IDPgEAk5Ubb9MSZNx3igy/ikf
   K7pYMSzwPYD89YpCUcUcXBNWIxhRmOUgMlJBblJ7I7ZyV1SCYI5RFnF8Q
   w==;
X-CSE-ConnectionGUID: 9vsetBC7RUubbjmWtArRwQ==
X-CSE-MsgGUID: RyQFNQtrQQ2+kG9rPDiUQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40269320"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40269320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:28:10 -0700
X-CSE-ConnectionGUID: 457qTFUXRlmjY5no9b9IYQ==
X-CSE-MsgGUID: C0543KVsQJWPXmFAluOSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81224655"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2024 08:28:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Rf4-000cZE-15;
	Mon, 28 Oct 2024 15:28:06 +0000
Date: Mon, 28 Oct 2024 23:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26477/30000] arch/x86/kvm/mmu/mmu.o: warning:
 objtool: mmu_set_spte()+0x79d: unreachable instruction
Message-ID: <202410282334.pOpu4nRk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8dcdd5a432518f8f8deb6ab608551ecda71bda40
commit: 86d7f506e7147594712be20f0160b2e7f0b447f7 [26477/30000] KVM: x86: mmu: trace kvm_mmu_set_spte after the new SPTE was set
config: x86_64-randconfig-014-20241028 (https://download.01.org/0day-ci/archive/20241028/202410282334.pOpu4nRk-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282334.pOpu4nRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282334.pOpu4nRk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.o: warning: objtool: mmu_set_spte()+0x79d: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
