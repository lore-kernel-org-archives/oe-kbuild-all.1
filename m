Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79D11BC09F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659998; cv=none; b=t6vONJ+F4heaCb3RVRs27y+g07Y3CFh0GkQktO/Ub9+XVLw5kNa1j6xQq1mHQjJ3sA4D8GbjK8oQJl5tticbSVWTJbhnj620vU5kzZNRZoMcc43/JS1OSeatgSTfGfs0HhCpYsJVG21/rJ4qcJR01lyX8BOKMikcb7sFa2Jlbmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659998; c=relaxed/simple;
	bh=bQK4BVsYjYSM/5qcaEU9yCTYmajiLYWaswUmvO6we0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZowOrrH5MfyKi8gqcK7gAjKPKsCSi13XEZSdrs9z2yFwV/LHcfYdvBwtabjXVgBo19fgWHMlXMWvSaenmsYcOkWHw7hk6jwi0jBdZ6uafiMaQmVOb0HTsznTkYOhyrjucOxdAomiwUA2UevRM2gkwFsJYUlwY5Vyfv8a0e2qGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuDLJfm7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuDLJfm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723659997; x=1755195997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bQK4BVsYjYSM/5qcaEU9yCTYmajiLYWaswUmvO6we0Y=;
  b=JuDLJfm70e5alZ36ost0522Kfew+Lajj7GD8lH7Olq0yVtMIpwK73tOE
   ezwsGLrdFEZx31bDxc/9ukN0Uej8i3Vd7lJhRr8sGmdAa000s6195TekC
   F4cqjgZjry3TjPh3G0YxeesJW19dz5XcmxfZmnQw0tj5wy2W2FDQNhQj8
   4dShyLNYIXzfbOh6NBbU7J82ntKNeh22ZpY5bDf0JAxPHX4ytOzGpRUBa
   TCkFNc1OoyFn0wx/8sFPDBrVrUtXo+Dgl5Hkn9kBkoLkEOWr8FyJWxaQD
   +nfMY1GoGL814dolm849m/zx++QpFnBqmOi9ZhDAcGN1JRhyyDJdrEa9O
   A==;
X-CSE-ConnectionGUID: yDGSalLPRQSjA2PzAREkqQ==
X-CSE-MsgGUID: zgzEHg0ZSteAxtc30oPp4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39351489"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="39351489"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 11:26:33 -0700
X-CSE-ConnectionGUID: gu/jvppQTImQJHq+7bNkFw==
X-CSE-MsgGUID: 2wHOZmvrShmlVbDarCTzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="63938091"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2024 11:26:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seIhZ-0002j2-2Y;
	Wed, 14 Aug 2024 18:26:29 +0000
Date: Thu, 15 Aug 2024 02:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/4] percpu: Assorted fixes found by strict percpu
 address space checks
Message-ID: <202408150230.beNGDBN1-lkp@intel.com>
References: <20240812115945.484051-3-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812115945.484051-3-ubizjak@gmail.com>

Hi Uros,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on tip/x86/core driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools tj-wq/for-next linus/master v6.11-rc3 next-20240814]
[cannot apply to tip/locking/core dennis-percpu/for-next acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/percpu-Define-pcpu_typeof/20240812-200316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20240812115945.484051-3-ubizjak%40gmail.com
patch subject: [RFC PATCH v2 2/4] percpu: Assorted fixes found by strict percpu address space checks
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240815/202408150230.beNGDBN1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150230.beNGDBN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408150230.beNGDBN1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:12,
                    from include/linux/prandom.h:13,
                    from include/linux/random.h:153,
                    from arch/arm64/include/asm/pointer_auth.h:7,
                    from arch/arm64/include/asm/processor.h:43,
                    from include/asm-generic/qrwlock.h:18,
                    from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                    from arch/arm64/include/asm/spinlock.h:9,
                    from include/linux/spinlock.h:95,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   include/linux/sched.h:1578:41: error: field 'thread' has incomplete type
    1578 |         struct thread_struct            thread;
         |                                         ^~~~~~
>> arch/arm64/include/asm/spinlock.h:21:27: error: redefinition of 'vcpu_is_preempted'
      21 | #define vcpu_is_preempted vcpu_is_preempted
         |                           ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/spinlock.h:22:20: note: in expansion of macro 'vcpu_is_preempted'
      22 | static inline bool vcpu_is_preempted(int cpu)
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/sched.h:2127:20: note: previous definition of 'vcpu_is_preempted' with type 'bool(int)' {aka '_Bool(int)'}
    2127 | static inline bool vcpu_is_preempted(int cpu)
         |                    ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/vcpu_is_preempted +21 arch/arm64/include/asm/spinlock.h

872c63fbf9e153 Will Deacon 2016-09-05  13  
f5bfdc8e3947a7 Waiman Long 2020-01-13  14  /*
f5bfdc8e3947a7 Waiman Long 2020-01-13  15   * Changing this will break osq_lock() thanks to the call inside
f5bfdc8e3947a7 Waiman Long 2020-01-13  16   * smp_cond_load_relaxed().
f5bfdc8e3947a7 Waiman Long 2020-01-13  17   *
f5bfdc8e3947a7 Waiman Long 2020-01-13  18   * See:
f5bfdc8e3947a7 Waiman Long 2020-01-13  19   * https://lore.kernel.org/lkml/20200110100612.GC2827@hirez.programming.kicks-ass.net
f5bfdc8e3947a7 Waiman Long 2020-01-13  20   */
345d52c184dc7d Qian Cai    2020-01-23 @21  #define vcpu_is_preempted vcpu_is_preempted
345d52c184dc7d Qian Cai    2020-01-23  22  static inline bool vcpu_is_preempted(int cpu)
345d52c184dc7d Qian Cai    2020-01-23  23  {
345d52c184dc7d Qian Cai    2020-01-23  24  	return false;
345d52c184dc7d Qian Cai    2020-01-23  25  }
f5bfdc8e3947a7 Waiman Long 2020-01-13  26  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
