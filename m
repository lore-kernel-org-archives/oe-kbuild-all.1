Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3154774
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003940; cv=none; b=nl94ZT6FLPfyN66fnUctwcFNqcfekpv5VjkkZSrVKasuKBhqaX/0sjpuy3zhzzyOmeAJOWUZ4cf02Dz6uxZ9l7RYjsoNvlZTSYBfWlB/1lF4dRu6/Hf2tFgoQ9z/Y3u8+/UuH+hTkEeWPcRW7KVjJZQU31by1XjmYCTuKP0galc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003940; c=relaxed/simple;
	bh=AluMwUL+UHYQG78erEtAIrMnQTv9tWlPGVA5mmUYeJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ONzhD7CJpM8F3mTbI0abEujBFY8gJ68f4K6bbWsxlGj74W+n37pvPXZ71j8ZSsv2xmRQXc9K9+b2n/dJrz0V0tnTMu5lJbvM9cv9PG20Acp/2jXFP4tm7ZJXDTuh1R4+qeg3iv88Ckt1UZuwSwStqij51S+AqkLQ6mDFfV+xbCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhJZK6Ym; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhJZK6Ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775003939; x=1806539939;
  h=date:from:to:cc:subject:message-id;
  bh=AluMwUL+UHYQG78erEtAIrMnQTv9tWlPGVA5mmUYeJM=;
  b=MhJZK6Ym5niAVCKiPK5NkXXk+QVTzQTIbGqb7h91r9VhFUyml7Jptjfw
   VY4gqFm5iTp+v+syA6O23LcpDSe0waXzJgRJ82VwegQhirJ+OMeDt4cZ2
   HRskRWpwKO7oql6b8JTi9UIQAud3h08PNkK0s2IONW9C+4sbxwaY6FVSB
   5A3he31bX+cmRkwgGi+qF4MYZ3urc6QH0/t4nAoAoDpv5kpnvitHnlO3X
   9gFY0MG4bqsoINH0NM37kvCCOGMr7HuoUG+IGkjAYQqVTYiFUjaicbXyJ
   OoBEDx8z7A0FXp1dVNI/QVb9rYYiYsBSu8sbgpu7BsSFN30USamNFhBZg
   g==;
X-CSE-ConnectionGUID: 4vgR5IwQQjKeOABT8d9pPQ==
X-CSE-MsgGUID: wE2b5ByySKGuufiG8x4Wew==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87109222"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87109222"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 17:38:59 -0700
X-CSE-ConnectionGUID: gO1ABiRCR/eoMAwTEYxhoQ==
X-CSE-MsgGUID: MmDpbHUzReaKLHbCsmH7nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230585830"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 17:38:57 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7jbi-000000004Uh-1Y9n;
	Wed, 01 Apr 2026 00:38:54 +0000
Date: Wed, 01 Apr 2026 08:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/obt-rename 4/5]
 drivers/misc/lkdtm/bugs.c:957:22: warning: variable 'promoted' set but not
 used
Message-ID: <202604010811.k2etXFhU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt-rename
head:   4ea34e6b6a719e744a10a08cbe8d0fdaa4682f9a
commit: 9ec0cb0c2fb8323a3aff6678a73c2f91a98f94f2 [4/5] lkdtm/bugs: Add basic Overflow Behavior Types test
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260401/202604010811.k2etXFhU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010811.k2etXFhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010811.k2etXFhU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/lkdtm/bugs.c: In function 'lkdtm_OBT_ADD':
>> drivers/misc/lkdtm/bugs.c:957:22: warning: variable 'promoted' set but not used [-Wunused-but-set-variable]
     957 |         unsigned int promoted;
         |                      ^~~~~~~~
   drivers/misc/lkdtm/bugs.c: In function 'lkdtm_OBT_ADD_SIGNED':
   drivers/misc/lkdtm/bugs.c:990:13: warning: variable 'promoted' set but not used [-Wunused-but-set-variable]
     990 |         int promoted;
         |             ^~~~~~~~


vim +/promoted +957 drivers/misc/lkdtm/bugs.c

   951	
   952	static void lkdtm_OBT_ADD(void)
   953	{
   954		/* Promotion means no overflow checking can happen. */
   955		volatile u8 __ob_trap a8 = 250;
   956		volatile u8 __ob_trap b8 = 30;
 > 957		unsigned int promoted;
   958		/* 32-bit or larger, however, get checked. */
   959		volatile u32 __ob_trap a = UINT_MAX - 1;
   960		volatile u32 __ob_trap b = 2;
   961		unsigned long long happy;
   962		unsigned long long outcome;
   963	
   964		/* Promotion means a8 + b8 happens as "int __ob_trap", so no trap. */
   965		pr_info("Performing promoted overflowing unsigned addition\n");
   966		promoted = a8 + b8;
   967	
   968		pr_info("Performing idiomatic unsigned overflow addition test\n");
   969		if (a + b < a) {
   970			/* Report status so test isn't elided by compiler. */
   971			pr_info("ok: overflow contained by conditional\n");
   972		}
   973	
   974		pr_info("Performing non-overflowing unsigned addition\n");
   975		happy = b + b;
   976	
   977		pr_info("Expecting trap on overflowing unsigned addition\n");
   978		outcome = a + b;
   979	
   980		pr_err("FAIL: survived unsigned addition overflow: %u + %u -> %llu (ok: %u + %u -> %llu)\n",
   981			a, b, outcome, b, b, happy);
   982		pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
   983	}
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
