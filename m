Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E01C3C05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682085438; x=1713621438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ocrJpAPby36JCVB+FW/4oxoAyUnqFWqot+P6qpMJTQ4=;
  b=PJAiWsLFfbULhSXmQ+t5LvyzV69eLbwJsfdIWOyr+tsvEDRYooUjzI2N
   KeeYhrTmh/5eCTYPVE4TqFnp8mmnqZAX/jiB3Ut19eRRIaHMl+0p9NvoW
   aulwTN4ggWTcGcvjF7HIdSdRNCKyWu3krDarTTnPO62I8ChUcM6zTFI65
   cRlWZ9BeO6nzULvspop9hx39+cn+dv5U7iE0H3n0DUPGnX1SyTaSj8AOR
   tZ6kt/W5JLMlkvMnXFxBSn0DQlv9Ws7BWt6o8MG4TU8Q6QQ/HtzImp0dQ
   0M7SzRCkilsRMnZuOt8YnR16NCzx8jMUOWveAD2ovR+6sk1rUBCqKDlhj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="346013929"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="346013929"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 06:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021936493"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="1021936493"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2023 06:57:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pprGE-000gcW-2Z;
	Fri, 21 Apr 2023 13:57:14 +0000
Date: Fri, 21 Apr 2023 21:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [jirislaby:devel 15/43] drivers/tty/mxser.c:476:25: error: 'struct
 uart_port' has no member named 'ioaddr'
Message-ID: <202304212124.LekqeHdV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   c29baef6673f84d0317e2502bfc543a7956212a3
commit: 2c9f85f98eac668b45afefaea3a2ca13660d0374 [15/43] mxser: use iobase from uart_port
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230421/202304212124.LekqeHdV-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=2c9f85f98eac668b45afefaea3a2ca13660d0374
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout 2c9f85f98eac668b45afefaea3a2ca13660d0374
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304212124.LekqeHdV-lkp@intel.com/

Note: the jirislaby/devel HEAD c29baef6673f84d0317e2502bfc543a7956212a3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/tty/mxser.c: In function 'mxser_carrier_raised':
>> drivers/tty/mxser.c:476:25: error: 'struct uart_port' has no member named 'ioaddr'
     476 |         return inb(uport->ioaddr + UART_MSR) & UART_MSR_DCD;
         |                         ^~
   drivers/tty/mxser.c: In function 'mxser_dtr_rts':
   drivers/tty/mxser.c:486:24: error: 'struct uart_port' has no member named 'ioaddr'
     486 |         mcr = inb(uport->ioaddr + UART_MCR);
         |                        ^~
   drivers/tty/mxser.c: In function 'mxser_carrier_raised':
   drivers/tty/mxser.c:477:1: error: control reaches end of non-void function [-Werror=return-type]
     477 | }
         | ^
   cc1: some warnings being treated as errors


vim +476 drivers/tty/mxser.c

   471	
   472	static bool mxser_carrier_raised(struct tty_port *port)
   473	{
   474		struct uart_port *uport = &to_mport(port)->uport;
   475	
 > 476		return inb(uport->ioaddr + UART_MSR) & UART_MSR_DCD;
   477	}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
