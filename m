Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7003D35D5F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 05:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774072371; cv=none; b=faHxYncHsqhh71TswlDCBmKrm2D7f/zofXaqypQUHLxC9NH37tw+v5TTK7GF0kd7TfQtU305924WPj6hpAKUOrHzLh/mrgaQd51BDmksNQTMQ+/iL78Sy/bMjwnkTJNUCCKKexb759cIgK6XmhSLsXJwqN3HAeW3OdGspOqa1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774072371; c=relaxed/simple;
	bh=zlkyMAQi/wjogDgnEJwu5ytZo2MJnwl1qHDB3VH+CbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sGvxAKGdnC8BqGupcrAAt4iYsfPqg7l0AcGjqe7Lbn8pgb09MG5rXgj5R9j4CJwc9vWG7toqNuiSP3nkd5m7BYbxgpDpShkCg++DnaIT8KE2dAvqCFg3QKsQ66xrYQs7zYYpYihkJH0ZPNS0G6sZguNU9axoF9XRy1H5mIGMPfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7BQwMgW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7BQwMgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774072371; x=1805608371;
  h=date:from:to:cc:subject:message-id;
  bh=zlkyMAQi/wjogDgnEJwu5ytZo2MJnwl1qHDB3VH+CbM=;
  b=J7BQwMgWh1RYfA3/1zEY8J66rOrKNEzH1mptmyM/C/krxd52NFdLo/no
   MBg9/s2A1uPNoVuX0kZiuaZznVL14G9Ox4EqmEP1GO5JfKDNthinEnDxl
   uiW17bGFCvlGWFcvt4mBrvt89yifYNz6WbSMVW765lWMiXqL3c+C6SzMu
   LrMn5o28s+UZhs6JZWF0weuQCqmcRNOtGJ4cLjiojNWnRhyyDSNenDDKg
   rkjR0JTEQQGLZLIRAc8xFNm6KVN/9hsX6hAgHWbzuYOCQGmVYPrBqYD3l
   nnuoJteETw++K/CxViW+wThO9E4PmlUKfFGAQAuHl93y7DYkpQ7BKLrLI
   w==;
X-CSE-ConnectionGUID: bBdd9P2lTO6lqcBsrc5LFw==
X-CSE-MsgGUID: wZL1DUmUS22b2dwghAqZMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75277508"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75277508"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 22:52:50 -0700
X-CSE-ConnectionGUID: hq3xF3B5SMezL0T2ZPpDxg==
X-CSE-MsgGUID: XksrVrKNRpawv8M9hzjZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="223539544"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Mar 2026 22:52:48 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3pGC-000000000NB-3LD9;
	Sat, 21 Mar 2026 05:52:34 +0000
Date: Sat, 21 Mar 2026 13:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 29/33] WARNING: modpost: module
 raid6_kunit uses symbol raid6_recov_algos from namespace
 EXPORTED_FOR_KUNIT_TESTING, but does not import it.
Message-ID: <202603211300.yU2xfRe5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   83a13a72f6f47b7ba7d26a200575edb70bf23c70
commit: 252652e3d689463259c19e406e5de766a6674d0f [29/33] raid6: move to lib/raid/
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260321/202603211300.yU2xfRe5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211300.yU2xfRe5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211300.yU2xfRe5-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module raid6_kunit uses symbol raid6_recov_algos from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
>> WARNING: modpost: module raid6_kunit uses symbol raid6_algos from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
