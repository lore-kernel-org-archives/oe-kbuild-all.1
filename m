Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EEB2FD7C3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 03:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198359; cv=none; b=HzpVN5sTJT9UnJqt5VO6Lwl+pIp4KL8IRcbqRjN8ot5MGQWxqUWGuTjDTETY8yQicCC9wfO2pHRQyoS82E2PzQnBuko6nEFPdHuxllY4Xcm1qXLWAyjeSpdnNIkzmNfVxDAfYSxnCaKP3gCfdmmj9ncKW3BPnwI4DHc/qi9fChY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198359; c=relaxed/simple;
	bh=1t0hb2GTg/2Dz7DLwKhDsMhutUFfB+dc7Lr+xc1ruG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dR++6E7bXUIikhlZhDf1Sp4WRaNO3z89xi1/hVBJKz4FK5cBYufWuk2R/e2JqPIpZnF3Jm/DS6Uj8gjyFH0rv0wnw7ndSxC/TmW6mHeWrsRNP1OjnsC49WyTC87gzGHTImqn0+P9h6NuWAiSc5QXSkbo8nFE9O5fNdX/F2QYtZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMZWlKRm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMZWlKRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773198359; x=1804734359;
  h=date:from:to:cc:subject:message-id;
  bh=1t0hb2GTg/2Dz7DLwKhDsMhutUFfB+dc7Lr+xc1ruG8=;
  b=cMZWlKRmNfK9AyFRosVRUuP9M6sDI2n28N1EzEbH5zFlIoViebxV8EqJ
   OCLEBbfqQYs4S78+vkqELS1HJ73TO7rBybnJAQXkDtyuz8O0DrrHUAG0D
   HI3FiVOm1TEtSWxmtXNup9iNM0AHv/04JawB8KP1E5Q4KktRTXQnpJPxP
   JjRCK8m6tsQlxq15C3ZtrYi/nj1QuYG4zxJB9k/imM5YSRPTHR2qrKfge
   29sxqv7jGy/mY1DdbaiWOKKYPv86t7lJqLg7vdpW6IU1p/4ClgA/W5G3O
   Oehr2bLDzQgkFm4V1yFi8TYXCy7kVWb9PKgBmfMO9U84k1/JLdaa4v0Pd
   w==;
X-CSE-ConnectionGUID: Qr79+17eRXean1Cbxhi6Nw==
X-CSE-MsgGUID: RQc9j8SrTBuBA3KTNWk5dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74447317"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74447317"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 20:05:56 -0700
X-CSE-ConnectionGUID: LjUBIfRIToO/XssSPfcGjg==
X-CSE-MsgGUID: 6y6stxE7RsesgX0X9yv8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216621214"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2026 20:05:54 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w09tP-000000000d9-48Km;
	Wed, 11 Mar 2026 03:05:51 +0000
Date: Wed, 11 Mar 2026 11:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260309 14/19]
 mm/mmu_gather.c:25:46: warning: comparison of distinct pointer types lacks a
 cast
Message-ID: <202603111157.7Sj2sANh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260309
head:   e9c10f65a9dba55b2ab308e88aeb068d775d1a65
commit: f51f62a26a08681ba34f2d3e8df8395c91ecd8c1 [14/19] mm/mmu_gather: avoid dozens of -Wflex-array-member-not-at-end warnings
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260311/202603111157.7Sj2sANh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111157.7Sj2sANh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111157.7Sj2sANh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mmu_gather.c: In function 'tlb_next_batch':
>> mm/mmu_gather.c:25:46: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
      25 |         if (tlb->delayed_rmap && tlb->active != &tlb->local)
         |                                              ^~


vim +25 mm/mmu_gather.c

952a31c9e6fa963 Martin Schwidefsky 2018-09-18  19  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  20  static bool tlb_next_batch(struct mmu_gather *tlb)
196d9d8bb71deaa Peter Zijlstra     2018-09-03  21  {
196d9d8bb71deaa Peter Zijlstra     2018-09-03  22  	struct mmu_gather_batch *batch;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  23  
c47454823bd4e3a Linus Torvalds     2022-12-06  24  	/* Limit batching if we have delayed rmaps pending */
c47454823bd4e3a Linus Torvalds     2022-12-06 @25  	if (tlb->delayed_rmap && tlb->active != &tlb->local)
5df397dec7c4c08 Linus Torvalds     2022-11-09  26  		return false;
5df397dec7c4c08 Linus Torvalds     2022-11-09  27  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  28  	batch = tlb->active;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  29  	if (batch->next) {
196d9d8bb71deaa Peter Zijlstra     2018-09-03  30  		tlb->active = batch->next;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  31  		return true;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  32  	}
196d9d8bb71deaa Peter Zijlstra     2018-09-03  33  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  34  	if (tlb->batch_count == MAX_GATHER_BATCH_COUNT)
196d9d8bb71deaa Peter Zijlstra     2018-09-03  35  		return false;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  36  
adf085ff0d6fde5 Qianfeng Rong      2025-08-12  37  	batch = (void *)__get_free_page(GFP_NOWAIT);
196d9d8bb71deaa Peter Zijlstra     2018-09-03  38  	if (!batch)
196d9d8bb71deaa Peter Zijlstra     2018-09-03  39  		return false;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  40  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  41  	tlb->batch_count++;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  42  	batch->next = NULL;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  43  	batch->nr   = 0;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  44  	batch->max  = MAX_GATHER_BATCH;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  45  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  46  	tlb->active->next = batch;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  47  	tlb->active = batch;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  48  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  49  	return true;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  50  }
196d9d8bb71deaa Peter Zijlstra     2018-09-03  51  

:::::: The code at line 25 was first introduced by commit
:::::: c47454823bd4e3ab34ed3f795afd4479ab938a3f mm: mmu_gather: allow more than one batch of delayed rmaps

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
