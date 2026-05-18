Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E21037FF46
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779074156; cv=none; b=di+Zz8JVQrbLbINiSao6lSjct2bUDCMPn/KLvUBnUn2W4KVZK+HP2TZzd9yzcd2ZqXRetyvdCjnAY0YQ/fk/1H9bZW38l7dPj355FEqMB3PvItORa1bis7ClwPwaW+m1MrUfV1HvdlRdijJjSo6j8VQDuGAVBo+XdBTP8xyd3JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779074156; c=relaxed/simple;
	bh=Df1b5MEc0/IvYBJx/u0oyOemIzmciVKWKqwirXGjC2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RKzlhlLBM7huon6Zmj9+K3kYRFYLGiOFesDnuQNxcZhp9q6INafP1CKGF/t4kvCnsLg7UilYLhsXv+wsfIIY0kh2ef55qR6SS9tm8RCogGWxbQ9sGZOZ1jSk2HLNxN/ilckymc/8nu1ljj0aP80PpOUSPsgre5gnqQ+MD6Xz3W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fw+WwGMN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fw+WwGMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779074154; x=1810610154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Df1b5MEc0/IvYBJx/u0oyOemIzmciVKWKqwirXGjC2Q=;
  b=Fw+WwGMNhv62HfHj/Kv4PW60tHAYW2bXwS0N1RF0ndnnaRTa5xHg43bj
   Jv8YtzpLfzPdeKBFBMgQoLn5MtKScxV+K0kMb1eWPxrGbfDkMSiURUKLk
   BQmocPwa5Dr4lcy4+O+w+nUdOF5c+jpgBNSqQ0LivrEP2+INrFNqWLKMq
   XAkneQWGG1kuW9gpzeDsRnziTq3vQNpLRlbtM11jpd99umR0Obif0r2Di
   iIh71OoTUW8SbHVVEvJYzP6ORhJp1C72ShTwR3deSwprFdmPIOE+1jHKW
   WhuveZaHiy0ZwyoQEtAL9QhMRKzrQFJVdOlwYRMamEF4ODfx9MWr+WarC
   w==;
X-CSE-ConnectionGUID: TlkmjpugSaCHNWALROW7yA==
X-CSE-MsgGUID: OL/1Tf+YTO+keDYcW4QO4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="82485548"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="82485548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 20:15:54 -0700
X-CSE-ConnectionGUID: 9nsbuSX+RK6GUQLVJGaUvQ==
X-CSE-MsgGUID: XhAtpVXGT5y+vEJQfn9VJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="236663021"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2026 20:15:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOoSM-000000009jF-0Vmi;
	Mon, 18 May 2026 03:15:50 +0000
Date: Mon, 18 May 2026 05:14:53 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 23/52]
 include/linux/dynamic_debug.h:331:1: error: extraneous closing brace ('}')
Message-ID: <202605180550.9BQPKJBA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   270053dc597e59c9ffc0b5f17c8863076b56c7cf
commit: a3f35a330ec694a21578ef9d439e502c80e3e227 [23/52] dyndbg: change __dynamic_func_call_cls* macros into expressions
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260518/202605180550.9BQPKJBA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180550.9BQPKJBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180550.9BQPKJBA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:31:
>> include/linux/dynamic_debug.h:331:1: error: extraneous closing brace ('}')
     331 | })
         | ^
>> include/linux/dynamic_debug.h:331:2: error: expected identifier or '('
     331 | })
         |  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&


vim +331 include/linux/dynamic_debug.h

   319	
   320	#define dynamic_pr_debug(fmt, ...)					\
   321		no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
   322	#define dynamic_dev_dbg(dev, fmt, ...)					\
   323		dev_no_printk(KERN_DEBUG, dev, fmt, ##__VA_ARGS__)
   324	#define dynamic_hex_dump(prefix_str, prefix_type, rowsize,		\
   325				 groupsize, buf, len, ascii)			\
   326	({									\
   327		if (0)								\
   328			print_hex_dump(KERN_DEBUG, prefix_str, prefix_type,	\
   329				       rowsize, groupsize, buf, len, ascii);	\
   330		0;
 > 331	})
   332	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
