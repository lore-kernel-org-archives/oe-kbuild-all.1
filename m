Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DACB78F32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735426594; cv=none; b=quv23+PVszBVja3xRW5RiUm8x3MU+yidtJKff45UYHjWdrLpw9XQZQgYajeWEeGXC0IRPZgMfaiAtIlVQ3aAlWFl03lUC/YZY+SsuzwOckGgUY3w8ttgis6m7iwp3/bKdqpQ3T/mr1xsSkejs62ReBsxvjqFktX6IKTNbc2Vr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735426594; c=relaxed/simple;
	bh=IZ/V6CEAz+8tT0tJrkOQkLDcWwksUvyD227NBLK29Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dlYy1fVEqd9R+QXL8GIldukI/cH1N+y+MN+/K4KnXsMnOIjAeT/d//Wizh5HWOqO+aOKd65slZ5KxDMi+5Vc1WuJzwIj6Bi81Qy6wFiVh3LIevhTJ7SHYMtzpHir8/3G5gPYdexrn8dgEsaTnNj6ZBYTSQiaTBAN3Arn3GJz2RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HA0S/WCJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HA0S/WCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735426593; x=1766962593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZ/V6CEAz+8tT0tJrkOQkLDcWwksUvyD227NBLK29Xk=;
  b=HA0S/WCJs4ePp4qO82eHZvOukv7g1Wj7K+2gplYVSUAWnN3yyY4HocsW
   4yUr5DdEgtj9ZAO2EGjCAkNuYTSitG1QInPmGLswGksvGcCc95C85WbbF
   BHBMMr9+JgWen8RAC8ppCCapnE5duvcmnSLNKNKKcJ0XeZcD4/Jhp/fWA
   /9KjmgugcJoM5Zxiz2ilMcfI9LiXPJRk9rdo19zTwuSQv+UyPulUg4Nek
   kWfmipd70k6x5aAvIyWfi9pYhFSn70TiJ4pj7sSGBsoELO0NqXzjnlFyi
   e3vE4d/jz41NBr84gxSFHTKQoDJXqiZxOh0EFbuhV4IbD3twm4el1wft0
   A==;
X-CSE-ConnectionGUID: Y5l/VC4dRnW7dY7U1lzj/Q==
X-CSE-MsgGUID: icwKzsVnT+6oLnzcJQkMPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35645435"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35645435"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 14:56:32 -0800
X-CSE-ConnectionGUID: KQ/jbZfyRU6RANzKvhP8MQ==
X-CSE-MsgGUID: YkTnuid+RruNlldGaGUZtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100281156"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Dec 2024 14:56:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRfjQ-0004Ma-2X;
	Sat, 28 Dec 2024 22:56:28 +0000
Date: Sun, 29 Dec 2024 06:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/13] ld.lld: error:
 call to __compiletime_assert_114 marked "dontcall-error": BUILD_BUG_ON
 failed: __builtin_constant_p(msr)
Message-ID: <202412290658.fcn5cNhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   831a3852bafc8cabcce4c27132e763d6c88e3e25
commit: 831a3852bafc8cabcce4c27132e763d6c88e3e25 [13/13] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: i386-randconfig-013-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290658.fcn5cNhU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290658.fcn5cNhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290658.fcn5cNhU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/events/intel/p4.c:10:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:10:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   1 warning generated.
>> ld.lld: error: call to __compiletime_assert_114 marked "dontcall-error": BUILD_BUG_ON failed: __builtin_constant_p(msr)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
