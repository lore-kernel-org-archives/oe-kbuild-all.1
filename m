Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD910E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 05:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687326252; x=1718862252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U+Hs7VtPqjXBCVMun5WSNlqD7ECDAgylE9+jVB73LoY=;
  b=YIFNExe6tV1qCRWz5Pjg12LQmtb3PI4XggpnKiWzvXNtKtMk5uLtvJun
   EglbvcXc29o89RD8Qsy5gCmGssrFTbn9rgemkw5CNTHzn3V+OJhftDyUu
   BzPpTVJUzKpaFjhg9QtgOPqbgz5iX4Yes/cLRBxrPB3D5BPdbGm7Hd1cU
   R1x5WBrvsn9gz34O7Q9KJOjg44efAPR3bvvVbElGCWhOrjDDFM0w4Tyj9
   jCF/dzqBkhKdU85txBTncn1MEfAdo5TscqtWAn/BGh5PkEIj5XfP8UOfd
   RWwSwpKWKymAG1G96cNz8zMjM28LeJh1J6sS9WkkJ6iw/5hAwoyiN4rWC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="360087387"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="360087387"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 22:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858847224"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="858847224"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 22:43:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBqdJ-0006ax-1Y;
	Wed, 21 Jun 2023 05:43:57 +0000
Date: Wed, 21 Jun 2023 13:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, arnd@arndb.de, hch@lst.de,
	christophe.leroy@csgroup.eu, rppt@kernel.org, willy@infradead.org,
	agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
	schnelle@linux.ibm.com, David.Laight@aculab.com, shorne@gmail.com,
	deller@gmx.de, nathan@kernel.org, glaubitz@physik.fu-berlin.de,
	Baoquan He <bhe@redhat.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 10/19] s390: mm: Convert to GENERIC_IOREMAP
Message-ID: <202306211329.ticOJCSv-lkp@intel.com>
References: <20230620131356.25440-11-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620131356.25440-11-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/asm-generic-iomap-h-remove-ARCH_HAS_IOREMAP_xx-macros/20230620-212135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230620131356.25440-11-bhe%40redhat.com
patch subject: [PATCH v7 10/19] s390: mm: Convert to GENERIC_IOREMAP
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230621/202306211329.ticOJCSv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211329.ticOJCSv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211329.ticOJCSv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/ipwireless/main.c: In function 'ipwireless_probe':
   drivers/tty/ipwireless/main.c:115:30: error: implicit declaration of function 'ioremap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
     115 |         ipw->common_memory = ioremap(p_dev->resource[2]->start,
         |                              ^~~~~~~
         |                              iounmap
>> drivers/tty/ipwireless/main.c:115:28: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     115 |         ipw->common_memory = ioremap(p_dev->resource[2]->start,
         |                            ^
   drivers/tty/ipwireless/main.c:139:26: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     139 |         ipw->attr_memory = ioremap(p_dev->resource[3]->start,
         |                          ^
   In file included from include/linux/io.h:13,
                    from drivers/tty/ipwireless/main.c:26:
   arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
      29 | #define iounmap iounmap
         |                 ^~~~~~~
   drivers/tty/ipwireless/main.c:155:9: note: in expansion of macro 'iounmap'
     155 |         iounmap(ipw->attr_memory);
         |         ^~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/smsc/smc91c92_cs.c: In function 'mhz_mfc_config':
>> drivers/net/ethernet/smsc/smc91c92_cs.c:447:17: error: implicit declaration of function 'ioremap'; did you mean 'ifr_map'? [-Werror=implicit-function-declaration]
     447 |     smc->base = ioremap(link->resource[2]->start,
         |                 ^~~~~~~
         |                 ifr_map
>> drivers/net/ethernet/smsc/smc91c92_cs.c:447:15: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     447 |     smc->base = ioremap(link->resource[2]->start,
         |               ^
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/skbuff.h:28,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/smsc/smc91c92_cs.c:38:
   drivers/net/ethernet/smsc/smc91c92_cs.c: In function 'smc91c92_release':
   arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
      29 | #define iounmap iounmap
         |                 ^~~~~~~
   drivers/net/ethernet/smsc/smc91c92_cs.c:962:17: note: in expansion of macro 'iounmap'
     962 |                 iounmap(smc->base);
         |                 ^~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/xircom/xirc2ps_cs.c: In function 'xirc2ps_config':
   drivers/net/ethernet/xircom/xirc2ps_cs.c:843:28: error: implicit declaration of function 'ioremap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
     843 |         local->dingo_ccr = ioremap(link->resource[2]->start, 0x1000) + 0x0800;
         |                            ^~~~~~~
         |                            iounmap
>> drivers/net/ethernet/xircom/xirc2ps_cs.c:843:26: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     843 |         local->dingo_ccr = ioremap(link->resource[2]->start, 0x1000) + 0x0800;
         |                          ^
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/skbuff.h:28,
                    from include/linux/if_ether.h:19,
                    from include/linux/ethtool.h:18,
                    from drivers/net/ethernet/xircom/xirc2ps_cs.c:77:
   drivers/net/ethernet/xircom/xirc2ps_cs.c: In function 'xirc2ps_release':
   arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
      29 | #define iounmap iounmap
         |                 ^~~~~~~
   drivers/net/ethernet/xircom/xirc2ps_cs.c:934:25: note: in expansion of macro 'iounmap'
     934 |                         iounmap(local->dingo_ccr - 0x0800);
         |                         ^~~~~~~
   cc1: some warnings being treated as errors


vim +447 drivers/net/ethernet/smsc/smc91c92_cs.c

b54bf94bf91e4c drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2008-08-02  422  
fba395eee7d3f3 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2006-03-31  423  static int mhz_mfc_config(struct pcmcia_device *link)
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  424  {
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  425      struct net_device *dev = link->priv;
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  426      struct smc_private *smc = netdev_priv(dev);
b5cb259e7fac55 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-24  427      unsigned int offset;
b54bf94bf91e4c drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2008-08-02  428      int i;
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  429  
00990e7ce0b0e5 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-30  430      link->config_flags |= CONF_ENABLE_SPKR | CONF_ENABLE_IRQ |
00990e7ce0b0e5 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-30  431  	    CONF_AUTO_SET_IO;
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  432  
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  433      /* The Megahertz combo cards have modem-like CIS entries, so
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  434         we have to explicitly try a bunch of port combinations. */
b54bf94bf91e4c drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2008-08-02  435      if (pcmcia_loop_config(link, mhz_mfc_config_check, NULL))
dddfbd824b96a2 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2009-10-18  436  	    return -ENODEV;
dddfbd824b96a2 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2009-10-18  437  
9a017a910346af drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-24  438      dev->base_addr = link->resource[0]->start;
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  439  
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  440      /* Allocate a memory window, for accessing the ISR */
cdb138080b7814 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-28  441      link->resource[2]->flags = WIN_DATA_WIDTH_8|WIN_MEMORY_TYPE_AM|WIN_ENABLE;
cdb138080b7814 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-28  442      link->resource[2]->start = link->resource[2]->end = 0;
cdb138080b7814 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-28  443      i = pcmcia_request_window(link, link->resource[2], 0);
4c89e88bfde6a3 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2008-08-03  444      if (i != 0)
dddfbd824b96a2 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2009-10-18  445  	    return -ENODEV;
dddfbd824b96a2 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2009-10-18  446  
cdb138080b7814 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-28 @447      smc->base = ioremap(link->resource[2]->start,
cdb138080b7814 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-28  448  		    resource_size(link->resource[2]));
7feabb6412ea23 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-29  449      offset = (smc->manfid == MANFID_MOTOROLA) ? link->config_base : 0;
cdb138080b7814 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2010-07-28  450      i = pcmcia_map_mem_page(link, link->resource[2], offset);
8e95a2026f3b43 drivers/net/pcmcia/smc91c92_cs.c Joe Perches       2009-12-03  451      if ((i == 0) &&
8e95a2026f3b43 drivers/net/pcmcia/smc91c92_cs.c Joe Perches       2009-12-03  452  	(smc->manfid == MANFID_MEGAHERTZ) &&
8e95a2026f3b43 drivers/net/pcmcia/smc91c92_cs.c Joe Perches       2009-12-03  453  	(smc->cardid == PRODID_MEGAHERTZ_EM3288))
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  454  	    mhz_3288_power(link);
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  455  
dddfbd824b96a2 drivers/net/pcmcia/smc91c92_cs.c Dominik Brodowski 2009-10-18  456      return 0;
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  457  }
^1da177e4c3f41 drivers/net/pcmcia/smc91c92_cs.c Linus Torvalds    2005-04-16  458  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
