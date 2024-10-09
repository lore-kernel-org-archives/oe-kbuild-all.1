Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E5220B0F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728442532; cv=none; b=W6VFzy0xVpqN8C4THHTrMUDixOFqngtx6OR9oBkqPPTvwux2MG4Is5mlr5HSUhXxeo0X28aAlYUrKvatNWBSou3ytphgk20ckO+IgPsUFGHQRjavau0drnLcnp22UQBFFT6EmxOBkJKAyy5r1AgIqFL0pkSB8MHPjwxGavWjm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728442532; c=relaxed/simple;
	bh=NS9IhPjdE3yaHiEZvW85p+y8t+eWSiG/2fWjRm3L4nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DF6kAUyRpibELCJpZyD8Op2zEJw5E1mkTGbkq8otIzkCojKvlPzgegMSnAOxxCWXxwyLyKPpCoW9eHbpORsnU7rno174sGUO2TgEnUkVFW71M2klqy+8wAn+s60D7ukQTNtwviUZCrBDfAaGMzahVjtJa9kRfWQs/AQ21BbngbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnhX8x8N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnhX8x8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728442531; x=1759978531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NS9IhPjdE3yaHiEZvW85p+y8t+eWSiG/2fWjRm3L4nI=;
  b=nnhX8x8NswktWK6aAPlnrKYnEmzSrp5eXuHiU/msCcmEI3GCawKCfadg
   +pXxMIjnlXCVnjqDx7NtbORAatvZ1gdTMCdk8UFqC0vqTndeKds17JQnD
   qQ1VKFAWiryuYy7KOJVZMo5HmPY/AOBT73pSGK4Ftqj/c5S/JWprv233q
   iKc9Uw44x6ng4hWvKnSnpQj6/LpU0cSFE+RjuqU1jdbeFJsbRXqqvHODL
   O02hDg4N416yxftSmZI+cy21OAS5RVdE5EaRA8DlrK5GizusIKZfwxJ6R
   PM+e20/UyrfXMaT1rL4rVrcTg+l9rvblkyEMiY8esxOareNVClX4v7K4y
   g==;
X-CSE-ConnectionGUID: U6Fb7ijYRCanprLrhQ8TFA==
X-CSE-MsgGUID: TGZaOslgTJuKzsx1HIyYAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50252888"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="50252888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 19:55:30 -0700
X-CSE-ConnectionGUID: DvZxLQ1YQwWwxnViVSatqQ==
X-CSE-MsgGUID: 6/pktto0Qp2pQ7e8A60yyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="80919229"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Oct 2024 19:55:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syMr9-0008dW-2P;
	Wed, 09 Oct 2024 02:55:19 +0000
Date: Wed, 9 Oct 2024 10:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
Message-ID: <202410091032.Q4NgrjoB-lkp@intel.com>
References: <20241008075023.3052370-2-jvetter@kalrayinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008075023.3052370-2-jvetter@kalrayinc.com>

Hi Julian,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes arm64/for-next/core deller-parisc/for-next s390/features mtd/mtd/next mtd/mtd/fixes linus/master arm/for-next arm/fixes v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Vetter/Consolidate-IO-memcpy-memset-into-iomap_copy-c/20241008-163134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241008075023.3052370-2-jvetter%40kalrayinc.com
patch subject: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20241009/202410091032.Q4NgrjoB-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091032.Q4NgrjoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091032.Q4NgrjoB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/io.h:7,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sparc/include/asm/hardirq_32.h:11,
                    from arch/sparc/include/asm/hardirq.h:7,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/pagemap.h:11,
                    from lib/buildid.c:7:
>> arch/sparc/include/asm/io_32.h:23:20: error: static declaration of '_memset_io' follows non-static declaration
      23 | static inline void _memset_io(volatile void __iomem *dst,
         |                    ^~~~~~~~~~
   arch/sparc/include/asm/io_32.h:10:31: note: previous declaration of '_memset_io' with type 'void(volatile void *, int,  size_t)' {aka 'void(volatile void *, int,  unsigned int)'}
      10 | #define memset_io(d,c,sz)     _memset_io(d,c,sz)
         |                               ^~~~~~~~~~
   include/asm-generic/io.h:109:13: note: in expansion of macro 'memset_io'
     109 | extern void memset_io(volatile void __iomem *dst, int c, size_t count);
         |             ^~~~~~~~~
>> arch/sparc/include/asm/io_32.h:34:20: error: static declaration of '_memcpy_fromio' follows non-static declaration
      34 | static inline void _memcpy_fromio(void *dst, const volatile void __iomem *src,
         |                    ^~~~~~~~~~~~~~
   arch/sparc/include/asm/io_32.h:11:31: note: previous declaration of '_memcpy_fromio' with type 'void(void *, const volatile void *, size_t)' {aka 'void(void *, const volatile void *, unsigned int)'}
      11 | #define memcpy_fromio(d,s,sz) _memcpy_fromio(d,s,sz)
         |                               ^~~~~~~~~~~~~~
   include/asm-generic/io.h:105:13: note: in expansion of macro 'memcpy_fromio'
     105 | extern void memcpy_fromio(void *to, const volatile void __iomem *from,
         |             ^~~~~~~~~~~~~
>> arch/sparc/include/asm/io_32.h:46:20: error: static declaration of '_memcpy_toio' follows non-static declaration
      46 | static inline void _memcpy_toio(volatile void __iomem *dst, const void *src,
         |                    ^~~~~~~~~~~~
   arch/sparc/include/asm/io_32.h:12:31: note: previous declaration of '_memcpy_toio' with type 'void(volatile void *, const void *, size_t)' {aka 'void(volatile void *, const void *, unsigned int)'}
      12 | #define memcpy_toio(d,s,sz)   _memcpy_toio(d,s,sz)
         |                               ^~~~~~~~~~~~
   include/asm-generic/io.h:107:13: note: in expansion of macro 'memcpy_toio'
     107 | extern void memcpy_toio(volatile void __iomem *to, const void *from,
         |             ^~~~~~~~~~~
--
   In file included from arch/sparc/include/asm/io.h:7,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sparc/include/asm/hardirq_32.h:11,
                    from arch/sparc/include/asm/hardirq.h:7,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/rtc.h:17,
                    from lib/vsprintf.c:36:
>> arch/sparc/include/asm/io_32.h:23:20: error: static declaration of '_memset_io' follows non-static declaration
      23 | static inline void _memset_io(volatile void __iomem *dst,
         |                    ^~~~~~~~~~
   arch/sparc/include/asm/io_32.h:10:31: note: previous declaration of '_memset_io' with type 'void(volatile void *, int,  size_t)' {aka 'void(volatile void *, int,  unsigned int)'}
      10 | #define memset_io(d,c,sz)     _memset_io(d,c,sz)
         |                               ^~~~~~~~~~
   include/asm-generic/io.h:109:13: note: in expansion of macro 'memset_io'
     109 | extern void memset_io(volatile void __iomem *dst, int c, size_t count);
         |             ^~~~~~~~~
>> arch/sparc/include/asm/io_32.h:34:20: error: static declaration of '_memcpy_fromio' follows non-static declaration
      34 | static inline void _memcpy_fromio(void *dst, const volatile void __iomem *src,
         |                    ^~~~~~~~~~~~~~
   arch/sparc/include/asm/io_32.h:11:31: note: previous declaration of '_memcpy_fromio' with type 'void(void *, const volatile void *, size_t)' {aka 'void(void *, const volatile void *, unsigned int)'}
      11 | #define memcpy_fromio(d,s,sz) _memcpy_fromio(d,s,sz)
         |                               ^~~~~~~~~~~~~~
   include/asm-generic/io.h:105:13: note: in expansion of macro 'memcpy_fromio'
     105 | extern void memcpy_fromio(void *to, const volatile void __iomem *from,
         |             ^~~~~~~~~~~~~
>> arch/sparc/include/asm/io_32.h:46:20: error: static declaration of '_memcpy_toio' follows non-static declaration
      46 | static inline void _memcpy_toio(volatile void __iomem *dst, const void *src,
         |                    ^~~~~~~~~~~~
   arch/sparc/include/asm/io_32.h:12:31: note: previous declaration of '_memcpy_toio' with type 'void(volatile void *, const void *, size_t)' {aka 'void(volatile void *, const void *, unsigned int)'}
      12 | #define memcpy_toio(d,s,sz)   _memcpy_toio(d,s,sz)
         |                               ^~~~~~~~~~~~
   include/asm-generic/io.h:107:13: note: in expansion of macro 'memcpy_toio'
     107 | extern void memcpy_toio(volatile void __iomem *to, const void *from,
         |             ^~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from arch/sparc/include/asm/io.h:7,
                    from include/linux/io.h:14,
                    from lib/iomap_copy.c:8:
>> arch/sparc/include/asm/io_32.h:23:20: error: static declaration of '_memset_io' follows non-static declaration
      23 | static inline void _memset_io(volatile void __iomem *dst,
         |                    ^~~~~~~~~~
   arch/sparc/include/asm/io_32.h:10:31: note: previous declaration of '_memset_io' with type 'void(volatile void *, int,  size_t)' {aka 'void(volatile void *, int,  unsigned int)'}
      10 | #define memset_io(d,c,sz)     _memset_io(d,c,sz)
         |                               ^~~~~~~~~~
   include/asm-generic/io.h:109:13: note: in expansion of macro 'memset_io'
     109 | extern void memset_io(volatile void __iomem *dst, int c, size_t count);
         |             ^~~~~~~~~
>> arch/sparc/include/asm/io_32.h:34:20: error: static declaration of '_memcpy_fromio' follows non-static declaration
      34 | static inline void _memcpy_fromio(void *dst, const volatile void __iomem *src,
         |                    ^~~~~~~~~~~~~~
   arch/sparc/include/asm/io_32.h:11:31: note: previous declaration of '_memcpy_fromio' with type 'void(void *, const volatile void *, size_t)' {aka 'void(void *, const volatile void *, unsigned int)'}
      11 | #define memcpy_fromio(d,s,sz) _memcpy_fromio(d,s,sz)
         |                               ^~~~~~~~~~~~~~
   include/asm-generic/io.h:105:13: note: in expansion of macro 'memcpy_fromio'
     105 | extern void memcpy_fromio(void *to, const volatile void __iomem *from,
         |             ^~~~~~~~~~~~~
>> arch/sparc/include/asm/io_32.h:46:20: error: static declaration of '_memcpy_toio' follows non-static declaration
      46 | static inline void _memcpy_toio(volatile void __iomem *dst, const void *src,
         |                    ^~~~~~~~~~~~
   arch/sparc/include/asm/io_32.h:12:31: note: previous declaration of '_memcpy_toio' with type 'void(volatile void *, const void *, size_t)' {aka 'void(volatile void *, const void *, unsigned int)'}
      12 | #define memcpy_toio(d,s,sz)   _memcpy_toio(d,s,sz)
         |                               ^~~~~~~~~~~~
   include/asm-generic/io.h:107:13: note: in expansion of macro 'memcpy_toio'
     107 | extern void memcpy_toio(volatile void __iomem *to, const void *from,
         |             ^~~~~~~~~~~
   lib/iomap_copy.c:10:10: fatal error: linux/unaligned.h: No such file or directory
      10 | #include <linux/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +/_memset_io +23 arch/sparc/include/asm/io_32.h

f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  22  
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26 @23  static inline void _memset_io(volatile void __iomem *dst,
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  24                                int c, __kernel_size_t n)
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  25  {
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  26  	volatile void __iomem *d = dst;
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  27  
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  28  	while (n--) {
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  29  		writeb(c, d);
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  30  		d++;
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  31  	}
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  32  }
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  33  
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26 @34  static inline void _memcpy_fromio(void *dst, const volatile void __iomem *src,
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  35                                    __kernel_size_t n)
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  36  {
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  37  	char *d = dst;
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  38  
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  39  	while (n--) {
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  40  		char tmp = readb(src);
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  41  		*d++ = tmp;
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  42  		src++;
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  43  	}
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  44  }
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  45  
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26 @46  static inline void _memcpy_toio(volatile void __iomem *dst, const void *src,
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  47                                  __kernel_size_t n)
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  48  {
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  49  	const char *s = src;
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  50  	volatile void __iomem *d = dst;
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  51  
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  52  	while (n--) {
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  53  		char tmp = *s++;
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  54  		writeb(tmp, d);
e1039fb426094d arch/sparc/include/asm/io_32.h Sam Ravnborg 2014-04-26  55  		d++;
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  56  	}
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  57  }
f5e706ad886b6a include/asm-sparc/io_32.h      Sam Ravnborg 2008-07-17  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
