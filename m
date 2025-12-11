Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAB117555
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765492916; cv=none; b=nJ3Bw4KErCdVZQ5WVPXXzr8tY56YZURWTIFY3Hh0iF0nbvJNdHh2ZjsXz7rP0TXnPjcDV422zkvRybHzFTJFfucYpmvYc8PD6hQl+S2UytbALGNicgdhXpwUCgYvfUfsNRqn1FAbkKmq99+Mqs0gd71T16Jeov22gkeXBaR71a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765492916; c=relaxed/simple;
	bh=74OT5wEAasHE6C/EFJ536zdkyQ4fUNktLeXsLxTrj4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=luPHS+70SFDGPTao/H5Z+dhwMhBQ6+PvTVV6vMwmSZjEAw7wgs6ch+H+28QcIE+n7+NJeZFtOsXNTxhB9JUCqtl0SqLpZLSDEFNtV7d2dRHWuUyDQ79jQoBEaZ54eXZHK0bOdCJq2yhJ1JDtHIUrCuVroW/cxJETKCauHefJ+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PC+m4icD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PC+m4icD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765492914; x=1797028914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74OT5wEAasHE6C/EFJ536zdkyQ4fUNktLeXsLxTrj4M=;
  b=PC+m4icDvQI3zbYXGxCXfS6EDkGMJ0v/qWGyTZAdaIZDn1NINJ0Z3+Dr
   TVPsTVg/rHbLnRmHYdFMTrCuU5cENgLvN+OjMq7kn0DqFh1exsXmdSSxY
   VRKhr3+4Ypmqu3Feq/23U2+KUeDv0TpRUNZsW29Jtl0laE1jN3+yoK2j9
   +3h2e/g6fyYuA/0iYmPfN849GyrpDn5XhwKKwZ3IIZ7EBadP/6mmngORx
   ChslxlTJm3VycHmv9EwH6EADpWxwVeEVfLvGjgnVOTGg4h8Q8Nnhq/ekB
   J0/sT1SRLF7z6gqekD/h+5e9C/BH/swylR2YrTD6ZroRW4Q1Ihdg1g8Fa
   A==;
X-CSE-ConnectionGUID: 7U5VkjzPRreAU2JVSuLsDw==
X-CSE-MsgGUID: X0sMO/owR3inTp9lLzbSRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71331703"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71331703"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 14:41:54 -0800
X-CSE-ConnectionGUID: aIvDryUVR6GoawNMDUCoyQ==
X-CSE-MsgGUID: cCQh/PbaTdePrVBw5Q3oVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197393695"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 14:41:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTpM6-000000001DA-2Wqy;
	Thu, 11 Dec 2025 22:41:50 +0000
Date: Thu, 11 Dec 2025 23:41:12 +0100
From: kernel test robot <lkp@intel.com>
To: Yuwen Chen <ywen.chen@foxmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ../include/atomic.h:23:3: error: conflicting types for 'atomic_t';
 have 'struct <anonymous>'
Message-ID: <202512112344.gsyPl2ag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Yuwen-Chen/selftests-futex-reduce-array-declarations-in-the-requeue_single/20251211-164459
head:   5206009a8b55a69e9ec88da5309b93da223a5eeb
commit: 5206009a8b55a69e9ec88da5309b93da223a5eeb selftests/futex: fix the issue of abnormal test results caused by thread timing
date:   14 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512112344.gsyPl2ag-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112344.gsyPl2ag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112344.gsyPl2ag-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from futex_requeue_pi.c:30:
>> ../include/atomic.h:23:3: error: conflicting types for 'atomic_t'; have 'struct <anonymous>'
      23 | } atomic_t;
         |   ^~~~~~~~
   In file included from usr/include/linux/sched/types.h:5,
                    from /usr/include/x86_64-linux-gnu/bits/sched.h:63,
                    from /usr/include/sched.h:43,
                    from /usr/include/pthread.h:22,
                    from futex_requeue_pi.c:24:
   ../../../../include/linux/types.h:81:3: note: previous declaration of 'atomic_t' with type 'atomic_t'
      81 | } atomic_t;
         |   ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
