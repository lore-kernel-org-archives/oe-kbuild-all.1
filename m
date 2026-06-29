Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8443B5847
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 22:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782773689; cv=none; b=As8Gb1JvV8ZPl30gNQNZuZLaob/FwuqKODUyQdUKJgZbxQFW9/6/u7SJmIPAjOxmSk8zx05/0IQPZ3ztwDmps9bB6zdTirwYgGy+lq2Fdp5rUidaOKUewB+4DN7pwOWF4Jv+Mef/karekE1itr9Uf6n9AqPESgnucVnGl3qs+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782773689; c=relaxed/simple;
	bh=S2pQLdTbLeXZxGfN3D77nz6a7g9e3HVEdXYN9mpQOY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qVfBOVNrLdIB6BJaEnmoLheQwWhRz93XwBH/RAoQd3EHhRZMQK9wHTTSEhbkIK+DD2wvXO1Gy9t7CRtjFmccyOCbX8MxnS56edF2yS6STYn7Vm8vGi4kN6oZTMrgqWoPEq5vd6UriFnJHjDBNAkxM8RjNE37cnN1NIPW/m9i6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgW8Oo15; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgW8Oo15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782773688; x=1814309688;
  h=date:from:to:cc:subject:message-id;
  bh=S2pQLdTbLeXZxGfN3D77nz6a7g9e3HVEdXYN9mpQOY8=;
  b=AgW8Oo15qf1sVkoENJvusE17IoT3ZrFIY2UBfBQF0p7QMoZWEvplDyae
   igMLsTWn/f9de7qiUXNesJfyO1tDbSx1IPjcrEcZZm/ta578RAk7mkSWx
   iXTA17lJ8/mc1BIKZUmwrmdBz2Zh4u7e0kPMp1k1rRB6k89xgVNOa5yAK
   LWP06S0QyWXh0ox/bGNLo/DUPcnf+dt32wIjYborAvMatGskHFzPlI/ZZ
   pEa8rcgY/s/rGV8dgk0llbSI8Ahj+ptr4VVUZDdQj+tQJTTovSrGJG+Kt
   MaSSVi8ueWtHdq0peUzpFbD5K8Dm0rlR1ASr7Z/9dkOLWxeYH3l/+AIyv
   A==;
X-CSE-ConnectionGUID: zbHKdnVlRjuRVFZ+lnEbUQ==
X-CSE-MsgGUID: LTppXsDqRIKFtp9axR5M5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87392188"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="87392188"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 15:54:47 -0700
X-CSE-ConnectionGUID: GQq8PZxpRWiHs6RlnuSIvw==
X-CSE-MsgGUID: ddS7j2YUTP6PkUU8Ayf/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="247636071"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 15:54:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weKsE-000000007oz-49PQ;
	Mon, 29 Jun 2026 22:54:42 +0000
Date: Tue, 30 Jun 2026 06:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/8250/8250_port.c:2572:2: error: use of
 undeclared identifier 'class_tty_port_tty_t'
Message-ID: <202606300621.6Sh8WrAx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jiri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: b339809edda15939e7d46b429c420c2bfe4ad946 serial: 8250: use guard()s
date:   11 months ago
config: mips-randconfig-r073-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300621.6Sh8WrAx-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300621.6Sh8WrAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b339809edda1 ("serial: 8250: use guard()s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300621.6Sh8WrAx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_port.c:2572:2: error: use of undeclared identifier 'class_tty_port_tty_t'
    2572 |         scoped_guard(tty_port_tty, tport) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:420:7: note: expanded from macro '__scoped_guard'
     420 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~~~~~~~~~~~~
   <scratch space>:81:1: note: expanded from here
      81 | class_tty_port_tty_t
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_port.c:2572:2: error: call to undeclared function 'class_tty_port_tty_lock_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:421:7: note: expanded from macro '__scoped_guard'
     421 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |              ^
   include/linux/cleanup.h:403:28: note: expanded from macro '__guard_ptr'
     403 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^
   <scratch space>:87:1: note: expanded from here
      87 | class_tty_port_tty_lock_ptr
         | ^
>> drivers/tty/serial/8250/8250_port.c:2572:2: error: use of undeclared identifier 'scope'
    2572 |         scoped_guard(tty_port_tty, tport) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:421:27: note: expanded from macro '__scoped_guard'
     421 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                  ^~~~~
>> drivers/tty/serial/8250/8250_port.c:2572:2: error: use of undeclared identifier 'class_tty_port_tty_is_conditional'
    2572 |         scoped_guard(tty_port_tty, tport) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:421:38: note: expanded from macro '__scoped_guard'
     421 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:405:30: note: expanded from macro '__is_cond_ptr'
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:89:1: note: expanded from here
      89 | class_tty_port_tty_is_conditional
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_port.c:2573:28: error: call to undeclared function 'scoped_tty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2573 |                 struct tty_struct *tty = scoped_tty();
         |                                          ^
   drivers/tty/serial/8250/8250_port.c:2573:28: note: did you mean 'stop_tty'?
   include/linux/tty.h:404:6: note: 'stop_tty' declared here
     404 | void stop_tty(struct tty_struct *tty);
         |      ^
>> drivers/tty/serial/8250/8250_port.c:2573:22: error: incompatible integer to pointer conversion initializing 'struct tty_struct *' with an expression of type 'int' [-Wint-conversion]
    2573 |                 struct tty_struct *tty = scoped_tty();
         |                                    ^     ~~~~~~~~~~~~
   6 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_8250
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
   Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
   Selected by [y]:
   - ECONET [=y]


vim +/class_tty_port_tty_t +2572 drivers/tty/serial/8250/8250_port.c

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
> 2572		scoped_guard(tty_port_tty, tport) {
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
