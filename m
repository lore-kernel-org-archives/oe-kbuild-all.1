Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B854C399
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 01:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716686195; cv=none; b=choRgpNpxTU+wWD7d88EuOldkSwKAFtLAJViiiJ/pGYY9Kje0AMY+ojk8RUF6y56H6k2Kva2WWdeaI4cyW1/7dcF2tA2o0WgHKWUDH9tTflyXpmXYbPZA8A3SkB/BkHxPUa468kjoZ/gpYMoeXZXCxTFjB+4NEzio61Nm3OLG60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716686195; c=relaxed/simple;
	bh=2nx713LkhU9iqJ2uiXGYTGHsr83/QaaeKwXnfYcIkH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7GeZAKZ7ZkZfoBESUl5fgy92B5djAjxbDKHdiMIrT2NDfGXYJDvj1K90gX8gaA7k9+1spzKQtk+NJELOvukGtWpKoQfK2n4QNRYm3+ex/1SkB87/fxyrVZU7cjy3bXS1DkkSgByU0Z4OPyzYYiyBplptQ8EdM2HE2sFGdUIAO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUMsHxmW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUMsHxmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716686193; x=1748222193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2nx713LkhU9iqJ2uiXGYTGHsr83/QaaeKwXnfYcIkH0=;
  b=YUMsHxmW8BfQPd2wtdvPl8klkrZPDOZIDpxwCToOVxkcT1y0BRXxtps9
   2n2WRnqIzbNs9mx47AtLJXtvbx3YsiqqqzWQsRKs9MzJzCwSCRYWsTh+0
   wwvvxHFeBuLhHtMPxB8SiC7BZh2mznwiHaqH8/2XLWmrNXgGV5VSQIWja
   idTQqb52nR5EedRQL5dyjdyRoQMQJBjvFKfxJcptS3Jy4D9uJt0P6BE3N
   I1V2P3j5L9WRouDoQQfy/NHVJuqMyDY3mAcj7vat9AbvlQSn91TQVjL1M
   rmW9DjnEh9r4JqkwDWbH2iStuo7Mj9zyV26ZHYbiglplkCA/ZvxeZYXog
   Q==;
X-CSE-ConnectionGUID: z7SQDTjbTyyJiW2jCvh0kQ==
X-CSE-MsgGUID: LtdDpo2NSvqeCK1bOkr3Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="16862951"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="16862951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 18:16:32 -0700
X-CSE-ConnectionGUID: XG5OCxWpTnaBmSxZXw7W4A==
X-CSE-MsgGUID: f96xzrFsQvya5sXWlLek/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="65619732"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2024 18:16:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB2Uu-0007bj-2o;
	Sun, 26 May 2024 01:16:28 +0000
Date: Sun, 26 May 2024 09:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 1/4] include/linux/sched.h:20:10: fatal error:
 linux/ilog2.h: No such file or directory
Message-ID: <202405260913.UUoF3OO7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask-types
head:   f9eb385f19529076f66670016ea0e71fa420f3a7
commit: 65dc15af995c9867bdc62cc614265e1e00ea6896 [1/4] ilog2
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240526/202405260913.UUoF3OO7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260913.UUoF3OO7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260913.UUoF3OO7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/alpha/kernel/asm-offsets.c:10:
>> include/linux/sched.h:20:10: fatal error: linux/ilog2.h: No such file or directory
      20 | #include <linux/ilog2.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:117: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +20 include/linux/sched.h

    17	
    18	#include <linux/cache.h>
    19	#include <linux/irqflags_types.h>
  > 20	#include <linux/ilog2.h>
    21	#include <linux/smp_types.h>
    22	#include <linux/pid_types.h>
    23	#include <linux/sem_types.h>
    24	#include <linux/shm.h>
    25	#include <linux/kmsan_types.h>
    26	#include <linux/mutex_types.h>
    27	#include <linux/plist_types.h>
    28	#include <linux/hrtimer_types.h>
    29	#include <linux/timer_types.h>
    30	#include <linux/seccomp_types.h>
    31	#include <linux/nodemask_types.h>
    32	#include <linux/refcount_types.h>
    33	#include <linux/resource.h>
    34	#include <linux/latencytop.h>
    35	#include <linux/sched/prio.h>
    36	#include <linux/sched/types.h>
    37	#include <linux/signal_types.h>
    38	#include <linux/syscall_user_dispatch_types.h>
    39	#include <linux/mm_types_task.h>
    40	#include <linux/task_io_accounting.h>
    41	#include <linux/posix-timers_types.h>
    42	#include <linux/restart_block.h>
    43	#include <uapi/linux/rseq.h>
    44	#include <linux/seqlock_types.h>
    45	#include <linux/kcsan.h>
    46	#include <linux/rv.h>
    47	#include <linux/livepatch_sched.h>
    48	#include <linux/uidgid_types.h>
    49	#include <asm/kmap_size.h>
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
