Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70336F90C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 06:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790405585; cv=none; b=iUutm9+JnKpsGLCMOeg7TWtc81FiNkpn084pDr/6fSFxmiGnHb7MPvsgNQG6Ix9Pe2nqvsds1hDfbTpOKSsA7Mjc5/HePokxKtSpN5Bs6VPyXDw2HJ4BVF1PWn6RdDSxsd4pwOmZpycjvPl7rflDCo51xG8Y8HlHypMCNllaO5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790405585; c=relaxed/simple;
	bh=DokH3eYy2zV0QoV6ctNMK0wDscnZe/K9kb4z1PSjgsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=haOU1MHT9QVTTCZt9N2suhsQgaZ7+xnl/Z6n76e/Tj6a/GuPhwUgHo/lLa+QzrDtmIgw3dn1T0c7vmXpinaXZTZ2ObdSNiWdbiFOk4Yj7uZjfSaJEm9HTHRO4W+4olORO+84k7CioSOmLSOYKIWG0DYh6EeSNTku4ypP8+CT8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRxjcTTX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRxjcTTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790405582; x=1821941582;
  h=date:from:to:cc:subject:message-id;
  bh=DokH3eYy2zV0QoV6ctNMK0wDscnZe/K9kb4z1PSjgsE=;
  b=CRxjcTTXaTjarXuWPIGnub//qTjRGM+oz2Z4HcrTrcB4wY2ID4g/NTBl
   JJLLICjvzK7MhJWnoOEbNj+TK4wuvRn2YXFHOrE7anKEyZXjd5L/5JkCR
   9x4zFWMhEIWxz4/iIxQcNwiGX50YL3RApzJH/7AMfv9922o1Lw0yyWge1
   F0QL63d2SIXUGo55XNoAseCMGb64pC22a2BzBcBzCRn18rPLOvGfGZj5l
   ZAYZ1hzRZmM1XeqeswjY7PXkQTbQMuGArd/j8gKlJ76gDSq8ZJKEVxmet
   HKddSLKQti6HEgZizWfDi/RyxS0m8R4hhGP/oL4Y5F2NWzeMJoGtsdWEc
   Q==;
X-CSE-ConnectionGUID: pJip9x4IQYe/MUudIFMs5A==
X-CSE-MsgGUID: u4plWODHSFKplZkRuFP89A==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90088681"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90088681"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 23:52:59 -0700
X-CSE-ConnectionGUID: iLElG7czTIKFccsAIr//gg==
X-CSE-MsgGUID: NU7qRNjjQBCgwaIE5uyJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="312432624"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2026 23:52:57 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAMHH-000000000Rj-1Q7C;
	Sat, 26 Sep 2026 06:52:55 +0000
Date: Sat, 26 Sep 2026 08:52:03 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 426/673]
 drivers/tty/serial/sunsab.c:96:23: warning: passing argument 1 of 'readb'
 discards 'volatile' qualifier from pointer target type
Message-ID: <202609260857.rtwTz8cc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 34a7b291ebc9fbf0074ef62ba0bdc12fd356c2b1 [426/673] mmio: remove extraneous 'volatile' annotations'
config: sparc-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260857.rtwTz8cc-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260857.rtwTz8cc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260857.rtwTz8cc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/sunsab.c: In function 'sunsab_tec_wait':
>> drivers/tty/serial/sunsab.c:96:23: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
      96 |         while ((readb(&up->regs->r.star) & SAB82532_STAR_TEC) && --timeout)
         |                       ^~~~~~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/io_32.h:21,
                    from arch/sparc/include/asm/io.h:7,
                    from include/linux/io.h:12,
                    from drivers/tty/serial/sunsab.c:39:
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c: In function 'sunsab_cec_wait':
   drivers/tty/serial/sunsab.c:104:23: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     104 |         while ((readb(&up->regs->r.star) & SAB82532_STAR_CEC) && --timeout)
         |                       ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c: In function 'receive_chars':
   drivers/tty/serial/sunsab.c:129:31: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     129 |                 count = readb(&up->regs->r.rbcl) & (SAB82532_RECV_FIFO_SIZE - 1);
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/tty/serial/sunsab.c:136:44: warning: passing argument 2 of 'writeb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     136 |                 writeb(SAB82532_CMDR_RFRD, &up->regs->w.cmdr);
         |                                            ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:260:51: note: expected 'void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     260 | static inline void writeb(u8 value, void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:145:32: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     145 |                 buf[i] = readb(&up->regs->r.rfifo[i]);
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:150:43: warning: passing argument 2 of 'writeb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     150 |                 writeb(SAB82532_CMDR_RMC, &up->regs->w.cmdr);
         |                                           ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:260:51: note: expected 'void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     260 | static inline void writeb(u8 value, void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c: In function 'transmit_chars':
   drivers/tty/serial/sunsab.c:240:45: warning: passing argument 2 of 'writeb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     240 |                 writeb(up->interrupt_mask1, &up->regs->w.imr1);
         |                                             ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:260:51: note: expected 'void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     260 | static inline void writeb(u8 value, void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:249:21: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     249 |         if (!(readb(&up->regs->r.star) & SAB82532_STAR_XFW))
         |                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:257:45: warning: passing argument 2 of 'writeb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     257 |                 writeb(up->interrupt_mask1, &up->regs->w.imr1);
         |                                             ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:260:51: note: expected 'void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     260 | static inline void writeb(u8 value, void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:262:37: warning: passing argument 2 of 'writeb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     262 |         writeb(up->interrupt_mask1, &up->regs->w.imr1);
         |                                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:260:51: note: expected 'void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     260 | static inline void writeb(u8 value, void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:273:28: warning: passing argument 2 of 'writeb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     273 |                 writeb(ch, &up->regs->w.xfifo[i]);
         |                            ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:260:51: note: expected 'void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     260 | static inline void writeb(u8 value, void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:278:34: warning: passing argument 2 of 'writeb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     278 |         writeb(SAB82532_CMDR_XF, &up->regs->w.cmdr);
         |                                  ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:260:51: note: expected 'void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     260 | static inline void writeb(u8 value, void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c: In function 'check_status':
   drivers/tty/serial/sunsab.c:292:48: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     292 |                                        !(readb(&up->regs->r.vstr) & SAB82532_VSTR_CD));
         |                                                ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:296:47: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     296 |                                        (readb(&up->regs->r.star) & SAB82532_STAR_CTS));
         |                                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:298:20: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     298 |         if ((readb(&up->regs->r.pvr) & up->pvr_dsr_bit) ^ up->dsr) {
         |                    ^~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:299:34: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     299 |                 up->dsr = (readb(&up->regs->r.pvr) & up->pvr_dsr_bit) ? 0 : 1;
         |                                  ^~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c: In function 'sunsab_interrupt':
   drivers/tty/serial/sunsab.c:317:21: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     317 |         gis = readb(&up->regs->r.gis) >> up->gis_shift;
         |                     ^~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:319:42: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     319 |                 status.sreg.isr0 = readb(&up->regs->r.isr0);
         |                                          ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c:321:42: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     321 |                 status.sreg.isr1 = readb(&up->regs->r.isr1);
         |                                          ^~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:190:44: note: expected 'const void *' but argument is of type 'volatile u8 *' {aka 'volatile unsigned char *'}
     190 | static inline u8 readb(const void __iomem *addr)
         |                        ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/tty/serial/sunsab.c: In function 'sunsab_get_mctrl':
   drivers/tty/serial/sunsab.c:393:21: warning: passing argument 1 of 'readb' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]


vim +96 drivers/tty/serial/sunsab.c

^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16   91  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16   92  static __inline__ void sunsab_tec_wait(struct uart_sunsab_port *up)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16   93  {
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16   94  	int timeout = up->tec_timeout;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16   95  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  @96  	while ((readb(&up->regs->r.star) & SAB82532_STAR_TEC) && --timeout)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16   97  		udelay(1);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16   98  }
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16   99  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  100  static __inline__ void sunsab_cec_wait(struct uart_sunsab_port *up)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  101  {
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  102  	int timeout = up->cec_timeout;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  103  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  104  	while ((readb(&up->regs->r.star) & SAB82532_STAR_CEC) && --timeout)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  105  		udelay(1);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  106  }
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  107  
2e124b4a390ca8 drivers/tty/serial/sunsab.c Jiri Slaby                           2013-01-03  108  static struct tty_port *
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  109  receive_chars(struct uart_sunsab_port *up,
7d12e780e003f9 drivers/serial/sunsab.c     David Howells                        2006-10-05  110  	      union sab82532_irq_status *stat)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  111  {
92a19f9cec9a80 drivers/tty/serial/sunsab.c Jiri Slaby                           2013-01-03  112  	struct tty_port *port = NULL;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  113  	unsigned char buf[32];
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  114  	int saw_console_brk = 0;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  115  	int free_fifo = 0;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  116  	int count = 0;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  117  	int i;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  118  
2e124b4a390ca8 drivers/tty/serial/sunsab.c Jiri Slaby                           2013-01-03  119  	if (up->port.state != NULL)		/* Unopened serial console */
92a19f9cec9a80 drivers/tty/serial/sunsab.c Jiri Slaby                           2013-01-03  120  		port = &up->port.state->port;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  121  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  122  	/* Read number of BYTES (Character + Status) available. */
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  123  	if (stat->sreg.isr0 & SAB82532_ISR0_RPF) {
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  124  		count = SAB82532_RECV_FIFO_SIZE;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  125  		free_fifo++;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  126  	}
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  127  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  128  	if (stat->sreg.isr0 & SAB82532_ISR0_TCD) {
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16 @129  		count = readb(&up->regs->r.rbcl) & (SAB82532_RECV_FIFO_SIZE - 1);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  130  		free_fifo++;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  131  	}
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  132  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  133  	/* Issue a FIFO read command in case we where idle. */
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  134  	if (stat->sreg.isr0 & SAB82532_ISR0_TIME) {
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  135  		sunsab_cec_wait(up);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16 @136  		writeb(SAB82532_CMDR_RFRD, &up->regs->w.cmdr);
2e124b4a390ca8 drivers/tty/serial/sunsab.c Jiri Slaby                           2013-01-03  137  		return port;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  138  	}
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  139  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  140  	if (stat->sreg.isr0 & SAB82532_ISR0_RFO)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  141  		free_fifo++;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  142  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  143  	/* Read the FIFO. */
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  144  	for (i = 0; i < count; i++)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  145  		buf[i] = readb(&up->regs->r.rfifo[i]);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  146  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  147  	/* Issue Receive Message Complete command. */
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  148  	if (free_fifo) {
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  149  		sunsab_cec_wait(up);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  150  		writeb(SAB82532_CMDR_RMC, &up->regs->w.cmdr);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  151  	}
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  152  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  153  	/* Count may be zero for BRK, so we check for it here */
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  154  	if ((stat->sreg.isr1 & SAB82532_ISR1_BRK) &&
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  155  	    (up->port.line == up->port.cons->index))
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  156  		saw_console_brk = 1;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  157  
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  158  	if (count == 0) {
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  159  		if (unlikely(stat->sreg.isr1 & SAB82532_ISR1_BRK)) {
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  160  			stat->sreg.isr0 &= ~(SAB82532_ISR0_PERR |
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  161  					     SAB82532_ISR0_FERR);
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  162  			up->port.icount.brk++;
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  163  			uart_handle_break(&up->port);
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  164  		}
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  165  	}
fe418231b195c2 drivers/tty/serial/sunsab.c Christopher Alexander Tobias Schulze 2014-08-03  166  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  167  	for (i = 0; i < count; i++) {
33f0f88f1c51ae drivers/serial/sunsab.c     Alan Cox                             2006-01-09  168  		unsigned char ch = buf[i], flag;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  169  
33f0f88f1c51ae drivers/serial/sunsab.c     Alan Cox                             2006-01-09  170  		flag = TTY_NORMAL;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  171  		up->port.icount.rx++;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  172  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  173  		if (unlikely(stat->sreg.isr0 & (SAB82532_ISR0_PERR |
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  174  						SAB82532_ISR0_FERR |
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  175  						SAB82532_ISR0_RFO)) ||
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  176  		    unlikely(stat->sreg.isr1 & SAB82532_ISR1_BRK)) {
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  177  			/*
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  178  			 * For statistics only
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  179  			 */
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  180  			if (stat->sreg.isr1 & SAB82532_ISR1_BRK) {
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  181  				stat->sreg.isr0 &= ~(SAB82532_ISR0_PERR |
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  182  						     SAB82532_ISR0_FERR);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  183  				up->port.icount.brk++;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  184  				/*
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  185  				 * We do the SysRQ and SAK checking
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  186  				 * here because otherwise the break
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  187  				 * may get masked by ignore_status_mask
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  188  				 * or read_status_mask.
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  189  				 */
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  190  				if (uart_handle_break(&up->port))
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  191  					continue;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  192  			} else if (stat->sreg.isr0 & SAB82532_ISR0_PERR)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  193  				up->port.icount.parity++;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  194  			else if (stat->sreg.isr0 & SAB82532_ISR0_FERR)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  195  				up->port.icount.frame++;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  196  			if (stat->sreg.isr0 & SAB82532_ISR0_RFO)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  197  				up->port.icount.overrun++;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  198  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  199  			/*
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  200  			 * Mask off conditions which should be ingored.
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  201  			 */
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  202  			stat->sreg.isr0 &= (up->port.read_status_mask & 0xff);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  203  			stat->sreg.isr1 &= ((up->port.read_status_mask >> 8) & 0xff);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  204  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  205  			if (stat->sreg.isr1 & SAB82532_ISR1_BRK) {
33f0f88f1c51ae drivers/serial/sunsab.c     Alan Cox                             2006-01-09  206  				flag = TTY_BREAK;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  207  			} else if (stat->sreg.isr0 & SAB82532_ISR0_PERR)
33f0f88f1c51ae drivers/serial/sunsab.c     Alan Cox                             2006-01-09  208  				flag = TTY_PARITY;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  209  			else if (stat->sreg.isr0 & SAB82532_ISR0_FERR)
33f0f88f1c51ae drivers/serial/sunsab.c     Alan Cox                             2006-01-09  210  				flag = TTY_FRAME;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  211  		}
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  212  
7bbe08d6b89fce drivers/tty/serial/sunsab.c Jiri Slaby                           2013-03-14  213  		if (uart_handle_sysrq_char(&up->port, ch) || !port)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  214  			continue;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  215  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  216  		if ((stat->sreg.isr0 & (up->port.ignore_status_mask & 0xff)) == 0 &&
33f0f88f1c51ae drivers/serial/sunsab.c     Alan Cox                             2006-01-09  217  		    (stat->sreg.isr1 & ((up->port.ignore_status_mask >> 8) & 0xff)) == 0)
92a19f9cec9a80 drivers/tty/serial/sunsab.c Jiri Slaby                           2013-01-03  218  			tty_insert_flip_char(port, ch, flag);
33f0f88f1c51ae drivers/serial/sunsab.c     Alan Cox                             2006-01-09  219  		if (stat->sreg.isr0 & SAB82532_ISR0_RFO)
92a19f9cec9a80 drivers/tty/serial/sunsab.c Jiri Slaby                           2013-01-03  220  			tty_insert_flip_char(port, 0, TTY_OVERRUN);
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  221  	}
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  222  
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  223  	if (saw_console_brk)
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  224  		sun_do_break();
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  225  
2e124b4a390ca8 drivers/tty/serial/sunsab.c Jiri Slaby                           2013-01-03  226  	return port;
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  227  }
^1da177e4c3f41 drivers/serial/sunsab.c     Linus Torvalds                       2005-04-16  228  

:::::: The code at line 96 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
