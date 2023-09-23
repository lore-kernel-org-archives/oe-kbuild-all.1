Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391AD1CF97
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695477232; x=1727013232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MsPVtNAziiT7R8e1pX589Kuc+m0tSM9I+y41k5t56kA=;
  b=RyHjcZB7WEFv5AtO4pMYNMMNsIiaSH5RhMZHpnWJEav802A0Q96xzvc1
   Tk6FqShImb1jLPjPbM35QB/XXrqNMS+S9kfKjl4eHKfAtgUHped8iE0jY
   XM3g1pJpWcFibnGNrruU0Ow6D8CM28TCGuaRsKZvbVYMGUUI/Laz2wpkX
   zjb0DP9cfpUT2fkv1Q1MprnlYG33Y6Mg34ZLArUoKjtfw4KoeNnCveDy1
   Otsn7VMlv0lmcD6j8gPPXn6bdv1Rx/+0FRNRzubTSVPljgyi00vpWvLQk
   mqDEuiYCYQVVlrBEra39C1pGOMwWz8oChK99YXkV2zo9/uoSKj47/M4dB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="380929093"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="380929093"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 06:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="741425792"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="741425792"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Sep 2023 06:53:49 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk34t-0002Rd-0H;
	Sat, 23 Sep 2023 13:53:47 +0000
Date: Sat, 23 Sep 2023 21:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>
Subject: drivers/message/fusion/mptspi.c:602:39: warning:
 'spi_dev_pg0.NegotiatedParameters' is used uninitialized
Message-ID: <202309232112.DZwHqSRn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d90b0276af8f25a0b8ae081a30d1b2a61263393b
commit: cd57d07b1e4e08f95a27b59253b5c8a46abf4f29 sh: don't allow non-coherent DMA for NOMMU
date:   3 years, 1 month ago
config: sh-randconfig-s031-20211128 (https://download.01.org/0day-ci/archive/20230923/202309232112.DZwHqSRn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309232112.DZwHqSRn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309232112.DZwHqSRn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/sh/include/mach-r2d: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-lboxre2: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-r2d: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-lboxre2: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from drivers/message/fusion/mptspi.c:47:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1213:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1213 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1199:27: note: 'mem_section' declared here
    1199 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/message/fusion/mptspi.c: In function 'mptspi_qcmd':
   drivers/message/fusion/mptspi.c:797:58: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     797 |                 ddvprintk(ioc, scsi_print_command(SCpnt));
         |                                                          ^
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/sh/include/uapi/asm/byteorder.h:6,
                    from arch/sh/include/asm/bitops.h:10,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12:
   drivers/message/fusion/mptspi.c: In function 'mptspi_read_parameters':
>> drivers/message/fusion/mptspi.c:602:39: warning: 'spi_dev_pg0.NegotiatedParameters' is used uninitialized [-Wuninitialized]
     602 |         nego = le32_to_cpu(spi_dev_pg0.NegotiatedParameters);
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   drivers/message/fusion/mptspi.c:602:16: note: in expansion of macro 'le32_to_cpu'
     602 |         nego = le32_to_cpu(spi_dev_pg0.NegotiatedParameters);
         |                ^~~~~~~~~~~
   drivers/message/fusion/mptspi.c:598:43: note: 'spi_dev_pg0' declared here
     598 |         struct _CONFIG_PAGE_SCSI_DEVICE_0 spi_dev_pg0;
         |                                           ^~~~~~~~~~~


vim +602 drivers/message/fusion/mptspi.c

c92f222e1f1458 James Bottomley 2006-03-01  594  
c92f222e1f1458 James Bottomley 2006-03-01  595  static void mptspi_read_parameters(struct scsi_target *starget)
c92f222e1f1458 James Bottomley 2006-03-01  596  {
c92f222e1f1458 James Bottomley 2006-03-01  597  	int nego;
bc6e089a13a5c0 Eric Moore      2007-09-29  598  	struct _CONFIG_PAGE_SCSI_DEVICE_0 spi_dev_pg0;
c92f222e1f1458 James Bottomley 2006-03-01  599  
bc6e089a13a5c0 Eric Moore      2007-09-29  600  	mptspi_read_spi_device_pg0(starget, &spi_dev_pg0);
c92f222e1f1458 James Bottomley 2006-03-01  601  
bc6e089a13a5c0 Eric Moore      2007-09-29 @602  	nego = le32_to_cpu(spi_dev_pg0.NegotiatedParameters);
c92f222e1f1458 James Bottomley 2006-03-01  603  
c92f222e1f1458 James Bottomley 2006-03-01  604  	spi_iu(starget) = (nego & MPI_SCSIDEVPAGE0_NP_IU) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  605  	spi_dt(starget) = (nego & MPI_SCSIDEVPAGE0_NP_DT) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  606  	spi_qas(starget) = (nego & MPI_SCSIDEVPAGE0_NP_QAS) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  607  	spi_wr_flow(starget) = (nego & MPI_SCSIDEVPAGE0_NP_WR_FLOW) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  608  	spi_rd_strm(starget) = (nego & MPI_SCSIDEVPAGE0_NP_RD_STRM) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  609  	spi_rti(starget) = (nego & MPI_SCSIDEVPAGE0_NP_RTI) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  610  	spi_pcomp_en(starget) = (nego & MPI_SCSIDEVPAGE0_NP_PCOMP_EN) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  611  	spi_hold_mcs(starget) = (nego & MPI_SCSIDEVPAGE0_NP_HOLD_MCS) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  612  	spi_period(starget) = (nego & MPI_SCSIDEVPAGE0_NP_NEG_SYNC_PERIOD_MASK) >> MPI_SCSIDEVPAGE0_NP_SHIFT_SYNC_PERIOD;
c92f222e1f1458 James Bottomley 2006-03-01  613  	spi_offset(starget) = (nego & MPI_SCSIDEVPAGE0_NP_NEG_SYNC_OFFSET_MASK) >> MPI_SCSIDEVPAGE0_NP_SHIFT_SYNC_OFFSET;
c92f222e1f1458 James Bottomley 2006-03-01  614  	spi_width(starget) = (nego & MPI_SCSIDEVPAGE0_NP_WIDE) ? 1 : 0;
c92f222e1f1458 James Bottomley 2006-03-01  615  }
c92f222e1f1458 James Bottomley 2006-03-01  616  

:::::: The code at line 602 was first introduced by commit
:::::: bc6e089a13a5c0ac36247616baecd6fc77405e7f [SCSI] mpt fusion: Fix sparse warnings

:::::: TO: Eric Moore <eric.moore@lsi.com>
:::::: CC: James Bottomley <jejb@mulgrave.localdomain>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
