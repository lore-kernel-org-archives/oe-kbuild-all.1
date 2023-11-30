Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BA1548F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 04:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+hMm4KN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701317022; x=1732853022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkskNqWORxEgv0h2RMliEulk0TakhgcTMENEZyM9d/U=;
  b=a+hMm4KNtrKjw92hwTFuezNiJnOzuo+vf42PjWA+WBaZfHMk9RmIQGIv
   KWhZECxGeySF4waY6cH6cvQk4MjYc684MVw982yCHH+xKk48BQJb0g64U
   WQ+i1P6DYJabQRY9ISWjtntw8la3JKeuULoINevZrx2bOQQPHoyOR5cDT
   mUkUlmPjH0uFCpejvuIVzFl0K2rPclaCDCVTtm8i/RPqE1TD/QLyHLGHX
   oavA8cocPOT15+8Rlxt++VzEkkaKlMs0W+r8cHDLCdhoYbBx2p93aziBx
   5nlSwfUtYB8PjfhlvfvnLgALxMS17sbEeGD/6mDe9f3ZjHvqeHX1tQNUZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14819193"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="14819193"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 20:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1016502564"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="1016502564"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2023 20:03:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8YGW-0001Jt-0V;
	Thu, 30 Nov 2023 04:03:04 +0000
Date: Thu, 30 Nov 2023 12:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/loongarch/kernel/signal.c:370:47: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202311301013.Nypucuqz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 616500232e632dba8b03981eeccadacf2fbf1c30 LoongArch: Add vector extensions support
date:   5 months ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci/archive/20231130/202311301013.Nypucuqz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311301013.Nypucuqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301013.Nypucuqz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kernel/signal.c:94:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:94:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:94:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:94:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:114:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:114:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:114:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:114:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:132:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:132:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:132:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:132:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:153:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:153:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:153:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:153:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:173:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:173:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:173:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:173:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:198:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:198:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:198:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:198:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:223:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:223:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:223:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:223:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:232:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:232:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:232:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:232:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:241:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:241:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:241:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:241:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:250:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:250:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:250:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:250:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:259:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:259:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:259:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:259:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:268:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:268:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:268:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:268:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:300:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sctx_info [noderef] __user *info @@     got struct sctx_info *addr @@
   arch/loongarch/kernel/signal.c:300:52: sparse:     expected struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:300:52: sparse:     got struct sctx_info *addr
   arch/loongarch/kernel/signal.c:301:92: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sctx_info *info @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:301:92: sparse:     expected struct sctx_info *info
   arch/loongarch/kernel/signal.c:301:92: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:301:47: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:301:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fpu_context [noderef] __user *fpu_ctx @@     got struct fpu_context * @@
   arch/loongarch/kernel/signal.c:301:47: sparse:     expected struct fpu_context [noderef] __user *fpu_ctx
   arch/loongarch/kernel/signal.c:301:47: sparse:     got struct fpu_context *
   arch/loongarch/kernel/signal.c:302:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:302:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:302:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:302:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:334:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sctx_info [noderef] __user *info @@     got struct sctx_info *addr @@
   arch/loongarch/kernel/signal.c:334:52: sparse:     expected struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:334:52: sparse:     got struct sctx_info *addr
   arch/loongarch/kernel/signal.c:335:92: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sctx_info *info @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:335:92: sparse:     expected struct sctx_info *info
   arch/loongarch/kernel/signal.c:335:92: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:335:47: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:335:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fpu_context [noderef] __user *fpu_ctx @@     got struct fpu_context * @@
   arch/loongarch/kernel/signal.c:335:47: sparse:     expected struct fpu_context [noderef] __user *fpu_ctx
   arch/loongarch/kernel/signal.c:335:47: sparse:     got struct fpu_context *
   arch/loongarch/kernel/signal.c:336:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:336:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:336:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:336:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:369:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sctx_info [noderef] __user *info @@     got struct sctx_info *addr @@
   arch/loongarch/kernel/signal.c:369:52: sparse:     expected struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:369:52: sparse:     got struct sctx_info *addr
   arch/loongarch/kernel/signal.c:370:92: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sctx_info *info @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:370:92: sparse:     expected struct sctx_info *info
   arch/loongarch/kernel/signal.c:370:92: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:370:47: sparse: sparse: cast removes address space '__user' of expression
>> arch/loongarch/kernel/signal.c:370:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct lsx_context [noderef] __user *lsx_ctx @@     got struct lsx_context * @@
   arch/loongarch/kernel/signal.c:370:47: sparse:     expected struct lsx_context [noderef] __user *lsx_ctx
   arch/loongarch/kernel/signal.c:370:47: sparse:     got struct lsx_context *
   arch/loongarch/kernel/signal.c:371:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:371:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:371:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:371:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:406:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sctx_info [noderef] __user *info @@     got struct sctx_info *addr @@
   arch/loongarch/kernel/signal.c:406:52: sparse:     expected struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:406:52: sparse:     got struct sctx_info *addr
   arch/loongarch/kernel/signal.c:407:92: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sctx_info *info @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:407:92: sparse:     expected struct sctx_info *info
   arch/loongarch/kernel/signal.c:407:92: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:407:47: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:407:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct lsx_context [noderef] __user *lsx_ctx @@     got struct lsx_context * @@
   arch/loongarch/kernel/signal.c:407:47: sparse:     expected struct lsx_context [noderef] __user *lsx_ctx
   arch/loongarch/kernel/signal.c:407:47: sparse:     got struct lsx_context *
   arch/loongarch/kernel/signal.c:408:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:408:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:408:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:408:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:444:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sctx_info [noderef] __user *info @@     got struct sctx_info *addr @@
   arch/loongarch/kernel/signal.c:444:53: sparse:     expected struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:444:53: sparse:     got struct sctx_info *addr
   arch/loongarch/kernel/signal.c:446:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sctx_info *info @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:446:64: sparse:     expected struct sctx_info *info
   arch/loongarch/kernel/signal.c:446:64: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:446:18: sparse: sparse: cast removes address space '__user' of expression
>> arch/loongarch/kernel/signal.c:446:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct lasx_context [noderef] __user *lasx_ctx @@     got struct lasx_context * @@
   arch/loongarch/kernel/signal.c:446:18: sparse:     expected struct lasx_context [noderef] __user *lasx_ctx
   arch/loongarch/kernel/signal.c:446:18: sparse:     got struct lasx_context *
   arch/loongarch/kernel/signal.c:447:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:447:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:447:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:447:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:484:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sctx_info [noderef] __user *info @@     got struct sctx_info *addr @@
   arch/loongarch/kernel/signal.c:484:53: sparse:     expected struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:484:53: sparse:     got struct sctx_info *addr
   arch/loongarch/kernel/signal.c:486:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sctx_info *info @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:486:64: sparse:     expected struct sctx_info *info
   arch/loongarch/kernel/signal.c:486:64: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:486:18: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:486:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct lasx_context [noderef] __user *lasx_ctx @@     got struct lasx_context * @@
   arch/loongarch/kernel/signal.c:486:18: sparse:     expected struct lasx_context [noderef] __user *lasx_ctx
   arch/loongarch/kernel/signal.c:486:18: sparse:     got struct lasx_context *
   arch/loongarch/kernel/signal.c:487:36: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:487:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] [usertype] __user *regs @@     got unsigned long long [usertype] * @@
   arch/loongarch/kernel/signal.c:487:36: sparse:     expected unsigned long long [noderef] [usertype] __user *regs
   arch/loongarch/kernel/signal.c:487:36: sparse:     got unsigned long long [usertype] *
   arch/loongarch/kernel/signal.c:543:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sctx_info [noderef] __user *info @@     got struct sctx_info * @@
   arch/loongarch/kernel/signal.c:543:14: sparse:     expected struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:543:14: sparse:     got struct sctx_info *
   arch/loongarch/kernel/signal.c:570:42: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sctx_info *addr @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:570:42: sparse:     expected struct sctx_info *addr
   arch/loongarch/kernel/signal.c:570:42: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:577:42: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sctx_info *addr @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:577:42: sparse:     expected struct sctx_info *addr
   arch/loongarch/kernel/signal.c:577:42: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:584:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sctx_info *addr @@     got struct sctx_info [noderef] __user *info @@
   arch/loongarch/kernel/signal.c:584:43: sparse:     expected struct sctx_info *addr
   arch/loongarch/kernel/signal.c:584:43: sparse:     got struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:591:46: sparse: sparse: cast removes address space '__user' of expression
   arch/loongarch/kernel/signal.c:591:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sctx_info [noderef] __user *info @@     got struct sctx_info * @@
   arch/loongarch/kernel/signal.c:591:22: sparse:     expected struct sctx_info [noderef] __user *info
   arch/loongarch/kernel/signal.c:591:22: sparse:     got struct sctx_info *
   arch/loongarch/kernel/signal.c:737:17: sparse: sparse: symbol 'sys_rt_sigreturn' was not declared. Should it be static?
   arch/loongarch/kernel/signal.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/signal.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/signal.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/signal.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1281:1: sparse: sparse: cast from unknown type

vim +370 arch/loongarch/kernel/signal.c

   365	
   366	static int protected_save_lsx_context(struct extctx_layout *extctx)
   367	{
   368		int err = 0;
   369		struct sctx_info __user *info = extctx->lsx.addr;
 > 370		struct lsx_context __user *lsx_ctx = (struct lsx_context *)get_ctx_through_ctxinfo(info);
   371		uint64_t __user *regs	= (uint64_t *)&lsx_ctx->regs;
   372		uint64_t __user *fcc	= &lsx_ctx->fcc;
   373		uint32_t __user *fcsr	= &lsx_ctx->fcsr;
   374	
   375		while (1) {
   376			lock_fpu_owner();
   377			if (is_lsx_enabled())
   378				err = save_hw_lsx_context(lsx_ctx);
   379			else {
   380				if (is_fpu_owner())
   381					save_fp(current);
   382				err = copy_lsx_to_sigcontext(lsx_ctx);
   383			}
   384			unlock_fpu_owner();
   385	
   386			err |= __put_user(LSX_CTX_MAGIC, &info->magic);
   387			err |= __put_user(extctx->lsx.size, &info->size);
   388	
   389			if (likely(!err))
   390				break;
   391			/* Touch the LSX context and try again */
   392			err = __put_user(0, &regs[0]) |
   393				__put_user(0, &regs[32*2-1]) |
   394				__put_user(0, fcc) |
   395				__put_user(0, fcsr);
   396			if (err)
   397				return err;	/* really bad sigcontext */
   398		}
   399	
   400		return err;
   401	}
   402	
   403	static int protected_restore_lsx_context(struct extctx_layout *extctx)
   404	{
   405		int err = 0, sig = 0, tmp __maybe_unused;
   406		struct sctx_info __user *info = extctx->lsx.addr;
   407		struct lsx_context __user *lsx_ctx = (struct lsx_context *)get_ctx_through_ctxinfo(info);
   408		uint64_t __user *regs	= (uint64_t *)&lsx_ctx->regs;
   409		uint64_t __user *fcc	= &lsx_ctx->fcc;
   410		uint32_t __user *fcsr	= &lsx_ctx->fcsr;
   411	
   412		err = sig = fcsr_pending(fcsr);
   413		if (err < 0)
   414			return err;
   415	
   416		while (1) {
   417			lock_fpu_owner();
   418			if (is_lsx_enabled())
   419				err = restore_hw_lsx_context(lsx_ctx);
   420			else {
   421				err = copy_lsx_from_sigcontext(lsx_ctx);
   422				if (is_fpu_owner())
   423					restore_fp(current);
   424			}
   425			unlock_fpu_owner();
   426	
   427			if (likely(!err))
   428				break;
   429			/* Touch the LSX context and try again */
   430			err = __get_user(tmp, &regs[0]) |
   431				__get_user(tmp, &regs[32*2-1]) |
   432				__get_user(tmp, fcc) |
   433				__get_user(tmp, fcsr);
   434			if (err)
   435				break;	/* really bad sigcontext */
   436		}
   437	
   438		return err ?: sig;
   439	}
   440	
   441	static int protected_save_lasx_context(struct extctx_layout *extctx)
   442	{
   443		int err = 0;
   444		struct sctx_info __user *info = extctx->lasx.addr;
   445		struct lasx_context __user *lasx_ctx =
 > 446			(struct lasx_context *)get_ctx_through_ctxinfo(info);
   447		uint64_t __user *regs	= (uint64_t *)&lasx_ctx->regs;
   448		uint64_t __user *fcc	= &lasx_ctx->fcc;
   449		uint32_t __user *fcsr	= &lasx_ctx->fcsr;
   450	
   451		while (1) {
   452			lock_fpu_owner();
   453			if (is_lasx_enabled())
   454				err = save_hw_lasx_context(lasx_ctx);
   455			else {
   456				if (is_lsx_enabled())
   457					save_lsx(current);
   458				else if (is_fpu_owner())
   459					save_fp(current);
   460				err = copy_lasx_to_sigcontext(lasx_ctx);
   461			}
   462			unlock_fpu_owner();
   463	
   464			err |= __put_user(LASX_CTX_MAGIC, &info->magic);
   465			err |= __put_user(extctx->lasx.size, &info->size);
   466	
   467			if (likely(!err))
   468				break;
   469			/* Touch the LASX context and try again */
   470			err = __put_user(0, &regs[0]) |
   471				__put_user(0, &regs[32*4-1]) |
   472				__put_user(0, fcc) |
   473				__put_user(0, fcsr);
   474			if (err)
   475				return err;	/* really bad sigcontext */
   476		}
   477	
   478		return err;
   479	}
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
