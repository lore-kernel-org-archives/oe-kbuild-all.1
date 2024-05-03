Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A58D1474BF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743699; cv=none; b=IC4Mr5NQhuxs/7KMZIAXQ6Zk6SxqYEBW1ap/hpexPmgoIRX3co2kWDI/63DNvOK0H/R/Kkj5rJkIPQK9i0muhzteyoxGRtKeu6xbHoQsfx1OYoQj9jsY9UOHJLXNtF08b16PL2zhIUHWNczNlxpjdA+e55u9+mXWYHb2/InmfAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743699; c=relaxed/simple;
	bh=xTxc6Mln0A1a4OXdKSfKhiKLgv/9dCpDrh3ycJiiE0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8oSLNxij3F82I3k3vUvdazi05DWTRFzMC9Q9X6mSr/Uj2dsDAVVE/UfifEuZapcrYenSSbT1zzDMTOVI3TLs6bCHkhK/5hLAUIwq8Zw7LmI9hwPuvGpy/MqqS0H0vZuuToOvAvf+Yfv2cUZUToeXNwoU/SWLudzU93LRk3yk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mm6+tD4f; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mm6+tD4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743697; x=1746279697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTxc6Mln0A1a4OXdKSfKhiKLgv/9dCpDrh3ycJiiE0s=;
  b=mm6+tD4fXCWbuuiTQxLRQ3DlYxBuTNFNVd37DpkdAhHmhR0+W5jBeHcX
   bFK2OTbzuJ1kCPGKYbpqfuoOeKTMlEgLnCdbBtIeh5DLL8/aG+3Gqa2wg
   8g/X6IfL//oqSSrYmPS7Uba6Q5Jd7mnhwwBfyDx3Te7KJzW8ryAA8ETAr
   3ZAhuuZ4O0OVsALa68ceZhHR+wotSLEQq6ffingekZN0kJsMXglswgXTj
   kZf0iJmESeRiJ4QQPnpMl2dy1XumLQ1z+3ye/Z3ixdFMQIoKSTlLNWIDp
   Snd1BPLKehwjiL2uS2fQsYTZN4Cd3C5tDNem4/DC89ewPyZhMQbdE1uZH
   A==;
X-CSE-ConnectionGUID: yb0Bzbx8Q965OUJM4JAKCQ==
X-CSE-MsgGUID: sFhT5XloRhWoONiny33LSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10713629"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10713629"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:41:37 -0700
X-CSE-ConnectionGUID: ta696A+UQm2O3NONr69/yw==
X-CSE-MsgGUID: xV8zKXmAQsWja7zR/RKOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27479541"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2024 06:41:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2tAJ-000BjE-35;
	Fri, 03 May 2024 13:41:31 +0000
Date: Fri, 3 May 2024 21:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1033/1143]
 drivers/soc/aspeed/rvas/hardware_engines.c:1126:30: warning: cast to pointer
 from integer of different size
Message-ID: <202405032108.WHlLJdqe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: e3f6657267bf71773a36123d37496fba974f4a50 [1033/1143] RVAS: add ast2700 changes to rvas driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240503/202405032108.WHlLJdqe-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032108.WHlLJdqe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032108.WHlLJdqe-lkp@intel.com/

All warnings (new ones prefixed by >>):

     908 |                                 VIDEO_DBG("In SkippingMode...\n");
         |                                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:951:33: note: in expansion of macro 'VIDEO_DBG'
     951 |                                 VIDEO_DBG("Preparing TFE Descriptor with no skipping...\n");
         |                                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:960:33: note: in expansion of macro 'VIDEO_DBG'
     960 |                                 VIDEO_DBG("Successfully prepared TFE Descriptor with no skipping\n");
         |                                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:962:25: note: in expansion of macro 'VIDEO_DBG'
     962 |                         VIDEO_DBG("Sleeping while TFE is busy...\n");
         |                         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:974:25: note: in expansion of macro 'VIDEO_DBG'
     974 |                         VIDEO_DBG("After sleep where TFE was busy\n");
         |                         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:978:33: note: in expansion of macro 'VIDEO_DBG'
     978 |                                 VIDEO_DBG("RLE is off\n");
         |                                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:985:33: note: in expansion of macro 'VIDEO_DBG'
     985 |                                 VIDEO_DBG("RLE Enabled\n");
         |                                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:988:41: note: in expansion of macro 'VIDEO_DBG'
     988 |                                         VIDEO_DBG("DRVIER:: RLE failed RLE: %u > %u\n",
         |                                         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1010:49: note: in expansion of macro 'VIDEO_DBG'
    1010 |                                                 VIDEO_DBG(" FETCH - 4\n");
         |                                                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1048:25: note: in expansion of macro 'VIDEO_DBG'
    1048 |                         VIDEO_DBG("DRIVER:: RLE: %u, nonRLE: %u\n", dwRLESize,
         |                         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1050:25: note: in expansion of macro 'VIDEO_DBG'
    1050 |                         VIDEO_DBG("FETCH:: loop FETCH size: %u\n", dwTotalFetchSize);
         |                         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1055:17: note: in expansion of macro 'VIDEO_DBG'
    1055 |                 VIDEO_DBG("Fetch Size: %#x\n", dwTotalFetchSize);
         |                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/hardware_engines.c: In function 'prepare_ldma_descriptor':
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1067:9: note: in expansion of macro 'VIDEO_DBG'
    1067 |         VIDEO_DBG("pDAddress: 0x%p\n", pDAddress);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1084:9: note: in expansion of macro 'VIDEO_DBG'
    1084 |         VIDEO_DBG("u32 0: 0x%x\n", pDAddress->dw0General);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1085:9: note: in expansion of macro 'VIDEO_DBG'
    1085 |         VIDEO_DBG("u32 1: 0x%x\n", pDAddress->dw1FetchWidthLine);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1086:9: note: in expansion of macro 'VIDEO_DBG'
    1086 |         VIDEO_DBG("u32 2: 0x%x\n", pDAddress->dw2SourceAddr);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1087:9: note: in expansion of macro 'VIDEO_DBG'
    1087 |         VIDEO_DBG("u32 3: 0x%x\n", pDAddress->dw3DestinationAddr);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/hardware_engines.c: In function 'ioctl_run_length_encode_data':
>> drivers/soc/aspeed/rvas/hardware_engines.c:1126:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1126 |         pDescriptorAddPhys = (struct Descriptor *)ctx_entry->desc_phy;
         |                              ^
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1128:9: note: in expansion of macro 'VIDEO_DBG'
    1128 |         VIDEO_DBG("pDescriptorAdd=%#x, phy=%#x\n", (u32)pDescriptorAdd,
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/hardware_engines.c:1150:49: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1150 |                 if (sleep_on_tfe_busy(pAstRVAS, (phys_addr_t)pDescriptorAddPhys,
         |                                                 ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1107:13: warning: variable 'desc_phy' set but not used [-Wunused-but-set-variable]
    1107 |         u32 desc_phy = 0;
         |             ^~~~~~~~
   drivers/soc/aspeed/rvas/hardware_engines.c:1106:15: warning: variable 'desc_virt' set but not used [-Wunused-but-set-variable]
    1106 |         void *desc_virt = NULL;
         |               ^~~~~~~~~
   drivers/soc/aspeed/rvas/hardware_engines.c: In function 'ioctl_fetch_video_slices':
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1220:9: note: in expansion of macro 'VIDEO_DBG'
    1220 |         VIDEO_DBG("Start\n");
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1244:9: note: in expansion of macro 'VIDEO_DBG'
    1244 |         VIDEO_DBG("bEnableRLE: %d cBuckets: %u cfr: %u\n", pFVSA->bEnableRLE,
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1255:9: note: in expansion of macro 'VIDEO_DBG'
    1255 |         VIDEO_DBG("*pdwBSCR: %#x bBucketSizeEnable: %d\n", readl(addrBSCR),
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1262:9: note: in expansion of macro 'VIDEO_DBG'
    1262 |         VIDEO_DBG("BSE:: u8 per pixel: %d\n", bytesPerPixel);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1263:9: note: in expansion of macro 'VIDEO_DBG'
    1263 |         VIDEO_DBG("BSE:: cfr: %u bucket size: %d\n", pFVSA->cfr, pFVSA->cBuckets);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1268:9: note: in expansion of macro 'VIDEO_DBG'
    1268 |         VIDEO_DBG("pNextDescriptor 0x%p dest_next_addr: %#x\n", pNextDescriptor,
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1272:17: note: in expansion of macro 'VIDEO_DBG'
    1272 |                 VIDEO_DBG("dwCD: %u\n", dwCD);
         |                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1273:17: note: in expansion of macro 'VIDEO_DBG'
    1273 |                 VIDEO_DBG("pfr->wLeftX :%d\n", pFVSA->pfr[dwCD].wLeftX);
         |                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1274:17: note: in expansion of macro 'VIDEO_DBG'
    1274 |                 VIDEO_DBG("pfr->wTopY :%d\n", pFVSA->pfr[dwCD].wTopY);
         |                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1275:17: note: in expansion of macro 'VIDEO_DBG'
    1275 |                 VIDEO_DBG("pfr->wRightX :%d\n", pFVSA->pfr[dwCD].wRightX);
         |                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1276:17: note: in expansion of macro 'VIDEO_DBG'
    1276 |                 VIDEO_DBG("pfr->wBottomY :%d\n", pFVSA->pfr[dwCD].wBottomY);
         |                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1287:17: note: in expansion of macro 'VIDEO_DBG'
    1287 |                 VIDEO_DBG("BSE Width in Pixel: %d\n", dwFetchWidthPixels);
         |                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1288:17: note: in expansion of macro 'VIDEO_DBG'
    1288 |                 VIDEO_DBG("BSE Height: %d bBucketSizeEnable: %d\n", dwFetchHeight,
         |                 ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/hardware_engines.c:1341:17: note: in expansion of macro 'VIDEO_DBG'


vim +1126 drivers/soc/aspeed/rvas/hardware_engines.c

f778d27331abc16 hailin wu 2024-01-20  1061  
e3f6657267bf717 hailin wu 2024-01-27  1062  void prepare_ldma_descriptor(struct Descriptor *pDAddress, phys_addr_t source_addr,
e3f6657267bf717 hailin wu 2024-01-27  1063  			     phys_addr_t dest_addr, u32 dwLDMASize, u8 byNotLastEntry)
f778d27331abc16 hailin wu 2024-01-20  1064  {
f778d27331abc16 hailin wu 2024-01-20  1065  	u8 byInterrupt = 0;
f778d27331abc16 hailin wu 2024-01-20  1066  
f778d27331abc16 hailin wu 2024-01-20  1067  	VIDEO_DBG("pDAddress: 0x%p\n", pDAddress);
f778d27331abc16 hailin wu 2024-01-20  1068  
f778d27331abc16 hailin wu 2024-01-20  1069  	// initialize to 0
f778d27331abc16 hailin wu 2024-01-20  1070  	pDAddress->dw0General = 0x00;
f778d27331abc16 hailin wu 2024-01-20  1071  	pDAddress->dw1FetchWidthLine = 0x00;
f778d27331abc16 hailin wu 2024-01-20  1072  	pDAddress->dw2SourceAddr = 0x00;
f778d27331abc16 hailin wu 2024-01-20  1073  	pDAddress->dw3DestinationAddr = 0x00;
f778d27331abc16 hailin wu 2024-01-20  1074  
f778d27331abc16 hailin wu 2024-01-20  1075  	// initialize to 0
f778d27331abc16 hailin wu 2024-01-20  1076  	if (!byNotLastEntry)
f778d27331abc16 hailin wu 2024-01-20  1077  		byInterrupt = 0x1;
f778d27331abc16 hailin wu 2024-01-20  1078  
f778d27331abc16 hailin wu 2024-01-20  1079  	pDAddress->dw0General = ((dwLDMASize - 1) << 8) | (byNotLastEntry << 1)
f778d27331abc16 hailin wu 2024-01-20  1080  		| byInterrupt;
e3f6657267bf717 hailin wu 2024-01-27  1081  	pDAddress->dw2SourceAddr = (u32)source_addr;
e3f6657267bf717 hailin wu 2024-01-27  1082  	pDAddress->dw3DestinationAddr = (u32)dest_addr;
f778d27331abc16 hailin wu 2024-01-20  1083  
f778d27331abc16 hailin wu 2024-01-20  1084  	VIDEO_DBG("u32 0: 0x%x\n", pDAddress->dw0General);
f778d27331abc16 hailin wu 2024-01-20  1085  	VIDEO_DBG("u32 1: 0x%x\n", pDAddress->dw1FetchWidthLine);
f778d27331abc16 hailin wu 2024-01-20  1086  	VIDEO_DBG("u32 2: 0x%x\n", pDAddress->dw2SourceAddr);
f778d27331abc16 hailin wu 2024-01-20 @1087  	VIDEO_DBG("u32 3: 0x%x\n", pDAddress->dw3DestinationAddr);
f778d27331abc16 hailin wu 2024-01-20  1088  }
f778d27331abc16 hailin wu 2024-01-20  1089  
f778d27331abc16 hailin wu 2024-01-20  1090  //
f778d27331abc16 hailin wu 2024-01-20  1091  // ioctl_run_length_encode_data - encode buffer data
f778d27331abc16 hailin wu 2024-01-20  1092  //
f778d27331abc16 hailin wu 2024-01-20  1093  void ioctl_run_length_encode_data(struct RvasIoctl *ri, struct AstRVAS *pAstRVAS)
f778d27331abc16 hailin wu 2024-01-20  1094  {
f778d27331abc16 hailin wu 2024-01-20  1095  	struct Descriptor *pDescriptorAdd = NULL;
f778d27331abc16 hailin wu 2024-01-20  1096  	struct Descriptor *pDescriptorAddPhys = NULL;
f778d27331abc16 hailin wu 2024-01-20  1097  	u8 bytesPerPixel;
f778d27331abc16 hailin wu 2024-01-20  1098  	bool bNotLastEntry = true;
f778d27331abc16 hailin wu 2024-01-20  1099  	u32 dwTFECR = 0;
f778d27331abc16 hailin wu 2024-01-20  1100  	bool bRLEOverFLow = false;
f778d27331abc16 hailin wu 2024-01-20  1101  	u32 dwFetchWidthPixels = 0;
f778d27331abc16 hailin wu 2024-01-20  1102  	u32 dwFetchHeight = 0;
f778d27331abc16 hailin wu 2024-01-20  1103  	u32 dwPhysAddIn;
f778d27331abc16 hailin wu 2024-01-20  1104  	u32 dwPhysAddOut;
f778d27331abc16 hailin wu 2024-01-20  1105  	u32 data_size = 0;
f778d27331abc16 hailin wu 2024-01-20  1106  	void *desc_virt = NULL;
f778d27331abc16 hailin wu 2024-01-20  1107  	u32 desc_phy = 0;
f778d27331abc16 hailin wu 2024-01-20  1108  	struct ContextTable *ctx_entry = NULL;
f778d27331abc16 hailin wu 2024-01-20  1109  
f778d27331abc16 hailin wu 2024-01-20  1110  	ctx_entry = get_context_entry(ri->rc, pAstRVAS);
f778d27331abc16 hailin wu 2024-01-20  1111  	if (ctx_entry) {
f778d27331abc16 hailin wu 2024-01-20  1112  		desc_virt = ctx_entry->desc_virt;
f778d27331abc16 hailin wu 2024-01-20  1113  		desc_phy = ctx_entry->desc_phy;
f778d27331abc16 hailin wu 2024-01-20  1114  	} else {
f778d27331abc16 hailin wu 2024-01-20  1115  		ri->rs = InvalidContextHandle;
f778d27331abc16 hailin wu 2024-01-20  1116  		return;
f778d27331abc16 hailin wu 2024-01-20  1117  	}
f778d27331abc16 hailin wu 2024-01-20  1118  
f778d27331abc16 hailin wu 2024-01-20  1119  	ri->rs = SuccessStatus;
f778d27331abc16 hailin wu 2024-01-20  1120  
f778d27331abc16 hailin wu 2024-01-20  1121  	dwPhysAddIn = get_phys_add_rsvd_mem((u32)ri->rmh, pAstRVAS);
f778d27331abc16 hailin wu 2024-01-20  1122  	dwPhysAddOut = get_phys_add_rsvd_mem((u32)ri->rmh1, pAstRVAS);
f778d27331abc16 hailin wu 2024-01-20  1123  
f778d27331abc16 hailin wu 2024-01-20  1124  	data_size = ri->rmh_mem_size;
f778d27331abc16 hailin wu 2024-01-20  1125  	pDescriptorAdd = (struct Descriptor *)ctx_entry->desc_virt;
f778d27331abc16 hailin wu 2024-01-20 @1126  	pDescriptorAddPhys = (struct Descriptor *)ctx_entry->desc_phy;
f778d27331abc16 hailin wu 2024-01-20  1127  
f778d27331abc16 hailin wu 2024-01-20  1128  	VIDEO_DBG("pDescriptorAdd=%#x, phy=%#x\n", (u32)pDescriptorAdd,
f778d27331abc16 hailin wu 2024-01-20  1129  		  (u32)pDescriptorAddPhys);
f778d27331abc16 hailin wu 2024-01-20  1130  
f778d27331abc16 hailin wu 2024-01-20  1131  	if (dwPhysAddIn && dwPhysAddOut) {
f778d27331abc16 hailin wu 2024-01-20  1132  		// Enable TFE
f778d27331abc16 hailin wu 2024-01-20  1133  		dwTFECR = (ri->encode & 0xffff0000) << 16;
f778d27331abc16 hailin wu 2024-01-20  1134  		dwTFECR |= 1;
f778d27331abc16 hailin wu 2024-01-20  1135  		dwTFECR &= TFCTL_DESCRIPTOR_IN_DDR_MASK;
f778d27331abc16 hailin wu 2024-01-20  1136  
f778d27331abc16 hailin wu 2024-01-20  1137  		// triplet code and repeat code
f778d27331abc16 hailin wu 2024-01-20  1138  		bNotLastEntry = false;
f778d27331abc16 hailin wu 2024-01-20  1139  		bRLEOverFLow = true;
f778d27331abc16 hailin wu 2024-01-20  1140  		dwFetchWidthPixels = TILE_SIZE;
f778d27331abc16 hailin wu 2024-01-20  1141  		dwFetchHeight = data_size / TILE_SIZE;
f778d27331abc16 hailin wu 2024-01-20  1142  		bytesPerPixel = 1;
f778d27331abc16 hailin wu 2024-01-20  1143  
f778d27331abc16 hailin wu 2024-01-20  1144  		prepare_tfe_descriptor(pDescriptorAdd, dwPhysAddIn,
f778d27331abc16 hailin wu 2024-01-20  1145  				       dwPhysAddOut, bNotLastEntry, 1,
f778d27331abc16 hailin wu 2024-01-20  1146  				       1, dwFetchWidthPixels,
f778d27331abc16 hailin wu 2024-01-20  1147  				       bytesPerPixel, dwFetchWidthPixels,
f778d27331abc16 hailin wu 2024-01-20  1148  				       dwFetchHeight, AllBytesMode, bRLEOverFLow, 1);
f778d27331abc16 hailin wu 2024-01-20  1149  
e3f6657267bf717 hailin wu 2024-01-27  1150  		if (sleep_on_tfe_busy(pAstRVAS, (phys_addr_t)pDescriptorAddPhys,
f778d27331abc16 hailin wu 2024-01-20  1151  				      dwTFECR, data_size, &ri->rle_len,
f778d27331abc16 hailin wu 2024-01-20  1152  				      &ri->rle_checksum) == false) {
f778d27331abc16 hailin wu 2024-01-20  1153  			ri->rs = GenericError;
f778d27331abc16 hailin wu 2024-01-20  1154  			dev_err(pAstRVAS->pdev, "%s sleep_on_tfe_busy ERROR\n", __func__);
f778d27331abc16 hailin wu 2024-01-20  1155  			return;
f778d27331abc16 hailin wu 2024-01-20  1156  		}
f778d27331abc16 hailin wu 2024-01-20  1157  	} else {
f778d27331abc16 hailin wu 2024-01-20  1158  		ri->rs = InvalidMemoryHandle;
f778d27331abc16 hailin wu 2024-01-20  1159  	}
f778d27331abc16 hailin wu 2024-01-20  1160  }
f778d27331abc16 hailin wu 2024-01-20  1161  

:::::: The code at line 1126 was first introduced by commit
:::::: f778d27331abc1655c4425fcdee0086a7b81464e RVAS: add rvas driver

:::::: TO: hailin wu <hailin.wu@aspeedtech.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
