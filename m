Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9F214B838
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 21:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708639166; cv=none; b=u9MjT20zDK4VHRVj7jRA8sqVbLj/Q3q2XWF3oFzXeZg9j7IKtv7O6uj/13rRXcyi7gfUHQ3JmYEa97gvs6THl2Bhn5vieQZHzjvG9tgukxQXv+z025bL0/NuVJV7gKcWZsGOHD2w+ofBnpTReUBmGhfxji/meTqkSMGYDsfExnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708639166; c=relaxed/simple;
	bh=EaSV9sAOr6nPuF5q2mwjVVGeonfsDmEXUW0KnwOpYC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=knHT0db2vzaJpwquraptwDe6vpUB8JnTgEUk8D0IPjE0HsFDXFVAyy/xHdlpGWw//9kEoas09COeyCH59uuKP9XoyV0Sgfa5hUvucvdbPxk3FXcSxZYDwZTKggQFnNgFsTjMrSTjSW0q3PW7jBhBGe9ITwtJAW1wJXpepkj0rdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfZXhhCf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfZXhhCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708639162; x=1740175162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EaSV9sAOr6nPuF5q2mwjVVGeonfsDmEXUW0KnwOpYC4=;
  b=ZfZXhhCf8Rjq8vsFqCDsbfB+j8ylNBizm6Til1GopT+Zrb5C9b9nKkha
   ElsV3JSssAAs14rM4iliOPUmkSRf3Sq7n4P8idrBovQvRkUb1uSKdsFF9
   0vPPUY63tRt5MUAMBFF9whkQQPLcc7TPC+Oonk0r64J7QQz7Sho6CTAwq
   Y5s3zDuwKCiggQmy317zECLvljO/QiTl5n/AYJEs3Z7h/YKUk3w2zF7YB
   0tXN+s9xINFVZMs0pgCz1o/7OJg8t1AEBj5G+xhPpCLep4C8j0yjGnAuR
   TpINpZywcjnpv388q0dW3E66mmIPMv4b/plk56UOtJEBxVEF1wUwZW3NL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13608596"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="13608596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 13:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10238780"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Feb 2024 13:59:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdH5j-0006ke-13;
	Thu, 22 Feb 2024 21:59:02 +0000
Date: Fri, 23 Feb 2024 05:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [linux-next:master 8181/9122] arch/arm/boot/compressed/misc.h:13:36:
 error: macro "fortify_panic" requires 2 arguments, but only 1 given
Message-ID: <202402230537.2s6Nhfsn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e31185ce00a96232308300008db193416ceb9769
commit: 0f4459080884b688c4ec9c2b121f22c641401bc1 [8181/9122] fortify: Split reporting and avoid passing string pointer
config: arm-aspeed_g5_defconfig (https://download.01.org/0day-ci/archive/20240223/202402230537.2s6Nhfsn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230537.2s6Nhfsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230537.2s6Nhfsn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/boot/compressed/fdt_check_mem_start.c:6:
>> arch/arm/boot/compressed/misc.h:13:36: error: macro "fortify_panic" requires 2 arguments, but only 1 given
      13 | void fortify_panic(const char *name);
         |                                    ^
   In file included from include/linux/string.h:360,
                    from include/linux/libfdt_env.h:6,
                    from include/linux/libfdt.h:5,
                    from arch/arm/boot/compressed/fdt_check_mem_start.c:4:
   include/linux/fortify-string.h:18: note: macro "fortify_panic" defined here
      18 | #define fortify_panic(func, write)      \
         | 


vim +/fortify_panic +13 arch/arm/boot/compressed/misc.h

5f8d561fb019a3 Russell King  2018-03-29   5  
5f8d561fb019a3 Russell King  2018-03-29   6  void error(char *x) __noreturn;
5f8d561fb019a3 Russell King  2018-03-29   7  extern unsigned long free_mem_ptr;
5f8d561fb019a3 Russell King  2018-03-29   8  extern unsigned long free_mem_end_ptr;
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02   9  void __div0(void);
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02  10  void
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02  11  decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02  12  		  unsigned long free_mem_ptr_end_p, int arch_id);
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02 @13  void fortify_panic(const char *name);
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02  14  int atags_to_fdt(void *atag_list, void *fdt, int total_space);
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02  15  uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt);
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02  16  int do_decompress(u8 *input, int len, u8 *output, void (*error)(char *x));
9d1f3aa63c65f8 Arnd Bergmann 2023-06-02  17  

:::::: The code at line 13 was first introduced by commit
:::::: 9d1f3aa63c65f8fefe050d91b3f599e8e320eeb0 ARM: 9311/1: decompressor: move function prototypes to misc.h

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
