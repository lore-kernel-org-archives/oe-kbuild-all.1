Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEBB221F2C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 01:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272102; cv=none; b=P4lFbP97ZzUD+wtK334krAMdWTLe3pNOwRn0SBMQ/FzER863sSs1zAcY+1nAp2PnsWfRKgvlzZAOI4omscog0e2jw0GdQPfuTZ9gxIXBloKiooFOI567wAZ38vWcWFhgfUoySY0QXa5iboS1A7gM+QteHWH70RxIBAICFGZjk8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272102; c=relaxed/simple;
	bh=jgjSrlr/T0ZiWg2l9ELXgMwJAxZDAl6Zhb98CMnMTL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH0lsUY0jTlAa1grxxgWOpsEekQbu5XSpi50JhAsCUaswNE7DcSKgkEuAyTpIHKY2wpq71BTETDzE06nis6XSBK3TdIFxMJQEkY3jLy6NbtQaUKmmlqbuymGhLAvHnDR/qS7s1sbbqiCgYgkWoCP3RiNRGWNrhydsLRHNEedrw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrYJDVOk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrYJDVOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747272100; x=1778808100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jgjSrlr/T0ZiWg2l9ELXgMwJAxZDAl6Zhb98CMnMTL8=;
  b=QrYJDVOki4MtHKtLPwkPaGCVSxqlU2V3obxdu7QjC3k1iH6kI/63S/xe
   P3bLXVakhD8TbztfPv3ZHKFwc4oxMvDQWPF/QjGq2VOz2mn4RbZx2u+J1
   9gtRc9zGvZ7X5wBgz/Na6YgX+vjjSC+247amwuY88wje1WE0BBIqmyMs2
   5Bvcog8HzZ6V3QHh5m/5a1cIaDnL2P5KYdbrWnsGz8A28De9c4vGe5nDs
   7lNVGA7vDyV0DQAf1ZZ+7Ea0+2SWZT1S6/9WW8/yMlC3vV7zkrnv4Cd7i
   dJ3AbCBHV3N0JL4E0n0CiTIH+2jIOeBrQA03YM3VJExcK+DIwkc+qMXtP
   Q==;
X-CSE-ConnectionGUID: pYDrH8ULSUiZ82cOfyelyg==
X-CSE-MsgGUID: 5Aov9zB3RwmGAjsES0wiCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52997090"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="52997090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 18:21:40 -0700
X-CSE-ConnectionGUID: ZHDeO+p7Q5iDzwAbdYR0CA==
X-CSE-MsgGUID: QbWLwMJ8SnOi5SPFb4oH8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138716109"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2025 18:21:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFNHy-000Hkz-1M;
	Thu, 15 May 2025 01:21:34 +0000
Date: Thu, 15 May 2025 09:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
Message-ID: <202505150913.Iq1XRKqC-lkp@intel.com>
References: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>

Hi Aleksa,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Paunovic-via-B4-Relay/dt-bindings-timer-mti-gcru/20250514-165347
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-2-cb0cf2922d66%40htecgroup.com
patch subject: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
config: riscv-randconfig-001-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150913.Iq1XRKqC-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150913.Iq1XRKqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150913.Iq1XRKqC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:8:
   arch/riscv/include/asm/timex.h: In function 'random_get_entropy':
>> arch/riscv/include/asm/timex.h:39:9: error: implicit declaration of function 'get_cycles'; did you mean 'get_cycles_ptr'? [-Werror=implicit-function-declaration]
     return get_cycles();
            ^~~~~~~~~~
            get_cycles_ptr
   arch/riscv/include/asm/timex.h: In function 'get_cycles64':
>> arch/riscv/include/asm/timex.h:45:23: error: implicit declaration of function 'get_cycles_ptr_hi'; did you mean 'get_cycles_ptr'? [-Werror=implicit-function-declaration]
    #define get_cycles_hi get_cycles_ptr_hi
                          ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/timex.h:58:8: note: in expansion of macro 'get_cycles_hi'
      hi = get_cycles_hi();
           ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:98: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2386734513
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=2386734513
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2386734513
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2386734513
   make: Target 'prepare' not remade because of errors.


vim +39 arch/riscv/include/asm/timex.h

d5be89a8d118a8 Palmer Dabbelt     2020-09-14  29  
aa9887608e77b8 Anup Patel         2020-09-27  30  /*
aa9887608e77b8 Anup Patel         2020-09-27  31   * Much like MIPS, we may not have a viable counter to use at an early point
aa9887608e77b8 Anup Patel         2020-09-27  32   * in the boot process. Unfortunately we don't have a fallback, so instead
aa9887608e77b8 Anup Patel         2020-09-27  33   * we just return 0.
aa9887608e77b8 Anup Patel         2020-09-27  34   */
aa9887608e77b8 Anup Patel         2020-09-27  35  static inline unsigned long random_get_entropy(void)
aa9887608e77b8 Anup Patel         2020-09-27  36  {
aa9887608e77b8 Anup Patel         2020-09-27  37  	if (unlikely(clint_time_val == NULL))
6d01238623faa9 Jason A. Donenfeld 2022-04-08  38  		return random_get_entropy_fallback();
aa9887608e77b8 Anup Patel         2020-09-27 @39  	return get_cycles();
aa9887608e77b8 Anup Patel         2020-09-27  40  }
aa9887608e77b8 Anup Patel         2020-09-27  41  #define random_get_entropy()	random_get_entropy()
7eeda0113dff84 Aleksa Paunovic    2025-05-14  42  #endif
aa9887608e77b8 Anup Patel         2020-09-27  43  
7eeda0113dff84 Aleksa Paunovic    2025-05-14  44  #define get_cycles get_cycles_ptr
7eeda0113dff84 Aleksa Paunovic    2025-05-14 @45  #define get_cycles_hi get_cycles_ptr_hi
ccbbfd1cbf365b Palmer Dabbelt     2020-11-25  46  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
