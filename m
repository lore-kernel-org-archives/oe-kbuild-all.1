Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619041FB5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 00:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714955970; cv=none; b=F7UFL1B5Yyk+/aLKXQfp1PsDfuACDgVoN/r1x0on/YkAsvkXd93kwCFRM8tJCztJWBku+gVmn1kAuM0p6ySK2lUioLx2yA+fhNGkPwMGA45XW+hzhly6MPbpLJgJhGfqF2oQrz3XVjjKgx/4E0Z4rolrajatZ2VnJ4HA8cZRajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714955970; c=relaxed/simple;
	bh=xrKXEvHIZziC/eKW2Y0RiR52mwEdx4UPgzF1o1G5mPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORbGNPT6IJ0ytKjTsDVto5OE6qpACBHPGuMBiYaJLhJWsxVASxdMH9czcywW8Oq9dPg3u8hXRzqCGozaM1e24FybQwNyHkzKp0D6k1HO2+NC/yl3Ct84V4KFd4lxaU8H0TNwDPccfN5vAi5oaELXnQFPwHCLjZMqK/kdzdYzZ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiHtMGRF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiHtMGRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714955968; x=1746491968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xrKXEvHIZziC/eKW2Y0RiR52mwEdx4UPgzF1o1G5mPM=;
  b=RiHtMGRFAApxJ1t2zHKphHBdVtu0dSeIKElzjY5TO4bYy6WpsVqLHmAJ
   sXVFK3kIBzcJLhPs5swlpPjpY5YUeI1Hc5wz8+UdSAo4V9KvmfKF8yI/w
   yq1uh8sQBDSebD/UguIYJsHr3ldVSgyjzjHRkOGiN2Sn3ETZ9m8A79r7P
   2RJ6MJOcmGTnpteY1t9hPR2NRiXSqVqQexeyhCCUcrtGT2AWw/MGi3Haa
   7T9MFcZByL+PUXHOqQuZJcXNmRFBN/i8joQQ/cUQBU+JjNTwc5vxnOXn2
   URqBaYIA843/EUHtfQ3qmvUm+V0zzxki7NJflmt8VeYa0GMVBs+KrucPQ
   g==;
X-CSE-ConnectionGUID: Vk9nC82sQS+SR2HQLtXepQ==
X-CSE-MsgGUID: ZhroDYg1RxWGT2msdwa9gg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10810327"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10810327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 17:39:27 -0700
X-CSE-ConnectionGUID: jrTb8wUWQDS2GO1TK3tYAg==
X-CSE-MsgGUID: DJQVModjR2a+Jn1JEGEBRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28018216"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 May 2024 17:39:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3mO4-0000JM-0D;
	Mon, 06 May 2024 00:39:24 +0000
Date: Mon, 6 May 2024 08:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1043/1143]
 drivers/soc/aspeed/rvas/video_engine.c:473:13: warning: 'dump_buffer'
 defined but not used
Message-ID: <202405060819.E59Jl3Km-lkp@intel.com>
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
commit: 867a6cd8ea2c0514739e75bc2701687f294c2578 [1043/1143] RVAS engine: video engine
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405060819.E59Jl3Km-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060819.E59Jl3Km-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060819.E59Jl3Km-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                 ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:432:17: note: in expansion of macro 'VIDEO_ENG_DBG'
     432 |                 VIDEO_ENG_DBG("Sync None Direct Mode\n");
         |                 ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:396:39: warning: variable 'VGA_Scratch_Register_354' set but not used [-Wunused-but-set-variable]
     396 |         u32 VGA_Scratch_Register_350, VGA_Scratch_Register_354, VGA_Scratch_Register_34C, Color_Depth;
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_capture_trigger':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:442:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     442 |         VIDEO_ENG_DBG("\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'get_vga_mem_base':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:469:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     469 |         VIDEO_ENG_DBG("VGA Info : MEM Size %dMB, VGA Mem Size %dMB\n", mem_size / 1024 / 1024, vga_mem_size / 1024 / 1024);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'dump_buffer':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:480:17: note: in expansion of macro 'VIDEO_ENG_DBG'
     480 |                 VIDEO_ENG_DBG("%#x, ", val);
         |                 ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c:476:13: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     476 |         u32 val = 0;
         |             ^~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_set_scaling':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:491:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     491 |         VIDEO_ENG_DBG("Scaling Disable\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_ctrl_init':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:505:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     505 |         VIDEO_ENG_DBG("\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:506:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     506 |         VIDEO_ENG_DBG("reg address: %p\n", pAstRVAS->video_reg_base);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:518:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     518 |         VIDEO_ENG_DBG("JpegTable in Memory:%#x\n", vem.jpegTable.pVirt);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'reserve_video_engine_memory':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:553:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     553 |         VIDEO_ENG_DBG("Allocating memory size: 0x%x\n", size);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:570:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     570 |         VIDEO_ENG_DBG("Allocated: phys: 0x%llx\n", phys_add);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:571:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     571 |         VIDEO_ENG_DBG("Phy: Buf0:0x%llx; Buf1:0x%llx; jpegT:0x%llx\n", vem.captureBuf0.phy, vem.captureBuf1.phy, vem.jpegTable.phy);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:572:9: note: in expansion of macro 'VIDEO_ENG_DBG'
     572 |         VIDEO_ENG_DBG("Virt: Buf0:%p; Buf1:%p; JpegT:%p\n", vem.captureBuf0.pVirt, vem.captureBuf1.pVirt, vem.jpegTable.pVirt);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_write':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:1163:9: note: in expansion of macro 'VIDEO_ENG_DBG'
    1163 |         VIDEO_ENG_DBG("write offset: %x, val: %x\n", reg, val);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: In function 'video_read':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_engine.c:1176:9: note: in expansion of macro 'VIDEO_ENG_DBG'
    1176 |         VIDEO_ENG_DBG("read offset: %x, val: %x\n", reg, val);
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_engine.c: At top level:
>> drivers/soc/aspeed/rvas/video_engine.c:473:13: warning: 'dump_buffer' defined but not used [-Wunused-function]
     473 | static void dump_buffer(phys_addr_t dwPhyStreamAddress, u32 size)
         |             ^~~~~~~~~~~


vim +/dump_buffer +473 drivers/soc/aspeed/rvas/video_engine.c

   472	
 > 473	static void dump_buffer(phys_addr_t dwPhyStreamAddress, u32 size)
   474	{
   475		u32 iC;
   476		u32 val = 0;
   477	
   478		for (iC = 0; iC < size; iC += 4) {
   479			val = readl((void *)(dwPhyStreamAddress + iC));
   480			VIDEO_ENG_DBG("%#x, ", val);
   481		}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
