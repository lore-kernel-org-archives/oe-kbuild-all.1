Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE61262BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 01:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751074989; cv=none; b=Xmp8Mn76dMVqrUvdqsjYNEcYtkUPQSqYunN430S2imFuviMG1sJYfAGwKe8/CUMLiHLKJStoTWRaJ9/WioPk+aHyPRASOOKPTF415h6kRYWbPIdk0t8fKqabRNtlcEhmnpP/tfdnC49ePhvAMHd2Wyh0tLDzMN4I51WhGbrIYXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751074989; c=relaxed/simple;
	bh=uzocL+yCVKKLeFmUpmQKfORKPa3FRMiZsffEHkZ56F8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gmPfbalqJu2wEuCi6XRIkLkSfK+5BZVpMO6alr9SPqhsbALaL5dzruoVcNfudDstqTBFSRvN9rqhDdjUPmX4ZBtZmP4YXdZWjIsfznGpLocMnxTIqbepaqSulytTu5U308ZXbSWXj9iG3Glj5r6DGJfwF6a/hS/IOMxwfoJSiYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B131B75+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B131B75+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751074987; x=1782610987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzocL+yCVKKLeFmUpmQKfORKPa3FRMiZsffEHkZ56F8=;
  b=B131B75+/50BRbiuxpZP4EsT6zXx7yg2Wdz7MmW6fjg0ABeatmFSQxrn
   e5P0c332oYUpYgi0/PJCYi9fVKAZMMjTD1wosPt8YIr2eI4FJxDHDmfsZ
   UNY/4K9RbsUJHX3kY6iTzGxnC4Ctdah+lMnovcbpnuo6NJPOm9Eo9Fhhi
   kRgAmm7A+C5qBsrkW2FfTYzcUaQN5kTSkikOg+1hJXYnsrb8+aQKJQtkD
   Vd25iPgVPORa6d3rMH2E8I7YZcz9C/Hukj7oGpVu3ITF1EfcXx5IPhdPl
   h2dI5dQ0/t5MyMJdgTY2zRY3isLohyb0MaJidqBgJJB3l34aDqbT8+isx
   w==;
X-CSE-ConnectionGUID: ygdUR1+PQamJNU2nFMJitA==
X-CSE-MsgGUID: MlL9mzSxQqCRChTEjPWKxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="56012544"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="56012544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 18:43:06 -0700
X-CSE-ConnectionGUID: mzRbPZlDSLOsSU5i+R6fmw==
X-CSE-MsgGUID: cWTseGkVRFC+nQ2E7k8VXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="176631280"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2025 18:43:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVKas-000Weo-2D;
	Sat, 28 Jun 2025 01:43:02 +0000
Date: Sat, 28 Jun 2025 09:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1671/1671]
 include/linux/uaccess.h:112:17: warning: 'spallocinfo' may be used
 uninitialized
Message-ID: <202506280935.rzzgWDzt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   727e25c8c510aebd6e08b0dc39e00cb8ec0dc1e6
commit: 9469d1759c2905dcef49df7e6240ad5c32b66296 [1671/1671] ascend: share_pool: enable svm to use share pool memory
config: arm64-randconfig-003-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280935.rzzgWDzt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280935.rzzgWDzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280935.rzzgWDzt-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   drivers/char/svm.c:249:21: warning: no previous prototype for 'svm_find_mem_reg_node' [-Wmissing-prototypes]
     249 | struct device_node *svm_find_mem_reg_node(struct device *dev, const char *compat)
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:419:6: warning: no previous prototype for 'sysrq_sched_debug_show_export' [-Wmissing-prototypes]
     419 | void sysrq_sched_debug_show_export(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:1429:5: warning: no previous prototype for 'svm_get_pasid' [-Wmissing-prototypes]
    1429 | int svm_get_pasid(pid_t vpid, int dev_id __maybe_unused)
         |     ^~~~~~~~~~~~~
   drivers/char/svm.c:1502:5: warning: no previous prototype for '__svm_get_mpam' [-Wmissing-prototypes]
    1502 | int __svm_get_mpam(struct svm_mpam *mpam)
         |     ^~~~~~~~~~~~~~
   drivers/char/svm.c:2437:36: warning: 'svm_acpi_match' defined but not used [-Wunused-const-variable=]
    2437 | static const struct acpi_device_id svm_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~
   In file included from drivers/char/svm.c:29:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'svm_sp_alloc_mem' at drivers/char/svm.c:2144:8:
>> include/linux/uaccess.h:112:17: warning: 'spallocinfo' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from arch/arm64/include/asm/memory.h:24,
                    from arch/arm64/include/asm/esr.h:21,
                    from drivers/char/svm.c:10:
   include/linux/kasan-checks.h: In function 'svm_sp_alloc_mem':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/char/svm.c:2135:24: note: 'spallocinfo' declared here
    2135 |         struct spalloc spallocinfo;
         |                        ^~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/arm64/include/asm/bug.h:37,
                    from arch/arm64/include/asm/memory.h:27:
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1967:12:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1958:25: note: object 'l2buf_load_flag' of size 4
    1958 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1967:12:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1958:25: note: object 'l2buf_load_flag' of size 4
    1958 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'svm_get_phy_memory_info' at drivers/char/svm.c:1805:6:
   include/linux/uaccess.h:112:17: warning: 'para' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'svm_get_phy_memory_info':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/char/svm.c:1800:33: note: 'para' declared here
    1800 |         struct phymeminfo_ioctl para;
         |                                 ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'svm_remap_proc' at drivers/char/svm.c:1863:8:
   include/linux/uaccess.h:112:17: warning: 'pmem' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'svm_remap_proc':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/char/svm.c:1849:29: note: 'pmem' declared here
    1849 |         struct svm_proc_mem pmem;
         |                             ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'svm_ioctl' at drivers/char/svm.c:2217:9:
   include/linux/uaccess.h:112:17: warning: 'params' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'svm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/char/svm.c:2209:33: note: 'params' declared here
    2209 |         struct svm_bind_process params;
         |                                 ^~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'svm_sp_free_mem' at drivers/char/svm.c:2179:8,
       inlined from 'svm_ioctl' at drivers/char/svm.c:2280:9:
>> include/linux/uaccess.h:112:17: warning: 'spallocinfo' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'svm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/char/svm.c:2172:24: note: 'spallocinfo' declared here
    2172 |         struct spalloc spallocinfo;
         |                        ^~~~~~~~~~~


vim +/spallocinfo +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4 Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774 Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  114  	}
d597580d373774 Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774 Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro        2017-03-20  117  	return res;
d597580d373774 Al Viro        2017-03-20  118  }
d597580d373774 Al Viro        2017-03-20  119  #else
d597580d373774 Al Viro        2017-03-20  120  extern unsigned long
d597580d373774 Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro        2017-03-20  122  #endif
d597580d373774 Al Viro        2017-03-20  123  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
