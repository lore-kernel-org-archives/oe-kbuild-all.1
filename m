Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB24C7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695939398; x=1727475398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZ/FzrnvQLl/hr+1baZfThJDRnUWDGWwVW3raPW5Fak=;
  b=atNqwnmyEbYd7FBSaq3vxFcw+IBK/ogy9GWyN1xt30gxxFWof42J10Ow
   UIO8guCAWKqIQ8QF9MiKESAxpFLC/nVzT+8UKVbjDSkWbXf44YuhRX84C
   HTlroBvuElkzyAW2ZsuO2AQUUh5Db8i1Tz3ex3zNiiXLuR5zqrIdXfy0T
   ILyp8xJMI68V6QWylvvZqv9gboSPplw5EdlXF7/psZUEbchcxinrQ6b1T
   eYAcAQ/F+UkZYYXsGfzNfdOzu1K7HFWPldNsf/EyljGFolLpokWe8V2HS
   eqqNHCc1ZZrdcWeNf+sj5UT1LdNKkSU9uZQb11Qmajjc6WcGm94PDyzGV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446350167"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="446350167"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 15:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="784890289"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="784890289"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Sep 2023 15:16:36 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlzJB-00022f-2g;
	Thu, 28 Sep 2023 22:16:33 +0000
Date: Fri, 29 Sep 2023 06:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:pr/146 11750/14527] include/vdso/bits.h:7:40: warning:
 left shift count >= width of type
Message-ID: <202309290620.wx6QfFzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: 1bf02f0625dc1372031ca84b0c2768c0d8f80314 [11750/14527] ptp: Add Xilinx PTP timer driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309290620.wx6QfFzp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290620.wx6QfFzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290620.wx6QfFzp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/ptp/ptp_xilinx.c:8:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1270:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1270 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1256:27: note: 'mem_section' declared here
    1256 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15:
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_tod_read':
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:41: note: in expansion of macro 'GENMASK'
      53 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:107:51: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     107 |         ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6:
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_adjtime':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/ptp/ptp_xilinx.c:55:41: note: in expansion of macro 'BIT'
      55 | #define XPTPTIMER_TOD_OFFSET_NEG        BIT(47)
         |                                         ^~~
   drivers/ptp/ptp_xilinx.c:216:24: note: in expansion of macro 'XPTPTIMER_TOD_OFFSET_NEG'
     216 |                 sign = XPTPTIMER_TOD_OFFSET_NEG;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_timer_probe':
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:41: note: in expansion of macro 'GENMASK'
      53 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:347:50: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     347 |         ts.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:53:41: note: in expansion of macro 'GENMASK'
      53 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:353:51: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     353 |         tsp.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_ATMEL_SOC [=y] && HAS_DMA [=n]
   Selected by [y]:
   - SND_ATMEL_SOC_SSC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_ATMEL_SOC [=y]
   - SND_ATMEL_SOC_SSC_PDC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_ATMEL_SOC [=y] && ATMEL_SSC [=y]


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  8  

:::::: The code at line 7 was first introduced by commit
:::::: 3945ff37d2f48d39fd1751d282c80176654049e4 linux/bits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
