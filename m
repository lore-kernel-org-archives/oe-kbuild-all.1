Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E0B200A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683912835; x=1715448835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mAgTyXQKnfVHdWRzJKlPwP8XS5boG30EmzEp/6SGaZU=;
  b=PVlv5T+f6Ek6Qpe3dub13rsi4EbD/t+fp//SMHkbRRINMehiAcDrd5Aq
   A6Baodjoz1+CxH3RpryjZyE1r1wbNBT6Gr7+mRVTwbL0PiiHaeAOSJ87L
   0ndemCOhqFa9dA9G12j6n1TR+Qz+tohiX/22Z3mKuLBG+sC1HNQAdbhRn
   oc8AiIG8HBlXGmAbNIyxyRSTndYujN1ZCSk1Egyv7ixaXGYDRwU9ezcBH
   Qc+V/cgEGJYaD5zY3KaWrfgtpCpOthQ7jX4jmt+W1btqh3rFYsvAxJlYP
   WxueE+fimndiAkVsh7gfH0v9J09LNLQapG9rkxldFjFYC4GgRJLfxa4/E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="378983699"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="378983699"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 10:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="703250993"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="703250993"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 May 2023 10:33:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxWeO-00050Y-00;
	Fri, 12 May 2023 17:33:52 +0000
Date: Sat, 13 May 2023 01:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 41/41] include/asm-generic/io.h:595:15: error:
 call to '_outb' declared with attribute error: outb() requires
 CONFIG_HAS_IOPORT
Message-ID: <202305130124.RRQjDdA0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   4be9bb8ca052891e7f668d41946b0a481250974a
commit: 4be9bb8ca052891e7f668d41946b0a481250974a [41/41] asm-generic/io.h: drop inb() etc for HAS_IOPORT=n
config: openrisc-randconfig-r001-20230509 (https://download.01.org/0day-ci/archive/20230513/202305130124.RRQjDdA0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=4be9bb8ca052891e7f668d41946b0a481250974a
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 4be9bb8ca052891e7f668d41946b0a481250974a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130124.RRQjDdA0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/openrisc/include/asm/io.h:36,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/openrisc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from drivers/bluetooth/dtl1_cs.c:36:
   drivers/bluetooth/dtl1_cs.c: In function 'dtl1_open':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:472:9: note: in expansion of macro 'outb'
     472 |         outb(0, iobase + UART_MCR);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:475:9: note: in expansion of macro 'outb'
     475 |         outb(0, iobase + UART_IER);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:478:9: note: in expansion of macro 'outb'
     478 |         outb(UART_LCR_WLEN8, iobase + UART_LCR);        /* Reset DLAB */
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:479:9: note: in expansion of macro 'outb'
     479 |         outb((UART_MCR_DTR | UART_MCR_RTS | UART_MCR_OUT2), iobase + UART_MCR);
         |         ^~~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:481:26: note: in expansion of macro 'inb'
     481 |         info->ri_latch = inb(info->p_dev->resource[0]->start + UART_MSR)
         |                          ^~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:485:9: note: in expansion of macro 'outb'
     485 |         outb(UART_IER_RLSI | UART_IER_RDI | UART_IER_THRI, iobase + UART_IER);
         |         ^~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/bluetooth/dtl1_cs.c:23:
   In function 'dtl1_write',
       inlined from 'dtl1_write_wakeup' at drivers/bluetooth/dtl1_cs.c:161:9:
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/bluetooth/dtl1_cs.c:115:9: note: in expansion of macro 'if'
     115 |         if (!(inb(iobase + UART_LSR) & UART_LSR_THRE))
         |         ^~
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:115:15: note: in expansion of macro 'inb'
     115 |         if (!(inb(iobase + UART_LSR) & UART_LSR_THRE))
         |               ^~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:121:17: note: in expansion of macro 'outb'
     121 |                 outb(buf[actual], iobase + UART_TX);
         |                 ^~~~
   In function 'dtl1_close',
       inlined from 'dtl1_detach' at drivers/bluetooth/dtl1_cs.c:553:2:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:518:9: note: in expansion of macro 'outb'
     518 |         outb(0, iobase + UART_MCR);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:521:9: note: in expansion of macro 'outb'
     521 |         outb(0, iobase + UART_IER);
         |         ^~~~
   drivers/bluetooth/dtl1_cs.c: In function 'dtl1_receive':
>> drivers/bluetooth/dtl1_cs.c:229:17: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     229 |                 skb_put_u8(info->rx_skb, inb(iobase + UART_RX));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:285:18: note: in expansion of macro 'inb'
     285 |         } while (inb(iobase + UART_LSR) & UART_LSR_DR);
         |                  ^~~
   drivers/bluetooth/dtl1_cs.c: In function 'dtl1_interrupt':
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:306:15: note: in expansion of macro 'inb'
     306 |         iir = inb(iobase + UART_IIR) & UART_IIR_ID;
         |               ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:311:23: note: in expansion of macro 'inb'
     311 |                 lsr = inb(iobase + UART_LSR);
         |                       ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:336:23: note: in expansion of macro 'inb'
     336 |                 iir = inb(iobase + UART_IIR) & UART_IIR_ID;
         |                       ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:340:15: note: in expansion of macro 'inb'
     340 |         msr = inb(iobase + UART_MSR);
         |               ^~~
--
   In file included from arch/openrisc/include/asm/io.h:36,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/openrisc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from drivers/bluetooth/bluecard_cs.c:39:
   drivers/bluetooth/bluecard_cs.c: In function 'bluecard_hci_close':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:644:9: note: in expansion of macro 'outb'
     644 |         outb(0x00, iobase + 0x30);
         |         ^~~~
   drivers/bluetooth/bluecard_cs.c: In function 'bluecard_enable_activity_led':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:187:17: note: in expansion of macro 'outb'
     187 |                 outb(0x18 | 0x60, iobase + 0x30);
         |                 ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:190:17: note: in expansion of macro 'outb'
     190 |                 outb(0x00, iobase + 0x30);
         |                 ^~~~
   drivers/bluetooth/bluecard_cs.c: In function 'bluecard_activity_led_timeout':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:171:9: note: in expansion of macro 'outb'
     171 |         outb(0x08 | 0x20, iobase + 0x30);
         |         ^~~~
   drivers/bluetooth/bluecard_cs.c: In function 'bluecard_write_wakeup':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:266:25: note: in expansion of macro 'outb'
     266 |                         outb(info->ctrl_reg, iobase + REG_CONTROL);
         |                         ^~~~
   In function 'outb_p',
       inlined from 'bluecard_write' at drivers/bluetooth/bluecard_cs.c:208:2,
       inlined from 'bluecard_write_wakeup' at drivers/bluetooth/bluecard_cs.c:273:9:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:693:9: note: in expansion of macro 'outb'
     693 |         outb(value, addr);
         |         ^~~~
   In function 'outb_p',
       inlined from 'bluecard_write_wakeup' at drivers/bluetooth/bluecard_cs.c:276:3:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:693:9: note: in expansion of macro 'outb'
     693 |         outb(value, addr);
         |         ^~~~
   In function 'outb_p',
       inlined from 'bluecard_write' at drivers/bluetooth/bluecard_cs.c:211:3,
       inlined from 'bluecard_write_wakeup' at drivers/bluetooth/bluecard_cs.c:273:9:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:693:9: note: in expansion of macro 'outb'
     693 |         outb(value, addr);
         |         ^~~~
   drivers/bluetooth/bluecard_cs.c: In function 'bluecard_write_wakeup':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:309:25: note: in expansion of macro 'outb'
     309 |                         outb(info->ctrl_reg, iobase + REG_CONTROL);
         |                         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:313:25: note: in expansion of macro 'outb'
     313 |                         outb(info->ctrl_reg, iobase + REG_CONTROL);
         |                         ^~~~
   drivers/bluetooth/bluecard_cs.c: In function 'bluecard_open':
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bluecard_cs.c:714:14: note: in expansion of macro 'inb'
     714 |         id = inb(iobase + 0x30);
         |              ^~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:727:9: note: in expansion of macro 'outb'
     727 |         outb(info->ctrl_reg, iobase + REG_CONTROL);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:730:9: note: in expansion of macro 'outb'
     730 |         outb(0x80, iobase + 0x30);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:736:9: note: in expansion of macro 'outb'
     736 |         outb(0x00, iobase + 0x30);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:740:9: note: in expansion of macro 'outb'
     740 |         outb(info->ctrl_reg, iobase + REG_CONTROL);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:743:9: note: in expansion of macro 'outb'
     743 |         outb(0xff, iobase + REG_INTERRUPT);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:745:9: note: in expansion of macro 'outb'
     745 |         outb(info->ctrl_reg, iobase + REG_CONTROL);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:750:17: note: in expansion of macro 'outb'
     750 |                 outb(info->ctrl_reg, iobase + REG_CONTROL);
         |                 ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:754:17: note: in expansion of macro 'outb'
     754 |                 outb(info->ctrl_reg, iobase + REG_CONTROL);
         |                 ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:758:17: note: in expansion of macro 'outb'
     758 |                 outb(info->ctrl_reg, iobase + REG_CONTROL);
         |                 ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:766:9: note: in expansion of macro 'outb'
     766 |         outb(REG_COMMAND_RX_BUF_ONE, iobase + REG_COMMAND);
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:767:9: note: in expansion of macro 'outb'
     767 |         outb(REG_COMMAND_RX_BUF_TWO, iobase + REG_COMMAND);
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:776:9: note: in expansion of macro 'outb'
     776 |         outb((0x0f << RTS_LEVEL_SHIFT_BITS) | 1, iobase + REG_RX_CONTROL);
         |         ^~~~
   drivers/bluetooth/bluecard_cs.c: In function 'bluecard_hci_open':
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:627:9: note: in expansion of macro 'outb'
     627 |         outb(0x08 | 0x20, iobase + 0x30);
         |         ^~~~
   In function 'bluecard_read',
       inlined from 'bluecard_receive' at drivers/bluetooth/bluecard_cs.c:382:8:
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:341:9: note: in expansion of macro 'outb'
     341 |         outb(REG_COMMAND_RX_WIN_ONE, iobase + REG_COMMAND);
         |         ^~~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bluecard_cs.c:343:15: note: in expansion of macro 'inb'
     343 |         len = inb(iobase + offset);
         |               ^~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:350:25: note: in expansion of macro 'outb'
     350 |                         outb(REG_COMMAND_RX_WIN_TWO, iobase + REG_COMMAND);
         |                         ^~~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bluecard_cs.c:354:26: note: in expansion of macro 'inb'
     354 |                 buf[n] = inb(iobase + offset + i);
         |                          ^~~
   drivers/bluetooth/bluecard_cs.c: In function 'bluecard_interrupt':
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:513:9: note: in expansion of macro 'outb'
     513 |         outb(info->ctrl_reg, iobase + REG_CONTROL);
         |         ^~~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bluecard_cs.c:515:15: note: in expansion of macro 'inb'
     515 |         reg = inb(iobase + REG_INTERRUPT);
         |               ^~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bluecard_cs.c:521:25: note: in expansion of macro 'outb'
     521 |                         outb(0x04, iobase + REG_INTERRUPT);
         |                         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT


vim +/_outb +595 include/asm-generic/io.h

3f7e212df82ca0 Arnd Bergmann   2009-05-13  533  
9216efafc52ff9 Thierry Reding  2014-10-01  534  /*
9216efafc52ff9 Thierry Reding  2014-10-01  535   * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
9216efafc52ff9 Thierry Reding  2014-10-01  536   * implemented on hardware that needs an additional delay for I/O accesses to
9216efafc52ff9 Thierry Reding  2014-10-01  537   * take effect.
9216efafc52ff9 Thierry Reding  2014-10-01  538   */
9216efafc52ff9 Thierry Reding  2014-10-01  539  
f009c89df79abe John Garry      2020-03-28  540  #if !defined(inb) && !defined(_inb)
f009c89df79abe John Garry      2020-03-28 @541  #define _inb _inb
4be9bb8ca05289 Niklas Schnelle 2021-12-20  542  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  543  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  544  {
87fe2d543f8173 Sinan Kaya      2018-04-05  545  	u8 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  546  
87fe2d543f8173 Sinan Kaya      2018-04-05  547  	__io_pbr();
87fe2d543f8173 Sinan Kaya      2018-04-05  548  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon     2019-02-22  549  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  550  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  551  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  552  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  553  u8 _inb(unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  554  	__compiletime_error("inb()) requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  555  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  556  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  557  
f009c89df79abe John Garry      2020-03-28  558  #if !defined(inw) && !defined(_inw)
f009c89df79abe John Garry      2020-03-28  559  #define _inw _inw
4be9bb8ca05289 Niklas Schnelle 2021-12-20  560  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  561  static inline u16 _inw(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  562  {
87fe2d543f8173 Sinan Kaya      2018-04-05  563  	u16 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  564  
87fe2d543f8173 Sinan Kaya      2018-04-05  565  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  566  	val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  567  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  568  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  569  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  570  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  571  u16 _inw(unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  572  	__compiletime_error("inw() requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  573  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  574  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  575  
f009c89df79abe John Garry      2020-03-28  576  #if !defined(inl) && !defined(_inl)
f009c89df79abe John Garry      2020-03-28  577  #define _inl _inl
4be9bb8ca05289 Niklas Schnelle 2021-12-20  578  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  579  static inline u32 _inl(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  580  {
87fe2d543f8173 Sinan Kaya      2018-04-05  581  	u32 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  582  
87fe2d543f8173 Sinan Kaya      2018-04-05  583  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  584  	val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  585  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  586  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  587  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  588  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  589  u32 _inl(unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  590  	__compiletime_error("inl() requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  591  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  592  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  593  
f009c89df79abe John Garry      2020-03-28  594  #if !defined(outb) && !defined(_outb)
f009c89df79abe John Garry      2020-03-28 @595  #define _outb _outb
4be9bb8ca05289 Niklas Schnelle 2021-12-20  596  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  597  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  598  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  599  	__io_pbw();
a7851aa54c0cdd Sinan Kaya      2018-04-05  600  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  601  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  602  }
4be9bb8ca05289 Niklas Schnelle 2021-12-20  603  #else
4be9bb8ca05289 Niklas Schnelle 2021-12-20  604  void _outb(u8 value, unsigned long addr)
4be9bb8ca05289 Niklas Schnelle 2021-12-20  605  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
4be9bb8ca05289 Niklas Schnelle 2021-12-20  606  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  607  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  608  

:::::: The code at line 595 was first introduced by commit
:::::: f009c89df79abea5f5244b8135a205f7d4352f86 io: Provide _inX() and _outX()

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Wei Xu <xuwei5@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
