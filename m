Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2AB35B137
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 05:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786165836; cv=none; b=nvsbgc6BiCvTPlfB+CFxmxOE23St71NAfsD5ImQ/vEG7fX74zTL8fpN0zDMPZ1OSyLbRccLQjs1uq+xHuBH0zS5S2tZ6o9/m6aMQJ7AVydZECY9FPl79pcZdVxEi8uhzvG+welS1cjpLfbNxU0Ir3bHCKzb0vfGzCfxFljPtOiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786165836; c=relaxed/simple;
	bh=iGuTNRH3Pxq62Ajg+9o7DWO+yQS3oYAIrLZeIusV/rU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J/a3ZkO2OK/b59W8QlMtArjHIoigaHuT2CWSGZYithOK0wgpDxpH0ABMFQq8SUOqksFAiIQ3hQ842jsn73Nqz/tBqcREfmVYtaTK+hx2BSgLVZKW40EBrXRVTIRBPDh/99W04IdNxH8mC04SHVKT5WgCgKO4zjLZBfwErjBaJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJ/8d0iv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJ/8d0iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786165834; x=1817701834;
  h=date:from:to:cc:subject:message-id;
  bh=iGuTNRH3Pxq62Ajg+9o7DWO+yQS3oYAIrLZeIusV/rU=;
  b=jJ/8d0ivP6zwYtyx0P0BsvyUuC62JigP62K/uuqJRe2kQl95XnIcUB7i
   i/TvyPiBUttLItXbtT1ofR834la2OsVbtODjhjcoY+2P2OcdoRo+LSL3/
   rjYmHjCN7CzVUAXIKUHGKqNGcU/87fc7E+oLdIDUiTPVSl1x8wZxvs37y
   izknSvXL/XR48u6PH3WDrzv+DEqVZpVVIbPOk0Yq2Z57b0fWOSLjRdvUw
   J1iqMG5bGpq/pBKHuDZ47hZ0PtqO/fUOQskcuYHWglM86AbMWA1Y5Lwet
   dQSypkEZ0LYPhXVaHax3W5JjZ4PeHmHSp7oj6clc+5sbpz7F/z1SyAz45
   A==;
X-CSE-ConnectionGUID: hdpLXyR1RNeUOl/WchfPkw==
X-CSE-MsgGUID: 3FUKYcXqTuuAMgcLpo1YGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86648694"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86648694"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 22:10:33 -0700
X-CSE-ConnectionGUID: Vm5BMoeyRgS9kXHzfW4LTw==
X-CSE-MsgGUID: Nvgz8Fy+Qdegn5rtCYQITQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="259257681"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 22:10:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsZKG-00000000JmK-46rt;
	Sat, 08 Aug 2026 05:10:28 +0000
Date: Sat, 08 Aug 2026 13:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/8250/8250_port.c:2572:2: error: use of
 undeclared identifier 'class_tty_port_tty_t'
Message-ID: <202608081221.JTg0gz0g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jiri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: b339809edda15939e7d46b429c420c2bfe4ad946 serial: 8250: use guard()s
date:   12 months ago
config: mips-randconfig-r122-20260808 (https://download.01.org/0day-ci/archive/20260808/202608081221.JTg0gz0g-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608081221.JTg0gz0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b339809edda1 ("serial: 8250: use guard()s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608081221.JTg0gz0g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_port.c:2572:2: error: use of undeclared identifier 'class_tty_port_tty_t'
    2572 |         scoped_guard(tty_port_tty, tport) {
         |         ^
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:420:7: note: expanded from macro '__scoped_guard'
     420 |         for (CLASS(_name, scope)(args);                                 \
         |              ^
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:35:1: note: expanded from here
      35 | class_tty_port_tty_t
         | ^
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
   <scratch space>:41:1: note: expanded from here
      41 | class_tty_port_tty_lock_ptr
         | ^
>> drivers/tty/serial/8250/8250_port.c:2572:2: error: use of undeclared identifier 'scope'
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:421:27: note: expanded from macro '__scoped_guard'
     421 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                  ^
>> drivers/tty/serial/8250/8250_port.c:2572:2: error: use of undeclared identifier 'class_tty_port_tty_is_conditional'
   include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:421:38: note: expanded from macro '__scoped_guard'
     421 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^
   include/linux/cleanup.h:405:30: note: expanded from macro '__is_cond_ptr'
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^
   <scratch space>:43:1: note: expanded from here
      43 | class_tty_port_tty_is_conditional
         | ^
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
