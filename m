Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF09D348866
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772992193; cv=none; b=LJ15OdiIMuTzaGCvYRmDQeL3/BeqEn6cFqpNTchhcP5mtKK2M+2redmafCb/+ETUmunvuSsX+phOceF2AnVmqNqmyNtMEAJeTkErb7X/WwUVUtNflW4whxgd6ZpHFjrT0iUQOs1limn31LcRmB4e3uMkdrtcddsuZqkLC7SWpNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772992193; c=relaxed/simple;
	bh=8dVPNwjNWmbGdXN5bXxLNcOXIWdLN9gEcUxAWzJbpy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZHSqursHjv4U4u5Tj448lk8GGk19bghfojHv+IWLUaYDIH4zuxzSStpvYUvr0dPUNktS1uvu7IUOHwIwIGG6qG2zzp+eEKsbuGFDiUSj2j8eGOHpKj1a9lEX5cADS6lJFyF2WlQGVx67RTxjQkbPOlJA/dqiJ2TA2LiNdZxdS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqQUtLel; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqQUtLel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772992192; x=1804528192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8dVPNwjNWmbGdXN5bXxLNcOXIWdLN9gEcUxAWzJbpy0=;
  b=TqQUtLelEPN9TYVuRv4HvURcBKmIQ2zVafMRZ9P/PGQSiHJLhV6/ckGs
   9CLhOrLE9YafSW50IfKjB1U/aXJwgUi9BMpbFiLt2Stw1or1F1gqLQ1VL
   o5ek4XKVx2vR9uhl+YPwES/yaGTnIT0UVWbLBlC+cAlRoX2n8XisGuHua
   9ddbghWFjGfq21IPRm9br61qFB5AAa/tFRCIWQ7421jxxBR9NDPsfPQE9
   0HuWEe86gnQ4SMNxm2iSKj175v28QnUVMWPz/1Qfo5hn6/fUlxs6LnFZU
   dnELkzoeNCJzUumVJbAWZNKwg+rgVNbifgsjwCit3UgxAgr3PPPMlXt3o
   w==;
X-CSE-ConnectionGUID: CI0bC6RzSTiC+uYes4fwxg==
X-CSE-MsgGUID: D+1yp71UT0O+LNRwNQJT2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91410090"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="91410090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 10:49:51 -0700
X-CSE-ConnectionGUID: pBlA8zrLTaaxSCApludqvQ==
X-CSE-MsgGUID: 67twbfjMRyOFub9CwIEuQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="222238206"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2026 10:49:50 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzIGB-000000003IM-1quq;
	Sun, 08 Mar 2026 17:49:47 +0000
Date: Mon, 09 Mar 2026 01:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-ucontext 2/2]
 arch/parisc/kernel/asm-offsets.c:31:10: fatal error: asm/ucontext.h: No such
 file or directory
Message-ID: <202603090138.misNEgb1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-ucontext
head:   8cf410e00cbd455a58c0b306581463883bf7ab19
commit: 8cf410e00cbd455a58c0b306581463883bf7ab19 [2/2] ucontext
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260309/202603090138.misNEgb1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090138.misNEgb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090138.misNEgb1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/parisc/kernel/asm-offsets.c:31:10: fatal error: asm/ucontext.h: No such file or directory
      31 | #include <asm/ucontext.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:184: arch/parisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1341: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +31 arch/parisc/kernel/asm-offsets.c

65fddcfca8ad14 Mike Rapoport  2020-06-08  25  
6ff7fa4b239311 Helge Deller   2021-10-04  26  #include <asm/assembly.h>
^1da177e4c3f41 Linus Torvalds 2005-04-16  27  #include <asm/ptrace.h>
^1da177e4c3f41 Linus Torvalds 2005-04-16  28  #include <asm/processor.h>
^1da177e4c3f41 Linus Torvalds 2005-04-16  29  #include <asm/pdc.h>
df24e1783e6e0e Helge Deller   2021-12-08  30  #include <uapi/asm/sigcontext.h>
df24e1783e6e0e Helge Deller   2021-12-08 @31  #include <asm/ucontext.h>
df24e1783e6e0e Helge Deller   2021-12-08  32  #include <asm/rt_sigframe.h>
7c0f6ba682b9c7 Linus Torvalds 2016-12-24  33  #include <linux/uaccess.h>
df24e1783e6e0e Helge Deller   2021-12-08  34  #include "signal32.h"
^1da177e4c3f41 Linus Torvalds 2005-04-16  35  

:::::: The code at line 31 was first introduced by commit
:::::: df24e1783e6e0eb3dc0e3ba5a8df3bb0cc537408 parisc: Add vDSO support

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
