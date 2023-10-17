Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EB2440D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCXu+9Ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697511590; x=1729047590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/sfhtGoO4KxlkQ1AHNgt1Mjea4LMBP+q+rgAq4vifI=;
  b=OCXu+9Ke0IwyvYB7leSSB17EQxMwCGDczTpo8lAWzx06dF5tP6P0I2vq
   GmlTA6TSVwMEvl6jZZnXwxtw2RHzNejHp5xkiXj0VBJEZPdYVstlFvNLH
   YAZoGiZvNRnsghC9LKJ9wSIrhsO/cV18dwGFQRQ8S3UUjTNpzVKiK7s1Z
   kbBxCiYaGqLhZVAfeVlvIzEbqT8qNqaZzll6WZPz2jEj5TkmfiKqrR01A
   myPZeUDGrpFQoHWQvaj37XJ/29A2MX+/FjtSTgMCdVNeNCDmZSBS/oq7Z
   TFxwh9sHCCTxsck9FTnFnFOI2sN+o4t8nHPkGac6JmsLUMW66FAdSWmFs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7252116"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="7252116"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 19:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821794626"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="821794626"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Oct 2023 19:59:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsaJ7-0008tt-1b;
	Tue, 17 Oct 2023 02:59:45 +0000
Date: Tue, 17 Oct 2023 10:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/x86/kernel/cpu/bugs.c:64:9: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202310171043.kUlpXIoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58720809f52779dc0f08e53e54b014209d13eebb
commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
date:   3 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171043.kUlpXIoN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171043.kUlpXIoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171043.kUlpXIoN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/bugs.c:64:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/x86/kernel/cpu/bugs.c:64:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/bugs.c:64:9: sparse:     got unsigned long long *
   arch/x86/kernel/cpu/bugs.c:74:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/x86/kernel/cpu/bugs.c:74:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/bugs.c:74:13: sparse:     got unsigned long long *
   arch/x86/kernel/cpu/bugs.c:77:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/x86/kernel/cpu/bugs.c:77:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/bugs.c:77:9: sparse:     got unsigned long long *
   arch/x86/kernel/cpu/bugs.c:89:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned long long * @@
   arch/x86/kernel/cpu/bugs.c:89:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/bugs.c:89:16: sparse:     got unsigned long long *

vim +64 arch/x86/kernel/cpu/bugs.c

1b86883ccb8d5d Konrad Rzeszutek Wilk 2018-04-25  60  
66065157420c5b Pawan Gupta           2022-11-30  61  /* Update SPEC_CTRL MSR and its cached copy unconditionally */
66065157420c5b Pawan Gupta           2022-11-30  62  static void update_spec_ctrl(u64 val)
66065157420c5b Pawan Gupta           2022-11-30  63  {
66065157420c5b Pawan Gupta           2022-11-30 @64  	this_cpu_write(x86_spec_ctrl_current, val);
66065157420c5b Pawan Gupta           2022-11-30  65  	wrmsrl(MSR_IA32_SPEC_CTRL, val);
66065157420c5b Pawan Gupta           2022-11-30  66  }
66065157420c5b Pawan Gupta           2022-11-30  67  

:::::: The code at line 64 was first introduced by commit
:::::: 66065157420c5b9b3f078f43d313c153e1ff7f83 x86/bugs: Make sure MSR_SPEC_CTRL is updated properly upon resume from S3

:::::: TO: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
