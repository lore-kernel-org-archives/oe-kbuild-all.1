Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AA01AAE08
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 19:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725998286; cv=none; b=rW8HfZgh3IhkxBpyip7vIro+p+83qVuoYCv4tpxigiHAE/dXu4t/zuEHxP0bFR6dOAtuLB9WSxpuZLwqyvwAG8kGYO1H6Z0S367CDvw0t1x8Yi/TmBjWE/Y08np0Qi3eH6XIBq3p0QvsvyXBTMNMr/rFg8B2bYB9a2HhfTZAGmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725998286; c=relaxed/simple;
	bh=WwAPgAcqq0KJNEFfTfoCRyFKJ5HdWT//5PcBBeNKiys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbTffmC53h2Vz9MNyXfLD7jNXv7T9CUNtLhBtAa8mAdbc5CEUNejBnOeJK8vdiYZ4lRbTjRFWV59kyntAemQMIMFS8xzfQrjjDQYeGRCF8Iu/TB/kl655u81+DDlU/nsldVP8B9PFoJhRBKILkzwHlwKJNkuiyS/rrt6uxXjNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbuZc4z/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbuZc4z/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725998284; x=1757534284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WwAPgAcqq0KJNEFfTfoCRyFKJ5HdWT//5PcBBeNKiys=;
  b=DbuZc4z/+SKbG8RTSPqxHLVrHbnbafvzBeu+mYm+CJsikqyB1SVDuViI
   lVKKTzN1TemACtnmTHT82ZU7PILyJQF19B9+uRk/RF8mkfn7KgxT+AAW9
   nMKOz5Av88sB+jO6Y8fRZM6ZYXiZ//09s/TD/NSVJmUbLvrg8/Ems17we
   MsDCY3MK227mPGt3C5IVxErygsd8bi18LpCWCBva/rY2rEoAED7xasRD5
   oZqKgk+vJrJ8lVwKElM7S4qvoWFfdG7BZFSXrsXICzeEQdaJVYyylRGX5
   DyHCXeBKGSQlJMLCUkgSwPSd+zmM4EZGbSCzVak99NvaBkFDnrlEdqxx3
   Q==;
X-CSE-ConnectionGUID: Waf3W7aERoyLwOTFS560jg==
X-CSE-MsgGUID: 195B50UzRCCIm6ji2hkhbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="47292148"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="47292148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 12:58:03 -0700
X-CSE-ConnectionGUID: RZy+Go1mTCyjuI10JZ8lYw==
X-CSE-MsgGUID: P9Cu3YCPTIu8MQlJkSO4ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71929984"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2024 12:58:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so6zv-0002YI-1r;
	Tue, 10 Sep 2024 19:57:59 +0000
Date: Wed, 11 Sep 2024 03:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2662/23703]
 arch/arm64/include/asm/irqflags.h:88:9: warning: 'flags' may be used
 uninitialized
Message-ID: <202409110303.bhVqMzMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bf039567abd9303dc03746afaaf0854f41ed853b
commit: 9dae7e237a64858407b7626260bad53aa13c9198 [2662/23703] serial: sh-sci: Fix locking in sci_submit_rx()
config: arm64-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240911/202409110303.bhVqMzMo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110303.bhVqMzMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110303.bhVqMzMo-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:16,
                    from include/linux/spinlock.h:54,
                    from include/linux/rwsem.h:16,
                    from include/linux/notifier.h:15,
                    from include/linux/clk.h:17,
                    from drivers/tty/serial/sh-sci.c:24:
   In function 'arch_local_irq_restore',
       inlined from '__raw_spin_unlock_irqrestore' at include/linux/spinlock_api_smp.h:160:2,
       inlined from 'spin_unlock_irqrestore' at include/linux/spinlock.h:384:2,
       inlined from 'sci_submit_rx' at drivers/tty/serial/sh-sci.c:1376:3:
>> arch/arm64/include/asm/irqflags.h:88:9: warning: 'flags' may be used uninitialized [-Wmaybe-uninitialized]
      88 |         asm volatile(
         |         ^~~
   drivers/tty/serial/sh-sci.c: In function 'sci_submit_rx':
   drivers/tty/serial/sh-sci.c:1338:23: note: 'flags' was declared here
    1338 |         unsigned long flags;
         |                       ^~~~~
   In file included from drivers/tty/serial/sh-sci.c:53:
   In function 'tty_insert_flip_char',
       inlined from 'sci_handle_errors' at drivers/tty/serial/sh-sci.c:940:7:
   include/linux/tty_flip.h:27:53: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      27 |                         *flag_buf_ptr(tb, tb->used) = flag;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   In file included from include/linux/serial_core.h:29,
                    from include/linux/serial_sci.h:6,
                    from drivers/tty/serial/sh-sci.c:46:
   include/linux/tty.h: In function 'sci_handle_errors':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_handle_errors' at drivers/tty/serial/sh-sci.c:940:7:
   include/linux/tty_flip.h:28:47: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      28 |                 *char_buf_ptr(tb, tb->used++) = ch;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h: In function 'sci_handle_errors':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_handle_errors' at drivers/tty/serial/sh-sci.c:950:7:
   include/linux/tty_flip.h:27:53: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      27 |                         *flag_buf_ptr(tb, tb->used) = flag;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/tty.h: In function 'sci_handle_errors':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_handle_errors' at drivers/tty/serial/sh-sci.c:950:7:
   include/linux/tty_flip.h:28:47: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      28 |                 *char_buf_ptr(tb, tb->used++) = ch;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h: In function 'sci_handle_errors':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_handle_errors' at drivers/tty/serial/sh-sci.c:960:7:
   include/linux/tty_flip.h:27:53: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      27 |                         *flag_buf_ptr(tb, tb->used) = flag;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/tty.h: In function 'sci_handle_errors':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_handle_errors' at drivers/tty/serial/sh-sci.c:960:7:
   include/linux/tty_flip.h:28:47: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      28 |                 *char_buf_ptr(tb, tb->used++) = ch;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h: In function 'sci_handle_errors':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_receive_chars' at drivers/tty/serial/sh-sci.c:906:5:
   include/linux/tty_flip.h:27:53: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      27 |                         *flag_buf_ptr(tb, tb->used) = flag;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/tty.h: In function 'sci_receive_chars':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_receive_chars' at drivers/tty/serial/sh-sci.c:906:5:
   include/linux/tty_flip.h:28:47: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      28 |                 *char_buf_ptr(tb, tb->used++) = ch;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h: In function 'sci_receive_chars':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_receive_chars' at drivers/tty/serial/sh-sci.c:883:5:
   include/linux/tty_flip.h:27:53: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      27 |                         *flag_buf_ptr(tb, tb->used) = flag;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/tty.h: In function 'sci_receive_chars':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'sci_receive_chars' at drivers/tty/serial/sh-sci.c:883:5:
   include/linux/tty_flip.h:28:47: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      28 |                 *char_buf_ptr(tb, tb->used++) = ch;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h: In function 'sci_receive_chars':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~


vim +/flags +88 arch/arm64/include/asm/irqflags.h

fb9bd7d6df81ddf Marc Zyngier 2012-03-05  82  
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  83  /*
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  84   * restore saved IRQ state
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  85   */
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  86  static inline void arch_local_irq_restore(unsigned long flags)
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  87  {
fb9bd7d6df81ddf Marc Zyngier 2012-03-05 @88  	asm volatile(
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  89  		"msr	daif, %0		// arch_local_irq_restore"
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  90  	:
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  91  	: "r" (flags)
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  92  	: "memory");
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  93  }
fb9bd7d6df81ddf Marc Zyngier 2012-03-05  94  

:::::: The code at line 88 was first introduced by commit
:::::: fb9bd7d6df81ddf1e7ab6648ac89ddbe0625b26b arm64: IRQ handling

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
