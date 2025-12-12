Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F3119258E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765575936; cv=none; b=hh95n/kddv3iXCGaYzvDsVHUOOqOX44TLT8u4lGUKEm4QibiI1nBOUY2g6S3V1yRrYijmZSkxgDeG1X5esGXENKwxCZWMfOWuOwxoBhF6dW0MD/oG3LpuExsxQqvoLxnzpdmrfOmAG2Q6kRI/DqfHpgz9xXREuPUfi5De6rhSHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765575936; c=relaxed/simple;
	bh=5UKxk0jtzkMavoRbuWq6346+s229sW2iV73w05/OyOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFU9tiZLfxzVk+voRyOKRuFOLqPViaTbsJ3+y4c88U7OfJdOLeBa26z7bWMo+nwGcSp+TH1uhuIZoYSXWRSPayIJ/ewBMlGSovk1FQdBSX4R5t7dgFI5a58IfY++lHoVjCcEhvX34Noddu8Sjxm8F9KzJ0SFCW8vL2mcM5ASR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcSe5XjV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcSe5XjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765575934; x=1797111934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5UKxk0jtzkMavoRbuWq6346+s229sW2iV73w05/OyOY=;
  b=fcSe5XjV4zx+Q7DjN467kcCrcXoGW+NYKxtc83LjvqT+5a1kenGo0Uqw
   RuYTE7gH+zVrRZBG7c5h9POX+IiMbvEHaMOcqgWq8lzEEq0ucDX3E1R3/
   2l9ORG3cCesh1FxvWGZ5r9rvZz0LzaR3skbgLphYQmLyfxTCZIv7401z6
   ZyVugNVwKcaqO9ZQG3JS9MDl/96vk+G+IEyDM1GTJQu+zwYhClmtKI+2C
   VzdsGXNhOsz+p4h6S3f897v6qmbIBi3fvuJHmTi+3MHSt4Pv5HL6tE3Oz
   9t4FIZPFvlUM5SMwQwOB7mXIhvL4x+CSgY6LnVrcWdkN5tF5EIsHfg+0c
   g==;
X-CSE-ConnectionGUID: SgOfw8AqTHu3I3P9n0rsQw==
X-CSE-MsgGUID: mL0PfrdPR0CHVWAhXpLpQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66573277"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="66573277"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:45:33 -0800
X-CSE-ConnectionGUID: ZZK9Me5MR6qxKU4UlwGI9A==
X-CSE-MsgGUID: Kh2wRTmdSMyS6Ui4OaL6zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201678706"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 13:45:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUAx8-000000006fB-057K;
	Fri, 12 Dec 2025 21:45:30 +0000
Date: Sat, 13 Dec 2025 05:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for
 function 'nf_nat_csum_recalc'
Message-ID: <202512130517.YGb86X1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 83abe3a3b85762720192809ac8695ff9255cfd23 [1941/1941] netfilter: nat: remove csum_recalc hook
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512130517.YGb86X1A-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130517.YGb86X1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130517.YGb86X1A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/netfilter/nf_nat_proto.c:12:
   In file included from include/net/ip6_route.h:24:
   include/net/ip6_fib.h:228:10: warning: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     228 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:107:3: note: expanded from macro 'time_after'
     107 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for function 'nf_nat_csum_recalc' [-Wmissing-prototypes]
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         |      ^
   net/netfilter/nf_nat_proto.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         | ^
         | static 
   2 warnings generated.


vim +/nf_nat_csum_recalc +56 net/netfilter/nf_nat_proto.c

    55	
  > 56	void nf_nat_csum_recalc(struct sk_buff *skb,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
