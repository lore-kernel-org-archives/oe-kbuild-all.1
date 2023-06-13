Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF91361
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 23:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686699757; x=1718235757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9OTn+3lY1bnfkvrgdGHIAWvsO5Q2jAXQYFcUT3Pl8Q=;
  b=ZxIr7fGYNtjHt6Wqxv1I/ElNQcry7l0ImkpkuFDRya+PEFwKmXU+4/BI
   qpzXkMjO+SH6MMLVgddx9wrVe7af/Kp6R4TyQBvTYBTg8vQto0aqt2eLZ
   un6Fw1ZTA4hFPILiICvcFcOGtGnkMy0jKgaCSltVb5fIngs6n3XeO3stZ
   m2GiO2fSP1te+Bkbf/wSynyVvfoWFBfkHLei0pOY6LJJbnJjPEFjpI26g
   wk6o9W6XNe06KiKC9NZDvzm50RIGoRkngA1EJUVAwNnND5sLw2RpvFofx
   IgeWrqsWhKCnRW41QXcFcrwPAIVV3qZ8XNkBS+PWas8rL+bBarZPso1oc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386880720"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="386880720"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 16:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="705990355"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="705990355"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jun 2023 16:42:32 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9Deh-0001wv-0z;
	Tue, 13 Jun 2023 23:42:31 +0000
Date: Wed, 14 Jun 2023 07:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [jirislaby:devel 35/55] drivers/tty/serial/serial_port.c:23:17:
 error: implicit declaration of function 'uart_circ_chars_pending'
Message-ID: <202306140732.3G3FR4lL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f8c938871c78b165f3123967084c0f7b4f64a439
commit: f1d3b372ea89b57cd1be6cab2b25a72a8cfabef4 [35/55] tty: serial, use kfifo
config: arm-randconfig-r036-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140732.3G3FR4lL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=f1d3b372ea89b57cd1be6cab2b25a72a8cfabef4
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout f1d3b372ea89b57cd1be6cab2b25a72a8cfabef4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/tty/serial/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140732.3G3FR4lL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/serial_port.c: In function '__serial_port_busy':
>> drivers/tty/serial/serial_port.c:23:17: error: implicit declaration of function 'uart_circ_chars_pending' [-Werror=implicit-function-declaration]
      23 |                 uart_circ_chars_pending(&port->state->xmit);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/serial_port.c:23:53: error: 'struct uart_state' has no member named 'xmit'
      23 |                 uart_circ_chars_pending(&port->state->xmit);
         |                                                     ^~
   drivers/tty/serial/serial_port.c:24:1: error: control reaches end of non-void function [-Werror=return-type]
      24 | }
         | ^
   cc1: some warnings being treated as errors


vim +/uart_circ_chars_pending +23 drivers/tty/serial/serial_port.c

84a9582fd20306 Tony Lindgren 2023-05-25  18  
84a9582fd20306 Tony Lindgren 2023-05-25  19  /* Only considers pending TX for now. Caller must take care of locking */
84a9582fd20306 Tony Lindgren 2023-05-25  20  static int __serial_port_busy(struct uart_port *port)
84a9582fd20306 Tony Lindgren 2023-05-25  21  {
84a9582fd20306 Tony Lindgren 2023-05-25  22  	return !uart_tx_stopped(port) &&
84a9582fd20306 Tony Lindgren 2023-05-25 @23  		uart_circ_chars_pending(&port->state->xmit);
84a9582fd20306 Tony Lindgren 2023-05-25  24  }
84a9582fd20306 Tony Lindgren 2023-05-25  25  

:::::: The code at line 23 was first introduced by commit
:::::: 84a9582fd203063cd4d301204971ff2cd8327f1a serial: core: Start managing serial controllers to enable runtime PM

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
