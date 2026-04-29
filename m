Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128993C07A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777499219; cv=none; b=LzlgdjEI6aAfeK55n9f5r2CzWjTJbUC7zI9Rz9qmQlKk6R7iGZ5/5dRham/1AMOgn2eHBkRNDUCqLo0sgg0u6pLoctge2rSC+XVJVJu7EhvNrKBfMYhCm0h1xpQPUItllqP5pSXT7TJJ3D9XdH+CwhbwFE5VzjTyOAlvTof8XP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777499219; c=relaxed/simple;
	bh=ftU7t4RCEFK2Wquze5mQesg5XfOpj+I+z5MeEPTWbOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sa4L6sIooRFyGjjEFIA7DJhy+KxZtjjeahp/AvJ3M9ciPPDWHmWPja91RR3MBm6pMLjoggOJjht806zg96YQ9KyElko9bmJMwphpD6OqTtCyBdUDi19MVpNm/O38t9C49q8+fXCxIW6fuHLOcsCy11QzOK4O+rOVWs6rg1+YCMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9SiGs+4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9SiGs+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777499218; x=1809035218;
  h=date:from:to:cc:subject:message-id;
  bh=ftU7t4RCEFK2Wquze5mQesg5XfOpj+I+z5MeEPTWbOY=;
  b=X9SiGs+4Gkpaeyc7REN9aBjR2cBKBWE0tUvXr1O33AOiSgen931uvq1n
   IaGLxqeHAnkMoxrxRrvxP0lzINctndpAp9pBFj+rT5tT+O46rzrMPKJtE
   TL/7PKLTiiepuuYLz6Lm/oriYag0CzNdJlkOyAtc/jfWBigpI+e9VX5O+
   F7bZxFHE8drNKgQ+qdtHGwO4lyyruKRUYVqrJL6KRcEQh0MC3BOURah7W
   pZNJaAMHJaqt057VQ8AB9qcyQ6y/U9/djz1zsIOxavWiXtl7JMAns9D5s
   KBS8ywYfTviDgngAxqFmQtPGHGvjeRH6E0YOGvbWniMhzjcF8t05gD4N5
   Q==;
X-CSE-ConnectionGUID: dob7mRsTQ/+n3YK+PpN8TA==
X-CSE-MsgGUID: C9A4I/1LTe+CLDLSyRORPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88751143"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="88751143"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:46:58 -0700
X-CSE-ConnectionGUID: ZojIj1ebTjebBa7vGl+zow==
X-CSE-MsgGUID: gaq3bq7pSMORRvldsKOdyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234266697"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2026 14:46:56 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wICk9-00000000BZd-01ZT;
	Wed, 29 Apr 2026 21:46:53 +0000
Date: Thu, 30 Apr 2026 05:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: loongarch64-linux-gcc: error: unrecognized argument in
 option '-march=la32v1.0'
Message-ID: <202604300518.niGSNE7F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57b8e2d666a31fa201432d58f5fe3469a0dd83ba
commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd LoongArch: Adjust build infrastructure for 32BIT/64BIT
date:   8 days ago
config: loongarch-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300518.niGSNE7F-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300518.niGSNE7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300518.niGSNE7F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1 shuffle=3714732041
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1 shuffle=3714732041
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1336: prepare0] Error 2 shuffle=3714732041
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3714732041
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3714732041
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
