Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE92B2D2486
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758306; cv=none; b=DkWVIFxY2rtg/Q69H/QC3VlIK63NVRr26AEnjltDJbkNPoB80MQXBF2rlGh1w5/4IydvAOC2Z9OLz9SKeWdss7sd+GAWmaDL5t9L7bJbTn7BCpijryN6AnWPrD824Yo0AkOfz3C/BhtKGKnJPck0WD8XxixrgqexX/HdgFkNQH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758306; c=relaxed/simple;
	bh=QlgShUh4ccHLo4NHyjBzbOhM9sAFQ61kr8ce4V1ejwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EXtVZkHrCIIQmVjs4+ESRMNdplIammuSa+JXe5Ox1hih5sVb5T+bHzZ0AgPox3Sy6i3Wn6q6KeaQPBq2O2t1DBf/uiJvOEMe0GjBKm+SgiRHslsl2IiOP5ZaLvAGVSTZnobZ9BbeI4cDac66aUDpHkuwJQllBaXqVM1munRpNPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxUSFT54; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxUSFT54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763758303; x=1795294303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QlgShUh4ccHLo4NHyjBzbOhM9sAFQ61kr8ce4V1ejwQ=;
  b=AxUSFT54CKLuvasA/GO171OYXHYIkjgrfYvDgIWIpNv/BM274/eltgoI
   jyzZ4a7AQ3ujg9ktz+U+c448ShYucVxOUWVgRZsdaRLbqAUc84XHuS2jw
   4jcTN/cgN6urIkiN51schOF4u4OIgfmkovYsxgbloAHWDp5cLk5n0lLUp
   HhRo8e94RD/Hv75nR2tivUw22jtUs84BX71HQZdi7WFhwszJAD6G66zu9
   uN1HhLMT5BcfGWO2hSkW9SKAdTkglkYh/EbKGjJibevO8G8pCylS7XQC5
   xvy6c+5hP7zi7N5/373QNQiqa9vw0oTKINYn0/A5+leuFojLaO8k5vDLc
   A==;
X-CSE-ConnectionGUID: LQqBjfncTlu7pM2enMxc1Q==
X-CSE-MsgGUID: iwQ4lBaAS/WlFRQARLs8Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65049674"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65049674"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 12:51:42 -0800
X-CSE-ConnectionGUID: CPEy0rooQe+72qlKrO3crg==
X-CSE-MsgGUID: 1MMpqnnZQaWxH3f4Kvw+sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="229088275"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2025 12:51:40 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMY6T-0006s7-2g;
	Fri, 21 Nov 2025 20:51:37 +0000
Date: Sat, 22 Nov 2025 04:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:for-test 28/36] kernel/kcov.c:411:9: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202511220403.uoJ31fnA-lkp@intel.com>
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
commit: 5dd3b2996835e75e23d56a6e4cbd142cd6c31351 [28/36] kcov: Enable context analysis
config: arm-randconfig-r122-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220403.uoJ31fnA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220403.uoJ31fnA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220403.uoJ31fnA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> kernel/kcov.c:411:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:411:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:411:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/kcov.c:411:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:411:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:411:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/kcov.c:411:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:411:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:411:9: sparse:     got struct spinlock *
   kernel/kcov.c:459:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:459:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:459:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:459:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:459:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:459:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:459:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:459:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:459:9: sparse:     got struct spinlock *
   kernel/kcov.c:502:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:502:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:502:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:502:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:502:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:502:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:502:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:502:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:502:9: sparse:     got struct spinlock *
   kernel/kcov.c:533:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:533:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:533:9: sparse:     got struct spinlock *
   kernel/kcov.c:659:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:659:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:659:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:659:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:659:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:659:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:659:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:659:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:659:17: sparse:     got struct spinlock *
   kernel/kcov.c:729:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:729:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:729:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:729:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:729:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:729:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:729:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:729:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:729:17: sparse:     got struct spinlock *
   kernel/kcov.c:762:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:762:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:762:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:762:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:762:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:762:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:762:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:762:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:762:17: sparse:     got struct spinlock *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:877:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:877:9: sparse:     got struct local_lock [noderef] __percpu *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:877:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:877:9: sparse:     got struct local_lock [noderef] __percpu *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:877:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:877:9: sparse:     got struct local_lock [noderef] __percpu *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:877:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:877:9: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:885:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:885:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:885:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:885:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:885:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:885:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:885:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:885:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:894:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:894:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:894:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:894:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:894:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:894:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:894:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:894:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:902:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:902:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:902:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:902:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:902:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:902:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:902:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:902:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:929:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:929:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:929:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:929:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:929:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:929:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:929:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:929:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:935:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:935:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:935:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:935:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:935:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:935:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:935:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:935:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:947:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:947:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:947:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:947:9: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:947:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:947:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:947:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:947:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1030:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1030:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1030:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1030:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1030:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1030:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:1030:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:1030:9: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1035:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1035:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:1035:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:1035:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1035:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1035:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1035:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1035:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1043:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1043:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1043:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1043:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:1043:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:1043:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:1043:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1043:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1043:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1043:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1043:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1043:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1048:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1048:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1048:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1048:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:1048:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:1048:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:1048:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1048:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1048:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1048:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1048:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1048:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1078:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1078:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1078:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1078:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:1078:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:1078:9: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:1078:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1078:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1078:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1078:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1078:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1078:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:410:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:410:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:410:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct rwlock const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct rwlock const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
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

vim +411 kernel/kcov.c

eec028c9386ed1 Andrey Konovalov 2019-12-04  402  
eec028c9386ed1 Andrey Konovalov 2019-12-04  403  static void kcov_remote_reset(struct kcov *kcov)
5dd3b2996835e7 Marco Elver      2025-02-04  404  	__must_hold(&kcov->lock)
eec028c9386ed1 Andrey Konovalov 2019-12-04  405  {
eec028c9386ed1 Andrey Konovalov 2019-12-04  406  	int bkt;
eec028c9386ed1 Andrey Konovalov 2019-12-04  407  	struct kcov_remote *remote;
eec028c9386ed1 Andrey Konovalov 2019-12-04  408  	struct hlist_node *tmp;
5ff3b30ab57da8 Andrey Konovalov 2020-06-04  409  	unsigned long flags;
eec028c9386ed1 Andrey Konovalov 2019-12-04  410  
5ff3b30ab57da8 Andrey Konovalov 2020-06-04 @411  	spin_lock_irqsave(&kcov_remote_lock, flags);
eec028c9386ed1 Andrey Konovalov 2019-12-04  412  	hash_for_each_safe(kcov_remote_map, bkt, tmp, remote, hnode) {
eec028c9386ed1 Andrey Konovalov 2019-12-04  413  		if (remote->kcov != kcov)
eec028c9386ed1 Andrey Konovalov 2019-12-04  414  			continue;
eec028c9386ed1 Andrey Konovalov 2019-12-04  415  		hash_del(&remote->hnode);
eec028c9386ed1 Andrey Konovalov 2019-12-04  416  		kfree(remote);
eec028c9386ed1 Andrey Konovalov 2019-12-04  417  	}
eec028c9386ed1 Andrey Konovalov 2019-12-04  418  	/* Do reset before unlock to prevent races with kcov_remote_start(). */
eec028c9386ed1 Andrey Konovalov 2019-12-04  419  	kcov_reset(kcov);
5ff3b30ab57da8 Andrey Konovalov 2020-06-04  420  	spin_unlock_irqrestore(&kcov_remote_lock, flags);
eec028c9386ed1 Andrey Konovalov 2019-12-04  421  }
eec028c9386ed1 Andrey Konovalov 2019-12-04  422  

:::::: The code at line 411 was first introduced by commit
:::::: 5ff3b30ab57da82d8db4f14662a2858cabfbc2c0 kcov: collect coverage from interrupts

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
