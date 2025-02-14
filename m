Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FFD19F495
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739565373; cv=none; b=H12jpyuyLO3p3y8rjxvK+2WKsr3ubt7rN5PID9+zz5ksKVKXfvPsj5l7KOln6eZxedIZhWB8j567ObT8ouh+myaRHt9vX/vlsUN0uylfrdquHswDvnrQZ/zh7icNzl73fzDfpLURUa9lYZXoqi/02Q9wEZsWrZC1dPcRSSUiD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739565373; c=relaxed/simple;
	bh=DizIjoxthV0KUUE5Teg8/3yFxtbH8Kg7BiWu7eGAXNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hx/X0pDvxfhecpORhUCHKbskTSocE5wE0gzXKtuu6QDfbDUXJBDey3Q1cHlym5HB+tdQPUU73t/9Wuz6Y96+odrjcsy+u0zkqteOoqUmkXnSRXQtojCwfjXawX28oggkJ0BV4nmHirITw46WphlcuNecRaOSNP94oOTLjYLicrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zcb7a+0u; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zcb7a+0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739565370; x=1771101370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DizIjoxthV0KUUE5Teg8/3yFxtbH8Kg7BiWu7eGAXNs=;
  b=Zcb7a+0uzXfftM9bjMOEKo0aaBmM0fcTTdz5pNMscvZ3nPtPvNrERMv+
   h00XSp3AxAmNdDEbA1vjCadJb4kVLkNSMe0M7rrM0H6ULFoVD38IdVdu3
   8HquAVBA08sItnaWlfwOFqhe89CMQ9vGh0KckbKCH0o3jHgSWVZg80aab
   2j3mdHzyubckEQGpHV39aCsuawaobw5emvYq6rJrbWrn0Q3jnmyK42SW4
   rz4QLQnZQG6V2VOdRCcXdCenAzV0xYClpA3FRPmZN6t+OD0/e8ma2bjUY
   agikZkUXph+gyiiZHn1atvoMlxkyg0zvUrq2Dv4LdB4HUaCjnsKOzj3lm
   Q==;
X-CSE-ConnectionGUID: vG1lqVR+RLaltIWZ8OK00g==
X-CSE-MsgGUID: XS6MXMlESFGLZCD2dSUJmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44255137"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="44255137"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 12:36:10 -0800
X-CSE-ConnectionGUID: yuf1/U8nTM+UOYv3ZSRueA==
X-CSE-MsgGUID: tD8SjonXQUi8ZHY57UGcow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113412563"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2025 12:36:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj2Pv-001A8V-31;
	Fri, 14 Feb 2025 20:36:07 +0000
Date: Sat, 15 Feb 2025 04:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [linux-next:master 3025/4011] arch/m68k/include/asm/cmpxchg.h:17:9:
 error: implicit declaration of function 'local_irq_save'
Message-ID: <202502150415.R3H7UcKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: fe348e05890776897acb931eb39987fcef0f6f65 [3025/4011] mm: security: Check early if HARDENED_USERCOPY is enabled
config: m68k-randconfig-r133-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150415.R3H7UcKa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250215/202502150415.R3H7UcKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150415.R3H7UcKa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:257,
                    from include/linux/thread_info.h:221,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from kernel/locking/irqflag-debug.c:5:
   arch/m68k/include/asm/cmpxchg.h: In function '__arch_xchg':
>> arch/m68k/include/asm/cmpxchg.h:17:9: error: implicit declaration of function 'local_irq_save' [-Wimplicit-function-declaration]
      17 |         local_irq_save(flags);
         |         ^~~~~~~~~~~~~~
>> arch/m68k/include/asm/cmpxchg.h:34:9: error: implicit declaration of function 'local_irq_restore' [-Wimplicit-function-declaration]
      34 |         local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~
   In file included from arch/m68k/include/asm/cmpxchg.h:75:
   include/asm-generic/cmpxchg-local.h: In function '__generic_cmpxchg_local':
   include/asm-generic/cmpxchg-local.h:26:9: error: implicit declaration of function 'raw_local_irq_save' [-Wimplicit-function-declaration]
      26 |         raw_local_irq_save(flags);
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg-local.h:47:9: error: implicit declaration of function 'raw_local_irq_restore' [-Wimplicit-function-declaration]
      47 |         raw_local_irq_restore(flags);
         |         ^~~~~~~~~~~~~~~~~~~~~


vim +/local_irq_save +17 arch/m68k/include/asm/cmpxchg.h

803f69144f0d48 David Howells 2012-03-28  11  
803f69144f0d48 David Howells 2012-03-28  12  #ifndef CONFIG_RMW_INSNS
068550631fbe0b Andrzej Hajda 2023-01-18  13  static inline unsigned long __arch_xchg(unsigned long x, volatile void * ptr, int size)
803f69144f0d48 David Howells 2012-03-28  14  {
61eb040228ba9a Thorsten Blum 2024-07-31  15  	unsigned long flags;
803f69144f0d48 David Howells 2012-03-28  16  
803f69144f0d48 David Howells 2012-03-28 @17  	local_irq_save(flags);
803f69144f0d48 David Howells 2012-03-28  18  
803f69144f0d48 David Howells 2012-03-28  19  	switch (size) {
803f69144f0d48 David Howells 2012-03-28  20  	case 1:
61eb040228ba9a Thorsten Blum 2024-07-31  21  		swap(*(u8 *)ptr, x);
803f69144f0d48 David Howells 2012-03-28  22  		break;
803f69144f0d48 David Howells 2012-03-28  23  	case 2:
61eb040228ba9a Thorsten Blum 2024-07-31  24  		swap(*(u16 *)ptr, x);
803f69144f0d48 David Howells 2012-03-28  25  		break;
803f69144f0d48 David Howells 2012-03-28  26  	case 4:
61eb040228ba9a Thorsten Blum 2024-07-31  27  		swap(*(u32 *)ptr, x);
803f69144f0d48 David Howells 2012-03-28  28  		break;
803f69144f0d48 David Howells 2012-03-28  29  	default:
21b9e722ad28c1 Thorsten Blum 2024-07-02  30  		x = __invalid_xchg_size(x, ptr, size);
803f69144f0d48 David Howells 2012-03-28  31  		break;
803f69144f0d48 David Howells 2012-03-28  32  	}
803f69144f0d48 David Howells 2012-03-28  33  
803f69144f0d48 David Howells 2012-03-28 @34  	local_irq_restore(flags);
803f69144f0d48 David Howells 2012-03-28  35  	return x;
803f69144f0d48 David Howells 2012-03-28  36  }
803f69144f0d48 David Howells 2012-03-28  37  #else
068550631fbe0b Andrzej Hajda 2023-01-18  38  static inline unsigned long __arch_xchg(unsigned long x, volatile void * ptr, int size)
803f69144f0d48 David Howells 2012-03-28  39  {
803f69144f0d48 David Howells 2012-03-28  40  	switch (size) {
803f69144f0d48 David Howells 2012-03-28  41  	case 1:
803f69144f0d48 David Howells 2012-03-28  42  		__asm__ __volatile__
803f69144f0d48 David Howells 2012-03-28  43  			("moveb %2,%0\n\t"
803f69144f0d48 David Howells 2012-03-28  44  			 "1:\n\t"
803f69144f0d48 David Howells 2012-03-28  45  			 "casb %0,%1,%2\n\t"
803f69144f0d48 David Howells 2012-03-28  46  			 "jne 1b"
2a55550fbba643 Kees Cook     2022-02-02  47  			 : "=&d" (x) : "d" (x), "m" (*__xg(u8, ptr)) : "memory");
803f69144f0d48 David Howells 2012-03-28  48  		break;
803f69144f0d48 David Howells 2012-03-28  49  	case 2:
803f69144f0d48 David Howells 2012-03-28  50  		__asm__ __volatile__
803f69144f0d48 David Howells 2012-03-28  51  			("movew %2,%0\n\t"
803f69144f0d48 David Howells 2012-03-28  52  			 "1:\n\t"
803f69144f0d48 David Howells 2012-03-28  53  			 "casw %0,%1,%2\n\t"
803f69144f0d48 David Howells 2012-03-28  54  			 "jne 1b"
2a55550fbba643 Kees Cook     2022-02-02  55  			 : "=&d" (x) : "d" (x), "m" (*__xg(u16, ptr)) : "memory");
803f69144f0d48 David Howells 2012-03-28  56  		break;
803f69144f0d48 David Howells 2012-03-28  57  	case 4:
803f69144f0d48 David Howells 2012-03-28  58  		__asm__ __volatile__
803f69144f0d48 David Howells 2012-03-28  59  			("movel %2,%0\n\t"
803f69144f0d48 David Howells 2012-03-28  60  			 "1:\n\t"
803f69144f0d48 David Howells 2012-03-28  61  			 "casl %0,%1,%2\n\t"
803f69144f0d48 David Howells 2012-03-28  62  			 "jne 1b"
2a55550fbba643 Kees Cook     2022-02-02  63  			 : "=&d" (x) : "d" (x), "m" (*__xg(u32, ptr)) : "memory");
803f69144f0d48 David Howells 2012-03-28  64  		break;
803f69144f0d48 David Howells 2012-03-28  65  	default:
803f69144f0d48 David Howells 2012-03-28  66  		x = __invalid_xchg_size(x, ptr, size);
803f69144f0d48 David Howells 2012-03-28  67  		break;
803f69144f0d48 David Howells 2012-03-28  68  	}
803f69144f0d48 David Howells 2012-03-28  69  	return x;
803f69144f0d48 David Howells 2012-03-28  70  }
803f69144f0d48 David Howells 2012-03-28  71  #endif
803f69144f0d48 David Howells 2012-03-28  72  

:::::: The code at line 17 was first introduced by commit
:::::: 803f69144f0d48863c68f9d111b56849c7cef5bb Disintegrate asm/system.h for M68K

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
