Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02821CE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 20:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685480289; x=1717016289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxUJII5TezgQMLvwQG1uPMB5ksrhB4nkGA/NcYXzYlE=;
  b=d2WjcLgog0KMjB6uv4SaBzrPPwb4vs/TbXZ6cSDozem8RVghtKzkrttA
   Ugvm4CUn1PLnIO4HJxlcJSD/vm2aKUkM5oxa+MDdJjXrrUI5LRgE+xG8n
   nDz6Ifr+x8tbWUIxbeR5XNDT6ky6uJ0G6nlIXBz7hjEpodc3mfZcYkQkS
   NAqQdO2mFY+QlRhENh+s3rBZmyx3c2tgGf5j8N47O6vLNfQPmFRmzNadF
   PFWgj1mJXgh0sRv9W2apsVg34uOweQPRN1bewdzS/hGDkM/xg95ERJDhz
   +p9b1LiYQP9JU5NvAa0X8C9I3N7Isz77luj4Nx9wE3geclcJ4FJJaTdBP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353888940"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="353888940"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 13:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="1036751358"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="1036751358"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 May 2023 13:57:44 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q46PX-0000o5-2H;
	Tue, 30 May 2023 20:57:43 +0000
Date: Wed, 31 May 2023 04:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [tty:tty-testing 13/17] 8250_fsl.c:(.text.fsl8250_handle_irq+0x140):
 undefined reference to `serial8250_rx_chars'
Message-ID: <202305310433.jhGB8PhI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uwe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   617ece73dd240cb11869a224c879ca685a151a38
commit: a0807ca158e00af2909f3d34a36c28b57b07ab06 [13/17] serial: 8250: Apply FSL workarounds also without SERIAL_8250_CONSOLE
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230531/202305310433.jhGB8PhI-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?id=a0807ca158e00af2909f3d34a36c28b57b07ab06
        git remote add tty https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
        git fetch --no-tags tty tty-testing
        git checkout a0807ca158e00af2909f3d34a36c28b57b07ab06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310433.jhGB8PhI-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/tty/serial/8250/8250_fsl.o: in function `fsl8250_handle_irq':
>> 8250_fsl.c:(.text.fsl8250_handle_irq+0x140): undefined reference to `serial8250_rx_chars'
>> mips-linux-ld: 8250_fsl.c:(.text.fsl8250_handle_irq+0x220): undefined reference to `serial8250_modem_status'
>> mips-linux-ld: 8250_fsl.c:(.text.fsl8250_handle_irq+0x268): undefined reference to `serial8250_tx_chars'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
