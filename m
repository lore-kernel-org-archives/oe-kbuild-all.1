Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2AD1642F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690460002; x=1721996002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nj1bLAO6nWuDBL3butQPoSSnCKclxrz8U3Ia9YH9SxM=;
  b=lNcqPXPufm0hIexxSXPQqJsH0HtLEH9kqsyfYiv5UzB+n2IhkUGiJLRJ
   Y9nF4qdqxMkpfxbVO/T/3UANyQuut5T5XVFpxskAj3hnvSRwAdvvzqiIN
   9vHLvQeuoTXiGOmLRX1mIpkClxz3KRx9eBqkoWprGwyyVECA1BzPW6KEc
   VrMnAQTBhpSQqoSS8hAVmfe1p7Kv5GDd3hU/zohZXhVfBlyT7BVMR9+Zb
   GV79+1y3XUMP5OlSXdY/7bic/m8E/eGAIUgtL6iIstcln5pNBlvAC3kgd
   YtOX6emiA+J3aopNATKohOfAIeHLuWPf/7ll3TuQUxtwu5SRQ1ZmCwiHd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367167780"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="367167780"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 05:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="730252650"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="730252650"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2023 05:06:02 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOzkn-0002Ff-2F;
	Thu, 27 Jul 2023 12:06:01 +0000
Date: Thu, 27 Jul 2023 20:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [linux-next:master 4460/5027] include/linux/jump_label.h:81:35:
 error: implicit declaration of function 'WARN'
Message-ID: <202307271907.B7vh0S4A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
commit: de2f542cfbec295ac0f9b6a832d7b3ba20df391f [4460/5027] fs/proc: Add /proc/cmdline_load for boot loader arguments
config: arm64-randconfig-r061-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271907.B7vh0S4A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271907.B7vh0S4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271907.B7vh0S4A-lkp@intel.com/

Note: the linux-next/master HEAD 451cc82bd11eb6a374f4dbcfc1cf007eafea91ab builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from include/linux/static_key.h:1,
                    from include/linux/kasan-enabled.h:5,
                    from arch/arm64/include/asm/cache.h:41,
                    from include/linux/cache.h:6,
                    from include/linux/init.h:116,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from scripts/mod/devicetable-offsets.c:3:
   include/linux/jump_label.h: In function 'static_key_fast_inc_not_disabled':
>> include/linux/jump_label.h:81:35: error: implicit declaration of function 'WARN' [-Werror=implicit-function-declaration]
      81 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^~~~
   include/linux/jump_label.h:286:9: note: in expansion of macro 'STATIC_KEY_CHECK_USE'
     286 |         STATIC_KEY_CHECK_USE(key);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h: In function 'static_key_enable':
>> include/linux/jump_label.h:322:17: error: implicit declaration of function 'WARN_ON_ONCE' [-Werror=implicit-function-declaration]
     322 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
         |                 ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/WARN +81 include/linux/jump_label.h

c4b2c0c5f647aa Hannes Frederic Sowa 2013-10-19  80  
5cdda5117e125e Borislav Petkov      2017-10-18 @81  #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,		      \
5cdda5117e125e Borislav Petkov      2017-10-18  82  				    "%s(): static key '%pS' used before call to jump_label_init()", \
5cdda5117e125e Borislav Petkov      2017-10-18  83  				    __func__, (key))
d430d3d7e646eb Jason Baron          2011-03-16  84  

:::::: The code at line 81 was first introduced by commit
:::::: 5cdda5117e125e0dbb020425cc55a4c143c6febc locking/static_keys: Improve uninitialized key warning

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
