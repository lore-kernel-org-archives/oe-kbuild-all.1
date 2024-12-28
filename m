Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349AF382
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 04:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735359632; cv=none; b=C/EpJezq+8NwZNI68sMq63YOQISNvVnjiFZWM3TFZUTAPyjHE6B9rzL1At1WWefCCw4sH4dVAl68qX6i/Q81TlrqDtQ6MEb3caKlv8f8oGLhrTxfv2HYw/S1G6vG4+FUHumf+kWLjQKnQUE7hJFXyLdb48lSKBTd7qKDBPpWpsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735359632; c=relaxed/simple;
	bh=sNekvGtYADdsBb5viCrD241bPA4LZcxgPVBnQieV6Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkVuPKi2FjCSOpcsrj2q4OH9T+ukZvmy57DQglRrnJ4FeLnWuvG1aJOT0PhJGfEFV79JhTYJTSgUTSiHb6uymZzbbX5LKUCMK/7sE0uU1EUiDjzyU7g2aGIiR5JJAdIiYfXzP26N7jSBCxQUTSAfMiE2eajUs5GYoQqkKrnSrGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fONqLK+t; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fONqLK+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735359630; x=1766895630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sNekvGtYADdsBb5viCrD241bPA4LZcxgPVBnQieV6Q4=;
  b=fONqLK+tG1ExMvqsGuIJ6OjTqLVcBCJZ5k89gREFhf5ngchhIFE5jh7h
   cIh87nTrRs0paXJrsiFvtYbgiSuthLLAV3EWcqW0gC/yzfECG68k2To/s
   8sistuPGeHlxuEZ86woFmCWn9Afn9P7VVv+1PW4wfsSuv/b8bJB5A0PH1
   gzCgBhM/5KrsuOHKeA3tU36Li6kZ2lhdwyy31l3NI1X6jUjSmaPVngwRI
   5Y65Gq3fA2eqEFDsXTYIeymjwCpqyJyYsD3oOG2rjxP8qDSQlItPInD/c
   gaG/9YMyokusC2SRvMFkt3nX5h3OPIPB1Psezmr4efcMPdJJA6+ogbDG0
   w==;
X-CSE-ConnectionGUID: HQH8LGIaRuCfKHRdiD+efA==
X-CSE-MsgGUID: BB1jLhmVT4SBthGdjmTzGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35622857"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35622857"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 20:20:29 -0800
X-CSE-ConnectionGUID: T/Teu9f9T8ypm2hMDv/KOQ==
X-CSE-MsgGUID: FixzC9WiRE+EuJWbZZBzLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="100054165"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Dec 2024 20:20:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tROJN-0003qu-2k;
	Sat, 28 Dec 2024 04:20:25 +0000
Date: Sat, 28 Dec 2024 12:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Raymond Tan <raymond.tan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>,
	N Pandith <pandith.n@intel.com>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3]
 drivers/gpio/gpio-ehl-pse-plat.c:79:6: warning: no previous prototype for
 'ehl_pse_gpio_free'
Message-ID: <202412281218.BJwl0QO0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: 98f388dc83f17d579f5684c021040f02269a7ebe [3/3] mfd: intel-ehl-gpio: Introduce MFD framework to PSE GPIO/TGPIO
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412281218.BJwl0QO0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281218.BJwl0QO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281218.BJwl0QO0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-ehl-pse-plat.c:79:6: warning: no previous prototype for 'ehl_pse_gpio_free' [-Wmissing-prototypes]
      79 | void ehl_pse_gpio_free(struct gpio_chip *chip, unsigned int offset)
         |      ^~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/gpio/gpio-ehl-pse-plat.c:9:
   drivers/gpio/gpio-ehl-pse-plat.c: In function 'ehl_pse_gpio_probe':
   include/linux/stddef.h:8:14: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/gpio/gpio-ehl-pse-plat.c:378:24: note: in expansion of macro 'NULL'
     378 |                 return NULL;
         |                        ^~~~
   include/linux/stddef.h:8:14: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/gpio/gpio-ehl-pse-plat.c:382:24: note: in expansion of macro 'NULL'
     382 |                 return NULL;
         |                        ^~~~
   drivers/gpio/gpio-ehl-pse-plat.c:364:23: warning: unused variable 'base' [-Wunused-variable]
     364 |         void __iomem *base;
         |                       ^~~~


vim +/ehl_pse_gpio_free +79 drivers/gpio/gpio-ehl-pse-plat.c

    78	
  > 79	void ehl_pse_gpio_free(struct gpio_chip *chip, unsigned int offset)
    80	{
    81		/* decrease runtime_usage counter */
    82		pm_runtime_put_sync(chip->parent);
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
