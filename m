Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219641B1D53
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 19:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726081755; cv=none; b=s251+MsBVWCLtW5WQQahqKxYrjApM9Nk+XtiW8betmQG9/raLmjgOTFZ+2uw6CGHbH9jfViGJebU5uk3qC9CjS+VHMP79UI6ix93sZbze8OdmM0ZuJof9+v7ABsNVZRVbpbtV857PuWc0zrFLK7t5+wKre0/Vb60usNmpLAv0no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726081755; c=relaxed/simple;
	bh=7jCREccGBlpj2x/E/b7Weuu54lFoklQGoTyGVO150Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fb2/4QHEqTe5Nn4U3F/OID7PkVeXHUwOy6Q9DN6rSUv38XbNmNeMr0dKaJ7AXgdFQKBgY8q5+VpkmSpLhqVIaajWEL/Cc73+4tM+MJ+fuJH/8NB4T7xZoYmOpk7AXOKY3p3LKK72xk5DSsmUpGIvAODwkCe0YGuHhbbk5TQxdV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDjB2Z6E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDjB2Z6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726081753; x=1757617753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7jCREccGBlpj2x/E/b7Weuu54lFoklQGoTyGVO150Jc=;
  b=fDjB2Z6Ec2Z5IdjJp8xClupo44zjQNK0K0zIRRNMoxFeSv6es1VjoySQ
   f3ACXqJpv+mM4QAUaT+wTFe6xVb4GPDcQ4hQGNNRUFh/jYJ3GoouYDZ6/
   Spz13FP7N9RxGS/2u14q26dWy3QYmXZ4Nb4vFoJx4rwaRlrIYy4EuAEyJ
   svS1ROn6wQJuQRfNx9Gb+yPvM4bm8DhMePQjytrioCBCbsiaUoZKrL8mK
   hKdXrdvkRSg9Y0p6EoIpZJK7bEMJ5jrKBEn0AZUrWUCEXujdmepuRcQYh
   JB6mbFpqQkTOS2rKe1wO1uZMLpiq4IMQ7R3Qxy7gZYKRwNLGombBE5MtH
   Q==;
X-CSE-ConnectionGUID: d39TKT7DSK6n6fnXgrnJug==
X-CSE-MsgGUID: X5ScWQLhTMi9m+gVqPpAxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35473349"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="35473349"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 12:09:13 -0700
X-CSE-ConnectionGUID: QbNGAtb/QEW246Rl6GBwlQ==
X-CSE-MsgGUID: 3epbi2QaTZS9XiUY1x9+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67299531"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 12:09:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soSiD-00041u-14;
	Wed, 11 Sep 2024 19:09:09 +0000
Date: Thu, 12 Sep 2024 03:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Aubrey Li <aubrey.li@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 23430/30000] arch/x86/kernel/cpu/common.c:92:16:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202409120353.B8gNzHgp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e23f76121de26a57b9f398c8b1ce5405a88acd8a
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [23430/30000] sched: Add cluster scheduler level for x86
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240912/202409120353.B8gNzHgp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120353.B8gNzHgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120353.B8gNzHgp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c:92:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned short * @@
   arch/x86/kernel/cpu/common.c:92:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/common.c:92:16: sparse:     got unsigned short *
   arch/x86/kernel/cpu/common.c:144:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:145:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:146:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:147:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:148:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:149:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)

vim +92 arch/x86/kernel/cpu/common.c

f8b64d08dde271 Borislav Petkov 2018-04-27  89  
6f01df96c462b7 Kim Phillips    2021-08-17  90  u16 get_llc_id(unsigned int cpu)
6f01df96c462b7 Kim Phillips    2021-08-17  91  {
6f01df96c462b7 Kim Phillips    2021-08-17 @92  	return per_cpu(cpu_llc_id, cpu);
6f01df96c462b7 Kim Phillips    2021-08-17  93  }
6f01df96c462b7 Kim Phillips    2021-08-17  94  EXPORT_SYMBOL_GPL(get_llc_id);
6f01df96c462b7 Kim Phillips    2021-08-17  95  

:::::: The code at line 92 was first introduced by commit
:::::: 6f01df96c462b77915b27d404152c47e75e879cf x86/cpu: Add get_llc_id() helper function

:::::: TO: Kim Phillips <kim.phillips@amd.com>
:::::: CC: Xie Haocheng <haocheng.xie@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
