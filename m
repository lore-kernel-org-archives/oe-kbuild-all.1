Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E233E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686675866; x=1718211866;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YRGX4oUTvWH+/4Mv8xtJ94vIEFCHO/t+X3uq6Wk1nx4=;
  b=KJAhMh+EzNDwbAONLqFUSoqxQNVpyIjU5Izx2GSb9tdoXPtc0jFPDPds
   zGjUoYT7u15CRUMtyqUvrzzS47WbreAYeXIxeobsFq3TOZpf4qYBwR3MO
   /tpSp1+9EfxgPqXYNn4XoSHTRiJivjL6N7PMOBoy+tkDsKQW6qrn5e2tL
   A0Siw/qKiSRa8+VBfWuV91ANBjggZma7WGY6gFdSBIHzUj8WMtmKFO5JH
   yGHUXAftcBa2HZm1fuoGlPwtmYXfYzYfwk7zj/5yTs2E3RdYH++wYeLyo
   9uoBj6cTW1aX2rVnAy8qIdpSigwTyf7Gw73ng9d08ysDhbxVZ+aihEdJX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="343086871"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="343086871"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="781754656"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="781754656"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2023 10:04:10 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q97RC-0001ZQ-0a;
	Tue, 13 Jun 2023 17:04:10 +0000
Date: Wed, 14 Jun 2023 01:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 18/55] drivers/tty/n_tty.c:2497:28: error:
 initialization of 'void (*)(struct tty_struct *, const u8 *, const char *,
 int)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const char
 *, int)'} from incompatible pointer type 'void (*)(struct tty_struct...
Message-ID: <202306140017.1ybSWyQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jiri,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f8c938871c78b165f3123967084c0f7b4f64a439
commit: 3d09071ac166db7da003b89200b9858a4005066f [18/55] make flags u8
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306140017.1ybSWyQx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=3d09071ac166db7da003b89200b9858a4005066f
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout 3d09071ac166db7da003b89200b9858a4005066f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140017.1ybSWyQx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/n_tty.c:2497:28: error: initialization of 'void (*)(struct tty_struct *, const u8 *, const char *, int)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const char *, int)'} from incompatible pointer type 'void (*)(struct tty_struct *, const u8 *, const u8 *, int)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const unsigned char *, int)'} [-Werror=incompatible-pointer-types]
    2497 |         .receive_buf     = n_tty_receive_buf,
         |                            ^~~~~~~~~~~~~~~~~
   drivers/tty/n_tty.c:2497:28: note: (near initialization for 'n_tty_ops.receive_buf')
   cc1: some warnings being treated as errors
--
>> drivers/accessibility/speakup/spk_ttyio.c:111:27: error: initialization of 'int (*)(struct tty_struct *, const u8 *, const u8 *, int)' {aka 'int (*)(struct tty_struct *, const unsigned char *, const unsigned char *, int)'} from incompatible pointer type 'int (*)(struct tty_struct *, const u8 *, const char *, int)' {aka 'int (*)(struct tty_struct *, const unsigned char *, const char *, int)'} [-Werror=incompatible-pointer-types]
     111 |         .receive_buf2   = spk_ttyio_receive_buf2,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/spk_ttyio.c:111:27: note: (near initialization for 'spk_ttyio_ldisc_ops.receive_buf2')
   cc1: some warnings being treated as errors


vim +2497 drivers/tty/n_tty.c

47afa7a5a8a8fb drivers/char/n_tty.c Alan Cox         2008-10-13  2484  
27228732aa94f3 drivers/tty/n_tty.c  Peter Hurley     2016-01-09  2485  static struct tty_ldisc_ops n_tty_ops = {
5e30d3bf51ebb1 drivers/tty/n_tty.c  Jiri Slaby       2021-03-02  2486  	.owner		 = THIS_MODULE,
fbadf70a8053b3 drivers/tty/n_tty.c  Jiri Slaby       2021-05-05  2487  	.num		 = N_TTY,
e10cc1df1d2014 drivers/char/n_tty.c Paul Fulghum     2007-05-10  2488  	.name            = "n_tty",
e10cc1df1d2014 drivers/char/n_tty.c Paul Fulghum     2007-05-10  2489  	.open            = n_tty_open,
e10cc1df1d2014 drivers/char/n_tty.c Paul Fulghum     2007-05-10  2490  	.close           = n_tty_close,
e10cc1df1d2014 drivers/char/n_tty.c Paul Fulghum     2007-05-10  2491  	.flush_buffer    = n_tty_flush_buffer,
11a96d1820113f drivers/char/n_tty.c Alan Cox         2008-10-13  2492  	.read            = n_tty_read,
11a96d1820113f drivers/char/n_tty.c Alan Cox         2008-10-13  2493  	.write           = n_tty_write,
e10cc1df1d2014 drivers/char/n_tty.c Paul Fulghum     2007-05-10  2494  	.ioctl           = n_tty_ioctl,
e10cc1df1d2014 drivers/char/n_tty.c Paul Fulghum     2007-05-10  2495  	.set_termios     = n_tty_set_termios,
11a96d1820113f drivers/char/n_tty.c Alan Cox         2008-10-13  2496  	.poll            = n_tty_poll,
e10cc1df1d2014 drivers/char/n_tty.c Paul Fulghum     2007-05-10 @2497  	.receive_buf     = n_tty_receive_buf,
f6c8dbe6e50c6e drivers/tty/n_tty.c  Peter Hurley     2013-06-15  2498  	.write_wakeup    = n_tty_write_wakeup,
24a89d1cb69b6c drivers/tty/n_tty.c  Peter Hurley     2013-06-15  2499  	.receive_buf2	 = n_tty_receive_buf2,
6bb6fa6908ebd3 drivers/tty/n_tty.c  Ilpo Järvinen    2022-06-06  2500  	.lookahead_buf	 = n_tty_lookahead_flow_ctrl,
^1da177e4c3f41 drivers/char/n_tty.c Linus Torvalds   2005-04-16  2501  };
572b9adbd40b55 drivers/char/n_tty.c Rodolfo Giometti 2010-03-10  2502  

:::::: The code at line 2497 was first introduced by commit
:::::: e10cc1df1d2014f68a4bdcf73f6dd122c4561f94 tty: add compat_ioctl

:::::: TO: Paul Fulghum <paulkf@microgate.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
