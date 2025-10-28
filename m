Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C26A34C83D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 18:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761677613; cv=none; b=re1EeCkS22GQJ1g7s155Rggky5VzsPcba8o4BFFayZtoOJUHn4GnWz7CHfIve4IQ81+RW6xveBRRbTeKMbRQG1V/kybhIh0nYcMgHIzPI44/jqs1Onn/kr2qBx9ejsJydRpmkaRTSbXV+uYMComjck+crIYYMOn3AIdRNhCXFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761677613; c=relaxed/simple;
	bh=Zv3thFUsBmLcShLvhXZXk0e34qooOkbCIl7giJAZ2T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lvNw30bXoxF9M/+55LLe7yM9EE3F8QDeeLWWN7zQ75vyd5AxSph4AMGDx8yPLOq6XZO53f2B1yHuJ3y0hyUZVH2OgMH21taKk0A/Q4uTP7oB5hAVYvyI8d/n1PRYtZ6JCkTMWn+nmqz5HOp1/JrapgVTeO7SWC4cyPd8E4IEgP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEg8cWi9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEg8cWi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761677611; x=1793213611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zv3thFUsBmLcShLvhXZXk0e34qooOkbCIl7giJAZ2T8=;
  b=cEg8cWi92xp9rHJxKn6ZJ+6ZVF8X0i1jti46iXJUSbjN3kdEjtjq1dAk
   VU7uFhVp0YVvtpHzF9f1zm/042ZNK5uqfwX6D50Myn1ftwSJqKzg6IoLG
   EjrHvS7uEmpHc54284AtnmreG2l7jDH8qsVSQn1I/VkcjNyzwRSgINkrZ
   Y822wTqV0x1z2hmH5iH15Ehwt/32A0X7GlzDf3FYdyMJS9K+Gef1J6Wu1
   +rjV/L4gssNj3Qkg4sQNnWw/yCev8cpvf1am08W2HYe3qIhqzk4HvSjOC
   Lf2A3Ws1bnRRK3kP2Qv1/d+sb/nXBuSH6B3JgHeq54YBAb99NlUuXwpuZ
   Q==;
X-CSE-ConnectionGUID: zAKc9rnFS6m7XQl0a29iqQ==
X-CSE-MsgGUID: fwTDuelWT0yehsDJ5nKs0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74079149"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="74079149"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 11:53:31 -0700
X-CSE-ConnectionGUID: etx50GHOSSe2H/nzBjwL6w==
X-CSE-MsgGUID: ETsdx6nCTiur6MlrPReHwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189747685"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Oct 2025 11:53:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDoov-000JcW-0k;
	Tue, 28 Oct 2025 18:53:25 +0000
Date: Wed, 29 Oct 2025 02:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1890/1890] mm/hugetlb.o: warning:
 objtool: copy_hugetlb_page_range()+0x299: undefined stack state
Message-ID: <202510290252.pFTAw24p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3749a0fa9e1453451f807b1ca86250ed77c17f05
commit: f19f5c49bbc3ffcc9126cc245fc1b24cc29f4a37 [1890/1890] x86/speculation/l1tf: Exempt zeroed PTEs from inversion
config: x86_64-buildonly-randconfig-006-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290252.pFTAw24p-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290252.pFTAw24p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290252.pFTAw24p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c:3865:40: warning: expression does not compute the number of elements in this array; element type is 'unsigned long', not 'u32' (aka 'unsigned int') [-Wsizeof-array-div]
    3865 |         hash = jhash2((u32 *)&key, sizeof(key)/sizeof(u32), 0);
         |                                           ~~~ ^
   mm/hugetlb.c:3854:16: note: array 'key' declared here
    3854 |         unsigned long key[2];
         |                       ^
   mm/hugetlb.c:3865:40: note: place parentheses around the 'sizeof(u32)' expression to silence this warning
    3865 |         hash = jhash2((u32 *)&key, sizeof(key)/sizeof(u32), 0);
         |                                               ^
   1 warning generated.
>> mm/hugetlb.o: warning: objtool: copy_hugetlb_page_range()+0x299: undefined stack state

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
