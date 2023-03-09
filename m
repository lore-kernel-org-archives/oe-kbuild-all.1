Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BBD81C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678348697; x=1709884697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iq1xUhWUj39bRDEmOfBnZ/V9rO27nFrH3TDrB+B8g9Y=;
  b=FyvBazBHz8R2/e69QMJEZ9uI2MA84p/Jd6RkqWlh/XLLyFutoYy38Kt2
   1lYkbOsdC4R3DiLq0NPkFrCz8G1aKSAPeg/LBmha3/kD2McDVYX28TeT4
   Xfjs+6PFISvMe2Zu3NNF+sSSvQzZQAOKt6D9pzDQag+86TtLWEp1VDHSs
   POWbx+QSmGR0VqNuos4i8/5Qshol3MZ8j/NuLhhfvBpQAcYBhECuj5fID
   ly/QhZaJQVBUoj6YMwXsWxQbOdoNDW13T/J62mu3PwFpQXMLdUE9k7Ct1
   ttDmEse+wmQucVJcZemWOpC3kofc3+Ehdpb81U78zYfFyECtKwqm+DPHs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316039335"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316039335"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654659230"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="654659230"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Mar 2023 23:58:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paBAE-0002lN-1O;
	Thu, 09 Mar 2023 07:58:14 +0000
Date: Thu, 9 Mar 2023 15:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [niks:has_ioport_v3 38/38] include/asm-generic/io.h:595:15: error:
 call to '_outb' declared with attribute error: outb() requires
 CONFIG_HAS_IOPORT
Message-ID: <202303091549.Z5csVGht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v3
head:   88531a05c1cf54fae93cea9ac2120de9da9783fd
commit: 88531a05c1cf54fae93cea9ac2120de9da9783fd [38/38] asm-generic/io.h: drop inb() etc for HAS_IOPORT=n
config: arc-buildonly-randconfig-r001-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091549.Z5csVGht-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=88531a05c1cf54fae93cea9ac2120de9da9783fd
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v3
        git checkout 88531a05c1cf54fae93cea9ac2120de9da9783fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/net/wireless/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091549.Z5csVGht-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/io.h:233,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/arc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from drivers/net/wireless/wl3501_cs.c:33:
   drivers/net/wireless/wl3501_cs.c: In function 'wl3501_switch_page':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:190:9: note: in expansion of macro 'wl3501_outb'
     190 |         wl3501_outb(page, this->base_addr + WL3501_NIC_BSS);
         |         ^~~~~~~~~~~
   drivers/net/wireless/wl3501_cs.c: In function 'wl3501_ack_interrupt':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:1112:9: note: in expansion of macro 'wl3501_outb'
    1112 |         wl3501_outb(WL3501_GCR_ECINT, this->base_addr + WL3501_NIC_GCR);
         |         ^~~~~~~~~~~
   drivers/net/wireless/wl3501_cs.c: In function 'wl3501_get_from_wla':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:277:9: note: in expansion of macro 'wl3501_outb'
     277 |         wl3501_outb(src & 0xff, this->base_addr + WL3501_NIC_LMAL);
         |         ^~~~~~~~~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:278:9: note: in expansion of macro 'wl3501_outb'
     278 |         wl3501_outb((src >> 8) & 0x7f, this->base_addr + WL3501_NIC_LMAH);
         |         ^~~~~~~~~~~
>> include/asm-generic/io.h:719:14: error: call to 'insb' declared with attribute error: insb() requires HAS_IOPORT
     719 | #define insb insb
   drivers/net/wireless/wl3501_cs.c:281:9: note: in expansion of macro 'insb'
     281 |         insb(this->base_addr + WL3501_NIC_IODPA, dest, size);
         |         ^~~~
   drivers/net/wireless/wl3501_cs.c: In function 'wl3501_set_to_wla':
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:254:9: note: in expansion of macro 'wl3501_outb'
     254 |         wl3501_outb(dest & 0xff, this->base_addr + WL3501_NIC_LMAL);
         |         ^~~~~~~~~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:255:9: note: in expansion of macro 'wl3501_outb'
     255 |         wl3501_outb(((dest >> 8) & 0x7f), this->base_addr + WL3501_NIC_LMAH);
         |         ^~~~~~~~~~~
>> include/asm-generic/io.h:758:15: error: call to 'outsb' declared with attribute error: outsb() requires HAS_IOPORT
     758 | #define outsb outsb
   drivers/net/wireless/wl3501_cs.c:70:33: note: in expansion of macro 'outsb'
      70 | #define wl3501_outsb(a, b, c) { outsb(a, b, c); slow_down_io(); }
         |                                 ^~~~~
   drivers/net/wireless/wl3501_cs.c:258:9: note: in expansion of macro 'wl3501_outsb'
     258 |         wl3501_outsb(this->base_addr + WL3501_NIC_IODPA, src, size);
         |         ^~~~~~~~~~~~
   drivers/net/wireless/wl3501_cs.c: In function 'wl3501_block_interrupt':
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:733:18: note: in expansion of macro 'inb'
     733 |         u8 old = inb(this->base_addr + WL3501_NIC_GCR);
         |                  ^~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:737:9: note: in expansion of macro 'wl3501_outb'
     737 |         wl3501_outb(new, this->base_addr + WL3501_NIC_GCR);
         |         ^~~~~~~~~~~
   In function 'wl3501_get_flash_mac_addr',
       inlined from 'wl3501_config' at drivers/net/wireless/wl3501_cs.c:1941:2:
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:204:9: note: in expansion of macro 'wl3501_outb'
     204 |         wl3501_outb(WL3501_BSS_FPAGE3, base_addr + WL3501_NIC_BSS); /* BSS */
         |         ^~~~~~~~~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:205:9: note: in expansion of macro 'wl3501_outb'
     205 |         wl3501_outb(0x00, base_addr + WL3501_NIC_LMAL); /* LMAL */
         |         ^~~~~~~~~~~
>> include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:206:9: note: in expansion of macro 'wl3501_outb'
     206 |         wl3501_outb(0x40, base_addr + WL3501_NIC_LMAH); /* LMAH */
         |         ^~~~~~~~~~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:210:29: note: in expansion of macro 'inb'
     210 |         this->mac_addr[0] = inb(base_addr + WL3501_NIC_IODPA);
         |                             ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:212:29: note: in expansion of macro 'inb'
     212 |         this->mac_addr[1] = inb(base_addr + WL3501_NIC_IODPA);
         |                             ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:214:29: note: in expansion of macro 'inb'
     214 |         this->mac_addr[2] = inb(base_addr + WL3501_NIC_IODPA);
         |                             ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:216:29: note: in expansion of macro 'inb'
     216 |         this->mac_addr[3] = inb(base_addr + WL3501_NIC_IODPA);
         |                             ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:218:29: note: in expansion of macro 'inb'
     218 |         this->mac_addr[4] = inb(base_addr + WL3501_NIC_IODPA);
         |                             ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:220:29: note: in expansion of macro 'inb'
     220 |         this->mac_addr[5] = inb(base_addr + WL3501_NIC_IODPA);
         |                             ^~~
>> include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:222:28: note: in expansion of macro 'inb'
     222 |         this->reg_domain = inb(base_addr + WL3501_NIC_IODPA);
         |                            ^~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:224:9: note: in expansion of macro 'wl3501_outb'
     224 |         wl3501_outb(WL3501_BSS_FPAGE0, base_addr + WL3501_NIC_BSS);
         |         ^~~~~~~~~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:225:9: note: in expansion of macro 'wl3501_outb'
     225 |         wl3501_outb(0x04, base_addr + WL3501_NIC_LMAL);
         |         ^~~~~~~~~~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:226:9: note: in expansion of macro 'wl3501_outb'
     226 |         wl3501_outb(0x40, base_addr + WL3501_NIC_LMAH);
         |         ^~~~~~~~~~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:228:28: note: in expansion of macro 'inb'
     228 |         this->version[0] = inb(base_addr + WL3501_NIC_IODPA);
         |                            ^~~
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:230:28: note: in expansion of macro 'inb'
     230 |         this->version[1] = inb(base_addr + WL3501_NIC_IODPA);
         |                            ^~~
   drivers/net/wireless/wl3501_cs.c: In function 'wl3501_unblock_interrupt.isra':
   include/asm-generic/io.h:541:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     541 | #define _inb _inb
   include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
     642 | #define inb _inb
         |             ^~~~
   drivers/net/wireless/wl3501_cs.c:750:18: note: in expansion of macro 'inb'
     750 |         u8 old = inb(this->base_addr + WL3501_NIC_GCR);
         |                  ^~~
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   drivers/net/wireless/wl3501_cs.c:68:29: note: in expansion of macro 'outb'
      68 | #define wl3501_outb(a, b) { outb(a, b); slow_down_io(); }
         |                             ^~~~
   drivers/net/wireless/wl3501_cs.c:754:9: note: in expansion of macro 'wl3501_outb'
     754 |         wl3501_outb(new, this->base_addr + WL3501_NIC_GCR);
         |         ^~~~~~~~~~~
   In function 'outb_p',
       inlined from 'wl3501_reset_board' at drivers/net/wireless/wl3501_cs.c:1149:2,
       inlined from 'wl3501_init_firmware' at drivers/net/wireless/wl3501_cs.c:1184:11:
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:693:9: note: in expansion of macro 'outb'
     693 |         outb(value, addr);
         |         ^~~~
   In function 'outb_p',
       inlined from 'wl3501_reset_board' at drivers/net/wireless/wl3501_cs.c:1150:2,
       inlined from 'wl3501_init_firmware' at drivers/net/wireless/wl3501_cs.c:1184:11:
   include/asm-generic/io.h:595:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     595 | #define _outb _outb
         |               ^
   include/asm-generic/io.h:654:14: note: in expansion of macro '_outb'
     654 | #define outb _outb
         |              ^~~~~
   include/asm-generic/io.h:693:9: note: in expansion of macro 'outb'
     693 |         outb(value, addr);
         |         ^~~~
--
   In file included from arch/arc/include/asm/io.h:233,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/arc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from drivers/net/wireless/intersil/hostap/hostap_cs.c:9:
   drivers/net/wireless/intersil/hostap/hostap_hw.c: In function 'hfa384x_wait_offset':
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:722:19: note: in expansion of macro 'HFA384X_INW'
     722 |         int res = HFA384X_INW(o_off) & HFA384X_OFFSET_BUSY;
         |                   ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:727:23: note: in expansion of macro 'HFA384X_INW'
     727 |                 res = HFA384X_INW(o_off) & HFA384X_OFFSET_BUSY;
         |                       ^~~~~~~~~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c: In function 'prism2_read_fid_reg':
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:1891:23: note: in expansion of macro 'HFA384X_INW'
    1891 |                 val = HFA384X_INW(reg);
         |                       ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:1892:24: note: in expansion of macro 'HFA384X_INW'
    1892 |                 val2 = HFA384X_INW(reg);
         |                        ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:1893:24: note: in expansion of macro 'HFA384X_INW'
    1893 |                 val3 = HFA384X_INW(reg);
         |                        ^~~~~~~~~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c: In function 'hfa384x_read_regs':
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:153:21: note: in expansion of macro 'HFA384X_INW'
     153 |         regs->cmd = HFA384X_INW(HFA384X_CMD_OFF);
         |                     ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:154:24: note: in expansion of macro 'HFA384X_INW'
     154 |         regs->evstat = HFA384X_INW(HFA384X_EVSTAT_OFF);
         |                        ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:155:25: note: in expansion of macro 'HFA384X_INW'
     155 |         regs->offset0 = HFA384X_INW(HFA384X_OFFSET0_OFF);
         |                         ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:156:25: note: in expansion of macro 'HFA384X_INW'
     156 |         regs->offset1 = HFA384X_INW(HFA384X_OFFSET1_OFF);
         |                         ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:157:28: note: in expansion of macro 'HFA384X_INW'
     157 |         regs->swsupport0 = HFA384X_INW(HFA384X_SWSUPPORT0_OFF);
         |                            ^~~~~~~~~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c: In function 'hfa384x_cmd_issue':
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:266:16: note: in expansion of macro 'HFA384X_INW'
     266 |         while (HFA384X_INW(HFA384X_CMD_OFF) & HFA384X_CMD_BUSY && tries > 0) {
         |                ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:279:23: note: in expansion of macro 'HFA384X_INW'
     279 |                 reg = HFA384X_INW(HFA384X_CMD_OFF);
         |                       ^~~~~~~~~~~
>> include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:288:9: note: in expansion of macro 'HFA384X_OUTW'
     288 |         HFA384X_OUTW(entry->param0, HFA384X_PARAM0_OFF);
         |         ^~~~~~~~~~~~
>> include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:289:9: note: in expansion of macro 'HFA384X_OUTW'
     289 |         HFA384X_OUTW(entry->param1, HFA384X_PARAM1_OFF);
         |         ^~~~~~~~~~~~
>> include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:290:9: note: in expansion of macro 'HFA384X_OUTW'
     290 |         HFA384X_OUTW(entry->cmd, HFA384X_CMD_OFF);
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c: In function 'hfa384x_disable_interrupts':
>> include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:926:9: note: in expansion of macro 'HFA384X_OUTW'
     926 |         HFA384X_OUTW(0, HFA384X_INTEN_OFF);
         |         ^~~~~~~~~~~~
>> include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:927:9: note: in expansion of macro 'HFA384X_OUTW'
     927 |         HFA384X_OUTW(0xffff, HFA384X_EVACK_OFF);
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c: In function 'hfa384x_events_only_cmd':
>> include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:954:9: note: in expansion of macro 'HFA384X_OUTW'
     954 |         HFA384X_OUTW(HFA384X_EV_CMD, HFA384X_INTEN_OFF);
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c: In function '__hfa384x_cmd_no_wait':
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:546:16: note: in expansion of macro 'HFA384X_INW'
     546 |         while (HFA384X_INW(HFA384X_CMD_OFF) & HFA384X_CMD_BUSY && tries > 0) {
         |                ^~~~~~~~~~~
>> include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:551:23: note: in expansion of macro 'HFA384X_INW'
     551 |                 reg = HFA384X_INW(HFA384X_CMD_OFF);
         |                       ^~~~~~~~~~~
   include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:559:9: note: in expansion of macro 'HFA384X_OUTW'
     559 |         HFA384X_OUTW(param0, HFA384X_PARAM0_OFF);
         |         ^~~~~~~~~~~~
   include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_hw.c:560:9: note: in expansion of macro 'HFA384X_OUTW'
     560 |         HFA384X_OUTW(cmd, HFA384X_CMD_OFF);
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intersil/hostap/hostap_download.c: In function 'prism2_enable_aux_port':
   include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_download.c:25:16: note: in expansion of macro 'HFA384X_INW'
      25 |         while (HFA384X_INW(HFA384X_CMD_OFF) & HFA384X_CMD_BUSY && tries > 0) {
         |                ^~~~~~~~~~~
   include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_download.c:30:23: note: in expansion of macro 'HFA384X_INW'
      30 |                 reg = HFA384X_INW(HFA384X_CMD_OFF);
         |                       ^~~~~~~~~~~
   include/asm-generic/io.h:559:14: error: call to '_inw' declared with attribute error: inw() requires CONFIG_HAS_IOPORT
     559 | #define _inw _inw
   include/asm-generic/io.h:646:13: note: in expansion of macro '_inw'
     646 | #define inw _inw
         |             ^~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:148:24: note: in expansion of macro 'inw'
     148 | #define HFA384X_INW(a) inw(dev->base_addr + (a))
         |                        ^~~
   drivers/net/wireless/intersil/hostap/hostap_download.c:37:15: note: in expansion of macro 'HFA384X_INW'
      37 |         val = HFA384X_INW(HFA384X_CONTROL_OFF);
         |               ^~~~~~~~~~~
   include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_download.c:40:17: note: in expansion of macro 'HFA384X_OUTW'
      40 |                 HFA384X_OUTW(HFA384X_AUX_MAGIC0, HFA384X_PARAM0_OFF);
         |                 ^~~~~~~~~~~~
   include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_download.c:41:17: note: in expansion of macro 'HFA384X_OUTW'
      41 |                 HFA384X_OUTW(HFA384X_AUX_MAGIC1, HFA384X_PARAM1_OFF);
         |                 ^~~~~~~~~~~~
   include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT
     610 | #define _outw _outw
   include/asm-generic/io.h:658:14: note: in expansion of macro '_outw'
     658 | #define outw _outw
         |              ^~~~~
   drivers/net/wireless/intersil/hostap/hostap_cs.c:147:27: note: in expansion of macro 'outw'
     147 | #define HFA384X_OUTW(v,a) outw((v), dev->base_addr + (a))
         |                           ^~~~
   drivers/net/wireless/intersil/hostap/hostap_download.c:42:17: note: in expansion of macro 'HFA384X_OUTW'
      42 |                 HFA384X_OUTW(HFA384X_AUX_MAGIC2, HFA384X_PARAM2_OFF);
         |                 ^~~~~~~~~~~~
   include/asm-generic/io.h:610:15: error: call to '_outw' declared with attribute error: outw() requires CONFIG_HAS_IOPORT


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
88531a05c1cf54 Niklas Schnelle 2021-12-20  542  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  543  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  544  {
87fe2d543f8173 Sinan Kaya      2018-04-05  545  	u8 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  546  
87fe2d543f8173 Sinan Kaya      2018-04-05  547  	__io_pbr();
87fe2d543f8173 Sinan Kaya      2018-04-05  548  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon     2019-02-22  549  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  550  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  551  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  552  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  553  u8 _inb(unsigned long addr)
88531a05c1cf54 Niklas Schnelle 2021-12-20  554  	__compiletime_error("inb()) requires CONFIG_HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  555  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  556  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  557  
f009c89df79abe John Garry      2020-03-28  558  #if !defined(inw) && !defined(_inw)
f009c89df79abe John Garry      2020-03-28 @559  #define _inw _inw
88531a05c1cf54 Niklas Schnelle 2021-12-20  560  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  561  static inline u16 _inw(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  562  {
87fe2d543f8173 Sinan Kaya      2018-04-05  563  	u16 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  564  
87fe2d543f8173 Sinan Kaya      2018-04-05  565  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  566  	val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  567  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  568  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  569  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  570  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  571  u16 _inw(unsigned long addr)
88531a05c1cf54 Niklas Schnelle 2021-12-20  572  	__compiletime_error("inw() requires CONFIG_HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  573  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  574  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  575  
f009c89df79abe John Garry      2020-03-28  576  #if !defined(inl) && !defined(_inl)
f009c89df79abe John Garry      2020-03-28  577  #define _inl _inl
88531a05c1cf54 Niklas Schnelle 2021-12-20  578  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  579  static inline u32 _inl(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  580  {
87fe2d543f8173 Sinan Kaya      2018-04-05  581  	u32 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  582  
87fe2d543f8173 Sinan Kaya      2018-04-05  583  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  584  	val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  585  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  586  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  587  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  588  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  589  u32 _inl(unsigned long addr)
88531a05c1cf54 Niklas Schnelle 2021-12-20  590  	__compiletime_error("inl() requires CONFIG_HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  591  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  592  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  593  
f009c89df79abe John Garry      2020-03-28  594  #if !defined(outb) && !defined(_outb)
f009c89df79abe John Garry      2020-03-28 @595  #define _outb _outb
88531a05c1cf54 Niklas Schnelle 2021-12-20  596  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  597  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  598  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  599  	__io_pbw();
a7851aa54c0cdd Sinan Kaya      2018-04-05  600  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  601  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  602  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  603  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  604  void _outb(u8 value, unsigned long addr)
88531a05c1cf54 Niklas Schnelle 2021-12-20  605  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  606  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  607  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  608  
f009c89df79abe John Garry      2020-03-28  609  #if !defined(outw) && !defined(_outw)
f009c89df79abe John Garry      2020-03-28 @610  #define _outw _outw
88531a05c1cf54 Niklas Schnelle 2021-12-20  611  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  612  static inline void _outw(u16 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  613  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  614  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  615  	__raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  616  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  617  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  618  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  619  void _outw(u16 value, unsigned long addr)
88531a05c1cf54 Niklas Schnelle 2021-12-20  620  	__compiletime_error("outw() requires CONFIG_HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  621  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  622  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  623  
f009c89df79abe John Garry      2020-03-28  624  #if !defined(outl) && !defined(_outl)
f009c89df79abe John Garry      2020-03-28  625  #define _outl _outl
88531a05c1cf54 Niklas Schnelle 2021-12-20  626  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  627  static inline void _outl(u32 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  628  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  629  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  630  	__raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  631  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  632  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  633  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  634  void _outl(u32 value, unsigned long addr)
88531a05c1cf54 Niklas Schnelle 2021-12-20  635  	__compiletime_error("outl() requires CONFIG_HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  636  #endif
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
f009c89df79abe John Garry      2020-03-28 @654  #define outb _outb
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
88531a05c1cf54 Niklas Schnelle 2021-12-20  720  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  721  static inline void insb(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  722  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  723  	readsb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  724  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  725  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  726  void insb(unsigned long addr, void *buffer, unsigned int count)
88531a05c1cf54 Niklas Schnelle 2021-12-20  727  	__compiletime_error("insb() requires HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  728  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  729  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  730  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  731  #ifndef insw
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @732  #define insw insw
88531a05c1cf54 Niklas Schnelle 2021-12-20  733  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  734  static inline void insw(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  735  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  736  	readsw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  737  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  738  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  739  void insw(unsigned long addr, void *buffer, unsigned int count)
88531a05c1cf54 Niklas Schnelle 2021-12-20  740  	__compiletime_error("insw() requires HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  741  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  742  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  743  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  744  #ifndef insl
9ab3a7a0d2b417 Thierry Reding  2014-07-04  745  #define insl insl
88531a05c1cf54 Niklas Schnelle 2021-12-20  746  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  747  static inline void insl(unsigned long addr, void *buffer, unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  748  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  749  	readsl(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  750  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  751  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  752  void insl(unsigned long addr, void *buffer, unsigned int count)
88531a05c1cf54 Niklas Schnelle 2021-12-20  753  	__compiletime_error("insl() requires HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  754  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  755  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  756  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  757  #ifndef outsb
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @758  #define outsb outsb
88531a05c1cf54 Niklas Schnelle 2021-12-20  759  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  760  static inline void outsb(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding  2014-07-04  761  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  762  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  763  	writesb(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  764  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  765  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  766  void outsb(unsigned long addr, const void *buffer, unsigned int count)
88531a05c1cf54 Niklas Schnelle 2021-12-20  767  	__compiletime_error("outsb() requires HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  768  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  769  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  770  
9ab3a7a0d2b417 Thierry Reding  2014-07-04  771  #ifndef outsw
9ab3a7a0d2b417 Thierry Reding  2014-07-04 @772  #define outsw outsw
88531a05c1cf54 Niklas Schnelle 2021-12-20  773  #ifdef CONFIG_HAS_IOPORT
9ab3a7a0d2b417 Thierry Reding  2014-07-04  774  static inline void outsw(unsigned long addr, const void *buffer,
9ab3a7a0d2b417 Thierry Reding  2014-07-04  775  			 unsigned int count)
9ab3a7a0d2b417 Thierry Reding  2014-07-04  776  {
9ab3a7a0d2b417 Thierry Reding  2014-07-04  777  	writesw(PCI_IOBASE + addr, buffer, count);
9ab3a7a0d2b417 Thierry Reding  2014-07-04  778  }
88531a05c1cf54 Niklas Schnelle 2021-12-20  779  #else
88531a05c1cf54 Niklas Schnelle 2021-12-20  780  void outsw(unsigned long addr, const void *buffer, unsigned int count)
88531a05c1cf54 Niklas Schnelle 2021-12-20  781  	__compiletime_error("outsw() requires HAS_IOPORT");
88531a05c1cf54 Niklas Schnelle 2021-12-20  782  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  783  #endif
9ab3a7a0d2b417 Thierry Reding  2014-07-04  784  

:::::: The code at line 595 was first introduced by commit
:::::: f009c89df79abea5f5244b8135a205f7d4352f86 io: Provide _inX() and _outX()

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Wei Xu <xuwei5@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
