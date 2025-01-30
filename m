Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0DE2AF03
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243899; cv=none; b=oxzZZkFrP8guWCxH/CA/ByIGUvLwPQoIkBZcHK7vyg6CdmW/mv40yKTpWNr5Ys39pHeR3vILw24T8QQVC0b0f7uQPlNEsK1hA8kOpIC4IkTTvqGhugYjoX1S9BhGtSuOO8RrzQW4rsXDQhfWUIdw8Jmt+5f2XKyA1/khzxfa/S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243899; c=relaxed/simple;
	bh=bBiCbcz/5fTpaLKdyDRd4bwD603V1PiwHKuNsitB9h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZlkGZJ6bffVFOYxzUEsNdVLR47jbJ2mtIGjJr3iOY+VSWKZEa9dH3mRXtacBGPqUvbE/vVFqs3gL1MuB70a4zNhs7sHrRChJj2G34LAsOF8kZoG2qZWOQlPerMc6gOsiCuZTlXVxf0sD+wGf/7wjUm98kOJEm54GJ2ZC/+eKGjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mleK6hHX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mleK6hHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738243897; x=1769779897;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bBiCbcz/5fTpaLKdyDRd4bwD603V1PiwHKuNsitB9h4=;
  b=mleK6hHX6Gj9+5mPSAJUE54lGvvCWobtRaX8Trz7tp21Hxt1vSEn4GoW
   XIgrTRzFcpjOY7tRIyGg8GkNpJuTSS3w/QOVEx/khaA5gen7681Y15/6r
   TIo68bKvHpQG8/52fMQ9BeG1xbro7rSY/hT7MJx/qq2gDLkhsVH4fZVdG
   S99UzBe8Az/IrXyMbprMP8U5QcVzDxOnack7h8ACBmnxCwBPGIYqLWzJw
   Nze/KtssPComomT87eHMVhwmfG3KZT5x037oJ/Fq+rxYkljH4KRXnQX4q
   wUaDswKuXC4vdjflBXJrd3EVcuTFCB55qfqbMhrV9HiSAr+tP8jO4hvR9
   Q==;
X-CSE-ConnectionGUID: 5KkP9MrBTVOJfrwihVa5mQ==
X-CSE-MsgGUID: 8CExeaoISlOFAQT4wuRgyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49374647"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="49374647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 05:31:36 -0800
X-CSE-ConnectionGUID: E9t9jFxcRgKgxUlJ/GPZRg==
X-CSE-MsgGUID: vIlBSEkoRmeIlDQyxy4xIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109892415"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jan 2025 05:31:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdUdp-000k5v-0Y;
	Thu, 30 Jan 2025 13:31:33 +0000
Date: Thu, 30 Jan 2025 21:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 48/49] drivers/usb/serial/console.c:146:40: error:
 passing argument 1 of 'INIT_LIST_HEAD' from incompatible pointer type
Message-ID: <202501302135.ORyxTP2R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   a2ea6ca94c68a7ab616969102e07614d1be0a5a8
commit: 4e755fc98e41dca2debd4bb09e1d10d59d9168da [48/49] tty: use xarray for tty's file list
config: arc-randconfig-001-20250130 (https://download.01.org/0day-ci/archive/20250130/202501302135.ORyxTP2R-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501302135.ORyxTP2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501302135.ORyxTP2R-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/serial/console.c: In function 'usb_console_setup':
>> drivers/usb/serial/console.c:146:40: error: passing argument 1 of 'INIT_LIST_HEAD' from incompatible pointer type [-Werror=incompatible-pointer-types]
     146 |                         INIT_LIST_HEAD(&tty->tty_files);
         |                                        ^~~~~~~~~~~~~~~
         |                                        |
         |                                        struct xarray *
   In file included from include/linux/module.h:12,
                    from drivers/usb/serial/console.c:14:
   include/linux/list.h:35:53: note: expected 'struct list_head *' but argument is of type 'struct xarray *'
      35 | static inline void INIT_LIST_HEAD(struct list_head *list)
         |                                   ~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/INIT_LIST_HEAD +146 drivers/usb/serial/console.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   49  
^1da177e4c3f41 Linus Torvalds     2005-04-16   50  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16   51   * The parsing of the command line works exactly like the
^1da177e4c3f41 Linus Torvalds     2005-04-16   52   * serial.c code, except that the specifier is "ttyUSB" instead
^1da177e4c3f41 Linus Torvalds     2005-04-16   53   * of "ttyS".
^1da177e4c3f41 Linus Torvalds     2005-04-16   54   */
69a4bf7c9525e5 Paul Fulghum       2006-04-12   55  static int usb_console_setup(struct console *co, char *options)
^1da177e4c3f41 Linus Torvalds     2005-04-16   56  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   57  	struct usbcons_info *info = &usbcons_info;
^1da177e4c3f41 Linus Torvalds     2005-04-16   58  	int baud = 9600;
^1da177e4c3f41 Linus Torvalds     2005-04-16   59  	int bits = 8;
^1da177e4c3f41 Linus Torvalds     2005-04-16   60  	int parity = 'n';
^1da177e4c3f41 Linus Torvalds     2005-04-16   61  	int doflow = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   62  	int cflag = CREAD | HUPCL | CLOCAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   63  	char *s;
^1da177e4c3f41 Linus Torvalds     2005-04-16   64  	struct usb_serial *serial;
^1da177e4c3f41 Linus Torvalds     2005-04-16   65  	struct usb_serial_port *port;
7bd032dc2793af Alan Stern         2009-09-04   66  	int retval;
c87d6a4f67657f Aristeu Rozanski   2007-11-13   67  	struct tty_struct *tty = NULL;
92d2c5e4badc62 Jason Wessel       2010-03-16   68  	struct ktermios dummy;
^1da177e4c3f41 Linus Torvalds     2005-04-16   69  
^1da177e4c3f41 Linus Torvalds     2005-04-16   70  	if (options) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   71  		baud = simple_strtoul(options, NULL, 10);
^1da177e4c3f41 Linus Torvalds     2005-04-16   72  		s = options;
^1da177e4c3f41 Linus Torvalds     2005-04-16   73  		while (*s >= '0' && *s <= '9')
^1da177e4c3f41 Linus Torvalds     2005-04-16   74  			s++;
^1da177e4c3f41 Linus Torvalds     2005-04-16   75  		if (*s)
^1da177e4c3f41 Linus Torvalds     2005-04-16   76  			parity = *s++;
^1da177e4c3f41 Linus Torvalds     2005-04-16   77  		if (*s)
^1da177e4c3f41 Linus Torvalds     2005-04-16   78  			bits   = *s++ - '0';
^1da177e4c3f41 Linus Torvalds     2005-04-16   79  		if (*s)
^1da177e4c3f41 Linus Torvalds     2005-04-16   80  			doflow = (*s++ == 'r');
^1da177e4c3f41 Linus Torvalds     2005-04-16   81  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   82  
c17ee886976b64 Alan Cox           2008-07-22   83  	/* Sane default */
c17ee886976b64 Alan Cox           2008-07-22   84  	if (baud == 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   85  		baud = 9600;
c17ee886976b64 Alan Cox           2008-07-22   86  
^1da177e4c3f41 Linus Torvalds     2005-04-16   87  	switch (bits) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   88  	case 7:
^1da177e4c3f41 Linus Torvalds     2005-04-16   89  		cflag |= CS7;
^1da177e4c3f41 Linus Torvalds     2005-04-16   90  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   91  	default:
^1da177e4c3f41 Linus Torvalds     2005-04-16   92  	case 8:
^1da177e4c3f41 Linus Torvalds     2005-04-16   93  		cflag |= CS8;
^1da177e4c3f41 Linus Torvalds     2005-04-16   94  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   95  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   96  	switch (parity) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   97  	case 'o': case 'O':
^1da177e4c3f41 Linus Torvalds     2005-04-16   98  		cflag |= PARODD;
^1da177e4c3f41 Linus Torvalds     2005-04-16   99  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  100  	case 'e': case 'E':
^1da177e4c3f41 Linus Torvalds     2005-04-16  101  		cflag |= PARENB;
^1da177e4c3f41 Linus Torvalds     2005-04-16  102  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  103  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  104  
cabe0785ff14e9 Johan Hovold       2020-07-01  105  	if (doflow)
cabe0785ff14e9 Johan Hovold       2020-07-01  106  		cflag |= CRTSCTS;
cabe0785ff14e9 Johan Hovold       2020-07-01  107  
27680d232b04d4 Aristeu Rozanski   2007-11-12  108  	/*
27680d232b04d4 Aristeu Rozanski   2007-11-12  109  	 * no need to check the index here: if the index is wrong, console
27680d232b04d4 Aristeu Rozanski   2007-11-12  110  	 * code won't call us
27680d232b04d4 Aristeu Rozanski   2007-11-12  111  	 */
e5b1e2062e0535 Greg Kroah-Hartman 2013-06-07  112  	port = usb_serial_port_get_by_minor(co->index);
e5b1e2062e0535 Greg Kroah-Hartman 2013-06-07  113  	if (port == NULL) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  114  		/* no device is connected yet, sorry :( */
92931d243b5caf Greg Kroah-Hartman 2012-09-13  115  		pr_err("No USB device connected to ttyUSB%i\n", co->index);
^1da177e4c3f41 Linus Torvalds     2005-04-16  116  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds     2005-04-16  117  	}
e5b1e2062e0535 Greg Kroah-Hartman 2013-06-07  118  	serial = port->serial;
^1da177e4c3f41 Linus Torvalds     2005-04-16  119  
7bd032dc2793af Alan Stern         2009-09-04  120  	retval = usb_autopm_get_interface(serial->interface);
7bd032dc2793af Alan Stern         2009-09-04  121  	if (retval)
7bd032dc2793af Alan Stern         2009-09-04  122  		goto error_get_interface;
7bd032dc2793af Alan Stern         2009-09-04  123  
4a90f09b20f462 Alan Cox           2008-10-13  124  	tty_port_tty_set(&port->port, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  125  
^1da177e4c3f41 Linus Torvalds     2005-04-16  126  	info->port = port;
^1da177e4c3f41 Linus Torvalds     2005-04-16  127  
95da310e66ee80 Alan Cox           2008-07-22  128  	++port->port.count;
d41861ca19c9e9 Peter Hurley       2016-04-09  129  	if (!tty_port_initialized(&port->port)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  130  		if (serial->type->set_termios) {
c87d6a4f67657f Aristeu Rozanski   2007-11-13  131  			/*
c87d6a4f67657f Aristeu Rozanski   2007-11-13  132  			 * allocate a fake tty so the driver can initialize
c87d6a4f67657f Aristeu Rozanski   2007-11-13  133  			 * the termios structure, then later call set_termios to
c87d6a4f67657f Aristeu Rozanski   2007-11-13  134  			 * configure according to command line arguments
c87d6a4f67657f Aristeu Rozanski   2007-11-13  135  			 */
7ac9da10af7ffd Burman Yan         2006-11-22  136  			tty = kzalloc(sizeof(*tty), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  137  			if (!tty) {
c87d6a4f67657f Aristeu Rozanski   2007-11-13  138  				retval = -ENOMEM;
c87d6a4f67657f Aristeu Rozanski   2007-11-13  139  				goto reset_open_count;
^1da177e4c3f41 Linus Torvalds     2005-04-16  140  			}
e5404586a499f7 Kevin Hao          2008-12-01  141  			kref_init(&tty->kref);
92d2c5e4badc62 Jason Wessel       2010-03-16  142  			tty->driver = usb_serial_tty_driver;
92d2c5e4badc62 Jason Wessel       2010-03-16  143  			tty->index = co->index;
d269d4434c72ed Johan Hovold       2015-01-05  144  			init_ldsem(&tty->ldisc_sem);
14816b16fa0ada Johan Hovold       2017-02-08  145  			spin_lock_init(&tty->files_lock);
32a4bf2e81ec37 Johan Hovold       2015-01-05 @146  			INIT_LIST_HEAD(&tty->tty_files);
32a4bf2e81ec37 Johan Hovold       2015-01-05  147  			kref_get(&tty->driver->kref);
5ee0089b1f7057 Johan Hovold       2015-02-16  148  			__module_get(tty->driver->owner);
32a4bf2e81ec37 Johan Hovold       2015-01-05  149  			tty->ops = &usb_console_fake_tty_ops;
a3123fd0a4a5f9 Peter Hurley       2016-01-09  150  			tty_init_termios(tty);
32a4bf2e81ec37 Johan Hovold       2015-01-05  151  			tty_port_tty_set(&port->port, tty);
c87d6a4f67657f Aristeu Rozanski   2007-11-13  152  		}
c87d6a4f67657f Aristeu Rozanski   2007-11-13  153  
c87d6a4f67657f Aristeu Rozanski   2007-11-13  154  		/* only call the device specific open if this
c87d6a4f67657f Aristeu Rozanski   2007-11-13  155  		 * is the first time the port is opened */
a509a7e478e476 Alan Cox           2009-09-19  156  		retval = serial->type->open(NULL, port);
c87d6a4f67657f Aristeu Rozanski   2007-11-13  157  		if (retval) {
085fb962623b72 Greg Kroah-Hartman 2012-04-20  158  			dev_err(&port->dev, "could not open USB console port\n");
92d2c5e4badc62 Jason Wessel       2010-03-16  159  			goto fail;
c87d6a4f67657f Aristeu Rozanski   2007-11-13  160  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  161  
c87d6a4f67657f Aristeu Rozanski   2007-11-13  162  		if (serial->type->set_termios) {
2d8a1001ee0e96 Stephen Rothwell   2012-07-20  163  			tty->termios.c_cflag = cflag;
2d8a1001ee0e96 Stephen Rothwell   2012-07-20  164  			tty_termios_encode_baud_rate(&tty->termios, baud, baud);
92d2c5e4badc62 Jason Wessel       2010-03-16  165  			memset(&dummy, 0, sizeof(struct ktermios));
06dd881f59b3c0 Jason Wessel       2008-09-08  166  			serial->type->set_termios(tty, port, &dummy);
c87d6a4f67657f Aristeu Rozanski   2007-11-13  167  
4a90f09b20f462 Alan Cox           2008-10-13  168  			tty_port_tty_set(&port->port, NULL);
f51ccf46217c28 Johan Hovold       2018-12-04  169  			tty_save_termios(tty);
32a4bf2e81ec37 Johan Hovold       2015-01-05  170  			tty_kref_put(tty);
^1da177e4c3f41 Linus Torvalds     2005-04-16  171  		}
515be7baeddb04 Ilpo Järvinen      2023-01-17  172  		tty_port_set_initialized(&port->port, true);
c87d6a4f67657f Aristeu Rozanski   2007-11-13  173  	}
6e4061210150d1 Jason Wessel       2009-06-22  174  	/* Now that any required fake tty operations are completed restore
6e4061210150d1 Jason Wessel       2009-06-22  175  	 * the tty port count */
6e4061210150d1 Jason Wessel       2009-06-22  176  	--port->port.count;
6e4061210150d1 Jason Wessel       2009-06-22  177  	/* The console is special in terms of closing the device so
6e4061210150d1 Jason Wessel       2009-06-22  178  	 * indicate this port is now acting as a system console. */
336cee42dd5282 Jason Wessel       2010-03-08  179  	port->port.console = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  
7bd032dc2793af Alan Stern         2009-09-04  181  	mutex_unlock(&serial->disc_mutex);
c87d6a4f67657f Aristeu Rozanski   2007-11-13  182  	return retval;
7bd032dc2793af Alan Stern         2009-09-04  183  
92d2c5e4badc62 Jason Wessel       2010-03-16  184   fail:
4a90f09b20f462 Alan Cox           2008-10-13  185  	tty_port_tty_set(&port->port, NULL);
32a4bf2e81ec37 Johan Hovold       2015-01-05  186  	tty_kref_put(tty);
c87d6a4f67657f Aristeu Rozanski   2007-11-13  187   reset_open_count:
95da310e66ee80 Alan Cox           2008-07-22  188  	port->port.count = 0;
299d7572e46f98 Johan Hovold       2017-10-04  189  	info->port = NULL;
7bd032dc2793af Alan Stern         2009-09-04  190  	usb_autopm_put_interface(serial->interface);
7bd032dc2793af Alan Stern         2009-09-04  191   error_get_interface:
7bd032dc2793af Alan Stern         2009-09-04  192  	mutex_unlock(&serial->disc_mutex);
61dfa797c73175 Liang He           2022-09-19  193  	usb_serial_put(serial);
7bd032dc2793af Alan Stern         2009-09-04  194  	return retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  195  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  

:::::: The code at line 146 was first introduced by commit
:::::: 32a4bf2e81ec378e5925d4e069e0677a6c86a6ad USB: console: fix potential use after free

:::::: TO: Johan Hovold <johan@kernel.org>
:::::: CC: Johan Hovold <johan@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
