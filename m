Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AC145A0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732802592; cv=none; b=grrcGyKDgPXNfc25RjdlRZqKH2IrLWNo1kDVIX1nIj0EDCul47v213W3YfgwF0l9slaxXCn74cvNfMhEMzuhaA73p5V3bdE7V5thA85wZvoSGSI88yJdvKpoIJtPR5Mv+fchfXTHd25h3oCkVFuMk6g571DLaWcvb8Ns0AUjhCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732802592; c=relaxed/simple;
	bh=knB8upzncjNN/MiHCH87UawYXgvg7FALKHOVV5JKXNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwtJXUlK0lhxxSnbTrJdvI0DSd2pX8mW2A0nYPfpsMqJFJYh1YPAk57Lw70jXtZp7pt0+nPe9ttBKLLh2yImD9dP5uTpaZDDJMVy2R1Vvmip39p+XUoq4/GECw7bPqkMJsK/mZoFfxmD1AO7977dFid7s5z8SLqbTPKt57+xHsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Th0rz6e2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Th0rz6e2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732802588; x=1764338588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=knB8upzncjNN/MiHCH87UawYXgvg7FALKHOVV5JKXNo=;
  b=Th0rz6e2a2GoKpvhkulbL9qJBHtuJrc5ZIXPUVlYNFv+LvOVsjK5KRDM
   WxA1nRG4VD3V7IinDyGnZdVUgJ38rY4smKcFdsK3l/9lB2mo2FHUHAdsn
   KsrJ+NTpsVbH68hO/wxWPGo/YnWLfdIVz5t1P298jsBLhmG5vSLZof3MK
   2kptKHHfdg865eA06VnbUic5nyKvDCyLT7s2zIr9m5chFIXGnUAS9Qh7G
   MiTsl+ha6SSxi0OD4UB88yBvthQDH4+tlt0jvxIOb0ooB8fPY0+jImTX8
   24pr/wzd4fdxCIJJizB/+UaMGcjcYDGG25OdjGRbk0+zqc91uI18HmZwd
   g==;
X-CSE-ConnectionGUID: gV2d2uP8QmSUnTRw0V6jBw==
X-CSE-MsgGUID: XdUlnuMuTEau5Lk2GKjnxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44422136"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="44422136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 06:03:07 -0800
X-CSE-ConnectionGUID: ytxwdItKQZGMF3P87Kf8fA==
X-CSE-MsgGUID: X3tz9yLgR7aFhID1haKcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92572745"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2024 06:03:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGf6m-0009dv-22;
	Thu, 28 Nov 2024 14:03:04 +0000
Date: Thu, 28 Nov 2024 22:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1315/1315]
 arch/arm64/include/asm/irqflags.h:88:9: warning: 'flags' may be used
 uninitialized
Message-ID: <202411282104.FiXTFZUn-lkp@intel.com>
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
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 9dae7e237a64858407b7626260bad53aa13c9198 [1315/1315] serial: sh-sci: Fix locking in sci_submit_rx()
config: arm64-randconfig-001-20241128 (https://download.01.org/0day-ci/archive/20241128/202411282104.FiXTFZUn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282104.FiXTFZUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282104.FiXTFZUn-lkp@intel.com/

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
