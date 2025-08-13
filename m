Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B428727D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755103579; cv=none; b=tImyDXOdKkUnRuVrj5XpiXlIwcUyZCwZcS5jn+6Vv8Qf6MiKSjROKh54hqcDHXDPGnxg7EL3Qp890qkxM+tHqyqL3G9zzHqtgiUmEVQpuGwWxztC6Kh0DyMaGrInyWEULSL6mXaVwvFYLvl4GtGT1UDumuaJuC5NC2x13bQUtEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755103579; c=relaxed/simple;
	bh=/UEAokjol+Hf5eY+metAgjUehvO3ytMnBIyvoKdFd04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9x+vnehRQ9zwDzHsWlTC++dgAxn90ZgNMdzIr8nWJPNg94ScShjpS1YyHFFoIoAz8QVNwcqFRUMXARr7FFUegcafAS1WSK3e06T04TRdXkXG1W3L42DeNAsgvfJ3YinEbGf68yy1by1pFceqNSAun6Fdp/a2v2wYJgW81ddjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9L6saUs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9L6saUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755103578; x=1786639578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UEAokjol+Hf5eY+metAgjUehvO3ytMnBIyvoKdFd04=;
  b=d9L6saUs/ppxlc+IoZdejFqePuS3R95jcn/Qb7cG1fOiGQHdeP+fIg6x
   eAsJ8Dql/08WSyokNi3/0Gh95JUa0Y2iOyhGV/BG8HPilbG5FwRVpA7So
   2rvNRrzzViIsManG0Pz/JCv8npfrOlCl90XnntqXCro4rj8S6aLvBLW54
   qgN9BC5s3tmYz/7RJ+vow7EIAd5YbSsBvLTQ71VR2cTN7D7cSO4lA0qPe
   WcQJxKhVWslQZVQc/XogS5oPWFjMl3O9FYGESjS1pGPz99EfkuJxSaMrv
   t6CoKMPvKkw8OfGMPZhGUmTlvy4JgftbK6HTcaEiajqLUGebnO98p17Us
   w==;
X-CSE-ConnectionGUID: eNopGWDgRXCldgHFKZJUdg==
X-CSE-MsgGUID: 9byWqPtHR8KkFKtnj21P6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57311679"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57311679"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 09:46:17 -0700
X-CSE-ConnectionGUID: lSyK4q++TLG3QL/wfv8dbQ==
X-CSE-MsgGUID: WMqr1yQtRciRoxpnUuZFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166773813"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Aug 2025 09:46:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umEc1-000A8G-0C;
	Wed, 13 Aug 2025 16:46:06 +0000
Date: Thu, 14 Aug 2025 00:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [akpm-mm:mm-new 120/137] include/linux/mm.h:727:16: sparse: sparse:
 incorrect type in argument 2 (different modifiers)
Message-ID: <202508140032.Qirn8BZ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   694c8e78f486b09137ee3efadae044d01aba971b
commit: 6d303e2d299eaeb3bfd39c8d8c7f79cc474db83b [120/137] mm: convert core mm to mm_flags_*() accessors
config: microblaze-randconfig-r131-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140032.Qirn8BZ3-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250814/202508140032.Qirn8BZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140032.Qirn8BZ3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/oom_kill.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/oom.h):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'find_lock_task_mm' - wrong count at exit
   mm/oom_kill.c: note: in included file (through include/linux/oom.h):
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   mm/oom_kill.c:223:28: sparse: sparse: context imbalance in 'oom_badness' - unexpected unlock
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   mm/oom_kill.c:403:9: sparse: sparse: context imbalance in 'dump_task' - unexpected unlock
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   include/linux/mm.h:732:39: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:732:39: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:732:39: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
   mm/oom_kill.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/oom.h):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in '__oom_kill_process' - unexpected unlock
   mm/oom_kill.c: note: in included file (through include/linux/oom.h):
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   mm/oom_kill.c:1241:20: sparse: sparse: context imbalance in '__se_sys_process_mrelease' - unexpected unlock
--
   mm/gup.c: note: in included file:
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
--
   mm/memory.c: note: in included file (through arch/microblaze/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   mm/memory.c:1329:9: sparse: sparse: context imbalance in 'copy_pte_range' - unexpected unlock
   mm/memory.c:2224:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:2331:9: sparse: sparse: context imbalance in 'insert_page' - unexpected unlock
   mm/memory.c:2616:9: sparse: sparse: context imbalance in 'insert_pfn' - unexpected unlock
   mm/memory.c:3154:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:3787:42: sparse: sparse: context imbalance in 'wp_page_copy' - different lock contexts for basic block
   mm/memory.c:3826:19: sparse: sparse: context imbalance in 'finish_mkwrite_fault' - different lock contexts for basic block
   mm/memory.c:3857:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3883:17: sparse: sparse: context imbalance in 'wp_page_shared' - unexpected unlock
   mm/memory.c:4049:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c:4311:9: sparse: sparse: context imbalance in 'remove_device_exclusive_entry' - different lock contexts for basic block
   mm/memory.c:4337:19: sparse: sparse: context imbalance in 'pte_marker_clear' - different lock contexts for basic block
   mm/memory.c:4582:12: sparse: sparse: context imbalance in 'do_swap_page' - unexpected unlock
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   mm/memory.c:5240:9: sparse: sparse: context imbalance in 'do_anonymous_page' - different lock contexts for basic block
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   mm/memory.c:5470:12: sparse: sparse: context imbalance in 'finish_fault' - different lock contexts for basic block
   mm/memory.c:5842:9: sparse: sparse: context imbalance in 'do_fault' - different lock contexts for basic block
   mm/memory.c:5971:17: sparse: sparse: context imbalance in 'do_numa_page' - unexpected unlock
   mm/memory.c:6174:34: sparse: sparse: context imbalance in 'handle_pte_fault' - unexpected unlock
   mm/memory.c:6655:5: sparse: sparse: context imbalance in 'follow_pfnmap_start' - different lock contexts for basic block
   mm/memory.c:6741:28: sparse: sparse: context imbalance in 'follow_pfnmap_end' - unexpected unlock
--
   mm/mmap.c: note: in included file (through arch/microblaze/include/asm/cacheflush.h, include/linux/cacheflush.h, include/linux/highmem.h, ...):
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
>> include/linux/mm.h:742:23: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long volatile *addr @@     got unsigned long [noderef] * @@
   include/linux/mm.h:742:23: sparse:     expected unsigned long volatile *addr
   include/linux/mm.h:742:23: sparse:     got unsigned long [noderef] *
--
   mm/mprotect.c: note: in included file (through include/linux/pagewalk.h):
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
--
   mm/rmap.c: note: in included file:
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:951:26: sparse: sparse: context imbalance in 'folio_referenced_one' - unexpected unlock
   include/linux/rmap.h:951:26: sparse: sparse: context imbalance in 'try_to_unmap_one' - unexpected unlock
   include/linux/rmap.h:951:26: sparse: sparse: context imbalance in 'try_to_migrate_one' - unexpected unlock
--
   mm/vma.c: note: in included file (through arch/microblaze/include/asm/cacheflush.h, include/linux/cacheflush.h, include/linux/highmem.h, ...):
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *
>> include/linux/mm.h:727:16: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned long const volatile *addr @@     got unsigned long const [noderef] * @@
   include/linux/mm.h:727:16: sparse:     expected unsigned long const volatile *addr
   include/linux/mm.h:727:16: sparse:     got unsigned long const [noderef] *

vim +727 include/linux/mm.h

5e31275cc997f8 Suren Baghdasaryan 2023-02-27  724  
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  725  static inline bool mm_flags_test(int flag, const struct mm_struct *mm)
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  726  {
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12 @727  	return test_bit(flag, ACCESS_PRIVATE(&mm->_flags, __mm_flags));
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  728  }
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  729  
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  730  static inline bool mm_flags_test_and_set(int flag, struct mm_struct *mm)
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  731  {
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  732  	return test_and_set_bit(flag, ACCESS_PRIVATE(&mm->_flags, __mm_flags));
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  733  }
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  734  
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  735  static inline bool mm_flags_test_and_clear(int flag, struct mm_struct *mm)
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  736  {
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  737  	return test_and_clear_bit(flag, ACCESS_PRIVATE(&mm->_flags, __mm_flags));
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  738  }
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  739  
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  740  static inline void mm_flags_set(int flag, struct mm_struct *mm)
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  741  {
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12 @742  	set_bit(flag, ACCESS_PRIVATE(&mm->_flags, __mm_flags));
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  743  }
34e1a4ccaed274 Lorenzo Stoakes    2025-08-12  744  

:::::: The code at line 727 was first introduced by commit
:::::: 34e1a4ccaed27416e7c6cd5ec43d9f3f41bf107b mm: add bitmap mm->flags field

:::::: TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
