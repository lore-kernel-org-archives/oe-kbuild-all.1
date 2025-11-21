Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B69D30BF63
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763764687; cv=none; b=AMChPWaitAuBy52D5ILm05QXyK4vs9bGxg5irfiz9kxFeGmp5edWEWkNgd22XZAg1dKMbFVm6UuFJ+36Syy3yG37IbdPKOTxVzicar38tCm0x1XG7fIyYerUm+J5TtxYqM4A/oOLt6kAonlQxHa00vvvtN0PcQlkLtdcWU7drcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763764687; c=relaxed/simple;
	bh=Fl8FgFfed0v7nTCPhhhi88tsHvdMK6NmjEfWUJNmG4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QyJtlrOj8mPZ+GrFsjt/whVvlHpZIvAflvwHk9LauwSFW7/iOH3P0ev6S7gPXUtczOsAMQQ7lJtRbK7a2P1ajfQkR/TmVAb5z8r4i+tRfHgLT62U+FRjjGxZItamwTmzjM1GcaeNJWlSi5sHb5s0UrBCP0yZUDzmX0T4c32RAb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyXVCqsd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyXVCqsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763764676; x=1795300676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fl8FgFfed0v7nTCPhhhi88tsHvdMK6NmjEfWUJNmG4E=;
  b=SyXVCqsdKmujNTTMwbnEtb/rqdj3MONYoMusXXpQpD/DLRg0rDMxipaq
   PQGhUgw56RydXS6ybng1WYTOgfoegIz+Zd+u3SCGiy/MpK9ttKdI4bTXi
   dC/BHjmzUp2A3YVjdQqcU+uTWHy4cqApOxNdUvpsFTVIXno07pYcdxvhZ
   RKqrITl2mrRYYo/dMZFoJAgFjLymmGs7jtGBrMOMqa2ke7YsT/6RmLKDX
   ZHL48v66fdjrIi75gKzDkvKaQKuIPwSVsdLpeyM8zrBzCaeWN4zEFnyXq
   5BhcPVnhjwCrfy4XVfIbgYKQ7kM1WMtnwcdKJOEpnMT6UlBErxASpYNFK
   g==;
X-CSE-ConnectionGUID: GWkvUGy3TyqkE26isJy2ZQ==
X-CSE-MsgGUID: w/HD7Pb5QSOoB4VB0ggMNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65948579"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65948579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 14:37:52 -0800
X-CSE-ConnectionGUID: itFdVGjeTd2K8XhKTcAOHg==
X-CSE-MsgGUID: +Gh1sa9vSyGDEhGVtdegNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191688847"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2025 14:37:50 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMZlE-0006vj-1H;
	Fri, 21 Nov 2025 22:37:48 +0000
Date: Sat, 22 Nov 2025 06:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:for-test 34/36] crypto/acompress.c:442:17: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202511220627.ApNaVCYY-lkp@intel.com>
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
commit: 0b6ef6acdaebe38d8aee6bcad593047c5812dc55 [34/36] crypto: Enable context analysis
config: arm-randconfig-r122-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220627.ApNaVCYY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220627.ApNaVCYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220627.ApNaVCYY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/acompress.c:442:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/acompress.c:442:17: sparse:     expected struct __context_bitlock const *var
   crypto/acompress.c:442:17: sparse:     got struct spinlock *
   crypto/acompress.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h, ...):
   include/linux/spinlock.h:350:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:350:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:350:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:350:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:350:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:350:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
--
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/scompress.c:236:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/scompress.c:236:46: sparse:     expected struct __context_bitlock const *var
   crypto/scompress.c:236:46: sparse:     got struct spinlock *
   crypto/scompress.c:239:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/scompress.c:239:49: sparse:     expected struct __context_bitlock const *var
   crypto/scompress.c:239:49: sparse:     got struct spinlock *
   crypto/scompress.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h, ...):
   include/linux/spinlock.h:350:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:350:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:350:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *
--
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
>> crypto/ansi_cprng.c:324:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct spinlock * @@
   crypto/ansi_cprng.c:324:9: sparse:     expected struct srcu_struct const *var
   crypto/ansi_cprng.c:324:9: sparse:     got struct spinlock *
   crypto/ansi_cprng.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h, ...):
   include/linux/spinlock.h:350:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:350:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:350:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:350:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:350:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:350:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *
--
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/jitterentropy-kcapi.c:231:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/jitterentropy-kcapi.c:231:9: sparse:     expected struct __context_bitlock const *var
   crypto/jitterentropy-kcapi.c:231:9: sparse:     got struct spinlock *
   crypto/jitterentropy-kcapi.c:268:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/jitterentropy-kcapi.c:268:9: sparse:     expected struct __context_bitlock const *var
   crypto/jitterentropy-kcapi.c:268:9: sparse:     got struct spinlock *
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h, ...):
   include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
--
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/drbg.c:1919:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct mutex * @@
   crypto/drbg.c:1919:9: sparse:     expected struct __context_bitlock const *var
   crypto/drbg.c:1919:9: sparse:     got struct mutex *
   crypto/drbg.c:2023:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct mutex * @@
   crypto/drbg.c:2023:9: sparse:     expected struct __context_bitlock const *var
   crypto/drbg.c:2023:9: sparse:     got struct mutex *
--
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/crypto_engine.c:48:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:48:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:48:17: sparse:     got struct raw_spinlock [usertype] *
>> crypto/crypto_engine.c:48:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:48:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:48:17: sparse:     got struct raw_spinlock [usertype] *
>> crypto/crypto_engine.c:48:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:48:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:48:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:79:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:79:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:79:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:79:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:79:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:79:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:79:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:79:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:79:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c:140:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:140:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:140:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:140:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:140:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:140:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:140:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:140:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:140:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:163:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:163:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:163:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:163:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:163:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:163:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:163:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:163:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:163:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:195:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:195:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:195:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:195:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:195:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:195:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:195:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:195:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:195:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c:367:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:367:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:367:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:367:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:367:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:367:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:367:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:367:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:367:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c:395:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:395:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:395:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:395:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:395:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:395:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:395:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:395:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:395:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c:404:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:404:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:404:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:404:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:404:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:404:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:404:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:404:17: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:404:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:456:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:456:9: sparse:     expected struct __context_bitlock const *var
   crypto/crypto_engine.c:456:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h, ...):
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
--
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/geniv.c:115:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/geniv.c:115:9: sparse:     expected struct __context_bitlock const *var
   crypto/geniv.c:115:9: sparse:     got struct spinlock *
--
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/deflate.c:121:13: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/deflate.c:121:13: sparse:     expected struct __context_bitlock const *var
   crypto/deflate.c:121:13: sparse:     got struct spinlock *
   crypto/deflate.c:202:13: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/deflate.c:202:13: sparse:     expected struct __context_bitlock const *var
   crypto/deflate.c:202:13: sparse:     got struct spinlock *
   crypto/deflate.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h, ...):
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *
--
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/zstd.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   crypto/zstd.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/zstd.c:116:13: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/zstd.c:116:13: sparse:     expected struct __context_bitlock const *var
   crypto/zstd.c:116:13: sparse:     got struct spinlock *
   crypto/zstd.c:225:13: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   crypto/zstd.c:225:13: sparse:     expected struct __context_bitlock const *var
   crypto/zstd.c:225:13: sparse:     got struct spinlock *
   crypto/zstd.c: note: in included file (through include/linux/swait.h, include/linux/completion.h, include/linux/crypto.h):
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:398:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:398:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:398:9: sparse:     got struct raw_spinlock *

vim +442 crypto/acompress.c

42d9f6c774790d Herbert Xu 2025-03-19  415  
42d9f6c774790d Herbert Xu 2025-03-19  416  int crypto_acomp_alloc_streams(struct crypto_acomp_streams *s)
42d9f6c774790d Herbert Xu 2025-03-19  417  {
42d9f6c774790d Herbert Xu 2025-03-19  418  	struct crypto_acomp_stream __percpu *streams;
42d9f6c774790d Herbert Xu 2025-03-19  419  	struct crypto_acomp_stream *ps;
42d9f6c774790d Herbert Xu 2025-03-19  420  	unsigned int i;
42d9f6c774790d Herbert Xu 2025-03-19  421  	void *ctx;
42d9f6c774790d Herbert Xu 2025-03-19  422  
42d9f6c774790d Herbert Xu 2025-03-19  423  	if (s->streams)
42d9f6c774790d Herbert Xu 2025-03-19  424  		return 0;
42d9f6c774790d Herbert Xu 2025-03-19  425  
42d9f6c774790d Herbert Xu 2025-03-19  426  	streams = alloc_percpu(struct crypto_acomp_stream);
42d9f6c774790d Herbert Xu 2025-03-19  427  	if (!streams)
42d9f6c774790d Herbert Xu 2025-03-19  428  		return -ENOMEM;
42d9f6c774790d Herbert Xu 2025-03-19  429  
42d9f6c774790d Herbert Xu 2025-03-19  430  	ctx = s->alloc_ctx();
42d9f6c774790d Herbert Xu 2025-03-19  431  	if (IS_ERR(ctx)) {
42d9f6c774790d Herbert Xu 2025-03-19  432  		free_percpu(streams);
42d9f6c774790d Herbert Xu 2025-03-19  433  		return PTR_ERR(ctx);
42d9f6c774790d Herbert Xu 2025-03-19  434  	}
42d9f6c774790d Herbert Xu 2025-03-19  435  
42d9f6c774790d Herbert Xu 2025-03-19  436  	i = cpumask_first(cpu_possible_mask);
42d9f6c774790d Herbert Xu 2025-03-19  437  	ps = per_cpu_ptr(streams, i);
42d9f6c774790d Herbert Xu 2025-03-19  438  	ps->ctx = ctx;
42d9f6c774790d Herbert Xu 2025-03-19  439  
42d9f6c774790d Herbert Xu 2025-03-19  440  	for_each_possible_cpu(i) {
42d9f6c774790d Herbert Xu 2025-03-19  441  		ps = per_cpu_ptr(streams, i);
42d9f6c774790d Herbert Xu 2025-03-19 @442  		spin_lock_init(&ps->lock);
42d9f6c774790d Herbert Xu 2025-03-19  443  	}
42d9f6c774790d Herbert Xu 2025-03-19  444  
42d9f6c774790d Herbert Xu 2025-03-19  445  	s->streams = streams;
42d9f6c774790d Herbert Xu 2025-03-19  446  
42d9f6c774790d Herbert Xu 2025-03-19  447  	INIT_WORK(&s->stream_work, acomp_stream_workfn);
42d9f6c774790d Herbert Xu 2025-03-19  448  	return 0;
42d9f6c774790d Herbert Xu 2025-03-19  449  }
42d9f6c774790d Herbert Xu 2025-03-19  450  EXPORT_SYMBOL_GPL(crypto_acomp_alloc_streams);
42d9f6c774790d Herbert Xu 2025-03-19  451  

:::::: The code at line 442 was first introduced by commit
:::::: 42d9f6c774790d290c175e8775ce9f1366438098 crypto: acomp - Move scomp stream allocation code into acomp

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
