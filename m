Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727A213E69
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601657; cv=none; b=MFftlp8FphrIaHa6Vqi5rPnfpXUb9jXy+wzw0F1v4yY9tsz3J6yRqKqxPKWF/zjDTWsMQ6A+826XrTkMlGqA0x7U98DGwj3Uo28bSOMW0nCgC4H73BF7g00afkPXXw7RWu/kjnsAaNQIN9LdF3SOja+3tYoLgeZQ1Dbm2OTf/7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601657; c=relaxed/simple;
	bh=cyJqdhngFr5Xic+bFug+DQ119qkpy/FrbVMQdGXuhNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYFWSgHcizGyx3abwiM8QywGcflx36f8YIN7IgYRhBvpGcjj5vK4BSaJL8eWdL1ShJ0EyBl3tVIVLv/P2K2yr124z1OfJhIpygREv6YGk9sXmrhNGvekezWGpFGlbXf4UXK/+7KwhkQ//bJDL6UrgZJFi/T/Oka4qEfAM6QT39U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQeg0NpP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQeg0NpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746601656; x=1778137656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cyJqdhngFr5Xic+bFug+DQ119qkpy/FrbVMQdGXuhNc=;
  b=GQeg0NpPHVDj21Mf20gY+mTRdK1upEQyshZ4lspnMhdxma4zPtFSdAE9
   W4GePYQJ8zS4wlYZBCTafsenca9gzYwh8Roc9LtnmgipZuGRDSN1mcRuy
   6JTl7aKRllb8t+LOlpSgYFS62uPoxol/ZALzL6jT2Foqs+Yt6jUyCc0VW
   zBR1tEwtEOD+UBCnYtV+dQY5KYHAq6eAUP/zC6h4XiFIn+Kl8R1cJfAjK
   T2poxGYc5lzxP6WpKFRLZZZiqMsqoyNdbLrSj8AKVxKqP/93AbB+R8rkT
   rrzj7RswAXSsWD68R+inHcsS2wOgDhY+rAI7/TNJOOIE29+2eHOxJfe/7
   g==;
X-CSE-ConnectionGUID: 4OsSwTofSASn4r8hwtZQkA==
X-CSE-MsgGUID: LGin4QQ1RH2+PPBh9yk7Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="73702374"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="73702374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:07:32 -0700
X-CSE-ConnectionGUID: 63BWkeOHQE6qx1dH7BYRSg==
X-CSE-MsgGUID: gZBckvXAR9Kz/24HL+JZJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135767236"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 00:07:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYsK-0007GL-2L;
	Wed, 07 May 2025 07:07:28 +0000
Date: Wed, 7 May 2025 15:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 84/87] drivers/tty/serial/serial_core.c:3082:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202505071557.M8AL5Nmw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6c308d0b04c8c17ab39fcf6d4ed9a9033efc363f
commit: b3aeb6fa508b1680c9567f44ecbda7b143fddb9e [84/87] serial: drv->state -> xarray
config: i386-randconfig-r053-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071557.M8AL5Nmw-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071557.M8AL5Nmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071557.M8AL5Nmw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:3082:3: error: cannot jump from this goto statement to its label
    3082 |                 goto err_free_state;
         |                 ^
   drivers/tty/serial/serial_core.c:3088:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    3088 |         guard(mutex)(&port->mutex);
         |         ^
   include/linux/cleanup.h:338:15: note: expanded from macro 'guard'
     338 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:105:1: note: expanded from here
     105 | __UNIQUE_ID_guard619
         | ^
   1 error generated.


vim +3082 drivers/tty/serial/serial_core.c

  3056	
  3057	/**
  3058	 * serial_core_add_one_port - attach a driver-defined port structure
  3059	 * @drv: pointer to the uart low level driver structure for this port
  3060	 * @uport: uart port structure to use for this port.
  3061	 *
  3062	 * Context: task context, might sleep
  3063	 *
  3064	 * This allows the driver @drv to register its own uart_port structure with the
  3065	 * core driver. The main purpose is to allow the low level uart drivers to
  3066	 * expand uart_port, rather than having yet more levels of structures.
  3067	 * Caller must hold port_mutex.
  3068	 */
  3069	static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *uport)
  3070	{
  3071		struct uart_state *state;
  3072		struct tty_port *port;
  3073		struct device *tty_dev;
  3074		int num_groups, ret;
  3075	
  3076		state = kzalloc(sizeof(*state), GFP_KERNEL);
  3077		if (!state)
  3078			return -ENOMEM;
  3079	
  3080		ret = xa_err(xa_store(&drv->state, uport->line, state, GFP_KERNEL));
  3081		if (ret)
> 3082			goto err_free_state;
  3083	
  3084		port = &state->port;
  3085		tty_port_init(port);
  3086		port->ops = &uart_port_ops;
  3087	
  3088		guard(mutex)(&port->mutex);
  3089		/* Link the port to the driver state table and vice versa */
  3090		atomic_set(&state->refcount, 1);
  3091		init_waitqueue_head(&state->remove_wait);
  3092		state->uart_port = uport;
  3093		uport->state = state;
  3094	
  3095		/*
  3096		 * If this port is in use as a console then the spinlock is already
  3097		 * initialised.
  3098		 */
  3099		if (!uart_console_registered(uport))
  3100			uart_port_spin_lock_init(uport);
  3101	
  3102		state->pm_state = UART_PM_STATE_UNDEFINED;
  3103		uart_port_set_cons(uport, drv->cons);
  3104		uport->minor = drv->tty_driver->minor_start + uport->line;
  3105		uport->name = kasprintf(GFP_KERNEL, "%s%d", drv->dev_name,
  3106					drv->tty_driver->name_base + uport->line);
  3107		if (!uport->name)
  3108			return -ENOMEM;
  3109	
  3110		if (uport->cons && uport->dev)
  3111			of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
  3112	
  3113		uart_configure_port(drv, state, uport);
  3114	
  3115		port->console = uart_console(uport);
  3116	
  3117		num_groups = 2;
  3118		if (uport->attr_group)
  3119			num_groups++;
  3120	
  3121		uport->tty_groups = kcalloc(num_groups, sizeof(*uport->tty_groups),
  3122					    GFP_KERNEL);
  3123		if (!uport->tty_groups)
  3124			return -ENOMEM;
  3125	
  3126		uport->tty_groups[0] = &tty_dev_attr_group;
  3127		if (uport->attr_group)
  3128			uport->tty_groups[1] = uport->attr_group;
  3129	
  3130		/* Ensure serdev drivers can call serdev_device_open() right away */
  3131		uport->flags &= ~UPF_DEAD;
  3132	
  3133		/*
  3134		 * Register the port whether it's detected or not.  This allows
  3135		 * setserial to be used to alter this port's parameters.
  3136		 */
  3137		tty_dev = tty_port_register_device_attr_serdev(port, drv->tty_driver,
  3138				uport->line, uport->dev, &uport->port_dev->dev, port,
  3139				uport->tty_groups);
  3140		if (!IS_ERR(tty_dev)) {
  3141			device_set_wakeup_capable(tty_dev, 1);
  3142		} else {
  3143			uport->flags |= UPF_DEAD;
  3144			dev_err(uport->dev, "Cannot register tty device on line %d\n",
  3145			       uport->line);
  3146		}
  3147	
  3148		return 0;
  3149	err_free_state:
  3150		kfree(state);
  3151		return ret;
  3152	}
  3153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
