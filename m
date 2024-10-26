Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF2217F2E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 01:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729905886; cv=none; b=XFadNO5P8h0PAIZSTiU9rWtn836PorFfVhrKzRRNDfDk8L5AxcNmjKr4pVsvLmfzqbUhEdKgceKZVOF0cysHESQbLcn8gsiXH0j90mFW42qHZqkqKRCWY6woPOLk36uQw3qi8Rfz3uufaOqgGQYolR/tIAUfPBImRYm3fy+0GOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729905886; c=relaxed/simple;
	bh=BcAGzrUF+pcdvnuIvWMqAH/PJ4OuOJAj7I2MIHBCMmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQeAgWZ3toR4kY+9POzBdryWrU08KLSvtTH6TvI1Yn7Q/5BNQM7D9eBC4hgsGcO0rbSSoPKDFbJl9Dv+Y6V2BSrIkBpgsaysgi5CrP/MiX9BAPAQEsuFiqxvz7PcW/3zrj6R2qfI5mGbPlHfO4/4IlnmTD/1zoIDH1GV2qZS3S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwIrt7ft; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwIrt7ft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729905882; x=1761441882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BcAGzrUF+pcdvnuIvWMqAH/PJ4OuOJAj7I2MIHBCMmU=;
  b=YwIrt7ftQA8LJE7MECndn1TPc64Q/hlCOo6RxECq8kFpzrqVutza8lOL
   XIA9/BSyh7L8dZwHleIQpFYIgJtp9+sHR2XxZ8KQG4FNpoTYESIrkBCX9
   jh88rlXQmj11udT8ghOw7ResG4p9IdqVRKxVRXFAhTgiYCoIzk5AuSAjY
   rFLM0IYb0mEtyERCagz0Qix67I7TIulocI4Yk8BJf3wh072XYH1Jw+f8E
   FuHd5oiUjfwFaAXu3PdqSipv7JJpfqWUJaEQfIEW5jBP1LcZlidWTRxnF
   4wuG+ibMH0DmAHmpM4WAJ+jwwlq1Z/WULXPdkCmw+97dfMi0wfu9Z1wwq
   Q==;
X-CSE-ConnectionGUID: mwimNzeFTJe90G6URC3QgQ==
X-CSE-MsgGUID: Ts9rDgJNS+KpOykVafFbkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33284402"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33284402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 18:24:42 -0700
X-CSE-ConnectionGUID: ZsDw7JVDQk6qDZ6/PSQwKw==
X-CSE-MsgGUID: fnwdzhnwQROpqwyIFteauQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="81183319"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2024 18:24:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4VXh-000Z7U-39;
	Sat, 26 Oct 2024 01:24:37 +0000
Date: Sat, 26 Oct 2024 09:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2662/23859]
 arch/arm64/include/asm/irqflags.h:88:9: warning: 'flags' may be used
 uninitialized
Message-ID: <202410260911.Qmhlx5mF-lkp@intel.com>
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
head:   d2a40c79ddef4b96b8a7a396bd7273121b1b4a5c
commit: 9dae7e237a64858407b7626260bad53aa13c9198 [2662/23859] serial: sh-sci: Fix locking in sci_submit_rx()
config: arm64-randconfig-002-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260911.Qmhlx5mF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260911.Qmhlx5mF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260911.Qmhlx5mF-lkp@intel.com/

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

fb9bd7d6df81dd Marc Zyngier 2012-03-05  82  
fb9bd7d6df81dd Marc Zyngier 2012-03-05  83  /*
fb9bd7d6df81dd Marc Zyngier 2012-03-05  84   * restore saved IRQ state
fb9bd7d6df81dd Marc Zyngier 2012-03-05  85   */
fb9bd7d6df81dd Marc Zyngier 2012-03-05  86  static inline void arch_local_irq_restore(unsigned long flags)
fb9bd7d6df81dd Marc Zyngier 2012-03-05  87  {
fb9bd7d6df81dd Marc Zyngier 2012-03-05 @88  	asm volatile(
fb9bd7d6df81dd Marc Zyngier 2012-03-05  89  		"msr	daif, %0		// arch_local_irq_restore"
fb9bd7d6df81dd Marc Zyngier 2012-03-05  90  	:
fb9bd7d6df81dd Marc Zyngier 2012-03-05  91  	: "r" (flags)
fb9bd7d6df81dd Marc Zyngier 2012-03-05  92  	: "memory");
fb9bd7d6df81dd Marc Zyngier 2012-03-05  93  }
fb9bd7d6df81dd Marc Zyngier 2012-03-05  94  

:::::: The code at line 88 was first introduced by commit
:::::: fb9bd7d6df81ddf1e7ab6648ac89ddbe0625b26b arm64: IRQ handling

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
