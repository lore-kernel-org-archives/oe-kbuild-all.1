Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09823AA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 07:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693641016; x=1725177016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bbWT4Yre67ES+MtDRgOhLCaoi+Rh/IGYqCNDNJqh6M=;
  b=H4Xza9MFgsH0gBsPIm/Fd+KcSEqpf0QGLj5wEeaGInDuQ2AdXWLKSQlN
   sklxR7Duh5ihBJwAwPvcdXG5BB3xLaZmqLUzya139fh7oqBBW6vREWalM
   QK7EjAkwoZg/t+mTu8E7GF5GDLgJXK4iSUqdzTM/qgi3qBOookKgBmgJd
   o/UxjfpKqBPY0H8rGuOtk2jMo8usmNPo4HMrwXBWuhvWy0F08uBgb1Li5
   4x1GBA36yxAwTORBlqd8WTZEA6oK/UkYGW7rMOfMNrEdvgiQBUWXKlccp
   pdjfz+GwqSvRqYc6yNQXpEa2l+3TKGuuS9gBBhsUmZ+VcOtvcc1ZvZVn6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356668683"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="356668683"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 00:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070992961"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="1070992961"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Sep 2023 00:50:12 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcLOU-00028R-2X;
	Sat, 02 Sep 2023 07:50:10 +0000
Date: Sat, 2 Sep 2023 15:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v6_usb 20/20] include/asm-generic/io.h:595:15:
 error: call to '_outb' declared with attribute error: outb() requires
 CONFIG_HAS_IOPORT
Message-ID: <202309021502.I8OqI5xH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v6_usb
head:   cf97bf195665223cec989e41efee82344a2f0eea
commit: cf97bf195665223cec989e41efee82344a2f0eea [20/20] asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20230902/202309021502.I8OqI5xH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021502.I8OqI5xH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021502.I8OqI5xH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/nios2/include/asm/io.h:41,
                    from include/linux/io.h:13,
                    from arch/nios2/include/asm/pgtable.h:18,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/include/uapi/asm/elf.h:24,
                    from arch/nios2/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from drivers/bluetooth/dtl1_cs.c:23:
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
   In function 'dtl1_write',
       inlined from 'dtl1_write_wakeup' at drivers/bluetooth/dtl1_cs.c:161:9:
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
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
   drivers/bluetooth/dtl1_cs.c: In function 'dtl1_receive':
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/dtl1_cs.c:229:42: note: in expansion of macro 'inb'
     229 |                 skb_put_u8(info->rx_skb, inb(iobase + UART_RX));
         |                                          ^~~
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
   In file included from arch/nios2/include/asm/io.h:41,
                    from include/linux/io.h:13,
                    from arch/nios2/include/asm/pgtable.h:18,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/include/uapi/asm/elf.h:24,
                    from arch/nios2/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from drivers/bluetooth/bt3c_cs.c:24:
   In function 'bt3c_address',
       inlined from 'bt3c_read' at drivers/bluetooth/bt3c_cs.c:149:2,
       inlined from 'bt3c_receive' at drivers/bluetooth/bt3c_cs.c:228:10:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:118:9: note: in expansion of macro 'outb'
     118 |         outb(addr & 0xff, iobase + ADDR_L);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:119:9: note: in expansion of macro 'outb'
     119 |         outb((addr >> 8) & 0xff, iobase + ADDR_H);
         |         ^~~~
   In function 'bt3c_get',
       inlined from 'bt3c_read' at drivers/bluetooth/bt3c_cs.c:151:9,
       inlined from 'bt3c_receive' at drivers/bluetooth/bt3c_cs.c:228:10:
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:139:32: note: in expansion of macro 'inb'
     139 |         unsigned short value = inb(iobase + DATA_L);
         |                                ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:141:18: note: in expansion of macro 'inb'
     141 |         value |= inb(iobase + DATA_H) << 8;
         |                  ^~~
   In function 'bt3c_address',
       inlined from 'bt3c_receive' at drivers/bluetooth/bt3c_cs.c:230:2:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:118:9: note: in expansion of macro 'outb'
     118 |         outb(addr & 0xff, iobase + ADDR_L);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:119:9: note: in expansion of macro 'outb'
     119 |         outb((addr >> 8) & 0xff, iobase + ADDR_H);
         |         ^~~~
   drivers/bluetooth/bt3c_cs.c: In function 'bt3c_receive':
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:249:58: note: in expansion of macro 'inb'
     249 |                         hci_skb_pkt_type(info->rx_skb) = inb(iobase + DATA_L);
         |                                                          ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:250:25: note: in expansion of macro 'inb'
     250 |                         inb(iobase + DATA_H);
         |                         ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:283:34: note: in expansion of macro 'inb'
     283 |                         __u8 x = inb(iobase + DATA_L);
         |                                  ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:286:25: note: in expansion of macro 'inb'
     286 |                         inb(iobase + DATA_H);
         |                         ^~~
   In function 'bt3c_address',
       inlined from 'bt3c_io_write' at drivers/bluetooth/bt3c_cs.c:132:2,
       inlined from 'bt3c_receive' at drivers/bluetooth/bt3c_cs.c:330:2:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:118:9: note: in expansion of macro 'outb'
     118 |         outb(addr & 0xff, iobase + ADDR_L);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:119:9: note: in expansion of macro 'outb'
     119 |         outb((addr >> 8) & 0xff, iobase + ADDR_H);
         |         ^~~~
   In function 'bt3c_put',
       inlined from 'bt3c_io_write' at drivers/bluetooth/bt3c_cs.c:133:2,
       inlined from 'bt3c_receive' at drivers/bluetooth/bt3c_cs.c:330:2:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:125:9: note: in expansion of macro 'outb'
     125 |         outb(value & 0xff, iobase + DATA_L);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:126:9: note: in expansion of macro 'outb'
     126 |         outb((value >> 8) & 0xff, iobase + DATA_H);
         |         ^~~~
   In function 'bt3c_address',
       inlined from 'bt3c_write' at drivers/bluetooth/bt3c_cs.c:163:2,
       inlined from 'bt3c_write_wakeup' at drivers/bluetooth/bt3c_cs.c:203:9:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:118:9: note: in expansion of macro 'outb'
     118 |         outb(addr & 0xff, iobase + ADDR_L);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:119:9: note: in expansion of macro 'outb'
     119 |         outb((addr >> 8) & 0xff, iobase + ADDR_H);
         |         ^~~~
   In function 'bt3c_put',
       inlined from 'bt3c_write' at drivers/bluetooth/bt3c_cs.c:168:3,
       inlined from 'bt3c_write_wakeup' at drivers/bluetooth/bt3c_cs.c:203:9:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:125:9: note: in expansion of macro 'outb'
     125 |         outb(value & 0xff, iobase + DATA_L);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:126:9: note: in expansion of macro 'outb'
     126 |         outb((value >> 8) & 0xff, iobase + DATA_H);
         |         ^~~~
   In function 'bt3c_address',
       inlined from 'bt3c_io_write' at drivers/bluetooth/bt3c_cs.c:132:2,
       inlined from 'bt3c_write' at drivers/bluetooth/bt3c_cs.c:172:2,
       inlined from 'bt3c_write_wakeup' at drivers/bluetooth/bt3c_cs.c:203:9:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:118:9: note: in expansion of macro 'outb'
     118 |         outb(addr & 0xff, iobase + ADDR_L);
         |         ^~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:119:9: note: in expansion of macro 'outb'
     119 |         outb((addr >> 8) & 0xff, iobase + ADDR_H);
         |         ^~~~
   In function 'bt3c_put',
       inlined from 'bt3c_io_write' at drivers/bluetooth/bt3c_cs.c:133:2,
       inlined from 'bt3c_write' at drivers/bluetooth/bt3c_cs.c:172:2,
       inlined from 'bt3c_write_wakeup' at drivers/bluetooth/bt3c_cs.c:203:9:
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:125:9: note: in expansion of macro 'outb'
     125 |         outb(value & 0xff, iobase + DATA_L);
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:126:9: note: in expansion of macro 'outb'
     126 |         outb((value >> 8) & 0xff, iobase + DATA_H);
         |         ^~~~
   drivers/bluetooth/bt3c_cs.c: In function 'bt3c_interrupt':
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:349:15: note: in expansion of macro 'inb'
     349 |         iir = inb(iobase + CONTROL);
         |               ^~~
   In function 'bt3c_address',
       inlined from 'bt3c_read' at drivers/bluetooth/bt3c_cs.c:149:2,
       inlined from 'bt3c_interrupt' at drivers/bluetooth/bt3c_cs.c:351:14:
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:118:9: note: in expansion of macro 'outb'
     118 |         outb(addr & 0xff, iobase + ADDR_L);
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:119:9: note: in expansion of macro 'outb'
     119 |         outb((addr >> 8) & 0xff, iobase + ADDR_H);
         |         ^~~~
   In function 'bt3c_get',
       inlined from 'bt3c_read' at drivers/bluetooth/bt3c_cs.c:151:9,
       inlined from 'bt3c_interrupt' at drivers/bluetooth/bt3c_cs.c:351:14:
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:139:32: note: in expansion of macro 'inb'
     139 |         unsigned short value = inb(iobase + DATA_L);
         |                                ^~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/bluetooth/bt3c_cs.c:141:18: note: in expansion of macro 'inb'
     141 |         value |= inb(iobase + DATA_H) << 8;
         |                  ^~~
   In function 'bt3c_address',
       inlined from 'bt3c_read' at drivers/bluetooth/bt3c_cs.c:149:2,
       inlined from 'bt3c_interrupt' at drivers/bluetooth/bt3c_cs.c:357:18:
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:118:9: note: in expansion of macro 'outb'
     118 |         outb(addr & 0xff, iobase + ADDR_L);
         |         ^~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/bluetooth/bt3c_cs.c:119:9: note: in expansion of macro 'outb'
     119 |         outb((addr >> 8) & 0xff, iobase + ADDR_H);
         |         ^~~~
   In function 'bt3c_get',
       inlined from 'bt3c_read' at drivers/bluetooth/bt3c_cs.c:151:9,
       inlined from 'bt3c_interrupt' at drivers/bluetooth/bt3c_cs.c:357:18:
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
..


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
cf97bf19566522 Niklas Schnelle 2021-12-20  542  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  543  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  544  {
87fe2d543f8173 Sinan Kaya      2018-04-05  545  	u8 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  546  
87fe2d543f8173 Sinan Kaya      2018-04-05  547  	__io_pbr();
87fe2d543f8173 Sinan Kaya      2018-04-05  548  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon     2019-02-22  549  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  550  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  551  }
cf97bf19566522 Niklas Schnelle 2021-12-20  552  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  553  u8 _inb(unsigned long addr)
cf97bf19566522 Niklas Schnelle 2021-12-20  554  	__compiletime_error("inb()) requires CONFIG_HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  555  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  556  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  557  
f009c89df79abe John Garry      2020-03-28  558  #if !defined(inw) && !defined(_inw)
f009c89df79abe John Garry      2020-03-28 @559  #define _inw _inw
cf97bf19566522 Niklas Schnelle 2021-12-20  560  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  561  static inline u16 _inw(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  562  {
87fe2d543f8173 Sinan Kaya      2018-04-05  563  	u16 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  564  
87fe2d543f8173 Sinan Kaya      2018-04-05  565  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  566  	val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  567  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  568  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  569  }
cf97bf19566522 Niklas Schnelle 2021-12-20  570  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  571  u16 _inw(unsigned long addr)
cf97bf19566522 Niklas Schnelle 2021-12-20  572  	__compiletime_error("inw() requires CONFIG_HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  573  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  574  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  575  
f009c89df79abe John Garry      2020-03-28  576  #if !defined(inl) && !defined(_inl)
f009c89df79abe John Garry      2020-03-28  577  #define _inl _inl
cf97bf19566522 Niklas Schnelle 2021-12-20  578  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  579  static inline u32 _inl(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  580  {
87fe2d543f8173 Sinan Kaya      2018-04-05  581  	u32 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  582  
87fe2d543f8173 Sinan Kaya      2018-04-05  583  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  584  	val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  585  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  586  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  587  }
cf97bf19566522 Niklas Schnelle 2021-12-20  588  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  589  u32 _inl(unsigned long addr)
cf97bf19566522 Niklas Schnelle 2021-12-20  590  	__compiletime_error("inl() requires CONFIG_HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  591  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  592  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  593  
f009c89df79abe John Garry      2020-03-28  594  #if !defined(outb) && !defined(_outb)
f009c89df79abe John Garry      2020-03-28 @595  #define _outb _outb
cf97bf19566522 Niklas Schnelle 2021-12-20  596  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  597  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  598  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  599  	__io_pbw();
a7851aa54c0cdd Sinan Kaya      2018-04-05  600  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  601  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  602  }
cf97bf19566522 Niklas Schnelle 2021-12-20  603  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  604  void _outb(u8 value, unsigned long addr)
cf97bf19566522 Niklas Schnelle 2021-12-20  605  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  606  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  607  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  608  
f009c89df79abe John Garry      2020-03-28  609  #if !defined(outw) && !defined(_outw)
f009c89df79abe John Garry      2020-03-28 @610  #define _outw _outw
cf97bf19566522 Niklas Schnelle 2021-12-20  611  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  612  static inline void _outw(u16 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  613  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  614  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  615  	__raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  616  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  617  }
cf97bf19566522 Niklas Schnelle 2021-12-20  618  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  619  void _outw(u16 value, unsigned long addr)
cf97bf19566522 Niklas Schnelle 2021-12-20  620  	__compiletime_error("outw() requires CONFIG_HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  621  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  622  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  623  
f009c89df79abe John Garry      2020-03-28  624  #if !defined(outl) && !defined(_outl)
f009c89df79abe John Garry      2020-03-28  625  #define _outl _outl
cf97bf19566522 Niklas Schnelle 2021-12-20  626  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  627  static inline void _outl(u32 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  628  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  629  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  630  	__raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  631  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  632  }
cf97bf19566522 Niklas Schnelle 2021-12-20  633  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  634  void _outl(u32 value, unsigned long addr)
cf97bf19566522 Niklas Schnelle 2021-12-20  635  	__compiletime_error("outl() requires CONFIG_HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  636  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  637  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  638  
f009c89df79abe John Garry      2020-03-28  639  #include <linux/logic_pio.h>
f009c89df79abe John Garry      2020-03-28  640  
f009c89df79abe John Garry      2020-03-28  641  #ifndef inb
f009c89df79abe John Garry      2020-03-28  642  #define inb _inb
f009c89df79abe John Garry      2020-03-28  643  #endif
f009c89df79abe John Garry      2020-03-28  644  
f009c89df79abe John Garry      2020-03-28  645  #ifndef inw
f009c89df79abe John Garry      2020-03-28  646  #define inw _inw
f009c89df79abe John Garry      2020-03-28  647  #endif
f009c89df79abe John Garry      2020-03-28  648  
f009c89df79abe John Garry      2020-03-28  649  #ifndef inl
f009c89df79abe John Garry      2020-03-28  650  #define inl _inl
f009c89df79abe John Garry      2020-03-28  651  #endif
f009c89df79abe John Garry      2020-03-28  652  
f009c89df79abe John Garry      2020-03-28  653  #ifndef outb
f009c89df79abe John Garry      2020-03-28  654  #define outb _outb
f009c89df79abe John Garry      2020-03-28  655  #endif
f009c89df79abe John Garry      2020-03-28  656  
f009c89df79abe John Garry      2020-03-28  657  #ifndef outw
f009c89df79abe John Garry      2020-03-28  658  #define outw _outw
f009c89df79abe John Garry      2020-03-28  659  #endif
f009c89df79abe John Garry      2020-03-28  660  
f009c89df79abe John Garry      2020-03-28  661  #ifndef outl
f009c89df79abe John Garry      2020-03-28  662  #define outl _outl
f009c89df79abe John Garry      2020-03-28  663  #endif
f009c89df79abe John Garry      2020-03-28  664  
9216efafc52ff9 Thierry Reding  2014-10-01  665  #ifndef inb_p
9216efafc52ff9 Thierry Reding  2014-10-01  666  #define inb_p inb_p
9216efafc52ff9 Thierry Reding  2014-10-01  667  static inline u8 inb_p(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  668  {
9216efafc52ff9 Thierry Reding  2014-10-01  669  	return inb(addr);
9216efafc52ff9 Thierry Reding  2014-10-01  670  }
9216efafc52ff9 Thierry Reding  2014-10-01  671  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  672  
9216efafc52ff9 Thierry Reding  2014-10-01  673  #ifndef inw_p
9216efafc52ff9 Thierry Reding  2014-10-01  674  #define inw_p inw_p
9216efafc52ff9 Thierry Reding  2014-10-01  675  static inline u16 inw_p(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  676  {
9216efafc52ff9 Thierry Reding  2014-10-01  677  	return inw(addr);
9216efafc52ff9 Thierry Reding  2014-10-01  678  }
9216efafc52ff9 Thierry Reding  2014-10-01  679  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  680  
9216efafc52ff9 Thierry Reding  2014-10-01  681  #ifndef inl_p
9216efafc52ff9 Thierry Reding  2014-10-01  682  #define inl_p inl_p
9216efafc52ff9 Thierry Reding  2014-10-01  683  static inline u32 inl_p(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  684  {
9216efafc52ff9 Thierry Reding  2014-10-01  685  	return inl(addr);
9216efafc52ff9 Thierry Reding  2014-10-01  686  }
9216efafc52ff9 Thierry Reding  2014-10-01  687  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  688  
9216efafc52ff9 Thierry Reding  2014-10-01  689  #ifndef outb_p
9216efafc52ff9 Thierry Reding  2014-10-01  690  #define outb_p outb_p
9216efafc52ff9 Thierry Reding  2014-10-01  691  static inline void outb_p(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  692  {
9216efafc52ff9 Thierry Reding  2014-10-01  693  	outb(value, addr);
9216efafc52ff9 Thierry Reding  2014-10-01  694  }
9216efafc52ff9 Thierry Reding  2014-10-01  695  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  696  
9216efafc52ff9 Thierry Reding  2014-10-01  697  #ifndef outw_p
9216efafc52ff9 Thierry Reding  2014-10-01  698  #define outw_p outw_p
9216efafc52ff9 Thierry Reding  2014-10-01  699  static inline void outw_p(u16 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  700  {
9216efafc52ff9 Thierry Reding  2014-10-01  701  	outw(value, addr);
9216efafc52ff9 Thierry Reding  2014-10-01  702  }
9216efafc52ff9 Thierry Reding  2014-10-01  703  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  704  
9216efafc52ff9 Thierry Reding  2014-10-01  705  #ifndef outl_p
9216efafc52ff9 Thierry Reding  2014-10-01  706  #define outl_p outl_p
9216efafc52ff9 Thierry Reding  2014-10-01  707  static inline void outl_p(u32 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  708  {
9216efafc52ff9 Thierry Reding  2014-10-01  709  	outl(value, addr);
9216efafc52ff9 Thierry Reding  2014-10-01  710  }
9216efafc52ff9 Thierry Reding  2014-10-01  711  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  712  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  713  /*
9ab3a7a0d2b417 Thierry Reding  2014-07-04  714   * {in,out}s{b,w,l}{,_p}() are variants of the above that repeatedly access a
9ab3a7a0d2b417 Thierry Reding  2014-07-04  715   * single I/O port multiple times.
9ab3a7a0d2b417 Thierry Reding  2014-07-04  716   */
9ab3a7a0d2b417 Thierry Reding  2014-07-04  717  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  718  #ifndef insb
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @719  #define insb insb
cf97bf19566522 Niklas Schnelle 2021-12-20  720  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  721  static inline void insb(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  722  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  723  	readsb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  724  }
cf97bf19566522 Niklas Schnelle 2021-12-20  725  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  726  void insb(unsigned long addr, void *buffer, unsigned int count)
cf97bf19566522 Niklas Schnelle 2021-12-20  727  	__compiletime_error("insb() requires HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  728  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  729  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  730  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  731  #ifndef insw
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @732  #define insw insw
cf97bf19566522 Niklas Schnelle 2021-12-20  733  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  734  static inline void insw(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  735  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  736  	readsw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  737  }
cf97bf19566522 Niklas Schnelle 2021-12-20  738  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  739  void insw(unsigned long addr, void *buffer, unsigned int count)
cf97bf19566522 Niklas Schnelle 2021-12-20  740  	__compiletime_error("insw() requires HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  741  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  742  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  743  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  744  #ifndef insl
9ab3a7a0d2b417 Thierry Reding  2014-07-04  745  #define insl insl
cf97bf19566522 Niklas Schnelle 2021-12-20  746  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  747  static inline void insl(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  748  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  749  	readsl(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  750  }
cf97bf19566522 Niklas Schnelle 2021-12-20  751  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  752  void insl(unsigned long addr, void *buffer, unsigned int count)
cf97bf19566522 Niklas Schnelle 2021-12-20  753  	__compiletime_error("insl() requires HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  754  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  755  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  756  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  757  #ifndef outsb
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @758  #define outsb outsb
cf97bf19566522 Niklas Schnelle 2021-12-20  759  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  760  static inline void outsb(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding  2014-07-04  761  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  762  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  763  	writesb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  764  }
cf97bf19566522 Niklas Schnelle 2021-12-20  765  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  766  void outsb(unsigned long addr, const void *buffer, unsigned int count)
cf97bf19566522 Niklas Schnelle 2021-12-20  767  	__compiletime_error("outsb() requires HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  768  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  769  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  770  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  771  #ifndef outsw
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @772  #define outsw outsw
cf97bf19566522 Niklas Schnelle 2021-12-20  773  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  774  static inline void outsw(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding  2014-07-04  775  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  776  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  777  	writesw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  778  }
cf97bf19566522 Niklas Schnelle 2021-12-20  779  #else
cf97bf19566522 Niklas Schnelle 2021-12-20  780  void outsw(unsigned long addr, const void *buffer, unsigned int count)
cf97bf19566522 Niklas Schnelle 2021-12-20  781  	__compiletime_error("outsw() requires HAS_IOPORT");
cf97bf19566522 Niklas Schnelle 2021-12-20  782  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  783  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  784  

:::::: The code at line 595 was first introduced by commit
:::::: f009c89df79abea5f5244b8135a205f7d4352f86 io: Provide _inX() and _outX()

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Wei Xu <xuwei5@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
