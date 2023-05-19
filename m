Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C48821
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684496058; x=1716032058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aKzJl4dE6311XXWA48UEkuzSesw0aEemiLEEJJKD4VM=;
  b=oCDEe5bIlVAE1PA2OVbyzYmxPq4E1N3qDNJy1AHUJp+opytCft4zpkwh
   HMw+YHyyGos286TCSTmsCp1H5PlhW2n9uGGCi//Tf99jH3Rhi7WQJNf3B
   df4FP1cOf143jeXQyeAi44k6EQoFngfRcIqFPDpgJbdP+3e3y4Kexct+4
   +lMHBZ6Wi/AEnlUQOXV2gV++GW/Yy8gAM4blZsQn98RUQLWsvJEBDlHqO
   VLkoYJnyeqb4vQEhTm9GG0KxmpaL1gkCQBmjq92eQBoOI6Gq4xY7XslLb
   ox1YRV0eWF2FHk8wM6XugKyffA7tPlECsQRQ4Y/i2Y15LS/1UABd2i/Qp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="331955417"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="331955417"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 04:34:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705586541"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="705586541"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 04:34:08 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzyN5-000Ane-1K;
	Fri, 19 May 2023 11:34:07 +0000
Date: Fri, 19 May 2023 19:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Huan Feng <huan.feng@starfivetech.com>
Subject: [herbert-cryptodev-2.6:master 21/22]
 drivers/tty/serial/amba-pl011.c:379:30: error: implicit declaration of
 function 'phys_to_page'; did you mean 'pfn_to_page'?
Message-ID: <202305191929.Eq4OVZ6D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jia,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
head:   7883d1b28a2b0e62edcacea22de6b36a1918b15a
commit: 42ef0e944b0119e9987819af0a5a04d32d5e5edf [21/22] crypto: starfive - Add crypto engine support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230519/202305191929.Eq4OVZ6D-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=42ef0e944b0119e9987819af0a5a04d32d5e5edf
        git remote add herbert-cryptodev-2.6 https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
        git fetch --no-tags herbert-cryptodev-2.6 master
        git checkout 42ef0e944b0119e9987819af0a5a04d32d5e5edf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191929.Eq4OVZ6D-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/amba-pl011.c: In function 'pl011_sgbuf_init':
>> drivers/tty/serial/amba-pl011.c:379:30: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
     379 |         sg_set_page(&sg->sg, phys_to_page(dma_addr),
         |                              ^~~~~~~~~~~~
         |                              pfn_to_page
>> drivers/tty/serial/amba-pl011.c:379:30: warning: passing argument 2 of 'sg_set_page' makes pointer from integer without a cast [-Wint-conversion]
     379 |         sg_set_page(&sg->sg, phys_to_page(dma_addr),
         |                              ^~~~~~~~~~~~~~~~~~~~~~
         |                              |
         |                              int
   In file included from include/linux/kfifo.h:42,
                    from include/linux/tty_port.h:5,
                    from include/linux/tty.h:12,
                    from drivers/tty/serial/amba-pl011.c:25:
   include/linux/scatterlist.h:136:69: note: expected 'struct page *' but argument is of type 'int'
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                        ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMADEVICES
   Depends on [n]: HAS_DMA [=n]
   Selected by [m]:
   - CRYPTO_DEV_JH7110 [=m] && CRYPTO [=y] && CRYPTO_HW [=y] && (SOC_STARFIVE || COMPILE_TEST [=y])


vim +379 drivers/tty/serial/amba-pl011.c

68b65f7305e54b drivers/serial/amba-pl011.c     Russell King   2010-12-22  367  
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  368  static int pl011_sgbuf_init(struct dma_chan *chan, struct pl011_sgbuf *sg,
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  369  	enum dma_data_direction dir)
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  370  {
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min     2013-03-27  371  	dma_addr_t dma_addr;
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min     2013-03-27  372  
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min     2013-03-27  373  	sg->buf = dma_alloc_coherent(chan->device->dev,
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min     2013-03-27  374  		PL011_DMA_BUFFER_SIZE, &dma_addr, GFP_KERNEL);
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  375  	if (!sg->buf)
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  376  		return -ENOMEM;
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  377  
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min     2013-03-27  378  	sg_init_table(&sg->sg, 1);
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min     2013-03-27 @379  	sg_set_page(&sg->sg, phys_to_page(dma_addr),
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min     2013-03-27  380  		PL011_DMA_BUFFER_SIZE, offset_in_page(dma_addr));
cb06ff102e2d79 drivers/tty/serial/amba-pl011.c Chanho Min     2013-03-27  381  	sg_dma_address(&sg->sg) = dma_addr;
c64be9231e0893 drivers/tty/serial/amba-pl011.c Andrew Jackson 2014-11-07  382  	sg_dma_len(&sg->sg) = PL011_DMA_BUFFER_SIZE;
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  383  
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  384  	return 0;
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  385  }
ead76f329f777c drivers/tty/serial/amba-pl011.c Linus Walleij  2011-02-24  386  

:::::: The code at line 379 was first introduced by commit
:::::: cb06ff102e2d79a82cf780aa5e6947b2e0529ac0 ARM: PL011: Add support for Rx DMA buffer polling.

:::::: TO: Chanho Min <chanho.min@lge.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
