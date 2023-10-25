Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26C48467
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="narD94ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698238689; x=1729774689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=knURLx+dksSgqNhgtwgvbPpvjXF0GL8+QSSBD09DmKE=;
  b=narD94ii1oPPOB9qEiotNtaL637wfy4Ucw8hl46/yCTlUfBlgc2ewpJO
   lx7ASKM0EapexM7xtU4hrY58HhI/pl5HZ92XJ0ooKh5omJdbTedxGpk7k
   6erJNAkC/rpoeb/HxM7Txkceu8H8v0vWKlkPf2wAN+/PGBqATD69xSntM
   zYdAvRkwmVH3SlSZoodfnySnmMzz/1eiftgGeFUBl/Y9UxPuYEjBQQZyz
   ekr9317xdTAEhguiUpB4/GOnDa2d7cATcB8GWuORy3Yw0gt7N80mvxnnh
   oOTmrL0lDpNhm+IbVPHw8C+P8OqgsS7RSfiufW/8NpKzDH6L0Gc9uRQuz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="377666301"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="377666301"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 05:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="829208515"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="829208515"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2023 05:58:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvdSX-0008th-0b;
	Wed, 25 Oct 2023 12:58:05 +0000
Date: Wed, 25 Oct 2023 20:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -tip v3] x86/percpu: Introduce const-qualified
 const_pcpu_hot
Message-ID: <202310252024.tnKhQHDe-lkp@intel.com>
References: <20231023143100.4014-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023143100.4014-1-ubizjak@gmail.com>

Hi Uros,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on dennis-percpu/for-next tip/auto-latest linus/master v6.6-rc7]
[cannot apply to tip/master next-20231025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/x86-percpu-Introduce-const-qualified-const_pcpu_hot/20231023-223358
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231023143100.4014-1-ubizjak%40gmail.com
patch subject: [PATCH -tip v3] x86/percpu: Introduce const-qualified const_pcpu_hot
config: x86_64-buildonly-randconfig-001-20231025 (https://download.01.org/0day-ci/archive/20231025/202310252024.tnKhQHDe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310252024.tnKhQHDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310252024.tnKhQHDe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from arch/x86/include/asm/percpu.h:410,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> arch/x86/include/asm/current.h:40:47: error: expected ')' before '__percpu_seg_override'
      40 | DECLARE_PER_CPU_ALIGNED(const struct pcpu_hot __percpu_seg_override,
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:101:45: note: in definition of macro 'DECLARE_PER_CPU_SECTION'
     101 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                             ^~~~
   arch/x86/include/asm/current.h:40:1: note: in expansion of macro 'DECLARE_PER_CPU_ALIGNED'
      40 | DECLARE_PER_CPU_ALIGNED(const struct pcpu_hot __percpu_seg_override,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:101:44: note: to match this '('
     101 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^
   include/linux/percpu-defs.h:147:9: note: in expansion of macro 'DECLARE_PER_CPU_SECTION'
     147 |         DECLARE_PER_CPU_SECTION(type, name, PER_CPU_ALIGNED_SECTION)    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/current.h:40:1: note: in expansion of macro 'DECLARE_PER_CPU_ALIGNED'
      40 | DECLARE_PER_CPU_ALIGNED(const struct pcpu_hot __percpu_seg_override,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3533711212
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=3533711212
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=3533711212
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=3533711212
   make: Target 'prepare' not remade because of errors.


vim +40 arch/x86/include/asm/current.h

    38	
    39	/* const-qualified alias to pcpu_hot, aliased by linker. */
  > 40	DECLARE_PER_CPU_ALIGNED(const struct pcpu_hot __percpu_seg_override,
    41				const__pcpu_hot);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
