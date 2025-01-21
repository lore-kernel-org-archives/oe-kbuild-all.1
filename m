Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C696185935
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737480704; cv=none; b=YOWkAzjM9kpsPhwd5Mw37/IJkAEEKtMqrL9iU0HGLVIfreX2LndNPOwFSrNR4VbJinHC0YGRPWjzvrIKPC7yWv8kpojcduXr3K+ELDAc7MLtQkxYCtYJ4wuC23x0IzcWpbldKA72Hpu2EyDo7nUqiUKrMmfxe/vTfuTz1MpsVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737480704; c=relaxed/simple;
	bh=9bF15o7Uj0Zo9nQKSJVONxkwpUHJ5BksA6LgzqM/XKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IyDU9wM5eN+s+W79+vDFEJc+xq01pvlfkUAPddba61IwEDykEg/Er5xORbLhlNFPNPutfF+eeDNbbhz4r/kptDWMF//61ewBmCF7+HCjsw2ovYumfWNaqTkaCeKBGrEzjIpHpF5c4udLJPEoM2CplSStrnzeYSzML61kjnEIV6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZ5ZrP4u; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZ5ZrP4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737480702; x=1769016702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9bF15o7Uj0Zo9nQKSJVONxkwpUHJ5BksA6LgzqM/XKw=;
  b=CZ5ZrP4uZAOK0jNCbxvaL2oQSK2qoJh/a7HdbZ++hFSljfAodUB7mlyJ
   pVlOELa5vgmIoS6iagrJAp/luhaya+aMx6JabGs8vR5Lack/fvxgCU9bc
   /E01/VeKphxMvSqytwaWsdYpr34kTRSbWYovtVeBDFY5QBLs5/TJXE0k1
   wV6SN+P6mKF/N4MrCyTW1Nzy0aBw9AKqKMdIeOuGFJOU/SzbBsiOQNuIf
   mDN5I4m27CihXAdPOE3ABNuy42xl6zskSh7f3pbm293FXQy99IcQddIi2
   Ch8hJOHZONn67V0EApBkSp61wlt6mqfli+pXR4hbNsvdltNWu9rATRvjk
   A==;
X-CSE-ConnectionGUID: VBH1fb0vTqKEMip1x/o8NA==
X-CSE-MsgGUID: PwO/lqRHSXKrUAHtZ1DfeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38073076"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="38073076"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 09:31:40 -0800
X-CSE-ConnectionGUID: gg9lS+M6QT2BMvLyo3Xsgg==
X-CSE-MsgGUID: wQYvcaA7S7qBpwK+ydMuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111867219"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2025 09:31:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taI6D-000YMl-1X;
	Tue, 21 Jan 2025 17:31:37 +0000
Date: Wed, 22 Jan 2025 01:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 27/28] drivers/usb/serial/usb-serial.c:230:40:
 error: subscripted value is neither array nor pointer nor vector
Message-ID: <202501220109.3NiUNrSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   d1bf58705bfa573c164a0a991fc49a3985963b4b
commit: 4d1b724f7f4063a0269f06e2f51688c155ae1ebc [27/28] tty: switch to xarray
config: i386-buildonly-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250122/202501220109.3NiUNrSM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220109.3NiUNrSM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220109.3NiUNrSM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/serial/usb-serial.c: In function 'serial_install':
>> drivers/usb/serial/usb-serial.c:230:40: error: subscripted value is neither array nor pointer nor vector
     230 |         init_termios = (driver->termios[idx] == NULL);
         |                                        ^


vim +230 drivers/usb/serial/usb-serial.c

73e487fdb75f8ab Guennadi Liakhovetski 2006-04-25  195  
^1da177e4c3f415 Linus Torvalds        2005-04-16  196  /*****************************************************************************
^1da177e4c3f415 Linus Torvalds        2005-04-16  197   * Driver tty interface functions
^1da177e4c3f415 Linus Torvalds        2005-04-16  198   *****************************************************************************/
f5b0953a89fa340 Alan Stern            2009-09-01  199  
f5b0953a89fa340 Alan Stern            2009-09-01  200  /**
f5b0953a89fa340 Alan Stern            2009-09-01  201   * serial_install - install tty
f5b0953a89fa340 Alan Stern            2009-09-01  202   * @driver: the driver (USB in our case)
f5b0953a89fa340 Alan Stern            2009-09-01  203   * @tty: the tty being created
f5b0953a89fa340 Alan Stern            2009-09-01  204   *
579bebe5dd52258 Johan Hovold          2019-04-21  205   * Initialise the termios structure for this tty.  We use the default
f5b0953a89fa340 Alan Stern            2009-09-01  206   * USB serial settings but permit them to be overridden by
579bebe5dd52258 Johan Hovold          2019-04-21  207   * serial->type->init_termios on first open.
cc56cd0157753c0 Alan Stern            2009-09-01  208   *
cc56cd0157753c0 Alan Stern            2009-09-01  209   * This is the first place a new tty gets used.  Hence this is where we
cc56cd0157753c0 Alan Stern            2009-09-01  210   * acquire references to the usb_serial structure and the driver module,
6400b974910407c Johan Hovold          2021-09-10  211   * where we store a pointer to the port.  All these actions are reversed
6400b974910407c Johan Hovold          2021-09-10  212   * in serial_cleanup().
f5b0953a89fa340 Alan Stern            2009-09-01  213   */
f5b0953a89fa340 Alan Stern            2009-09-01  214  static int serial_install(struct tty_driver *driver, struct tty_struct *tty)
f5b0953a89fa340 Alan Stern            2009-09-01  215  {
f5b0953a89fa340 Alan Stern            2009-09-01  216  	int idx = tty->index;
f5b0953a89fa340 Alan Stern            2009-09-01  217  	struct usb_serial *serial;
cc56cd0157753c0 Alan Stern            2009-09-01  218  	struct usb_serial_port *port;
579bebe5dd52258 Johan Hovold          2019-04-21  219  	bool init_termios;
cc56cd0157753c0 Alan Stern            2009-09-01  220  	int retval = -ENODEV;
cc56cd0157753c0 Alan Stern            2009-09-01  221  
e5b1e2062e0535e Greg Kroah-Hartman    2013-06-07  222  	port = usb_serial_port_get_by_minor(idx);
e5b1e2062e0535e Greg Kroah-Hartman    2013-06-07  223  	if (!port)
cc56cd0157753c0 Alan Stern            2009-09-01  224  		return retval;
cc56cd0157753c0 Alan Stern            2009-09-01  225  
e5b1e2062e0535e Greg Kroah-Hartman    2013-06-07  226  	serial = port->serial;
cc56cd0157753c0 Alan Stern            2009-09-01  227  	if (!try_module_get(serial->type->driver.owner))
96a83c95c3da5ba Johan Hovold          2021-09-10  228  		goto err_put_serial;
cc56cd0157753c0 Alan Stern            2009-09-01  229  
579bebe5dd52258 Johan Hovold          2019-04-21 @230  	init_termios = (driver->termios[idx] == NULL);
579bebe5dd52258 Johan Hovold          2019-04-21  231  
79ef51894a8dfbd Johan Hovold          2018-05-16  232  	retval = tty_standard_install(driver, tty);
76f82a7ab3a7247 Jiri Slaby            2012-01-30  233  	if (retval)
6400b974910407c Johan Hovold          2021-09-10  234  		goto err_put_module;
76f82a7ab3a7247 Jiri Slaby            2012-01-30  235  
7e29bb4b779f4f3 Alan Stern            2009-09-01  236  	mutex_unlock(&serial->disc_mutex);
7e29bb4b779f4f3 Alan Stern            2009-09-01  237  
579bebe5dd52258 Johan Hovold          2019-04-21  238  	/* allow the driver to update the initial settings */
579bebe5dd52258 Johan Hovold          2019-04-21  239  	if (init_termios && serial->type->init_termios)
f5b0953a89fa340 Alan Stern            2009-09-01  240  		serial->type->init_termios(tty);
cc56cd0157753c0 Alan Stern            2009-09-01  241  
cc56cd0157753c0 Alan Stern            2009-09-01  242  	tty->driver_data = port;
cc56cd0157753c0 Alan Stern            2009-09-01  243  
cc56cd0157753c0 Alan Stern            2009-09-01  244  	return retval;
cc56cd0157753c0 Alan Stern            2009-09-01  245  
96a83c95c3da5ba Johan Hovold          2021-09-10  246  err_put_module:
cc56cd0157753c0 Alan Stern            2009-09-01  247  	module_put(serial->type->driver.owner);
96a83c95c3da5ba Johan Hovold          2021-09-10  248  err_put_serial:
cc56cd0157753c0 Alan Stern            2009-09-01  249  	usb_serial_put(serial);
cc56cd0157753c0 Alan Stern            2009-09-01  250  	mutex_unlock(&serial->disc_mutex);
cc56cd0157753c0 Alan Stern            2009-09-01  251  	return retval;
f5b0953a89fa340 Alan Stern            2009-09-01  252  }
f5b0953a89fa340 Alan Stern            2009-09-01  253  

:::::: The code at line 230 was first introduced by commit
:::::: 579bebe5dd522580019e7b10b07daaf500f9fb1e USB: serial: fix initial-termios handling

:::::: TO: Johan Hovold <johan@kernel.org>
:::::: CC: Johan Hovold <johan@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
