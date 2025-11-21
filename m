Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AC92BE7A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763755059; cv=none; b=Ii/E4PnH4xtO8PL6HW9KiavRnFFLMRnhWTjRiHAxWwRz8ddD6JyN0bLVYzbsyvVOXC39eiR3jSkN07uuP8xcP6fWnkZp8VKDwp/7jX9uniqzs3h+eXZBDgH/QojKBufgxAmUKk25qikU1URQ/eqizxBAuALh4b8qPzVRAaFP+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763755059; c=relaxed/simple;
	bh=rO/KWibvsps/bh0IYYQNpxuCAgM2IIrbpyxOz/EndiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HEApE8gQGsX7uybDcJcF/C1VAqp3PlLz1eCEoNN+7CqQ70fzzAc13k3gsQtXys1HOnsd4Qn8wFP5apjms1VhqVhJas7G6RQLVebU066JT7E2mWVmklltwhBFHMwOmdti/wGP+8SqfZWzKmZ8hO+Tyqi37Q7PUyQ/x8Hwfbhr/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTh/IONI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTh/IONI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763755056; x=1795291056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rO/KWibvsps/bh0IYYQNpxuCAgM2IIrbpyxOz/EndiM=;
  b=LTh/IONIAy1fY3GIy0uP+VMpuJ6eChEf/6hfhO/DOWyLm3sBW6eu41HT
   HcUQ4IUZNwjI+CIgClnfisbsG/NIwE79KrzBo48LEnHqW8o6woTheLcbw
   P55quDDL3BGYv2cVJsbfVnb3yCennVS+0sil08nZ6qF1kkSrsNxbzCj4c
   4cjhBOmPVAWTCg1FipqPXz1wcVuaAMBuTbjvBosjkv7atwIK0Cv2QbQ6N
   m45FY1KbgyARrbEQzw+kVz9kjAocKqYppQexZJ6bYizr8Gbd+QqgGNDAa
   f1vFIO6L99F3tV2phaqVGbmQ7k230i8jpvRBuYXAMeo2Wy46lxg9/Lu5I
   g==;
X-CSE-ConnectionGUID: gRzQRsBzRryIAdQ3Uh3klw==
X-CSE-MsgGUID: XKprTvA4SlWxzud4BrbO9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77328237"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="77328237"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 11:57:36 -0800
X-CSE-ConnectionGUID: 6Jvsh4pkR3qwLjKevH+/fQ==
X-CSE-MsgGUID: wtf2STJCQ9mIw7lZj/GELg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191076682"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2025 11:57:35 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMXG7-0006pM-2o;
	Fri, 21 Nov 2025 19:57:31 +0000
Date: Sat, 22 Nov 2025 03:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:for-test 27/36] mm/kfence/report.c:142:9: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202511220321.8W9gShgz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git for-test
head:   10da1cb636df659be0b839e78c48037968cc5cc6
commit: ecaf7c4f9b92b130d600f09e4710c9bd0e032d35 [27/36] kfence: Enable context analysis
config: arm-randconfig-r122-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220321.8W9gShgz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220321.8W9gShgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220321.8W9gShgz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/report.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   mm/kfence/report.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
>> mm/kfence/report.c:142:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock const * @@
   mm/kfence/report.c:142:9: sparse:     expected struct srcu_struct const *var
   mm/kfence/report.c:142:9: sparse:     got struct raw_spinlock const *
   mm/kfence/report.c:265:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock const * @@
   mm/kfence/report.c:265:17: sparse:     expected struct srcu_struct const *var
   mm/kfence/report.c:265:17: sparse:     got struct raw_spinlock const *
>> mm/kfence/report.c:317:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   mm/kfence/report.c:317:9: sparse:     expected struct srcu_struct const *var
   mm/kfence/report.c:317:9: sparse:     got struct raw_spinlock *
   mm/kfence/report.c:328:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct raw_spinlock * @@
   mm/kfence/report.c:328:9: sparse:     expected struct srcu_struct const *var
   mm/kfence/report.c:328:9: sparse:     got struct raw_spinlock *
--
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   mm/kfence/core.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   mm/kfence/core.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> mm/kfence/core.c:297:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:297:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:297:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:429:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:429:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:429:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:434:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:434:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:434:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:450:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:450:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:450:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:453:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:453:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:453:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:485:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:485:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:485:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:523:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:523:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:523:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:530:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:530:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:530:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:553:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:553:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:553:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:574:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:574:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:574:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:577:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:577:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:577:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:651:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:651:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:651:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:767:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:767:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:767:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:769:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:769:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:769:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:1036:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:1036:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:1036:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:1038:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:1038:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:1038:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:1066:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:1066:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:1066:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:1069:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:1069:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:1069:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:1189:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:1189:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:1189:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:1191:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:1191:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:1191:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:1260:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:1260:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:1260:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:1263:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:1263:17: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:1263:17: sparse:     got struct raw_spinlock *
   mm/kfence/core.c: note: in included file (through include/linux/spinlock.h, include/linux/wait.h, include/linux/wait_bit.h, ...):
>> include/linux/spinlock_api_up.h:103:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock [usertype] *lock @@
   include/linux/spinlock_api_up.h:103:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock_api_up.h:103:9: sparse:     got struct raw_spinlock [usertype] *lock
   mm/kfence/core.c:362:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:366:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:386:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:406:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:345:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:345:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:345:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:347:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:347:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:347:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:345:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:345:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:345:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:347:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:347:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:347:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:345:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:345:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:345:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:347:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:347:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:347:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:345:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:345:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:345:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:347:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:347:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:347:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:345:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:345:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:345:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:347:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:347:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:347:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:345:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:345:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:345:9: sparse:     got struct raw_spinlock *
   mm/kfence/core.c:347:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock * @@
   mm/kfence/core.c:347:9: sparse:     expected struct debugfs_cancellation const *var
   mm/kfence/core.c:347:9: sparse:     got struct raw_spinlock *

vim +142 mm/kfence/report.c

0ce20dd840897b Alexander Potapenko 2021-02-25  135  
0ce20dd840897b Alexander Potapenko 2021-02-25  136  void kfence_print_object(struct seq_file *seq, const struct kfence_metadata *meta)
0ce20dd840897b Alexander Potapenko 2021-02-25  137  {
0ce20dd840897b Alexander Potapenko 2021-02-25  138  	const int size = abs(meta->size);
0ce20dd840897b Alexander Potapenko 2021-02-25  139  	const unsigned long start = meta->addr;
0ce20dd840897b Alexander Potapenko 2021-02-25  140  	const struct kmem_cache *const cache = meta->cache;
0ce20dd840897b Alexander Potapenko 2021-02-25  141  
0ce20dd840897b Alexander Potapenko 2021-02-25 @142  	lockdep_assert_held(&meta->lock);
0ce20dd840897b Alexander Potapenko 2021-02-25  143  
0ce20dd840897b Alexander Potapenko 2021-02-25  144  	if (meta->state == KFENCE_OBJECT_UNUSED) {
702b16d724a61c Marco Elver         2021-03-12  145  		seq_con_printf(seq, "kfence-#%td unused\n", meta - kfence_metadata);
0ce20dd840897b Alexander Potapenko 2021-02-25  146  		return;
0ce20dd840897b Alexander Potapenko 2021-02-25  147  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  148  
4bbf04aa9aa88a Marco Elver         2021-09-07  149  	seq_con_printf(seq, "kfence-#%td: 0x%p-0x%p, size=%d, cache=%s\n\n",
4bbf04aa9aa88a Marco Elver         2021-09-07  150  		       meta - kfence_metadata, (void *)start, (void *)(start + size - 1),
4bbf04aa9aa88a Marco Elver         2021-09-07  151  		       size, (cache && cache->name) ? cache->name : "<destroyed>");
4bbf04aa9aa88a Marco Elver         2021-09-07  152  
0ce20dd840897b Alexander Potapenko 2021-02-25  153  	kfence_print_stack(seq, meta, true);
0ce20dd840897b Alexander Potapenko 2021-02-25  154  
c36be0cdf63d64 Tianchen Ding       2024-08-12  155  	if (meta->state == KFENCE_OBJECT_FREED || meta->state == KFENCE_OBJECT_RCU_FREEING) {
4bbf04aa9aa88a Marco Elver         2021-09-07  156  		seq_con_printf(seq, "\n");
0ce20dd840897b Alexander Potapenko 2021-02-25  157  		kfence_print_stack(seq, meta, false);
0ce20dd840897b Alexander Potapenko 2021-02-25  158  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  159  }
0ce20dd840897b Alexander Potapenko 2021-02-25  160  
0ce20dd840897b Alexander Potapenko 2021-02-25  161  /*
0ce20dd840897b Alexander Potapenko 2021-02-25  162   * Show bytes at @addr that are different from the expected canary values, up to
0ce20dd840897b Alexander Potapenko 2021-02-25  163   * @max_bytes.
0ce20dd840897b Alexander Potapenko 2021-02-25  164   */
0ce20dd840897b Alexander Potapenko 2021-02-25  165  static void print_diff_canary(unsigned long address, size_t bytes_to_show,
0ce20dd840897b Alexander Potapenko 2021-02-25  166  			      const struct kfence_metadata *meta)
0ce20dd840897b Alexander Potapenko 2021-02-25  167  {
0ce20dd840897b Alexander Potapenko 2021-02-25  168  	const unsigned long show_until_addr = address + bytes_to_show;
0ce20dd840897b Alexander Potapenko 2021-02-25  169  	const u8 *cur, *end;
0ce20dd840897b Alexander Potapenko 2021-02-25  170  
0ce20dd840897b Alexander Potapenko 2021-02-25  171  	/* Do not show contents of object nor read into following guard page. */
0ce20dd840897b Alexander Potapenko 2021-02-25  172  	end = (const u8 *)(address < meta->addr ? min(show_until_addr, meta->addr)
0ce20dd840897b Alexander Potapenko 2021-02-25  173  						: min(show_until_addr, PAGE_ALIGN(address)));
0ce20dd840897b Alexander Potapenko 2021-02-25  174  
0ce20dd840897b Alexander Potapenko 2021-02-25  175  	pr_cont("[");
0ce20dd840897b Alexander Potapenko 2021-02-25  176  	for (cur = (const u8 *)address; cur < end; cur++) {
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  177  		if (*cur == KFENCE_CANARY_PATTERN_U8(cur))
0ce20dd840897b Alexander Potapenko 2021-02-25  178  			pr_cont(" .");
35beccf0926d42 Marco Elver         2021-02-25  179  		else if (no_hash_pointers)
0ce20dd840897b Alexander Potapenko 2021-02-25  180  			pr_cont(" 0x%02x", *cur);
0ce20dd840897b Alexander Potapenko 2021-02-25  181  		else /* Do not leak kernel memory in non-debug builds. */
0ce20dd840897b Alexander Potapenko 2021-02-25  182  			pr_cont(" !");
0ce20dd840897b Alexander Potapenko 2021-02-25  183  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  184  	pr_cont(" ]");
0ce20dd840897b Alexander Potapenko 2021-02-25  185  }
0ce20dd840897b Alexander Potapenko 2021-02-25  186  
bc8fbc5f305aec Marco Elver         2021-02-25  187  static const char *get_access_type(bool is_write)
bc8fbc5f305aec Marco Elver         2021-02-25  188  {
ff9b7e0b17e67f Thorsten Blum       2025-01-15  189  	return str_write_read(is_write);
bc8fbc5f305aec Marco Elver         2021-02-25  190  }
bc8fbc5f305aec Marco Elver         2021-02-25  191  
bc8fbc5f305aec Marco Elver         2021-02-25  192  void kfence_report_error(unsigned long address, bool is_write, struct pt_regs *regs,
d438fabce7860d Marco Elver         2021-02-25  193  			 const struct kfence_metadata *meta, enum kfence_error_type type)
0ce20dd840897b Alexander Potapenko 2021-02-25  194  {
0ce20dd840897b Alexander Potapenko 2021-02-25  195  	unsigned long stack_entries[KFENCE_STACK_DEPTH] = { 0 };
0ce20dd840897b Alexander Potapenko 2021-02-25  196  	const ptrdiff_t object_index = meta ? meta - kfence_metadata : -1;
d438fabce7860d Marco Elver         2021-02-25  197  	int num_stack_entries;
d438fabce7860d Marco Elver         2021-02-25  198  	int skipnr = 0;
d438fabce7860d Marco Elver         2021-02-25  199  
d438fabce7860d Marco Elver         2021-02-25  200  	if (regs) {
d438fabce7860d Marco Elver         2021-02-25  201  		num_stack_entries = stack_trace_save_regs(regs, stack_entries, KFENCE_STACK_DEPTH, 0);
d438fabce7860d Marco Elver         2021-02-25  202  	} else {
d438fabce7860d Marco Elver         2021-02-25  203  		num_stack_entries = stack_trace_save(stack_entries, KFENCE_STACK_DEPTH, 1);
d438fabce7860d Marco Elver         2021-02-25  204  		skipnr = get_stack_skipnr(stack_entries, num_stack_entries, &type);
d438fabce7860d Marco Elver         2021-02-25  205  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  206  
0ce20dd840897b Alexander Potapenko 2021-02-25  207  	/* Require non-NULL meta, except if KFENCE_ERROR_INVALID. */
0ce20dd840897b Alexander Potapenko 2021-02-25  208  	if (WARN_ON(type != KFENCE_ERROR_INVALID && !meta))
0ce20dd840897b Alexander Potapenko 2021-02-25  209  		return;
0ce20dd840897b Alexander Potapenko 2021-02-25  210  
0ce20dd840897b Alexander Potapenko 2021-02-25  211  	/*
0ce20dd840897b Alexander Potapenko 2021-02-25  212  	 * Because we may generate reports in printk-unfriendly parts of the
0ce20dd840897b Alexander Potapenko 2021-02-25  213  	 * kernel, such as scheduler code, the use of printk() could deadlock.
0ce20dd840897b Alexander Potapenko 2021-02-25  214  	 * Until such time that all printing code here is safe in all parts of
0ce20dd840897b Alexander Potapenko 2021-02-25  215  	 * the kernel, accept the risk, and just get our message out (given the
0ce20dd840897b Alexander Potapenko 2021-02-25  216  	 * system might already behave unpredictably due to the memory error).
0ce20dd840897b Alexander Potapenko 2021-02-25  217  	 * As such, also disable lockdep to hide warnings, and avoid disabling
0ce20dd840897b Alexander Potapenko 2021-02-25  218  	 * lockdep for the rest of the kernel.
0ce20dd840897b Alexander Potapenko 2021-02-25  219  	 */
0ce20dd840897b Alexander Potapenko 2021-02-25  220  	lockdep_off();
0ce20dd840897b Alexander Potapenko 2021-02-25  221  
0ce20dd840897b Alexander Potapenko 2021-02-25  222  	pr_err("==================================================================\n");
0ce20dd840897b Alexander Potapenko 2021-02-25  223  	/* Print report header. */
0ce20dd840897b Alexander Potapenko 2021-02-25  224  	switch (type) {
0ce20dd840897b Alexander Potapenko 2021-02-25  225  	case KFENCE_ERROR_OOB: {
0ce20dd840897b Alexander Potapenko 2021-02-25  226  		const bool left_of_object = address < meta->addr;
0ce20dd840897b Alexander Potapenko 2021-02-25  227  
bc8fbc5f305aec Marco Elver         2021-02-25  228  		pr_err("BUG: KFENCE: out-of-bounds %s in %pS\n\n", get_access_type(is_write),
bc8fbc5f305aec Marco Elver         2021-02-25  229  		       (void *)stack_entries[skipnr]);
702b16d724a61c Marco Elver         2021-03-12  230  		pr_err("Out-of-bounds %s at 0x%p (%luB %s of kfence-#%td):\n",
bc8fbc5f305aec Marco Elver         2021-02-25  231  		       get_access_type(is_write), (void *)address,
0ce20dd840897b Alexander Potapenko 2021-02-25  232  		       left_of_object ? meta->addr - address : address - meta->addr,
0ce20dd840897b Alexander Potapenko 2021-02-25  233  		       left_of_object ? "left" : "right", object_index);
0ce20dd840897b Alexander Potapenko 2021-02-25  234  		break;
0ce20dd840897b Alexander Potapenko 2021-02-25  235  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  236  	case KFENCE_ERROR_UAF:
bc8fbc5f305aec Marco Elver         2021-02-25  237  		pr_err("BUG: KFENCE: use-after-free %s in %pS\n\n", get_access_type(is_write),
bc8fbc5f305aec Marco Elver         2021-02-25  238  		       (void *)stack_entries[skipnr]);
702b16d724a61c Marco Elver         2021-03-12  239  		pr_err("Use-after-free %s at 0x%p (in kfence-#%td):\n",
bc8fbc5f305aec Marco Elver         2021-02-25  240  		       get_access_type(is_write), (void *)address, object_index);
0ce20dd840897b Alexander Potapenko 2021-02-25  241  		break;
0ce20dd840897b Alexander Potapenko 2021-02-25  242  	case KFENCE_ERROR_CORRUPTION:
0ce20dd840897b Alexander Potapenko 2021-02-25  243  		pr_err("BUG: KFENCE: memory corruption in %pS\n\n", (void *)stack_entries[skipnr]);
35beccf0926d42 Marco Elver         2021-02-25  244  		pr_err("Corrupted memory at 0x%p ", (void *)address);
0ce20dd840897b Alexander Potapenko 2021-02-25  245  		print_diff_canary(address, 16, meta);
702b16d724a61c Marco Elver         2021-03-12  246  		pr_cont(" (in kfence-#%td):\n", object_index);
0ce20dd840897b Alexander Potapenko 2021-02-25  247  		break;
0ce20dd840897b Alexander Potapenko 2021-02-25  248  	case KFENCE_ERROR_INVALID:
bc8fbc5f305aec Marco Elver         2021-02-25  249  		pr_err("BUG: KFENCE: invalid %s in %pS\n\n", get_access_type(is_write),
bc8fbc5f305aec Marco Elver         2021-02-25  250  		       (void *)stack_entries[skipnr]);
35beccf0926d42 Marco Elver         2021-02-25  251  		pr_err("Invalid %s at 0x%p:\n", get_access_type(is_write),
bc8fbc5f305aec Marco Elver         2021-02-25  252  		       (void *)address);
0ce20dd840897b Alexander Potapenko 2021-02-25  253  		break;
0ce20dd840897b Alexander Potapenko 2021-02-25  254  	case KFENCE_ERROR_INVALID_FREE:
0ce20dd840897b Alexander Potapenko 2021-02-25  255  		pr_err("BUG: KFENCE: invalid free in %pS\n\n", (void *)stack_entries[skipnr]);
702b16d724a61c Marco Elver         2021-03-12  256  		pr_err("Invalid free of 0x%p (in kfence-#%td):\n", (void *)address,
0ce20dd840897b Alexander Potapenko 2021-02-25  257  		       object_index);
0ce20dd840897b Alexander Potapenko 2021-02-25  258  		break;
0ce20dd840897b Alexander Potapenko 2021-02-25  259  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  260  
0ce20dd840897b Alexander Potapenko 2021-02-25  261  	/* Print stack trace and object info. */
0ce20dd840897b Alexander Potapenko 2021-02-25  262  	stack_trace_print(stack_entries + skipnr, num_stack_entries - skipnr, 0);
0ce20dd840897b Alexander Potapenko 2021-02-25  263  
0ce20dd840897b Alexander Potapenko 2021-02-25  264  	if (meta) {
ecaf7c4f9b92b1 Marco Elver         2025-01-09  265  		lockdep_assert_held(&meta->lock);
0ce20dd840897b Alexander Potapenko 2021-02-25  266  		pr_err("\n");
0ce20dd840897b Alexander Potapenko 2021-02-25  267  		kfence_print_object(NULL, meta);
0ce20dd840897b Alexander Potapenko 2021-02-25  268  	}
0ce20dd840897b Alexander Potapenko 2021-02-25  269  
0ce20dd840897b Alexander Potapenko 2021-02-25  270  	/* Print report footer. */
0ce20dd840897b Alexander Potapenko 2021-02-25  271  	pr_err("\n");
35beccf0926d42 Marco Elver         2021-02-25  272  	if (no_hash_pointers && regs)
d438fabce7860d Marco Elver         2021-02-25  273  		show_regs(regs);
d438fabce7860d Marco Elver         2021-02-25  274  	else
0ce20dd840897b Alexander Potapenko 2021-02-25  275  		dump_stack_print_info(KERN_ERR);
f2b84d2e40eb1a Alexander Potapenko 2021-02-25  276  	trace_error_report_end(ERROR_DETECTOR_KFENCE, address);
0ce20dd840897b Alexander Potapenko 2021-02-25  277  	pr_err("==================================================================\n");
0ce20dd840897b Alexander Potapenko 2021-02-25  278  
0ce20dd840897b Alexander Potapenko 2021-02-25  279  	lockdep_on();
0ce20dd840897b Alexander Potapenko 2021-02-25  280  
79cc1ba7badf9e Kees Cook           2022-11-17  281  	check_panic_on_warn("KFENCE");
0ce20dd840897b Alexander Potapenko 2021-02-25  282  
f0953a1bbaca71 Ingo Molnar         2021-05-06  283  	/* We encountered a memory safety error, taint the kernel! */
0ce20dd840897b Alexander Potapenko 2021-02-25  284  	add_taint(TAINT_BAD_PAGE, LOCKDEP_STILL_OK);
0ce20dd840897b Alexander Potapenko 2021-02-25  285  }
2dfe63e61cc31e Marco Elver         2022-04-14  286  
2dfe63e61cc31e Marco Elver         2022-04-14  287  #ifdef CONFIG_PRINTK
2dfe63e61cc31e Marco Elver         2022-04-14  288  static void kfence_to_kp_stack(const struct kfence_track *track, void **kp_stack)
2dfe63e61cc31e Marco Elver         2022-04-14  289  {
2dfe63e61cc31e Marco Elver         2022-04-14  290  	int i, j;
2dfe63e61cc31e Marco Elver         2022-04-14  291  
2dfe63e61cc31e Marco Elver         2022-04-14  292  	i = get_stack_skipnr(track->stack_entries, track->num_stack_entries, NULL);
2dfe63e61cc31e Marco Elver         2022-04-14  293  	for (j = 0; i < track->num_stack_entries && j < KS_ADDRS_COUNT; ++i, ++j)
2dfe63e61cc31e Marco Elver         2022-04-14  294  		kp_stack[j] = (void *)track->stack_entries[i];
2dfe63e61cc31e Marco Elver         2022-04-14  295  	if (j < KS_ADDRS_COUNT)
2dfe63e61cc31e Marco Elver         2022-04-14  296  		kp_stack[j] = NULL;
2dfe63e61cc31e Marco Elver         2022-04-14  297  }
2dfe63e61cc31e Marco Elver         2022-04-14  298  
2dfe63e61cc31e Marco Elver         2022-04-14  299  bool __kfence_obj_info(struct kmem_obj_info *kpp, void *object, struct slab *slab)
2dfe63e61cc31e Marco Elver         2022-04-14  300  {
2dfe63e61cc31e Marco Elver         2022-04-14  301  	struct kfence_metadata *meta = addr_to_metadata((unsigned long)object);
2dfe63e61cc31e Marco Elver         2022-04-14  302  	unsigned long flags;
2dfe63e61cc31e Marco Elver         2022-04-14  303  
2dfe63e61cc31e Marco Elver         2022-04-14  304  	if (!meta)
2dfe63e61cc31e Marco Elver         2022-04-14  305  		return false;
2dfe63e61cc31e Marco Elver         2022-04-14  306  
2dfe63e61cc31e Marco Elver         2022-04-14  307  	/*
2dfe63e61cc31e Marco Elver         2022-04-14  308  	 * If state is UNUSED at least show the pointer requested; the rest
2dfe63e61cc31e Marco Elver         2022-04-14  309  	 * would be garbage data.
2dfe63e61cc31e Marco Elver         2022-04-14  310  	 */
2dfe63e61cc31e Marco Elver         2022-04-14  311  	kpp->kp_ptr = object;
2dfe63e61cc31e Marco Elver         2022-04-14  312  
2dfe63e61cc31e Marco Elver         2022-04-14  313  	/* Requesting info an a never-used object is almost certainly a bug. */
2dfe63e61cc31e Marco Elver         2022-04-14  314  	if (WARN_ON(meta->state == KFENCE_OBJECT_UNUSED))
2dfe63e61cc31e Marco Elver         2022-04-14  315  		return true;
2dfe63e61cc31e Marco Elver         2022-04-14  316  
2dfe63e61cc31e Marco Elver         2022-04-14 @317  	raw_spin_lock_irqsave(&meta->lock, flags);

:::::: The code at line 142 was first introduced by commit
:::::: 0ce20dd840897b12ae70869c69f1ba34d6d16965 mm: add Kernel Electric-Fence infrastructure

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
