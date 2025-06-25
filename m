Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F727A90E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840574; cv=none; b=M0r2mN7l9fbbXkzDZtwu8JbiRS4oI9Pou0BdetBiQTzFUkCN6b5wYpKf0fHfJACsXvC5G0QJWdKRQJseLhdSntNRAjc/F8eqLjr+W85MTbiG7+JE0xpJ/BbkB4xLDz/YWU6l1XWShtTq9vPRUKxmM6Nd705MMkI/pIOq5QbgB7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840574; c=relaxed/simple;
	bh=8NGkj4fETg6w/L614bzv+cY7DJGy7v0lFObjvUbfuqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIeeQUSpkpxYNapOypcaqBQGLk6xjFh4hhe29fCtNvsx6fzjTr9Nn01k/azIuCZakG+QzjjciVT7KR1DydNEmJC/220mbCdRt999VGAoV5G5Kc7IGPvMn84SDYJE8TE8PNbUWKv24Ek/KPqyJciDcpFLK57V9hwv+qo/+YKi8V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjzUVAkg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjzUVAkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750840573; x=1782376573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NGkj4fETg6w/L614bzv+cY7DJGy7v0lFObjvUbfuqE=;
  b=PjzUVAkgUvU9zuswWjdAcdyu0xLyrUU8E6Rcd9zEo4OcGNMtQ8VMoOTW
   I4JLFw52/SQaXo8RgDC/kODCYzhjCPEUQONh6ytESCr3o0rxkTSHsx/hD
   6c5t+KVSF2OiPwpyyc5Bpd2j211wOwUgLC2O4fuEk8eH+bEICkxFXDMEi
   NUn7gJ29SrE8GKkwoBCFuexm0s/oSSO3Jw1G8W6lCMPGSkH4HTiru7pbV
   iuKnyc1ey0TblJ82fRj/pEyZmMlHApdwaX9eTekSlnrYMt2Js1Rq4F6OP
   Yk4StHfdg++giQbBcQReD7VvfUamVjtwdba+DbYEr9PEE7ruwdFCeByuY
   A==;
X-CSE-ConnectionGUID: sroNCQ3QSTCJ+PiYvg+TEw==
X-CSE-MsgGUID: nHHWZ7HCSYuWfZfa0Aa//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63701079"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="63701079"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:36:12 -0700
X-CSE-ConnectionGUID: wHkUUndVSqWFs7Ugpy0oPQ==
X-CSE-MsgGUID: EtTTe861SZKrCV99mLTeDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="175803540"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jun 2025 01:36:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uULc1-000Stw-2r;
	Wed, 25 Jun 2025 08:36:09 +0000
Date: Wed, 25 Jun 2025 16:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 43/63] kernel/bounds.c:35:40: error: invalid
 application of 'sizeof' to incomplete type 'struct jump_entry'
Message-ID: <202506251600.VKaltOhm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   adb4071ac1d133861613cf55ff4f4d4858313258
commit: aacce3fee88ef9617ea4938a4f53b46974be7202 [43/63] x86/jump_label: Define ELF section entry size for jump labels
config: i386-buildonly-randconfig-002-20250625 (https://download.01.org/0day-ci/archive/20250625/202506251600.VKaltOhm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251600.VKaltOhm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251600.VKaltOhm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   kernel/bounds.c: In function 'main':
>> kernel/bounds.c:35:40: error: invalid application of 'sizeof' to incomplete type 'struct jump_entry'
      35 |         DEFINE(JUMP_ENTRY_SIZE, sizeof(struct jump_entry));
         |                                        ^~~~~~
   include/linux/kbuild.h:6:69: note: in definition of macro 'DEFINE'
       6 |         asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
         |                                                                     ^~~
   make[3]: *** [scripts/Makefile.build:182: kernel/bounds.s] Error 1 shuffle=2115482694
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=2115482694
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2115482694
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2115482694
   make: Target 'prepare' not remade because of errors.


vim +35 kernel/bounds.c

    17	
    18	int main(void)
    19	{
    20		/* The enum constants to put into include/generated/bounds.h */
    21		DEFINE(NR_PAGEFLAGS, __NR_PAGEFLAGS);
    22		DEFINE(MAX_NR_ZONES, __MAX_NR_ZONES);
    23	#ifdef CONFIG_SMP
    24		DEFINE(NR_CPUS_BITS, order_base_2(CONFIG_NR_CPUS));
    25	#endif
    26		DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
    27	#ifdef CONFIG_LRU_GEN
    28		DEFINE(LRU_GEN_WIDTH, order_base_2(MAX_NR_GENS + 1));
    29		DEFINE(__LRU_REFS_WIDTH, MAX_NR_TIERS - 2);
    30	#else
    31		DEFINE(LRU_GEN_WIDTH, 0);
    32		DEFINE(__LRU_REFS_WIDTH, 0);
    33	#endif
    34	#if defined(CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE)
  > 35		DEFINE(JUMP_ENTRY_SIZE, sizeof(struct jump_entry));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
