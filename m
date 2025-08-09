Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4621D3F2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754725922; cv=none; b=C7/XUelG+oMPG3VwTR6cYzg1trDVCMbLwMqPgbYhNWVyW3FaJBJnmSZgTTEF9LhDLiVteR9S6q0C0ejT7s60yl2ogNbrk9TFAIPJ/OZtJuX6OztEFMVEwIwFoCquzSSbTwJMhBZh+5/ncSvhCtEnjFp4N8fK1JLd4fRVub9Zlus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754725922; c=relaxed/simple;
	bh=SAxAFyucFWGyFc1HVgKfyj2P91n6ThfNsOY4NcxDd5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V7kKeXDRWp1ICwaMDeBaHNV0ZmCfg2WgqzlSf/eK/ibdjO+fmas216qTD3hHXwhyZFLbUApd+y48iTL6LVJOziR1WAKe+JDMwX/kVBNNJyHgN2547OF8rn726i5vS0XI48jx6nK3HjcQIkyNZAqF5G9FOlljDXFQFTNBM3lIneI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iz29vapd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iz29vapd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754725919; x=1786261919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SAxAFyucFWGyFc1HVgKfyj2P91n6ThfNsOY4NcxDd5o=;
  b=Iz29vapd16wgj2ecbJaYDj5u8dCus/mK4q1uk6tB6AzpoaT5rzSiPnYn
   fegAU7R2JbisuhUnWfGbFlc+4v2lLTR+G+lpF5GuYgYuVb1Zbt3t7rwW+
   etDSIsMZUZJh+KsrKwIg/0Fg/FdQ6BdKsXw8jb5aqC10wb41F9VROeSGu
   eKGsmM+IWN8pPRs+mdQR7LZgUJvTbOppeibZy4RVvBg1PHpHRYGXKiNBA
   UUaXw2xaW7MvEfsuYLnUzkkGihVSZyqQHKkecEVVbYTMreItkCM1ibLWB
   1H3LFzinJ5I6pqlbkyoFHI8YzYyI+yIeVnMiW19wmsH11tGTvv0UJxL20
   w==;
X-CSE-ConnectionGUID: RzfG6qGLQPyUACGFblt4+g==
X-CSE-MsgGUID: DzuxzmIGTh6BaTWhrmEe9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57024095"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57024095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 00:51:58 -0700
X-CSE-ConnectionGUID: JCe+QiK7S8+KicjIcIe17Q==
X-CSE-MsgGUID: Ts+9KMPwTZWCplHVz0xlCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="202681180"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 09 Aug 2025 00:51:57 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukeMs-0002l9-1f;
	Sat, 09 Aug 2025 07:51:54 +0000
Date: Sat, 9 Aug 2025 09:51:45 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753] kernel/sched/debug.o:
 warning: objtool: missing symbol for section .text.unlikely
Message-ID: <202508090931.8saWh06I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   748957057cef2d3b3e35d749c9a1ade66e2b5e73
commit: acfa0f545c7dd43f959c28e8ab4b139c927ba387 [1753/1753] svm: reduce log of run queue and atomic->atomic64
config: x86_64-buildonly-randconfig-2002-20250806 (https://download.01.org/0day-ci/archive/20250809/202508090931.8saWh06I-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090931.8saWh06I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508090931.8saWh06I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/debug.c:797:6: warning: no previous prototype for 'sysrq_sched_debug_tidy' [-Wmissing-prototypes]
     797 | void sysrq_sched_debug_tidy(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/debug.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
