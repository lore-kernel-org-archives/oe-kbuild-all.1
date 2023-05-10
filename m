Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEB821CFA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683757310; x=1715293310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRG/66fGhYwlTydgMlfsopDh0QsovXNCPJg97VkTiXU=;
  b=IDvl44PqsWJbiyQEJ0iV+eRpoq7pKooNNVLx1fCsl3yBkbkysEPgPBme
   RnXpscWuZEq9oYCPN2VS5zEXISbxmwCZ8PU2y1n8SeZi/0+d0lpFC0xFb
   2FCs13Rz54WjxkxM61DK5G7FD03/PVz2mEDXaxQD8QvQZNs3UVe1HA8QE
   V7zMU3lO0LBT/AMH9WBy4qXuYBeHh+8UqSgClC+E2PdW61/5SoiVN+8sR
   d4I5ZgxGjnywHoq22q4gs8m5kxr/YfiKYyJ6MORHFJ9snlKlSi8+txvuW
   n1BRudIJ+KHH3S0zoY2iPzpt1vkWTK4XKvLa1/z7DbYpQCybuTk1FXzaw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352537574"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="352537574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 15:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="649896512"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="649896512"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2023 15:21:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwsBv-0003cI-1s;
	Wed, 10 May 2023 22:21:47 +0000
Date: Thu, 11 May 2023 06:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 41/41] drivers/bluetooth/dtl1_cs.c:229:17:
 error: call to '_inb' declared with attribute error: inb()) requires
 CONFIG_HAS_IOPORT
Message-ID: <202305110659.piE8FqK0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
commit: b873f53aa1a6487f4a450747bd5ee38afad6dfe4 [41/41] asm-generic/io.h: drop inb() etc for HAS_IOPORT=n
config: openrisc-randconfig-r001-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110659.piE8FqK0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=b873f53aa1a6487f4a450747bd5ee38afad6dfe4
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout b873f53aa1a6487f4a450747bd5ee38afad6dfe4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110659.piE8FqK0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/dtl1_cs.c: In function 'dtl1_open':
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:472:9: note: in expansion of macro 'outb'
     472 |         outb(0, iobase + UART_MCR);
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:475:9: note: in expansion of macro 'outb'
     475 |         outb(0, iobase + UART_IER);
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:478:9: note: in expansion of macro 'outb'
     478 |         outb(UART_LCR_WLEN8, iobase + UART_LCR);        /* Reset DLAB */
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:479:9: note: in expansion of macro 'outb'
     479 |         outb((UART_MCR_DTR | UART_MCR_RTS | UART_MCR_OUT2), iobase + UART_MCR);
         |         ^~~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:481:26: note: in expansion of macro 'inb'
     481 |         info->ri_latch = inb(info->p_dev->resource[0]->start + UART_MSR)
         |                          ^~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
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
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
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
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:121:17: note: in expansion of macro 'outb'
     121 |                 outb(buf[actual], iobase + UART_TX);
         |                 ^~~~
   In function 'dtl1_close',
       inlined from 'dtl1_detach' at drivers/bluetooth/dtl1_cs.c:553:2:
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/dtl1_cs.c:518:9: note: in expansion of macro 'outb'
     518 |         outb(0, iobase + UART_MCR);
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
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
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:285:18: note: in expansion of macro 'inb'
     285 |         } while (inb(iobase + UART_LSR) & UART_LSR_DR);
         |                  ^~~
   drivers/bluetooth/dtl1_cs.c: In function 'dtl1_interrupt':
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:306:15: note: in expansion of macro 'inb'
     306 |         iir = inb(iobase + UART_IIR) & UART_IIR_ID;
         |               ^~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:311:23: note: in expansion of macro 'inb'
     311 |                 lsr = inb(iobase + UART_LSR);
         |                       ^~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:336:23: note: in expansion of macro 'inb'
     336 |                 iir = inb(iobase + UART_IIR) & UART_IIR_ID;
         |                       ^~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:340:15: note: in expansion of macro 'inb'
     340 |         msr = inb(iobase + UART_MSR);
         |               ^~~


vim +/_inb +229 drivers/bluetooth/dtl1_cs.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  200  
^1da177e4c3f41 Linus Torvalds    2005-04-16  201  
66f4e0e43a0389 Himangi Saraogi   2014-08-13  202  static void dtl1_receive(struct dtl1_info *info)
^1da177e4c3f41 Linus Torvalds    2005-04-16  203  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  204  	unsigned int iobase;
66f4e0e43a0389 Himangi Saraogi   2014-08-13  205  	struct nsh *nsh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  206  	int boguscount = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  207  
^1da177e4c3f41 Linus Torvalds    2005-04-16  208  	if (!info) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  209  		BT_ERR("Unknown device");
^1da177e4c3f41 Linus Torvalds    2005-04-16  210  		return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  211  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  212  
9a017a910346af Dominik Brodowski 2010-07-24  213  	iobase = info->p_dev->resource[0]->start;
^1da177e4c3f41 Linus Torvalds    2005-04-16  214  
^1da177e4c3f41 Linus Torvalds    2005-04-16  215  	do {
^1da177e4c3f41 Linus Torvalds    2005-04-16  216  		info->hdev->stat.byte_rx++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  217  
^1da177e4c3f41 Linus Torvalds    2005-04-16  218  		/* Allocate packet */
a08b15e66e8ec7 Valentin Ilie     2013-08-12  219  		if (info->rx_skb == NULL) {
a08b15e66e8ec7 Valentin Ilie     2013-08-12  220  			info->rx_skb = bt_skb_alloc(HCI_MAX_FRAME_SIZE, GFP_ATOMIC);
a08b15e66e8ec7 Valentin Ilie     2013-08-12  221  			if (!info->rx_skb) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  222  				BT_ERR("Can't allocate mem for new packet");
^1da177e4c3f41 Linus Torvalds    2005-04-16  223  				info->rx_state = RECV_WAIT_NSH;
^1da177e4c3f41 Linus Torvalds    2005-04-16  224  				info->rx_count = NSHL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  225  				return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  226  			}
a08b15e66e8ec7 Valentin Ilie     2013-08-12  227  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  228  
634fef61076d64 Johannes Berg     2017-06-16 @229  		skb_put_u8(info->rx_skb, inb(iobase + UART_RX));
66f4e0e43a0389 Himangi Saraogi   2014-08-13  230  		nsh = (struct nsh *)info->rx_skb->data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  		info->rx_count--;
^1da177e4c3f41 Linus Torvalds    2005-04-16  233  
^1da177e4c3f41 Linus Torvalds    2005-04-16  234  		if (info->rx_count == 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  235  
^1da177e4c3f41 Linus Torvalds    2005-04-16  236  			switch (info->rx_state) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  			case RECV_WAIT_NSH:
^1da177e4c3f41 Linus Torvalds    2005-04-16  238  				info->rx_state = RECV_WAIT_DATA;
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  				info->rx_count = nsh->len + (nsh->len & 0x0001);
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  				break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  241  			case RECV_WAIT_DATA:
618e8bc228cda7 Marcel Holtmann   2015-11-05  242  				hci_skb_pkt_type(info->rx_skb) = nsh->type;
^1da177e4c3f41 Linus Torvalds    2005-04-16  243  
^1da177e4c3f41 Linus Torvalds    2005-04-16  244  				/* remove PAD byte if it exists */
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  				if (nsh->len & 0x0001) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  246  					info->rx_skb->tail--;
^1da177e4c3f41 Linus Torvalds    2005-04-16  247  					info->rx_skb->len--;
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  
^1da177e4c3f41 Linus Torvalds    2005-04-16  250  				/* remove NSH */
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  				skb_pull(info->rx_skb, NSHL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  
618e8bc228cda7 Marcel Holtmann   2015-11-05  253  				switch (hci_skb_pkt_type(info->rx_skb)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  254  				case 0x80:
^1da177e4c3f41 Linus Torvalds    2005-04-16  255  					/* control data for the Nokia Card */
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  					dtl1_control(info, info->rx_skb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  257  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  258  				case 0x82:
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  				case 0x83:
^1da177e4c3f41 Linus Torvalds    2005-04-16  260  				case 0x84:
^1da177e4c3f41 Linus Torvalds    2005-04-16  261  					/* send frame to the HCI layer */
618e8bc228cda7 Marcel Holtmann   2015-11-05  262  					hci_skb_pkt_type(info->rx_skb) &= 0x0f;
e1a26170692dc1 Marcel Holtmann   2013-10-10  263  					hci_recv_frame(info->hdev, info->rx_skb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  264  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  265  				default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  266  					/* unknown packet */
618e8bc228cda7 Marcel Holtmann   2015-11-05  267  					BT_ERR("Unknown HCI packet with type 0x%02x received",
618e8bc228cda7 Marcel Holtmann   2015-11-05  268  					       hci_skb_pkt_type(info->rx_skb));
^1da177e4c3f41 Linus Torvalds    2005-04-16  269  					kfree_skb(info->rx_skb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  271  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  272  
^1da177e4c3f41 Linus Torvalds    2005-04-16  273  				info->rx_state = RECV_WAIT_NSH;
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  				info->rx_count = NSHL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  				info->rx_skb = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  276  				break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  277  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  278  
^1da177e4c3f41 Linus Torvalds    2005-04-16  279  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  280  
^1da177e4c3f41 Linus Torvalds    2005-04-16  281  		/* Make sure we don't stay here too long */
^1da177e4c3f41 Linus Torvalds    2005-04-16  282  		if (boguscount++ > 32)
^1da177e4c3f41 Linus Torvalds    2005-04-16  283  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  284  
^1da177e4c3f41 Linus Torvalds    2005-04-16  285  	} while (inb(iobase + UART_LSR) & UART_LSR_DR);
^1da177e4c3f41 Linus Torvalds    2005-04-16  286  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  287  

:::::: The code at line 229 was first introduced by commit
:::::: 634fef61076d644b989b86abc2f560d81a089a31 networking: add and use skb_put_u8()

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
