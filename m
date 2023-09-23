Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46E818
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695501654; x=1727037654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mb5FSK1xmqe1l193NGIGELewrGYBbw6yRlcpW8XB6Fo=;
  b=FeeiumGf2npV5IWMLqe7i6KiUzPyzEJUvgkq075H3A+UMJKg9s91U0dT
   g6Zn2xEbPb/kK6QxWkBnKWMEvJ56A/M7oU1YRYm1M/eC9lX25VJuGXigO
   Hp8zW3/RwIJuqnuNKUvVXTAY1akjR3yRvmUlDFqf4V4cI51JN9Uv0va7r
   QBZp2EKR7j4ti/mLhzxR5AMXZ7rQFEGxRogADjXqSLLvuqw4wRNbYkLTB
   6EpMfLa8yjqXRt4bC4Zgu+R3iREJCBnmBp30YcPHQTqIR1XrLdjBYVfn/
   u3KE103jQruVMo6AuQRlXZY9eykgWrXsEUwkuL8xD5mYgahzLRVHi61/H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="366114556"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="366114556"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 13:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="747927119"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="747927119"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Sep 2023 13:40:49 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk9Ql-0002pd-1Z;
	Sat, 23 Sep 2023 20:40:47 +0000
Date: Sun, 24 Sep 2023 04:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:sched/core 4/32] riscv64-linux-ld: warning: orphan section
 `.bss..Lubsan_data645' from `kernel/sched/core.o' being placed in section
 `.bss..Lubsan_data645'
Message-ID: <202309240437.vIiE0grd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   dc461c48deda8a2d243fbaf49e276d555eb833d8
commit: 7a50f76674f8b6f4f30a1cec954179f10e20110c [4/32] sched: Simplify yield_to()
config: riscv-randconfig-002-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240437.vIiE0grd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240437.vIiE0grd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240437.vIiE0grd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data645' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data645'
>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data645' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data645'
>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data645' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data645'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
