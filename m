Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA36341050
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 23:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779060127; cv=none; b=ARO9CO1oHYcm+QPWmmYJ6Pkesx5IsDu2gR0+qw1udT52kv/th3L7pl6RFnQNse9dJ5MfwRmtFJWenc+dMJuiROQZSzSGkyjeAL6JVbVxuJkQcawhjbsSmZryIURWtQwpvZf3U3uCpsLzv2atKIxPZsMsU2qRow+CBdQGHYGsDPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779060127; c=relaxed/simple;
	bh=7FGe5cPFIFWXib2CeDQYGwYiwdrFJ15umuAkmyP52Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KZ8EmhRQYwac9tS2cG+VPOWlhKXIHDyv3aEKhm8nbIoNsfsyh9l21bAdd6nJ3m+0XntQ2g83wj29syQg4BUL8+i4y/IcFoB4wfESbKo35Pq3O72xgfy1Y7llPE/RGjr/lQVGSMd4sGiEvZ7xLRMsaYVWuTQpm8mklYgcmpAqCuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0Ziw+WI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0Ziw+WI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779060126; x=1810596126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7FGe5cPFIFWXib2CeDQYGwYiwdrFJ15umuAkmyP52Ow=;
  b=m0Ziw+WIqBSRdwiKAPQ06o/W48+PJBQLNnFZFoLkMgyGGhObGgVbLWqX
   GKngHX9Pmtxfiq+kheU1+ZQ2QRkTZgc0+utWy/31VUUSUkugc45btkAZU
   HVDim9WzJWp3ROYAfQZcGEDp9k2pmyywo8psSF4q3ph/PMNCbYlMYDTjb
   3t1SqGrghokNGsdM0yEtS4YqZcVarEarJeLTb0rTco9Upr1ZuMl0pmRZW
   P32wJccDCjERto5k+aGlUtWwZrKNMGIsFfQs6FjDt0maGFjywMtyzwPYR
   okUepi0nzJLZIxHb05+Cbmic6NtL2mSZfSvRB1EXv1dddpf1L/+/MCrn7
   g==;
X-CSE-ConnectionGUID: n9bn4O/LRYuPYoKt19hEPw==
X-CSE-MsgGUID: 7NWm961oSfuS0sCWGyzIaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90612234"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="90612234"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 16:22:02 -0700
X-CSE-ConnectionGUID: 7JXhvldVSEm4Wc/5zrQYZg==
X-CSE-MsgGUID: kIHEYv4zRP6T+pRREtsZKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 May 2026 16:22:01 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOko2-0000000023I-3iPC;
	Sun, 17 May 2026 23:21:58 +0000
Date: Mon, 18 May 2026 07:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 23/52]
 include/linux/dynamic_debug.h:331:1: error: expected identifier or '(' before
 '}' token
Message-ID: <202605180759.sIP1FY5A-lkp@intel.com>
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
config: x86_64-randconfig-071-20260518 (https://download.01.org/0day-ci/archive/20260518/202605180759.sIP1FY5A-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180759.sIP1FY5A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180759.sIP1FY5A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:31,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> include/linux/dynamic_debug.h:331:1: error: expected identifier or '(' before '}' token
     331 | })
         | ^
>> include/linux/dynamic_debug.h:331:2: error: expected identifier or '(' before ')' token
     331 | })
         |  ^
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3800408951
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1375: prepare0] Error 2 shuffle=3800408951
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3800408951
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3800408951
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
