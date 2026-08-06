Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C895E3115AF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013292; cv=none; b=aTY6+92it2XOnLYbU5Tw68CdNZGvDXKPsjF0b9NaeMCzwzhtARyIKkLm3/wtlkpgMvcf9ShckT2eXXy5GjB1dwOTHly7oz/x8ts04VUa6bGDalpFTsy5xVuNFcUztQMDtXP9lAj4PURsImZMvVx+4wySdxXQg05XP85cxEFkWAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013292; c=relaxed/simple;
	bh=+46GIy4xVYY30itfzwjgrFHJ4FhqxPuK1HExPEmX/Ug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a2soufo5w5K18gVsxOWtAFlVrwKOXGGi6Cfc1/ws+5+Nbe/YB86MWxjpVYAKSBfS+WYppW2ycLJpLbiXejL3S6S3hCnUlOOuZKm7gByc9qy69B44VS5wQxhvX0x9qv2W/Gsjn6OL9FStuo+jeLDVp23n94Jzu7kB735Jcoipxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gwaff+Fp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gwaff+Fp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786013291; x=1817549291;
  h=date:from:to:cc:subject:message-id;
  bh=+46GIy4xVYY30itfzwjgrFHJ4FhqxPuK1HExPEmX/Ug=;
  b=Gwaff+Fpt0LlV+6BlolAYrGDorD/32kJ+SvQcvtp2bfyqApvH8ALNAw1
   yWfeCaBwtUQszIy5Ra9aCI2yrVxtghZ74DaaoYEBaNu3+URishrfsfdWH
   l1MfK5BzTvvT/VuL3bCkCIxg3IK+/zIHaHmlEsjeToavBlPp0BiTdM+LU
   B9n59SLpEuNXiHoxAOAo7jUF2ayYmyefNOwfqktpIKx7JjDXOLChJT45b
   glxZSr5YfUb2trVDivZcsTWwY13CxXXW3XHf5dlGgwCIKACKH8eBYZXls
   mrN+BbD9RL1vZGp3N6kMA6OrobVSEuUcMjr/1M0qExS9kFSsnSss6m3U/
   g==;
X-CSE-ConnectionGUID: 6VDiwkhaQ3OUZc2aJvydFg==
X-CSE-MsgGUID: 0/PYTLxyTOCICKw/7CQ2wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90420814"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="90420814"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:48:10 -0700
X-CSE-ConnectionGUID: NwVHLBz+RPqkJ9W3UjpUsw==
X-CSE-MsgGUID: 7K++6bwiSCmzK9IMyz9AvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265561963"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Aug 2026 03:47:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrvdY-00000000Etd-2sLw;
	Thu, 06 Aug 2026 10:47:44 +0000
Date: Thu, 06 Aug 2026 18:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, K Prateek Nayak <kprateek.nayak@amd.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [tip:locking/core 9/15] kernel/futex/core.c:62:16: sparse:
 sparse: cast truncates bits from constant value (123456789abcdef becomes
 89abcdef)
Message-ID: <202608061810.6iW9waJn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   1c7efabfbaf796f11000a46094a69955a01ec6cc
commit: b78b0b65825275f58336a43611a700de174be8c3 [9/15] futex: Use runtime constants for __futex_hash() hot path
config: i386-randconfig-r132-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061810.6iW9waJn-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061810.6iW9waJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061810.6iW9waJn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/core.c:532:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:532:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:532:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:532:51: sparse:     got void *
   kernel/futex/core.c:548:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:548:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:548:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:548:51: sparse:     got void *
>> kernel/futex/core.c:62:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)

vim +62 kernel/futex/core.c

    59	
    60	static __always_inline struct futex_hash_bucket **futex_queues(void)
    61	{
  > 62		return runtime_const_ptr(__futex_queues);
    63	}
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
