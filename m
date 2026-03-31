Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D15944BCB0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 21:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991755; cv=none; b=GKOpktqXjLpjC9bws1f4aFMtLjX7N/tscbz+IMa4zBS54niOvEYVYAEqIS5FftwwD0B25yg97ZE9AWDCSD7cSi+H8pJtiMeE5hSGsourp+18R9llMwZER2IGEYcyBaAHJXoqpvNqqJ8Tx4WM6vEvHbJtOZKiSXI4KFE/7fvespw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991755; c=relaxed/simple;
	bh=ZfYD0dZNEXKHls8fL8IgeO+KRg7VpdEC3u7S8jwbigo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lmgN/exFF1gYgSn1vr0c69AdmbxQOyVdC4Nt5kh1INJVG00Zk1Kvnd7wybWXaHPqBpN9UGJ3LtH4ZPjz111GFkc8tQm7D5kD07P55yoPgP0M9tE5wowkgcvcGlljOm5eF5Q/SAe0DVokuZ1GyIdZzAVU7JO3pG81u19x+fCTRTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJOYOckW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJOYOckW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774991753; x=1806527753;
  h=date:from:to:cc:subject:message-id;
  bh=ZfYD0dZNEXKHls8fL8IgeO+KRg7VpdEC3u7S8jwbigo=;
  b=QJOYOckWvTmio8eTWT/EpQNdQY/Q/WclG4pnmleLoEckaCCyH7HfbZ5K
   jUQanyZrtSY8WdKvQ2Q2o96QbNkeeVcNuon5AHHrB3C9y31WhDqRDr40d
   yNqldEFi9OzN8af5kQzXuDnUU/XllG0azMKdl0KDRarNzIqgU7TfZxEnJ
   6XfO1mIVy5G/vWz6d3h5ndBNMYGd/WeXuWy293ZBYN1cP689wkHyxca7f
   7Q3sfFbhZ9Pny3I+RAXi41IQ2pXdmgAX0Yf6YUZmoQo4HMb9Tlif8cD96
   yTzZVzNJ8/kywTcMbyFvEgRfwUZzJOQrMqIpS0ulBJflDPrASEMH2jET3
   Q==;
X-CSE-ConnectionGUID: WNMhiSA2Tx+e/Jg8xc628Q==
X-CSE-MsgGUID: Mgh+6LsYTq22LHCl62nd2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76135729"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76135729"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:15:53 -0700
X-CSE-ConnectionGUID: vSK3N+k0Qjizfo2gKd6i0A==
X-CSE-MsgGUID: MQA/5HRPRXqR6OrqB6UJjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="225659353"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 31 Mar 2026 14:15:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7gRB-000000008Wz-07v5;
	Tue, 31 Mar 2026 21:15:49 +0000
Date: Tue, 31 Mar 2026 23:15:29 +0200
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/obt 4/5]
 drivers/misc/lkdtm/bugs.c:957:22: warning: variable 'promoted' set but not
 used
Message-ID: <202603312317.YodqgiXD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
head:   4ea34e6b6a719e744a10a08cbe8d0fdaa4682f9a
commit: 9ec0cb0c2fb8323a3aff6678a73c2f91a98f94f2 [4/5] lkdtm/bugs: Add basic Overflow Behavior Types test
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260331/202603312317.YodqgiXD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312317.YodqgiXD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312317.YodqgiXD-lkp@intel.com/

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
