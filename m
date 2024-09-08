Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF1535D8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 06:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725776857; cv=none; b=n3zpcg7ntpV1GrSyTcZrAj/SyLQJcS0tZJXIVRnhVwm+MyQBWwlUl6xHZtw/M9qar6CTDZusL1DgsCKKKqkn2Xgl5xBB5U6T5c2M1EFNXHFOucXN1nRvM7IRvCBqwmJYAgGQ4mYvjZ/PiDPUe02n3Smem03IN1qBIBnz9gvVAWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725776857; c=relaxed/simple;
	bh=Dt1IjVfqAGjr/hlc2+knymgiJXPZ1W1pJ24HGvGebBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTF2Ltx29ked5mHVF8YJf+HYUVKgvnYuUym5t8Awe9Y9uSVzHMUx2H5e/0nkbbqeX5pGDXaLYhO650iBkqj6fv6Aq22PTJd+P/VfOr6hbsP5m8lcuaiNcy8Dy2TmLwgN/8GyeUide4qn8s3H/zdJh3OseK/0snxQrEFUt96M/gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3S/Qy5C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3S/Qy5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725776855; x=1757312855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dt1IjVfqAGjr/hlc2+knymgiJXPZ1W1pJ24HGvGebBU=;
  b=k3S/Qy5CcPSeveQTbyk7rdsVYlVKLYsKzZY9n8ODe8+i8IDjCYGcLGYT
   ewrxDE0KVXFhlC5yeRF1EslwWE4TwL+EMMdM8x+Tey59LjXLFQupDfOvo
   QZMjELzdg6ytG9aZ9qrTA6sU7IXdKp6BuwF9P5qK+57ZC1fKDoL44FZpI
   +QND4OujW3/82nvPXW+rzEcEHUKckT9/YWl/bePAmf5xXXsrz0dD0rGsa
   D0c74foYk50k+L8KZGhmY9fmfgrVggCOlNOvwqZ3rgV1lVRFr6smyilmU
   HNlg9NswGJBWSs/PVKTe/HBM37X17Cjw/ikJ1+agax26EyIhLoP1UnVWU
   Q==;
X-CSE-ConnectionGUID: Ne28ak3eRiGKEo7NaICVPA==
X-CSE-MsgGUID: uZ6WG+5+QIqGIPWO+WlfSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35082044"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35082044"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 23:27:34 -0700
X-CSE-ConnectionGUID: rJ2T4M2DSeayrsY7lFB3Yg==
X-CSE-MsgGUID: ZDwmx4oCQAyV/ro0tWYbJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="103807689"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Sep 2024 23:27:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snBOU-000DGF-1t;
	Sun, 08 Sep 2024 06:27:30 +0000
Date: Sun, 8 Sep 2024 14:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH next v1 1/2] serial: 8250: Switch to nbcon console
Message-ID: <202409081005.JY8QAN41-lkp@intel.com>
References: <20240905134719.142554-2-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905134719.142554-2-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f1ec92a066b2608e7c971dfce28ebe2d2cdb056e]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/serial-8250-Switch-to-nbcon-console/20240905-214915
base:   f1ec92a066b2608e7c971dfce28ebe2d2cdb056e
patch link:    https://lore.kernel.org/r/20240905134719.142554-2-john.ogness%40linutronix.de
patch subject: [PATCH next v1 1/2] serial: 8250: Switch to nbcon console
config: i386-randconfig-001-20240908 (https://download.01.org/0day-ci/archive/20240908/202409081005.JY8QAN41-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081005.JY8QAN41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081005.JY8QAN41-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_core.c: In function 'univ8250_console_device_lock':
   drivers/tty/serial/8250/8250_core.c:420:9: error: implicit declaration of function '__uart_port_lock_irqsave'; did you mean 'uart_port_lock_irqsave'? [-Werror=implicit-function-declaration]
     420 |         __uart_port_lock_irqsave(up, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         uart_port_lock_irqsave
   drivers/tty/serial/8250/8250_core.c: In function 'univ8250_console_device_unlock':
   drivers/tty/serial/8250/8250_core.c:427:9: error: implicit declaration of function '__uart_port_unlock_irqrestore'; did you mean 'uart_port_unlock_irqrestore'? [-Werror=implicit-function-declaration]
     427 |         __uart_port_unlock_irqrestore(up, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         uart_port_unlock_irqrestore
   drivers/tty/serial/8250/8250_core.c: At top level:
   drivers/tty/serial/8250/8250_core.c:533:27: error: initialization of 'bool (*)(struct console *, struct nbcon_write_context *)' {aka '_Bool (*)(struct console *, struct nbcon_write_context *)'} from incompatible pointer type 'void (*)(struct console *, struct nbcon_write_context *)' [-Werror=incompatible-pointer-types]
     533 |         .write_atomic   = univ8250_console_write_atomic,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:533:27: note: (near initialization for 'univ8250_console.write_atomic')
   drivers/tty/serial/8250/8250_core.c:534:10: error: 'struct console' has no member named 'write_thread'
     534 |         .write_thread   = univ8250_console_write_thread,
         |          ^~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:534:27: warning: initialization of 'int' from 'void (*)(struct console *, struct nbcon_write_context *)' makes integer from pointer without a cast [-Wint-conversion]
     534 |         .write_thread   = univ8250_console_write_thread,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:534:27: note: (near initialization for 'univ8250_console.nbcon_state.counter')
   drivers/tty/serial/8250/8250_core.c:535:10: error: 'struct console' has no member named 'device_lock'
     535 |         .device_lock    = univ8250_console_device_lock,
         |          ^~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:535:27: warning: initialization of 'int' from 'void (*)(struct console *, long unsigned int *)' makes integer from pointer without a cast [-Wint-conversion]
     535 |         .device_lock    = univ8250_console_device_lock,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:535:27: note: (near initialization for 'univ8250_console.nbcon_seq.counter')
   drivers/tty/serial/8250/8250_core.c:536:10: error: 'struct console' has no member named 'device_unlock'
     536 |         .device_unlock  = univ8250_console_device_unlock,
         |          ^~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:536:27: error: initialization of 'struct printk_buffers *' from incompatible pointer type 'void (*)(struct console *, long unsigned int)' [-Werror=incompatible-pointer-types]
     536 |         .device_unlock  = univ8250_console_device_unlock,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_core.c:536:27: note: (near initialization for 'univ8250_console.pbufs')
   drivers/tty/serial/8250/8250_core.c:527:42: warning: missing braces around initializer [-Wmissing-braces]
     527 | static struct console univ8250_console = {
         |                                          ^
   ......
     534 |         .write_thread   = univ8250_console_write_thread,
         |                           {                            }
     535 |         .device_lock    = univ8250_console_device_lock,
         |                           {                           }
   cc1: some warnings being treated as errors


vim +535 drivers/tty/serial/8250/8250_core.c

   526	
   527	static struct console univ8250_console = {
   528		.name		= "ttyS",
   529	#ifdef USE_SERIAL_8250_LEGACY_CONSOLE
   530		.write		= univ8250_console_write,
   531		.flags		= CON_PRINTBUFFER | CON_ANYTIME,
   532	#else
   533		.write_atomic	= univ8250_console_write_atomic,
   534		.write_thread	= univ8250_console_write_thread,
 > 535		.device_lock	= univ8250_console_device_lock,
   536		.device_unlock	= univ8250_console_device_unlock,
   537		.flags		= CON_PRINTBUFFER | CON_ANYTIME | CON_NBCON,
   538	#endif
   539		.device		= uart_console_device,
   540		.setup		= univ8250_console_setup,
   541		.exit		= univ8250_console_exit,
   542		.match		= univ8250_console_match,
   543		.index		= -1,
   544		.data		= &serial8250_reg,
   545	};
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
