Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3496D29D05
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741501006; cv=none; b=Fy4vRCYoQaK70WAZHHPeE6hFu+8I38q38FYcZ3X0t6qRRzq/w7xS2HSBIPOEUXay9qEqgVmvMCvsXsI3EA2/wG3BF9/4vmlwg7NOlc5CpXqZUHgtzZSihGD7ShOiZeNifT2DYA6qEeLPy6++YP0bPkan5mMUNbbKBuM57A7ZkAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741501006; c=relaxed/simple;
	bh=Z06bLqyBusubnGUbz61LStZFaKxoCbBcVmj6E8SXJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohwIrSJoi8nq1+vWchoTzXpzAyY+91JGo1FXjkneqiSJv2FJ6uMotL43lVTVyUx0MM4XnU/HBW0HtVWfXe9KyRtM87WSALcGlqHHR+frMf/qaK78tGrwZ+BSWEqR1Ac1tyG4R8xNUS3q04wWPIFuDGbAW4GBI1JeyqGoTYDUoG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxBjuHlT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxBjuHlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741501005; x=1773037005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z06bLqyBusubnGUbz61LStZFaKxoCbBcVmj6E8SXJlw=;
  b=WxBjuHlTaJPWzzt3WqRuXZ2CTHKhgBNcidOqLfnMvGsr1v2fE6J/3Aee
   4FxFtg0hJnAWuQ4eSPY3hkuLEIB7M/OvGvSYPQCnR/bNDRVL0QBLiBa8M
   ILDLffDaT9WxwuFYspZFC7cQknfGOnqC6QzwFBuCQXAKbTYBRgENhF4wE
   +oR6qq3ABnw51mlv5qQzrxCfD4UR1U6PuSXa8Scfc5a67EQlYGHrn1y0I
   FnHfBth04aeHP2G1zGqERPDKCUJYkBVyGlI+KBMpa8PuG/sLvpqcq21L4
   yDQV+GrtDpcKBzC7+d9Gc7QSSWU0BoBE8vZUS7HaBHGylprShIUKsCgkg
   A==;
X-CSE-ConnectionGUID: 0wLQQuqATbWOMBq+Znz9eA==
X-CSE-MsgGUID: Xt91skNRSHGc667/Zko0rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="53896911"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="53896911"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 22:16:45 -0800
X-CSE-ConnectionGUID: 5F63RMVSSm2tIl4UazpdFw==
X-CSE-MsgGUID: 3OGXbbVDQrKj2dG604wgow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120217386"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 08 Mar 2025 22:16:43 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr9xp-0002lS-05;
	Sun, 09 Mar 2025 06:16:41 +0000
Date: Sun, 9 Mar 2025 14:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call 17/42] arch/x86/include/asm/uaccess_64.h:32:30:
 error: expected string literal before '[' token
Message-ID: <202503091435.Fak9XIqU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call
head:   3688c8209c27cd871041b38371e3c44e219ed75a
commit: 19d56ee54e6bc8d03fde9512e33b800f8f728d2d [17/42] x86/uaccess: Use alternative_io() in __untagged_addr()
config: x86_64-buildonly-randconfig-001-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091435.Fak9XIqU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091435.Fak9XIqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091435.Fak9XIqU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/uaccess_64.h: In function '__untagged_addr':
>> arch/x86/include/asm/uaccess_64.h:32:30: error: expected string literal before '[' token
      32 |                        ARG(: [mask] "m" (__my_cpu_var(tlbstate_untag_mask))));
         |                              ^
   arch/x86/include/asm/alternative.h:221:31: note: in definition of macro 'alternative_io'
     221 |                             : input                                                     \
         |                               ^~~~~
   arch/x86/include/asm/uaccess_64.h:32:24: note: in expansion of macro 'ARG'
      32 |                        ARG(: [mask] "m" (__my_cpu_var(tlbstate_untag_mask))));
         |                        ^~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1053103
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1267: prepare0] Error 2 shuffle=1053103
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1053103
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1053103
   make: Target 'prepare' not remade because of errors.


vim +32 arch/x86/include/asm/uaccess_64.h

    22	
    23	#ifdef CONFIG_ADDRESS_MASKING
    24	/*
    25	 * Mask out tag bits from the address.
    26	 */
    27	static inline unsigned long __untagged_addr(unsigned long addr)
    28	{
    29		alternative_io("",
    30			       "and " __percpu_arg([mask]) ", %[addr]", X86_FEATURE_LAM,
    31			       ARG([addr] "+r" (addr)),
  > 32			       ARG(: [mask] "m" (__my_cpu_var(tlbstate_untag_mask))));
    33	
    34		return addr;
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
