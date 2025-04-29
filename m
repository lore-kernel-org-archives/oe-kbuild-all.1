Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6725221719
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958404; cv=none; b=bpjSQENEkykeGZyhF3VKHWo4Y6O1jlBr9Ynn4uTqPRA9FeiiP/rBu1tXqI5g9yx8MGa5+JYXxuPNjFoABUXOQCw8Qi+jEu5BgEpHHuktSD0mrrDSei47ijFKoyGxMG9W+f/DrGy1HYVlEl8t4xBmRC71p3ujnqcw7grH3jIrbU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958404; c=relaxed/simple;
	bh=fJOy87H8gxWnbxx0oU6IGTy/z0/0UWAA2CpvuvbnIUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNt6z+SLwf4wGdMKRst5IDxG+MqStHfLwOy4NAxEtXdhvx2PiYK2A0YKcfVZHBjnaLxRy6nJXT90mausCaF/Y35naS2CkEe7PvWB1HhIpEfssAV5R0FxUhZXKFfmTIP+z49thArq07jzrEPzm3CHiDOYBU/wf/39KeTXyHOSaTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fn/2yjnX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fn/2yjnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745958403; x=1777494403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJOy87H8gxWnbxx0oU6IGTy/z0/0UWAA2CpvuvbnIUA=;
  b=fn/2yjnXozQeNxqlYbkkaZ8iZTI56xrnpT8s5sRct0BiFYxLnh8u9WEZ
   6hXIZAORx7UQUw+Lr7cSy7z6ltALLGG3hynhZoTWXiJU7Errx+C/LiCVB
   cjj8MUWS1yQMhFAIc0RrHW5S0VfMD0FuDcFj+RpUB54UKc60n4kh+GEgg
   6DU4c1QvokKaMogHsKerhWQGVEhAwYaNUlXjGkuBc65PQLjDKQzam/zB8
   FMLHqD++eesG59WUjGyRvxjn43aJmOuWKKRjTKPIvSbh8+uw+Y2kTUKZ5
   JdpunkNaog3SkRZgwKuYL9sKDXoSEoURUsd46uV3kTBFyv/fN+CWSb+LL
   w==;
X-CSE-ConnectionGUID: UJTTjs/rTz2jelQy5hzNiA==
X-CSE-MsgGUID: GB99obTLSiKgE/Wr+RQNTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47735827"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47735827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:26:42 -0700
X-CSE-ConnectionGUID: LerMHVBUSxiPMXWDdiKcUw==
X-CSE-MsgGUID: KAHrgsaGQUC+KsT1dSU4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="138901294"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2025 13:26:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9rXJ-0002ul-1C;
	Tue, 29 Apr 2025 20:26:37 +0000
Date: Wed, 30 Apr 2025 04:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/misc/uid_sys_stats.c:508:27: error: cannot take the address of an
 rvalue of type 'int'
Message-ID: <202504300438.pOlIHWRF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17f6c702f64e1111e663edc10f877ea0e95409c7
commit: 5f450572c83a34b6fb1936b8330f738e48e1d966 [1/1] ANDROID: uid_sys_stats: add ANDROID_OEM_DATA in struct uid_entry and update_stats_work
config: arm-randconfig-003-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300438.pOlIHWRF-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300438.pOlIHWRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300438.pOlIHWRF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/uid_sys_stats.c:508:27: error: cannot take the address of an rvalue of type 'int'
     508 |                 UPDATE_ANDROID_OEM_DATA(&OEM_DATA(uid_entry),
         |                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/uid_sys_stats.c:52:36: note: expanded from macro 'UPDATE_ANDROID_OEM_DATA'
      52 |         trace_android_vh_update_uid_stats(target, source, task, type)
         |                                           ^~~~~~
   drivers/misc/uid_sys_stats.c:509:4: error: cannot take the address of an rvalue of type 'int'
     509 |                         &OEM_DATA(usw), NULL, 0);
         |                         ^~~~~~~~~~~~~~
   drivers/misc/uid_sys_stats.c:52:44: note: expanded from macro 'UPDATE_ANDROID_OEM_DATA'
      52 |         trace_android_vh_update_uid_stats(target, source, task, type)
         |                                                   ^~~~~~
   drivers/misc/uid_sys_stats.c:547:34: error: cannot take the address of an rvalue of type 'int'
     547 |                         UPDATE_ANDROID_OEM_DATA(NULL, &OEM_DATA(usw), task, 1);
         |                                                       ^~~~~~~~~~~~~~
   drivers/misc/uid_sys_stats.c:52:44: note: expanded from macro 'UPDATE_ANDROID_OEM_DATA'
      52 |         trace_android_vh_update_uid_stats(target, source, task, type)
         |                                                   ^~~~~~
   drivers/misc/uid_sys_stats.c:563:26: error: cannot take the address of an rvalue of type 'int'
     563 |         UPDATE_ANDROID_OEM_DATA(&OEM_DATA(uid_entry), NULL, task, 2);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/uid_sys_stats.c:52:36: note: expanded from macro 'UPDATE_ANDROID_OEM_DATA'
      52 |         trace_android_vh_update_uid_stats(target, source, task, type)
         |                                           ^~~~~~
   4 errors generated.


vim +/int +508 drivers/misc/uid_sys_stats.c

   491	
   492	static void update_stats_workfn(struct work_struct *work)
   493	{
   494		struct update_stats_work *usw, *t;
   495		struct uid_entry *uid_entry;
   496		struct task_entry *task_entry __maybe_unused;
   497		struct llist_node *node;
   498	
   499		node = llist_del_all(&work_usw);
   500		llist_for_each_entry_safe(usw, t, node, node) {
   501			lock_uid(usw->uid);
   502			uid_entry = find_uid_entry(usw->uid);
   503			if (!uid_entry)
   504				goto next;
   505	
   506			uid_entry->utime += usw->utime;
   507			uid_entry->stime += usw->stime;
 > 508			UPDATE_ANDROID_OEM_DATA(&OEM_DATA(uid_entry),
   509				&OEM_DATA(usw), NULL, 0);
   510	
   511			__add_uid_io_stats(uid_entry, &usw->ioac, UID_STATE_DEAD_TASKS);
   512	next:
   513			unlock_uid(usw->uid);
   514			kfree(usw);
   515		}
   516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
