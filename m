Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE16EB79
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226176; cv=none; b=YhsVI4cMCptpCcRx14wY1DFEAw+8Y9z5KdfRoLUi6774EJq91MYda0VL7e3zPJYiwykQQDwOGo3Kuq/SoDfHgN71CjlAECf2i2rc/2/6CiZRAP4P2SFz+Dv2jXcKPo7tesifrbm0qgpCmIPeiQh1HUJY+kAVz1r3d8SUjO6hQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226176; c=relaxed/simple;
	bh=rH7z/8D3v6tmImsUWo6hixC/YTtJ5zk+19KPRbG4EAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lIpv58cA9w123OlPFMQdOh8Bv2lQLxRp3cb5RoDi7hb188KbuNeL/j27yIfuoUW5cb6pN96wnL9D8ClyK65BpkI8OUNSRyN11bk3nmo7ID2fQiOpgJaQZ1TFdZzujARaIzG51NI9BKm380fL7Ji6keIZhgsKiNhwzBD1avMIOOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1rPdV2H; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1rPdV2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746226175; x=1777762175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rH7z/8D3v6tmImsUWo6hixC/YTtJ5zk+19KPRbG4EAM=;
  b=T1rPdV2HIO+RNKeKpefM03wvJZRqe+MvwXLwODLEt1Zdjj+cKdUOLquv
   NtuZkqTrh/f4H/a9ir/TkpDAKfWybPPZX4cIpy2yQ/Bib12/8IuV7Agzl
   BhdtO7DUVEB2mogyljS0npel/q96KBu4p88fHIh1w9JwXXldfe+GADsMO
   WZoPI09sOQkADtvKb1GXMcEoKB0nMXlu0ZJvQuQWu4fZAuLH/M9K9226I
   tELY+/I4PjLBqSqhmYTYezFIxfK31B5BtwQeemG04HFYUlUnwbws/CbWk
   dUPe54S8Y5IdiI8pP/yKzGEP7Sn1CnvJsOgII+uyVq32BorU3aeghQAKo
   Q==;
X-CSE-ConnectionGUID: hil6lkz6QjSszWwYZXetVg==
X-CSE-MsgGUID: 2bGs8qEdQNSUJTU7NQu8Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48055063"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="48055063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 15:49:34 -0700
X-CSE-ConnectionGUID: mieVGJgQQnG/peS4IoxuMA==
X-CSE-MsgGUID: I4vZUWvNQ2CCmldr/h+oYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="172003079"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2025 15:49:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAzCE-000541-1d;
	Fri, 02 May 2025 22:49:30 +0000
Date: Sat, 3 May 2025 06:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/futex 15/23] kernel/futex/core.c:1614:30:
 error: 'FH_CUSTOM' undeclared
Message-ID: <202505030624.9toZNTX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   de70d23cda670cd8bd50d96c6a7acf832969b55e
commit: ac10690394df3e02848a669dcab8a6eaf1210a38 [15/23] futex: Allow to make the private hash immutable
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250503/202505030624.9toZNTX1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030624.9toZNTX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030624.9toZNTX1-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/futex/core.c: In function 'futex_hash_prctl':
>> kernel/futex/core.c:1614:30: error: 'FH_CUSTOM' undeclared (first use in this function)
    1614 |         unsigned int flags = FH_CUSTOM;
         |                              ^~~~~~~~~
   kernel/futex/core.c:1614:30: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/futex/core.c:1622:34: error: 'FH_IMMUTABLE' undeclared (first use in this function); did you mean 'SA_IMMUTABLE'?
    1622 |                         flags |= FH_IMMUTABLE;
         |                                  ^~~~~~~~~~~~
         |                                  SA_IMMUTABLE


vim +/FH_CUSTOM +1614 kernel/futex/core.c

  1611	
  1612	int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4)
  1613	{
> 1614		unsigned int flags = FH_CUSTOM;
  1615		int ret;
  1616	
  1617		switch (arg2) {
  1618		case PR_FUTEX_HASH_SET_SLOTS:
  1619			if (arg4 & ~FH_FLAG_IMMUTABLE)
  1620				return -EINVAL;
  1621			if (arg4 & FH_FLAG_IMMUTABLE)
> 1622				flags |= FH_IMMUTABLE;
  1623			ret = futex_hash_allocate(arg3, flags);
  1624			break;
  1625	
  1626		case PR_FUTEX_HASH_GET_SLOTS:
  1627			ret = futex_hash_get_slots();
  1628			break;
  1629	
  1630		case PR_FUTEX_HASH_GET_IMMUTABLE:
  1631			ret = futex_hash_get_immutable();
  1632			break;
  1633	
  1634		default:
  1635			ret = -EINVAL;
  1636			break;
  1637		}
  1638		return ret;
  1639	}
  1640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
