Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5782F7F19
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779057542; cv=none; b=F4PfRdFgQ+b1TZvN4LuEEC4MaJydpBnxu2gI5pKSuYuRj4OMPJ8ES/2Cy4jDZ92d4k9SIgAqjQYkqwVI70GWze7YGsTdSq6tTyVgbJcSQ9ftg02C/+IgyqCe0IVELxLtqK+hGRJLf9mg3w3cpLku1LGpI45i08tKSpKwbcfiMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779057542; c=relaxed/simple;
	bh=ewcuO+Rcoq6gvXxlWa4FM/RnGAgQdtxnO03wwmgQDqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C98udelaK4+mEGYuXizbm3n818dhvX9wq4/WPuR1srA9V8J0mz39Cna85ydOjHUNPeGUcItpa9+iK7hC8FQCErwwEvgvd+Wss23nUn2GKydcagK6JRCcM7RX17yggFGOAgZb6qx/7O0haYzPcewolnKvv/4hKBUboNEZ8f/S7RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/x5h7VV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/x5h7VV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779057540; x=1810593540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ewcuO+Rcoq6gvXxlWa4FM/RnGAgQdtxnO03wwmgQDqI=;
  b=e/x5h7VV8bhlMDX9gyCtvUyG/ZXYL2fK4voFRpQkXtA4a+SBfH8SEuqQ
   TjnGLZf7mODeI8BDuuLqrimHvW4SNnmnKVv+v8v7KAjPHFl4oFpmS3/Ih
   4VoQpaH3d6KqwklxgepsmxUbPH5ltMfSAdWIlMovxofSHVqwLpnosZV7q
   X0LIeBYXW1Gq42msamY57aDwSwN2WAGYjMalW49igdwF2v1GPWfTnjHYi
   MyDBfd4D562NVJuCg0BJwVsJihOonEgOIZK6VwhoEfRqCvO1RXihXeXJv
   Xrtaf1GEdUOivwIUImhtqOnQOCdxECP10gKWtPiTYwqosR3xx7T6EhCH6
   A==;
X-CSE-ConnectionGUID: GK/wqoGARbiwCGfS1o/XOw==
X-CSE-MsgGUID: s+MfWjDoTn6wJ5rWZMUCgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79958291"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="79958291"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 15:39:00 -0700
X-CSE-ConnectionGUID: bkqxhPKhTeaUvehAVYtxiw==
X-CSE-MsgGUID: ds67dtroR1OykSYpxY76QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="277357311"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 May 2026 15:38:59 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOk8N-0000000020A-2Kfj;
	Sun, 17 May 2026 22:38:55 +0000
Date: Mon, 18 May 2026 06:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 23/52]
 include/linux/dynamic_debug.h:331:1: error: extraneous closing brace ('}')
Message-ID: <202605180650.LyuPI51F-lkp@intel.com>
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
config: x86_64-randconfig-076-20260518 (https://download.01.org/0day-ci/archive/20260518/202605180650.LyuPI51F-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180650.LyuPI51F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180650.LyuPI51F-lkp@intel.com/

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
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=4114942565
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1375: prepare0] Error 2 shuffle=4114942565
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4114942565
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4114942565
   make: Target 'prepare' not remade because of errors.


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
