Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1887915B984
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737128585; cv=none; b=YXZZIRD6CkSTu4J/e/4GkTXQSD440Ii3zbxD+6tJ92rqObaIRFbcaRi/+K7gNxtMvLR2ngvWKhusq8PvnhXjsIOGMgIGEdhNUjCPl0VVfxFatFvN1pzfiHQNyQCYiFSON6r6uq7KLjGZWDAj/0w5HE8AKJYt7YuyflnBQ7eosLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737128585; c=relaxed/simple;
	bh=16FO5eoD288qhs6HYei6RkA4gDxzMJLMzXdhmm+VMcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KrwIjnClZ+XBAvU6girv8fLuZiFEykgzMhozzkR8to9Ey3e1YlNeaamrfjBersY6CHNNFa5upGdwi/A3tHyFX18nVaEUOq/S46eenBWxF8u4GUSzPchte/gK6WlLnXIBE8boviv0iqk2hBbh/k4z2gTtwHmzc88d4SoG2MPWGx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIUBmaMa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIUBmaMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737128583; x=1768664583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=16FO5eoD288qhs6HYei6RkA4gDxzMJLMzXdhmm+VMcs=;
  b=RIUBmaMaHor81zMwwJWwyh8LgjG5Kmrt4ttTmhxK/5CIe2yaCE0igsKM
   w19NCJVHWuTYUQiC+wJ4NLq8w9am36StoZrR8O4IMIaiA18i++h2YbJJZ
   xRyq4TOBBklTmufq1+ZE98ttnzfRTBufJdKzoN6UxyALhxcL6VDmX2cQW
   UlQbwQtn9L1kWMlxa1Jy+osKYBikJdK/pQWD5c4Ry3XEaFBR63OrVEk5z
   8fQCWOcjO9+iXk+M9doOmHDn7lIbvRH/zhdUzqp1MJpL4ABxEj1WXXmGW
   xffBoQ+8AlCgTbAKThzxJ6rDnvVlLzdNxrH4vyM/3B71bWqJlcClniU9i
   w==;
X-CSE-ConnectionGUID: UaMdsTOGTAiShZQpO4ELeQ==
X-CSE-MsgGUID: 6E/ICmUlRCOfBF6MqmGYcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37444995"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37444995"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:43:03 -0800
X-CSE-ConnectionGUID: O/+aIf2pSta1kQ82Xa+ynQ==
X-CSE-MsgGUID: fxpTd7QrSA+qpdykVXZp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106294804"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 07:43:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYoUs-000TPr-1C;
	Fri, 17 Jan 2025 15:42:58 +0000
Date: Fri, 17 Jan 2025 23:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: include/asm-generic/io.h:596:15: error: call to '_outb' declared
 with attribute error: outb() requires CONFIG_HAS_IOPORT
Message-ID: <202501172323.oAy8qQdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bffa1ad25b8b3b95d8f463e5c24dabe3c87d54d
commit: 6f043e75744596968b6547c4bd43e4d30bbb6d6e asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
date:   3 months ago
config: m68k-randconfig-r063-20250117 (https://download.01.org/0day-ci/archive/20250117/202501172323.oAy8qQdF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172323.oAy8qQdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172323.oAy8qQdF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/8390/mcf8390.c:59:6: warning: no previous prototype for 'ei_outb' [-Wmissing-prototypes]
      59 | void ei_outb(u32 val, u32 addr)
         |      ^~~~~~~
   drivers/net/ethernet/8390/mcf8390.c:67:17: warning: no previous prototype for 'ei_inb' [-Wmissing-prototypes]
      67 | #define ei_inb  ei_inb
         |                 ^~~~~~
   drivers/net/ethernet/8390/mcf8390.c:68:4: note: in expansion of macro 'ei_inb'
      68 | u8 ei_inb(u32 addr)
         |    ^~~~~~
   drivers/net/ethernet/8390/mcf8390.c:77:6: warning: no previous prototype for 'ei_insb' [-Wmissing-prototypes]
      77 | void ei_insb(u32 addr, void *vbuf, int len)
         |      ^~~~~~~
   drivers/net/ethernet/8390/mcf8390.c:90:6: warning: no previous prototype for 'ei_insw' [-Wmissing-prototypes]
      90 | void ei_insw(u32 addr, void *vbuf, int len)
         |      ^~~~~~~
   drivers/net/ethernet/8390/mcf8390.c:103:6: warning: no previous prototype for 'ei_outsb' [-Wmissing-prototypes]
     103 | void ei_outsb(u32 addr, const void *vbuf, int len)
         |      ^~~~~~~~
   drivers/net/ethernet/8390/mcf8390.c:116:6: warning: no previous prototype for 'ei_outsw' [-Wmissing-prototypes]
     116 | void ei_outsw(u32 addr, const void *vbuf, int len)
         |      ^~~~~~~~
   In file included from arch/m68k/include/asm/io.h:14,
                    from arch/m68k/include/asm/pgtable_no.h:14,
                    from arch/m68k/include/asm/pgtable.h:8,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/m68k/include/asm/cacheflush_no.h:8,
                    from arch/m68k/include/asm/cacheflush.h:3,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/8390/mcf8390.c:15:
   drivers/net/ethernet/8390/mcf8390.c: In function 'mcf8390_get_8390_hdr':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/net/ethernet/8390/mcf8390.c:211:9: note: in expansion of macro 'outb'
     211 |         outb(ENISR_RDC, addr + NE_EN0_ISR);     /* Ack intr */
         |         ^~~~


vim +/_outb +596 include/asm-generic/io.h

9216efafc52ff99 Thierry Reding  2014-10-01  594  
f009c89df79abea John Garry      2020-03-28  595  #if !defined(outb) && !defined(_outb)
f009c89df79abea John Garry      2020-03-28 @596  #define _outb _outb
6f043e757445969 Niklas Schnelle 2024-10-24  597  #ifdef CONFIG_HAS_IOPORT
f009c89df79abea John Garry      2020-03-28  598  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff99 Thierry Reding  2014-10-01  599  {
a7851aa54c0cdd2 Sinan Kaya      2018-04-05  600  	__io_pbw();
a7851aa54c0cdd2 Sinan Kaya      2018-04-05  601  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd2 Sinan Kaya      2018-04-05  602  	__io_paw();
9216efafc52ff99 Thierry Reding  2014-10-01  603  }
6f043e757445969 Niklas Schnelle 2024-10-24  604  #else
6f043e757445969 Niklas Schnelle 2024-10-24  605  void _outb(u8 value, unsigned long addr)
6f043e757445969 Niklas Schnelle 2024-10-24  606  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
6f043e757445969 Niklas Schnelle 2024-10-24  607  #endif
9216efafc52ff99 Thierry Reding  2014-10-01  608  #endif
9216efafc52ff99 Thierry Reding  2014-10-01  609  

:::::: The code at line 596 was first introduced by commit
:::::: f009c89df79abea5f5244b8135a205f7d4352f86 io: Provide _inX() and _outX()

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Wei Xu <xuwei5@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
