Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC6A23AD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jul 2023 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688209152; x=1719745152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9gSBtOdBbL5EszgpLqy6s7dTPkpfEsMtL/0Y2VVsd5Y=;
  b=ieshcfkOw3hQB4Y86iEtj7V8vHKKFtezd8UmvQDN6iHqX5IJgHaF7Mwi
   ZpPUsCvBiYsCUIoLtdFBKnNE9lcX7c9ddANeo7uUWsI2umO6zKPu8wys5
   8mXmJO+scNdV8U9/cz25EfuLOosc7ONfSM4wic5XBW4xg6Ca7qul/sBrI
   goU4bdtDntWa528/AX6D+iyetbpaxLbTkrV662eL7ZoK5Pe/ww4Z2iyRg
   za96oIqDfFQcRg6T+d1JCqvwxZWBpNdRhGO1ZXMMxIYQhhVv9ChG+HwsC
   Tva4+jy1wAu8h4z+EPKSJ56yE6j3dc9WxQh4B5/qvkrUlcl8LlRLb3Nxi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393318035"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="393318035"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 03:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="892033274"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="892033274"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Jul 2023 03:59:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFYJp-000Fz9-1d;
	Sat, 01 Jul 2023 10:59:09 +0000
Date: Sat, 1 Jul 2023 18:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/stacktrace.c:47:25: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202307011821.uIMwFiL1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a507db1d8fdc39802415e4d2ef6d1aecd67927fa
commit: 4d7bf939df08218e682f7a42952eee3bad4dceb7 LoongArch: Add USER_STACKTRACE support
date:   11 months ago
config: loongarch-randconfig-r073-20230627 (https://download.01.org/0day-ci/archive/20230701/202307011821.uIMwFiL1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011821.uIMwFiL1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011821.uIMwFiL1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/stacktrace.c:47:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long [noderef] __user *user_frame_tail @@     got unsigned long * @@
   arch/loongarch/kernel/stacktrace.c:47:25: sparse:     expected unsigned long [noderef] __user *user_frame_tail
   arch/loongarch/kernel/stacktrace.c:47:25: sparse:     got unsigned long *

vim +47 arch/loongarch/kernel/stacktrace.c

    39	
    40	static int
    41	copy_stack_frame(unsigned long fp, struct stack_frame *frame)
    42	{
    43		int ret = 1;
    44		unsigned long err;
    45		unsigned long __user *user_frame_tail;
    46	
  > 47		user_frame_tail = (unsigned long *)(fp - sizeof(struct stack_frame));
    48		if (!access_ok(user_frame_tail, sizeof(*frame)))
    49			return 0;
    50	
    51		pagefault_disable();
    52		err = (__copy_from_user_inatomic(frame, user_frame_tail, sizeof(*frame)));
    53		if (err || (unsigned long)user_frame_tail >= frame->fp)
    54			ret = 0;
    55		pagefault_enable();
    56	
    57		return ret;
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
