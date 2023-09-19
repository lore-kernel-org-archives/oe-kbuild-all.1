Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B682538BAD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695132383; x=1726668383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fp8VV3ZVcU4e4X2yqZDES6E7/lsM9NYE3xcif1X26t0=;
  b=QmL/KmD9oZ1FVmE6am4SeKUQU0eaUR6+DySwaNNenN5BxLZEW41/3mJ9
   oE0DBjlyVW8GOeAZ3L+e8l8UnIPBfQES+ilynPBaODi34yqzau5SOunNG
   XcpnFrqKXB2YZn82aHAxY9ZriX11oUL1xKgO8u3EoKsHlkfObr2ylKW7K
   XTbZTfGcdU37WfR1xUz2LnTlYcF+1Gi3wfgX025xfpQ5Vw2Fxgo5SjUeK
   PWsbGy/pZqIZLIjoNNQ3Ca6XY6uLlyUx4A5nhdnwucObZdIB39UJOl/sI
   Th4h2wSgtfMdfc6nmHaOY/LvjF0OWSmUha1SgXr2S3z4344ImjvsFoba1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370265683"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="370265683"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="889510964"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="889510964"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2023 07:05:31 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qibMk-0007Qc-2L;
	Tue, 19 Sep 2023 14:06:14 +0000
Date: Tue, 19 Sep 2023 22:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tejun Heo <tj@kernel.org>
Subject: [linux-next:master 6144/6333] include/linux/bitmap.h:245:22:
 warning: array subscript 0 is outside array bounds of 'struct cpumask[0]'
Message-ID: <202309192149.5OtHmIo1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   29e400e3ea486bf942b214769fc9778098114113
commit: e2ffe502ba4505ee9c7b432980c702b7801a37f3 [6144/6333] cgroup/cpuset: Add cpuset.cpus.exclusive for v2
config: i386-randconfig-013-20230914 (https://download.01.org/0day-ci/archive/20230919/202309192149.5OtHmIo1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192149.5OtHmIo1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192149.5OtHmIo1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/cgroup/cpuset.c:25:
   In function 'bitmap_zero',
       inlined from 'cpumask_clear' at include/linux/cpumask.h:554:2,
       inlined from 'zalloc_cpumask_var' at include/linux/cpumask.h:931:2,
       inlined from 'alloc_cpumasks.constprop' at kernel/cgroup/cpuset.c:627:7:
>> include/linux/bitmap.h:245:22: warning: array subscript 0 is outside array bounds of 'struct cpumask[0]' [-Warray-bounds]
     245 |                 *dst = 0;
         |                 ~~~~~^~~
   In function 'bitmap_zero',
       inlined from 'cpumask_clear' at include/linux/cpumask.h:554:2,
       inlined from 'zalloc_cpumask_var' at include/linux/cpumask.h:931:2,
       inlined from 'alloc_cpumasks.constprop' at kernel/cgroup/cpuset.c:633:7:
>> include/linux/bitmap.h:245:22: warning: array subscript 0 is outside array bounds of 'struct cpumask[0]' [-Warray-bounds]
     245 |                 *dst = 0;
         |                 ~~~~~^~~


vim +245 include/linux/bitmap.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  239  
8b4daad52fee77 Rasmus Villemoes  2015-02-12  240  static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
^1da177e4c3f41 Linus Torvalds    2005-04-16  241  {
8b4daad52fee77 Rasmus Villemoes  2015-02-12  242  	unsigned int len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
3e7e5baaaba780 Alexander Lobakin 2022-06-24  243  
3e7e5baaaba780 Alexander Lobakin 2022-06-24  244  	if (small_const_nbits(nbits))
3e7e5baaaba780 Alexander Lobakin 2022-06-24 @245  		*dst = 0;
3e7e5baaaba780 Alexander Lobakin 2022-06-24  246  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  247  		memset(dst, 0, len);
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  

:::::: The code at line 245 was first introduced by commit
:::::: 3e7e5baaaba78075a7f3a57432609e363bf2a486 bitmap: don't assume compiler evaluates small mem*() builtins calls

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
