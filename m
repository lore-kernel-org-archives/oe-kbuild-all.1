Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E8820B810
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888721; cv=none; b=u+puVWf4UnbiTBDUIqDP+0qO/m1wn3NQXESSfdCIoWG31OZEs1dq2hRN8jU+9QXIrsuw8g+hnA5odTv2h2xufbxgJtqFvMzHfG2G0JUVNvrxvOWwSNt47WPFz3WeU6FpMZ6i/jDXG5vQ7spWXBF9+jTTcF2PClvMthz/1NFbf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888721; c=relaxed/simple;
	bh=r484KxsUMtzi6o0VmVAW79DEw8f07AIYKy9+bWxalTc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EI+L3U2lbxGGKbqGCuwlePo+FnzsFKfFp9BxOAjW0XhuxswpoUkXDlNbhmQMFpC3ZRzQ6ol820fj+JgxgGxJl5OUGmKgUybF/A1H68dgqrwsOuLPDOFGf0uf7UpXn7x+wW6zWVqM2ahWJqXoiqkw4LtXwGiZpI4EqxgJ1qc5OXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2+Tio8o; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2+Tio8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767888720; x=1799424720;
  h=date:from:to:cc:subject:message-id;
  bh=r484KxsUMtzi6o0VmVAW79DEw8f07AIYKy9+bWxalTc=;
  b=g2+Tio8o2uv+zK7E20n3WB6nLMuCtpHGY9/Tu4KON9WIzf6pBYMEUfhd
   aoy71mjx5P1C0DUs4S8ZT8kdEKybQMuC2nxosSqASFEOFpiOhe8pBRJmO
   8/mzWzvIgGm3HaWUtlNSRfRvk1h2um5eqN1QUPrNRq1m37v92dJcLogTC
   5l7w38rc+iJMCN2nZKxxg6zWkpc6zEcaghcgJ7fV+L7szzsJgvCvZfDQq
   ka3JCHcZYSSqElw+d6t1CYmuH/X01mGLVN0KP3c/LW5vFVA3UwL4Ai7l9
   FDa24ORKEd3ltsrm84GyJdffFctNh4a2Y3/DHzftSFLK1qzRm9K8LzUHm
   g==;
X-CSE-ConnectionGUID: 9HLAvC4wQMSskY8lRKaXnA==
X-CSE-MsgGUID: jneaJ9GORoWtosbDyMAgKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79910401"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="79910401"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 08:11:59 -0800
X-CSE-ConnectionGUID: VyX0AuH+QZ2nO2/bfcTvRQ==
X-CSE-MsgGUID: XwgFxE1ZTxmVUhMgGSDnHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="234410565"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jan 2026 08:11:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdsc7-000000004w9-1Mse;
	Thu, 08 Jan 2026 16:11:55 +0000
Date: Fri, 09 Jan 2026 00:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/8250/8250_port.c:2573:28: warning:
 initialization of 'struct tty_struct *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202601090059.ne64DU2E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: b339809edda15939e7d46b429c420c2bfe4ad946 serial: 8250: use guard()s
date:   5 months ago
config: mips-randconfig-r051-20260108 (https://download.01.org/0day-ci/archive/20260109/202601090059.ne64DU2E-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090059.ne64DU2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090059.ne64DU2E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/tty/serial/8250/8250_port.c:14:
   drivers/tty/serial/8250/8250_port.c: In function 'serial8250_update_uartclk':
   include/linux/cleanup.h:290:2: error: unknown type name 'class_tty_port_tty_t'; did you mean 'class_uart_port_lock_t'?
     290 |  class_##_name##_t var __cleanup(class_##_name##_destructor) = \
         |  ^~~~~~
   include/linux/cleanup.h:420:7: note: in expansion of macro 'CLASS'
     420 |  for (CLASS(_name, scope)(args);     \
         |       ^~~~~
   include/linux/cleanup.h:429:2: note: in expansion of macro '__scoped_guard'
     429 |  __scoped_guard(_name, __UNIQUE_ID(label), args)
         |  ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:2572:2: note: in expansion of macro 'scoped_guard'
    2572 |  scoped_guard(tty_port_tty, tport) {
         |  ^~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:2572:2: error: cleanup argument not a function
   In file included from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/tty/serial/8250/8250_port.c:14:
   include/linux/cleanup.h:291:3: error: implicit declaration of function 'class_tty_port_tty_constructor'; did you mean 'class_uart_port_lock_constructor'? [-Werror=implicit-function-declaration]
     291 |   class_##_name##_constructor
         |   ^~~~~~
   include/linux/cleanup.h:420:7: note: in expansion of macro 'CLASS'
     420 |  for (CLASS(_name, scope)(args);     \
         |       ^~~~~
   include/linux/cleanup.h:429:2: note: in expansion of macro '__scoped_guard'
     429 |  __scoped_guard(_name, __UNIQUE_ID(label), args)
         |  ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:2572:2: note: in expansion of macro 'scoped_guard'
    2572 |  scoped_guard(tty_port_tty, tport) {
         |  ^~~~~~~~~~~~
   include/linux/cleanup.h:420:2: error: declaration of non-variable 'class_tty_port_tty_constructor' in 'for' loop initial declaration
     420 |  for (CLASS(_name, scope)(args);     \
         |  ^~~
   include/linux/cleanup.h:429:2: note: in expansion of macro '__scoped_guard'
     429 |  __scoped_guard(_name, __UNIQUE_ID(label), args)
         |  ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:2572:2: note: in expansion of macro 'scoped_guard'
    2572 |  scoped_guard(tty_port_tty, tport) {
         |  ^~~~~~~~~~~~
   include/linux/cleanup.h:403:28: error: implicit declaration of function 'class_tty_port_tty_lock_ptr'; did you mean 'class_uart_port_lock_lock_ptr'? [-Werror=implicit-function-declaration]
     403 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^~~~~~
   include/linux/cleanup.h:421:7: note: in expansion of macro '__guard_ptr'
     421 |       __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name); \
         |       ^~~~~~~~~~~
   include/linux/cleanup.h:429:2: note: in expansion of macro '__scoped_guard'
     429 |  __scoped_guard(_name, __UNIQUE_ID(label), args)
         |  ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:2572:2: note: in expansion of macro 'scoped_guard'
    2572 |  scoped_guard(tty_port_tty, tport) {
         |  ^~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_tty_port_tty_is_conditional' undeclared (first use in this function); did you mean 'class_uart_port_lock_is_conditional'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:421:38: note: in expansion of macro '__is_cond_ptr'
     421 |       __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name); \
         |                                      ^~~~~~~~~~~~~
   include/linux/cleanup.h:429:2: note: in expansion of macro '__scoped_guard'
     429 |  __scoped_guard(_name, __UNIQUE_ID(label), args)
         |  ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:2572:2: note: in expansion of macro 'scoped_guard'
    2572 |  scoped_guard(tty_port_tty, tport) {
         |  ^~~~~~~~~~~~
   include/linux/cleanup.h:405:30: note: each undeclared identifier is reported only once for each function it appears in
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:421:38: note: in expansion of macro '__is_cond_ptr'
     421 |       __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name); \
         |                                      ^~~~~~~~~~~~~
   include/linux/cleanup.h:429:2: note: in expansion of macro '__scoped_guard'
     429 |  __scoped_guard(_name, __UNIQUE_ID(label), args)
         |  ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:2572:2: note: in expansion of macro 'scoped_guard'
    2572 |  scoped_guard(tty_port_tty, tport) {
         |  ^~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:2573:28: error: implicit declaration of function 'scoped_tty'; did you mean 'stop_tty'? [-Werror=implicit-function-declaration]
    2573 |   struct tty_struct *tty = scoped_tty();
         |                            ^~~~~~~~~~
         |                            stop_tty
>> drivers/tty/serial/8250/8250_port.c:2573:28: warning: initialization of 'struct tty_struct *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_8250
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
   Selected by [y]:
   - ECONET [=y]


vim +2573 drivers/tty/serial/8250/8250_port.c

  2562	
  2563	/*
  2564	 * Note in order to avoid the tty port mutex deadlock don't use the next method
  2565	 * within the uart port callbacks. Primarily it's supposed to be utilized to
  2566	 * handle a sudden reference clock rate change.
  2567	 */
  2568	void serial8250_update_uartclk(struct uart_port *port, unsigned int uartclk)
  2569	{
  2570		struct tty_port *tport = &port->state->port;
  2571	
  2572		scoped_guard(tty_port_tty, tport) {
> 2573			struct tty_struct *tty = scoped_tty();
  2574	
  2575			guard(rwsem_write)(&tty->termios_rwsem);
  2576			guard(mutex)(&tport->mutex);
  2577	
  2578			if (port->uartclk == uartclk)
  2579				return;
  2580	
  2581			port->uartclk = uartclk;
  2582	
  2583			if (!tty_port_initialized(tport))
  2584				return;
  2585	
  2586			serial8250_do_set_termios(port, &tty->termios, NULL);
  2587	
  2588			return;
  2589		}
  2590		guard(mutex)(&tport->mutex);
  2591		port->uartclk = uartclk;
  2592	}
  2593	EXPORT_SYMBOL_GPL(serial8250_update_uartclk);
  2594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
