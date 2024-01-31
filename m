Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E151D78B7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706715801; cv=none; b=e9iH/bF8EGfh7Ewplnl4ynoWy9IkSpj95591XxW0FgNZskDrGOJd7h+xJas6RiieDl129syjMkfoTX2VDimMqrKqRBacd/ozHSdo7UlhmCcK0/MwMEVhI1PHUm9kOmu/4YOMz9CVYvOUTSxhbDaG2mN8okVI/N+V1Wvx+hAxoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706715801; c=relaxed/simple;
	bh=colTzSGoGJIABDAEw1U2lpC2Xxa1RSJJuql/A30CHSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SDQlRCmob7z2nFodQovlD+freT3O/O7TGkvRh6oPpDUL4LsTDRsuB/P+XcXzJ9L44aSJl4GsWH2PRaLBEJZSry6gWM9xxFnElJIFxGFdyd8y1/UgqnHejCif10ptc3pV3RuhkvX+CWSGT9Epmhe0FAr6AKhyZca8OhBdmHMdbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AiMgnYCX; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiMgnYCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706715797; x=1738251797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=colTzSGoGJIABDAEw1U2lpC2Xxa1RSJJuql/A30CHSc=;
  b=AiMgnYCXNNVMXjlywkH/VQIcK/+iOGiuF1DynVL2yUxo5D8ytm6yPzF7
   A5T2bBMRDAcu4ssd2CUAnJ7vJdxJYtlpg+wDHUYkr0qMkDryaSO8+QAAl
   P569rww9oMYP8R+GvBlJv3kklwZYtrKiIyiM/oFGmtiLgKpx/PGEfKNP9
   +bewAsqWGqlgEySrZSPvUclTbykL8qZ59JvpfXtQviXqWUer8T0Mm1Uaw
   dubeoOUnW5io1G3pbI35mfsrEdcx2n9Vcz8pgKgK7jzpAt3MaIksxjPcD
   D4GYbuI3HXglCK8GjIU0h8LCLZ9QhculmU8MzhyYhhoW+dVDA3TJuEC0M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407352902"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="407352902"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 07:43:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="907932163"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="907932163"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2024 07:43:15 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVCk5-0001hU-1q;
	Wed, 31 Jan 2024 15:43:13 +0000
Date: Wed, 31 Jan 2024 23:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2662/21599]
 arch/arm64/include/asm/irqflags.h:88:9: warning: 'flags' may be used
 uninitialized
Message-ID: <202401312337.31e2xc48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0ec2c5ee4e0f8c1bdd76fa1b5f9eb0cf68d4d62d
commit: 9dae7e237a64858407b7626260bad53aa13c9198 [2662/21599] serial: sh-sci: Fix locking in sci_submit_rx()
config: arm64-randconfig-002-20240130 (https://download.01.org/0day-ci/archive/20240131/202401312337.31e2xc48-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401312337.31e2xc48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401312337.31e2xc48-lkp@intel.com/

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
