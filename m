Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B291C1F0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889588; cv=none; b=e8A5H/khUgRz6xMbXgihz080kVl4cR0HuONBpu6yt35Ub3Qsjlehfys8JxCEiKVpkT77ZQebLFDMKyNMigUQBU2MByumZ/GckhyqUdoDS3zxTbwpK4GwDfAYLAuXJb4DxRskEwUw5PNpiyRjcYgLdJu33l2OkW972YzbwmAHLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889588; c=relaxed/simple;
	bh=YqqqAbhjx7n07GatNn8DJVZ6TuBoq0kXLy5R0OMNVXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZauVTxRSfHpZdkj1Mm2wtpnqfKDkKsoeiotgLMC5vk9pBOjsCPasoL61jIyJGdC+OTpPFiwEeC6KVu3Y1EFO7WPeyDExH/96cDwyv4hOLe6tOA0czrYxRlhUtspErhr7bpLu7zCKe4C8dm67mtmMxe3nrUoz/Ka57dALHXVYobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBIcVTKd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBIcVTKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889587; x=1777425587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YqqqAbhjx7n07GatNn8DJVZ6TuBoq0kXLy5R0OMNVXE=;
  b=IBIcVTKd699uOuZOFZ5hzdu35T7mdx30z0FZcShmgK6wTRO0hk62NLJX
   6AaZ+erLjwvTpppG8vz0Ni4jcgFTmxUiEk7Z3qDWDiPFdDJhsRozwghja
   2sFfHeBpJoDRhEtdfNMCS4zvwPiPBjYdqRMT4LMKvTdsLw2cXvz1ND9eU
   c3yjDcUEF2YOSNyazZFIvpjoifODMIlgpC9R+kdlRjkI21xhEXngz49Vc
   tZVXPiKVdocEwq761g27mrq1hQLeuWkkPtywhnrDnqxKB0pCzXQeDV7h/
   rNlg4pY68pDC0wzGv5AxXtjNcBYX7zvyMenEn+F8Aruuc5xiPRBpKlh1Q
   A==;
X-CSE-ConnectionGUID: t+pVTlPTQd2MJ8rMJXb4bA==
X-CSE-MsgGUID: FhTR1ksYQNWoBmRj/EIdmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165292"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165292"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: 28iTd8RsTJyz8/gIaEMXSQ==
X-CSE-MsgGUID: GMQviz0cRj+oqna8xKku+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775828"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zd9-00004j-1H;
	Tue, 29 Apr 2025 01:19:27 +0000
Date: Tue, 29 Apr 2025 06:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] include/linux/string.h:294:30:
 warning: '__builtin_strncpy' output truncated before terminating nul copying
 8 bytes from a string of the same length
Message-ID: <202504290636.O2Uqc8di-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 185c2266c1df80bec001c987d64cae2d9cd13816 [1/1] bpf: Fix truncation handling for mod32 dst reg wrt zero
config: arm64-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290636.O2Uqc8di-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290636.O2Uqc8di-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290636.O2Uqc8di-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/processor.h:28,
                    from include/asm-generic/qrwlock.h:14,
                    from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                    from arch/arm64/include/asm/spinlock.h:8,
                    from include/linux/spinlock.h:89,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from drivers/nvme/target/discovery.c:7:
   In function 'strncpy',
       inlined from 'nvmet_execute_identify_disc_ctrl' at drivers/nvme/target/discovery.c:243:2:
>> include/linux/string.h:294:30: warning: '__builtin_strncpy' output truncated before terminating nul copying 8 bytes from a string of the same length [-Wstringop-truncation]
     294 | #define __underlying_strncpy __builtin_strncpy
         |                              ^
   include/linux/string.h:304:9: note: in expansion of macro '__underlying_strncpy'
     304 |  return __underlying_strncpy(p, q, size);
         |         ^~~~~~~~~~~~~~~~~~~~


vim +/__builtin_strncpy +294 include/linux/string.h

b008ae4cc74d3a Daniel Axtens 2020-06-03  272  
b008ae4cc74d3a Daniel Axtens 2020-06-03  273  #ifdef CONFIG_KASAN
b008ae4cc74d3a Daniel Axtens 2020-06-03  274  extern void *__underlying_memchr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
b008ae4cc74d3a Daniel Axtens 2020-06-03  275  extern int __underlying_memcmp(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
b008ae4cc74d3a Daniel Axtens 2020-06-03  276  extern void *__underlying_memcpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
b008ae4cc74d3a Daniel Axtens 2020-06-03  277  extern void *__underlying_memmove(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
b008ae4cc74d3a Daniel Axtens 2020-06-03  278  extern void *__underlying_memset(void *p, int c, __kernel_size_t size) __RENAME(memset);
b008ae4cc74d3a Daniel Axtens 2020-06-03  279  extern char *__underlying_strcat(char *p, const char *q) __RENAME(strcat);
b008ae4cc74d3a Daniel Axtens 2020-06-03  280  extern char *__underlying_strcpy(char *p, const char *q) __RENAME(strcpy);
b008ae4cc74d3a Daniel Axtens 2020-06-03  281  extern __kernel_size_t __underlying_strlen(const char *p) __RENAME(strlen);
b008ae4cc74d3a Daniel Axtens 2020-06-03  282  extern char *__underlying_strncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
b008ae4cc74d3a Daniel Axtens 2020-06-03  283  extern char *__underlying_strncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
b008ae4cc74d3a Daniel Axtens 2020-06-03  284  #else
b008ae4cc74d3a Daniel Axtens 2020-06-03  285  #define __underlying_memchr	__builtin_memchr
b008ae4cc74d3a Daniel Axtens 2020-06-03  286  #define __underlying_memcmp	__builtin_memcmp
b008ae4cc74d3a Daniel Axtens 2020-06-03  287  #define __underlying_memcpy	__builtin_memcpy
b008ae4cc74d3a Daniel Axtens 2020-06-03  288  #define __underlying_memmove	__builtin_memmove
b008ae4cc74d3a Daniel Axtens 2020-06-03  289  #define __underlying_memset	__builtin_memset
b008ae4cc74d3a Daniel Axtens 2020-06-03  290  #define __underlying_strcat	__builtin_strcat
b008ae4cc74d3a Daniel Axtens 2020-06-03  291  #define __underlying_strcpy	__builtin_strcpy
b008ae4cc74d3a Daniel Axtens 2020-06-03  292  #define __underlying_strlen	__builtin_strlen
b008ae4cc74d3a Daniel Axtens 2020-06-03  293  #define __underlying_strncat	__builtin_strncat
b008ae4cc74d3a Daniel Axtens 2020-06-03 @294  #define __underlying_strncpy	__builtin_strncpy
b008ae4cc74d3a Daniel Axtens 2020-06-03  295  #endif
b008ae4cc74d3a Daniel Axtens 2020-06-03  296  

:::::: The code at line 294 was first introduced by commit
:::::: b008ae4cc74d3ab43074099746f6c32d353e01aa string.h: fix incompatibility between FORTIFY_SOURCE and KASAN

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
