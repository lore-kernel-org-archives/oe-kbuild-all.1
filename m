Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519133C4B6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363917; cv=none; b=Jok0N7xstH/DvVkART8G7V5QL9BBw1hwIr/xwOB2Pw74naFJdqyh6fjDxfdug4SB78SS5mAl9WB+Aa+MfHGYliF29pRC3jyJoCKnrtNZ4ZL3UQzVJi/C6iDANS76hkV2Tye1pLy5WOt/9bmIIoFeRA2CpXHok+9ZWNM0ZDb1iS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363917; c=relaxed/simple;
	bh=tQDVvXECMmhSW3vj/Semm8EGwlQAgq4UpgSB25EWeAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n472Epdge10ymgmK6rOXXd2xZEQIyGb2/1e4e1G4Gu8dN9cl0WVvZtlrji8be+V8Del+g4DsgzoAVMtBApukXCw2fcT7esAKzpMaBQrFGeYEOQv/j+twcUK2OEu50pgrveQddyLaWn7Xz+4wwJ9bTgGakxZDXfc9JclQLgiTiyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmniJ8QJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmniJ8QJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779363916; x=1810899916;
  h=date:from:to:cc:subject:message-id;
  bh=tQDVvXECMmhSW3vj/Semm8EGwlQAgq4UpgSB25EWeAQ=;
  b=XmniJ8QJikENOVZHDa6G9cH2degqvrMNrnpLcQruNZGShdo4zst6/R3d
   dEdKqcBqXr0uhEsWvVG2vinxmIrsIrLcrBihGuyskj2wcA1OwcvHSKh9+
   I1OpCpXxU/7sFcavD38Kn1EkDVgAgXxIyJweW5D9FxZym5iC//nSVnGYo
   uolSdkCA/h18ATte9+Ye0TjCHF8YqmmCeJJGBX/RSxwxTxsmc2tvyhsDp
   HWdEqPz0Y++RBAFoiBvyCY/d/+BVxgU3udzAADn5u/X+2q6ew5D9v/XoW
   Ovqhf0wSRK0jihmA6M78buH6AZDADhj1tvUPal/hYMFd+r4oNTg9wNgGW
   w==;
X-CSE-ConnectionGUID: YKoh1nusRZerf0HvgtQ1zA==
X-CSE-MsgGUID: 4GGyfK0JSE2Uyy3eNR+IOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90576728"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90576728"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:45:15 -0700
X-CSE-ConnectionGUID: uejRocZWSSuR0q7EvEi1ww==
X-CSE-MsgGUID: 5LqWnIRHSHCxXIDboVycNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236252975"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 04:45:13 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ1pu-000000000Dh-43uz;
	Thu, 21 May 2026 11:45:10 +0000
Date: Thu, 21 May 2026 19:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 689/1130]
 include/linux/cheri.h:221: Error: no such instruction: `static
 __always_inline ptraddr_t'
Message-ID: <202605211953.k2DR7CXA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 8a6d5ebe41648aa52f1aa5f48ad252b063e88897 [689/1130] cheri: Make the percpu allocator work with CHERI
config: um-randconfig-001-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211953.k2DR7CXA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211953.k2DR7CXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211953.k2DR7CXA-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/cheri.h: Assembler messages:
>> include/linux/cheri.h:221: Error: no such instruction: `static __always_inline ptraddr_t'
>> include/linux/cheri.h:222: Error: invalid character '(' in mnemonic
   include/linux/cheri.h:223: Error: junk at end of line, first unrecognized character is `{'
>> include/linux/cheri.h:224: Error: no such instruction: `return (ptraddr_t __force)(uintptr_t)ptr'
   include/linux/cheri.h:225: Error: junk at end of line, first unrecognized character is `}'
   include/linux/cheri.h:227: Error: no such instruction: `static __always_inline ptraddr_t'
   include/linux/cheri.h:228: Error: invalid character '(' in mnemonic
   include/linux/cheri.h:229: Error: junk at end of line, first unrecognized character is `{'
>> include/linux/cheri.h:233: Error: no such instruction: `return (ptraddr_t __force)ptr'
   include/linux/cheri.h:235: Error: junk at end of line, first unrecognized character is `}'
>> include/linux/cheri.h:245: Error: no such instruction: `static __always_inline __u64'
   include/linux/cheri.h:246: Error: invalid character '(' in mnemonic
   include/linux/cheri.h:247: Error: junk at end of line, first unrecognized character is `{'
>> include/linux/cheri.h:248: Error: no such instruction: `return (unsigned long long __force)ptr'
   include/linux/cheri.h:249: Error: junk at end of line, first unrecognized character is `}'
>> include/linux/cheri.h:264: Error: no such instruction: `static __always_inline void *'
   include/linux/cheri.h:265: Error: invalid character '(' in mnemonic
   include/linux/cheri.h:266: Error: junk at end of line, first unrecognized character is `{'
>> include/linux/cheri.h:267: Error: no such instruction: `return (void *)(uintptr_t __force)val'
   include/linux/cheri.h:268: Error: junk at end of line, first unrecognized character is `}'
>> include/linux/cheri.h:275: Error: no such instruction: `static __always_inline __u64ptr'
   include/linux/cheri.h:276: Error: invalid character '(' in mnemonic
   include/linux/cheri.h:277: Error: junk at end of line, first unrecognized character is `{'
>> include/linux/cheri.h:278: Error: no such instruction: `return (__u64ptr __force)val'
   include/linux/cheri.h:279: Error: junk at end of line, first unrecognized character is `}'
   include/linux/cheri.h:358: Error: no such instruction: `static __always_inline void *'
   include/linux/cheri.h:359: Error: invalid character '(' in mnemonic
   include/linux/cheri.h:360: Error: junk at end of line, first unrecognized character is `{'
>> include/linux/cheri.h:361: Error: no such instruction: `return (void *)addr'
   include/linux/cheri.h:362: Error: junk at end of line, first unrecognized character is `}'
   include/linux/cheri.h:364: Error: no such instruction: `static __always_inline void *'
>> include/linux/cheri.h:365: Error: no such instruction: `cheri_make_kernel_data_cap(ptraddr_t addr,size_t len)'
   include/linux/cheri.h:366: Error: junk at end of line, first unrecognized character is `{'
   include/linux/cheri.h:367: Error: junk at end of line, first unrecognized character is `('
   include/linux/cheri.h:369: Error: no such instruction: `return (void *)addr'
   include/linux/cheri.h:370: Error: junk at end of line, first unrecognized character is `}'
   include/linux/cheri.h:372: Error: no such instruction: `static __always_inline void *'
>> include/linux/cheri.h:373: Error: no such instruction: `cheri_make_kernel_code_cap(ptraddr_t addr)'
   include/linux/cheri.h:374: Error: junk at end of line, first unrecognized character is `{'
   include/linux/cheri.h:375: Error: no such instruction: `return (void *)addr'
   include/linux/cheri.h:376: Error: junk at end of line, first unrecognized character is `}'
   include/linux/cheri.h:378: Error: no such instruction: `static __always_inline void *'
>> include/linux/cheri.h:379: Error: no such instruction: `cheri_build_kernel_data_cap(ptraddr_t base,ptraddr_t addr,size_t len)'
   include/linux/cheri.h:380: Error: junk at end of line, first unrecognized character is `{'
   include/linux/cheri.h:381: Error: no such instruction: `return (void *)addr'
   include/linux/cheri.h:382: Error: junk at end of line, first unrecognized character is `}'


vim +221 include/linux/cheri.h

643e8d80704d80 Christian Ehrhardt 2025-06-11  194  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  195  /*
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  196   * Macros to correctly cast between unsigned long (aka ptraddr_t), void *
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  197   * the kernel notion of uintptr_t. These macros are for in kernel
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  198   * conversions between pointers and plain addresses and are relevant
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  199   * if CONFIG_CHERI_KERNEL is set. Conversion for user pointers has
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  200   * a different set of macros.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  201   */
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  202  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  203  /*
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  204   * Downgrade a pointer to its address.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  205   * Use this if you intentionally want to remove the pointer property
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  206   * from a pointer and reduce it to its address. The result cannot be
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  207   * turned back into a pointer with CHERI.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  208   *
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  209   * A valid example use would be an alignment check on a pointer's address:
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  210   *	static inline unsigned long offset_in_page(const void *ptr)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  211   *	{
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  212   *		return __c_pa(ptr) % PAGE_SIZE;
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  213   *	}
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  214   *
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  215   * Other potential uses could be:
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  216   * - Decode additional information stored in the low bits of the pointer's
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  217   *   address (e.g. maple_tree, rb_tree).
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  218   * - Pass the address to printk.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  219   * - Most of the VMA functions operate on addresses and not pointers, too.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  220   */
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @221  static __always_inline ptraddr_t
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @222  __c_pa(const volatile void *ptr)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  223  {
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @224  	return (ptraddr_t __force)(uintptr_t)ptr;
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  225  }
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  226  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  227  static __always_inline ptraddr_t
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  228  __c_pa_u(const volatile void __user *ptr)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  229  {
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  230  #ifdef __CHERI__
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  231  	return (ptraddr_t __force)(__kernel_uintptr_t)ptr;
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  232  #else
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @233  	return (ptraddr_t __force)ptr;
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  234  #endif
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  235  }
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  236  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  237  /*
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  238   * Downgrade a uintptr_t or similar to its address.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  239   *
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  240   * This function is similar to __c_pa but takes a __u64ptr (or more
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  241   * commonly a promoted uintptr_t/user_uintptr_t and returns the
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  242   * address part. The explicit use of __u64ptr and __u64 ensures
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  243   * that a __u64ptr on 32-bit does not lose the higher bits.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  244   */
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @245  static __always_inline __u64
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  246  __c_ua(__u64ptr ptr)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  247  {
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @248  	return (unsigned long long __force)ptr;
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  249  }
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  250  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  251  /*
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  252   * Generate a pointer from an unsigned long value. The resulting pointer
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  253   * cannot be dereferenced!
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  254   *
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  255   * Valid user of this macro must be able to proof that the generated
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  256   * pointer will not be dereferenced.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  257   *
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  258   * Examples of a valid use are:
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  259   * - An integer value is stored directly in a ->private field of some data
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  260   *   structure and users of the ->private data field will cast it back to
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  261   *   the original non-pointer type.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  262   * - Additionally, the ERR_PTR related macros use this.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  263   */
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @264  static __always_inline void *
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  265  __c_fakep(ptraddr_t val)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  266  {
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @267  	return (void *)(uintptr_t __force)val;
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  268  }
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  269  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  270  /*
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  271   * Like __c_fakep but creates a __u64ptr instead of a void * pointer.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  272   * Similar to __c_ua() the input and output values are at least 64-bit
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  273   * even on 32-bit systems.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  274   */
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @275  static __always_inline __u64ptr
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  276  __c_fakeu(__u64 val)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  277  {
6a3f8e724666b1 Christian Ehrhardt 2024-09-16 @278  	return (__u64ptr __force)val;
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  279  }
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  280  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  281  /*
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  282   * Fix the bounds of a pointer by taking them from another pointer.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  283   * This is useful in some special cases, e.g. after reallocation when
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  284   * we know that the address of a pointer should be within the bounds
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  285   * of another pointer but due to address calculations the tag and bounds
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  286   * on the pointer may have been lost.
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  287   */
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  288  #define cheri_fixup_bounds(__AUTH, __TOFIX) do {	\
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  289  	void * __tofix = (__TOFIX);			\
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  290  	void * __auth = (__AUTH);			\
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  291  	(__TOFIX) = __auth + (__tofix - __auth);	\
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  292  } while (0)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  293  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  294  #ifdef CONFIG_CHERI_KERNEL
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  295  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  296  #define __cheri_pointer_align __attribute__((aligned(__SIZEOF_POINTER__)))
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  297  #define __packed_if_not_cheri
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  298  #define cheri_bounds_set_kernel(__c, __l) cheri_bounds_set(__c, __l)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  299  
480a2304d02375 Christian Ehrhardt 2025-07-07  300  /* Kernel root capabilities. Use with care. */
480a2304d02375 Christian Ehrhardt 2025-07-07  301  extern void * kernel_data_cap;
480a2304d02375 Christian Ehrhardt 2025-07-07  302  extern void * kernel_code_cap;
480a2304d02375 Christian Ehrhardt 2025-07-07  303  extern void * kernel_ro_cap;
480a2304d02375 Christian Ehrhardt 2025-07-07  304  
480a2304d02375 Christian Ehrhardt 2025-07-07  305  /*
480a2304d02375 Christian Ehrhardt 2025-07-07  306   * Create a read-only data capability for a kernel address.
480a2304d02375 Christian Ehrhardt 2025-07-07  307   * @addr The address.
480a2304d02375 Christian Ehrhardt 2025-07-07  308   * @return A pointer with bounds that allow access to the
480a2304d02375 Christian Ehrhardt 2025-07-07  309   *     entire kernel range.
480a2304d02375 Christian Ehrhardt 2025-07-07  310   *
480a2304d02375 Christian Ehrhardt 2025-07-07  311   * NOTE: A need to use this function means that the CHERI adoption
480a2304d02375 Christian Ehrhardt 2025-07-07  312   *       is incomplete. The caller should at least be able to provide
480a2304d02375 Christian Ehrhardt 2025-07-07  313   *       bounds and thus use cheri_make_kernel_data_cap or
480a2304d02375 Christian Ehrhardt 2025-07-07  314   *       cheri_make_kernel_code_cap instead.
480a2304d02375 Christian Ehrhardt 2025-07-07  315   */
480a2304d02375 Christian Ehrhardt 2025-07-07  316  static __always_inline void *
480a2304d02375 Christian Ehrhardt 2025-07-07  317  cheri_kcap_ro(ptraddr_t addr)
480a2304d02375 Christian Ehrhardt 2025-07-07  318  {
480a2304d02375 Christian Ehrhardt 2025-07-07  319  	return cheri_address_set(kernel_ro_cap, addr);
480a2304d02375 Christian Ehrhardt 2025-07-07  320  }
480a2304d02375 Christian Ehrhardt 2025-07-07  321  
480a2304d02375 Christian Ehrhardt 2025-07-07  322  /*
480a2304d02375 Christian Ehrhardt 2025-07-07  323   * Create a capability to access kernel data. The capability is
480a2304d02375 Christian Ehrhardt 2025-07-07  324   * derived from kernel_data_cap and thus will allow read and write
480a2304d02375 Christian Ehrhardt 2025-07-07  325   * accesses.
480a2304d02375 Christian Ehrhardt 2025-07-07  326   */
480a2304d02375 Christian Ehrhardt 2025-07-07  327  static __always_inline void *
480a2304d02375 Christian Ehrhardt 2025-07-07  328  cheri_make_kernel_data_cap(ptraddr_t addr, size_t len)
480a2304d02375 Christian Ehrhardt 2025-07-07  329  {
480a2304d02375 Christian Ehrhardt 2025-07-07  330  	void * ret = cheri_address_set(kernel_data_cap, addr);
480a2304d02375 Christian Ehrhardt 2025-07-07  331  
480a2304d02375 Christian Ehrhardt 2025-07-07  332  	return cheri_bounds_set(ret, len);
480a2304d02375 Christian Ehrhardt 2025-07-07  333  }
480a2304d02375 Christian Ehrhardt 2025-07-07  334  
480a2304d02375 Christian Ehrhardt 2025-07-07  335  /*
480a2304d02375 Christian Ehrhardt 2025-07-07  336   * Create a capbility for kernel read-only data and/or code.
480a2304d02375 Christian Ehrhardt 2025-07-07  337   * The capability is derived from kernel_code_cap and thus will
480a2304d02375 Christian Ehrhardt 2025-07-07  338   * allow read/exec and (if used as a pcc) access to system registers.
480a2304d02375 Christian Ehrhardt 2025-07-07  339   */
480a2304d02375 Christian Ehrhardt 2025-07-07  340  static __always_inline void *
480a2304d02375 Christian Ehrhardt 2025-07-07  341  cheri_make_kernel_code_cap(ptraddr_t addr)
480a2304d02375 Christian Ehrhardt 2025-07-07  342  {
480a2304d02375 Christian Ehrhardt 2025-07-07  343  	return cheri_address_set(kernel_code_cap, addr);
480a2304d02375 Christian Ehrhardt 2025-07-07  344  }
480a2304d02375 Christian Ehrhardt 2025-07-07  345  
480a2304d02375 Christian Ehrhardt 2025-07-07  346  static __maybe_unused void *
480a2304d02375 Christian Ehrhardt 2025-07-07  347  cheri_build_kernel_data_cap(ptraddr_t base, ptraddr_t addr, size_t len)
480a2304d02375 Christian Ehrhardt 2025-07-07  348  {
480a2304d02375 Christian Ehrhardt 2025-07-07  349  	return cheri_address_set(cheri_make_kernel_data_cap(base, len), addr);
480a2304d02375 Christian Ehrhardt 2025-07-07  350  }
480a2304d02375 Christian Ehrhardt 2025-07-07  351  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  352  #else
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  353  
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  354  #define __cheri_pointer_align
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  355  #define __packed_if_not_cheri __packed
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  356  #define cheri_bounds_set_kernel(__c, __l) (__c)
6a3f8e724666b1 Christian Ehrhardt 2024-09-16  357  
480a2304d02375 Christian Ehrhardt 2025-07-07  358  static __always_inline void *
480a2304d02375 Christian Ehrhardt 2025-07-07  359  cheri_kcap_ro(ptraddr_t addr)
480a2304d02375 Christian Ehrhardt 2025-07-07  360  {
480a2304d02375 Christian Ehrhardt 2025-07-07 @361  	return (void *)addr;
480a2304d02375 Christian Ehrhardt 2025-07-07  362  }
480a2304d02375 Christian Ehrhardt 2025-07-07  363  
480a2304d02375 Christian Ehrhardt 2025-07-07  364  static __always_inline void *
480a2304d02375 Christian Ehrhardt 2025-07-07 @365  cheri_make_kernel_data_cap(ptraddr_t addr, size_t len)
480a2304d02375 Christian Ehrhardt 2025-07-07  366  {
480a2304d02375 Christian Ehrhardt 2025-07-07  367  	(void)len;
480a2304d02375 Christian Ehrhardt 2025-07-07  368  
480a2304d02375 Christian Ehrhardt 2025-07-07  369  	return (void *)addr;
480a2304d02375 Christian Ehrhardt 2025-07-07  370  }
480a2304d02375 Christian Ehrhardt 2025-07-07  371  
480a2304d02375 Christian Ehrhardt 2025-07-07  372  static __always_inline void *
480a2304d02375 Christian Ehrhardt 2025-07-07 @373  cheri_make_kernel_code_cap(ptraddr_t addr)
480a2304d02375 Christian Ehrhardt 2025-07-07  374  {
480a2304d02375 Christian Ehrhardt 2025-07-07  375  	return (void *)addr;
480a2304d02375 Christian Ehrhardt 2025-07-07  376  }
480a2304d02375 Christian Ehrhardt 2025-07-07  377  
480a2304d02375 Christian Ehrhardt 2025-07-07  378  static __always_inline void *
480a2304d02375 Christian Ehrhardt 2025-07-07 @379  cheri_build_kernel_data_cap(ptraddr_t base, ptraddr_t addr, size_t len)
480a2304d02375 Christian Ehrhardt 2025-07-07  380  {
480a2304d02375 Christian Ehrhardt 2025-07-07  381  	return (void *)addr;
480a2304d02375 Christian Ehrhardt 2025-07-07  382  }
480a2304d02375 Christian Ehrhardt 2025-07-07  383  

:::::: The code at line 221 was first introduced by commit
:::::: 6a3f8e724666b1709b6c6c492517c60485dd39ed cheri: Add macros required for the CHERI enabled kernel

:::::: TO: Christian Ehrhardt <christian.ehrhardt@codasip.com>
:::::: CC: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
