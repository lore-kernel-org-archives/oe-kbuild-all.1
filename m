Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90725111B6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlAQ9WAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699521949; x=1731057949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AyxJP29kR02iiNbcHt7dehQtU/CjLqUJJGn9LSD530U=;
  b=HlAQ9WAYZZcdevi18vuASlC3HnxW4AnTI9acS6AdA0pQNZyRYR/IE4td
   yXyaxyte2JbSiEI3Hqg8lQXVtFqseRznMdNXwGtXBGhJJrqhleLuEXLKU
   lA4StVc4aiiPwdeO25EbLfaX5rUP3rriStFq2xtQrmwkNs68IveXN49s3
   45zD5BMl9wtcWMYlDmKcdGq4VVRSV1zhsXEOdjCzwdogWlSUuu7qu1a4a
   AjDMcfSrjE9xqf/KAUcTXuDWw968C0GfsDX7DqAb0WrirHXqV7moTrLu2
   eRtPbEn87fPPpfCsegnw7p357FMoOBoA5ZX8yLqS4Me4SvsYCWxo443uQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="393860535"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="393860535"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 01:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="829250358"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="829250358"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2023 01:25:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r11IB-0008cK-0b;
	Thu, 09 Nov 2023 09:25:39 +0000
Date: Thu, 9 Nov 2023 17:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Message-ID: <202311091754.K9wZD9Nv-lkp@intel.com>
References: <20231108125843.3806765-16-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108125843.3806765-16-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[cannot apply to v6.6 next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/ida-make-ida_dump-static/20231109-005742
base:   linus/master
patch link:    https://lore.kernel.org/r/20231108125843.3806765-16-arnd%40kernel.org
patch subject: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
config: um-defconfig (https://download.01.org/0day-ci/archive/20231109/202311091754.K9wZD9Nv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091754.K9wZD9Nv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091754.K9wZD9Nv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/um/vdso/um_vdso.c:17:5: error: conflicting types for '__vdso_clock_gettime'; have 'int(clockid_t,  struct __kernel_old_timespec *)' {aka 'int(int,  struct __kernel_old_timespec *)'}
      17 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/um/vdso/um_vdso.c:15:
   include/vdso/gettime.h:16:5: note: previous declaration of '__vdso_clock_gettime' with type 'int(clockid_t,  struct __kernel_timespec *)' {aka 'int(int,  struct __kernel_timespec *)'}
      16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/x86/um/vdso/um_vdso.c:58:1: warning: no previous prototype for '__vdso_getcpu' [-Wmissing-prototypes]
      58 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
         | ^~~~~~~~~~~~~


vim +17 arch/x86/um/vdso/um_vdso.c

f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  16  
82210fc778982d arch/x86/um/vdso/um_vdso.c        Arnd Bergmann      2019-10-27 @17  int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  18  {
f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  19  	long ret;
f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  20  
5541992e512de8 arch/x86/um/vdso/um_vdso.c        Ammar Faizi        2022-12-24  21  	asm("syscall"
5541992e512de8 arch/x86/um/vdso/um_vdso.c        Ammar Faizi        2022-12-24  22  		: "=a" (ret)
5541992e512de8 arch/x86/um/vdso/um_vdso.c        Ammar Faizi        2022-12-24  23  		: "0" (__NR_clock_gettime), "D" (clock), "S" (ts)
5541992e512de8 arch/x86/um/vdso/um_vdso.c        Ammar Faizi        2022-12-24  24  		: "rcx", "r11", "memory");
f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  25  
f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  26  	return ret;
f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  27  }
82210fc778982d arch/x86/um/vdso/um_vdso.c        Arnd Bergmann      2019-10-27  28  int clock_gettime(clockid_t, struct __kernel_old_timespec *)
f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  29  	__attribute__((weak, alias("__vdso_clock_gettime")));
f1c2bb8b9964ed arch/um/sys-x86_64/vdso/um_vdso.c Richard Weinberger 2011-07-25  30  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
