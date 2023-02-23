Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0FD23A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 10:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677146776; x=1708682776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2+WR6RRgECe0JnApYED8EY4Re884H5gta3XpIE6HXE=;
  b=ccl1noTXjg31kJ9efIMQrBsZ0/RpF15ZKJi/NMP8iqcwdb78qTUz+iBO
   aOuZMWoxsgf1DDea+LG67tu3B+MZhXrQyDRxvKT7VKMbOGyi5dXsF2nkR
   4+Ws+xf7BdYfocdoInAEoqY5wcFyb55S8P/dkeGiVIZmqBymauQeHtfH7
   tlKsb0Li23VSEpqL0Q9GZebP8Zbg7XWu80cfmza3ypri4upZ39blVVmSA
   TJ7wxwOtk906Dwk8o8Ohtkkv13EAzns3soi2Sgcnh+xAVnogF9lfREGcH
   8PGPBSfQz+ot6yMK9sLE7NG1Yz2IYsuoBrqjuxMXF/vDPCtpgK8X3bCyw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312797169"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="312797169"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 02:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="736302470"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="736302470"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2023 02:05:56 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV8U7-0001Ex-1W;
	Thu, 23 Feb 2023 10:05:55 +0000
Date: Thu, 23 Feb 2023 18:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:spi-arch-deps 63/63] drivers/spi/spi-s3c24xx.c:243:16:
 error: 'struct s3c24xx_spi' has no member named 'fiq_claimed'
Message-ID: <202302231751.6XBFGSpr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-arch-deps
head:   fa62910b0d5dda56b86b1ad9af6cbbb4a240f1e9
commit: fa62910b0d5dda56b86b1ad9af6cbbb4a240f1e9 [63/63] spi: s3c24xx: Allow build test coverage
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230223/202302231751.6XBFGSpr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=fa62910b0d5dda56b86b1ad9af6cbbb4a240f1e9
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci spi-arch-deps
        git checkout fa62910b0d5dda56b86b1ad9af6cbbb4a240f1e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231751.6XBFGSpr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-s3c24xx.c: In function 's3c24xx_spi_tryfiq':
>> drivers/spi/spi-s3c24xx.c:243:16: error: 'struct s3c24xx_spi' has no member named 'fiq_claimed'
     243 |         if (!hw->fiq_claimed) {
         |                ^~
>> drivers/spi/spi-s3c24xx.c:247:23: error: implicit declaration of function 'claim_fiq' [-Werror=implicit-function-declaration]
     247 |                 ret = claim_fiq(&hw->fiq_handler);
         |                       ^~~~~~~~~
>> drivers/spi/spi-s3c24xx.c:247:36: error: 'struct s3c24xx_spi' has no member named 'fiq_handler'
     247 |                 ret = claim_fiq(&hw->fiq_handler);
         |                                    ^~
>> drivers/spi/spi-s3c24xx.c:264:9: error: implicit declaration of function 'set_fiq_regs'; did you mean 'set_irq_regs'? [-Werror=implicit-function-declaration]
     264 |         set_fiq_regs(&regs);
         |         ^~~~~~~~~~~~
         |         set_irq_regs
>> drivers/spi/spi-s3c24xx.c:266:15: error: 'struct s3c24xx_spi' has no member named 'fiq_mode'
     266 |         if (hw->fiq_mode != mode) {
         |               ^~
   drivers/spi/spi-s3c24xx.c:267:19: error: 'struct s3c24xx_spi' has no member named 'fiq_mode'
     267 |                 hw->fiq_mode = mode;
         |                   ^~
>> drivers/spi/spi-s3c24xx.c:286:17: error: implicit declaration of function 'set_fiq_handler' [-Werror=implicit-function-declaration]
     286 |                 set_fiq_handler(&code->data, code->length);
         |                 ^~~~~~~~~~~~~~~
   drivers/spi/spi-s3c24xx.c:291:11: error: 'struct s3c24xx_spi' has no member named 'fiq_mode'
     291 |         hw->fiq_mode = mode;
         |           ^~
   drivers/spi/spi-s3c24xx.c:292:11: error: 'struct s3c24xx_spi' has no member named 'fiq_inuse'
     292 |         hw->fiq_inuse = 1;
         |           ^~
   drivers/spi/spi-s3c24xx.c: In function 's3c24xx_spi_fiqop':
   drivers/spi/spi-s3c24xx.c:310:23: error: 'struct s3c24xx_spi' has no member named 'fiq_inuse'
     310 |                 if (hw->fiq_inuse)
         |                       ^~
   drivers/spi/spi-s3c24xx.c:316:19: error: 'struct s3c24xx_spi' has no member named 'fiq_mode'
     316 |                 hw->fiq_mode = FIQ_MODE_NONE;
         |                   ^~
   drivers/spi/spi-s3c24xx.c:317:19: error: 'struct s3c24xx_spi' has no member named 'fiq_claimed'
     317 |                 hw->fiq_claimed = 0;
         |                   ^~
   drivers/spi/spi-s3c24xx.c:319:19: error: 'struct s3c24xx_spi' has no member named 'fiq_claimed'
     319 |                 hw->fiq_claimed = 1;
         |                   ^~
   drivers/spi/spi-s3c24xx.c: In function 's3c24xx_spi_initfiq':
   drivers/spi/spi-s3c24xx.c:333:11: error: 'struct s3c24xx_spi' has no member named 'fiq_handler'
     333 |         hw->fiq_handler.dev_id = hw;
         |           ^~
   drivers/spi/spi-s3c24xx.c:334:11: error: 'struct s3c24xx_spi' has no member named 'fiq_handler'
     334 |         hw->fiq_handler.name = dev_name(hw->dev);
         |           ^~
   drivers/spi/spi-s3c24xx.c:335:11: error: 'struct s3c24xx_spi' has no member named 'fiq_handler'
     335 |         hw->fiq_handler.fiq_op = s3c24xx_spi_fiqop;
         |           ^~
   drivers/spi/spi-s3c24xx.c: In function 's3c24xx_spi_usingfiq':
   drivers/spi/spi-s3c24xx.c:359:19: error: 'struct s3c24xx_spi' has no member named 'fiq_inuse'
     359 |         return spi->fiq_inuse;
         |                   ^~
   drivers/spi/spi-s3c24xx.c: In function 's3c24xx_spi_txrx':
   drivers/spi/spi-s3c24xx.c:381:11: error: 'struct s3c24xx_spi' has no member named 'fiq_inuse'
     381 |         hw->fiq_inuse = 0;
         |           ^~
   drivers/spi/spi-s3c24xx.c: In function 's3c24xx_spi_irq':
   drivers/spi/spi-s3c24xx.c:424:19: error: 'struct s3c24xx_spi' has no member named 'fiq_inuse'
     424 |                 hw->fiq_inuse = 0;
         |                   ^~
   drivers/spi/spi-s3c24xx.c: In function 's3c24xx_spi_usingfiq':
   drivers/spi/spi-s3c24xx.c:360:1: error: control reaches end of non-void function [-Werror=return-type]
     360 | }
         | ^
   cc1: some warnings being treated as errors


vim +243 drivers/spi/spi-s3c24xx.c

bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  223  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  224  /**
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  225   * s3c24xx_spi_tryfiq - attempt to claim and setup FIQ for transfer
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  226   * @hw: The hardware state.
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  227   *
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  228   * Claim the FIQ handler (only one can be active at any one time) and
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  229   * then setup the correct transfer code for this transfer.
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  230   *
3ad2f3fbb96142 drivers/spi/spi_s3c24xx.c Daniel Mack   2010-02-03  231   * This call updates all the necessary state information if successful,
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  232   * so the caller does not need to do anything more than start the transfer
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  233   * as normal, since the IRQ will have been re-routed to the FIQ handler.
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  234  */
cfeb33127bfd5c drivers/spi/spi-s3c24xx.c Sachin Kamat  2013-09-10  235  static void s3c24xx_spi_tryfiq(struct s3c24xx_spi *hw)
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  236  {
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  237  	struct pt_regs regs;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  238  	enum spi_fiq_mode mode;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  239  	struct spi_fiq_code *code;
cd4bd8f9435ddf drivers/spi/spi-s3c24xx.c Arnd Bergmann 2020-08-06  240  	u32 *ack_ptr = NULL;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  241  	int ret;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  242  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14 @243  	if (!hw->fiq_claimed) {
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  244  		/* try and claim fiq if we haven't got it, and if not
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  245  		 * then return and simply use another transfer method */
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  246  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14 @247  		ret = claim_fiq(&hw->fiq_handler);
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  248  		if (ret)
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  249  			return;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  250  	}
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  251  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  252  	if (hw->tx && !hw->rx)
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  253  		mode = FIQ_MODE_TX;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  254  	else if (hw->rx && !hw->tx)
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  255  		mode = FIQ_MODE_RX;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  256  	else
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  257  		mode = FIQ_MODE_TXRX;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  258  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  259  	regs.uregs[fiq_rspi] = (long)hw->regs;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  260  	regs.uregs[fiq_rrx]  = (long)hw->rx;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  261  	regs.uregs[fiq_rtx]  = (long)hw->tx + 1;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  262  	regs.uregs[fiq_rcount] = hw->len - 1;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  263  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14 @264  	set_fiq_regs(&regs);
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  265  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14 @266  	if (hw->fiq_mode != mode) {
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  267  		hw->fiq_mode = mode;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  268  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  269  		switch (mode) {
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  270  		case FIQ_MODE_TX:
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  271  			code = &s3c24xx_spi_fiq_tx;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  272  			break;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  273  		case FIQ_MODE_RX:
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  274  			code = &s3c24xx_spi_fiq_rx;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  275  			break;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  276  		case FIQ_MODE_TXRX:
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  277  			code = &s3c24xx_spi_fiq_txrx;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  278  			break;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  279  		default:
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  280  			code = NULL;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  281  		}
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  282  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  283  		BUG_ON(!code);
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  284  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  285  		ack_ptr = (u32 *)&code->data[code->ack_offset];
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14 @286  		set_fiq_handler(&code->data, code->length);
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  287  	}
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  288  
cd4bd8f9435ddf drivers/spi/spi-s3c24xx.c Arnd Bergmann 2020-08-06  289  	s3c24xx_set_fiq(hw->irq, ack_ptr, true);
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  290  
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  291  	hw->fiq_mode = mode;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  292  	hw->fiq_inuse = 1;
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  293  }
bec0806cfec6de drivers/spi/spi_s3c24xx.c Ben Dooks     2009-12-14  294  

:::::: The code at line 243 was first introduced by commit
:::::: bec0806cfec6ded1a7e097bb95279e521a796129 spi_s3c24xx: add FIQ pseudo-DMA support

:::::: TO: Ben Dooks <ben@simtec.co.uk>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
